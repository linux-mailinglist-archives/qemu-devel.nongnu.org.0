Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B48B65FA2C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:27:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdE1-0002vE-3x; Thu, 05 Jan 2023 22:16:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDG-0002dS-EK
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:17 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdDE-000892-2j
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:16:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974967; x=1704510967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oiuF/EywIGESOtww/S78MpW/jgEiP1aljsNVW6OHFUM=;
 b=L2p+pmTydZotyt5k8o2nHRgw/DY7MoHHukKv6QTUiy7z/v4pBZQwTtCh
 VK8Sv9/iO7wbruLgoP4SxW0wPe4+st6bdhawZcUdlgouv+N3VVfzfOhsH
 ccOk+e2nKLM3JKFSmOQv+oJe5dETlw4pk89knTo06HYbXrDnQaBegLym+
 a+RSqWpse4Mxh2vywPJarxyzWkybBIY7GvMeq8o4VhyifnDGmiOpfN0vD
 ZDmcWKayIs0XcYPU6grvrAaU/2AN6tNIXiowdr386nL5HNhrFKmsmiky6
 StDRKjT9GIjcOl/kx74ErNZBb+3BUiMvIJju1aJ8Jf4hfozBvA1U24zxB A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254835"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:15:08 +0800
IronPort-SDR: NlVpMPXFFYkcf2IRd1x3Fmj/8+ee+tT4h/8CDvviEgigLKxR+3m4u6hM7YVkePOAT3skY6xy3L
 3O0qX21zRBKo/DCcgmUxcgdKVyvksCyQD5SKHWd76mJVYLIMwzTiUlp87i1/YaOhAh1+baLM1m
 X2f6V99JYqVKv6tZg0Qlu4Da2dD9sBVWlhMLHtkFL24hsicH/YNc23i/DsJpa4Z8nwQp1hq/kK
 gkfSgbn9X9drwsVFWffuzJhOFVw/tBBpKTzjFH38t0OHRPzZFh9W6yl9SJCcni5b64L8Z3esXy
 FoQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:27:19 -0800
IronPort-SDR: BxqYA6uhwrguoIBEJbGg9lG8CPy+Yq3iGUkDw34CR7noHbLmOOYoAap9I4xPSmlVHP0hXqhzqJ
 tV4vqxQGzOij2vinlXH2dVDB+XS6rlAjHpha0sBrn45aMTBbLIkulV7lQT7WF4WUShEwTrakqC
 R/XJbAZih2LcTXiMHclE/Lf6JHZxpEf12IEcsfn0nVByLbbdlkrLGDf0N5k5QFgrW0jo+AQopv
 OgNxs6GpumrTpLcFfQOnji5dcTXEIpMc45kh345y3k1nbGndPw1RepSA2mUjchqKBSkw+ouhV2
 vI4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:15:10 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7kN2DwRz1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:15:08 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974907; x=1675566908; bh=oiuF/EywIGESOtww/S
 78MpW/jgEiP1aljsNVW6OHFUM=; b=ZkV+o9gT+UnI8K0V4ZQE1iHQNEAMhuaCIa
 tPxpeMpOzBy7/PbfdGJJKNOsjBhU+Uyzm98ROsWw/Z8Z8RZFnDVsmy2IIh+eYzq7
 TS+APVE9lRD1nCZQfnpacOuA9mEIoqjf2yBv/bjyLYZ4KmSW9tnqbfGZLsWt73tl
 2IEIX3/ea1uxvwgP+6wi32fKcZrUhjTaSa6m+qO1fwDmivHlDfcyk+14UPnFAYp9
 aNFDR+hdvESswFf0bde9eW6AWfD1GLe0qeoHsoicxiUSol6mMBD0M35xsfyovJkI
 RlPeYyKnO/afhWEsqAgjhF7CrJaULQs2+QFZfsPxKuUygSM1v/cQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9H2gb_jfpcS1 for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:15:07 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7kL4yT5z1RvTr;
 Thu,  5 Jan 2023 19:15:06 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 36/43] hw/intc: sifive_plic: Update "num-sources" property
 default value
Date: Fri,  6 Jan 2023 13:13:50 +1000
Message-Id: <20230106031357.777790-37-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

At present the default value of "num-sources" property is zero,
which does not make a lot of sense, as in sifive_plic_realize()
we see s->bitfield_words is calculated by:

  s->bitfield_words =3D (s->num_sources + 31) >> 5;

if the we don't configure "num-sources" property its default value
zero makes s->bitfield_words zero too, which isn't true because
interrupt source 0 still occupies one word.

Let's change the default value to 1 meaning that only interrupt
source 0 is supported by default and a sanity check in realize().

While we are here, add a comment to describe the exact meaning of
this property that the number should include interrupt source 0.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-9-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 9cb4c6d6d4..1edeb1e1ed 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -363,6 +363,11 @@ static void sifive_plic_realize(DeviceState *dev, Er=
ror **errp)
=20
     parse_hart_config(s);
=20
+    if (!s->num_sources) {
+        error_setg(errp, "plic: invalid number of interrupt sources");
+        return;
+    }
+
     s->bitfield_words =3D (s->num_sources + 31) >> 5;
     s->num_enables =3D s->bitfield_words * s->num_addrs;
     s->source_priority =3D g_new0(uint32_t, s->num_sources);
@@ -420,7 +425,8 @@ static const VMStateDescription vmstate_sifive_plic =3D=
 {
 static Property sifive_plic_properties[] =3D {
     DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
     DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
-    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
+    /* number of interrupt sources including interrupt source 0 */
+    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 1),
     DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
     DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
     DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
--=20
2.39.0


