Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154EC2F95B3
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 23:00:40 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G6B-0004cR-3G
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 17:00:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1G03-0005ji-IP
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:19 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzy-0005UJ-2u
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920454; x=1642456454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tTSW+22skBu2j2o8VAyrEiHQQ3F2O/cFv5WxYlTsDwU=;
 b=dOKE8OTe7UEzOHv6blnBO0UNNtU4ElAVXwyzbcXWF+5SUp5e6/VDE0sE
 eNw17vKq1YIWll0kiL7EhH3u7n4XAzTUEweEkpPwBM4MKGQjsIO2euMcO
 aMTwdJK24p/zh1lDetOPAvY23YEhAdVwcjkhRfP5xxzsNyde7fa+bI2pk
 seUi/caRv4AMLKN6U2TXPuxSYWQSyu34H24G5CN71mPtxSphRvopmvHDE
 Ryw3VYiCjgBG8kpCl/R19L27HhATop2NYwtWsRge+UtG4GGRHHW+Ya8nA
 QRgPmhQRTihKowF1lYY6OJfLAUBGgi4trTSosGZd9iJAZAUOaLYvQSoD4 w==;
IronPort-SDR: 2jZFzf37vTVS9PUr+lR3wx69kNYtJ2JWJDs7TnL0TVicG1jTic2OBsu8YGoaGeAmAnbPg52EHl
 bZwsf5zK8wujBUDitc2KccE7wIf8K3xK9C2/KsNz/blo1n+NCCAFbs0khTEMrykxo6bKT6rIAB
 U3p/MG8NyphsAmfmFg7EIDg0TzzT9W9l9cDT1Wg65Gf2kJiqitDWVPKp/aTHb1yinGicCX3d4y
 qbi8T5Lz4g4notjN8OELZKmK/wJmsxJydHQeJA+s2ri9Ocn5YcPfmXhfy2heFPuRXuOE81J25t
 5PM=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645969"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:07 +0800
IronPort-SDR: ARWyfhaD+qhz2OLjbFV9ebfb2F+/X+Q5ZSTCBiZQWqu02yZhup3kqWVrPkeBoW0Vy5AofuaYW/
 Bd/6o+bHHY1Y+bzSloz3iM8PIzPhYXDCVyjF5aBgzcVc4r03ALg+shgR6SbWToQ9WyhhZQnZy1
 Y4OsuCEPXwuASuFoCrv6HO8Yp5Z0B2/1edtifnMu75OaX52KixiEiXJ2IU5eJL/FkXno4RzGDp
 C63R4F7x0QYOZgqlY3+8xjjuzXLr3vb2qEzYX3O8rw8pLDj+MwqN8qZkKl9yWEPkQKRogHExES
 My9BVRMxDXuPBuNpC32aMl+T
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:45 -0800
IronPort-SDR: 0Jc94paDFugpJAOILvtaGumyRghJbBqR1ENRHE+AmtEZ73Msvi8viukjwKh8Kz1n6VRLzLr0fw
 QP//WSZW6UT5FZaJz17lc5wn4cXLXKeS+vTtx0RUjL2GIbNT6pX7qA/OO7dfAm4NY0I27RWogd
 J4GYhmF6mWkHIfP3fXtbTyCz0yNfKwNWLLTqh9wGy0olsNLfFb9wdZXRLk6RShjVDDNqhW8r87
 HzPQDNmSfcsctNnh+bL8S7MkZ66MLGisY+jKrZLhf+s3y2C1NF20PI/6AT4aM1iGVlVUGTImKd
 A2M=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:07 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 07/12] hw/misc/sifive_u_otp: handling the fails of blk_pread
 and blk_pwrite
Date: Sun, 17 Jan 2021 13:53:58 -0800
Message-Id: <20210117215403.2277103-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Green Wan <green.wan@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Green Wan <green.wan@sifive.com>

Fix code coverage issues by checking return value and handling fail case
of blk_pread() and blk_pwrite(). Return default value 0xff if read fails.

Fixes: Coverity CID 1435959
Fixes: Coverity CID 1435960
Fixes: Coverity CID 1435961
Signed-off-by: Green Wan <green.wan@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20201104092900.21214-1-green.wan@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/misc/sifive_u_otp.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index 4401787a5c..f921c67644 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -63,8 +63,13 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
             if (s->blk) {
                 int32_t buf;
 
-                blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
-                          SIFIVE_U_OTP_FUSE_WORD);
+                if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
+                              SIFIVE_U_OTP_FUSE_WORD) < 0) {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "read error index<%d>\n", s->pa);
+                    return 0xff;
+                }
+
                 return buf;
             }
 
@@ -161,8 +166,12 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
 
             /* write to backend */
             if (s->blk) {
-                blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
-                           &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD, 0);
+                if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
+                               &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
+                               0) < 0) {
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "write error index<%d>\n", s->pa);
+                }
             }
 
             /* update written bit */
@@ -249,12 +258,18 @@ static void sifive_u_otp_reset(DeviceState *dev)
         int index = SIFIVE_U_OTP_SERIAL_ADDR;
 
         serial_data = s->serial;
-        blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
-                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
+        if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
+                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "write error index<%d>\n", index);
+        }
 
         serial_data = ~(s->serial);
-        blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
-                   &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0);
+        if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
+                       &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "write error index<%d>\n", index + 1);
+        }
     }
 
     /* Initialize write-once map */
-- 
2.29.2


