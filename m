Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFCD3BED31
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:36:55 +0200 (CEST)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BTi-0005LO-4j
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKl-0000td-IQ
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:61346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKj-0006pn-7N
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:39 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCN0G027394; Wed, 7 Jul 2021 17:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=aMAs8xIWZLKcYZygmGKKyNoVgWQ6TnFfTwQOquWl3D0=;
 b=Qq3BWYne8Php5jgPSpnruWFo9nrjchnQ1+MIwniUzhuv6AHTrowRVi/pQzK795X8IqdP
 2Tm5W9tw/0iMJqajUcBEUKOJS+tOYl+9r8GuQmXJls3ALSW+e2NU03+2eHRN29EJk2kO
 2MJeK3xwJmMAd4yMEILOUOb8NsRGbajRZVIOiIlXcect+58QTIAVct3RxDKY47nMbWKe
 6Dj0jYcHC7V99HwTqQqK8ID0EuopZKdbZiZ7URt5YNubihrXojOhodVttLy1Xp2EWAxV
 ST3Qf+S5BWM5HF+QcQByd6qz++yjCMJFU1q6mU5st/+yApjqQvYNXs3MKeqPLYz2Q+Tw 7Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smmq7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAY65155401;
 Wed, 7 Jul 2021 17:27:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3020.oracle.com with ESMTP id 39k1nxjva6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx5qfEpi4C/YKx7ol1FLr1LiZvhXsPiOBEexX+Iabkea0dB82PNu86sPybsWVJiFUgfvN+SWmBRlVm800H29F8pp9LqIB71j00eWrLGbMXwn+7US7yVRBgQPecT8PaEWMRb6kY13IljfG/fSo1i9/2Ma9RGXHiEupqqM4gmXrpE/FWfv1Ya16746Y2SXwFz5YMqIE2lPBVg1oYNL7ZV1Xfs94UqsfQ7F3RCMNBkDbhed97NIBGXEr1xsi5qxBPexLInhttvsFC5is0ezj1NsNK+pGS6v7H2/Scs4DKitxqdNGa3rmDvgs79e3XG8BdwyVL88cw9b67K9SOaYz+r3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMAs8xIWZLKcYZygmGKKyNoVgWQ6TnFfTwQOquWl3D0=;
 b=ibyDUNHFtA+L+iewIOzstOWD6d409RdK4JESU/Vuo6DvZkhxUw2Dc+Whs3ap9szCfqcbAStXxtev9i+seJLEGac//ZHZx4achgeACb/RhXziOA8XvtffpbHBxJEzfUzieUGTrxopakFC4SySGsdHp9AFpT6epIZOB33KGE2JZQVvNLNVsVhHkuTHKuqI2PD8iRlyymEFY58hgsgBnU1Uv2IsH3GpAqJIG/tXw6vjR7nI3fIQ98yQp39Uzv9sZ3diBXwLnSDLlEQBnyqNhoWg3TgOmkjoldOixoIs9gebxuwWDd9aUrYEOI/4EpGN6628mOgaaBs/dFPKAzPIDddr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMAs8xIWZLKcYZygmGKKyNoVgWQ6TnFfTwQOquWl3D0=;
 b=WEtYzeUrtT/B7+UqebCtu3bMron7MOQvqPaw8kKdjlMxEYydgf11twWtNjHDh7Y7dzholL7VtaW0jtnG+4ai5uerPhlPE266lmIf+CbM5iT+exZSqTSM30RUjXO9X/axNE4+EZ4yuO9zFp1o6rS4lU2AnTY7zwzRWQbkOw9ekRk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 7 Jul
 2021 17:27:21 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:21 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 21/25] chardev: cpr for simple devices
Date: Wed,  7 Jul 2021 10:20:30 -0700
Message-Id: <1625678434-240960-22-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23cb49bd-7f07-4e37-ed29-08d9416c7a36
X-MS-TrafficTypeDiagnostic: BY5PR10MB4226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB422675EDE6C7FE68A124AD21F91A9@BY5PR10MB4226.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZQuM+0gQlLfaRQS45iIsdsWCYgo5b1+VLAhEn1g7GYiAGVCuC3UQtwrWg2fQXGQoLQ49PTpn9dzd0YqxPIntl5tB13OsiVa5JENLAbpRrJpTE12uOy/s9CHIiAT47F8uKg3bOYvNtBAhjpiQoU0w8kVlAx/5eT4hsf9+VgRnnvuYr7q4OC/QTBaBnVNhrIBh0jqHCNjyRb9NG0XyaAzDj15NKSJl5zvf6/hYKBiZR8BiFmxafca+YH+QK1m82jKzpm2sMac+lCVf5sqOA/iCmhbme3iAoPr5S+VM3hqtv59xPPXl7ylLjUmLY9VpGwCi6C/wmarBw14yK217A9j3lXnSVMd42BFwol4s/x3b7E4Sxp5EJ+I2PG6FPmZScQMvV0IBD72BwTN8THTg9f1O1vqbKzsU1XE60uEO7QccXqNgqU7jzNwX7EFqcTLkb3XVcmjfM5eX7/MTAKnUfq8xgUY0AfvYPdIYMIGMS9G/sCBrdOEwRa1T9y+O6Y7LU6oUTGf0dLrrYtjn2JXNuejmjHLL7uqWrf/YnepIyQkZ2L3vLYuVpienEymfEFDuec2km1uH0RvXmBeNylhJYI0ekP/boMbV/DUosg//u1QqQKWftCKVX3Qtg/x0KlGBbJxn1+87gCM6XI2mgpLia1dXJYG9NZiUbQcwrn3xzMsLYHsNRYaX0a3qD2dVcCXxcXFM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(39860400002)(396003)(366004)(6666004)(186003)(52116002)(7696005)(8676002)(6916009)(107886003)(8936002)(2906002)(7416002)(4326008)(38350700002)(38100700002)(6486002)(5660300002)(316002)(54906003)(86362001)(2616005)(956004)(36756003)(66476007)(66556008)(83380400001)(26005)(478600001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sjgpvgtfDgxcVgFpYhMlmDJGtjQyxQtxxiQVJEHkIBf+Bw60yku4jskB3k/g?=
 =?us-ascii?Q?UAVP1rjCmv5cmJHWDsjNocsUukecYH8lOR0oqluKvbMw+nJvTCP9Bd8hmCsQ?=
 =?us-ascii?Q?ZwHjCZYqyveLcbNIHq88e+dYmaeQwUluW8a/LV+FJNAWzvb/uahk3V5akWRy?=
 =?us-ascii?Q?dgHHlrDa2SQ1RXlIwMjshOvDtlDY1uCrt8AGJ0Ca62LzbeE5u6YciS4kqXnn?=
 =?us-ascii?Q?JcozLbYi8c/v3xg3bgw6YCOBec5D/55bYalnS8rwv7rzUgZT5LrD3le2FIAG?=
 =?us-ascii?Q?lqtvaQoLxs0GcwOcuJuV74H4u3tWyX2dppZ6lOqM6Bv+8nBkkNGaJvQvvJ4u?=
 =?us-ascii?Q?Vpylb1xtMjEF6sMgMvt5YWeGPKdtkzEewqMX1wN6ubHcgFiwqP3FVCkiuTfl?=
 =?us-ascii?Q?CK3l6fAsDaAWZSWO1tiehTIv0JqU373x8u1xPhzKPx8uO5wvV6LovF9FNojJ?=
 =?us-ascii?Q?mz+FaWAwdBSDNlK/JOBk5pZ8WOcrml6GLM8Idx1P1S5yrbFpsdTorzvJyMCN?=
 =?us-ascii?Q?5E5VBAP024Hop+U9ZhmsxVqVfKD27/2WpD412uyRpZ7EyriCnGXyETAGEPv5?=
 =?us-ascii?Q?ZdVGh3BWpu20NNJOBfYw9X5j66ce8qHH/4s5zRDAgkaJu0yVRCCZI6kI0aO9?=
 =?us-ascii?Q?MEuthqp5aEeRfUlgSgs4fKlPVpyTLEynqiDeVYs7eo+fzPEFc4Z15OBsSzkV?=
 =?us-ascii?Q?vUgUmam8vrUI86B4pLlY8BsNoOfWntgzYmq4kTL8OCGH1WdB1cbDYbOrTT9c?=
 =?us-ascii?Q?U/3SAkm2hKdO6glawRLO5dPv5he/TjGh6Ru/Dhi96I1knHRlOpX1X960PN06?=
 =?us-ascii?Q?dUZC922zft9wH9AXwruUdoXzQELGiwi5KsNZ9UQOl7KR6rnS3wjbN/fLoJ+t?=
 =?us-ascii?Q?VExhGCUdNChpbMsrNX3xmAyXl0A+sOoc19YiMTjjVCTUPHh+NERegSmcea/G?=
 =?us-ascii?Q?er4dfQDrNvBImWzC9TOEJWCOTgc5DeCW4X0GyGO0XfPA1TzCq8oRMDY/RQzF?=
 =?us-ascii?Q?f8u89DWGSBVuLtrPhoxOhmL8wgm/3c8CdacEwmKLYyrgbPOlA43Qb9ledNM/?=
 =?us-ascii?Q?etpBHmucDegX3YMSgSk6KpAr4H22bp1n6IUyqFokaTK7duNQ7TLJghgKpwzi?=
 =?us-ascii?Q?lR68hOUNj7az5dTqfSb/MWLCS/JwNyXuQqahKVY28pe7iMkWxlEQp4KzTgRv?=
 =?us-ascii?Q?xIcenK4oFMoXE6fASNoHqDxy94+RPFzNtdJZIt+yjgpmvccinf1HWK97wixk?=
 =?us-ascii?Q?4wdYzjQTfSQH6Oby0U++WqgxlldVbRkigSuU/aGonz2s04cC7O8h9BD0ho01?=
 =?us-ascii?Q?pPXsUe1GGJm72pNH9oCFQFY2?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cb49bd-7f07-4e37-ed29-08d9416c7a36
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:21.3668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fJto39/YToIMPDNuJuOuTe4yddzCUROkrDEJ2ING1meo8c0qSVwZ1ZvUiPjLJtpgGeNqCCzBYzcSyPvGA1eS0AQOhUO7isqOgB/tNSGsLZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-GUID: -aeXYgT-df4lBeJXMEw2_i_nZgP1CpsB
X-Proofpoint-ORIG-GUID: -aeXYgT-df4lBeJXMEw2_i_nZgP1CpsB
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
index 5baf419..bf7bad9 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -336,6 +336,7 @@ static void qemu_chr_open_mux(Chardev *chr,
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
index 52bde5b..b014b52 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3534,6 +3534,7 @@ int gdbserver_start(const char *device)
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


