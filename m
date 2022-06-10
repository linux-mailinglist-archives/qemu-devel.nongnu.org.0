Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAFB546C5F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:31:28 +0200 (CEST)
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzjPr-0006O9-Kx
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjIY-0007k9-Ve; Fri, 10 Jun 2022 14:23:54 -0400
Received: from [187.72.171.209] (port=8736 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjIX-0003ZW-Cj; Fri, 10 Jun 2022 14:23:54 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 10 Jun 2022 15:23:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 360A0800058;
 Fri, 10 Jun 2022 15:23:42 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH RESEND v2 01/11] target/ppc: Fix insn32.decode style issues
Date: Fri, 10 Jun 2022 15:23:00 -0300
Message-Id: <20220610182310.68715-2-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
References: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jun 2022 18:23:42.0477 (UTC)
 FILETIME=[36C053D0:01D87CF7]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Some lines in insn32.decode have inconsistent alignment when compared
to others.
Fix this by changing the alignment of some lines, making it more
consistent throughout the file.

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn32.decode | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 18a94fa3b5..532a478dcb 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -21,11 +21,11 @@
 @A              ...... frt:5 fra:5 frb:5 frc:5 ..... rc:1       &A
 
 &D              rt ra si:int64_t
-@D              ...... rt:5 ra:5 si:s16                 &D
+@D              ...... rt:5 ra:5 si:s16                         &D
 
 &D_bf           bf l:bool ra imm
-@D_bfs          ...... bf:3 - l:1 ra:5 imm:s16          &D_bf
-@D_bfu          ...... bf:3 - l:1 ra:5 imm:16           &D_bf
+@D_bfs          ...... bf:3 . l:1 ra:5 imm:s16                  &D_bf
+@D_bfu          ...... bf:3 . l:1 ra:5 imm:16                   &D_bf
 
 %dq_si          4:s12  !function=times_16
 %dq_rtp         22:4   !function=times_2
@@ -38,7 +38,7 @@
 @DQ_TSXP        ...... ..... ra:5 ............ ....             &D si=%dq_si rt=%rt_tsxp
 
 %ds_si          2:s14  !function=times_4
-@DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
+@DS             ...... rt:5 ra:5 .............. ..              &D si=%ds_si
 
 %ds_rtp         22:4   !function=times_2
 @DS_rtp         ...... ....0 ra:5 .............. ..             &D rt=%ds_rtp si=%ds_si
@@ -49,10 +49,10 @@
 
 &DX             rt d
 %dx_d           6:s10 16:5 0:1
-@DX             ...... rt:5  ..... .......... ..... .   &DX d=%dx_d
+@DX             ...... rt:5  ..... .......... ..... .           &DX d=%dx_d
 
 &VA             vrt vra vrb rc
-@VA             ...... vrt:5 vra:5 vrb:5 rc:5 ......    &VA
+@VA             ...... vrt:5 vra:5 vrb:5 rc:5 ......            &VA
 
 &VC             vrt vra vrb rc:bool
 @VC             ...... vrt:5 vra:5 vrb:5 rc:1 ..........        &VC
@@ -61,7 +61,7 @@
 @VN             ...... vrt:5 vra:5 vrb:5 .. sh:3 ......         &VN
 
 &VX             vrt vra vrb
-@VX             ...... vrt:5 vra:5 vrb:5 .......... .   &VX
+@VX             ...... vrt:5 vra:5 vrb:5 .......... .           &VX
 
 &VX_bf          bf vra vrb
 @VX_bf          ...... bf:3 .. vra:5 vrb:5 ...........          &VX_bf
@@ -76,13 +76,13 @@
 @VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_rc
 
 &VX_uim4        vrt uim vrb
-@VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
+@VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........          &VX_uim4
 
 &VX_tb          vrt vrb
-@VX_tb          ...... vrt:5 ..... vrb:5 ...........    &VX_tb
+@VX_tb          ...... vrt:5 ..... vrb:5 ...........            &VX_tb
 
 &X              rt ra rb
-@X              ...... rt:5 ra:5 rb:5 .......... .      &X
+@X              ...... rt:5 ra:5 rb:5 .......... .              &X
 
 &X_rc           rt ra rb rc:bool
 @X_rc           ...... rt:5 ra:5 rb:5 .......... rc:1           &X_rc
@@ -107,7 +107,7 @@
 @X_t_bp_rc      ...... rt:5 ..... ....0 .......... rc:1         &X_tb_rc rb=%x_frbp
 
 &X_bi           rt bi
-@X_bi           ...... rt:5 bi:5 ----- .......... -     &X_bi
+@X_bi           ...... rt:5 bi:5 ..... .......... .             &X_bi
 
 &X_bf           bf ra rb
 @X_bf           ...... bf:3 .. ra:5 rb:5 .......... .           &X_bf
@@ -122,7 +122,7 @@
 @X_bf_uim_bp    ...... bf:3 . uim:6 ....0 .......... .          &X_bf_uim rb=%x_frbp
 
 &X_bfl          bf l:bool ra rb
-@X_bfl          ...... bf:3 - l:1 ra:5 rb:5 ..........- &X_bfl
+@X_bfl          ...... bf:3 . l:1 ra:5 rb:5 .......... .        &X_bfl
 
 %x_xt           0:1 21:5
 &X_imm5         xt imm:uint8_t vrb
-- 
2.25.1


