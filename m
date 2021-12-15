Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB0D475C04
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:43:28 +0100 (CET)
Received: from localhost ([::1]:52914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWRD-0005tv-Ad
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:43:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWK1-0005EO-60
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:03 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWJx-0008RT-1y
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:00 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEYwBW008125; 
 Wed, 15 Dec 2021 15:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=kR7vPzM1V8PihMFmjBOTnuFSROPHpR+JbmdbUlqkwEQ=;
 b=soTNCbAP1LmFBz5Kv2pTmhDH/QehGOS0EsJfE+So7yTJsa0n2wMcL7xRdQmtcJTXLyb/
 qpivWwgGYwwMq9W74hzqWhi0C3QnRbVjZ+9INX5FMPrw24KttlGZo8IGiVp1PoKPDE4m
 uSLBo+fmxIMb1/RBznVdTBK/J21DXiH6eIc2OjB9yDqfbyzwabf/lma/Fl07RW8Y+qSN
 R85LpIDQ4fBJugWVVYqRvmZzxEQtT1n1QJpBcZdgWH8nBihnk5iZSTPdOkJxtJDmmHsq
 V3bIOVvYbgXUQzLsGiXLlLpxUcTCCP8rHNMCIJxrngBP7c8lHtT/9d+n8/1WGmpVR+pL 7g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx2nff720-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:35:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFVi0G127819;
 Wed, 15 Dec 2021 15:35:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3020.oracle.com with ESMTP id 3cvnes2c6r-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:35:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CERaBYGuU1dhALy07pjcS32rzUOB44E0QNmkCElKJyCN/3OBPNl5u8kbLpycK93indlmWQ+tc8hvknoR/fHofycU/IckRHqtc0HwkEdRA6HxYi4kHV5tBLtgnUeVMx7bzrgTwRbbssdNx71PM0BQ+2oV2K4GDyl949Q9UetdpF7dOCk8RqBTxeKxuKXGBoCN3Qh6hfmSfjWzGHbSAY/YpBbyEomPixL7INsnOf/Y1C/lUPbyc4rhHbQiE3AiLhMQ4ts++fmp913C/5CKPIIX0uthq+K8/vrf17iHUEmNw+lMaOIb6C0tLw061sdj40wt0MnfIUftuEWfXY19p4gwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR7vPzM1V8PihMFmjBOTnuFSROPHpR+JbmdbUlqkwEQ=;
 b=Jl+j24dF+dQV/vMgBCYKXq1coSpEHizvaefis9DQSmJRvdEZyU+Q7Tqf/tIPQLUDwtrJRGevSIuyzN5XAjD39VAA9onbH7CuknOv29joz/yUKOn39mPqBL6D1DVw2B3ncf7puDO/rV1dzGt/3GjUWRY+eapohtZ13fhKbMOKQnsqn2K8fiIQ1NCc1VOWlK5y6ysCPsRxgSaWme+ju8/QkkBSn6Rr6Sne3ftuRoe48VJIuqMlgdiVduQyEZSyfNXhQEhkG3ddOK7F+dtHZdKnP4I5VQuTrMwQBUME8uVrYlxyggg3MV1L8rhNPvvRaqpgPfB7dCDCMHEfVUuQ0EtuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR7vPzM1V8PihMFmjBOTnuFSROPHpR+JbmdbUlqkwEQ=;
 b=Lw6Pftes7MdvwuWWrWlL5Wm/1NOJKyG9vkF42CslYPgVyzTfyH21ZrsbvPIpFPpF/7oipu3foJXd1hkEC4n3lE9zwkFKRMb+mpFJFSow5WRNEP0Zk1zwq153adX3orX8Om3sTwLLKOSKVFZRw3CQfE7Q1yCGmbpyWYJT0HADs5Q=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4094.namprd10.prod.outlook.com (2603:10b6:208:11e::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:35:49 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:35:49 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/14] configure, meson: override C compiler for cmake
Date: Wed, 15 Dec 2021 10:35:25 -0500
Message-Id: <e47416efc496ca0447ce26e477c886acabd7e3de.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d807fb28-db52-48ed-502d-08d9bfe091d4
X-MS-TrafficTypeDiagnostic: MN2PR10MB4094:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4094B16B6EDFF5249BFF519F90769@MN2PR10MB4094.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wu9MtQ+iunguZXDExnhPd3wgCElV+/JlVXEF8rBZL3Qj9vxq9BlJYjE6aYcle4cSqosK8gROIWAV00mj37g7wGYIAV0Is4U02DPPJdyO1KGq3s/hprFtW+j/WVCeXb9QO2zKy37m+eR91NX7QMos9vQ0y1FlbZQR5Ma4LPXxk8//+oTYZ8FFcRC567q72mLStpP7fQw8oa+jmf8roEvNAmCGKcLmgi7C+KtVLOd/fYk8fwuPNM2GHF7U6l5mja2boi1JEx4BBgSRdaoiNGQozkXrF/eZfpRWYKvh2AsgdzmAPcot4Q/hGqkA8PxumZCZxe8ZlVP39NieAhhRifYgbQoJeXhjqGRmmgWS45scj35ECj3KIrdzOYRACbSo5kG0EScAsGKQ+r4pEuTpsrVjMQ1h5EeKv0gmZ3tQk24w3wxsSgGLgo4CZSwWjfaPedCxtsRFLMShoCBOanHCw4ZuYm/Rbqr42zMVPQTXV7G58FUgVTNcevEAMrY2NrE18bLtvCAo4wxXRR59PPWDyDzFDL03mhf6GJR1Wq5mDxUMI0AFzDzMFJ9O1aETvVz4B/s0bk9PAejZmqXssRO0VooxjmKzQzOSSzkHzvjKw5BbcJP6psR945np3+Q08qu4oXHsjVbFdHVYLY4c9w1un8/LIg43TqwzSiYYSUmJSaMxUERYx7IEd9hDI6YXeDz7PfHaV5kCRd0HlgftF6Vk6Vn3Zg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(6666004)(52116002)(4326008)(2616005)(6506007)(86362001)(8936002)(6512007)(5660300002)(6486002)(26005)(2906002)(38350700002)(6916009)(38100700002)(316002)(186003)(107886003)(66946007)(8676002)(66476007)(508600001)(36756003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oU7K4kA8yWPGHLAVj/HFasuqcX64IzVUAWPeq4i1juFj5UAaaBwOQ3tbvLhy?=
 =?us-ascii?Q?yNBKv9xfLEcQ5U7/v5DJbSvWywgx6D+LCEIh/IyeKsAq5tCcPQ189sfaE3ZT?=
 =?us-ascii?Q?DRq8ES1KKQKewCI8iIZ5oVZKOofmUbJvJT0u/fU4oO33dhj5vuVCyYT/vWGa?=
 =?us-ascii?Q?KysIDQaZlmqXAaD2j+3OeBgTQsfBBGgJVOKmBBIJi7w0NSFd71HGFBpGlh+Z?=
 =?us-ascii?Q?lZTTUHVR8ml6m3GIU8aSUPRCP/IedCFDmlYRxoay1hVigCubpnlGHdQEgi1A?=
 =?us-ascii?Q?UsMw7KZ7UzvrTAfSIpcZME+1PK/pzl6ocPR0Yiui6VNZNXFQ9Drh8i2Ll5zl?=
 =?us-ascii?Q?MpQEmCgid69kAddFg3HXQ3unuLJNKL8y0aphlFhgQhIqttmnchDa/9jDSHRy?=
 =?us-ascii?Q?7/SMcMSXjEFfntAJNJFvE+IxqypTonTbGwF7NR1k59iDm5uXvDrKAL6uFzyw?=
 =?us-ascii?Q?UCsfEV62U+89mqP9Pf0wcGgStpnJJcsXG8kBObzFKwOv0jzkt1Qw/403RaUW?=
 =?us-ascii?Q?+gRbB1Z98NkZw/WbBt1hCDW6zVQu6AcOlsnpJbYcvoO0Bj2OXZsoN56pfW09?=
 =?us-ascii?Q?HPCwKTntWCwIwK/zwzUU27uZSOFkwVGSd1r6xOR/pyA1jCb0nvrM51klD0Vf?=
 =?us-ascii?Q?P6yhSTjcXPs3YP9CFriEMzDxr8SU7sS1UG5bjgkPgdOY5ga7lvhjwA6+R9hB?=
 =?us-ascii?Q?ieBPTV64QQ8+X7/5/Qxc3XhT/FekeXgVu31YM45mzGcELRwznlcanmE5UHCn?=
 =?us-ascii?Q?JtDg5/vzeIGJHaolZORD7HQNOqJk03exS5s58qpK3aZ3iq3xkKk9ZebWPAc8?=
 =?us-ascii?Q?zOiuESEnUEZ6PHT7RcEWM+kYCA7pGJk/lgHAlcAr6izc7mXBNBoyaEh5V9GC?=
 =?us-ascii?Q?lLNIwxJth5px39+lhK5VhFvaUldtc62I6UO3vz0jmt9Ze3FjFT28j+CJVoJV?=
 =?us-ascii?Q?gFWlqtiLLOaDmj5DpVjUEcp4CINtA2gisxnjNkJ0g1RGckbtlUJLIv4b6Ig5?=
 =?us-ascii?Q?KuSjdIYRnZCUELtus8rZjotbz3GNyqVZKDknSCnJZwiq3VId7iUSJnsgnODB?=
 =?us-ascii?Q?UgBQdUqANEe6PRVqp5XStImi2OqRQ+nrTQw46ndv5AdcZkss4KNJvvSx4nmx?=
 =?us-ascii?Q?wCR+qSuMsPVlWibzoAHlN77SqqHdTHSSWAjBt36/VJgXGvAWPp9511/Y1RXB?=
 =?us-ascii?Q?ULYw/Bxx6piRcYTlzW2T8sXqlA+LII+/zMTCMD0ch3Am7jsqQkvFQqODmVwh?=
 =?us-ascii?Q?mRAVR1Wia2T4g4LyKeB4h3iBxcUT2hj4F5HUwf6MzxtYBKEMIqyqEQDh5DIT?=
 =?us-ascii?Q?okceQoqw6nmtBZTsEWWnWf0Hi3a2ZB2Xp0zE6itTCVhdFRLU17aXe+Nh+Yow?=
 =?us-ascii?Q?w9xGfHCvmgbZRDvH6wBDChlU4vwjT96qLumDYO8cKAYrYBbU6UB0GDT37ftP?=
 =?us-ascii?Q?Sdn+rziBlyoIKjks1R5QeO55JNnd7VPOVYIr7s/pnHimpCczL1ZGzPVaOYzy?=
 =?us-ascii?Q?F2UFn8ULhoIXoCP06j0eoCRLn4bXabkb2DtHhCyWLO5GXSNztVefjhRpku4R?=
 =?us-ascii?Q?VRgMV+v/CbavtHdP17FmZ+X5VssZDWRY1XzlOBAiWnuu79+aLmaPFNzhNC0R?=
 =?us-ascii?Q?LeBQdiGC+8o3BHvw8xgXAcQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d807fb28-db52-48ed-502d-08d9bfe091d4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:35:49.2481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/Hm5GtXgoAJvqWt5dYdwkt5keNH3DPC8qUCYUdDwc3pgenxxgAl0LtE4DvcXv/FH0USUCk+or3agxytHIy38w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4094
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: 6rhtBHMrMtQ4cUozpXlexyhQqETHcX25
X-Proofpoint-GUID: 6rhtBHMrMtQ4cUozpXlexyhQqETHcX25
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler path that cmake gets from meson is corrupted. It results in
the following error:
| -- The C compiler identification is unknown
| CMake Error at CMakeLists.txt:35 (project):
| The CMAKE_C_COMPILER:
| /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
| is not a full path to an existing compiler tool.

Explicitly specify the C compiler for cmake to avoid this error

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 48c21775f3..dd000ce299 100755
--- a/configure
+++ b/configure
@@ -3919,6 +3919,8 @@ if test "$skip_meson" = no; then
   echo "cpp_args = [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cross
   echo "c_link_args = [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $EXTRA_LDFLAGS)]" >> $cross
   echo "cpp_link_args = [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXFLAGS $EXTRA_LDFLAGS)]" >> $cross
+  echo "[cmake]" >> $cross
+  echo "CMAKE_C_COMPILER = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   echo "[binaries]" >> $cross
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
-- 
2.20.1


