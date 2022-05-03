Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E015518675
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:19:31 +0200 (CEST)
Received: from localhost ([::1]:47096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltNC-0002ZX-FK
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLM-0008Dj-57
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:50346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLK-0001PZ-5i
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:35 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243BLJgo030616;
 Tue, 3 May 2022 14:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=a+4wE2YG9xs0eUF58o/LSFGH+P2cHi6/Mit4L3tnN+03zTl2O4J5MhhFysls6W2XwRW9
 e735Vd7p0ma1BugEY1vgzT299LCbBvStGg9/53MvNkqrwQdzXgHwdnlmnLGYsLKoUW/Z
 ZT73aPJeEGUgeXvPSoEPLA5wTArRXvfXXAX2O0ZB6KR/M3Zk2teOf/KdP7f6FS5hEKTu
 mMtM2ayNaL5cWKN17IMK4Jgdp8OungUtyR/2hqG1Wp2/M2bXsCX3wKdMwbbcY/mLNZBL
 m0xrxBfo5KOFQsznZNRRxSlo6KP2Rt5Fr1EyPfOXVYjGQwaxGg1PO+UNFbAox8wZK4Yt zw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruq0dtpw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:29 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EFMY6018974; Tue, 3 May 2022 14:17:28 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fruj2eam2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FERKYJofFHpHAV5OlsT3x6O02fJs5NqkRYuIq7fPnQObWbt2abNyj4OIMNJ1nS6m1YytldKxZhS1oj+tYSM9sFrheINvGCjT7rMEs0tq2ikytAoOT1F9QgGibUIRELQJ3yWzJwfuZFDfszvYw1Eax9xP9J7G3gb3ZpRqnwruTCj1zjEvBI+AZUfML6E/i1bCQmfoiNFKbvujbG3PcQet6xx4tpbrGITpky6xjBtawZsgNP+0omNajRujY3YQ8PzZ/gvLfu1UYAq5n9Va8vWiRnm7ZKVNR1lbm+e8uRA+Zdz7G6p2KWKaDK2XXNDFz1q2YI8u4ySACpfAZP5t9kndEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=bdBGxTeNE4zYmvLmlMVQVKm69pYiVUtq04uEGIjD3ROP9twmDeOXgeLAG2Nc/CWeWDrIpoFVLw1mDT+Jf4mJLmOzcoMtHgfxuTnmgTzSg2ZRl0+xDwFEEktgm6MBufEvz264hPO5OXNJJx4NlgtKfjIf6chHPJ5exi3/2JRCDQDYR/0XecXozRBtCNwqr/bjAtLioge1s4Ulr5/LEZ+OhaF6kdW0D0Y5A2q910Q+FZGDoy2EM1DvgKPhjsSRGLKuFRgl72BEU8l5Kcn26c+0HTEckbcJ2HbGy1aSzaap69gnX5ZynT5oYK5N5GZMYTsUC5UOCtuWa5orAUlYQtmNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=og3us9aVU7yjthCZgrvB6Da6iAnNXBLh7W3BZoEvEMY=;
 b=e756TvgoH9F24HN+hZnXMRfXEo5+3Ha1cU+QRY9k0ZKYvIimSPqeXA6w8+qKYG8vvFcTWQw2RNna8WA7TCIQa8SIJBKlu3ER1MYQ+Qpxoh3fHso+fiEXfBMJeWIviM/xOZsm2zlSKDZlb6bSyp8kdHG+iYSgT20jZ4y6i4G5VvU=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:27 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:27 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 09/17] vfio-user: find and init PCI device
Date: Tue,  3 May 2022 10:16:50 -0400
Message-Id: <2226baf68de509ed6b144bdc50810a0a073c89f9.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fe01cfe-4644-476a-c293-08da2d0fa68d
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB3358C7814510A834694F0EE990C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQl5TkDxF++/afAjdvxBzp0hbr3Ls+xa6ic+shd5BAQ9rVoacIEWLlUq3M+B0rZmS9UwjGEmCHSKAglDdQ6KbAUKXLQKoTYTFmpZkmsDi0pV9pXKz+VqXqsKM69c9nh4GvvOpWMvO1wVxjNhZnBd9y1/MSZfZkzx9efwUphu8oBa37NRgdtB7plQuWJeVsdaxeeZRMyMIIzT2ZQQfUlTHfI5yD71CiVo3pbsOHaayGr4uaUUPYBDiASfGbWqwI2HaEyn7ZXrrXdjZbA3zRP3yeFY8nGVGvV+xKG06xMrt88FXO/DMFps9XttnlfqC3dRcKUCSaxccwOJ59PILlX7WUk5kzpefEZM1HBiFLaJz0Wf3rDNMMxJKF1R44pIbvorX8GKm7cD4m5tjN83MIk7YV8r9vp/ngdHEKB2T5uDy0lVEET27T5Mq3N+8noZyVRqaI+5th7/lzxkrwFEh1h13oWfYZw9dsJYTYZLuDlTZhq0eYXEZofg/MlGJKleahSlCsggn+rF1C249OjhoKE7zVUYdzhZSF5RE2s8X+atMEESFXVBmqr6uHdM3Eot2Z9bvCTWvBRXo/Vb9yjKxKg4kj4eqvLhrcQ35OC6VUacS7fQKhxguP0am20/g+EYbUdPHfmVj1Y5kvZ6epjaglfgWsSzDTuJSGpZM9iQDiPX3E7cxAFa9pjMdNmH3l8xAMpzjQu3UhmXELTOKLNTn4DFww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZbDYhIWK5yXHlh/fIuzN9J4H9KnWBb8GkvdmVUb6rVz9SCvfguDWEc/sEzUi?=
 =?us-ascii?Q?cubkxNdy2HhF/IJUYc4DhbefmhMHu+u8IYiXZXHts5QDZWbdHXF6FmKO+ObP?=
 =?us-ascii?Q?LMxf2/EAtXVrOldhWDUMXUEC/fRsTF8BCYtvLZwca5KZ0RhQKJJ+FVTZKS+k?=
 =?us-ascii?Q?r4G6NCw51JmxQwHpyLcgr04/hD0lgwqV5WfJYEc60j7fi0ys0HZU8nEX7atg?=
 =?us-ascii?Q?JPPKxQmx66wNEcpll8c2YO1YOG6s3Hj+9v9TbcqJW2AdTJVGaQZNBuFlR2WM?=
 =?us-ascii?Q?MmYRw7+BqS9IzDkEnYblnfoPHWP4i7BGfmrvjsxzjHPljydq29QbRAZEpn7n?=
 =?us-ascii?Q?22tOHSeBQxKkH4TdvVXQ7W+GOfKR7mDjd/1uqWJH205v+DrqmQA4e6sX9Lm/?=
 =?us-ascii?Q?HSKQn3YgwHog92EscjtzmPt24X3VdUX+vCtqEuJtfzBu0YlTFqJP5kFdX7vL?=
 =?us-ascii?Q?zJZakVg/6VxREbFkHYWp6CVxT43xI0r4IfaFToIk4/sXENbJA7PZLEoTuXa4?=
 =?us-ascii?Q?ea4R3QdglubQkq/QPzfow6P2J9bMkRl+bw6lNitSC65umfUcDuCfMIX2KxkT?=
 =?us-ascii?Q?9yKefvSorr+YGJG/xwUEw8+5M8GMRvGfQKnLbphr2tFryBn6nIePBX/YTXgs?=
 =?us-ascii?Q?0Hy2BYu9LtIMc2bttSk8gDD3FnqHb0fAKPdFvqaYS4fQK+jpgaGjBu0D/DJ1?=
 =?us-ascii?Q?VKz0sAa2RTElaJ2YVwQpxgYTLYgUSAwvKlfpANB52zI8zOC6/TmkyKSP1Ziu?=
 =?us-ascii?Q?79FQ5vnilllLFZbPxJkk2tmFuWNRHvfoXACsfQyEh9tqwaNelCifQz7uRAFZ?=
 =?us-ascii?Q?mE1zatT3j5aKPsnTt/RhHnmcWdhr+TTWvnWyhYWcLWiz4ko7Fj/E8TvLgAQd?=
 =?us-ascii?Q?kIUzBVSI7l03K8TGmjXF6whaxenBrG/YiFizxJCA1uVlGt8SovoUr56cN3cP?=
 =?us-ascii?Q?uXF62RAHhyjBOfWQ8BNTRt7qbpyZ81tE5YhrF+pO4sGZxI0HZGW3BZVsEx6n?=
 =?us-ascii?Q?MP+U9Fb6UDoRGHMwv8X+2NDOi5T42zhRMTfmL7fm1BzfHuANm4Ip+fN+U3ay?=
 =?us-ascii?Q?LXUDUOlWURYlM++uc3R2odAiLPUdMkePh+WCfKYTcwyRTgmXyWttbFurf0LE?=
 =?us-ascii?Q?BW5rQqL5DfcHOxCaINPuwk1zCkxbPyyiVJ94RyKpit3safK+rZfLdZl3OXjA?=
 =?us-ascii?Q?QlxuwHnWLncg1tGQKpMoSAOlfy2fMNMsZnSf6KYv/0QaRWOG57JwMFvOUS+V?=
 =?us-ascii?Q?jqTSq4RpX4OE+ZDzl8Gq0QOPr7dJStJ3duY7YnuOYaLgkEUVmzBlPHad69KM?=
 =?us-ascii?Q?LDhALBq1lhUhv/VMvqekIAVB5DNR0zeHSG++LlXEtaLLeAp70oRUal+0/Mx7?=
 =?us-ascii?Q?ZP9ALiIqfyHc2JirjsrOQAKylM86ELSlVJwYOfAeftJlhzDp5a2WvRuXt69o?=
 =?us-ascii?Q?/7y4I6RSoV3lFqtwSOjmvGoEYe+LBD/BbiK/qQ1KMgrPaJBPKAsp+CMa/5ss?=
 =?us-ascii?Q?s1Qmyi8MIsN9ACPxmtdd4grIuVxOHXjNowlxx2sPOpOY+l7QLAQqfbAoE8iw?=
 =?us-ascii?Q?5qxdBGADWAmF/bGrID8E6CZgfhQ+OF83eYArdxX0JHVpsn1QNEHHdAekNdTK?=
 =?us-ascii?Q?9byWPyqeu3WFiXvSogWQ6egiq/JxbvHW0VgmMnk0T+8DDVuItKjZSiYb/A/v?=
 =?us-ascii?Q?HECGkObsZe56/WZpqyVctA3wiHsa35GRLQDtHor7GPL8PtOnZvx2RegQvJ5Q?=
 =?us-ascii?Q?hNy3xZ6keg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe01cfe-4644-476a-c293-08da2d0fa68d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:27.0757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gscaE7Hhw78jAfrzWtRfxb1AJ4616UNIntzWMMVV5l/P96tS8rk6twq6HOsD4yY/NKB9IJoBDT76+v+mdbk0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205030103
X-Proofpoint-ORIG-GUID: P6TypLxHwTc7WFZe5qjEB37lk7PEEPZz
X-Proofpoint-GUID: P6TypLxHwTc7WFZe5qjEB37lk7PEEPZz
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 67 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 68f8a9dfa9..3ca6aa2b45 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -43,6 +43,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -80,6 +82,10 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
+
+    Error *unplug_blocker;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -181,6 +187,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -199,6 +208,53 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(errp, "vfu: Device %s not found", o->device);
+        goto fail;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "vfu: %s not a PCI device", o->device);
+        goto fail;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    object_ref(OBJECT(o->pci_dev));
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    error_setg(&o->unplug_blocker,
+               "vfu: %s for %s must be deleted before unplugging",
+               TYPE_VFU_OBJECT, o->device);
+    qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+
+    return;
+
+fail:
+    vfu_destroy_ctx(o->vfu_ctx);
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+    o->vfu_ctx = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -241,6 +297,17 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    if (o->unplug_blocker && o->pci_dev) {
+        qdev_del_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
+        error_free(o->unplug_blocker);
+        o->unplug_blocker = NULL;
+    }
+
+    if (o->pci_dev) {
+        object_unref(OBJECT(o->pci_dev));
+        o->pci_dev = NULL;
+    }
+
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1


