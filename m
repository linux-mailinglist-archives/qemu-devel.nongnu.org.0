Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AA64BFF2F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:48:25 +0100 (CET)
Received: from localhost ([::1]:40804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYKu-0008SV-OY
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:48:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXqE-00085w-BB; Tue, 22 Feb 2022 11:16:43 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:43053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXqC-0005cv-Ph; Tue, 22 Feb 2022 11:16:42 -0500
Received: from quad ([82.142.17.50]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mdv2u-1nvKQN1XfS-00b1fY; Tue, 22
 Feb 2022 17:16:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] hw/nvram: use at24 macro
Date: Tue, 22 Feb 2022 17:16:21 +0100
Message-Id: <20220222161624.382218-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222161624.382218-1-laurent@vivier.eu>
References: <20220222161624.382218-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i6YXL2oOuSspIHI9tjBbj2CB3SS0ph6p4gtrAyOii/ZfInlyAAR
 BXq/Y43MfmmGeWa4rYqTFByS3runjoTtLJ/nmX9aYPnn1+DUN10BYkWu4ny+si9lsRYanvf
 10X8jOnnyr2asKzJSjOicugXFZ0oHE2eD9tcBnMkawHzRSqv09Ir7gLggSYeQc59U+gGH2b
 qUzq/YXKkjUt0xTHivicQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v+knrSGZsUc=:yEjVVl5omTtj/RO95Uv7lW
 p1RqHZUrbDiqveS3TmrLPY4qRtalpD/3YPTNOuYrdJHU6Xqm8OOd2sQGHBL9ledqs3pgkYfJ/
 TWmMLL+5V4MWSEB8ebdnZwYyizQM87LVltTItBKKnAZNngBtCxjYv3J3ZyCmJiMzpANfKP9ek
 GsUQ6I15skYr5eF3bmM6apt5OG61Q8hC2rd6Q4nJZgjmTWjnie4FKwSPUW8NnR/6v2TAY3V5o
 bAiSCl9Gk+hAT0iPgYotAamFKVIixq3DA8+/P0czhGRJObLnKDe5OU1gfqPgOvVu08MH5FpYw
 wyZjaBUbjweoyfOKWCjA5pV/VI/bhvV/o2lvz7btEVDjiuZP7LueYiUXP4ZkqIdGzHXFYrxOi
 TukgfAzToMZhrEYVrhrrQA1PoapG55CuyZIcCgtD9Ip0em4T+6KVAgN1528hV4CuxJNDbTFGj
 0aWRbbe1gXqLl4orXO0kYsyECh90HxQuMVQr6WHJ4C7kuQpakUs7m39wkHRmZRQczakK2GUzE
 N7ThBK8kXjQZMdPtDjdcqZtqldfXiwr33dSwMsTRF9uHAzb4xMq79Ziz03i0D8XlOcTi6dhHk
 lM5cELO450acdZ+1Zb8aFY9PnO7XhbQeZfTCbbAZRjmV7323+DUPVd+28AdRLgDhULtvKJc0B
 QFy0UCfKdbE+M2JOoVBWtNA0RX5Ym0LF5047izYrUlWgLKwFnzOLzdaZVTrPzmtq9+Rk=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Patrick Venture <venture@google.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Patrick Venture <venture@google.com>

Use the macro for going from I2CSlave to EEPROMState.

Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220119214329.2557049-1-venture@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nvram/eeprom_at24c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index af6f5dbb9984..da435500baca 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -54,7 +54,7 @@ struct EEPROMState {
 static
 int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
 {
-    EEPROMState *ee = container_of(s, EEPROMState, parent_obj);
+    EEPROMState *ee = AT24C_EE(s);
 
     switch (event) {
     case I2C_START_SEND:
-- 
2.35.1


