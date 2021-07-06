Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C4A3BDBF8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:09:38 +0200 (CEST)
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oZl-0002D6-BK
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK3-0001oA-3z
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK1-00086X-3g
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:22 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqBfg003755; Tue, 6 Jul 2021 16:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Z8PilpzSahsOQ/gZZWaLba9OJaFpBqu4rQF5mNFBzp8=;
 b=HQL1TK9xd1scogznNKC0q9QXhpLJHOwRsA/bdKrmLdBZAPpGEs6rMA+AAwC/Ow9iq72t
 P0RKxHLMT18+PSC8VpOH43XqDsU9O/fM2aeTPuSUUzC46XA3b9WkIihw2rjx3eVxWHRL
 ez+lGk6luTLKqklDBpBogOL4//Z95NbDSx/dA+uiYmWJz+NlnA8CUooI+r9jf9NIL6jL
 hS02kvBmIWoTWNbEEWumqf+wZlM5I2F2fuXdqgeYg74ft5XtlituLxQtHyG0VtqR3WtZ
 IfHZP2NRizZ1phvBm+vstPakgJPLjsHYHRe5QdB0mEO2ikrYULRQSTmVhcuKr69/uZ3g Yg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166Go5SL159199;
 Tue, 6 Jul 2021 16:53:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3030.oracle.com with ESMTP id 39jd11ngtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3diY+POdiPouv+MVJJy+9bftSRS7+ggYwXl68Z6AbEqVF4lGCzOz2cussrd/UYMU4sTowSfkR2F7DXbue5ANnVBA0tgwV3Ab/LT2UFKMVPBVBK9Yv37JcR1mEv96IiDxy9eiIrwo3Slq4BwQW43pjLZgqRQGPWZ+MP0K296gfMQFrMsaZ4Gv75c8wUIHCsrZWiXg2ZkXgaV3R/yeIVW3UoMlCeWaXtu9EO/IqBqVkWuoiqKhqhWHodpFv4IUyrru9G2/nEzz5hRoNGhzJGV2nRI/KOG9EElb7PC90rwxBoXGxXBhezMJyuoy9ElA31xkS3lelq9Tu9FZtfP7CXCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8PilpzSahsOQ/gZZWaLba9OJaFpBqu4rQF5mNFBzp8=;
 b=AEpzZSt8hXzb0oS24Y9vZXKyeTLiED5thiL8cr2ZTxfBaOzMpaxz5d/VmFP7+SIYXuCJToe+PVo6bjUho5mnwgMCi0dQWcjA9ENnUvPT2wdSLEk5PhnphS59M4j1mgf5S+Ix1zY6JeJEhaMdGVgVJYyVW8EMg/yXheM1fC6pb+V7NQTWJZfQRrqiGZXr0AONjVY0vS7A6S4rm2sSVBhS6W9CBR2KWmCmCyZoorAAT/fCe9Yc0XAauC29TxwllXM9lcaYjidB8qXGBvw+jsYc65plv6XVYn+5ofE+1NA0dtlE8UhBYhLP699E7LxkyQfTKDa2SLU9yGXv8JsUEzigrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8PilpzSahsOQ/gZZWaLba9OJaFpBqu4rQF5mNFBzp8=;
 b=Q7p1Oqp3L899A1UphT4xHBkw+jTYThl634ogwF/ENAEM4SIIZ/yEkbq16wfH/6QH8fyOPfkhOsi66MB9F9TzmiD0c6E9KfGYaxR/mgOu3RbHJfYEdl5FDHPE7HZ7QSgglCPyUkk140C2EAiRiKV4AwPhtontGih/yGLuDFfvcxM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:53:15 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:14 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 21/25] chardev: cpr for simple devices
Date: Tue,  6 Jul 2021 09:45:52 -0700
Message-Id: <1625589956-81651-22-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:53:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1854a33f-3bc6-4314-96d5-08d9409e8bff
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB28051063D4800227FA3157D9F91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qMGDrwOicjuCixshX4g7d3QEPsdbWWRIEJbrfNpsByeXniQz0xlOKrA1XGKMxCKVi/8Gwl3rFQlzy4lI3AZzydBQ7fOuafkFu/SR2ph6xwXVq0V1gxDyV1wPvt7L/XU1L4aOj4YRPB1k4jdnpnS+9KUCMZplc8P/no5azk9THbREAdLoeGBgFZYNkTMjMw49L066SgrquI3bbRsn3L5KCkMLgHoHZxd6GoYF0oEXeYdiGFe0D5+5pj1tRKFGa4OsjPxIXKRwzHLoSXyPJbJTTWOC9nF0FIUPA7Glnj7BwzJ0W+kGG7DPARrCZ4wrfvU82lG3kvTdn+6zS00WTnhAnPJEYT2i5IoiEPueYfXyJYxj0HSrR2iyYP8Fy5DQbdk5ni7bYB1o4RZbdOT3FHyfl/y5hsUpPomU3YbKmtnx74IrIrNDh4ahUKBBA2RwTuBORvDhJpdlgCALI3HsHGlq2gPtM6c7MtiGgZlvIrMHfaAUYaEd9bYBuCnAvn8cwX98PRJCVWavfvdwLHOc9+NnsNokGFq5e5LvidcQUebkKKVeqma2XH3Z+eh4y1bgq+HWVNFsItzI88LZ40NefK0dlQYQ+ytSA3HtCyVjGFOtUO0h0rFqVL7hJVg6J3f0PzIhXPijUufW2qp7R77QCbFCcf1hVs/b5uYM1stxWBErwmrhAZfxm+/pyhw/dOB+Saeg37CnLNY/E2A/MfAGSv4B7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x+9EGPTeVsHD7m/D8aar5bN9sfpCrl/2U/rkLvxZ1YrYnaAdkwpuMuNlUcGL?=
 =?us-ascii?Q?iEQU+lCLGVp5FCOftWj33j4763SEyiO1Sn6NpIXyxVbr8lAmt5GpUEXCIP3D?=
 =?us-ascii?Q?g2p0/Sernyq4tR7ePUbpLUjEr+3CB9+WcrQL32Z6FXHcWNGxevGe0up9GewC?=
 =?us-ascii?Q?qFIY9n5L6c370QT4MtzeK1cnKp/yat9J5L2I6GZJPrEo1NVoRajCU2gih8yi?=
 =?us-ascii?Q?bjwUyQXjrcaH9Da+9t7I9lRa7mr9MpxgMWd95+H4BuLthHhrp84pO9HNt3Wp?=
 =?us-ascii?Q?cddRWXJwiysz8sO5pVztgmaP2APXury1LfIpcCCJMOlEO9dqU+NaxJnZ2wVq?=
 =?us-ascii?Q?wl92VKXlZrq8DgkOA32VuOWCQDsxEuaIKLeNG6Z0vmx8wSEjw0ncz//5C4nd?=
 =?us-ascii?Q?awnEC+rxT5AeYnVmeI2gjbEu7uKEqo2bLBZLHRQS0NDHUiHhbOoGX53l6OUJ?=
 =?us-ascii?Q?aH/N9t+K9Z2VGYrcYmgoCH3PmvJbgWMo7dju0VBOSMYf3leojTSrsPJhdsoK?=
 =?us-ascii?Q?B1xUCsYL8Sulg+LDMnsPYq+Wu7BQn6ndZL2J6AHwps5Ru59sXwbaHA+SvoGN?=
 =?us-ascii?Q?tIa91r8kufyarQNDEWDIgK6r1U0HAs7E0GGKAuZnpTWqqUuCDJ9vNIrU0x8h?=
 =?us-ascii?Q?Gmxv6WQ9rGAFuIdquBW2d3INjz3Iab1jjguvMOw7Ys2O0e7FZAZERAphe6m6?=
 =?us-ascii?Q?7JOOxsuZjGV+Q9P8qC4zlWBtl4gkJoRcNoZzd2IFF5eBmrBIohnZlX3AzvNW?=
 =?us-ascii?Q?VnenNY6+wiND9BtUrBEyt5hSzdDKT8WxQOR/J0U0DwR1PR0sQND/gPsKspEf?=
 =?us-ascii?Q?k7rWjAI1ZrxAEs5DCFjwVs2i9oBc5BGYYBCf6SnOJIaSFKmBz0c6DXSuAxs7?=
 =?us-ascii?Q?H04vlu2BGGK8tbIoui893g2Fv3a6Pvi6fpgW36324XTfuAAk/rY2tRo+EFYH?=
 =?us-ascii?Q?B5bbHpeAZrBGu2UsIzf3AO9J3i7mPlw7as5/5y7ebbYoIcRD0yRrtve+IhVa?=
 =?us-ascii?Q?ShI6C0TgxGN66vEi3u9dnIKZTW+ACkTPsmSIcfeWxV9Xkcsd5dAtv4gsZhcC?=
 =?us-ascii?Q?NEEArgnWOYo0j2fADIAH5stxqd9TejQ2JQPWOpS9HGVJJz8Jv4AAXh0xnJWa?=
 =?us-ascii?Q?hU8Sr8m1AuVEFoAm2ZB7/LY/xiQlB+1EOaBgrstOQyK7K4Cmc4ukDWFnIVut?=
 =?us-ascii?Q?qXIniM3AhQm4je1Qf8azWM7ZjhIg49DplGmNdinJP+GvHFgRfKP9SKIWqGki?=
 =?us-ascii?Q?gEm8uEASM1iCcOn6dKdQ4B3KGPT+pk8HxP8BCAUlvwqAUPXHXdkqtdPgNyWO?=
 =?us-ascii?Q?+S/+vDrCqr/xtGpb1+TQIWZG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1854a33f-3bc6-4314-96d5-08d9409e8bff
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:14.8748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzgAmnICFFmNrKAUCTuEKC2mlmuf7m33R54BP+XKkBB9WiBaW86I92A65bINLrX+JTLPpuIKBi6K5m41Sn8OBQixJaqiZIDSmSM8ovpdVlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: sMMDmfhsGN9PrL4ZqwVRfZ1g2FVJLqKz
X-Proofpoint-GUID: sMMDmfhsGN9PrL4ZqwVRfZ1g2FVJLqKz
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

Set QEMU_CHAR_FEATURE_CPR for devices that trivially support cpr.
char-stdio is slightly less trivial.  Allow the gdb server by
closing it on exec.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-mux.c     | 1 +
 chardev/char-null.c    | 1 +
 chardev/char-serial.c  | 1 +
 chardev/char-stdio.c   | 8 ++++++++
 gdbstub.c              | 1 +
 include/chardev/char.h | 1 +
 migration/cpr.c        | 1 +
 7 files changed, 14 insertions(+)

diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index 72beef2..af74eaf 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -337,6 +337,7 @@ static void qemu_chr_open_mux(Chardev *chr,
      */
     *be_opened = muxes_opened;
     qemu_chr_fe_init(&d->chr, drv, errp);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
diff --git a/chardev/char-null.c b/chardev/char-null.c
index 1c6a290..02acaff 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -32,6 +32,7 @@ static void null_chr_open(Chardev *chr,
                           Error **errp)
 {
     *be_opened = false;
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void char_null_class_init(ObjectClass *oc, void *data)
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 7c3d84a..b585085 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -274,6 +274,7 @@ static void qmp_chardev_open_serial(Chardev *chr,
     qemu_set_nonblock(fd);
     tty_serial_init(fd, 115200, 'N', 8, 1);
 
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     qemu_chr_open_fd(chr, fd, fd);
 }
 #endif /* __linux__ || __sun__ */
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 403da30..9410c16 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -114,9 +114,17 @@ static void qemu_chr_open_stdio(Chardev *chr,
 
     stdio_allow_signal = !opts->has_signal || opts->signal;
     qemu_chr_set_echo_stdio(chr, false);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 #endif
 
+void qemu_term_exit(void)
+{
+#ifndef _WIN32
+    term_exit();
+#endif
+}
+
 static void qemu_chr_parse_stdio(QemuOpts *opts, ChardevBackend *backend,
                                  Error **errp)
 {
diff --git a/gdbstub.c b/gdbstub.c
index 054665e..fdbf531 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3540,6 +3540,7 @@ int gdbserver_start(const char *device)
         mon_chr = gdbserver_state.mon_chr;
         reset_gdbserver_state();
     }
+    mon_chr->close_on_cpr = true;
 
     create_processes(&gdbserver_state);
 
diff --git a/include/chardev/char.h b/include/chardev/char.h
index e488ad1..96e5570 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -295,5 +295,6 @@ void resume_mux_open(void);
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
 bool qemu_chr_cpr_capable(Error **errp);
+void qemu_term_exit(void);
 
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index feff97f..4600d8c 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -146,6 +146,7 @@ void cprexec(strList *args, Error **errp)
     }
     walkenv(FD_PREFIX, preserve_fd, 0);
     vhost_dev_reset_all();
+    qemu_term_exit();
     qemu_system_exec_request(args);
 }
 
-- 
1.8.3.1


