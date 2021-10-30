Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2159D440A95
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:26:28 +0200 (CEST)
Received: from localhost ([::1]:51142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgs7f-00020w-72
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrp1-0002i1-7k
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgroy-0004nL-CT
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:07:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id y196so1227244wmc.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TSjS4mG+FduSZwcDdM9xHRv0BrOwT/zdGTxWqIBFem0=;
 b=jJEhm6kwb2z2zrN9JANcMv4Jak/IWaoqUmkegotqlwWx4q4wb2N4f53iaZqCyKjlrz
 IRHJhCML5Ya3Ns3c83LlzK7Ka836x4LqxSQTKQyA8uwvGYr66qXV8U6dHwbNXV8iw/of
 Iz7hcZ5bq2D0AoKRjeJt4lAmOEJKXKRAvTMXI0pUJD+2bZiSK59eO7rfEO3sKspDX63J
 483Nn4vT4ql2pFyCuYEAFd7w/6xSlvzQ7E26I7X4fAsc3sG6BxJ/Iyct/lYWs2n3yEsG
 nJN4IwlMbDTL96ijzTvjt7QlxpN9q1D/Rv4o0A1qhaQT15xUkFuIaDQdZNaZZfh3OT4I
 zdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TSjS4mG+FduSZwcDdM9xHRv0BrOwT/zdGTxWqIBFem0=;
 b=WwL/HA7PSQqUVYwVaDG6ScEipC4PQbQXBeK0tflWntGEnHiogbJ0ichuPBn+K4ekhQ
 fvQluEyuY7dxkFymNUwws7m7CZkTGcCG4Q+hvAEv0M0Tzd8mXdwJZSeGVltrCh3VDKvl
 tGBfO/Sgdx2oM+0a11ut3jjU9g8Yv02jREt5tzuZLr6IF3IaUKmTPDPJIndRpda5wA17
 3LaPQoI//NZkK2UWcBdPGZSm4eh+et6yGn33x3icgXt0tazZKqx4x5b6bJSntUYD+Onu
 BQ1HvEeecNY6iM0QbzW6W8GaPt9MzbLynIogOUIxwI30jIji0FTO/vnoK3NeO3teUI24
 4S0A==
X-Gm-Message-State: AOAM5310w+evw+I4S9Eo1SrP8m4xge8IhDR43j6pPdipUSgOnWpPIoQT
 XyLpNpB3hsNoHzQeUSEgb50MukOC+p0=
X-Google-Smtp-Source: ABdhPJwjpDk5OHkfkQWoIB/C/xVYCfB8be/gwCkBfm+3hIw99WjX06/J7lEVfbz141yDYafIVPQL4A==
X-Received: by 2002:a1c:a711:: with SMTP id q17mr9718680wme.158.1635613625952; 
 Sat, 30 Oct 2021 10:07:05 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h27sm2841146wmc.43.2021.10.30.10.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:07:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] hw/char/sh_serial: Rename type sh_serial_state to
 SHSerialState
Date: Sat, 30 Oct 2021 19:05:55 +0200
Message-Id: <20211030170615.2636436-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Coding style says types should be camel case.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <0f185653528c99eeeb2b4e4afb8b818d93298c20.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/sh_serial.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 2d6ea0042ed..bc5e0c44048 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -73,9 +73,9 @@ typedef struct {
     qemu_irq txi;
     qemu_irq tei;
     qemu_irq bri;
-} sh_serial_state;
+} SHSerialState;
 
-static void sh_serial_clear_fifo(sh_serial_state *s)
+static void sh_serial_clear_fifo(SHSerialState *s)
 {
     memset(s->rx_fifo, 0, SH_RX_FIFO_LENGTH);
     s->rx_cnt = 0;
@@ -86,7 +86,7 @@ static void sh_serial_clear_fifo(sh_serial_state *s)
 static void sh_serial_write(void *opaque, hwaddr offs,
                             uint64_t val, unsigned size)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     unsigned char ch;
 
     trace_sh_serial_write(size, offs, val);
@@ -204,7 +204,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
 static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                                unsigned size)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     uint32_t ret = UINT32_MAX;
 
 #if 0
@@ -309,12 +309,12 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
     return ret;
 }
 
-static int sh_serial_can_receive(sh_serial_state *s)
+static int sh_serial_can_receive(SHSerialState *s)
 {
     return s->scr & (1 << 4);
 }
 
-static void sh_serial_receive_break(sh_serial_state *s)
+static void sh_serial_receive_break(SHSerialState *s)
 {
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
         s->sr |= (1 << 4);
@@ -323,13 +323,13 @@ static void sh_serial_receive_break(sh_serial_state *s)
 
 static int sh_serial_can_receive1(void *opaque)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     return sh_serial_can_receive(s);
 }
 
 static void sh_serial_timeout_int(void *opaque)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
 
     s->flags |= SH_SERIAL_FLAG_RDF;
     if (s->scr & (1 << 6) && s->rxi) {
@@ -339,7 +339,7 @@ static void sh_serial_timeout_int(void *opaque)
 
 static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
 
     if (s->feat & SH_SERIAL_FEAT_SCIF) {
         int i;
@@ -369,7 +369,7 @@ static void sh_serial_receive1(void *opaque, const uint8_t *buf, int size)
 
 static void sh_serial_event(void *opaque, QEMUChrEvent event)
 {
-    sh_serial_state *s = opaque;
+    SHSerialState *s = opaque;
     if (event == CHR_EVENT_BREAK) {
         sh_serial_receive_break(s);
     }
@@ -390,9 +390,7 @@ void sh_serial_init(MemoryRegion *sysmem,
                     qemu_irq tei_source,
                     qemu_irq bri_source)
 {
-    sh_serial_state *s;
-
-    s = g_malloc0(sizeof(sh_serial_state));
+    SHSerialState *s = g_malloc0(sizeof(*s));
 
     s->feat = feat;
     s->flags = SH_SERIAL_FLAG_TEND | SH_SERIAL_FLAG_TDE;
-- 
2.31.1


