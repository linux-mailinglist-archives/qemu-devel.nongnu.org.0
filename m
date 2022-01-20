Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477D0494FC1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 15:03:07 +0100 (CET)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAY1n-0008CJ-Ln
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 09:03:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVey-0005c9-RL; Thu, 20 Jan 2022 06:31:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:1262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1nAVep-0006Ye-OQ; Thu, 20 Jan 2022 06:31:18 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20K9r3ia031238; 
 Thu, 20 Jan 2022 11:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=5C3A/LTzRbXyDRQK3LFG+ih/nDytojNRInU06Gtw2z0=;
 b=FaMSh7KwmJQ1KKjBnsPSTEin3YW1CM5hSGBffIiW86JFbaK5Cz0oAFU+MxIy30Ew6wAJ
 f5h74eFwasLnmbHDKnYdmr0L+UwcUGaOHR0ZMKSkAfmN9Mh0MzIqxQri6GvOwI+CPMLK
 R/y7IDdDd0+GM3YS/AW5nvvD9wecewZLLOCeblNTj+KEKE4xDOJQ3Q9CupHpi3pdmebn
 /vXTcKUdsNWT5QVzLwCNqX1fgjqG2/DksHbdfEn2MdWURUZglJV7pkc517W6DDQMHCLj
 r+SotsRxPRXTVvj7tuwh+rYtst8z42kanhJzr+2tEQfn144bgpwubjzK01SwkAKQbVlS qQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnbrnyu2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KBGTOS159003;
 Thu, 20 Jan 2022 11:30:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by aserp3020.oracle.com with ESMTP id 3dkp37g99x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 11:30:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmnje3vsnniGXOZFe53ql/A1OcB9M4U2O78Ui7bDGxB5q3/7RzsP8sutvNUAEANNrVtLs/UwWZ9mp24CG+kMWh44TnQLOlUZCoivOaL77XO6x40EH1FwS6xssfCXKovsV4EuAvY43ow9ZE44XFJPJukhX3ft0N7L+SRh2rb1VNBhWzlq/2MC4H/PNMTDutxxQnR/wzrdt6vtqOHMktCgBPx85SWMhHMIcrH5OJXfCn2+EYL3sP365XNvrH9CAdtIp3VCCkLhsH12UCUmW+Oo9yAjenr3+m2d2Cu9SCshdTQKm/YFOrmlARHYU9H7U6xSwvfdVhYLdoTcd1GE4yZ9pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5C3A/LTzRbXyDRQK3LFG+ih/nDytojNRInU06Gtw2z0=;
 b=XY4hniWhjHGGNfL/qGoh9rBoq9SbziE5UVFIiASzPg1dFOY4zr8ZL/fWLFyu7sWIx4Z97tkMTwUEoZA1sxStc2uR90WwRyJ2QDUsWwkl1v6GAQjpN5QXzYkBx++RQ8s4oJ3UxJzxtE8b8A1GX85KPTXFkOc3t9w7HxtZu3tgkiLLgPbYfLJl8cBnTtlIAVUPqvE0gh424DPf3S9nipyrOz9UVzw7Q3wyb2YD1zihX+al1GqkVkuB5MpMJRPEGZXh9E8+5UZg7fTgj/iew3CYS8GvF11C5QNfLtHBMADmETXmC/OiC5t52pWwy6gU6ltwpQYFDrCJLN1WvHyEMoo3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C3A/LTzRbXyDRQK3LFG+ih/nDytojNRInU06Gtw2z0=;
 b=VdALdfWwyE8WirP9L4CBhINS/w/VUTuf6udR52c5Az+KcXnLiAztjEC3MvMHwtPDeMxB5E/dNr4JPZsP25Yi+3EfCE1hRHaRULHkrmoUgUeEYfkI1mCQYHQ0rirxd7lPrAIdZx9J9n1VL7NLRvvboHjzX8UWsHFC/udqi924KrI=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (20.182.107.75) by
 CY4PR10MB1381.namprd10.prod.outlook.com (10.169.254.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Thu, 20 Jan 2022 11:30:14 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::95b1:2ba7:964c:d3cb%9]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 11:30:14 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 4/8] qmp: add QMP command x-query-virtio-status
Date: Thu, 20 Jan 2022 06:29:24 -0500
Message-Id: <1642678168-20447-5-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
References: <1642678168-20447-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:6e::30) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10aac47e-ddbd-4173-2faf-08d9dc083a36
X-MS-TrafficTypeDiagnostic: CY4PR10MB1381:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB13816CB030A57870391D1ABBE85A9@CY4PR10MB1381.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E/s3acHAcWQqNOuUiD78qZwzM4biac6UOV9xSOM9wenxzLLsb11jGEEjvV1rRgkOvSRZoFYasT8xxFUG4392UYEQctOG7xMA783WE2g+c2xVL0D1Igu1OEz4rBNVbAoVxAE4OALZplU0MvvxUORGQaP5Lf+KJYq5KQMu6mtyX7txItiOYk+89meJE+YQ0fKA6wFsNfNnrzTdQ1RNlz2NhIZjX2Oy5ewYupZBatXMD4sHKyG590VUA0I6cMC8H3rDvfRrS5yKYirR8EQCwPBB35j2uDBB24nvs8F5rMRED3ci+CW9ZqLTqmXt/ttmU2O+h1FzOaZ2Ysn1DOJ1IT/qchw4uW8ACIqRCa8fnOOV2WnJxXQLndF9GJRqBMeyCub861kvTU5YUwWyjsyNC4wYcv/AhtdE3JHqiF8rJqMxjKO8H9VBTZP7j+pGcnB1LS9d/1XOQuSWkdvulWoyO5DN1YmtEdSqoWjGLvlHkIOoQau8uZtXlBiLs4FAq6P5NbChq7EVYPl0pn3spKhXvMNbiQPHpiYfxwlVURKqy8lZlxJar+QUzPnLiJCRgnJ8xRxZTf+H7gcpqs90osRE70YQ/si4MuM2HSqoDKyL/a+n+oyXR5y1z4M5yS3Ab15FewUQx6S6kyS+ibiaF1ZjBGOKAOtbeIFHeHjWalp7Ty0F7FQ6tfF5651XNbTmuDjAQKfJzppkGdqHNfg2axAcJh2PPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6512007)(38100700002)(38350700002)(6666004)(6486002)(30864003)(2906002)(6916009)(7416002)(83380400001)(8676002)(86362001)(8936002)(4326008)(508600001)(316002)(5660300002)(26005)(186003)(44832011)(6506007)(66946007)(52116002)(66476007)(66556008)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d7eqiPeV7WrOHZhfLWuh+msNGiHOBtI70pyvJhKPahK+UPmqh+d+S4rJZRDn?=
 =?us-ascii?Q?xf0KL/dqFDT+OUlqGh+ezTFlCW3QXdns9/FRmt9d8xpwkmImmd57JlwN0Mhz?=
 =?us-ascii?Q?isFxWgAf9t2iCKtRzGFlw2B3tMGJL1IWWwjLOx55nGa8aQH4l4WDVdNFnT09?=
 =?us-ascii?Q?mWpIqrfp5y/xpnu+Pr4bjCuKIcIINtfxUb+kfteewX1TEveU01dsW6c1zjti?=
 =?us-ascii?Q?zkhAxZkiSdVbbvbvhh2DevX1C4obrKkj5WGd+6SyLO/6/RQQKGemXZ5FpY4z?=
 =?us-ascii?Q?+uiMvrEcMOOSlH7QidyLuOn8s1RJELSDXzbXi1qBuxZtdCGuTbAVUB6FaBaG?=
 =?us-ascii?Q?tYRWOPQoaAMQEw4wyBKwTm2w1LoeUkoe7LtSNoxDe4TjH1X60PMbX8+Z3UV8?=
 =?us-ascii?Q?c1xZcw/HGWrjqZTNbbqOq97LkWEkcO6Frjwk6yTTMjwV55VzjsmEqJy+1Xd0?=
 =?us-ascii?Q?51NSkBbNBtuKkqMaYDBddOHDiPfpE41tHdKkICkOPURo8/EQ6nAas8BSLFrV?=
 =?us-ascii?Q?foGtrujijeu02UHYtMFSuzVYgxHno7Mnu7Q9SbtVdaNbkrYL11PyG3hZ6mKg?=
 =?us-ascii?Q?BQ76RyNvrfjJYj152XcF5OSlNHl+HzRKuyoyk6PFjhh31Ps0T3XlGCmlx0aC?=
 =?us-ascii?Q?Efe7S74JGGOsOD+sAlLZHv1exJ9Wp5jZK3c4l/pIGbzvhGQsVRmrBjDD3g0X?=
 =?us-ascii?Q?HVVS0c7YhUF46qjljxmjhfgYvVIw2HgZwCI2+p226xe3dhaH3hiolCWnTWm6?=
 =?us-ascii?Q?XL6Ei04FJ1kW2fbfenOEzmG+bCcuMd3mCzCRXMI9ZdDec5iL7AmHIlfPQyIJ?=
 =?us-ascii?Q?WQDOfDT0Ep0SsvTY20qQZccLlP9GKtM/339bsLy+3ut+0vLZjWccogOr8YMk?=
 =?us-ascii?Q?wJL9HRgNBxNxpIvniXetcsO5l+Xfd4ZtPBXNRQXc0RWs1/Y1c6n4Emk/lqBe?=
 =?us-ascii?Q?sOJiH/hPPM9jax+mHmitLQk/Aiig2AJZaW8VLWruRu7oP45hF9pnZAosuRsR?=
 =?us-ascii?Q?O6+/ocQo5+HN0jZ3jfg39W6XovHYhlFhl7ww5bQ61zPoVNl3T5LI/2HNWjmc?=
 =?us-ascii?Q?bUCGhoON7CidU4x2pKph62CaQUy6CxUnSrn89fcbey0gsrCbKW4MsUloWScF?=
 =?us-ascii?Q?JeUmya4xd2nL0Z4OnOvaPEM3H0xOgztdjTlsbwC747PRmSKJpYPfb+jPhYr5?=
 =?us-ascii?Q?tpqLNExIxSaeIoONF8XndZhBaG817FdH70qIBBsT8GBPm13BhguwiUWwOFnw?=
 =?us-ascii?Q?b6BpZ1uDjw5sIT+f8+QAtchy7Z7+W1FOuRqEfKtm2Aw37pNHLlPAl23u9F9c?=
 =?us-ascii?Q?Quwuv+j0W4iRYv0stKrLfFUujZR92QIIs1vwk+DYb4x3uhEs/XLTCd9UEUcc?=
 =?us-ascii?Q?bignh3WKI8HEl9PHTIG20Oq61iKs4ONrJHyt0TfQTuNhp3qmAl8/Xm+NbV1R?=
 =?us-ascii?Q?NIz9v8ONxBNbXP0C0XAtcciVs9MIPJUZ3d2TrhevPmlhZynlSRCyg7tbuol7?=
 =?us-ascii?Q?c0DWwT3wxcmF/kzdJJo3CafDeU7+ozMdrTANMTNOEGSKxRVCSJAUyLmJ4TcH?=
 =?us-ascii?Q?TdARu7g4EtKpUiYE3xiDooj3K7Hx3QgXAEa7v55m9bH9rxu2nbPE9OBGEYgX?=
 =?us-ascii?Q?ZannmZMAB3jAqbwO6h5ukSc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10aac47e-ddbd-4173-2faf-08d9dc083a36
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 11:30:14.5364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qde9EmM9Kl4W+WpLWYnflg8KkWqU+TBldDC6s1ACXcpMBdl3iHsi9b4S3DT5nFObT0a0Zc3/M+mSi7rsKFeVEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1381
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200058
X-Proofpoint-GUID: Gw7BIC-Ie6FDrqbfsDFr7cTXWAvAjzlc
X-Proofpoint-ORIG-GUID: Gw7BIC-Ie6FDrqbfsDFr7cTXWAvAjzlc
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the status of a VirtIODevice, including
its corresponding vhost device's status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

[Jonah: Similar to previous patch, added a check to @virtio_device_find
 to ensure synchronicity between @virtio_list and the devices in the QOM
 composition tree.]

Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   5 ++
 hw/virtio/virtio.c      | 104 +++++++++++++++++++++++
 qapi/virtio.json        | 222 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 331 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 05a81ed..0b432e8 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -12,3 +12,8 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e59f0d7..30ccd7b 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3928,6 +3928,110 @@ VirtioInfoList *qmp_x_query_virtio(Error **errp)
     return list;
 }
 
+static VirtIODevice *virtio_device_find(const char *path)
+{
+    VirtIODevice *vdev;
+
+    QTAILQ_FOREACH(vdev, &virtio_list, next) {
+        DeviceState *dev = DEVICE(vdev);
+
+        if (strcmp(dev->canonical_path, path) != 0) {
+            continue;
+        }
+
+        Error *err = NULL;
+        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", &err);
+        if (err == NULL) {
+            GString *is_realized = qobject_to_json_pretty(obj, true);
+            /* virtio device is NOT realized, remove it from list */
+            if (!strncmp(is_realized->str, "false", 4)) {
+                g_string_free(is_realized, true);
+                qobject_unref(obj);
+                QTAILQ_REMOVE(&virtio_list, vdev, next);
+                return NULL;
+            }
+            g_string_free(is_realized, true);
+        } else {
+            /* virtio device doesn't exist in QOM tree */
+            QTAILQ_REMOVE(&virtio_list, vdev, next);
+            qobject_unref(obj);
+            return NULL;
+        }
+        /* device exists in QOM tree & is realized */
+        qobject_unref(obj);
+        return vdev;
+    }
+    return NULL;
+}
+
+VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtioStatus *status;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIODevice", path);
+        return NULL;
+    }
+
+    status = g_new0(VirtioStatus, 1);
+    status->name = g_strdup(vdev->name);
+    status->device_id = vdev->device_id;
+    status->vhost_started = vdev->vhost_started;
+    status->guest_features = vdev->guest_features;
+    status->host_features = vdev->host_features;
+    status->backend_features = vdev->backend_features;
+
+    switch (vdev->device_endian) {
+    case VIRTIO_DEVICE_ENDIAN_LITTLE:
+        status->device_endian = g_strdup("little");
+        break;
+    case VIRTIO_DEVICE_ENDIAN_BIG:
+        status->device_endian = g_strdup("big");
+        break;
+    default:
+        status->device_endian = g_strdup("unknown");
+        break;
+    }
+
+    status->num_vqs = virtio_get_num_queues(vdev);
+    status->status = vdev->status;
+    status->isr = vdev->isr;
+    status->queue_sel = vdev->queue_sel;
+    status->vm_running = vdev->vm_running;
+    status->broken = vdev->broken;
+    status->disabled = vdev->disabled;
+    status->use_started = vdev->use_started;
+    status->started = vdev->started;
+    status->start_on_kick = vdev->start_on_kick;
+    status->disable_legacy_check = vdev->disable_legacy_check;
+    status->bus_name = g_strdup(vdev->bus_name);
+    status->use_guest_notifier_mask = vdev->use_guest_notifier_mask;
+    status->has_vhost_dev = vdev->vhost_started;
+
+    if (vdev->vhost_started) {
+        VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+        struct vhost_dev *hdev = vdc->get_vhost(vdev);
+
+        status->vhost_dev = g_new0(VhostStatus, 1);
+        status->vhost_dev->n_mem_sections = hdev->n_mem_sections;
+        status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
+        status->vhost_dev->nvqs = hdev->nvqs;
+        status->vhost_dev->vq_index = hdev->vq_index;
+        status->vhost_dev->features = hdev->features;
+        status->vhost_dev->acked_features = hdev->acked_features;
+        status->vhost_dev->backend_features = hdev->backend_features;
+        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->max_queues = hdev->max_queues;
+        status->vhost_dev->backend_cap = hdev->backend_cap;
+        status->vhost_dev->log_enabled = hdev->log_enabled;
+        status->vhost_dev->log_size = hdev->log_size;
+    }
+
+    return status;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index aee0e40..ba61d83 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -66,3 +66,225 @@
 { 'command': 'x-query-virtio',
   'returns': [ 'VirtioInfo' ],
   'features': [ 'unstable' ] }
+
+##
+# @VhostStatus:
+#
+# Information about a vhost device. This information will only be
+# displayed if the vhost device is active.
+#
+# @n-mem-sections: vhost_dev n_mem_sections
+#
+# @n-tmp-sections: vhost_dev n_tmp_sections
+#
+# @nvqs: vhost_dev nvqs (number of virtqueues being used)
+#
+# @vq-index: vhost_dev vq_index
+#
+# @features: vhost_dev features
+#
+# @acked-features: vhost_dev acked_features
+#
+# @backend-features: vhost_dev backend_features
+#
+# @protocol-features: vhost_dev protocol_features
+#
+# @max-queues: vhost_dev max_queues
+#
+# @backend-cap: vhost_dev backend_cap
+#
+# @log-enabled: vhost_dev log_enabled flag
+#
+# @log-size: vhost_dev log_size
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VhostStatus',
+  'data': { 'n-mem-sections': 'int',
+            'n-tmp-sections': 'int',
+            'nvqs': 'uint32',
+            'vq-index': 'int',
+            'features': 'uint64',
+            'acked-features': 'uint64',
+            'backend-features': 'uint64',
+            'protocol-features': 'uint64',
+            'max-queues': 'uint64',
+            'backend-cap': 'uint64',
+            'log-enabled': 'bool',
+            'log-size': 'uint64' } }
+
+##
+# @VirtioStatus:
+#
+# Full status of the virtio device with most VirtIODevice members.
+# Also includes the full status of the corresponding vhost device
+# if the vhost device is active.
+#
+# @name: VirtIODevice name
+#
+# @device-id: VirtIODevice ID
+#
+# @vhost-started: VirtIODevice vhost_started flag
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @num-vqs: VirtIODevice virtqueue count. This is the number of active
+#           virtqueues being used by the VirtIODevice.
+#
+# @status: VirtIODevice configuration status (VirtioDeviceStatus)
+#
+# @isr: VirtIODevice ISR
+#
+# @queue-sel: VirtIODevice queue_sel
+#
+# @vm-running: VirtIODevice vm_running flag
+#
+# @broken: VirtIODevice broken flag
+#
+# @disabled: VirtIODevice disabled flag
+#
+# @use-started: VirtIODevice use_started flag
+#
+# @started: VirtIODevice started flag
+#
+# @start-on-kick: VirtIODevice start_on_kick flag
+#
+# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
+#
+# @bus-name: VirtIODevice bus_name
+#
+# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
+#
+# @vhost-dev: Corresponding vhost device info for a given VirtIODevice.
+#             Present if the given VirtIODevice has an active vhost
+#             device.
+#
+# Since: 7.0
+#
+##
+
+{ 'struct': 'VirtioStatus',
+  'data': { 'name': 'str',
+            'device-id': 'uint16',
+            'vhost-started': 'bool',
+            'device-endian': 'str',
+            'guest-features': 'uint64',
+            'host-features': 'uint64',
+            'backend-features': 'uint64',
+            'num-vqs': 'int',
+            'status': 'uint8',
+            'isr': 'uint8',
+            'queue-sel': 'uint16',
+            'vm-running': 'bool',
+            'broken': 'bool',
+            'disabled': 'bool',
+            'use-started': 'bool',
+            'started': 'bool',
+            'start-on-kick': 'bool',
+            'disable-legacy-check': 'bool',
+            'bus-name': 'str',
+            'use-guest-notifier-mask': 'bool',
+            '*vhost-dev': 'VhostStatus' } }
+
+##
+# @x-query-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: Canonical QOM path of the VirtIODevice
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioStatus of the virtio device
+#
+# Since: 7.0
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend" }
+#    }
+# <- { "return": {
+#            "device-endian": "little",
+#            "bus-name": "",
+#            "disable-legacy-check": false,
+#            "name": "virtio-crypto",
+#            "started": true,
+#            "device-id": 20,
+#            "backend-features": 0,
+#            "start-on-kick": false,
+#            "isr": 1,
+#            "broken": false,
+#            "status": 15,
+#            "num-vqs": 2,
+#            "guest-features": 5100273664,
+#            "host-features": 6325010432,
+#            "use-guest-notifier-mask": true,
+#            "vm-running": true,
+#            "queue-sel": 1,
+#            "disabled": false,
+#            "vhost-started": false,
+#            "use-started": true
+#      }
+#    }
+#
+# 2. Poll for the status of virtio-net (vhost-net is active)
+#
+# -> { "execute": "x-query-virtio-status",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend" }
+#    }
+# <- { "return": {
+#            "device-endian": "little",
+#            "bus-name": "",
+#            "disabled-legacy-check": false,
+#            "name": "virtio-net",
+#            "started": true,
+#            "device-id": 1,
+#            "vhost-dev": {
+#               "n-tmp-sections": 4,
+#               "n-mem-sections": 4,
+#               "max-queues": 1,
+#               "backend-cap": 2,
+#               "log-size": 0,
+#               "backend-features": 0,
+#               "nvqs": 2,
+#               "protocol-features": 0,
+#               "vq-index": 0,
+#               "log-enabled": false,
+#               "acked-features": 5100306432,
+#               "features": 13908344832
+#            },
+#            "backend-features": 6337593319,
+#            "start-on-kick": false,
+#            "isr": 1,
+#            "broken": false,
+#            "status": 15,
+#            "num-vqs": 3,
+#            "guest-features": 5111807911,
+#            "host-features": 6337593319,
+#            "use-guest-notifier-mask": true,
+#            "vm-running": true,
+#            "queue-sel": 2,
+#            "disabled": false,
+#            "vhost-started": true,
+#            "use-started": true
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus',
+  'features': [ 'unstable' ] }
-- 
1.8.3.1


