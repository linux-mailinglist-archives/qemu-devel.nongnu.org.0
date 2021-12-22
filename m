Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CAF47D800
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:51:22 +0100 (CET)
Received: from localhost ([::1]:46756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07dx-000257-L8
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:51:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V6-0004Y1-9G
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:10206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07V3-0008KE-FT
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:11 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXssJ013627; 
 Wed, 22 Dec 2021 19:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=mVNZj6+391VEXWnHNDe2QH4lp6d1nUs+ZVhUEbcf3rY=;
 b=MlZqueo5rAbz2Dg9HGKHwORFDdzJSPGO/FdBrm4zU8CLacwF6u3dCtmqsd/KiUkERoL0
 YgN92hW4yWCNoDk0dhUUlnSZ8FlArq9ENQq+t2YDGyVg6EIj3+Htmv+5yr8f4d5Ru0ZQ
 5D+W3DMS+g82rlzcf7qqJlfVhQbEk1uioZQiJIcOem9oDagqaoxDCeL1G8Vo2Hn+Lh8c
 7zmu5sW0RmKyVScGEMt1iYZobNrFPu1fhCP+TsOKlx36BZqC/Ks7kvMkC2CIO+gYT5AG
 FP7XUbLVhQlMS9HaZWtnma/w6YkRfgs7Ye4DCDb/6ndd/rGyopYKXMrfrNDQtPwekIEJ RA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d46rm0tk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJfCeW049074;
 Wed, 22 Dec 2021 19:42:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3020.oracle.com with ESMTP id 3d17f5rfmu-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDKxBMxgCXUd4Q+vNc7zdsEQZl28s9qRuj+e2RHHv7gQTWbNVfcZiF9IDunQuyDd8T+xtnaQnG53FUBimwysvFxWhyaKIsXfyrBpoPpG1+ZOdE+DtVoBYdh1TKih9CPXw0dic/G3ygBHagukWA1w3zaw5ZnlFCQaaKrYCXyyV9aEma5L4WNBXBl2O4vNFjrG3bOAW5IMJq1qT27ksLVBuz/n2xN+ePnIUUnffi8vgb2/heHdFEp0p88u9O3uGhFDHH+fLWLOyeH9rgb9J4sK54J97aqeEvyCM9hPJDV7MkofuLdQnK6N5QEx/ZsasT3oPiqeU+Vzk/pW6bLbiuLk0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVNZj6+391VEXWnHNDe2QH4lp6d1nUs+ZVhUEbcf3rY=;
 b=IgJToZpIkhRJljhAHYF2tyae4PcWb5K18jMieQFlhGohZBcHTt6sFed7yWczC88yARXDJCSMLXKgf3ZIhOXgPEQjB6AEoFMHPnGqNm0r0l8fQtS5eI+GAOYB17xczFFBdX9JcPNW1Zv7rA7pZ1x+y1x2nzFag4m4xf6WzDxNQw51gKTJGyqoDZkMaKIa7/GvFv2DqbGC1Tv5Ky7OIYGzI/IHsD0+PGR5+Clbq1wWecoEJnjI31GNfk64p3ilGKPiZAcAYEUJkiXw6SOYO8kLCf0zre4MsPBuTjSAG8yLpLK5cj8x8zm0QKv1oZipwGDAQu8nKte3IjsgHLRM7aSkSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVNZj6+391VEXWnHNDe2QH4lp6d1nUs+ZVhUEbcf3rY=;
 b=UV0DTm34F26Z7XUG2OK3H492jDQY3KmzJzH8WqSMXhlN+g1JiavVx7iFkbxiNCsTguW6gjxd/Lz5RZTIgpfmjC2pYDbvlYMR+XDwFHG3s1BWiuQ9+QvmsLuo7nMZvdixclvlgwmV3cm+B0i66/1CfpYJiuk/Tkrgtge1dq9912Q=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2888.namprd10.prod.outlook.com (2603:10b6:a03:88::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 19:41:56 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:41:56 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 04/29] migration: simplify savevm
Date: Wed, 22 Dec 2021 11:05:09 -0800
Message-Id: <1640199934-455149-5-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 600cfcfb-3779-4464-aaaa-08d9c5831c55
X-MS-TrafficTypeDiagnostic: BYAPR10MB2888:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB28885F153483214D3276D1E7F97D9@BYAPR10MB2888.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dI7RO30yq0f58Vjyf+GuuplGbOBSh/WOIyuE8uSzvXNiolbRu5tr2xJrfdV6zR3f5D+0M0dESpnPfgl0iwBKgu30MVpiNg42uJ5fmiEyugCk5V0UX9kcAzf0wMRxC9GoeopCxXVPbPdC0bCWBQwVUgSrRor2R3XNel70PmvSV2E1rHDy7f2Fgp2gdAvNX+1WnBkvz+uX0wfxldvkMbwlAB9uAFQ9XXXcxLm8EvsURnG7/qO9BR/3Ac83nEjR0ctRbpWW4AoimCI8McfHcsABmjYbByvDuLdS4PrKB/tPVQ+TpLN2dpL4kbn37nznEW8VOtjDL/S+UlyfmKDJbWnMhWkVLnAN83im2IrD7yOM/CkUI2IUQM8HnaI0a1JWeCYgB9BHzO2UEEfZn421MRoLWRe1QWUCu94c5RPVz+j7+aesqXh+qX8S04gma+lxD5LzAsSjbXVMltrA/YTIVaE8TePqM+j+QS4rO5JK0oJcKWWXOXZ5PjWEMspiYpi0QpXQ9tptOHEm4fZbLRtoRrJx/KcpoT4YB9Lnw2qertk34AfPZioctHL8QK5/37HY744JnuGYUBzjjBqzUgVDp52LO+wdOZ8qwxTDpLOBBFJmIF96GpiXw0B65CBz4GvPtxiOb3OqWbwKvCkNGITd3iWIpZereA1XndkQ8lFHU3a0GfnCzAaON+y8yWCNlgHkDUiUGvDYGQ/8N+ae9s94MAPcVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(86362001)(66946007)(6486002)(6916009)(6666004)(36756003)(4326008)(316002)(52116002)(6506007)(186003)(26005)(7416002)(38100700002)(66476007)(8676002)(2906002)(8936002)(38350700002)(6512007)(5660300002)(54906003)(83380400001)(508600001)(2616005)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZneIu1fwDNVUQOdHIIEZXYanOOP2Gpj1k8qUwp1JmYY1VPPveuW0ppgEvdQN?=
 =?us-ascii?Q?dFTzEjjGsXKhloNsrHEq1FHnK0L3NjLmefFmgBEhLOIdTSZnriwbgQQAhGLW?=
 =?us-ascii?Q?AIeFwAJV7nyz6xFl6ZO4vccMyC3K1DF+mP0gO8ZPpq33Gohqk+DvGT2dofpd?=
 =?us-ascii?Q?DDmpRDQFsCuomU4RNT7BWOLtUYhAgNvI7vMyCwdX5yVN+sZDLY06entwARdf?=
 =?us-ascii?Q?eXga6XfVyK8MRQ4Pk4wRoXYFuh4H0ZIoKYOhYDQB5ZzMmo4azON8TUfynBqw?=
 =?us-ascii?Q?Eq6065qkS9rxzJAyVS3Pm/0hUunw4jbaEVqH7SoREMZKf4Fj1Bhg4b/aXXKG?=
 =?us-ascii?Q?+LrE9fz6sNTJhmcJOqe5tvMRHM/s4ch3dpikrl/JMR28wzFYkLJD3CD5RoM3?=
 =?us-ascii?Q?yV5uBDlTPHhLadzvGjM/6UVUvFtKB3YJOtOrB33pMY+cDwKYYU8XSCpbcMh7?=
 =?us-ascii?Q?4Z16gW0vRtfO5amZ8coUO2ccwIulWAKfQ7DGvVknU+pMUaiWRXhR3dF6WIWo?=
 =?us-ascii?Q?ophpoIVisGPbIuR9+ZwQO5gFc4ML6xmLuo9lOl0rn6hY+356seKy4BBhuK1S?=
 =?us-ascii?Q?wsoVkTSwrNC0qcgRABxPlrwzryOEYp4Tu4ZUcJrGHANVWOqtF0sif2Qtz+Fd?=
 =?us-ascii?Q?MCO96+ytx9GbT+G+AJ8fiOAFIlPSmkoiJvzOyzfolIEbpD0piYwnOL5U1GcX?=
 =?us-ascii?Q?gsRLhay4x81kWvrrQ4ZnzvvvdYIH5q/Rn/PfnCq01JpPpTOh+/QIVfoKRHN4?=
 =?us-ascii?Q?zc6SsApm88UFXcVJ0e3VoXQ5qRXqNx3yInJwtNnFeEHoa0rpINceG3f4gu4B?=
 =?us-ascii?Q?dJIzm/Fdfq6grdoId5BrZ2caDBmF+RuSUgGVwRYKr4I4zDVlV9SnAp2Jw7mN?=
 =?us-ascii?Q?RQGWAxPBBv9imG8GxoCNszF6Ap/Ys+N/wikMhzTwjnIDKbTaE1WTwcI2Qpte?=
 =?us-ascii?Q?QfXKsqut8uSCnsnj2ZvZvHkKhtBWI109fShKqnyI+lRxU9fJF5c9O5zZsNWQ?=
 =?us-ascii?Q?JjsTeBlgLw+6dPGXMMGcYpGhtUhfZplXQ6s39EWtIXlbYNtl2pwsgVP+dmVn?=
 =?us-ascii?Q?iU770g/Dq4QLmNKgNfrOyT40OQ2/sKaRuVdYAo0rcnU6NzHuGAIMzM04NAl4?=
 =?us-ascii?Q?4nnmYttaQiUnDqVBbsV3ni2FL6ZGsFtlSmQphgsY+48YS5Ji+8oczUd+rTlt?=
 =?us-ascii?Q?otT33oi6eFQ8BK740IsiIlu9bFb6p0r/iovJNwIQG1UCVOxaapX3PjrgL1yZ?=
 =?us-ascii?Q?ry7YTMlimRIX43RPJ/lLmGThmX/Pp10ugXXXVNhPYyjApIj0Fr6OLbyvx6Gk?=
 =?us-ascii?Q?LoE1nndF2p0L+ZSdCyH2Hn/fCXswOAA7NcFnc34k30iGvq/zdW1yaO3OBWCR?=
 =?us-ascii?Q?x+hraMN7OWmKDTXSJiwjCYZpAPJmrT/R9uXT1MB676yu6P/1KtivHjOsyJ8f?=
 =?us-ascii?Q?3aw9/tQaj2pdWxU7UUGyT/crnXDGwbYeq3Tqop7QwjMFJ1w7T+kNKeGfae9P?=
 =?us-ascii?Q?PkJqacaqu4FrtCDmpHM5GnzO1Rm7j9lA7T2dLNvJdKPIxup8c8brw/LRv6mh?=
 =?us-ascii?Q?VlqQzRMYzTt+LqS+mFZqMf1yYJ+rDFr7VJRYOkxvdzJYOBrii2JnI7vCCcd1?=
 =?us-ascii?Q?bSaz0VENNGxp3pICeopoqtTPSzBN6jPmrO0BUDrZk0WXRKbUf46wdbbOuroA?=
 =?us-ascii?Q?Wp05yQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600cfcfb-3779-4464-aaaa-08d9c5831c55
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:41:56.0305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SptihCvMcidC1Ef3Uwi3D/prfy0ERs8GOoNB+eEBHrZZa/fN/vnV5Q4djZ3MjshEDixGE+ixly/mNU7/og5z5+FqGogf1tpsW3YTQthyiE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2888
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-GUID: MwRESdz9zFcZFI-0vYa3dhsy44xn1O-O
X-Proofpoint-ORIG-GUID: MwRESdz9zFcZFI-0vYa3dhsy44xn1O-O
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qemu_file_open to simplify a few functions in savevm.c.
No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/savevm.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 0bef031..c71d525 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2910,8 +2910,9 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
                                 Error **errp)
 {
+    const char *ioc_name = "migration-xen-save-state";
+    int flags = O_WRONLY | O_CREAT | O_TRUNC;
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int saved_vm_running;
     int ret;
 
@@ -2925,14 +2926,10 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
     vm_stop(RUN_STATE_SAVE_VM);
     global_state_store_running();
 
-    ioc = qio_channel_file_new_path(filename, O_WRONLY | O_CREAT | O_TRUNC,
-                                    0660, errp);
-    if (!ioc) {
+    f = qemu_file_open(filename, flags, 0660, ioc_name, errp);
+    if (!f) {
         goto the_end;
     }
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
-    f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
     ret = qemu_save_device_state(f);
     if (ret < 0 || qemu_fclose(f) < 0) {
         error_setg(errp, QERR_IO_ERROR);
@@ -2960,8 +2957,8 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
 
 void qmp_xen_load_devices_state(const char *filename, Error **errp)
 {
+    const char *ioc_name = "migration-xen-load-state";
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int ret;
 
     /* Guest must be paused before loading the device state; the RAM state
@@ -2973,14 +2970,10 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     }
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    ioc = qio_channel_file_new_path(filename, O_RDONLY | O_BINARY, 0, errp);
-    if (!ioc) {
+    f = qemu_file_open(filename, O_RDONLY | O_BINARY, 0, ioc_name, errp);
+    if (!f) {
         return;
     }
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-load-state");
-    f = qemu_fopen_channel_input(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
-
     ret = qemu_loadvm_state(f);
     qemu_fclose(f);
     if (ret < 0) {
-- 
1.8.3.1


