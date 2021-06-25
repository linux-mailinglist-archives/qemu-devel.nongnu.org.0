Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A44593B409E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:34:03 +0200 (CEST)
Received: from localhost ([::1]:58238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiDq-0008DW-ME
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhzE-00027N-Mj
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwhz8-0006f4-N7
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=irAoAQpWz6zyJxhscrztguwLA/0ARcBYbVs9NnjtmKw=;
 b=DTrSFUebdJlZ9RMmEQc7GopdvNNVN1bZMl0Lwv5UIasjmHrIYcck0MoWYK9oGBWYB7amiy
 5oYsAup1TkxGNtdKksZpzbZs6io90k6fuRyGcSSHT5xYYUDzih17gYO9ZuL8DCgvdZ6986
 A/YXv1qW8IoMWgtjUaABAaQ5UGaSRLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-Drw29DLYO5iJXw2IuXH9UQ-1; Fri, 25 Jun 2021 05:18:47 -0400
X-MC-Unique: Drw29DLYO5iJXw2IuXH9UQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF79F80F059
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:18:46 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B718960C05;
 Fri, 25 Jun 2021 09:18:42 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/53] tests: acpi: update expected blobs
Date: Fri, 25 Jun 2021 05:17:35 -0400
Message-Id: <20210625091818.1047980-12-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DSDT:
+            Device (S10)
+            {
+                Name (_ADR, 0x00020000)  // _ADR: Address
+            }

New IVRS table:

[000h 0000   4]                    Signature : "IVRS"    [I/O Virtualization Reporting Structure]
[004h 0004   4]                 Table Length : 00000068
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 43
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]          Virtualization Info : 00002800
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                Subtable Type : 10 [Hardware Definition Block]
[031h 0049   1]                        Flags : D1
[032h 0050   2]                       Length : 0038
[034h 0052   2]                     DeviceId : 0010

[036h 0054   2]            Capability Offset : 0040
[038h 0056   8]                 Base Address : 00000000FED80000
[040h 0064   2]            PCI Segment Group : 0000
[042h 0066   2]          Virtualization Info : 0000
[044h 0068   4]                     Reserved : 00000044

[048h 0072   1]                   Entry Type : 02
[049h 0073   2]                    Device ID : 0000
[04Bh 0075   1]                 Data Setting : 00

[04Ch 0076   1]                   Entry Type : 02
[04Dh 0077   2]                    Device ID : 0008
[04Fh 0079   1]                 Data Setting : 00

[050h 0080   1]                   Entry Type : 02
[051h 0081   2]                    Device ID : 0010
[053h 0083   1]                 Data Setting : 00

[054h 0084   1]                   Entry Type : 02
[055h 0085   2]                    Device ID : 00F8
[057h 0087   1]                 Data Setting : 00

[058h 0088   1]                   Entry Type : 02
[059h 0089   2]                    Device ID : 00FA
[05Bh 0091   1]                 Data Setting : 00

[05Ch 0092   1]                   Entry Type : 02
[05Dh 0093   2]                    Device ID : 00FB
[05Fh 0095   1]                 Data Setting : 00

[060h 0096   1]                   Entry Type : 48
[061h 0097   2]                    Device ID : 0000
[063h 0099   1]                 Data Setting : 00
[064h 0100   1]                       Handle : 00
[065h 0101   2]        Source Used Device ID : 00A0
[067h 0103   1]                      Variety : 01

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.ivrs               | Bin 0 -> 7877 bytes
 tests/data/acpi/q35/IVRS.ivrs               | Bin 0 -> 104 bytes
 3 files changed, 2 deletions(-)
 create mode 100644 tests/data/acpi/q35/DSDT.ivrs

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 3a51c50d8f..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT",
-"tests/data/acpi/q35/IVRS.ivrs",
diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
new file mode 100644
index 0000000000000000000000000000000000000000..eb5d27d95b2cdeda5f7e1f6b151cfea02e6bd907
GIT binary patch
literal 7877
zcmb7JO>7&-8J*>iv|6sDB}GfN{3F3l|BINCoz!U2AmlFpVo{<<I&MG#q$H=6;{sX4
z77*76AS*!Z_)s)q9pp$G3ea17>b1V~?pqD?)N8Lr5uePyZ$6GZLsCG*1G#VZz4_+t
z-&@WE^`P;Ob3$16b8CL7zL@)U)nCNN5<<{6{d(othG^~uxnj#oL}FI+UP5l;D`%&F
z7UZrLt*>|5U$xt}@3*bZP;5Q%9&K%gpFU`B2_o%og^oiTUVf@o&$XKSzEkzf8M{>~
z2X6M6W7{pCx1x3{8`Ol|x>^oIdS$$|R`+8MZwf!Sw$xpXcXpC9j@PXG>*BWyXWstm
z+U@MqU;Xnp4{tg#5SH<4<M(1nU+ueXXQAEozU<tvJ|Vf>x73~avLknMn@4-XHnlu<
zxrw@3I=I=~zZ}%Ez8vFZb+wxDGfNnkU#lk<oHO_5gmCHL(C4qcUhnU`DZD$vtJv%^
zZ<nh1hH`1a8@X!km8y-3aD{mGG9hBkdmiDLck`>kVzm~u7SnIG>W!=jsihrK)8_Bn
zj@RzGUv%1{(@yky2ckRmMQ2m|Y10+|{$Kn+95~ZFwxl!l*#wQ{*-H@<0;BoC>ogiV
z-p&2_ay{FUhZyA-FqCS!wjOcXj_X~Sz7SPJVm0?KUC9L?^ErxQ^ca;YbJ96cwA!LA
zEURc;7uWH7K7wk^{nsjMR}WRwGlt4`;^*lIHTRcSs*NSpcZ|=sWpF)bvS@uA{Wxmd
z=l5jK%l=yBP!k6mM{|VcMf62f*ylZ|`F^e8AC4x`KYz08P=vy=&kO60u&ZUiAkuCN
zzgD<I$os>4799=G|Bt*<tF=Zob>-GxDiOos7b~k*@`AT5Y!^hzrFJI*P*flaP!g%h
znA_{&Qej>nkqX2q-Y0dSDo9H7FS!w^1h<b!si+Ylm7q!`ASp2#$&E^-8bMT$Qc<I<
z1XU^lNvW#f!eOrLCnlAO8e^pzJfQ9~ZupE#rJ}}JsRj?I`y4ZTj!C7Wj+s6Ib)Vyg
z&vC=&xakv6_h}nGZNsN+`UKQ{;uh16^n~Ga!t@EK`*aMSj^WcWeFEw}6Nb-(;WJ_S
z1k`=vX4lTAYxs0cpMbj0NyF!);d9dT38?#=GJH-MKBr8dfV$6V!{@Z&bK3L?sQdH`
zpPu2<GkpT;K9h#eq~SAZ`UKQ{rVO7c!)MC$38?#=F?`M#K4(myfV$7L;WKUcOq)Id
zb)P2;pC=5TCrqD!y3bj|=d9s#*7OOe`$SaY>Qm35Im73i=@U@*dD8HC((rlG^a-f@
zJSCOc{*&;OROb2*yHl+6UqMm^eeS%WoHvy7rV>zBo;H-H4drQ538*X27|Jt-@{Fkj
z)Rkuq<yk{{)>H!OO1$)G&xCVQsh;uYSg9V|fTUDsaKWg#VANbNYXWjj8v&Zt0<>5!
z9|kD4QMezV04U2K3ZRN2K$#~a$r2V5Rbob%svs$~0A;QUP>o6f%GARE1;l7nfHJp_
zsHPsEOg#)xKnz`S5unWNBT}k^O99GMsiXh}R6Y@)%#}(6s79p#WvWzCfC4I?2vFuq
zB?45VQh+j5Dk(q#l}`jHbEOgis!=IGnJSeOpn%FJ0+hK@i2&886rfC%N(xXw<r4wQ
zT&YBWYE%kPrb;CRD4_C*0A;RJB0x1N1t?Rck^&S^`9y#+S1J*p8kGW+sZvP+3aES{
zK$$C*2vChm0m@XVqyPm}J`teIl}ZGtMx_8{s#H>d0xF*fQ07V{0#u_?fHGAoDL?_0
zPXs7)r4j+EQ7J%~DwPzVfXXKVl(|xg0M)1zpiGrY3Q$1h69LLxsYHNkR0>e0N+ks-
zpz?_TWv)~rKs71_C{v}90u)gBM1V3^DiNR>l>(HhQb_>{sC*(onJbkDP>o6f%2cVO
z00mS&5unVKN(87zr2u8BR8oKfDxU~Y=1L_3RHIUWGF2)mKmnCc1SoT*5&^1FDL|Pj
zl@y?W$|nMpxl)M$)u<GpOqEIsP(bAq0ScrAD3BhYfO>!eY5}S#5uloq0#s8{fNDwv
zsHQ}KYDx-FO-TW&DG{KW5&^0yDL^$P1*oP(fNDwvsHUU<)sz&Vni2sDq|Pn^6bNTb
z9!v^QK%52zNvV!40u)FcTLdVOI<^#`fa=&%fC6GJWWI$66<xO@|EwO+AJWHT^pkDg
z`^AMQ{Y$04?evG<s@B%CNZj=tefjhi*aDLa>v`HP&{vVZN_Kjtyk2iu-HE%--VSCF
zCJvlL`ciq_uT6kZ%Ot0q#OGsTLQZwu5f7=&iQ~H*-raGg1#MvvHOwunjN=_4tNzow
zn2(^@4jaR+Cug0R&!@yh6zL}L{1$i;<L`NTT26Ev&=4@1Y&zKr%60JxZ999iWtt{j
z1Q>oz;<;A6R<|DR^v6Kusl8u4H&7k31K+uNPOF}i)pHo1UOkr{T|L*_uaI}1E5dwM
z-@6kzMtNT=@5}Q3KzaX&@_xU3Fks%njLmm;A86$RSw0vj9~@CW=$FqAmX95yd|oS`
zm*w*V<?~0B&-cq02Fu5fQNEy+FUazRf%1hT$`|_Oi-YCIj#0j-l`qQj#ewq0Bgz;1
z<x7L*$B$9Iq?Iqp@}+_Dr6bChP(DVFvcd8mmsbxDyjI|L=Lt%)Ej=c0dHm3Q-S2Mj
zHg=L`cX-zr>W<q+b~kiirp)f}0y5Mcw~g#>=sv?7C*5bt7~V>Ty5qKy-3{G0X|p@L
zstk3<Z6muIx(`m6-QoRZs5@>O+1=1}J!^J{mztsOxNT&2L)Yn?*&W_=hPvZ6vpes!
zHmN;bujH_nfOP{mib-v6?Jb^uFF6~prnIZId|h3o4sK3l)1+U$x>)+~cKEy9-!6Xi
z{;dypKiYo(mS|djb>&L`YMpePqV?Q;?piLUt&vFx%fxfnahvykL?9~`{c3*I^2@7r
z%db`5wfy`$8Tu+%BI^5<z;5145i{!7^DB#>2ie9V=9<f^Wjhqqh^zkMhV+90@gOI&
zezly*EM;gIyfP9`C;dj@y-3&T?1<0&OeS+9T^jQ-go)<&HZH`}+&vj31HE3jGuVt`
zp=fvKJA*sOLg-Aln?D@dvvTF2ovy^m*6|8igI%GAk^QF&vwq!QwU4l2`>XkDsYovr
z+o5&+Ns#JXw?c6}wA!KAe6r&HvD3C5ZKJ6jZV#4}h6fvQQo3`G23v7jw!i64bT*wH
z%6t=!+TVR`=*ZD|54RuC7&pc4CPwx6=iN7kX!6Ry>DzXq;n0D>PUv>GY2_>*<E1m|
za7%2{DTlZ1=F(_$Lw#X9yIZ3Vb7jI`t2f*u4)f@%WvG7~yzs_|V-q@&!B(PvFxZI0
zJaTl+PcPFojr$)T+#a~D?E|{HaR*egjby^H1!f!QJv2RqRl!Dr%!r*EAEZy?<|$V5
zt$b!#^zV4Ok?5N8(zHk3_x)Qc^QQ2!Nxt294U$&$-bpxrdoU>?_@9qYkG`<3^}>DO
zS~l7(JXrAg7Q0`#hj<bTK|=gjE(OZ{^lsbh(Yq~uBEncCw6RF|7v3ZOZ0vc8)x(#(
z=jmGye~N|0esA1HmZ9yzz40MTOKE-#7I`gIu2W`Vk)LnWu07azc`d;)EFWx(V~b-J
ztyune1Csj1R%$F}p&qs`wNiG>i8xq(0(yh?P<8K@uMS;v|MkK(p95!dJzu$s^S4ZF
zEEDQgyto&q$ER0{Z^$*Zx8uATnW$$nyc!7`KdEOfGr&={1X8fR6o>=4v8*;O(nfQC
My1vvGf*TS42iWvOY5)KL

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/IVRS.ivrs b/tests/data/acpi/q35/IVRS.ivrs
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..17611202e53a32f7da8e4925d6955b384670b8b1 100644
GIT binary patch
literal 104
zcmeYa3kuF)U|?W$cJg=j2v%^42yj*a0!E-1hz+6{G(ZFd2wb#a5MXcsa&G*C3Ng3<
b8B8F|0mK48`~!%80r77J1`m*;1q_S;Any(V

literal 0
HcmV?d00001

-- 
2.27.0


