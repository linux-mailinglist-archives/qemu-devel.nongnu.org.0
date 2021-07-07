Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552803BED72
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:51:08 +0200 (CEST)
Received: from localhost ([::1]:44098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BhT-0002Td-Cu
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKs-00011B-6h
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKp-0006w8-Ah
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:45 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCNlT029342; Wed, 7 Jul 2021 17:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=33ac1/KIJzNlxDFVBmbSwz4lG/xFXh8i0U5a+3z26Vw=;
 b=WWcGrBZ6roRsPL4WWoPvJKBuYh6DJxgCDqMY1ZQ01/aiKRSWDdoAcleZkyhJp5m/C6RM
 JtBJkY46skmzd/FsfNSB4IaHruTYTTmOxrHP58Pn4q8jlwcO2YhCrRJ7ovI4bTSfHLdr
 +Qr3M28wsrvdjANzxoTwiu96D4c3jyxj6fU35JciO6F+mU6TEAa8wAjXAs2U0iZZ2Rgs
 KuFvPDYf2JNuAuHAUYkFGD6N1yZB8pqvaeVx++iL6M7pUaAaIoZVN6RMmMCfCOSaqXsb
 bz3S7rEDvbczAuZCCYHrETVDMCCA7uJmPJUSAig5qjUoWHRdtw7vIgAno3txyyYy7FPB rQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aacpbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAYvf155353;
 Wed, 7 Jul 2021 17:27:28 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by userp3020.oracle.com with ESMTP id 39k1nxjvcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFSySMRLwSXuSOzp9dkjOLl0At9k2AfaM6mbQpZug1EJ77IZJbsPU5ZEUeIh4bkGEoqweZhTliFzfDexspKePIh7OnNSrRAvLclPrvQq6gv+SlGwDk8k227u2jz9O0GfHLdKy9gt3xMz7ofLyfufsCk2YFbtCNBo6uw2vQ13L19Mc9ofxj0rdGoHRrkmsy7Cb1dFHw7qE2+cWKFMbrxzUBsNzMu6+GbwzjCKLedbJ3sBrzCGO1jJggdLnpbZztDRnj0/gXbAqF36wyUC+vY4ObLV1ILOC2kL/XL8/b90a4vKliO0tgNjJh9jkgTifik+kl9qXfijZV4cIGnfkfXfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33ac1/KIJzNlxDFVBmbSwz4lG/xFXh8i0U5a+3z26Vw=;
 b=EUs3096Fe7CgSPpY/P1vtPhLFJAU0O3G8OH6EseX9IVwjBvAnJx4P9s6TBWxjCOE6pvokVBSmkUdOucmZluPCzXUBo/Ci0K3MIjhad4/9FNdAZzD/5xkwrtTqLqjdxwGRiKHWCOGN6Bp/d9KnqNJfPhqMSJvtAG1u6G8fMj0pOnBk0kSp4b0pKHMkeoMfstGjj6xwfkYfY3GIKepMM7+S0W1wQUKQGfdy4GQvnEOrmWvCn0ojI++cBQFm0i6xT/mCgzSsVaqOKDEik2aBm3v2ulOAxv1oSzAKHe8aOdodTxAjztrtJxHOz5oJNeCol0AjgbCsU4cks471Vy8d+4SbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33ac1/KIJzNlxDFVBmbSwz4lG/xFXh8i0U5a+3z26Vw=;
 b=ytfCXuok3Rj33/kfeJkveLeGA8eWgakAAxvIUtHsuS9lPzkmHeaDVEvg71bAUIG5gQbm2rhi6rmN3c42fPf8xNGjilWks0V9Uo3mACvwS3GkgWvoqPIdGsGt5pMRYLpCpfZ6EQ0qU/ZpETmXUWYC2FuuTX5cujqPP9vh7oTDuig=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2677.namprd10.prod.outlook.com (2603:10b6:a02:b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:24 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:24 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 25/25] simplify savevm
Date: Wed,  7 Jul 2021 10:20:34 -0700
Message-Id: <1625678434-240960-26-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 278e89b9-a1a9-49c5-aed6-08d9416c7b8c
X-MS-TrafficTypeDiagnostic: BYAPR10MB2677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB267787195DFCD9AAC78BA903F91A9@BYAPR10MB2677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fWR0LZGPgco2J4eCd2hVvJP+mvja0XvMoWfLtGsP0o3v73pDAYH8o0ufmW0biQWdC8Qmj2f4AJKHO4ydc9liDKus3ld/slPPlOlveI1c16ruLnxu/d1NS2ZoM0W6L2hc/gHPbGqh0dEjAdtJEOFbRRQKC8ia8kDAzl1qKqkSQIIpxR2nGwVnWSo1lwilb+TaNvNS7i1jSmjC3mm2w0twEyOVue3Zhp4Z82rjXmRPZWm/vsOfanatvHysB3UiM7sHOGLyEe3UI1Qvup9JkiVvowPWJRdE5pNoFXnEJV/2E0b3AS2EicCQnrUYNSIZ/3GWSluH5vB5nzx+6DgVDiuYO7+vUvyFq0Y1Tu7/CAuNGIrnEJLBRfTIq4ZVjnNZp6f2uAC/U9tw64xrnXhSCugWJ78O8S9gJYb0AFI5CvKpNN/gsmIBjvR+Ug2L8VCBrrO39Xm/UhiSjK777uLCXAPgnkLuwCxPHQovbWqM0RrxrO4RusJfZ6tk5ZBM0VZ7cEWvXnZLnpzOD6v/4f1DRkFvgr4qsAX36kpfTa2o7ii6eCuFnB37rByP+6Of+LWQPIIen1SEP4EbXR6iyGOidtMZ9IAoio+twKfMssQW6oDyqPupMfDL8AUqt3vkTXdu+Ism3HFPR1/WF0U7kjGH4b2brW+m5sKrP4MOYCFo9icT0hMfVbMrYL+8JnPXJmDPTYYS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(39860400002)(366004)(346002)(6916009)(107886003)(38100700002)(66946007)(7416002)(4326008)(6486002)(478600001)(2616005)(7696005)(83380400001)(36756003)(52116002)(956004)(8936002)(2906002)(86362001)(186003)(8676002)(66556008)(6666004)(54906003)(316002)(66476007)(5660300002)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3gS4K4E6Ff/nY0hNHcKRO3HDt496HXmavqnxBnKGsHUxARdzvnXsveabbIel?=
 =?us-ascii?Q?g/J+mxRyAvotnlP3SBd/ZasMOsqhyLSDeZJCSl78rE9ZLbw0fv71ZuEyMruo?=
 =?us-ascii?Q?/Tvae+UK8ZmnPY//IlDQvVv2bgzC9+bu7LB9HK0QVQJv44mTzppQA9dCEF5n?=
 =?us-ascii?Q?DKM20+4/dvdE3nnimAb/68c9uN68YdEbjjHw+9CKzlrlYnY9XJZpMy1FuZZw?=
 =?us-ascii?Q?utq7knIKMN13zRpjcpVJT+TNNqBb3I1YOou9M7EF7oEw+c32qn7QV5Bx9HYJ?=
 =?us-ascii?Q?OhVAGXRM2Ge3m7s5s8yLQ+6f7egcDOiLsf9vLHw8Ni4+dIf2/07+A0Was+g3?=
 =?us-ascii?Q?lNdHYioAzTF6S6dg7DJfr44HjAK/BANwvkrFwoOMMd3FmLmYwBW6IlxarZKj?=
 =?us-ascii?Q?6bCl6zOrjWZQH5uCu+cO9//hmMu8XAysgi5dBsAW/y7Tkv5iJ/QWXaNSKtNp?=
 =?us-ascii?Q?XfeBD0GTuxc6O1lagr+d71wOg99nuPK4VWXRUzrsAfzQ7D/dFRyv7FSRIGsZ?=
 =?us-ascii?Q?iqFLuX7iMMdsEcBKDK5PIu9y9yLYHO+LhEPElMXN35TcK5DTfqVeMGnYKfwt?=
 =?us-ascii?Q?aXdusz5b69DNqsy2i6oZKJIMdE75lqu6DvsEhoUb70Px9Zjp2uH6JCPXiYYn?=
 =?us-ascii?Q?CS4SXJPFotOqn94iJzlroNMAptYgMs73ofzkebcjfT+y4tSnPK8qJMA9tLmA?=
 =?us-ascii?Q?fydnd9C3F2HQVBVsco9nyAgAA6q/BMX6CkNHPBo6r/OJvQvtquApJArtYVmj?=
 =?us-ascii?Q?ckuifmuU+0EB3Aqxb24J9iZd45RKX35lwcOt33bTeXUuYSXMszp6at9NzR+f?=
 =?us-ascii?Q?06pz6T2gvZDNRqOWlS/H7bHBcfsAXzYTWHuBdS33Wz+3mbBblx0EQPcYXAhp?=
 =?us-ascii?Q?1VQMPf88cGGacA1ZXzQIgocLlBWW8juzD4aBXXv/WVbxQs9Bo4h18S8nc15y?=
 =?us-ascii?Q?7mEFzk6+CjRB0VDIDBiKQkL6wplP7BUoqxJl1ivbb4W7kE6wLWpY7aLlrDU8?=
 =?us-ascii?Q?ZHEgmKu1uFLBDx91aCpRCSKdFfsn1hcxiXtgAa140zZyJmNA1MoViRGRaVYy?=
 =?us-ascii?Q?PdINrD5+W/3cvqvujHyciBGlve5V3voXpMsFs4d4bF2ffvTr/ToOIUfU0VAI?=
 =?us-ascii?Q?fmAS8zGNbivh61NtteLEzQyYz4iHK/4atDANzlQnKtT9qUeKL0DKatMoJ8W6?=
 =?us-ascii?Q?pno3Pzr+8w28q76/baegHasC/QdKJ4iXHHNdSbTOOq3t0nj5KarGFJM2FmY2?=
 =?us-ascii?Q?F1Ghj0h4OXtTTGE0i+i8/8MjB0RKryFy5E+Wa3bOXMSERf7W86DtC4qVa9ib?=
 =?us-ascii?Q?UeHz7KT+wgPmrYM+EYXwcJ4f?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278e89b9-a1a9-49c5-aed6-08d9416c7b8c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:23.5816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiOtWglRFRGhj7a6NNeuLvaAZ3CvtDMdAMWHdQUizmQQ6lVDjCPdEYqgkLlk596ff8lvG/7Sy+xMCWYMOmZRbF9ucZ44baobxprbu1+hukE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2677
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: ZhXJ4BP4svo7scwzWjznKoTMaOE5gAns
X-Proofpoint-GUID: ZhXJ4BP4svo7scwzWjznKoTMaOE5gAns
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 72848b9..ba5250d 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2901,8 +2901,9 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
 void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
                                 Error **errp)
 {
+    const char *ioc_name = "migration-xen-save-state";
+    int flags = O_WRONLY | O_CREAT | O_TRUNC;
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int saved_vm_running;
     int ret;
 
@@ -2916,14 +2917,10 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
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
@@ -2951,8 +2948,8 @@ void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
 
 void qmp_xen_load_devices_state(const char *filename, Error **errp)
 {
+    const char *ioc_name = "migration-xen-load-state";
     QEMUFile *f;
-    QIOChannelFile *ioc;
     int ret;
 
     /* Guest must be paused before loading the device state; the RAM state
@@ -2964,14 +2961,10 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
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


