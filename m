Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C69811710B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Dec 2019 17:02:56 +0100 (CET)
Received: from localhost ([::1]:41936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ieLUt-0005J0-8I
	for lists+qemu-devel@lfdr.de; Mon, 09 Dec 2019 11:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ieLSg-00044r-Aa
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 11:00:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ieLSe-0002Et-Dg
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 11:00:38 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25018
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ieLSe-0002DJ-8v
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 11:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575907235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPzigFIqcCUh5krrSKfIhCM+yzaS0D+HYQ6KX/LSGxw=;
 b=F8fkb1JnntbZq92L/Sn8AJUpKNOdKbeuccrVT8UIENjumhqtZtodOfikSuCLDfZ45fNKt1
 0Xeie43lcYxKOgVSXf6RBCLelQyT/MbIsW5nO8hFfkQLVlMhO0UxJ+bbs/S4ma1mPk5EPV
 fBfmlKFTBOrnKpKcFx/tWX71LyG50Os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-V2YI9EELNmSZ8EI9q11Tvw-1; Mon, 09 Dec 2019 11:00:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFF3F802589;
 Mon,  9 Dec 2019 16:00:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-171.phx2.redhat.com [10.3.116.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 192A55D6C5;
 Mon,  9 Dec 2019 16:00:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] pseries: Update SLOF firmware image
Date: Mon,  9 Dec 2019 10:00:15 -0600
Message-Id: <20191209160015.20253-2-eblake@redhat.com>
In-Reply-To: <20191209160015.20253-1-eblake@redhat.com>
References: <20191209160015.20253-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: V2YI9EELNmSZ8EI9q11Tvw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, jsnow@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

This fixes PCI bridge regression.

Alexey Kardashevskiy (3):
      ibm,client-architecture-support: Fix stack handling
      fdt: Fix updating the tree at H_CAS
      version: update to 20191209

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 928552 -> 931040 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/pc-bios/README b/pc-bios/README
index 830645c51fbe..91218c69e9d6 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -17,7 +17,7 @@
 - SLOF (Slimline Open Firmware) is a free IEEE 1275 Open Firmware
   implementation for certain IBM POWER hardware.  The sources are at
   https://github.com/aik/SLOF, and the image currently in qemu is
-  built from git tag qemu-slof-20191022.
+  built from git tag qemu-slof-20191209.

 - sgabios (the Serial Graphics Adapter option ROM) provides a means for
   legacy x86 software to communicate with an attached serial console as
diff --git a/pc-bios/slof.bin b/pc-bios/slof.bin
index 0b93fe8c011fc352803dc24e3110b7f926493769..50fc9b1e1cb837809c38fed1e90=
99b262e8600f1 100644
GIT binary patch
delta 5477
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

delta 3433
zcmbW3eQXow9mnsU^UGbF7$*TI7)Y<##tyoqj=3D{l~CczCOWK_+(j)AvHC2uB#4aW;f
z=3DT<F*3MHsTRp?8ev{Hw+RZ*m|&f5Y{a3wJ9gwR$JldvwMEp?}A%`}Nwd(m8mnmxbs
z<8Z$HH%ph_^L#(Q*XQnHr~l%cde1jjU-5v_+c#L_Q`H{T=3Di5^6t=3Dsa0(BUEXOZW2|
zEb>}M^&0c($m-%RpS&4cW*>^$e|hVt+gIsgy1KUX{CdnkjeKA49+W*E+2gKL<vMSJ
z+uKm*E-8{*_sM%h14sJ$!*Y{stf)mly<`4TkvG7>r^s80g96`<>VkMm;Oo)+G)W8m
zr>6fqJy{m{egP%iBvQ;bzd;u`9_KwEd=3Dlq3i?DE9;Okq_bd0nu^SjH?Ihnj%io)gS
z+%PeH30>TY&ZWt34xzo95s8uYub^r#MEQS<T1@CdmYkSHPtiQw`9Gj$zBR!$A<i_>
zmoV??8#%hC`|aje+Y+d$g)_anIUzJvYs}O>%*juSXi}9qj<Po!yEv0C##wyB+_JAb
z!I2Y-=3D(Q@85Q+S6RAq*R|1NrtmJ!LjCgBOIJ>h^Hkni}Wgo6Z%g(?e5RN_dPFiS1*
zmkW0^q0uGW0pLE%Z@}MLC;S*T*>%EGV23a9_mfxF3qu>q67nO<pO?^vEYR%f%?X*T
zZxE^xq6>ec(9FZo!%f1Q+QPkEXg6uf4q;=3D3God`Q=3D^OJ+n>b$GG%7s#g%e$$DG3FS
z1%$P>7CItrGuxL?Ncua%i>pu~@Y1`TRrtk2f}gI*jYGnr5|oG#e^eNG1YL{a*hW*u
z=3Dtu7e<fC^?p?UJ{adT=3Dl5r1VKu{aL&4Avazi`H~^9;pfU_k_suj5)$rw$r5??jMv7
z^bdu5z9M%IggOWN!oB#Jg!y#^f_g$-L%s6XTIJemxfPt`$UuK2G%)z2Tut5OJ#9PN
z$=3DbKfc3#W_eD{KRZAE@3_w<KD_k8is-Y|djQGF{#y`jOHNasK(JSZQbOK7jiSo*Qh
z;Lt#rb|!aqc7Knii~O)BUmm}3(HtVTFPXo1nU`_-amz!zO!gnQ+{a^6(p)_{{;Y+J
zKWp^`$&H)VyJpwlo_~GZo5mwo9^LxsS9h2H{NcCcU+mhkqd``1joZF~SU<K}d9*N1
z9DlMlBedWqflsUltY{%ZX8vluRYH%NOnheDNKt?!|6_eGj<!be#96VGT9Q61)=3DFq=3D
z7CX+1PHKsAUc6F-yg{5vQo$P};$`vk3YT{VUR`@>?`~=3DYdbwfGnY=3DSZ{-Zd#&b2KH
zdwc2WpHQQ7*hXvoQ=3DHu5Qd2pH-xU=3D)s3{Utq>C1$F5->{B`38c`k+LgKq@G8Qmsq<
zFc*2_iXn0lN9rV}OTEeXtbu=3DsV+H&c;~wzmOzQhMrSbP+YcIX=3DXKJAJJpW+a1O0q}
zD?QN0V$SXN#sL;dhexU}cd6-|!#^ge)g6JFCh?upQ94i>yLUmxG-=3Dx<Juc-V%J|3r
zCn6b;ZqqYa!ts4D;*yrSOq^$q`4*ROnsVw#viqcQD^fFfY(EGYJhflC?NT$jz*YIP
z^TVFbo+0rLX|HX?!TC0op=3Dm$8GzTnyU%Cy69EWoWmBZ2tEB=3D*7saK(Y>aa9<kKZwJ
zG8UHV*CREHuRbT$g3VIvQnOIcURG~-aMUdEKQC3$Q_JFxQ_w+{L{CYNm$@1sfJW@A
zrAF661BWv|qKCD@yBKGOMY(*2CTieDeP<-%J5%%ohJQrydYkjuwJGMjky`q(`QfkK
zc`Z&26v^vtOotajuLqf)H0TkgUp44aro(F?aNoUGV2pu9LqLq_X@d?8LZk4A=3Do?Bh
zJ%eN0Y)*77t62}cBn5uyoZqZy&@)VTjQeQ#Y$X`atZeX7m=3D{<?FLq2NGSl6-gT}dL
zeTBTZgK<9|(|B7UFM)38RI>q`)HockE`M>pyAGVu_(20t(mlivV_AjzCkuHAJGI#{
z9MJfLfkQrskKtjBPZ@ZY@i>lae5R1w9gHV&TH|TD*WH~`$OrkCu%iL`gL!oGIRZI8
zCt^SFImoByGUN2efW~33<Ex^KD>$a{Al>WhL%+2CTok7$M{^UJ^~`~;_e(LqMT5S?
z^elEiL|>m&rGaO2Jmo9Y%S5IJ4LZcreo|3`?q>RgL2qMvT+@%OJa}vJ0aptH*5m`y
z1|1rK!dZh3jZpo%!=3DOVWpeuU4nB&&WFyP05MtaAt2lWn=3DXBm&+VaktPKUv6~m5j#>
zIuwF}kY9IaoIa+f3_2V1`jSBp=3DKSFsgywl*<;0u^8Gr`#1)@xMV}BDJXdV*l`2^z~
zI70ccdGOcs8OFy9dXni=3D1|0^WgU%-ndYbM*Uo_~MoW9UOt%<|tW?Ly*7$%j?Ham~3
zC$X~Kb`**9ixBK<8LaqiBdFmNj{9x(=3Dwm-#qPA#Z8nSSfg=3DwrjY-^@Jr0_w_rtuWm
de>w0HSa)_*X|d6(m?$kJ(|<QzZhU$5e*s;V^4$Oc

diff --git a/roms/SLOF b/roms/SLOF
index 899d98836513..8ebf2f55e1ba 160000
--- a/roms/SLOF
+++ b/roms/SLOF
@@ -1 +1 @@
-Subproject commit 899d98836513bb3d6a4f4e48ef7cee887ee5f57b
+Subproject commit 8ebf2f55e1ba1492b942ba4b682160e644fc0f98
--=20
2.21.0


