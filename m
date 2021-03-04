Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804DC32D5B0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:53:47 +0100 (CET)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpMI-0006eE-9u
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGg-0001Pk-VC
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:47:58 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:11004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=690dc056c=alistair.francis@wdc.com>)
 id 1lHpGf-0007n8-33
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614869276; x=1646405276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oFQMpB/B62etSPvikdV10XyLOH8e8+5fOknVrGPTZXY=;
 b=Xg/+tdHbq1fIQK+qGFRRbwGTaGTLbINkdKS3rClUVdHFUhgq/WkpDRQk
 o9LLDZl5NI8F7ydv3v6LqNziPUEtKUldHqyakEfAMkHp33J+nnIkg6dyP
 msIcrogvePBLoUlAECKW+5pHxHlJoNsLqpuvcEoNSUJzd3wdHOgEOmcqh
 zdvDYtEAdXxSVwEkaI9N5zHo/o2Y5BlSk6g0jTeijcCCkedbbXNpU/PoU
 D8d7DBcdnkpeFYmqePPccQcdQ4JCvREWOa6J6IdR6k5Rug+EZtvV27gVW
 WGLEftlyDs0bgq2keRr0OBvdguq2ju0lhfm/fJ+qi2qIEemxPFizJDyMH Q==;
IronPort-SDR: dR1PAEpfCuPDEkqSKH0lGo6O08ACVPYTPpEMN2iIzClrrsd/lwe8xYJdo0SWTICEC1ZwIZlrsb
 /Y7SV5FUZg2y5b0hmbPyDgJaNH+KtD50VZT1u2kWK0wENV5fFhYvL9lWgBfLUAS9jl4yHQszA8
 +u7fPX6cC8o1iXPyGd5cD9SbA1En0N2LhPONaoXy/Fahp2RYqEip9Pbo7IdQLrDCGMjTmPa1Uj
 PAiIUe3z8krkflTo7GGhx1n3XBrnpimq1EmcOyP3quXFP6sxvLPRSEo2Wrp5NypDrJ8NPdpwSV
 z2g=
X-IronPort-AV: E=Sophos;i="5.81,222,1610380800"; d="scan'208";a="161372229"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 22:47:55 +0800
IronPort-SDR: APKwx3KDFzoYveKD/R5dS18Q8Ewxj6X9erKeYRTQ5I5VSjngH0wgfY2eVV4WXwu91bZ9zlQyVX
 ICVSAC6//+1IL5g/h3ZdMN/9dlgoH1V3pwxgJxnMwXZ+x80deRwOEJMqGcnEgnbmMIC+CmOFPg
 eHnyqqj8sJszaxJsIxha9ldtF27xCre0Zmze54uClUViEfHVO2+HZr6fZZCRoNCUDsG/cb3yuH
 9WEigapStQSMmqvhK3jvg5jpN58ntk9uxH8me79A1k1luL7YQd1cS8yn1eiKIsjDKn92i9q1Yb
 XEEEgUSdlPqYiC4xFAgdqTah
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 06:29:08 -0800
IronPort-SDR: lU9vmLa3Du2Pt60rjMiPZz5R0G/dk+/OGA7bFSLGohH+sP4A4EcQnIQzsdKZIksyz3lrtRE967
 4zNf3+jgVjdsEOXu+kjgwieWJCUoLk5x7hSMtbGz45gWNEwNWWrl//ZsjUfLGd49FcdGJpdTix
 oV66g4MbB/0ziM+vU1oPk9LfpmNWppdltk/ClW0LcrtCDk2WvfzCOIVSfQ0i6xa55OvTjaBA26
 8mTDKva+T/HyqhMJd6wy7gBaGuhsK5YvkhxZt9noW4OXJDmpxXsgloEc1CtSdc3ACpizh2y6Fw
 lKw=
WDCIronportException: Internal
Received: from cnf008142.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.109])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Mar 2021 06:47:51 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 02/19] hw/misc: sifive_u_otp: Use error_report() when block
 operation fails
Date: Thu,  4 Mar 2021 09:46:34 -0500
Message-Id: <20210304144651.310037-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304144651.310037-1-alistair.francis@wdc.com>
References: <20210304144651.310037-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=690dc056c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present when blk_pread() / blk_pwrite() fails, a guest error
is logged, but this is not really a guest error. Change to use
error_report() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 1611026585-29971-1-git-send-email-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/misc/sifive_u_otp.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
index b8e8b9eebe..18aa0bd55d 100644
--- a/hw/misc/sifive_u_otp.c
+++ b/hw/misc/sifive_u_otp.c
@@ -23,6 +23,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "hw/sysbus.h"
+#include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/misc/sifive_u_otp.h"
@@ -65,8 +66,7 @@ static uint64_t sifive_u_otp_read(void *opaque, hwaddr addr, unsigned int size)
 
                 if (blk_pread(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD, &buf,
                               SIFIVE_U_OTP_FUSE_WORD) < 0) {
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "read error index<%d>\n", s->pa);
+                    error_report("read error index<%d>", s->pa);
                     return 0xff;
                 }
 
@@ -169,8 +169,7 @@ static void sifive_u_otp_write(void *opaque, hwaddr addr,
                 if (blk_pwrite(s->blk, s->pa * SIFIVE_U_OTP_FUSE_WORD,
                                &s->fuse[s->pa], SIFIVE_U_OTP_FUSE_WORD,
                                0) < 0) {
-                    qemu_log_mask(LOG_GUEST_ERROR,
-                                  "write error index<%d>\n", s->pa);
+                    error_report("write error index<%d>", s->pa);
                 }
             }
 
@@ -260,15 +259,13 @@ static void sifive_u_otp_reset(DeviceState *dev)
         serial_data = s->serial;
         if (blk_pwrite(s->blk, index * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "write error index<%d>\n", index);
+            error_report("write error index<%d>", index);
         }
 
         serial_data = ~(s->serial);
         if (blk_pwrite(s->blk, (index + 1) * SIFIVE_U_OTP_FUSE_WORD,
                        &serial_data, SIFIVE_U_OTP_FUSE_WORD, 0) < 0) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "write error index<%d>\n", index + 1);
+            error_report("write error index<%d>", index + 1);
         }
     }
 
-- 
2.30.1


