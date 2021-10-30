Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0EF440A9B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:29:06 +0200 (CEST)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsAD-00082m-IA
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqJ-0005WZ-Ow
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgrqI-0004w8-5G
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:08:31 -0400
Received: by mail-wm1-x32a.google.com with SMTP id z200so9572630wmc.1
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YSsZNkyD3Zes1gnfTeUQlqwahoB1RipDt5E4DXFrMSg=;
 b=l6fP6LUeWn5DwLqP0DQJjBS74Xu4NGi/97c946kOlYutRcfHZCthjeu6WpcuSCsVh6
 zjuV+b8aoVFhHgsCkhXrDG3dLJkcjx9Qo92E5AUDy05DBpMsfVdjMoGPZjXkyT8ccepp
 fEUTfLY1B0UGTGMM3OnI29aTH2LVNMtu/B8VTHs+6wHROuJkozbU2xCXbYSuIQ0PVzYo
 G5AQJsUHYYz8nV33KoDraU/05uoGo9FSL8JHN4JqYmkbXjvkHcRiQxJVAt4n7pyKkbKM
 daWf0r2XpLD+c/GJZf3Z/S9A3a7XMpYZ9bY3TkpupYdlQeeDf62/BrhEeY0HT/1aAdgv
 9yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YSsZNkyD3Zes1gnfTeUQlqwahoB1RipDt5E4DXFrMSg=;
 b=OaqQZZZ37OcnaHZ+0FcI2MqKWojoBUvZIscflQaUwaNbdtRc4XUv+ib0+vesq2CbHp
 v7J23PSLF6QZh7/orQKWXoNnvP+TXKbTiKAfkn7sz12ua+po0DFsXrS0jPaCH/Lv7Lil
 y2lr/3bfKwG4EYN+PZXB+V9ZrXtglBmwsAuUhiahE+CJeYqixV0dCTww80ekylc+rEBK
 KvrXHhK9JDaQbrgNkua2yJlUjRUjR8oUsYg09LOpPFEbRVXQfp3i71zkO7kE8dln0Gum
 Lu7xxBPEmvvIxfSRy5q2SSuJTZ7XNddN/Qy+rN6JQb6ITXSOcp5XLMIaM+WWj/9qAcWd
 b9CA==
X-Gm-Message-State: AOAM531dGhaQOzvbGQxKTYELoXQRSd45LU6lcEFI5AQ5qAtfrEaQ/Bkh
 47Zg/iib3eyxg/bp2SWjjGa3jInOgXY=
X-Google-Smtp-Source: ABdhPJxtUifmFzB+p5EnMCGiL6gJBZVC9fMiYRcnghK00s/WKHKWTl9P/cMcza4mgN8IgftkIq3Zag==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr28314483wmq.62.1635613708762; 
 Sat, 30 Oct 2021 10:08:28 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 q14sm8680327wrr.28.2021.10.30.10.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:08:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/30] hw/timer/sh_timer: Rename sh_timer_state to SHTimerState
Date: Sat, 30 Oct 2021 19:06:12 +0200
Message-Id: <20211030170615.2636436-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211030170615.2636436-1-f4bug@amsat.org>
References: <20211030170615.2636436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
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
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

According to coding style types should be camel case, also remove
unneded casts from void *.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <d9a9d160c1153a583397e366ab06477f5a31c507.1635541329.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/sh_timer.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index e1b6145df82..2038adfb0a8 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -45,11 +45,11 @@ typedef struct {
     int feat;
     int enabled;
     qemu_irq irq;
-} sh_timer_state;
+} SHTimerState;
 
 /* Check all active timers, and schedule the next timer interrupt. */
 
-static void sh_timer_update(sh_timer_state *s)
+static void sh_timer_update(SHTimerState *s)
 {
     int new_level = s->int_level && (s->tcr & TIMER_TCR_UNIE);
 
@@ -62,7 +62,7 @@ static void sh_timer_update(sh_timer_state *s)
 
 static uint32_t sh_timer_read(void *opaque, hwaddr offset)
 {
-    sh_timer_state *s = (sh_timer_state *)opaque;
+    SHTimerState *s = opaque;
 
     switch (offset >> 2) {
     case OFFSET_TCOR:
@@ -85,7 +85,7 @@ static uint32_t sh_timer_read(void *opaque, hwaddr offset)
 static void sh_timer_write(void *opaque, hwaddr offset,
                             uint32_t value)
 {
-    sh_timer_state *s = (sh_timer_state *)opaque;
+    SHTimerState *s = opaque;
     int freq;
 
     switch (offset >> 2) {
@@ -200,7 +200,7 @@ static void sh_timer_write(void *opaque, hwaddr offset,
 
 static void sh_timer_start_stop(void *opaque, int enable)
 {
-    sh_timer_state *s = (sh_timer_state *)opaque;
+    SHTimerState *s = opaque;
 
     trace_sh_timer_start_stop(enable, s->enabled);
     ptimer_transaction_begin(s->timer);
@@ -216,14 +216,14 @@ static void sh_timer_start_stop(void *opaque, int enable)
 
 static void sh_timer_tick(void *opaque)
 {
-    sh_timer_state *s = (sh_timer_state *)opaque;
+    SHTimerState *s = opaque;
     s->int_level = s->enabled;
     sh_timer_update(s);
 }
 
 static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
 {
-    sh_timer_state *s;
+    SHTimerState *s;
 
     s = g_malloc0(sizeof(*s));
     s->freq = freq;
@@ -259,7 +259,7 @@ typedef struct {
 static uint64_t tmu012_read(void *opaque, hwaddr offset,
                             unsigned size)
 {
-    tmu012_state *s = (tmu012_state *)opaque;
+    tmu012_state *s = opaque;
 
     trace_sh_timer_read(offset);
     if (offset >= 0x20) {
@@ -289,7 +289,7 @@ static uint64_t tmu012_read(void *opaque, hwaddr offset,
 static void tmu012_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
-    tmu012_state *s = (tmu012_state *)opaque;
+    tmu012_state *s = opaque;
 
     trace_sh_timer_write(offset, value);
     if (offset >= 0x20) {
-- 
2.31.1


