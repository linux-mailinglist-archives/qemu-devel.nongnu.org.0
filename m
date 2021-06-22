Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E13B015D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:28:27 +0200 (CEST)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvddq-00044k-QA
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUb-0004H8-Sx
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:59299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdUY-0006lz-77
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:18:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=boUg09M4RXgox7kI8w63b6iSpVtFG+CowpZzhDhxgYA=;
 b=Dm1ZG0468bT+1eTgw43UEfw711e4kRJKdcWx2wtYlzaRo93yjYKoJ+lPYYZd3XWyadAiB3
 hL7/WyuQef64JmQj4jN7XllcyaAaaLanR72nDknpDj7PTGyIj/36hvWxrh18NOJJI2LXOL
 XAvQpJSJBUnfQsLT/x3/Ifv7sYCCTmw=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-UYVt7B-DMfOvMiDcAyFJyA-1; Tue, 22 Jun 2021 12:18:47 +0200
X-MC-Unique: UYVt7B-DMfOvMiDcAyFJyA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb0VFQz8PbXcitGq5ZHFqyZ3ygINSpWV34FcVEHTZbpnSL8+ITVH2a2zpXSuYwVp/r3MUjWMMmij18SEUTdKxIDLp7g00KW6zy5QAP24+q5jvBYIfcVBM6Gpx26krtq7zMao3tEbyNmBGyJ24EqqLDb84dFvCQNQeb+YLXg7QPbWombEb+TSO/87KAE+ZmU2zj5mDEFtPwprziihpKHd2gQn+RUO0RuMws4GvXG4sV7bd4Jg2FyWk1qKd5mbayd98NspKTN/aPuVU3WuzhNKgCB7/Ag8Dr/JV9WkgCJbEMNmrSt1tmtV5TUb5ZFB5MyceYsPy7twWcK7cLvkFtTjYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPt0mzp0ADKmFY/vHk/yNtlu9o/KRdkV9oAiPI9zC5Q=;
 b=mlutOVHB5lVIVIaEFE0hLRIuFmsX1xCO7PGRzjXkjHnE9amGCr+76mVQj8b7V378GZollJ8xY4lX6aXBp8md7GL4eLeA2KtrSxANxarQuGO6fB9LU3JlvmQ/XrQaJ7y2URpa99NH8EcHNsmhylaur+N5XH/JhfciswgousAJfwyiEPWHOMWcUfoA8p/m0wM/5ULXqDHei2LIcay1a4CU2rQtnBv1QwR6VkbyFJJQKhSZlPwrWT/05GzD2ClH4h5lP4iAdEsyeVP6OMGRK5Fkq3PmgeFbUpCVg1RFXs8+4ZMQDytEebX4ikY/4JV6wfEXz3P9huCNvMg9KWCwoIRgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5727.eurprd04.prod.outlook.com
 (2603:10a6:803:e4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:18:47 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:18:47 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, Claudio Fontana <cfontana@suse.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v5 09/13] target/s390x: make helper.c sysemu-only
Date: Tue, 22 Jun 2021 18:17:22 +0800
Message-ID: <20210622101726.20860-10-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
References: <20210622101726.20860-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR02CA0198.apcprd02.prod.outlook.com
 (2603:1096:201:21::34) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR02CA0198.apcprd02.prod.outlook.com (2603:1096:201:21::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Tue, 22 Jun 2021 10:18:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e9ee4cd-6d43-4fa4-1656-08d935671f26
X-MS-TrafficTypeDiagnostic: VI1PR04MB5727:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5727F338DB4B3DA8A6BD497EA0099@VI1PR04MB5727.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3K+iF9lGHJmzDnpa3ta0wAhu0JuGl149XAJk1VIvn07EU8ooCVDvJnVa2kLKDA56W0jQ+9o8EqsLRCkTINzTcDuC23zC3Kyxkmpk0iWc6eriZ+gqmL7JrLyqAyLVQu7muqwpAB7hzj6TusUta6QZcpkrFcJNoYN+IEZkQiSKjCgX4/0hJ7L/GoMfiXanRbhuxeXbskZ1HQJcLmbpb/d4CYxZ1IbLuYvwCL+/u2rpX6HWvNn7yME8axXwelaizu58JW0MwK5I9lSbvzJIujukWvZzMEe+kvA83L3SuqKhFPnHWemhSMy1ctTYeVcnPKVv8a18fFcl+LRLV5WJPg0iWQXEG+bRBM+RBDYQ9x05Fjl2jZPUV0aBtZKGF7nyWADi3Oiy+fu5Wt8GMxnwLwpFd1To2uH/P9MiB3pWhvvlzHhb70zI9Rc6ImFMYsvIAungQ/4+PVtZTR4mOsuJW/LEROnCvlVYNfGA2CyjItjywxu9TEX21ePwKTZvQyfV6TRhQfWvn01pdwr8YZL5Fs7HhfW3wi21GVcXPORbvsqEn3GPBMWe/tAftF0JGe9zqTE9xVjnfTN02VRp1dyMeguP4XqD4vejqaXTR1wx+OGi3/V6KHYxCWLc/Dyp7dPEFfZ7Hoo/UHFKN4tzDKKGlIpEhyqds9kcdx6/aQAGzRbNWtdxJZ6E3MMYCH5S+SZQabmLkTeVgtWX0Kq4oij01mPSSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(366004)(39850400004)(136003)(346002)(2906002)(16526019)(186003)(6666004)(36756003)(86362001)(83380400001)(4326008)(26005)(66556008)(5660300002)(6486002)(66946007)(8936002)(1076003)(38100700002)(956004)(2616005)(54906003)(316002)(478600001)(66476007)(6496006)(8676002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c51loF8ICmW3OTyVzKMKhnCFflAUZYBwpTsxlOQpkYsfd2kz/uIloTOVm7/J?=
 =?us-ascii?Q?knTKffCz3tvzTL18nnziyky3xZiYE9QlDMOBEsPuzMTGCYM0/TrRibtSaiaB?=
 =?us-ascii?Q?Q9d9QNcoLfVFIEQsIzsHn48DGF0wX/ZetrJ3QqumZaXkIz09uXqvEhXT7YbV?=
 =?us-ascii?Q?J/BqP1M5uXRIp8JTtRadQnNSlSDcJWMNcthle7d+qRsayO7HCPxLB8h/IpAy?=
 =?us-ascii?Q?aJIIjFamb9YwosWt2MQpUvDV4WMHtM6Jro2jsXgryWuVnfPk8HcVDZ2zDVwl?=
 =?us-ascii?Q?dy0GNidXpMmF5fPHEgOsrmn69Qtaw+xY47WzHEk46YTSEh0VYoAnj06+4YUH?=
 =?us-ascii?Q?XvRvF5VSXm/gkxxIFiSVXFm8egjyB+iOuWZaZmT+87v7as8vmQ/bymAFVvnv?=
 =?us-ascii?Q?QUS6v94zrPOQQRb14k4MMoP1qjCbGcsisU4Vur0SHHuGqQjyl6xMlHKqCzNf?=
 =?us-ascii?Q?eZx57s6OXcmMNCzP+n+bsPE+hVGmtlww4q75eK/AfOnOh2Lg3SJe19r0/+5J?=
 =?us-ascii?Q?hp7IEn+x9mAtuUjmT35jwf5WYmdg/oBQ/odzDxljDLh/FYg5uQ82FqSZfDj6?=
 =?us-ascii?Q?yVywL5Rtpk8tzGRLa4gJWdKHnMnhAeZOUxwBAxj6HFS2nqzjoecysWcdPRmR?=
 =?us-ascii?Q?NcH12x2xsf2fZix01YgbTdzuRXrLbAkrwHUc52ArcQhyZImMZH/pfWgHuwqk?=
 =?us-ascii?Q?Yl/XKsbW2BFgeR6tIGZ4LqNKhltnbneNEXDpiDUuKjEnz8ksiwt3IVx9a13P?=
 =?us-ascii?Q?LbU5QWHuiHCxgQPdFdOK9+wXbD+Aycv5pmfnM61D5YCdkoE/Id9fHzYUpgjI?=
 =?us-ascii?Q?1wAZ2PZaEYHB/27fkbE3rGM8cLSEfK1LdWewjCy9DuS3ebjsGZQ8A3ixL51h?=
 =?us-ascii?Q?rrlP9pd2hJ/1ocDneKBSgRS1WdvYYX42xK9Ro4KIfmvHIpmsE3RCk1F2QV0c?=
 =?us-ascii?Q?JNx3B2cD8vvVmmiNn07qreo1zxuyiDt386HjLqFccK1CXP2Dc1UpImUB5sIk?=
 =?us-ascii?Q?kwZ4xIubIWN+gRPLXLejbAdMY1VUcNp+BgyJOr5KrG7T4JRDmKPj+wX5wq10?=
 =?us-ascii?Q?PwfCOnetcfFlt+CDqKy9OKCKkCmVzX/0Ww1u/bD0kclQPHgvI8bm2qIr3Ve9?=
 =?us-ascii?Q?AZswaUVkJ1BUT2yG/qRWjPBzLVc0vgaYtlHO1iNqv0ScCZCMROfvZd5s8+Tk?=
 =?us-ascii?Q?7Sf6w3EYuYAAdLtV5xt5L10Myh3EjkOlEXJ/2aPNunHpluSwrkBqBnOiyghZ?=
 =?us-ascii?Q?hHicmYVou3MWjIdUqx95wgrYUZXnaEcr0WiQ4eQpMpx5how/3rN2TVDhdmBP?=
 =?us-ascii?Q?yQVNJXLv8TeWYtdPD5vUGoMC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9ee4cd-6d43-4fa4-1656-08d935671f26
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:18:47.1248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wt21gbFLJey2dpJl0NKOZnihp+Qr9stABC2AK5dghiCgD2c7uEXcAIHUnoXqQYoB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5727
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have moved cpu-dump functionality out of helper.c,
we can make the module sysemu-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/helper.c    | 6 +-----
 target/s390x/meson.build | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 41ccc83d11..b9d18325bc 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -1,5 +1,5 @@
 /*
- *  S/390 helpers
+ *  S/390 helpers - systemu only
  *
  *  Copyright (c) 2009 Ulrich Hecht
  *  Copyright (c) 2011 Alexander Graf
@@ -27,11 +27,8 @@
 #include "hw/s390x/pv.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/runstate.h"
-#ifndef CONFIG_USER_ONLY
 #include "sysemu/tcg.h"
-#endif
=20
-#ifndef CONFIG_USER_ONLY
 void s390x_tod_timer(void *opaque)
 {
     cpu_inject_clock_comparator((S390CPU *) opaque);
@@ -322,4 +319,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, h=
waddr len)
     cpu_physical_memory_unmap(sa, len, 1, len);
     return 0;
 }
-#endif /* CONFIG_USER_ONLY */
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 6e1aa3b0cd..bbcaede384 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -4,7 +4,6 @@ s390x_ss.add(files(
   'cpu_features.c',
   'cpu_models.c',
   'gdbstub.c',
-  'helper.c',
   'interrupt.c',
   'cpu-dump.c',
 ))
@@ -23,6 +22,7 @@ s390x_ss.add(gen_features_h)
=20
 s390x_softmmu_ss =3D ss.source_set()
 s390x_softmmu_ss.add(files(
+  'helper.c',
   'arch_dump.c',
   'diag.c',
   'ioinst.c',
--=20
2.32.0


