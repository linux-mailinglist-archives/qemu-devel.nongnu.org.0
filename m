Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20504422FF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:03:30 +0100 (CET)
Received: from localhost ([::1]:36340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfOq-0001gq-Vl
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhfIZ-0005x2-7s
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:56:59 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43590
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhfIX-0006GF-RB
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 17:56:58 -0400
Received: from [2a00:23c4:8b9d:f500:9396:df17:737c:b32c] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mhfI9-0003Ln-5u; Mon, 01 Nov 2021 21:56:37 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Mon,  1 Nov 2021 21:56:36 +0000
Message-Id: <20211101215636.6141-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211101215636.6141-1-mark.cave-ayland@ilande.co.uk>
References: <20211101215636.6141-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:f500:9396:df17:737c:b32c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 1/1] roms/openbios: update OpenBIOS images to b9062dea built
 from submodule
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 pc-bios/openbios-ppc     | Bin 696912 -> 696912 bytes
 pc-bios/openbios-sparc32 | Bin 382048 -> 382048 bytes
 pc-bios/openbios-sparc64 | Bin 1593408 -> 1593408 bytes
 roms/openbios            |   2 +-
 4 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/pc-bios/openbios-ppc b/pc-bios/openbios-ppc
index 91a73db9a3b3a79d2bad6433bd73eecaac3c948f..67f32a8602e368a2485ec463cf6c8a96da77b46d 100644
GIT binary patch
delta 105
zcmca`MC-y4t%fa(`?oSOPCu}fF&sk4x0`Qc+-|;&N%Mq&Uw)Z_p@NZt5s0udHft}a
jW8Pj+$C40)DfQq2OZ$ThtU$~L#Oy%KvHigX&Vq{o5>_a;

delta 105
zcmca`MC-y4t%fa(`?oSOO+T=eF&sk4x0`Qc+-|;&N%Mq2aB6{qg@TcRk)eWtrInF!
mdqExZ_JTT=gdj|*2Nzh{A6#GsVm2UV2V#!x4=!*PTm%3TSSYsu

diff --git a/pc-bios/openbios-sparc32 b/pc-bios/openbios-sparc32
index a5b738919119f7dde4e83ceb483fe2aa8a32f5ea..376b01c10b5ecc6c52f6f7f97866b54b3d2a3f3a 100644
GIT binary patch
delta 48
ycmaE`Lj1uB@rD-0Eldv90)F{r3Wf?s21X#l%Gk6$z?un&nSq#Pdw?~oz)S#w`VK(=

delta 48
zcmaE`Lj1uB@rD-0Eldv90>P;T3Kj}R21bSo29{PvM(qLCOhC*G#4OtbtXTzS0sw-y
B4nP0^

diff --git a/pc-bios/openbios-sparc64 b/pc-bios/openbios-sparc64
index f7a501efc6a3917c29ed880d4236db8e983c7c0c..bbd746fde9494bd776ece55951974f393383e1b8 100644
GIT binary patch
delta 243
zcmX@GAo0M0#D*5e7N!>F7M2#)7Pc1l7LFFq7OocV7M>Q~7QPn#EdqyYn4djLntrTC
zKo!U+n*I*LNZKw|D=?J{B)5HCyMQetnDwqh;A=5Uotwzy?a%)RFtQ8y<(DZKDi|3U
zfe0&Ov+X~a1-V5*YTMZ)1-G+F3Y`sQWtXpOR+xSvUr22GyF4LRCM1FBeuYAJnSlzn
x>lF!oWe3SLLX=Los}hO@%gn11DrH2HY1gX}0%Bnx76D>WAQs!MS0gTT1pps)Rx1Di

delta 243
zcmX@GAo0M0#D*5e7N!>F7M2#)7Pc1l7LFFq7OocV7M>Q~7QPn#EdqyYn7K-frXQ;j
zPz5raroV$QjJAu_3QXk!$!%ZPE?~<DX1(hW_*%@;*yLus{rMjOMs|VV)B*(y1tS9^
zLj?m%D<h-rKbQr%ML}xY*(3$Gvq=h_4P`xf^LDes^b7eyV%y*43Ar*M2~77Z6uQd{
zRIpvINa!m&NTv~@bh=%YP%KzxUX@TOBa%$JUX2hC3j?tT5Q_q_*mk`daiJ>!COTMj

diff --git a/roms/openbios b/roms/openbios
index d657b65318..b9062deaae 160000
--- a/roms/openbios
+++ b/roms/openbios
@@ -1 +1 @@
-Subproject commit d657b653186c0fd6e062cab133497415c2a5a5b8
+Subproject commit b9062deaaea7269369eaa46260d75edcaf276afa
-- 
2.20.1


