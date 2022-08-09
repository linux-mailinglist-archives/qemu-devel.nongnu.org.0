Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4727958DCA1
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:59:35 +0200 (CEST)
Received: from localhost ([::1]:53064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSZq-0000Nm-BC
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:59:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oLSWV-0003Xn-0S; Tue, 09 Aug 2022 12:56:07 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:53343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oLSWT-0000Wd-7e; Tue, 09 Aug 2022 12:56:06 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N63i4-1nJcUo2YlU-016QAL; Tue, 09
 Aug 2022 18:55:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Qiang Liu <cyruscyliu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Frederic Konrad <fkonrad@amd.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 2/2] xlnx_dp: drop unsupported AUXCommand in
 xlnx_dp_aux_set_command
Date: Tue,  9 Aug 2022 18:55:55 +0200
Message-Id: <20220809165555.2415931-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809165555.2415931-1-laurent@vivier.eu>
References: <20220809165555.2415931-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tvVm9Hwo5pM5k4ybRnZg0pEMJYU0xo7Rj7Q583DlJO4dXFLiE8B
 maom5z3gL4GbaBHp6+dh5XHKyl3wzlu7C+mk64KglLuh0rkec7SMG1ViJwcRxUrEIHkm9+r
 ZHIemQqSGHz/rWVQXvmrm4m6d8rQZno1ix0dc9YMKNgYlOgiWQD2wU0uFRjz5FfeQLBRo2a
 ZHTd97xFo96ru/aB+EiqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A0Dm9r/BfsQ=:v3sD8C1DJrfwR4hl0WkC9p
 HNtICvgBf9npsAD3wn7AdVHESQvWOOsjg3uLBKSbMuvC//GaXRgEdc0EnHW1T/0VYS9Yx6ayW
 hmcjEoAmwSxfGbzS3ThVRrWiMIV2uCrtiUmRLsJUmb8LCbSqvLnhrcyytGe8fULej0+Je5AZW
 pPQBx1PHCqkShCbFML49XvfjGF6l8dQdKX/eENMjJxcTfYryJKfhkwXa4fOqe7H3Qbj0EUKGk
 Bl6TJauHvhbnaQOX5qdP3HEFzGnZeQgQ/oqGS9K7E5ADMn34LGJR1MX0+C2R4d46691tdzmdy
 15iR6pk/nOXtdDPeeXF58uAz9C3z1AcXF8YyJOptAghH2+hrqaexZfwOsklhIIPfqDzuarH3/
 C/dSobMZoyV2cODvM9vSOr7X4WEIEihkxA0cegjIcyrHo0ddgBJgTpkQKNajLZe9rXjvSTP2h
 qyEWV00Kmarl2DJutl+PZ3wtOlt+2itjkn3pLmBxgmjaDHBoxhYA06xW1Mtjq78DD4cNa7JJo
 VEeLqkzfuvD8vcUrEjdWpZxvDrUFL1SpBGJlxR72j8zMFac8/1ReNHW1BRf2drTc83FOaRzhI
 h9faYOxsKdRSOgDbKjI7yRN4hbqzMzd4u+gy6O6rxIpZ2t1KRxD6Qu3I/HfvSODDAZWkZy4hl
 Aoerv3w96HkXj1uNght776a1grKz+QEnUu69GJLLk2YQuh0yfDaUQLvNY0tGYtGCwRVc0c0q3
 p0oWXhbYkrcWgfy39ARdizJYcjs8JvkhBVLjjA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Qiang Liu <cyruscyliu@gmail.com>

In xlnx_dp_aux_set_command, when the command leads to the default
branch, xlxn-dp will abort and then crash.

This patch removes this abort and drops this operation.

Fixes: 58ac482 ("introduce xlnx-dp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/411
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Tested-by: Qiang Liu <cyruscyliu@gmail.com>
Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Frederic Konrad <fkonrad@amd.com>
Message-Id: <20220808080116.2184881-1-cyruscyliu@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/xlnx_dp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index a071c818833b..b0828d65aa86 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -532,8 +532,8 @@ static void xlnx_dp_aux_set_command(XlnxDPState *s, uint32_t value)
         qemu_log_mask(LOG_UNIMP, "xlnx_dp: Write i2c status not implemented\n");
         break;
     default:
-        error_report("%s: invalid command: %u", __func__, cmd);
-        abort();
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid command: %u", __func__, cmd);
+        return;
     }
 
     s->core_registers[DP_INTERRUPT_SIGNAL_STATE] |= 0x04;
-- 
2.37.1


