Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B39B38DF70
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 04:55:56 +0200 (CEST)
Received: from localhost ([::1]:38290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll0l0-0000Wi-D4
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 22:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0ic-0005wK-MN
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:26 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:41052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1ll0ia-00039v-3u
 for qemu-devel@nongnu.org; Sun, 23 May 2021 22:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621824802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YmOZSUwIhnMobNX5EDeqaLlop1MmvM2ok1mFmyd4h7s=;
 b=kUDoXPTt+bv90v1qbCiAjwYD5tGafvePazk0IbvlMzTYXZ0EfoPKGNEKzcJfp98nzMiD0n
 UUcXapCpE7Y5LHf3o6nRs19b/gCRlHdIrFaEDov70gIAKK6hiOuDClG62oEIGMCRFxWfy4
 25nEoKCyiXBpB9u0OH+YrAkh9eTirlg=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-xyNX8xa9Mpifk1QgI7ddkA-1; Mon, 24 May 2021 04:53:21 +0200
X-MC-Unique: xyNX8xa9Mpifk1QgI7ddkA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7/GUhC9W1OD6Q7QstaiWHQUhYvUZXhMrtilG26RJopEdm1Mp6ISNDdlTgVOAtS4liiA8ygAxIVfEbjgZ+EYeCtfqrDRK8PTGj0eb5hbpbSEPNYgeZ+p+grpboMh0fEqrKHTDIjiDJlhXVf6M+Rh3IxaU90RZSQRvlxFxlABXcD7TbA38EqMjZNGSP8/5tg/TWOYjBoNEzwfMBFXVC89c2tlmYv2L+r055rb9gelt2y0hndL81fjU/P/2MlVEVeo2bkEoBQbaOWv5Um0yk5Fhou8jzPVBWrbCaeBe+NCXXwEVzsFTq2Jo4UEcEyQTzSid1zmx5O2EtFhqJIAfH1r2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S73584gVxynOWszGy/7OP6jpAOlecCEzjDI7NA0VWoU=;
 b=lBspNepwdx2Xr9FheEbTSJdzj9orelAQx61lSRbYCD7NSyZ5DxB9mdC5WpT42QGdPIbcNq37HBF8QxncrwQzK5QGQCzssl939Pz1UF60RDcaSZfJfSwnpUs/+aLwuYpJekYoB+G0JiwnZyDTkZMQvhpEiUojIfRojknUnsUrVE3sjfy8g10O/+OzwzYk1nEY/GvV4eCocFWdJ5DXYwq98YbJTqPN3C31Urv7/znySpWNBua/FUupHjz7ZMMyrRgZA4VXGfYcDVHk+mn1INKUBLNLI9kw6EaSHZF2yFeZ86UO92hPs6exnw0qt5kFV21GMurj5ljve59xvh6uhu3sJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4126.eurprd04.prod.outlook.com
 (2603:10a6:803:47::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 02:53:20 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 02:53:20 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 02/14] hw/s390x: rename tod-qemu.c to tod-tcg.c
Date: Mon, 24 May 2021 10:52:44 +0800
Message-ID: <20210524025256.22252-2-acho@suse.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524025256.22252-1-acho@suse.com>
References: <20210524025256.22252-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.18.39]
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.18.39) by
 HK2PR04CA0057.apcprd04.prod.outlook.com (2603:1096:202:14::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 02:53:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ed32746-0ab0-4a7d-f787-08d91e5f1674
X-MS-TrafficTypeDiagnostic: VI1PR04MB4126:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4126A4FBED6B316A9896B129A0269@VI1PR04MB4126.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eDfxHcoE2LOYsu44hZYaxvvDhY6IfTgbevbCJW+g1oAUSSYYXmw2K+Pw6xbSGZI7VQs6TsAyErGDQE2C7scVATonRF3Njw7h80cGVqhDhfwBctWSe9qZbWyv9XpY3zvuV+QkHAx8cqeelnvqeXCbD0exvCt0e0HWXWnQ0dsei2nf6zipInUGZpZCSjCpI00DpQ3ld5o263ixg0b+Jmbs2bFl4FTDew9PreX7mKJjT84BmRLReOjDqRGbqAsljf5ONsAfFmHB1VtOh9nO3rhMjR5qpanfSsV+6gHJpyGi4gBihzvA0DnCpHQHNXsKw5+Q3zc1s3R1o+QPhsRAGJ6gABgxzm9ZcWGCmXLlOe5FEmAtPI03Ee6Cfi5u6qRNhZSqB74x1RkW90+KuHKzodaawGYyFk/ExvlEN0D9u4WXRSUxyvLw49rdSVzQPUFoy6LIm/rq8FXxBnPQRkXmRd8H1/BWy3T5eUNVB1tg2QbnZROn/XqLG1voXycyVxK9FOZtN8je4pbT5QXk/9KBVustCNgecdt9vi22w7N1ljNk91ThM8XHQHTJP/RcUN8BgRxb6cGbaEzDpkEa5tnlL6ZiSBmXPI3+5ZDtxLWVan3CdInnEuTJjXcCSf9e4483VJvCUBVVSMnK7+C9+Ih0LfR4VwEjN4Ittr4+Mjlk2ylvQdgLif9tiKGfzISlB+LV2cK/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(136003)(366004)(346002)(16526019)(4744005)(6506007)(1076003)(2906002)(956004)(26005)(6512007)(7416002)(6666004)(4326008)(107886003)(66556008)(5660300002)(6486002)(2616005)(83380400001)(186003)(38100700002)(316002)(36756003)(66476007)(478600001)(52116002)(8936002)(66946007)(8676002)(38350700002)(86362001)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AdXjME8Ap01t6moWPRsTjOSkYObOOdx5POkYWnqxIBus/N6OWC2EgaN4f/wT?=
 =?us-ascii?Q?diiLx3A0fFOtF29RCOVmhDM3zgI7w5S/3XyqleI1xzaYczWkxDYQ/Qi7NAUF?=
 =?us-ascii?Q?WugikodTImI2RR/HYdiSHNxt8xKz1IRj8m87JgQvgD/ZBLuZ2cZfYicWRmP/?=
 =?us-ascii?Q?u4sH4HtWDapOORG08VI2+u1sxT0TAdFNMH5o698VBNoWDkcQ1WlP8GaekRAb?=
 =?us-ascii?Q?YM57EqQHoWDVZf5yQU9erXI4zZ+Dj1Yzct7h5Z2EVwnNeIQxAHMPGymx4A9M?=
 =?us-ascii?Q?J43osfirzDhCfVfXkb3N+H17m9fL2gohzK/AuoSxEdDCL670AP9wiJrTdnDp?=
 =?us-ascii?Q?ap3FYzmQBFwFa+B3aqeva/fdulMYbTgbGckkXXI/KKlQRTxVtROO8ptBjnQY?=
 =?us-ascii?Q?dQxC+zNSSSuy/tpSiaOd2EtbHIrzrZThgh4OW0q7w6n1xXNJkFMycXd2Zzx8?=
 =?us-ascii?Q?qpR8NJ/6uv8NbfYYfDRfpoI75v+WZMzw59EaIbMKXHrZITP1GHnAhZ4uXDyA?=
 =?us-ascii?Q?YeElMYGem8LDRSuAKH8XGl/xXzjbhT3Plo/1qdPr8m9YTdkxFYQB6Xf9XjYq?=
 =?us-ascii?Q?yqE11PRX7DeEJrxRLoNiGx35mf1BGmIi/4bYWQ7jFspDuAvNbx3hsYRdqWDq?=
 =?us-ascii?Q?TkiCXHkTfm+LkfUfBePYDA6Yxl1i1vblT0F1lEVGmz3P/swGClmSb22cq4bp?=
 =?us-ascii?Q?mFCPaWnLK63x43aOOldDVI8+rpeyMtfDfzrTniQNnO2e9/yq5xlFruUpDSeK?=
 =?us-ascii?Q?TQvC/om9y+QVscPxnNWAWXoFy7zkN31tE09vyAoHMkZ8yCpCdEE9TpnDa/1G?=
 =?us-ascii?Q?Cs5F73Ylvk3+MiaLSytvTWopyVWk7uMC2TfOm/D27ZXBzbNIkzeNukX0dPai?=
 =?us-ascii?Q?5tWG4ldYy0Ybz/BhHFTK2dyqihCRWXLQK3Z7Q1HXvgcWzkyWqUDbnyE9uFNH?=
 =?us-ascii?Q?DnKXkE1HVQA28628neMvHVKR4+m0QvBfuiOrQ4K0ABDuH7vrrFmWZoVV+5Os?=
 =?us-ascii?Q?KTObR80Y/fxIxt1Vx7M51UZHVDQ/LpCHr4jz1AOj3mFaQeIEsogo0dvbIwLI?=
 =?us-ascii?Q?4EM0lQZg2vXIy6CNLAybDd5DUkNX9+P3AiSYK9J7Q/1fB1N5ja6Net/u5/Of?=
 =?us-ascii?Q?oJNBz7kvSd59S9VYORyvZWp7YIC+cI3hTqlT91kT5b2abVuhoK7Cq6S4EXsC?=
 =?us-ascii?Q?J4WxtmzNv5IkaGdeLKSHCkDz5dRuiZLGv9n96ePpTA96AlybCCVwx0QRc7sb?=
 =?us-ascii?Q?PckiddLGu5slOErC5K1OYcaW+SlNGw0PWNmd2R6ZU/PX3IN7vOLisSr6XCFl?=
 =?us-ascii?Q?UPBPU2SGHEGd2Mtc6wysMB67?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed32746-0ab0-4a7d-f787-08d91e5f1674
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 02:53:20.0874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSCVHvm93fe48HMOpxcQoczzwsaGwCymCM4mBQWADZq0ArYj7qePMTGkcVB0uBvO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4126
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

we stop short of renaming the actual qom object though,
so type remains TYPE_QEMU_S390_TOD, ie "s390-tod-qemu".

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Cho, Yu-Chen <acho@suse.com>
---
 hw/s390x/meson.build               | 2 +-
 hw/s390x/{tod-qemu.c =3D> tod-tcg.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename hw/s390x/{tod-qemu.c =3D> tod-tcg.c} (100%)

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 327e9c93af..02e81a9467 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -16,7 +16,7 @@ s390x_ss.add(files(
   'sclp.c',
   'sclpcpu.c',
   'sclpquiesce.c',
-  'tod-qemu.c',
+  'tod-tcg.c',
   'tod.c',
 ))
 s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-tcg.c
similarity index 100%
rename from hw/s390x/tod-qemu.c
rename to hw/s390x/tod-tcg.c
--=20
2.31.1


