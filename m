Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2F3BDBF6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:08:29 +0200 (CEST)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oYe-0007Ed-Kl
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJw-0001PY-GI
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:16 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJu-00085S-9s
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:16 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Gq19l012747; Tue, 6 Jul 2021 16:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=TxklaF2MN/PNNpG/2+9yDVEFV9alHgCIC0aISxROgPk=;
 b=lPHSxbQw89jyDAMkzv5K9SUuP1Nr5KkQAYFn3SMOSTCw+m/LWOQ1zKz5fA/npoEkdycW
 wIkQAwjCMFivaPLfLzHbh6Wvrkr3hHjUtRP0YVpJRBd1yc6AkAgw/ATDoWmFks12iNfc
 8eifLfmTPFJHSBertorhlGtKspx0BVT8ezqHoOkZrhl06Z7lEWw6uoI9VQKBDm9eaU0e
 9BA2ryaopiapvoYIqAX+k1oGMQjrqVvPuEZZE9q8db1BBPQGUMVW/6IBjhlkoy7MfeQA
 SIKTVlJnAEuRwb055sqwGnuLOmn0YyiXVv9/7QkDXYyZtMfadm9HDqvmg+KLoIlMNbPj mA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39kq8ebbg9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoK5X012778;
 Tue, 6 Jul 2021 16:53:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
 by aserp3020.oracle.com with ESMTP id 39jfq8vjm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXiUGD57u7G0zDrqLRTSlTafKl06wCt8KMexT9VebEzcfOrFVymRVqDH37NQls1Gkyms5XIALdh9TwIJAZZ4MosC2mV4u/E6slbcfiHq2eZTvYOHEXth4kPGBnHEPbrUpMxUI5FUxcxgyBEvhH9sUrjbJ9eKPdWwtdg0dtHymjt06br8IW8Bc9x9dHkth+psfCqw6pgFt7hm9Knkuw2lxegdQtBlWXZR7jfIh2+pyhTIqvdxC+A3kM1gt2B02aSqdRwNuUwlXP/asRXKyLEEBG9aAr6efKsLIRIfIl77WN4LuanAJlJ4VK/C3fPh/wZ/ho/PaHcRjARA5QGLuEOPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxklaF2MN/PNNpG/2+9yDVEFV9alHgCIC0aISxROgPk=;
 b=aPNnTO63xCHW7QFIsYsxlIBiPqC3JYpBCrZDMjNMgNt1aCe0hw13FUvcPlas8pgz4iQXk5LZtmOU419eUAWj840CaVA/sFeeWd9SYntgikUnnONQBX5ooMcVS/0ezXjDUFKjI4WMbVf+CqNAPQA+BPB2F0Cps7JA7WzLJj0n9oQwBfio5zZZMyhM2mqEaaOHVeLrGchZW96oy9gsh0/y3GqVq9D0vRpwuuX9DFBU1hkn4byTyg+jiMN3TUP6tUGf64GoI1vo6Bc1bd3Bcqq8YXue77KoxNCmPctEZDOJyR1CSlgrq8wa1BIBIlSSFeZe5SkXNs/Hws6S7s9ml7RPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxklaF2MN/PNNpG/2+9yDVEFV9alHgCIC0aISxROgPk=;
 b=T4M3Q1X0ErqHA9Yf9k6jt3Q6R9HoQIsykmc+SZAiwVM0Pam0sc0aW+n4pedoCq4qbC9UZI+qdpGWEU2pMhcUaEqHmvhhcEk3LlNL4N5Sb3aue0yhoWIdep/rUiWpP2RSHPRr5r0gi6ASOMqT6NPPgNEjwqRqs4ICqQgQyYloE6g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:53:07 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:07 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 17/25] vfio-pci: cpr part 2
Date: Tue,  6 Jul 2021 09:45:48 -0700
Message-Id: <1625589956-81651-18-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:53:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18f39dc4-b543-4154-9d11-08d9409e87a8
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2805F87FB8AF518B0587FDDAF91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yh9qXdjIXRg/4OrrBgc9WS7hzjMCRgSbvHLhyPwQ4iJRJuOinfKMqtNC1LMVDU/CtH8nqM/pX64PS9x4Rg5dBMlvn1RkZBkyY4Gv+BDCY4ndAQ4qzUpQBgzNP9eN16+TUO2HOgjcHs+mKU9KmGzfQ0r5A60/Nbg9Ih8+liHYQXYTB28Q8epPcNcJlTPOcdmQ31OB84Al0irjXluUr5Uh38KWShLyhIKy2QT4niAQEJE2y957nqFTRp0eyedMf88gZANGMTzFMBznuNhImKB66oEYHOGAcwR9wFBvvzZEFjGMXwuZBMM0lEI86NdcSfkjSiOn97mYOqjdAWPZW7XgJ3oos0k8NWWC1SWSpLpYnBt6uaz+L8Y1bT5/npH/MyCBMXlza1g82LIqOPnE+wF6lOuyY+VFUkUNf1spxk/aQ6PinRs3AAq7m1Grp2JWcuGB87UM6YSE91KqnwluzhvfZ7SkeiHm0+r+84gZMeaWxLWUOiZ4LbyP8oEfkj4hBH3/1qj8Fnfs49c40wmSpc1auVVi4Nkf0s0l0Ju4YTUckNapp/1r9QjC2dr3fXwrc0HlAoao7895Kxq0YdRLAz8OwV/ke0vIpbJkL508Oc2tDlLPGP6i+B67kfSuL73RxIgB4N02aVgck7YZuBC9KQXoJU6zpF/1otcE57u9AIwx/sW5TihDoIGf0CjcGaFfoi0WtlpvAhiZ/i7NG5XLevbzQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eEiF34jJFp3pbPtRkT4djmh3XLUP5dFJcvQk2bagywZNCs359r8WMdZAOZ9h?=
 =?us-ascii?Q?DKWzUoeCRUty4Z/V4XVTGRb/GHnUGpw1cnNo3hVwzRSOtlkNNCDLFSA8MCKX?=
 =?us-ascii?Q?OU9jd/GF2drOrwHl0TdnwFczdVyt4YgQs0QvSm1zH5nVTu6EiRF2/phSFgTv?=
 =?us-ascii?Q?0axhIiSfev9LgdwmGxb3XTueyXINX4XiVSbh+0srrTwBwKjzar0cFG21CXhV?=
 =?us-ascii?Q?kd7Mv2pwtbhSxZG6Fz27HWFfxZ+4zDNdJ5JPK1MwMRr7NY5+6Imewz0jImwm?=
 =?us-ascii?Q?Ucj+nms6iwgQ1M4RxZKXK6F4vSaGQZ8Sg+pK+tfvWz/E7nZc1lpWUm0sKmXv?=
 =?us-ascii?Q?dL/cWchnJxixNw+szeC9iwUn3XZFgEa9veW36WxtUAy0wJyT+td3b5hBQin1?=
 =?us-ascii?Q?hk8H62XsrLhRM9IT0l8+PVQ4AGFnuakzjqOEJHBwVVUvYi2H4Laj3sMH1T2r?=
 =?us-ascii?Q?/ZPb/YuENPL3iKENh4MSRffLsjXZLZQIGH3ITBig2yDjOpDD7U674C29AtxI?=
 =?us-ascii?Q?S14hzs0cMGl1HqnH5mH04/QISZxPyYK3Xhl/Crm/Rz84oFcZZW0uD472QxIv?=
 =?us-ascii?Q?4mV+k5EAo5dFY2Fj4Spc/x1LfUnW5mI/A4IJK5j6LoL6ctzbIU8ZiV5t1GF+?=
 =?us-ascii?Q?p0XsPSOSqUB4j2HgR/hfuMfwdJHajU6e2VxM79qcpV2Sr+7FAzUA/S4ZIzQp?=
 =?us-ascii?Q?Q4MmwQsD3mdipj1tXU0AujBsslGTW+5sFn0kacTNb3rmheU/pVBDifFSwD66?=
 =?us-ascii?Q?tbRdkGtRUGTY7zXL7ncRorB5OoEI6bBuKTaVfNisZ47HG2SKZ9oik2P579Xq?=
 =?us-ascii?Q?Lzbe6I7Hx6lyQcdnNbAdvH0aQUbt2T4T8InCZXd7vwK2H5TYWrTIckHoe5Om?=
 =?us-ascii?Q?C0qzxeAjDknL1tQM0V0H1k3Suo87l75LY7L4ZjFpD9xiW7Q3zRQBjcXVkS+A?=
 =?us-ascii?Q?CHim9gzXYt/AzeYrZhZNeusdD953mdHmMBvolUusmsuSlpPI+sRR7tvXQf8N?=
 =?us-ascii?Q?knVagSh6V3XDlQy2jgNwhMW5eoCCyea/f2aQh4ocQ+2z5OBZ0C3OYgFzsOAt?=
 =?us-ascii?Q?h/bE1OHlPok/I/bISjwtufnHj0bQWAI+B+of0ZSFuPToUrkluNCMaSwXpIFS?=
 =?us-ascii?Q?E8OakqyQu1nx5kRxKBRGY6Ou2Yr7hPFMFg87g/8bAMp6WABTZft19soLDVk/?=
 =?us-ascii?Q?BJVBXQ4FqdnrWnfapbhvgl7/V3KMpvViRX4r/gDIlkg9bXh7mwBSsATeRMiY?=
 =?us-ascii?Q?tXZPvIqBRBhyC/KTDP5ff66jQPCnX3R0knJtx7Oo/QRujHn5aeLq+KDCfgtO?=
 =?us-ascii?Q?v15T/r4ZGB8Hw67PdUI1LayC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f39dc4-b543-4154-9d11-08d9409e87a8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:07.5460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfr9rh0EWZb3z0FzkBQaQc5qcOhBtPmwC6XKkT0b5NQV7FcHShIABiOLUPemYKr8zwwWmjdPoWagd01MWTYnILWI4FdGO9bc8RZkWs9psw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: 3O33SsyH6OhLl6wqi97_Duoq1UVSourw
X-Proofpoint-ORIG-GUID: 3O33SsyH6OhLl6wqi97_Duoq1UVSourw
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Finish cpr for vfio-pci by preserving eventfd's and vector state.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/pci.c | 118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f3a9361..492ff31 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2655,6 +2655,27 @@ static void vfio_put_device(VFIOPCIDevice *vdev)
     vfio_put_base_device(&vdev->vbasedev);
 }
 
+static void save_event_fd(VFIOPCIDevice *vdev, const char *name, int nr,
+                            EventNotifier *ev)
+{
+    char envname[256];
+    int fd = event_notifier_get_fd(ev);
+    const char *vfname = vdev->vbasedev.name;
+
+    if (fd >= 0) {
+        snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
+        setenv_fd(envname, fd);
+    }
+}
+
+static int load_event_fd(VFIOPCIDevice *vdev, const char *name, int nr)
+{
+    char envname[256];
+    const char *vfname = vdev->vbasedev.name;
+    snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
+    return getenv_fd(envname);
+}
+
 static void vfio_err_notifier_handler(void *opaque)
 {
     VFIOPCIDevice *vdev = opaque;
@@ -2686,7 +2707,13 @@ static void vfio_err_notifier_handler(void *opaque)
 static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
 {
     Error *err = NULL;
-    int32_t fd;
+    int32_t fd = load_event_fd(vdev, "err", 0);
+
+    if (fd >= 0) {
+        event_notifier_init_fd(&vdev->err_notifier, fd);
+        qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
+        return;
+    }
 
     if (!vdev->pci_aer) {
         return;
@@ -2747,7 +2774,14 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
     struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info),
                                       .index = VFIO_PCI_REQ_IRQ_INDEX };
     Error *err = NULL;
-    int32_t fd;
+    int32_t fd = load_event_fd(vdev, "req", 0);
+
+    if (fd >= 0) {
+        event_notifier_init_fd(&vdev->req_notifier, fd);
+        qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
+        vdev->req_enabled = true;
+        return;
+    }
 
     if (!(vdev->features & VFIO_FEATURE_ENABLE_REQ)) {
         return;
@@ -3296,14 +3330,91 @@ static void vfio_merge_config(VFIOPCIDevice *vdev)
     g_free(phys_config);
 }
 
+static int vfio_pci_pre_save(void *opaque)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+    int i;
+
+    if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        error_report("%s: cpr does not support vfio-pci INTX",
+                     vdev->vbasedev.name);
+    }
+
+    for (i = 0; i < vdev->nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+        if (vector->use) {
+            save_event_fd(vdev, "interrupt", i, &vector->interrupt);
+            if (vector->virq >= 0) {
+                save_event_fd(vdev, "kvm_interrupt", i,
+                                &vector->kvm_interrupt);
+            }
+        }
+    }
+    save_event_fd(vdev, "err", 0, &vdev->err_notifier);
+    save_event_fd(vdev, "req", 0, &vdev->req_notifier);
+    return 0;
+}
+
+static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
+{
+    int i, fd;
+    bool pending = false;
+    PCIDevice *pdev = &vdev->pdev;
+
+    vdev->nr_vectors = nr_vectors;
+    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
+    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
+
+    for (i = 0; i < nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+
+        fd = load_event_fd(vdev, "interrupt", i);
+        if (fd >= 0) {
+            vfio_vector_init(vdev, i, fd);
+            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+        }
+
+        fd = load_event_fd(vdev, "kvm_interrupt", i);
+        if (fd >= 0) {
+            vfio_add_kvm_msi_virq(vdev, vector, i, msix, fd);
+        }
+
+        if (msix && msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
+            set_bit(i, vdev->msix->pending);
+            pending = true;
+        }
+    }
+
+    if (msix) {
+        memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
+    }
+}
+
 static int vfio_pci_post_load(void *opaque, int version_id)
 {
     VFIOPCIDevice *vdev = opaque;
     PCIDevice *pdev = &vdev->pdev;
+    int nr_vectors;
     bool enabled;
 
     vfio_merge_config(vdev);
 
+    if (msix_enabled(pdev)) {
+        nr_vectors = vdev->msix->entries;
+        vfio_claim_vectors(vdev, nr_vectors, true);
+        msix_init_vector_notifiers(pdev, vfio_msix_vector_use,
+                                   vfio_msix_vector_release, NULL);
+
+    } else if (msi_enabled(pdev)) {
+        nr_vectors = msi_nr_vectors_allocated(pdev);
+        vfio_claim_vectors(vdev, nr_vectors, false);
+
+    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        error_report("%s: cpr does not support vfio-pci INTX",
+                     vdev->vbasedev.name);
+    }
+
     pdev->reused = false;
     enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
     memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
@@ -3322,8 +3433,11 @@ static const VMStateDescription vfio_pci_vmstate = {
     .version_id = 0,
     .minimum_version_id = 0,
     .post_load = vfio_pci_post_load,
+    .pre_save = vfio_pci_pre_save,
     .needed = vfio_pci_needed,
     .fields = (VMStateField[]) {
+        VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
+        VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
1.8.3.1


