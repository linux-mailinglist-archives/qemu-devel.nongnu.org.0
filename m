Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E707187259
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:30:56 +0100 (CET)
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDuVr-0004yU-52
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52969)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jDtXq-0003oh-JG
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jDtXn-0002L4-4A
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:54 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33395)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jDtXm-0002F1-PH
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:50 -0400
Received: by mail-wr1-x443.google.com with SMTP id a25so22300652wrd.0
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 10:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgHi9WXNUZHnLRBdy+Pgdln+YAHhnpTOiH4IIfKf4LU=;
 b=eXNwtFkfRK1OE5wL3+rkMk3r7YTcZSQ25+S57cODagsMvJgbUjwABlplfOoZb2n60P
 gYM2UBQiJINb+Jbn4hqqjNjgEZwNh+FGahMs5JCW230DTlRBPRRBP+sigVCZ2JV4Y0r0
 XAJMFXBE0nI0vpCSNPs5xptZGBcwIqRAV992kW4ZFXt6hZH+tMDwU88rylOY7pNmPM/c
 btcrzlP3JrS1HpMEuQUutcIKX6hDhw1sAfLVWDSy7d6MICRDJJlm8Gv6mE0vLpIlSEkb
 ssox60Ym9g0ip63IOvNa/gWqMxXxBg0oWdmZTyh1EPl13LmSFKunCJ7sFmEtVEr7JmYf
 IPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgHi9WXNUZHnLRBdy+Pgdln+YAHhnpTOiH4IIfKf4LU=;
 b=NK4qqr1Vp/8Wa2fNWBeNsm0fIsriQzL1TH2Mb6IKLcxFrw/rxbVlH56xSEEzhuZdrG
 NJFekI0MqQAezl+Y8qauTiBeAZRzQzB55dXgizJWbYoQt+IRTTPbkRsK0L+QL8S4Uf7R
 nTrrmx1UkMzsZDLfqpHpnUfilyLe2+IZA/7AB4TnbVRMnigRy7eiQWYVRvq1tTu8Wc1O
 UAYQcB8qAdod0X+P/2001zb2EUFrTyL2n/Kz9ZP72UuRJfvq7Zz3GfZzNN9bnX9XGdLv
 RHop23PJQjnv1JvdzH2Tj024NDm5gIK8x8699yiV8g3xbPiHqodicBhQFzuiRjnyuoP9
 Ki0A==
X-Gm-Message-State: ANhLgQ0RkJdI3WG6WiCQHxd7br17mqejYS8NV50J68I1IHTPsM7AhKeK
 fAlhWZml4ovSwY5X8bImj7+FBA==
X-Google-Smtp-Source: ADFU+vs4ikaRMeN/D02OpBRLv1FcC9APqiASJrZVD8Wtx15ry/VdjBstKW98JXyvazLBgjiAfwqk4g==
X-Received: by 2002:adf:f652:: with SMTP id x18mr386201wrp.299.1584379729112; 
 Mon, 16 Mar 2020 10:28:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x16sm830249wrg.44.2020.03.16.10.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 10:28:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C289E1FFB3;
 Mon, 16 Mar 2020 17:21:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 26/28] gdbstub: change GDBState.last_packet to GByteArray
Date: Mon, 16 Mar 2020 17:21:53 +0000
Message-Id: <20200316172155.971-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Damien Hedde <damien.hedde@greensocs.com>

Remove the packet size upper limit by using a GByteArray
instead of a statically allocated array for last_packet.
Thus we can now send big packets.

Also remove the last_packet_len field and use last_packet->len
instead.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20191211160514.58373-2-damien.hedde@greensocs.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 gdbstub.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 0bcfc47a7c5..a60ef5125eb 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -351,8 +351,7 @@ typedef struct GDBState {
     int line_buf_index;
     int line_sum; /* running checksum */
     int line_csum; /* checksum at the end of the packet */
-    uint8_t last_packet[MAX_PACKET_LENGTH + 4];
-    int last_packet_len;
+    GByteArray *last_packet;
     int signal;
 #ifdef CONFIG_USER_ONLY
     int fd;
@@ -384,6 +383,7 @@ static void init_gdbserver_state(void)
     gdbserver_state.init = true;
     gdbserver_state.str_buf = g_string_new(NULL);
     gdbserver_state.mem_buf = g_byte_array_sized_new(MAX_PACKET_LENGTH);
+    gdbserver_state.last_packet = g_byte_array_sized_new(MAX_PACKET_LENGTH + 4);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -626,28 +626,29 @@ static void hexdump(const char *buf, int len,
 static int put_packet_binary(const char *buf, int len, bool dump)
 {
     int csum, i;
-    uint8_t *p;
-    uint8_t *ps = &gdbserver_state.last_packet[0];
+    uint8_t footer[3];
 
     if (dump && trace_event_get_state_backends(TRACE_GDBSTUB_IO_BINARYREPLY)) {
         hexdump(buf, len, trace_gdbstub_io_binaryreply);
     }
 
     for(;;) {
-        p = ps;
-        *(p++) = '$';
-        memcpy(p, buf, len);
-        p += len;
+        g_byte_array_set_size(gdbserver_state.last_packet, 0);
+        g_byte_array_append(gdbserver_state.last_packet,
+                            (const uint8_t *) "$", 1);
+        g_byte_array_append(gdbserver_state.last_packet,
+                            (const uint8_t *) buf, len);
         csum = 0;
         for(i = 0; i < len; i++) {
             csum += buf[i];
         }
-        *(p++) = '#';
-        *(p++) = tohex((csum >> 4) & 0xf);
-        *(p++) = tohex((csum) & 0xf);
+        footer[0] = '#';
+        footer[1] = tohex((csum >> 4) & 0xf);
+        footer[2] = tohex((csum) & 0xf);
+        g_byte_array_append(gdbserver_state.last_packet, footer, 3);
 
-        gdbserver_state.last_packet_len = p - ps;
-        put_buffer(ps, gdbserver_state.last_packet_len);
+        put_buffer(gdbserver_state.last_packet->data,
+                   gdbserver_state.last_packet->len);
 
 #ifdef CONFIG_USER_ONLY
         i = get_char();
@@ -2812,20 +2813,22 @@ static void gdb_read_byte(uint8_t ch)
     uint8_t reply;
 
 #ifndef CONFIG_USER_ONLY
-    if (gdbserver_state.last_packet_len) {
+    if (gdbserver_state.last_packet->len) {
         /* Waiting for a response to the last packet.  If we see the start
            of a new command then abandon the previous response.  */
         if (ch == '-') {
             trace_gdbstub_err_got_nack();
-            put_buffer((uint8_t *)gdbserver_state.last_packet, gdbserver_state.last_packet_len);
+            put_buffer(gdbserver_state.last_packet->data,
+                       gdbserver_state.last_packet->len);
         } else if (ch == '+') {
             trace_gdbstub_io_got_ack();
         } else {
             trace_gdbstub_io_got_unexpected(ch);
         }
 
-        if (ch == '+' || ch == '$')
-            gdbserver_state.last_packet_len = 0;
+        if (ch == '+' || ch == '$') {
+            g_byte_array_set_size(gdbserver_state.last_packet, 0);
+        }
         if (ch != '$')
             return;
     }
@@ -3209,7 +3212,7 @@ static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
     const char *p = (const char *)buf;
     int max_sz;
 
-    max_sz = (sizeof(gdbserver_state.last_packet) - 2) / 2;
+    max_sz = (MAX_PACKET_LENGTH / 2) + 1;
     for (;;) {
         if (len <= max_sz) {
             gdb_monitor_output(p, len);
-- 
2.20.1


