Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E4152EA4F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 12:51:38 +0200 (CEST)
Received: from localhost ([::1]:52518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns0EK-0003eM-40
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 06:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns097-00018J-7k
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ns091-00020e-VB
 for qemu-devel@nongnu.org; Fri, 20 May 2022 06:46:11 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K9bnwA002877;
 Fri, 20 May 2022 10:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=J8SoRx4VSujiXnmA6/ljK6Ur19yHlN4Sc8s10GMH3BI=;
 b=Zj3/28FReyFasOdqY8cf9KI6ScgsunQU7cr5kGNfohSDibvNehhuYL+TH+QjpOpRhvh8
 0zB1qxIx9slHy1zu8hgLOCYlB5aT2/veNtamlQQ8aaAb4RJI7WnLrTztLX561kl0Q0w+
 V9oyEptJbW2QkL7+P/NvszC7QcPqh3ySlUHVwxNivocldDRAfb5wBuh5zaRWE1qwWX4+
 KGPdVgl2Ib3jOE+Zc2GAME/d8MR8/ZZTPTYsKn70stGb9y8TC8wligdyc9yuc6mkqAGb
 QrLlJs+TESFH5nzLvMnT8r6UERwVLbFB2eKLVaaF814PYb2kHp2K01v1aLH/bVRE/AmL hA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g241sepd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:45:58 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24KAa6mi001911; Fri, 20 May 2022 10:45:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g22vbqbwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 10:45:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1ANfd9wmemQ0KL+bs56IF+uFZBfqmi1glklAai5RCtDFLicN/js/e48aGZ8wytTTfvUfR3/OPJZ73eOAtS3O/FHpeqk5WSx4wxC4MGisA7A+CGbRh+xclJh/F0LWyv1asNkbOjs3dTfZTu4u5xeH3IKlwnuw3m28XegyxIFOd9EAEQ0eCjC4iAt7f+MR0KWbLqvu047ivbfSYD8aXpVzT/9e7qmmXPVoT7ATMlInZzd6/GN5ubU9W7JYTTpM7Db7cuGHKnQOOCQ1iuefEc+uSHzEhsNXtRmkXvdVGN37C/SKcinb068MnY4+UcSYUExjorCoaIekYxfDt+TM4PbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8SoRx4VSujiXnmA6/ljK6Ur19yHlN4Sc8s10GMH3BI=;
 b=ndyLhvEZNelzw9DoLlHmdzMYTMvpbL4QJMhZVcJNhzk86AR2RleCpvZSkf6sbIn9kTCPiM3rDcqD+Kr6bdpcPO4ZfvXhxkGwZzhYrHWUWg77TBoFxdAKtPvaLQxZ/uNdVn/ccz23R2A74uIqDy3hohkJBfxdWsvL4ZBKWnG0F77nneXqMko31A1Lpyje/TaeqdLIX+s64f5kGNjWKt1rHCJCSoOCGSVMIl1vddwfQyBaSufA9MfA/XRVSKACPm2Zre3dGp77RkLibWB4H5bvx5o8bLgWA3mASkpL38i1ruEqajyDNxSoPgzrTRViIkLoaJTQgCE4pkV4dHtMexKXFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8SoRx4VSujiXnmA6/ljK6Ur19yHlN4Sc8s10GMH3BI=;
 b=TjaBKmrbEnvrFM/53FgYWCs3gi2eJtCUppRL8Vl1AMXuZS6FLYzKHlc09Z6OO+zxeFZFb1cHfnD9XR3leWj9lESjf9fnA1WcK/ThwFUgaFJxZJ4OnhcLPc6NOfzd/8vOQhx6OVi7PjmMKS8VODZIH36MNIssg0AGJ2B+Dk/gJCY=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MW4PR10MB5838.namprd10.prod.outlook.com (2603:10b6:303:18e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Fri, 20 May
 2022 10:45:56 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b9e5:d1b6:b4be:f9d%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 10:45:55 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 1/5] hw/i386: add 4g boundary start to X86MachineState
Date: Fri, 20 May 2022 11:45:28 +0100
Message-Id: <20220520104532.9816-2-joao.m.martins@oracle.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220520104532.9816-1-joao.m.martins@oracle.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d512105f-8178-49c3-1ea9-08da3a4deb19
X-MS-TrafficTypeDiagnostic: MW4PR10MB5838:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5838D6D1624FDC2900EC31B1BBD39@MW4PR10MB5838.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: agI549HSqapPtPGCgF/rwX+S+N6c4aXmBE5GcM9+1lyKP5bhNQ/iuUg1DRJzzLMB0DBtv40qYiEmgpfNVZoDS5Ae/IB6FNeck9dzIhG9TxFzUIDKqCv4tZAS0OBDwS3fCBlkYvq3dDWN3nVvlUqyzS/oi1i6TJmiei6bozkBCgswGyd2o0m9rJCDrhO+ZC55if7x+dtbm+x2614le+fZFwjynjGxLPEoXz9rWTIYqUmj72TBOGCeniFXuyQ/YZNxgBHEFMs5Hf8V5LSr2A/pN0SL/rHl5zNWPGRtdM3GVBblQmxO0FxhdRLmyTR8FTjLO6NtCLKEbZ+a0jQfuc20OsIKuaj69CyhvtLwflE7HbopTQyHNQBKgKjrPEmUPbez9n9UQM0PdBK8yUIi6jZiBMne+S4warzh1l5i5qxHLff1O+gGOyZcMZ3Y/DYpWo+DTcpVJ/fXu6AdxTJIu8VxhYXDsLXrnAKgtUSq47vXu2CVGtk/xZf1GsZVIHO1Hx7Dp8MFpba7b4fSV2RbVhMM8cKiH8BsNvyDLJJC6XdTWmgt6IGxksABvM4RheQomZV5IEEL6J1QpyOvJbF3KXHwfsTVWKoCFogzG3uWJZXlhmAEt+k3j6uVbPx0wj6IozRLu1lEL/zFUEX+Ga16vEaz+MhhrMAtJdPx9cCyBFUTIkaVop1cBQ7+tXk9BCydrIwperi/scDd5tfWsYS3FYMFCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(83380400001)(26005)(38350700002)(6506007)(508600001)(186003)(1076003)(2616005)(316002)(6916009)(6512007)(54906003)(107886003)(6486002)(86362001)(103116003)(38100700002)(2906002)(4326008)(36756003)(8936002)(66946007)(66476007)(66556008)(6666004)(7416002)(5660300002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?myFqhis2Lxj5I03ztce0C7mqsc0Knv08oWBuPqefEt7+pAFGj/h8gb5TpwoN?=
 =?us-ascii?Q?2WhBUjSJWgNjYxeJ2Uo4FYcA17C/m2EZGpD0Lxtwhdgfbb+s6/rCf+V5Gq3t?=
 =?us-ascii?Q?nL1TmgJzdfv86COVBVbXUMWXtkwMB4oli4FVrq+DayuZH12sqUL5UcpVkdUz?=
 =?us-ascii?Q?Gx1fTa8pYLemuYtjZEgpT6kzVz58FqNkYYfN1ifkVd3DpsnxKFJkwyluDy3E?=
 =?us-ascii?Q?5RV1vSRDy0F3I0XFjUj2xKyqyVObnK5jIK+tyAH82ypqDOhs4Ps3AfBFEYbL?=
 =?us-ascii?Q?EgHhzbbQU5+9COynQsLIIWkjTNppA6ANBGBrr6dmJkbMuZyidwwHdM+CsyOo?=
 =?us-ascii?Q?Ck2ZSULUCLBOrBIEr5lfDBLh8B0vTUKW47znCIwSI3xxRjXQwWwr6kd/wR0I?=
 =?us-ascii?Q?fWfk3VJ6eXkrS9zT68F+RaVBeZq9LO11+7l+BmBOAHSBd9V4rbqkUR1gl/Li?=
 =?us-ascii?Q?MKBwocILWon42OlMck9ZVaJW0TDB5dI3pe0MfTXIebS1nRQSlUfMLK/TGFjP?=
 =?us-ascii?Q?wUCLe78aSCbjEg+UpgKoRQm+6QLS5C1xWiHvuPM2cx4ABEltq0Hji+nkp8Gd?=
 =?us-ascii?Q?v2zvInzG2VMuqs9/7rYb8J0SsC34Z+UUxIyXYC9ahjDz10Zp+8TfWRGlSXdM?=
 =?us-ascii?Q?OcXV+KyO01bXsdivf1wg77A28aXK6BZc2BXckCBMFTHIWG1iat9e1f2humw3?=
 =?us-ascii?Q?XPr34H5o3mmjeNetv7KaDN9TbgopvXn8E6UAdlmdlwt2i0zScP/dUCmjLvjD?=
 =?us-ascii?Q?lxTzeGjVKfR2psV/qRWcazE/4dbgvO6mgBLQ6Gub810CGekKNct1ubYBQws5?=
 =?us-ascii?Q?w+xFDABufgHP5lZTpGSrAfQUe1vaFc6QjuZICo215sl933+myQujZjXFrDDl?=
 =?us-ascii?Q?54d4ertREicuRF0/zhKp5G0ut1WXehimQZXo+1xTnwhG1BjJMrKriTTClLtZ?=
 =?us-ascii?Q?VzKirK4PINiXZLSuDFAipWwWK85wmIWIVDlmlD78qMzMaxN693wcqb1w7lu8?=
 =?us-ascii?Q?X0n/KDq4BRIalE1NHvtpgpJvS5In6w8FGsVbahlJ4ZkUw52GmB3zGpygVENX?=
 =?us-ascii?Q?6iiXfGE6sBjkmvELxv/OZuY+ALGMdzdYZjSziutG+cofEGA0eGHzWTmoa+MM?=
 =?us-ascii?Q?6ekkT9qJhUllDV2tnsyN41gjzF0tKBu+Aq4dIACrXGcWthSgf4kobQiAQsX8?=
 =?us-ascii?Q?/vCjoagNb+MXlWSuR2wu+vgw8VEIZcsXWqaxIz0Txe3VA1k0WGIG+fXFUYPH?=
 =?us-ascii?Q?dbg0EYrAdZYE7Y5v8y8QegmP9Op15vosVrgrHtiO/h2M27gLcZzxyfVm6dkv?=
 =?us-ascii?Q?iFNxKYBUbleMEZlB5bv71oXYuMl2OeAcpA4XxDDit4pr21kvpqCPQAafDTOU?=
 =?us-ascii?Q?oZJZsKclxVNsqhCBu6n3xtaLHZlQ3X3+hXMt4QlMI9CUSohV6Eh04Rgey68i?=
 =?us-ascii?Q?WL8qwLStK336fc5yX+dLsofTKMze6ypejq7YLB8YOfh5MKrVdR/REekOQKsm?=
 =?us-ascii?Q?lZuC6/UUvupX20Jo94iP/kWVLdb+sY+7Taib0JEhItFE9uYzILyd4isl8dz+?=
 =?us-ascii?Q?nH5H0O3POhnMAXWI0hPoJlpXXQ04KM8D0Di403DV8UWuA8MS7D1aTZK89rk8?=
 =?us-ascii?Q?aogGWcUbLqJIk0WHmUaYnLXoq4XKSfrr/7eA90qHV0SOnUB6cdeHIbaxar8s?=
 =?us-ascii?Q?iK7ggWkYTeZkXs7k9kWvAw4OU4W3sYE1z/IE7R44bzQYIaIr6vJv/Y/E77L2?=
 =?us-ascii?Q?fWKXfFdFO4MDgjIP6UhuCvr1bGCpDBQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d512105f-8178-49c3-1ea9-08da3a4deb19
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:45:55.9405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YZn5Wz9YGjGTeR24WO14kTkxkwwPr/YXOSDT03mZUun/G7DNno8RDKXawRmxi59zWUyPtZpiXLcoS+Y+VdnIOmMmly7ddKMNZSdWGESunE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5838
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-20_03:2022-05-20,
 2022-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205200078
X-Proofpoint-GUID: Eg17C_aAPfGITJmOO_GgrwS5OC-vktUY
X-Proofpoint-ORIG-GUID: Eg17C_aAPfGITJmOO_GgrwS5OC-vktUY
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than hardcoding the 4G boundary everywhere, introduce a
X86MachineState property @above_4g_mem_start and use it
accordingly.

This is in preparation for relocating ram-above-4g to be
dynamically start at 1T on AMD platforms.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/i386/acpi-build.c  | 2 +-
 hw/i386/pc.c          | 9 +++++----
 hw/i386/sgx.c         | 2 +-
 hw/i386/x86.c         | 1 +
 include/hw/i386/x86.h | 3 +++
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c125939ed6f9..3160b20c9574 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2120,7 +2120,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                 build_srat_memory(table_data, mem_base, mem_len, i - 1,
                                   MEM_AFFINITY_ENABLED);
             }
-            mem_base = 1ULL << 32;
+            mem_base = x86ms->above_4g_mem_start;
             mem_len = next_base - x86ms->below_4g_mem_size;
             next_base = mem_base + mem_len;
         }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7c39c913355b..f7da1d5dd40d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -832,9 +832,10 @@ void pc_memory_init(PCMachineState *pcms,
                                  machine->ram,
                                  x86ms->below_4g_mem_size,
                                  x86ms->above_4g_mem_size);
-        memory_region_add_subregion(system_memory, 0x100000000ULL,
+        memory_region_add_subregion(system_memory, x86ms->above_4g_mem_start,
                                     ram_above_4g);
-        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_RAM);
+        e820_add_entry(x86ms->above_4g_mem_start, x86ms->above_4g_mem_size,
+                       E820_RAM);
     }
 
     if (pcms->sgx_epc.size != 0) {
@@ -875,7 +876,7 @@ void pc_memory_init(PCMachineState *pcms,
             machine->device_memory->base = sgx_epc_above_4g_end(&pcms->sgx_epc);
         } else {
             machine->device_memory->base =
-                0x100000000ULL + x86ms->above_4g_mem_size;
+                x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
         }
 
         machine->device_memory->base =
@@ -1019,7 +1020,7 @@ uint64_t pc_pci_hole64_start(void)
     } else if (pcms->sgx_epc.size != 0) {
             hole64_start = sgx_epc_above_4g_end(&pcms->sgx_epc);
     } else {
-        hole64_start = 0x100000000ULL + x86ms->above_4g_mem_size;
+        hole64_start = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
     }
 
     return ROUND_UP(hole64_start, 1 * GiB);
diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index a44d66ba2afc..09d9c7c73d9f 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -295,7 +295,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
         return;
     }
 
-    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
+    sgx_epc->base = x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
 
     memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
     memory_region_add_subregion(get_system_memory(), sgx_epc->base,
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78b05ab7a2d1..af3c790a2830 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1373,6 +1373,7 @@ static void x86_machine_initfn(Object *obj)
     x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
     x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    x86ms->above_4g_mem_start = 0x100000000ULL;
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 9089bdd99c3a..df82c5fd4252 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -56,6 +56,9 @@ struct X86MachineState {
     /* RAM information (sizes, addresses, configuration): */
     ram_addr_t below_4g_mem_size, above_4g_mem_size;
 
+    /* Start address of the initial RAM above 4G */
+    uint64_t above_4g_mem_start;
+
     /* CPU and apic information: */
     bool apic_xrupt_override;
     unsigned pci_irq_mask;
-- 
2.17.2


