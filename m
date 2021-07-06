Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD43BDC02
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:13:14 +0200 (CEST)
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0odF-0007oH-Ob
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK8-0002B5-RN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:28 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK6-00087h-SN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:28 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GpkBc007364; Tue, 6 Jul 2021 16:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=+vyo8cyFeJn4HRpXZj3DzYe6S1G5SWpclntcSWRLX3c=;
 b=dHaiRPVCy/lR3L+uVE3b3EGAhSF4omWg5CG1hVa0zNrqWU+kll8zh7YFDG1uFOXRr7Cf
 LwhXu9h87TIipF6tAirWHyE+vpyAYWg6nOSKACvq900Fcfd2jEG8kEjbrIxZZV3Tib5N
 JFhHj2gVdVSTbApNgUQTv75sMEi3zogjm7FbfFg9/ZpAnHLop7B4liaf2J3yjcta4dtk
 3T0VB8KEYNN2swRwWWOTLu0Rh9aJDSKjxaV1oJ9ERJytqHmtamECy92aC03xewOjA46O
 mX/MBhfH4rzcNrsVB2oLQzwFm/jKhJwrqs02zL2yy6mLkIbRKDcKC+BDzPFgPbIllyxT Xg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39kw5k32g8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoWZH084855;
 Tue, 6 Jul 2021 16:53:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3020.oracle.com with ESMTP id 39k1nvcqsd-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbPcOnIpE9Osq0FwbntzcDFDtQekH/ZX4UKF4UNk6Gn1ReRXyVBqp+ZL6o/qljHJGhz83uCS4+eMSPjC5ZH+v7yrtiFTsRCJLW1KV2iCli3jBcGTYXqom8MjtwmQIwAp+m6jG2AFocKpV1AD71b/KdUcmOi+u8fageHBWZRoUMDGJrY/ix0huDIWdJM9CgL6+AMTc3pTXgj2zuvzCiQtbOnJgBzlSQje9FDoOm4sI/Rygy9FXeeERe1vz/9vOD9iWx55TkgDtFt0onKz92idzEz/ZOkMhrLI+IXIIUYrS/bxhUmKmsai7i6X5PBr8XCzdxbpPw3Z672UoCIEt5r0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vyo8cyFeJn4HRpXZj3DzYe6S1G5SWpclntcSWRLX3c=;
 b=JXHMQ7qja9jh3OY10lhbGzKDyjSY4U0dSZzTnICVXrCyWe32M1mSzscR0f52a0Y/7plNrVadY2WezEbqpKK17HwUeHFhQ9dmqTjvSX3vG74XsA1I+7ruzTJT4JbJBYEefn+yfegCdKeQktu5DP4U/keU4qUKciXT2gxyqwBDATIEla2aImDCCIMYtUiKinYAXWz9ef5JoVRZvgK7nUHu0ayf7xrm4/x05N9B6zk/YyE57So0/b5XaLJNHgCVhwcvfoGj8trG/h4SY2oniuK4MtlNKNKVSSkbtyxK/mE+Krbcgh9p5WgGQM1zKFFoX5ClqwG6BrMO3JxXq/tFXivWzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vyo8cyFeJn4HRpXZj3DzYe6S1G5SWpclntcSWRLX3c=;
 b=c1XNkfhqwrGzhtwc0bxxvR/PiPSs5rwiDB8KDJOnr1ZuA02F9PgrjeujtIVH7CRcWqj9B7+CQVRmg5s50Q0Tamrwh3RSEpsVhygmdFzxb24IVTEL45G6KJXZ9KYw3s7K1Ou90vTXmJf+XG8uNBCHhJkR64UfVuQGdCEUxWqcE+g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4416.namprd10.prod.outlook.com (2603:10b6:a03:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 16:53:22 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:22 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 25/25] simplify savevm
Date: Tue,  6 Jul 2021 09:45:56 -0700
Message-Id: <1625589956-81651-26-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:53:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46f3590f-dfd2-4ea7-3314-08d9409e903a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB441684F2DD00C2C6A1DAD567F91B9@SJ0PR10MB4416.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Frr5E+Ra68CXt7U14KcSEGCxg6dj2HXVG7KwmdfXkR4IKmqOM2DpNTay5G/A306UokmcV3vtHqxDRHwHLjS0YLFVD/q7WnFaCEhNVZIZ3HfvtXpQPbN6TehRORE+pLV5wu9FrP3kcGZKh2fG+53xXqo3Rb+Upfr/8bgqgZ8vBsUfiwPlAwhv/wijV6Rl5CE5KT6uUWi1HgKp/yKUk4etCoVAUrb/ZxLsmJPyFjQohmUcPhUDvtHyE054uEQpb7CU5Ga/zMnZkk1j/nnjNUTJSzxo8Ra0iN8mdnY4mwY3eBlcFMADmbpgIgeYWqdZTBgc1yCxji2/vSlhxM012S2YYENlqzI3OSkuERtK6hnA5zFQ8dJ9Q1tDzON4zT/gfXO2mGXxalC4cehvkidmo712CSwrdS1cvB1Yo1aq8yjHquLbPhU+GP10RseXpZmNu3mImJ22B9p6Jw0Fo3wNz6cgwyqlL4eqOOSXsZGqKT6CTw+mMLTadurOOEoMNonzi/mjA38p/fuss6f9vXa3BolqTMcRZ9NhZYPTZlmlzYRVS0h8UDv5QuFMdYUd8rPlpTa2G+Zmg/L72V4bppH0cgedzqa15mCL3FTG6lDuS3Q5NbHiFjUayrHYP4TE+BS3vk2wBDDpaNkQipDKNb+J7SF7LlYXPEbLLziIYxIlVIHWTf3jvi4V/x3ZvJ4mviV5/sjRB56xS9LU8Dzq4/5VV5fmdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(54906003)(83380400001)(7416002)(38350700002)(5660300002)(8936002)(66476007)(38100700002)(107886003)(4326008)(2616005)(86362001)(478600001)(6916009)(316002)(8676002)(7696005)(52116002)(26005)(956004)(6486002)(66946007)(2906002)(6666004)(36756003)(186003)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BvStjq1Q0tKyibjWuzUqc8NEmP0DzZ7OIP9qOe6yxnnWeTVf9I2TAmvIaE8G?=
 =?us-ascii?Q?cqQao6nly4zWYQGwFqmFCMYdagvv9IxArywaK0QIy0qxpVeMpNHSSF2gPtja?=
 =?us-ascii?Q?nmGa/xQ+df7kQe76yPWePr0ABdRhew98jtu1g03sqGWfkRwDPd6Z64cp+N7B?=
 =?us-ascii?Q?JPsy+T67zYjclt3uWRqOulVpUD2dI3zZx1hVrXTfnDm0OX5KuoaAybpLvp8q?=
 =?us-ascii?Q?7EtXVMuqJupTsSItBDDifFo2fjlGXTUz6cau11qhInTHfMKl1vOldHPe3BcP?=
 =?us-ascii?Q?cYXd++PqIgWT/F/1Jx2lyWU4triQ/gK1QQl6Cb8TK4OQ2QaEGrtsqLDauxXf?=
 =?us-ascii?Q?cJ1/Rm6J8Nc4NYeqBB2lURgFMoAxyYy/i5HW9GvOO6K/VnoLVltjC9XIDYcM?=
 =?us-ascii?Q?DB7EXFquunlXc9SpPnquLO5FnzAo8Ab6sllxEGGM1au2vJsenCjdmSSXNSeb?=
 =?us-ascii?Q?7KCwKo5DVWa9FfCs4E7MjoDXw52KekIvwYbAqKTrLm1iGpdGRtTzYxLxb6m0?=
 =?us-ascii?Q?pMNMHguZzlpKGU5xhlm74oXv2BzVZv0uxeRZnSQoN6rlnEJYMfv1avX16/34?=
 =?us-ascii?Q?PqDK5bFDIJUvkrbP5inWTRRLc24KmyfmN3wMb/sPRsKaK6FeWuvJL5vC68Q6?=
 =?us-ascii?Q?b40TlykZM3yD7mFhiRgwf21EjaCdDXlurecbgyTe8N2haS6Gbx8rnXO+2J9+?=
 =?us-ascii?Q?Ii8kQ1xHUG3Y+zheKNUIdN03ZImOuHrr8Ab7CyC6M7/b7DV20kIqACAGjIH6?=
 =?us-ascii?Q?HVeewEezJwE4Qa1gdvrPyVYmCj4BHQ1Ec4J/vDu6gzFq98f4Fw/KxfXdD6nR?=
 =?us-ascii?Q?WW/9wk3YRPtPM8JHaGFC8074ZKAVJd6gdOsKuTEbKtVAhujts1hVT8DsGh0q?=
 =?us-ascii?Q?uqwQHcrZ9W2STTV4iYasVmcIefyub5wvSLqh/NHD1FupGGIKZJG2ilmDNYFd?=
 =?us-ascii?Q?isr2axAZvdykUgyZ4rU+tV84qwqX7iz1RUh20pWI08NYqY6URbpNh8LTLbHL?=
 =?us-ascii?Q?ktP8zz44rZ88zqKSCKvpU9tD5g4y+ZscjPWJcPAhQj3tTPAAcriJ60oZbMf0?=
 =?us-ascii?Q?Eg/AlPg2V2oNph23Q6N6/7elBNMnlIosNKMoIiRFvzrkTHqH4e68F4Bo9Mfp?=
 =?us-ascii?Q?dMdml/B0qSQWeAzlhr00GkQ3xDcbOw2xDUO5e1flq2j7CJGPiKy8ihATay/v?=
 =?us-ascii?Q?W/n3FdBoOvwUglM/Nr86y9i+3qiO8Kzo0QdrOO8nZ6UNoU+6F4Ctga8kVZjf?=
 =?us-ascii?Q?bcW/xnbIO7wkc1hiZXH9yPjofALAYOl0s405u5lLl7Er80l5evsNk2v5NnVt?=
 =?us-ascii?Q?w4ua85px8mV4ha6BdixmCpJo?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f3590f-dfd2-4ea7-3314-08d9409e903a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:21.9418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBi38LP4KSsVmzhwOqY+I7gDWa1WL74VQmtm9GfZ21QsmP7yUClTpr3JfqnZ/sSsoK6+CsDm+7YgmdjP5BJcgzIXeF95t9Uza4H5nhj59lA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4416
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: cxURtPg00_S7Q2EaVTTflopaWYsjQkYA
X-Proofpoint-ORIG-GUID: cxURtPg00_S7Q2EaVTTflopaWYsjQkYA
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use qf_file_open to simplify a few functions in savevm.c.
No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 migration/savevm.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 52e2d72..d02bce2 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2904,8 +2904,9 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
                                 Error **errp)
 {
+    const char *ioc_name = "migration-xen-save-state";
+    int flags = O_WRONLY | O_CREAT | O_TRUNC;
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int saved_vm_running;
     int ret;
 
@@ -2919,14 +2920,10 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
     vm_stop(RUN_STATE_SAVE_VM);
     global_state_store_running();
 
-    ioc = qio_channel_file_new_path(filename, O_WRONLY | O_CREAT | O_TRUNC,
-                                    0660, errp);
-    if (!ioc) {
+    f = qf_file_open(filename, flags, 0660, ioc_name, errp);
+    if (!f) {
         goto the_end;
     }
-    qio_channel_set_name(QIO_CHANNEL(ioc), "migration-xen-save-state");
-    f = qemu_fopen_channel_output(QIO_CHANNEL(ioc));
-    object_unref(OBJECT(ioc));
     ret = qemu_save_device_state(f);
     if (ret < 0 || qemu_fclose(f) < 0) {
         error_setg(errp, QERR_IO_ERROR);
@@ -2954,8 +2951,8 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
 
 void qmp_xen_load_devices_state(const char *filename, Error **errp)
 {
+    const char *ioc_name = "migration-xen-load-state";
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int ret;
 
     /* Guest must be paused before loading the device state; the RAM state
@@ -2967,14 +2964,10 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     }
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    ioc = qio_channel_file_new_path(filename, O_RDONLY | O_BINARY, 0, errp);
-    if (!ioc) {
+    f = qf_file_open(filename, O_RDONLY | O_BINARY, 0, ioc_name, errp);
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


