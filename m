Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8D3712A1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:49:18 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUGT-0004Sc-Mi
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:49:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4K-0003JA-SK; Mon, 03 May 2021 04:36:45 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:53643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4F-0000j0-Sa; Mon, 03 May 2021 04:36:44 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MnJUy-1lBoID1hOm-00jLxl; Mon, 03
 May 2021 10:36:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] hw/pcmcia: Do not register PCMCIA type if not required
Date: Mon,  3 May 2021 10:36:04 +0200
Message-Id: <20210503083623.139700-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503083623.139700-1-laurent@vivier.eu>
References: <20210503083623.139700-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QSVs3guaTC/fSNKjEa2M+zJEy92l4M3+drIcVr+64YuKoQXALkO
 pfY4u5AV0fEFjjgXAZi5aCVvQEIzJV6Zxbn90TC44ddPnGMsp3z+JviXkb5MbTdIGjvz1b1
 8u5ZQZOsd928GIXD1cQfme+zt+/8MXDhRfS+SGlSuUW8xZ1CjintGupmSDAmh3dPDSBRmjT
 jvrOF/K+c96ofca7KaXcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SMt0/wT1Kog=:Zj7R06Vo0QC53mrvztlPaR
 U4QTYc/5fFXcT1lw6JnVWuiA7ZGER7SJPopwzP0qiYL15g4lXVYfrOZlbLJNxfvdbIeenqQfR
 +++xpcHgSrRO+x4CmHEw59pXgW3zFPM7jwYz1box05MK8LIrjcLUPOHJFXitl1ERJPMjEJThN
 H8AKkcQSbY9FRDT1iuISnF3MyYJ5RkL1kV655nBmFwRk0A0tVP71mOQLSPGcjSqm0hZOLkNg4
 0Jwi6oW7zLBPTftjgYjjRk2VBG+lEiyWlkZflkv9oiG7IBim0Z+rKyEXUDpZ75CTZNrRT3aPo
 No6zp/vP4yTjm4tjC/K3U4twhzyEuwBKpI6Ph/QBBOSqVqIrxrKEiZ2GJd4Qev7m3WlWxlQQ+
 iHUMpwr6T2pJtK98lzzN+5hzJxoa/vUD+DtyAtE3ZQGSzQow229RY6BB2g3EJZjB/m6XfTJ1+
 iPGt8Aa6s5OmMcnrEvMQy3HO3dlDFiEp4t7EdFgQFSoJf4HCLSvKhbls0FIPb24Sw5UeV6oJ+
 4TtAn7t0irPi205XYt3M4o=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

If the Kconfig 'PCMCIA' value is not selected, it is pointless
to build the PCMCIA core components.

(Currently only one machine of the ARM targets requires this).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210424222057.3434459-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pcmcia/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pcmcia/meson.build b/hw/pcmcia/meson.build
index ab50bd325d6c..51f2512b8ed0 100644
--- a/hw/pcmcia/meson.build
+++ b/hw/pcmcia/meson.build
@@ -1,2 +1,2 @@
-softmmu_ss.add(files('pcmcia.c'))
+softmmu_ss.add(when: 'CONFIG_PCMCIA', if_true: files('pcmcia.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c'))
-- 
2.31.1


