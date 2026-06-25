USE torontobuildingpermits;
SELECT DISTINCT
    st.structure_type_id,
    st.structure_type_name
FROM structure_type AS st
ORDER BY st.structure_type_name;

SELECT
    st.structure_type_name AS StructureType,
    COUNT(p.permit_id) AS NumberOfPermits,
    AVG(p.est_const_cost) AS AvgConstructionCost,
    MIN(p.est_const_cost) AS MinCost,
    MAX(p.est_const_cost) AS MaxCost,
    SUM(p.est_const_cost) AS TotalConstructionCost
FROM permit AS p
JOIN structure_type AS st
    ON p.structure_type_id = st.structure_type_id
WHERE p.est_const_cost IS NOT NULL
GROUP BY st.structure_type_name
ORDER BY AvgConstructionCost DESC;

SELECT DISTINCT
    ps.status_id,
    ps.status_name
FROM Permit_Status AS ps
ORDER BY ps.status_name;

SELECT
    w.ward_grid,
    w.ward_name,
    COUNT(p.permit_id) AS TotalPermits,
    SUM(
        CASE WHEN ps.status_name IN ('Permit Issued', 'Revision Issued') 
        THEN 1 ELSE 0 END
    ) AS ApprovedPermits,
    ROUND(
        100.0 * SUM(
            CASE WHEN ps.status_name IN ('Permit Issued', 'Revision Issued') 
            THEN 1 END
        ) / COUNT(p.permit_id),
        2
    ) AS ApprovalRatePercent
FROM permit AS p
JOIN ward AS w
    ON p.ward_id = w.ward_id
JOIN permit_status AS ps
    ON p.status_id = ps.status_id
GROUP BY w.ward_grid, w.ward_name
ORDER BY ApprovalRatePercent DESC;

SELECT DISTINCT
    wt.work_type_id,
    wt.work_type_name
FROM work_type AS wt
ORDER BY wt.work_type_name;

SELECT
    wt.work_type_name AS WorkType,
    COUNT(p.permit_id) AS NumberOfPermits,
    SUM(p.dwelling_units_created) AS TotalUnitsCreated,
    AVG(p.dwelling_units_created) AS AvgUnitsCreated,
    SUM(
        COALESCE(p.dwelling_units_created, 0)
        - COALESCE(p.dwelling_units_lost, 0)
    ) AS NetUnitsChange
FROM permit AS p
JOIN work_type AS wt
    ON p.work_type_id = wt.work_type_id
GROUP BY wt.work_type_name
ORDER BY TotalUnitsCreated DESC;

#Full_dataset (to export to python)

SELECT
    p.est_const_cost,
    CAST(p.dwelling_units_created AS FLOAT) AS dwelling_units_created,
    CASE 
        WHEN ps.status_id IN (32,44) THEN 1 
        ELSE 0 
    END AS is_approved,
    CAST(st.structure_type_id AS FLOAT) AS structure_type_id,
    CAST(wt.work_type_id AS FLOAT) AS work_type_id,
    CAST(w.ward_code AS FLOAT) AS ward_code,
    p.application_date
FROM permit p
LEFT JOIN structure_type st 
    ON p.structure_type_id = st.structure_type_id
LEFT JOIN work_type wt 
    ON p.work_type_id = wt.work_type_id
LEFT JOIN permit_type pt 
    ON p.permit_type_id = pt.permit_type_id
LEFT JOIN ward w 
    ON p.ward_id = w.ward_id 
LEFT JOIN permit_status ps 
    ON p.status_id = ps.status_id;