Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7213B7436
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:25:22 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEfx-0007hZ-PS
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbM-0001a0-TR
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:36 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:51096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEbK-00040D-Tu
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VF2/59L8YDrqB5M0pqJm99DiwF+5BnjXXXlY7qJ4JBg=;
 b=Xfk/PgVtFdz8JEpHZZvyNZlz4W+Aeh+T6FX2Dq2uZWLuPth4Gl/qkEuh1CEmTUYd0fQzHb
 AIHzoOBG3i+Vy2ksYa/EIvyPVIgw4DmXJEhtrz62dl89FpYMGVP35FtoKTc9s4loSdwUyO
 Yx080jVaR9nZiLV4KBkEcIkWKpCa7TY=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-9CaijboWM9eIIaGc_jhD6Q-1; Tue, 29 Jun 2021 16:20:32 +0200
X-MC-Unique: 9CaijboWM9eIIaGc_jhD6Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfM7V/IW1zKDNaP+26I5bYt+J/OTuKk1E0sJ4s1YZr4xRXZsbNPUzn2cp9GdypCGEJtCnPMDo7sAjU3ju9h2qZvxVkfELAJckWmj2i+1wnt4RzoA0z7U754Eh8IcP2bNzawt6HLUaWUyG1DJAY++2wN1vD3fols4YYKKXBdnjNYSOU4hvImFRR48vsTmKmvXcg8jWcSJWOOIRjgqAXsq98M50HLN0rHhebqpsnC3LftOlnZrBFN/CvMDI21sEqhfuxaiCZorfVzBLgcJHo50PiwmBkT47TaTJ8g7dd8lvd2ngGCLstRXISy6DMH+r876W5iDtf6qZ+u3LOqb2lDR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3z7la4Ehh2e367qEb7S19zAe6QWma/MbhP9SUT8Tke0=;
 b=CRQg5CbVJPb+AO0rq+dMar63XHov0up6Ys6dojbzZPx/ES/uCCl3rCpWaKaVq60ZDfUbW7nNbbpLyfIH/LFIEEapQeL0jnW7ucQR6FUefmkRIRczuAkypp5aOhl5RoRx/Cdmm7mPK0AgJnr13xwwOhhexiyB7HACTF5y4B7p8hiW/A3+oEIIF2SemPxitirO4VobAPbEqw4+jHBdDaO/8KkexGNMCY+exqqLxAXDNHmE8eZzMxhY9aKyNpDSkrkrdqEBmedIKmm8hwwS4jBRKkE2G7xaZAUGJ+JvEKOAUgeuWYOmJ/kYBcIQ2yyrqlWRzFELyjQearmywuOB2PSxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0402MB3327.eurprd04.prod.outlook.com
 (2603:10a6:803:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Tue, 29 Jun
 2021 14:20:31 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:20:31 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com,
 Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>
Subject: [RFC v6 09/13] target/s390x: make helper.c sysemu-only
Date: Tue, 29 Jun 2021 22:19:27 +0800
Message-ID: <20210629141931.4489-10-acho@suse.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629141931.4489-1-acho@suse.com>
References: <20210629141931.4489-1-acho@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HK0PR03CA0102.apcprd03.prod.outlook.com
 (2603:1096:203:b0::18) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HK0PR03CA0102.apcprd03.prod.outlook.com (2603:1096:203:b0::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Tue, 29 Jun 2021 14:20:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9556a71d-1d56-4784-f42a-08d93b090d3d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3327:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3327B6E1259F1F6707AA851EA0029@VI1PR0402MB3327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzFWBn89FvMz2azR5cgALWvukFdwk8RK3FPoNrwSRnOQJEqDOfZ+cQMn2llGlcfBPbMw/zxR8aXeIAie/Zf9HxNhAqA2oSpRs284T/tC8G4hQ/SHy6rhiK32uGc1Dia0tRM0D6KjPhkdKqHwP6Tj4J9AiSCwTW6cruryHBtwKycOD+X61QXgdF4XqdR9f7PbG1V12HsVgWesJ8T1mtVOlKEB1jjwC+8+lCKby1BYpif7ffFTRGFRF2TcpiuVxcQtqA9+t9QK8jF69OYIjlOyCnt7y8UWzKBmq9g40NcqB4fr3ydRBlok79Xg2fqIJpBa+kv6tcRo+1BSreKTZpGeGMRldFq6KaNvG/ikWV+uFNxC/DBqKRlTYN9B9MlRWfDp7UiqI5EsxqJ8aJ2EirCjQ3BCC6EfyaRHiXUDNdhlT5blBKaYiR+X94iHO3HH7U4fKZwukKo9SWQiF8VlIgcybuf2k/SXGk1fp+JdJTDaTrneyVkF1xsnBiCjOkSxHaYjS6p/QayESLnsk1bBM0XKUuqQkua7WOyyzGPDYnplPJ7YJkZ4pb7trAYcwYTWiaxjJYT6/QkkiQClfs9nZLJ0GG+oj8H48EtkNvsAg+8Ai073MbYNUJMPnBUXmCoLg5EA4XaUAURBNyYFUg8/lEyiNwoC95WnN3Jc9m/mDWAicDBQ+hoD8wfXKpiBjSILu1FCMGqLMJMlhoS8jH5BiUlDeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39850400004)(396003)(136003)(376002)(346002)(83380400001)(8676002)(6496006)(6666004)(16526019)(8936002)(186003)(86362001)(2906002)(478600001)(36756003)(4326008)(956004)(2616005)(66476007)(26005)(316002)(38100700002)(5660300002)(66946007)(66556008)(1076003)(6486002)(54906003)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RzhAqJMqYouiCnt6+mltzrvgrSV6+X2XZ9M4H/7z/yM3m0k50InJJeL7H6iI?=
 =?us-ascii?Q?tKVuhGEwjfoy3ZRZz4VlmSbCdMuzdTSIKsGfJj7m+2sGRcxAM9x3exiKiNBv?=
 =?us-ascii?Q?VR6jRwVGjeQzDdLlsXezPjvjA/YsMj/P5lkIX8boODuzzfH8EMj7MpN+D7DV?=
 =?us-ascii?Q?85bH0MRI0KyAx3vzfABZ9PeWTByxBoZ4VLsvcXTXSI3fbtdhXPCAOLauua5m?=
 =?us-ascii?Q?HnLbfNkqhgFIR+IybvTO8osGkanwM/seSIGGxtJjmlYnKG5AbuECBpFSpbxw?=
 =?us-ascii?Q?xaidBdlBxX66iN9bx5KTTkSoh4BG7gkFd7F/IuypCuV8t6tF1QAta3+wIpEt?=
 =?us-ascii?Q?YxQmnPTe/umqXaBgqYxww6RW35n6VffmgcIaq6b2Tc+Z+JBJQkvuMeXzd1Rh?=
 =?us-ascii?Q?siBpfw3HYjBP++DgzNozlvq0+CsTiL1ugLvybMopotyPOdkYbyqtZL4hQvdf?=
 =?us-ascii?Q?MFi38ffEZ7LfuwmoHI5LS5UsTwgf0LFuZylmxDnGhuIf4ihMCs3d1OuQq1sf?=
 =?us-ascii?Q?h90kX6WavKeJd5U+zI60XJOagKEUxzo7wdvyremDSYjBfbjmMCgzENTNc+2I?=
 =?us-ascii?Q?m7+3+327sRP62U2ozYxG66eYp93+v3fkmTEnOCg2K4OG1wgzfQ8rR8q38HCU?=
 =?us-ascii?Q?WQUhD0VF7fEJjZGIfClbrOGP8G2QkPHce+ZuFPCsuviEAp61/E2HG/cFnVtJ?=
 =?us-ascii?Q?ldFeiF63vCs3ayqPfC/3HMLXlrORnWMzGRkhyOUOPsa2aSf56/KygH/GE4Pp?=
 =?us-ascii?Q?1BwEpJUrbBB0Eaa14quSwW7gHh3+7xiyx54nq1KZlVxbVHUdC08DY7xhcTJy?=
 =?us-ascii?Q?49R8/fdeltjr28zeXO+m4GoMqQmLxwv+DbQwnq0kqn3hJg8yA9ab9hrJRLTG?=
 =?us-ascii?Q?2O9Z1MrpJYTy2tY9sfRh6XEC5LIOXqCeLqsepbwf4bBnHtUNx3+3znjqOAQD?=
 =?us-ascii?Q?O+6MctcywMR80dqzbEx+HQjWNN+NfQAJaXGmBbMIBCt32ZR0uC2bOooBpTp0?=
 =?us-ascii?Q?ll2xSX9bCtW8wc8o7lOXOPq8jrNQ4wk1oFN20CcEaBY9nSVvWsrYwpPS6sLW?=
 =?us-ascii?Q?X3ofelet5Zm3t4OQQWM627vqoAKrhplM9qaU1XJFhnYDHeyGhiivmDOf0MbP?=
 =?us-ascii?Q?1+K0MPxziFWvFi3OElPXMjZVVRuPCL3NG2h/bCDdVks6y0sBnY9lIAgrvADC?=
 =?us-ascii?Q?XdVXVQljAmv0KtRk8zEwzKmCqwW89PH4FU7KdtFnP4CWdLIHRinH9Q5GiOwd?=
 =?us-ascii?Q?CCXhWeuP4Gqnzkc6hyCF/e9FvLCz7b12r47wvDPFhsabfUZ/NPA5p6cwY7L6?=
 =?us-ascii?Q?hm+pWTl3HHc5Kq0+w0+iXrp6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9556a71d-1d56-4784-f42a-08d93b090d3d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:20:31.4043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGh9jIuOwz4Hq3aox9ep5WT79wGIdnBnHe8Gi5iyx1UIe5bFuVpS8HAn4b0Fb62I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3327
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 target/s390x/helper.c    | 9 +--------
 target/s390x/meson.build | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index c72e990f4d..a4d4665f67 100644
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
@@ -284,7 +281,3 @@ int s390_store_adtl_status(S390CPU *cpu, hwaddr addr, h=
waddr len)
     cpu_physical_memory_unmap(sa, len, 1, len);
     return 0;
 }
-#else
-/* For user-only, tcg is always enabled. */
-#define tcg_enabled() true
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


