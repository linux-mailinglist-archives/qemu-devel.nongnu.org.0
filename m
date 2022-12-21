Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B776538F4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:44:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87oA-0003Ba-Jc; Wed, 21 Dec 2022 17:43:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nv-00039u-7x
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:15 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nt-0000bQ-EK
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662593; x=1703198593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sj/y8vrFJBlbuclXKhQf/IHAdoHqQPxC6w+uEVXB90w=;
 b=GJ8PDHVcyktsEAX7V/vJb9bXMWRMUxLrpE9XnbXNzLNfTGJjIy8QjWLu
 MMEZMYiWB47/2IXgAuYfazeXxg0FXG+2D7bKRqn0uH1jrfbk6CDq5qeK9
 7ezRU+jj/xZe+O5is97AVSizl/hMzXeKPKmyEz92Hy+dIoTR8Qf97I9ol
 /RQxHtcYU4UuGJwcKkwt2IvrAbD7iRA5Gi9ElpKIV+h+VxOU7dcQN59AV
 YGMYk8Jj3c+0PjY9uY4gX3ufXCQQwCSBdtHDGAJfoM0dFVkeGD6ui+x1l
 1i6wMvnLjHY1YJGOkWCxf/wqN8wlbtmNTUAsk8J+Qr8OtZvXLIYJWybV/ A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561447"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:49 +0800
IronPort-SDR: HtPITfXbIM14kBeK4+egcymg4u+m1x2Ahqj9/jMrridTrcFFOkoqgl6cl4h/xQHCGytZ97ntV8
 PCOJ4SFjlFmu7WsaabZ2xQZVrRT9DUWCejd4CEfZJKwbRuyxSBGmKGDoC90wsyCaPNtaRpJ3uH
 Ft8SHEf0iGfp+zBHSNd1l/rvHr2YQ4hEOkne85IpHlY/iVqGVWkRFPDp02Y+GgKsmH4QF9o+lm
 UZjyiQxnWR23ZWnYkJARwrX8QEzKRwiAxdpVbNyqCtEmbqrVA3HbrVkK58RDnPXHBdPkSGoaaK
 gCo=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:18 -0800
IronPort-SDR: inNsba2KS46sKXSq/z6wiRsxjshQrzmkYjWMqn6JSI85a+tqqWZsummXTAhdAJvkoAgZBboAXi
 YR5Hu6h2uoF9u2dPZebDx7ayySeBTHtTFGs46VHH3X7hNpYezepHs1xMEtyVUabTo0WdWvmwOZ
 kutUPGsLqXusYRN+rQ6rq1Xs9YdlIk33ph5l9ZEX4+asKBMTlI9nXD5iptXJiAm2UqCdeTez29
 /CMkXtK7whLgmfLUyyiDjYiQafJqJD2RiJ7p3YZksufwdxAHBhwNrmYDFRIIA7sCAYkSjUi7Xp
 OuY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMx43qMz1RvLy
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662509; x=1674254510; bh=sj/y8vrFJBlbuclXKh
 Qf/IHAdoHqQPxC6w+uEVXB90w=; b=V+DaDnDF7O6JmMuohY6WywepxnblUy+/cb
 yXjPu8do+AsATVJnnowRip4T3P/KHct4G9mszJ1nxEFt9mCTmgJpKLWxcyrjVJIK
 3+zc+VnKoLhNm+qM/j0HnGO5/CmEuqzPfx/DCWKwyfH7pcCO3HmiKa+AXh8OZpI0
 ZDssgHstEVi16D7V8IPZiEtC81sQybLJDePIGxjb59mzVtjIIrWFptq5u8K3U7kE
 KI4m9ucklZ60av5RmMMnGxJNsAqGRcv2kqrnHIRmw9Vv3NUNdG+wsp9EqY+gw5wv
 V9BdvxdExCupIublm2O7mQEIIZgwgEawl8IZJUz/JQi2FLx19evQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id iJ88hD72zIAK for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:49 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMw0PpRz1RwtC;
 Wed, 21 Dec 2022 14:41:47 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 38/45] hw/intc: sifive_plic: Update "num-sources" property
 default value
Date: Thu, 22 Dec 2022 08:40:15 +1000
Message-Id: <20221221224022.425831-39-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
2.38.1


