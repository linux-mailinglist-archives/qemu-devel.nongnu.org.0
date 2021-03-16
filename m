Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A970433E074
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:25:18 +0100 (CET)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHBl-0001gL-La
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3U-0006gb-AZ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:44 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:54871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lMH3Q-0003xE-Kg
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:16:44 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N17gy-1lpbbT0agk-012WBt; Tue, 16 Mar 2021 22:16:37 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] mac_via: switch rtc pram trace-events to use hex rather
 than decimal for addresses
Date: Tue, 16 Mar 2021 22:16:25 +0100
Message-Id: <20210316211631.107417-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210316211631.107417-1-laurent@vivier.eu>
References: <20210316211631.107417-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YMs8kFXOEqihu3tIhuovcKcubK+hXhvAUJLE0WKcevNhpGcxCiG
 OWE5wd/CZWUxfqn7CdpjyWn0To5E1Y03GoDsydBEsvy04NCiNfRcbZblbESSqhOAfYHwDmq
 DCy0gSmwkSFOPmEONozBvN5o+AA4UY2V/2UTBSCTCHeeJ/8lPsHh0tS6OJPlxFvCxfIaU3W
 7zAbuOORwt5nzxRgrRYWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nFRosDrV5tU=:CSBZwbxkn+rOQLQEQdLYHy
 RhR39D7shdyJF7R7KoFMpB73kF9CMpqTUMchDP46q3QICjR4m2ioHHITTjOHKzfgQ1Wnxhuvc
 BusmuTOELZHlfyQV09Zla5S4Kzh9DLcQiQgnUg16tG1zTUrsktwoUOvot1WFes+6XwVPN1/9a
 4vFNd005jm4LyEpBt2jeIhtfiRa20npYBKtP+ECJaLeli+cXg4PYJUrlQHuVVKC1TYdFhvANU
 sThdLutibkwK7oQADHJRT7qCl7XABW+LM9UNqPWi3ODN/IHFHY6/kQnIwFpNQcbQJYXdG0rbv
 YQOG1nKqb8hFwzLvvK4GMqn++AUicHUN29lgMDcIKv/kxJhxOoEKz+yVCJL6nY9WJrfGHSTos
 WgFNCCWcbIuoaoHA6W09ZThNe3FJs/5QrJAOCAkC3qVTLKaQTGyZKk7G+3qcVpqq2wdgwSiR8
 +pmQBtfm5A==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Since all the documentation uses the hex offsets, this makes it much easier
to see what is going on.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210311100505.22596-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index b87d0b4c906a..fa422727aeb7 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -233,8 +233,8 @@ via1_rtc_cmd_test_write(int value) "value=0x%02x"
 via1_rtc_cmd_wprotect_write(int value) "value=0x%02x"
 via1_rtc_cmd_pram_read(int addr, int value) "addr=%u value=0x%02x"
 via1_rtc_cmd_pram_write(int addr, int value) "addr=%u value=0x%02x"
-via1_rtc_cmd_pram_sect_read(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=%d value=0x%02x"
-via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=%d value=0x%02x"
+via1_rtc_cmd_pram_sect_read(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=0x%x value=0x%02x"
+via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=0x%x value=0x%02x"
 via1_adb_send(const char *state, uint8_t data, const char *vadbint) "state %s data=0x%02x vADBInt=%s"
 via1_adb_receive(const char *state, uint8_t data, const char *vadbint, int status, int index, int size) "state %s data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
 via1_adb_poll(uint8_t data, const char *vadbint, int status, int index, int size) "data=0x%02x vADBInt=%s status=0x%x index=%d size=%d"
-- 
2.30.2


