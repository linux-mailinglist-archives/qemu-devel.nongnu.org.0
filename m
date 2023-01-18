Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48836671588
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Ff-0001ym-OU; Wed, 18 Jan 2023 02:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FZ-0001ux-3r; Wed, 18 Jan 2023 02:52:49 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FX-000249-Em; Wed, 18 Jan 2023 02:52:48 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MulyX-1oQMX941Br-00rrGG; Wed, 18
 Jan 2023 08:52:45 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 13/15] hw/cxl/cxl-cdat.c: spelling: missmatch
Date: Wed, 18 Jan 2023 08:52:32 +0100
Message-Id: <20230118075234.2322131-14-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NQn6hB7qVWEBGdCpbIDPgmw6SUIGxdKd6bjYC8ApMCv0Z6tR1kH
 P/tMJNHDncrE3IVn8V1tdYh4mS3etHskp+kuf6HP1V4FcACyif7E0yfJ3SSGmsm6LC7bHoi
 2+ac3MLUl6nIAjrjqj/uCjN58ON0vqy1QC7DuQY1GxUdWLd4b6q1fKUoka12+rLCnpAmpRP
 w8171sdMTYRNQ2OxVflrQ==
UI-OutboundReport: notjunk:1;M01:P0:m0d6hqx0Rwo=;k8/nn/VNht+SDR0SkPUNyPIrQdD
 bCTN/pXhEOsJYYPPuxtuM2D/eM2XEPdXhlFcHr7cvaYIMAZmIxF3+InIgRl/URTsCYpnBZSUZ
 rKyuEVeduZ/MZ5h/zD8HKvyTtxf1Y3Dvi0GHO7jFEgEbUEk+UXZauQPHbEN92D0xim5D4gBxO
 e1tztomvkZ1s9R56BWzlk4EU4w7YFk/P5QxfbFWSwdYuy4P5akbar7wPTpfeRjuqn8ZPAi5+3
 Ct15b6Mj+17nUeW5hJl2D6FkwwqIv4W7l8Hf6r3tciu1oLT7GklUsGgd+rtKuVRn9SDBVhgRV
 xdYnkXAj4BAKmVObihV9J4ATGk9s81IFYpNp2t2Ud2pdovz2tD9vgqVxywQQqfWzxasLqs5A2
 1pKrsnJt1MVlVndBaRVbd7o1yRwLtFG2Jhbs47g9t9mw8rHIBdzWRPfJOafxNoYy7uXdUXuid
 /Zj7CO7Le3fBvVVGW3d/IaLSZF+g7SdEoIryDfWZLdjvV01J2yddv3gH5mDOPHxKt48+jzmk5
 JIOzs2vfpupJZmF94uaKa3jWiTrqqoLKTMqLDitPPmV5MIJbESMnTsv01GInNv2Ual+ljuBE2
 7n36rzgrpIfsUd2SxjuUC2QD+HI/4dBeUrM6St+mGzqWTv32mFMhQC5TcUx7zAcI3n81PA6MP
 g/J5Abg9WiwV/bg5jmI8ImdyQzU6B33sXbjVQYGJZg==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Tokarev <mjt@tls.msk.ru>

Introduced by: aba578bdace5303a441f8a37aad781b5cb06f38c

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221215123749.1026775-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/cxl/cxl-cdat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
index 3653aa56f0d4..137abd0992cb 100644
--- a/hw/cxl/cxl-cdat.c
+++ b/hw/cxl/cxl-cdat.c
@@ -146,7 +146,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
         num_ent++;
     }
     if (i != file_size) {
-        error_setg(errp, "CDAT: File length missmatch");
+        error_setg(errp, "CDAT: File length mismatch");
         return;
     }
 
-- 
2.38.1


