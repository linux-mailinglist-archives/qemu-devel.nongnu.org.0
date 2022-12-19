Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B880965065F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75kE-0001oB-10; Sun, 18 Dec 2022 21:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75k1-0001e0-K2
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:59 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jz-0001Ck-EA
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416335; x=1702952335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sj/y8vrFJBlbuclXKhQf/IHAdoHqQPxC6w+uEVXB90w=;
 b=fbO1GueTa6C8x2PxxkJrJgW8b5gQ5WcWVBs7m3sVrL5apfbBiVGnnI0w
 dLBMcae5iHeea4nRkYvoJWZ/1XoD1I63tR8GpgObR7EPbhiMD1Aqd5z5C
 xo9RAD+vQnDj9vArEGbHbeCdRo+YnDWgZDlYnbdEO4PDnSgvKXPyy2zh/
 srdOzclI+OgoyaCjiV5jk2lv6YxflB2iDWF53EBqiWKLqV09+zLwFqrgg
 q7KXU0ml8wkDE3SxtDOVB1QbdWIBxm5LYgmLoz0JpgEQG7wIZvTxPcjBW
 d4IBWJqK+gfEje4A+2rCxHEi0AVtpRPsgWudbVdAW3qaEsYWcmgjIuOtz w==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056822"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:43 +0800
IronPort-SDR: o1fGOZV3ywSmyrpEpReLEWCEzxsIL9pJGp6AFgMU8q3fM6K6VO+xR9QVb3gtLt3NlXX1sggY4q
 R/TAjKaTWOsTH34lRCwBVBK5JdZXL1y/4XBIJ1R8m6V5cjWzSjIOKj7nW/Gptnb5Mi1+Jon5bc
 tHY1REq4A6p3frGgEflJkUzt3W0YLLTB6fy0dT70MoY/kJOCNWf9Bs+vSmdNcoSQQzJZVhd/HL
 3a6vlZesewSHfJh91HWbGi80JfJWy23A5q24yDVUuDgkCyVv2uv7oqV/PRnvO/nvcYWxCu3U+Z
 6KE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:37:00 -0800
IronPort-SDR: Tpn14YfXmXTsyWW39jVHgSUm6WakT23XG2Ob3dFzNImNBIt5HzyB0iy2/WPDjXflKkNVKnOOF7
 T/ZSIVffo/DXFAo4gTauOY/l46Hui66IiO7wd4fHL/0B23UIE37aGMOVmP9s1gXh2+KnCltFSF
 KKvXSIIYNe0XKxovTkhC+gdxYCpebwuUINABSmdKMNdNdrAY+le+aFV6P7yqRFJvar4LH3SRxF
 OLIOak+7diSan/2xN8W852c+/Wtcj5kyX9VtQjFWE4QjaWfJO6FOikA0BEL58+F20bSCBsewE/
 xe4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:44 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Kb6LmXz1RvLy
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416323; x=1674008324; bh=sj/y8vrFJBlbuclXKh
 Qf/IHAdoHqQPxC6w+uEVXB90w=; b=GK2pIjwZt4cezlkozgYkyLxHrA0xuFjNYi
 bLguZ5rOrdTNvCmSbWOKJlUcY6Zxh+wstCgeI4GEADFPbZhMApcCCCuufxdO3D9Y
 ttemQLsGRh0vUQuPvOEr+xQmUcl7pvMNorVSe5qCNX84TX2KNZBdGypkCaZfPas9
 Is/Eo8EMPqh7mQeTOU0ksUWpBFOT4enpWaQzc45NbNERhc36PbydNkvFLJU8vt3T
 vNzVg7hkdRCrY9ES6zX02hmz2Pi82eSb/9H2lhdGCyIw0Jg7/9Ox1f1C3S9TaXhi
 F0vTa45OOoz2O+yse0KpKTWGDWEcVh9ucPbzuHO3fXanKQL5Z8xQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UkpOZr8_sOPW for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:43 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3KZ1848z1RwtC;
 Sun, 18 Dec 2022 18:18:41 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 38/45] hw/intc: sifive_plic: Update "num-sources" property
 default value
Date: Mon, 19 Dec 2022 12:16:56 +1000
Message-Id: <20221219021703.20473-39-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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


