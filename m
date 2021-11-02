Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BE9443998
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:25:56 +0100 (CET)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3AB-0003Qg-8D
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36o-000676-Nt; Tue, 02 Nov 2021 19:22:28 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:48497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36m-0006Mt-3V; Tue, 02 Nov 2021 19:22:26 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1My6xz-1mYEf12yfH-00zU0A; Wed, 03
 Nov 2021 00:22:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] hw/input/lasips2: Fix typos in function names
Date: Wed,  3 Nov 2021 00:22:12 +0100
Message-Id: <20211102232212.2911638-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102232212.2911638-1-laurent@vivier.eu>
References: <20211102232212.2911638-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1Va5+AUHsEKCs5nJcxLCECMp9gMOKNWhVv4EI9CVyzEfFqFOzO4
 OeGcSoyf3SliP709XeHLpKvBmu1B7n8nQhKlhVh0pkCz6aN0Q5mqIBnTZEPkueHTBf7fOW6
 biHFfMOpGsXUfcZxDVYeWFy1J5+XicBOE5oaM1nXIiIsPQqrVB07Bf5GzmYvvGwMPW4+oi+
 p1KT8647KyqHpc41h3/LQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ac3bDVIYQcQ=:8httf/N825RT7G/2wjZ65G
 va9D6WEVIYXf0odfjYEf5SIjyAyOdA7SJZRZVPru1BqofDLvSnzgzZug3mGcg3FqnoZlh5Khh
 2G2MC9dpEbP6p0d05NQoejxiU50QZOSUTUrVG/r53vHSKWh88h81/anFBiOHMoL1z8dpoOOyN
 Yjksh3dONPAh/tNux8wLfaK77L54Ux0jWKsS8qwYr3igsTC1BNl9E6kGaFHgl8chp73HUGR8x
 RB9duYai+kulHFmVb6EkOOS9Cn2wHAmAFfzErUyqVKlUF6VLM7oHy/6V+rPhzWvlkG7z6KfMI
 AKA+TqebcpGPLhaMcAsXyXbxRG6Pm6i5zux1Z294UGYbwcx7IUMTx3SqngtfFWUThVkK+/dnd
 7Mi94ouycG4TFdhghGAxXRVC9iYs6n+XiTZSzD4vMBHaUo8KT6QD+s+qm+4TCBkHf21U/XVSJ
 hOG879OBbjYGhJUNBJ1p5S595J7YKjIpSl1juTsAm5YBldQXrQkZv7G/6PQAI1aY2dh+SXhRI
 PlnhNcTO61tZvr1taXCaM2n70xY49rToHqQ8fNPhuBrX5A4l9ncPO9wJIxTsF+86/UtzfnbRN
 6gBxwS4LXcp+X8XCtyA5Gv0rBCKlzJsrWx7tfjLRLRqGdztrVg0b3zO5P5D2tKB4ZvGrdJKSm
 VZKTGG0dZja4swHo9oHfsCv0/uuJqAKyN/K2rsIjPaXSJxz2RNA7AMsu4Pf/3DnMxsmU=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Artist is another device, this one is the Lasi PS/2.
Rename the functions accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Message-Id: <20210920064048.2729397-2-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/input/lasips2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index e7faf24058b4..68d741d34215 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -96,7 +96,7 @@ typedef enum {
     LASIPS2_STATUS_CLKSHD = 0x80,
 } lasips2_status_reg_t;
 
-static const char *artist_read_reg_name(uint64_t addr)
+static const char *lasips2_read_reg_name(uint64_t addr)
 {
     switch (addr & 0xc) {
     case REG_PS2_ID:
@@ -116,7 +116,7 @@ static const char *artist_read_reg_name(uint64_t addr)
     }
 }
 
-static const char *artist_write_reg_name(uint64_t addr)
+static const char *lasips2_write_reg_name(uint64_t addr)
 {
     switch (addr & 0x0c) {
     case REG_PS2_RESET:
@@ -145,7 +145,7 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
     LASIPS2Port *port = opaque;
 
     trace_lasips2_reg_write(size, port->id, addr,
-                            artist_write_reg_name(addr), val);
+                            lasips2_write_reg_name(addr), val);
 
     switch (addr & 0xc) {
     case REG_PS2_CONTROL:
@@ -239,7 +239,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
     trace_lasips2_reg_read(size, port->id, addr,
-                           artist_read_reg_name(addr), ret);
+                           lasips2_read_reg_name(addr), ret);
 
     return ret;
 }
-- 
2.31.1


