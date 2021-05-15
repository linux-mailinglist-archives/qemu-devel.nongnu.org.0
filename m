Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EA638177D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:10:51 +0200 (CEST)
Received: from localhost ([::1]:35142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrFy-0008AQ-Gg
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9J-00061E-3b; Sat, 15 May 2021 06:03:58 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:40445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9F-0006TM-GB; Sat, 15 May 2021 06:03:55 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MQvGz-1ltBG41IP9-00Nzgc; Sat, 15
 May 2021 12:03:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 07/16] hw/gpio/aspeed: spelling fix (addtional)
Date: Sat, 15 May 2021 12:03:26 +0200
Message-Id: <20210515100335.1245468-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Gef4iKC6HnN1PVPj68MKpz7+J6RjcRRixx5jlTR9SkWA1geZoFe
 rABMhwCiKJC00vFb/f/G5igk1LjNy1ljTvdHB4byOc86mNEJEiDjh9G4WFsYAVAW9o4Aqtf
 +igzVGC90guwuEpxLNpqfddmVTUDVhomywMxWfWup4Bg2UMqtW3xrAhG23LRZE/t9SSeWer
 anc3Gzvn4NjzvalQvL0Qw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:96Saw/weRM8=:nhRq8TEatdIiVr9ea1wiVz
 bDjW6co6LpVUqR61iqFA1yNFvb0qesxYCAfg5WyjLK8jlshZaq9D2QvGpikL0UDz/gWlLd8Sx
 9nB7MnB3dMdquJrbEs1tYUKI17154Vkt16R7Zjyc8LwHfmFFUSHMlNhPU6XdBqjwZyhw7O98J
 2Mlup8W3txGzKtjvvOMOAEpPlrh7BdLfdvdK/+walqx156wH+OqyrDqi5u0dXmYSnL3iufVaN
 gMUSZW8nKtttKXiG6ZZFnj+Bu95eVp9GIGcjaVMeiO6n+yZGMcj6CKs8Q7JtJHv0RK3WjNU4M
 g/E05E3vZkif5jyu/bzXUhEOvS1Ks0wQkkVtA6RAgKaTAM48WUSuLn1egu9ik0D8hfNhMpre+
 3/G+k+ZFo4EjrZayrof5bmcn0J8YTc15xWU7fgYNH12Vat6Ayiy/h4TsO5dy0E86F8kuqolpP
 143VxFIQRfJE+DKOkkyYaRBWZ5JkCrLRWEuwZ0ovMSV5UGYa0vz/SHB/2B1W4mwdM4RqNHXi6
 xD6tNaxPUtwfcpuUwJuh+Y=
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Tokarev <mjt@tls.msk.ru>

Fixes: 36d737ee82b2972167e97901c5271ba3f904ba71
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210508093615.411920-1-mjt@msgid.tls.msk.ru>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/gpio/aspeed_gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 985a259e05b7..34d8acb0e37a 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -170,7 +170,7 @@
 /* AST2600 only - 1.8V gpios */
 /*
  * The AST2600 has same 3.6V gpios as the AST2400 (memory offsets 0x0-0x198)
- * and addtional 1.8V gpios (memory offsets 0x800-0x9D4).
+ * and additional 1.8V gpios (memory offsets 0x800-0x9D4).
  */
 #define GPIO_1_8V_REG_OFFSET          0x800
 #define GPIO_1_8V_ABCD_DATA_VALUE     ((0x800 - GPIO_1_8V_REG_OFFSET) >> 2)
-- 
2.31.1


