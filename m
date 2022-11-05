Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF43C61DDEC
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 20:54:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orPDf-0008G2-AA; Sat, 05 Nov 2022 15:52:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDc-0008EI-2m; Sat, 05 Nov 2022 15:52:40 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDZ-0003aY-QS; Sat, 05 Nov 2022 15:52:39 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MZCKd-1oVhNg0dzF-00V64U; Sat, 05
 Nov 2022 20:52:33 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 6/7] target/tricore: Rename csfr.def -> csfr.h.inc
Date: Sat,  5 Nov 2022 20:52:26 +0100
Message-Id: <20221105195227.354769-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221105195227.354769-1-laurent@vivier.eu>
References: <20221105195227.354769-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RtbVOQA8DmxeMJwho8KRYg9YuM379GzqaklNLJ6TdWj/0LLFbF6
 VTg3y5ocosSbG8bZoe9yDnQ9CMtQGYJ+IKbUt/vaPIhRTgjwhZoECPOZKuT+CB51yeWz9Yk
 EeIbegpzq4DewUHkdoAE1PfKU8IyuXOcvBhx8ftOH+HZdMqQDE86D8aoaBni30ui41KooD+
 RLh/AQ2gD4pCVjNO4OL4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tT3W9eOWObY=:t0FbwXx4RB0G3Cy/NoUDmH
 9TNaR3QHz61hy0ql3Ym0+4B4kITZd8Gt6PWRTor7ArQqe5mown98iBsKCOIhbmTXtr2mIc4E9
 H9ZGeE+dIfUz3aIfMSlv9MmG1uN+XeU21UpYySGpQAUhlbchZ966+9pwX0O+qk9YASfANSkZM
 KQuCvj1PrBpJENHDEJ7g5SGw14TV+Tc1aCfizloyy1+SsmRSUeTlYjT3aBEv6wjkNB3y+G5fG
 Nv8VD95bi0arFwrY7b+E0VeQ1nD1flwb1K0KTSUTMkHlmw5fT4V8qhHdvXrgO+4uoGTcErSrS
 tO1tP23CMJ6N0Xh28fSJlAYfFxX2ak1ZsQzQd3TP0MyT3JYnNLA13o0uPK1eUaxykFN9d1xHa
 Y28QGndM3cRzpqqT0LWkkhCBG4IZrLESBJOuM+LuN762cLfAhsxvpxHPkmMRsHATSUNt3Tpnq
 5PYIY2UplggOpIhXs1++Gb6p5y1Q/I/mseI2jbKe3rlcUL6RMXDo67L+OKnA83cSWoNrXUVtn
 fGuj+Hd277AiwwnxZGJe1MzSOqKO8b0sMaOuskCJkQpzfWNuLnHlMfX0fv5VG2zNYxtVFG/DI
 PUpsJb4t0xV3PWDa0/oRdfOaYGtlUmW8iZumpFRBnhcUr1zY2owG3CziDpAnQv6uouGqCT5hz
 yjLcttOulctQl9InQtmeCqUOB8XMlybVIUezXNggAqNBlXHnzJonu97x84qt/gL/Rw9Gr3/QC
 8R7J/qMs/tlZIMsCN+D9NXzjv3gxAfPvtojYjVdskpFHTnO4D8yBz3s3jgp35ds47VkQbZ/O1
 qIqOdYp
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

We use the .h.inc extension to include C headers. To be consistent
with the rest of the codebase, rename the C headers using the .def
extension.

IDE/tools using our .editorconfig / .gitattributes will leverage
this consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221025235006.7215-4-philmd@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/tricore/{csfr.def => csfr.h.inc} | 0
 target/tricore/translate.c              | 4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename target/tricore/{csfr.def => csfr.h.inc} (100%)

diff --git a/target/tricore/csfr.def b/target/tricore/csfr.h.inc
similarity index 100%
rename from target/tricore/csfr.def
rename to target/tricore/csfr.h.inc
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index c5b7bfbf2013..df9e46c6495e 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -388,7 +388,7 @@ static inline void gen_mfcr(DisasContext *ctx, TCGv ret, int32_t offset)
         gen_helper_psw_read(ret, cpu_env);
     } else {
         switch (offset) {
-#include "csfr.def"
+#include "csfr.h.inc"
         }
     }
 }
@@ -418,7 +418,7 @@ static inline void gen_mtcr(DisasContext *ctx, TCGv r1,
             gen_helper_psw_write(cpu_env, r1);
         } else {
             switch (offset) {
-#include "csfr.def"
+#include "csfr.h.inc"
             }
         }
     } else {
-- 
2.37.3


