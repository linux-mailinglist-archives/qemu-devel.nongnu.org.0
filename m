Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D949CC65
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 15:33:24 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCjMR-0008E0-37
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 09:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJD-0005pn-PF
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nCjJA-0000bI-Fa
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 09:30:03 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20Q9gmGK007713; 
 Wed, 26 Jan 2022 14:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Nq7oiy1btdZSo4JYf9EiDMZq0mEzPUaiVsnpkIaQ4VQ=;
 b=1LRV/rBgwXkfP5HH6hFSa9v2ESRYJDcS3uvnMTWRNCcKD0cg0Dih5Dngm2U2slJhqts9
 FWkb6/SQRkJCVuGNhMG/LWbMzu4cBrLadFERLkaRUEF3MOy9g9L9wYORcoJGmSthg6sP
 JErIa1DjiYCQEOqrv2BrMP5Yvxb7SiUc+ObOvZKQqNMDW85fcG56ghS0jWotI3RJ0dL7
 PRkmFoT72a5FcQjV3TC95NY9oJgL/UJnZwlcPp6381FU6wfPSyfd7mQRusdqBR1agJnk
 uf3LQuDLhB207ohmQ7UoTjL7WX3BFboUprV4tlO9zfC2XpkoViBBcI9OHryn6M6DLG0/ jQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s6508-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20QEQoxK181401;
 Wed, 26 Jan 2022 14:29:57 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by aserp3020.oracle.com with ESMTP id 3dtax8fy4y-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 14:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPaydpo/D5KkRMzvbthJKuP+zpMMqABjtusn+BoxaJ12uAmXY9IqpWvvDWjHr7EtdQbgCrDWFbim5KaIik/UDuzDGBMFRYGn8mwwVm9TQquPpUvKinhN7T/Bv+bEw6ebiaFqwuh1u1pgl1Kj3YxzsntBlPKw2uUHD2P5zRaoCm+2oRR5niHRkezJElPZwlPIu63tnmVlxWVtPNgXgwHnDNFP3fTRNI9ij4pZFrL3Jq3SXNexTYe7/toPdwJioYF/ODC5RWqF9xOTj/Y39V50zU/9FgGDqhzErTpL5adYFaO/L7C60odWq3CL4bSxPyf5iAMk/RoP+E6O+ktLplwHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq7oiy1btdZSo4JYf9EiDMZq0mEzPUaiVsnpkIaQ4VQ=;
 b=TQ+a/WLkDdLo9U9+WO9Sek/moxN34EXjJ2jhMY6BXMJ5PvsbbMj63khFb7nrSF+2oj1lhExce+9DcWENo9NfRdFFwlZtML86W1K8818KCG8GxyGDfxCLda55kkAfiJme9Ogkj6eAjh+/YcAT3H+wiRTceyyYzIvXs6zfLflMuINL4z0XNbdVe28Kl2wxT6P5iBMez80hdZP7KXcFQOWUzOjvJRmjAc5NA0DzosZtPFRV2eRDHaFzamsAvSeg3NaBUB56/qoFBzzNF6o5PHJCfWkWYasy5DXVx8MRhXoKxVWdVKmAj8d6K3pM/s7tkvIiCF93UFWcxdCSMrp1dY1wnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq7oiy1btdZSo4JYf9EiDMZq0mEzPUaiVsnpkIaQ4VQ=;
 b=D3lNpp2G9YqyMY8DgWq+w6alO+zmhAKCKZMo8KopzS6rctCkOALjhULRsRA/6E5Uy11SiaNE5F+j/rQ8pWrK0mhJWqcRjgdN6epV1uJwvCQFeSAn4OJNAWFMswD/PhWkXg6nxJ3/etQHaJ/Uywa9kBdY9nkXOdZ7u7luDfQ3CSc=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by CH2PR10MB3990.namprd10.prod.outlook.com (2603:10b6:610:11::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 14:29:55 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::2511:c3af:9db2:6ba0%7]) with mapi id 15.20.4888.013; Wed, 26 Jan 2022
 14:29:55 +0000
From: Mark Kanda <mark.kanda@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] cpu: Free cpu->cpu_ases in cpu_exec_unrealizefn()
Date: Wed, 26 Jan 2022 08:29:45 -0600
Message-Id: <20220126142946.667782-4-mark.kanda@oracle.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220126142946.667782-1-mark.kanda@oracle.com>
References: <20220126142946.667782-1-mark.kanda@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0019.namprd05.prod.outlook.com
 (2603:10b6:803:40::32) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dfaf5b6-622f-4ff0-fcee-08d9e0d85261
X-MS-TrafficTypeDiagnostic: CH2PR10MB3990:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB3990142133DD0CC01CCAA9C4F9209@CH2PR10MB3990.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BN7YjnVtRV51s/1DrMPDYHOoASfqZ5NwiD2s2kU8zkulHksx2lIRK+a0Cue5arPJ5YvBqIjWIX7sN6QV2a48bKUbjmEnfrQYhLJu4XGiev+SbZzsf73V/ZBjrn6bOe3noMGsqiCMI8hyorINyixTJGtaJ9oOSWnjYk/4trdh8lK4Oizz32ndEoVNUN9rqekWfRiViR82J51mYl8YjAuPHH/IwD6rOmuaTYxXxWbhFH27PIc25Mm3xdlgYE27iS2raTdThbsVS0WUNMhehamsu9KHMSkxjvKAMETakvTbYjN7qC0S9FxYIG2215uFDpkc2yg4VCAoi1/sRoLeOV5R1xFwNE7ohlRUcF+nW3qhZnI5w1F547i8zEXX+H0YDVVUtRQudQh3IRoTagVrGYReA+Ark2a1jkCVe2Q7N/cgRXu1uQLbKzRdTNi2Ub8FBS328hV+2qXaEjEFOMdGdxm+oX+0wCZb2UfsVfzdyhkSWETD22UNDXKpbvrY0kjRiUDhowceVJw+GNJnCvU8azK4x1+ePpVpsQfNKm8Av0Uqo8t8oOh4nhI7JU/UoDvWaMZ5erioKT7XIno3Q0Op485KwWPjT1abER2Jg/1JFffMucBesmNDRZOp77Ksd+rh+AAsWUWUWAQxX1jrTxfZU9L9wVCwa2Drf5KLLYZIoEE1q/0GlCrGoVmxAzKQbvmCXQFhANZ+bd0HSpoM3lF6rqa3mQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(83380400001)(36756003)(26005)(6486002)(316002)(66476007)(1076003)(186003)(66556008)(6916009)(66946007)(2616005)(107886003)(86362001)(6666004)(6512007)(6506007)(44832011)(52116002)(4326008)(8676002)(5660300002)(38100700002)(38350700002)(8936002)(2906002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8CC0u1ubzBgcIjY6JeGuJr8vzdLr77HZnyGsrcSSfCKltfY1Dh+5kvEkoDRf?=
 =?us-ascii?Q?4cx7hjRolyWB3eo+pswT+ttfRIHXCADAhErZ0ShvEXVMvk7ck4paYbzKWNc8?=
 =?us-ascii?Q?92PQDhN85fKFMdKMV0gvgPzHEJ1ymN7ZIBWxUtmmvnR/LYkZSXs9olQ3MCAc?=
 =?us-ascii?Q?/PfRN6gKvFuJAbm7K+le867bS9Taw0v0fjUokGrB4qv3N6hJ+8mfBpMwNDwD?=
 =?us-ascii?Q?0KPyJo0KFSKz8lH6BXd1Nv6j8NqlnGaunbGC52qXcg7QSn8SB5HoOnNxR69C?=
 =?us-ascii?Q?bBdPoEmv2NnXb0OU6/geE66YDsA483wE/Ue0Gr+27oL1sumrTfncxJZlT2Xy?=
 =?us-ascii?Q?hZDnSSX5TTs7EdSCbIdn5Tz/T7f2Xg3ZjcYCanlrB0LGHGlOShcRYADfkoUR?=
 =?us-ascii?Q?SKjUSHBZbB/5J2nh5cDCyIZNSHjM2gbbjchggfHWw1KIBg/y1Sc8R8NKBcSs?=
 =?us-ascii?Q?kXWgM/QMfqyoXFfdkj0sRJfYbkR75BusNXp8SSKXZjBkZsDLJYGyQiYnGtJ7?=
 =?us-ascii?Q?w/ZK/KfH85U0+8v/hqb2j3HxFPL+UIbiSNYmBTlBsuj2axogLWugaZvt5Cl4?=
 =?us-ascii?Q?R1vND8DdX5YgZsFiGjiEhCd+NsUCkcdmUSoBTfcZY0aMVrlE1FF/xJh8QUkU?=
 =?us-ascii?Q?gysyUou/FCKiQLcGc0CjlbtqYz5B6PyT5EX/NeJabY3C1fRQ81gw3xYu0Duu?=
 =?us-ascii?Q?TR+bTGHNRdmGrOHNcTzM8WyEWoQ/f+x5kQx90uIIqUspsTS4cBcFyE9vOBlh?=
 =?us-ascii?Q?TrSuywvvwMtxTOfXilFmvpPbZaWXDScuTK0D/QrD6HTR9HmzWVL/8Y1TzCPp?=
 =?us-ascii?Q?/PdSWMWG4t55uG1WDzPAWYhSMAbXDtyo+cN7T4YlGzLFF4GrHgVi1MhuzeT+?=
 =?us-ascii?Q?Mea+/CQ0Fe38bFch1bFX4+CvBOFTkD+Ax7ttmEh311A7+mUlTdKgQNqshV8Q?=
 =?us-ascii?Q?9kGieJG9tIIwOQnOGRih9a7K3C6MOOlBXDhy+ViegKyRqyfw+HPavrAgtwOL?=
 =?us-ascii?Q?TU5Nh+I6x2b2kbnIQpKDB2Ia+PO7tH+dzLFUmEn2TTlsdfEWjHpGekrkbVLo?=
 =?us-ascii?Q?jdzFK9MzaVs6U7X21dgsbIVt92L6jQiHaiFtnfbO2bNEBKCCmqah+YHYo3ZY?=
 =?us-ascii?Q?WB20Jw0oqxmzZ/uvRU4hxpXqoEZPPsc1MxxU+9P5Sqf8W4ARxFkAnUjU30ob?=
 =?us-ascii?Q?WFdcrd20cFTTYidXmar2d/idn9qTh6mmTaFasuGNt0W3F7oM/38e9jz13NjJ?=
 =?us-ascii?Q?Pr0Z7eiVR1RZ5c5WUNX4LQAuwSlN1BPIEgIUpAdU1vXfG/tfr1/Tpj2b3HGy?=
 =?us-ascii?Q?854ZWl/RB/cxLpCvDRIpsdrQblHtZlMmwvZQoRn5SLCQvk3vbh0h+Ahjvgs3?=
 =?us-ascii?Q?CQ1X1HyNfrl/1t9ghLKyFHshTQoPic7jgRdEfU6ezSI2E4WGWGLVmb5gu+WG?=
 =?us-ascii?Q?+VjV8RooiInYWKY0LQcko7kMa4KptcPlIECDPw0gN8d9V75MiKiHPVy2t82o?=
 =?us-ascii?Q?fSovMkgb5c0g6rcYWSukhD85F/i7ZMhvGg37a8bMkMqqG70aQybg2FGIIMSe?=
 =?us-ascii?Q?NEA4fEG5KERsIg8HXJqKO9W7t9uPSPwCnEYyBrN8w/LVLNCi8xcGEUvBpu30?=
 =?us-ascii?Q?FETNbDhtl+bFbthSejqcPXo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfaf5b6-622f-4ff0-fcee-08d9e0d85261
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 14:29:55.0596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eIw1SovTuOLfj6RW5g3hS7RQfRHBR1R68bDRT7Rs5v1+pF0jLqxSHCOWX/6wwf6yBtnDzWI7gln0Fv4BJx9zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3990
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201260088
X-Proofpoint-GUID: ANKCWmzLaeMI38cE1xjZzJTnesKwB-SG
X-Proofpoint-ORIG-GUID: ANKCWmzLaeMI38cE1xjZzJTnesKwB-SG
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vCPU hotunplug related leak reported by Valgrind:

==377357== 216 bytes in 1 blocks are definitely lost in loss record 7,042 of 8,471
==377357==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
==377357==    by 0x65C14CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
==377357==    by 0x78552E: cpu_address_space_init (physmem.c:750)
==377357==    by 0x78175B: qemu_init_vcpu (cpus.c:629)
==377357==    by 0x7185A3: x86_cpu_realizefn (cpu.c:6447)
==377357==    by 0x8E46B7: device_set_realized (qdev.c:531)
==377357==    by 0x8EE36F: property_set_bool (object.c:2268)
==377357==    by 0x8EC3C5: object_property_set (object.c:1403)
==377357==    by 0x8F075D: object_property_set_qobject (qom-qobject.c:28)
==377357==    by 0x8EC72C: object_property_set_bool (object.c:1472)
==377357==    by 0x8E3F7F: qdev_realize (qdev.c:333)
==377357==    by 0x43F3A2: qdev_device_add_from_qdict (qdev-monitor.c:711)

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
---
 cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cpu.c b/cpu.c
index 016bf06a1a..d5c730164a 100644
--- a/cpu.c
+++ b/cpu.c
@@ -170,6 +170,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     if (tcg_enabled()) {
         tcg_exec_unrealizefn(cpu);
     }
+    g_free(cpu->cpu_ases);
 
     cpu_list_remove(cpu);
 }
-- 
2.27.0


