Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12927524139
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 01:54:09 +0200 (CEST)
Received: from localhost ([::1]:33876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1now9g-0005De-2O
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 19:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6s-0002X4-UM
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:14 -0400
Received: from mout.gmx.net ([212.227.17.20]:56407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1now6p-0007T8-ND
 for qemu-devel@nongnu.org; Wed, 11 May 2022 19:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652313056;
 bh=VAEp91koRKEvZdvh85pf0UnR5tJIQLrXBi0obfbPYe4=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=GqUBz+Lwa/PFAS2dftRizTtlbvKYBA7e5gvcnEkyrDul0aosjjcyQh5JnC1Mi/lU3
 r7Nc9eYunytw35iD+wn87afxzsw8giIbEapgq8zZXvbVG+IcGY+8/DA5h8B/aEoXbR
 1sGjfxLWlsjcOe2Or4Se20WajgeQWyxaFOWQx5rY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.141.127]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvLB-1nNgK23tNF-00Rmvh; Thu, 12
 May 2022 01:50:56 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Sven Schnelle <svens@stackframe.org>
Subject: [PATCH 2/6] artist: Introduce constant for max cursor size
Date: Thu, 12 May 2022 01:50:50 +0200
Message-Id: <20220511235054.185435-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220511235054.185435-1-deller@gmx.de>
References: <20220511235054.185435-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sTvW2SVcqscYr9EUflOUF3SICyDjFnomlrR9sxCst2aZf8L3JNV
 PXfWjYKGgSYmh/s7pOefKRZCfvMVntIzwnbk0CXFnqCBjWzm/VNUKMRxWGnK37u401BWqEd
 /8uwcdJIoOGxUQ7NLf0dJf36tCEmaDIjd9M7/p6ebWz1GW5aeLVJndq/8+Prj/5KgxwcS12
 8F4VmGHKdzbgsbSZXorbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gE/NsPOzgGQ=:F6Pfsr3oaLg9QmtWNM9kKx
 RUKQFIRJRiClRnmzHXt6VB7frzBc3oZXvq4T4BBNjC3gSriv7nl1T3RqD+tOonWdLV5bDoLUv
 rDjxVhm3Q30qKAlnDXJeQXLNlrw2QjUdXyuctlMGlj+9PQD5QYr/h22+sJAQHqc1fkQgijWfF
 f6VoJQZ85tpVws6mnS4mm5ill9RdLYUeICIZxZtgO3qKmmee/+y97YAcEnTIvD2CfRPVY52CD
 2DhLbhPclmB1ASUz4e9Lt8TzZbCgqD3fhQCkviDhROLTpJcLLkfSyGwbAXp04Huxtv2bT8Xth
 nWEebI8/BOJQWFug4EVoLOVGp85HGkK3KQipLxcYY7hMVgWb87jRyz7nFe2E55mtWWKKvdSh2
 TABBvBy+uVqpLX86GE9Iv6sygUJ3H93SL8CmKrPX0wPH9pVAYlXH3IHd7ufdKiOhY4Z2cVeVk
 zFr3HvmW4+7wXi0+Ma00koYPaoEH+j5t1EjJXiqUIJujNy3mQfQ1/VsTNPusEgj/LKqOuRO2I
 Vv8U8+xNGnOIxCWugZEN9aQ0IB8THdQ6HdVrgJfTqT6wSApvmVDAb4Ckn9lprpPI9WMp/EUEB
 Z4lPPsyZIoTcWHNIHlGYjV85ks9qA6BbqHflltaIYK4WYN5ujgveKX/ugWQYw75F8X2/tT2ig
 1W88v9GHL/re7u92PVN/Khk7KGYz2ZptepxohSLHmxEvw+Yh2KXI0enuprJGF6SaayMMvY9as
 uRaf9Hp3zxLi97/lB9L+irjUP+olQc4SFPZsV+qqASJnsur96j2Ct5tkdEbRDID7QuioagcJb
 8+SFyJ6nv2hKQ+NMpW9lQEWEG5tNqdxTX7PvJlzJlZSzt1EsU6z+1pL46lIf33j3x3OEVbEOV
 FTbjtJ+BOX3ZdG/szqMdVn6EtECNMpO2wJ7ZVitCqBtDiaPJbnm90DaOoSUbqkCAMjQ9URg+g
 7gikScuI4/+A3lBbTwOyB4LCuev9jmgQqb1fMrL+9/LhYgCKe7DlagP0TtHTzOYGeEmEfQLnm
 XRdyh/wCGQtJsNbGNNwpedT6Ali1RU2Ulc4nu/XoRZOBblwHSJHWvhWhBOyOxVQ815K5fYqS1
 3T/VB3DxHg1TaM=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the constant NGLE_MAX_SPRITE_SIZE which defines the currently
maximum supported cursor size.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/display/artist.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 39fc0c4ca5..6333ee41db 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -98,6 +98,9 @@ struct ARTISTState {
     int draw_line_pattern;
 };

+/* hardware allows up to 64x64, but we emulate 32x32 only. */
+#define NGLE_MAX_SPRITE_SIZE    32
+
 typedef enum {
     ARTIST_BUFFER_AP =3D 1,
     ARTIST_BUFFER_OVERLAY =3D 2,
@@ -1325,11 +1328,10 @@ static void artist_realizefn(DeviceState *dev, Err=
or **errp)
     framebuffer_update_memory_section(&s->fbsection, &buf->mr, 0,
                                       buf->width, buf->height);
     /*
-     * no idea whether the cursor is fixed size or not, so assume 32x32 w=
hich
-     * seems sufficient for HP-UX X11.
+     * Artist cursor max size
      */
-    s->cursor_height =3D 32;
-    s->cursor_width =3D 32;
+    s->cursor_height =3D NGLE_MAX_SPRITE_SIZE;
+    s->cursor_width =3D NGLE_MAX_SPRITE_SIZE;

     /*
      * These two registers are not initialized by seabios's STI implement=
ation.
=2D-
2.35.3


