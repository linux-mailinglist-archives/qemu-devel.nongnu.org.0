Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6F6DC8BB
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:47:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltjf-0005bR-Vj; Mon, 10 Apr 2023 11:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <timothee.cocault@gmail.com>)
 id 1pltLV-0005Hl-Kh
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:22:17 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <timothee.cocault@gmail.com>)
 id 1pltLS-0006rs-Cc
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:22:15 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso6749614wmo.0
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681140128;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qEC5ld9obWWR9r+Og9BfQIoZ2SO4pUbU3drgpiRnJVM=;
 b=fmR1MmDNfZBRoM737TIkXkzZ9mDt0dNX36gddEmHGWSxCn6t4pngvmTBiT1NuDcVBp
 uD7a7yrSOEcicoyL9fgfGxPc44enSvzOFeVXoVOP5XNkblpsOBDYla0BZYRVRUtHVDUG
 0ZP0n6+UG+h3OyoZDIZPD4/rWJFr42yK9NscgjbVcYbPOyFiDwAKtuqCB+xZ+uB6+JPe
 6vVfvpfa6ABjDigTLOPJ/l73qd/2jd5lThihxw7A9LkiUr6EdvJ43MCLRO1pMIQ3zPS0
 R80YFUEZV/PxGFHTYCzTvOINGb3V5m29mlJ0QPmrOkXcnk8524XFcZhzXvNx9qxt0++F
 fSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681140128;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qEC5ld9obWWR9r+Og9BfQIoZ2SO4pUbU3drgpiRnJVM=;
 b=NRqy0vYWC9ikiMV7UrBa2EuMbhQiKDS9y5nHopD9/2NtjiZt6dP9IKxD324dUQ/4Pk
 PE+Yj6UHZFO6MUVODVmc8Xh1cYjTF6FavADn0PxxVEXfHXFucE8AjeGbVyqN3p/InvP7
 1RIf8yw0dyWYIdzr6pyGZkuR1V+lvbJd2cqhcoIHsHz40zJaawJWtE85d2p/T8Uwhlsk
 WBoHQiwictmLLR8JOfltX+kbOHUqmnHv35Xu+1TjK+APftJhWyj/JxCxMSg+E8k3w8Zf
 EpDbcspvIOhqo8IJ3UMbdCBOgd55BiYqUaAu0tm8UY1guyRu/8BX3k8CfH+2USOo10Rz
 nDzg==
X-Gm-Message-State: AAQBX9ccYYQ1oflvQE5YGQ1nze2t3RcnmylJxOMjXnfMHV2RD9Ia+L9P
 WXofFSehgMjzQ4JR3XGLCZld3HT6NfbZFDId
X-Google-Smtp-Source: AKy350amGt9P1X28yo9l6Fwwy6eeXbqrMWZwriCwJBv+nmNkgokfTBhIv3zU/oWfBHzQwha02XT4ew==
X-Received: by 2002:a7b:cb85:0:b0:3ea:e582:48dd with SMTP id
 m5-20020a7bcb85000000b003eae58248ddmr5257769wmi.34.1681140127958; 
 Mon, 10 Apr 2023 08:22:07 -0700 (PDT)
Received: from ?IPv6:2a01:cb08:8115:9e00:c5ce:940f:107a:4ac7?
 (2a01cb0881159e00c5ce940f107a4ac7.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8115:9e00:c5ce:940f:107a:4ac7])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a5d6712000000b002ef349e73cbsm11346624wru.19.2023.04.10.08.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 08:22:07 -0700 (PDT)
Message-ID: <6b31f5f523af93d47cac37509caf8036e183e136.camel@gmail.com>
Subject: [PATCH 1/1] e1000e: Fix tx/rx counters
From: timothee.cocault@gmail.com
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 10 Apr 2023 17:27:48 +0200
In-Reply-To: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
References: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=timothee.cocault@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 10 Apr 2023 11:47:14 -0400
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

The bytes and packets counter registers are cleared on read.

Copying the "total counter" registers to the "good counter" registers has
side effects.
If the "total" register is never read by the OS, it only gets incremented.
This leads to exponential growth of the "good" register.

This commit increments the counters individually to avoid this.

Signed-off-by: Timoth=C3=A9e Cocault <timothee.cocault@gmail.com>
---
 hw/net/e1000.c         | 5 ++---
 hw/net/e1000e_core.c   | 5 ++---
 hw/net/e1000x_common.c | 5 ++---
 hw/net/igb_core.c      | 5 ++---
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 23d660619f..59bacb5d3b 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -637,9 +637,8 @@ xmit_seg(E1000State *s)
=20
     e1000x_inc_reg_if_not_full(s->mac_reg, TPT);
     e1000x_grow_8reg_if_not_full(s->mac_reg, TOTL, s->tx.size + 4);
-    s->mac_reg[GPTC] =3D s->mac_reg[TPT];
-    s->mac_reg[GOTCL] =3D s->mac_reg[TOTL];
-    s->mac_reg[GOTCH] =3D s->mac_reg[TOTH];
+    e1000x_inc_reg_if_not_full(s->mac_reg, GPTC);
+    e1000x_grow_8reg_if_not_full(s->mac_reg, GOTCL, s->tx.size + 4);
 }
=20
 static void
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index c0c09b6965..cfa3f55e96 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -711,9 +711,8 @@ e1000e_on_tx_done_update_stats(E1000ECore *core, struct=
 NetTxPkt *tx_pkt)
         g_assert_not_reached();
     }
=20
-    core->mac[GPTC] =3D core->mac[TPT];
-    core->mac[GOTCL] =3D core->mac[TOTL];
-    core->mac[GOTCH] =3D core->mac[TOTH];
+    e1000x_inc_reg_if_not_full(core->mac, GPTC);
+    e1000x_grow_8reg_if_not_full(core->mac, GOTCL, tot_len);
 }
=20
 static void
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index b844af590a..4c8e7dcf70 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -220,15 +220,14 @@ e1000x_update_rx_total_stats(uint32_t *mac,
=20
     e1000x_increase_size_stats(mac, PRCregs, data_fcs_size);
     e1000x_inc_reg_if_not_full(mac, TPR);
-    mac[GPRC] =3D mac[TPR];
+    e1000x_inc_reg_if_not_full(mac, GPRC);
     /* TOR - Total Octets Received:
     * This register includes bytes received in a packet from the <Destinat=
ion
     * Address> field through the <CRC> field, inclusively.
     * Always include FCS length (4) in size.
     */
     e1000x_grow_8reg_if_not_full(mac, TORL, data_size + 4);
-    mac[GORCL] =3D mac[TORL];
-    mac[GORCH] =3D mac[TORH];
+    e1000x_grow_8reg_if_not_full(mac, GORCL, data_size + 4);
 }
=20
 void
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index d733fed6cf..826e7a6cf1 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -538,9 +538,8 @@ igb_on_tx_done_update_stats(IGBCore *core, struct NetTx=
Pkt *tx_pkt, int qn)
         g_assert_not_reached();
     }
=20
-    core->mac[GPTC] =3D core->mac[TPT];
-    core->mac[GOTCL] =3D core->mac[TOTL];
-    core->mac[GOTCH] =3D core->mac[TOTH];
+    e1000x_inc_reg_if_not_full(core->mac, GPTC);
+    e1000x_grow_8reg_if_not_full(core->mac, GOTCL, tot_len);
=20
     if (core->mac[MRQC] & 1) {
         uint16_t pool =3D qn % IGB_NUM_VM_POOLS;
--=20
2.40.0


