Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DB3336F94
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 11:07:55 +0100 (CET)
Received: from localhost ([::1]:47844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKIEU-00077y-Fr
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 05:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIC1-0005Fc-GH
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:21 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52278
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIBz-0004KT-Io
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 05:05:21 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKIBv-0001He-7v; Thu, 11 Mar 2021 10:05:20 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Thu, 11 Mar 2021 10:04:59 +0000
Message-Id: <20210311100505.22596-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
References: <20210311100505.22596-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 1/7] mac_via: switch rtc pram trace-events to use hex
 rather than decimal for addresses
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all the documentation uses the hex offsets, this makes it much easier
to see what is going on.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 4b15db8ca4..81a45f7fa3 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -225,8 +225,8 @@ via1_rtc_cmd_test_write(int value) "value=0x%02x"
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
2.20.1


