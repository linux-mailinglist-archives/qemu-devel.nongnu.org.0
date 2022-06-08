Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D4543217
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 16:01:46 +0200 (CEST)
Received: from localhost ([::1]:55978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nywFl-0001cx-6R
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 10:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8C-0001Di-Ad
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nyw8A-0004Lf-6U
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 09:53:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654696433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+wrwuKLQwweNkn+2B/PVmTxJwh65zX1Y2Cw++gFZyY=;
 b=Fl7HZoj6Ak6/ufXHaBjwDtFw+vNs5cxce4GpSymm9y05drsXkbJbUx0ZdbyW5Mm0losbIG
 owacXqFB7F9moo0nXz0DrL1AXMTvM3no6QOghUgyA9FB6Wud2dLE1po548sCjU7IBbnz+B
 tT6HeNazFEosq9RzYNueNaVsMtxXhBY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-QHjs0l5GM-qeXS6Vol300w-1; Wed, 08 Jun 2022 09:53:52 -0400
X-MC-Unique: QHjs0l5GM-qeXS6Vol300w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B053811E7A
 for <qemu-devel@nongnu.org>; Wed,  8 Jun 2022 13:53:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B92FCC27E97;
 Wed,  8 Jun 2022 13:53:51 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com
Subject: [PATCH v2 11/35] tests: acpi: update expected blob DSDT.ipmismbus
Date: Wed,  8 Jun 2022 09:53:16 -0400
Message-Id: <20220608135340.3304695-12-imammedo@redhat.com>
In-Reply-To: <20220608135340.3304695-1-imammedo@redhat.com>
References: <20220608135340.3304695-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

basic q35 DSDT with an extra device node:

  Device (MI1)
    {
        Name (_HID, EisaId ("IPI0001"))  // _HID: Hardware ID
        Name (_STR, "ipmi_smbus")  // _STR: Description String
        Name (_UID, One)  // _UID: Unique ID
        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
        {
      I2cSerialBusV2 (0x0000, ControllerInitiated, 0x000186A0,
          AddressingMode7Bit, "\\_SB.PCI0.SMB0",
          0x00, ResourceProducer, , Exclusive,
          )
        })
        Name (_IFT, 0x04)  // _IFT: IPMI Interface Type
        Name (_SRV, 0x0200)  // _SRV: IPMI Spec Revision
    }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 0 -> 8391 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b4687d1cc8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.ipmismbus",
diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..07ba873b79caadd73ed9721fcbeee84c57676e2a 100644
GIT binary patch
literal 8391
zcmb7JOKcm*8J^`!tL0K!Qk3OaY{E{`M+%3s^J<F*C3pF<M2g~4aRM43B{{9+B*-F;
zfIJXDW`M-;A!x!n=#dT-ptttaYYp_!_U2my^icHBORhx`pTd6s%#J)mQb0@r<o>hY
z_y6<F?(Dak@qDlS*BoQUzlv*a)z1}QZn`;q48|B8)2~yDU1gnpuUP3C$w<uT+)VOg
zd=<^?PrTwr#rWM$?~7jV?T>rLX27<-bna|z1|Qz)Z7~AvZ3UJ^2Tp0O>leG7zH2qz
zTHfqdYo1-WZ<%J-6-QCCTku-U>~7RNmR+6cuK8~4_G`@bt}G85@xe}d!E!qFe_s0b
z?CD>Aapmp8y<hy}SGQlYVgOvkuZiDF0e$t}?^$PhL+A6suJHlU`MKrc!si2iTC_QI
zCg@SiU0XC!s^x>%I{g>CR>9?cOf?(LyqjM}zucCeK5L!+c!@Ea28TX>9F0bQ7KhAv
zmpOG)s4SV)W~nVz8qh|nI{VdTyUuLJ?thnLvCd70;)Rz=4KLShdEH$0xvt+Xuz*^6
z0X1#D*R!17(Ee=DV}o9DG&*3zxz7fh?6;dX`}hCi2kgL_7kx`xb05u8U+#a$VvM0T
zPhOzj(0F(HCu@G8%ZC`{&!Q{MT5COG^(@<2nSVMefrRSxpIIq-0E=rBMeoroS?0L4
zSTTC6#|)!lTw~YpdoF@%o&MwXwT(m8{DQ_Zt@t?_p-%teYO}p8bH~K>HZ-hbr7Ffd
z(RZSzd2XL)zUZ#i4>@t5F`832526pE%sl6C&J(S+d)S*~c>Q?lfCbDj&oKi-)JQ)Z
zqy47qw~gdI+cI%!C~z@$8##P=xz4^{x{O)yH`~I6OH$w#^QFr;QEb#(M)JO(QQ#IE
z8}(eX=DnQj7{yh0g=L>;x~0pJ&UuPPqhN;+!MnyTqa2+dQ1b!HK2-o`8j5lS^wkTo
zy{wmLdVYOwxEfB4`_KRVKmN1t)jwPMrheitZatt}ufNe7o*!Ii!xMvDD}ovD0l$xI
z+_ocjkd7KR>5JW68ZHj5TQfl>9$_iA8T4*#GIp?OHfwH~W$iA0jbMi&=hIgVx>+3e
z8$OYnt#&iBa$`S}jN$HNtBsWs6UPRQ%PeD4yA?rDkwFwem1R;f^aC?V;KGPl0M3bX
zoCl~3iHZCi8{te~!-$v?8eyCXC}$!hCVIoMQO=Y-h%#bIXjCu(<xGUclvOaV1eWKC
zai)aE1XFe%p{g^k>5OxxgvJF^b{?UsGok5BaHfPNbe#xQoim!w8BOPmt`niE)6{gD
znod*KiBQ#vCy+AIvzpFXT_-|Sr={t%G@X{N6QQazsp(8=I+MCigsM(F3zh3>YdURR
zCqh+cO4FIrbf$Ej2vwbPn$9^*=bWw+p{jFU(>br{oY!?CRCPL<PDj(}=sFRqI@6lY
zw5Bty>qMyP%xF3@n$C=_6QQbeLDRXQ>0HotB2;x|HJw>aXI9sVP}RAp>0H!wF6ufF
zsydHpI*(~OkLfxQsygu|fxAyWhn6&*OS(>ks?Ot@&f}WS<GN0Ss?HOfSqPtmCpfbh
zKI~2iru#4?rWayQYRr=w^Q6v1s4`D!%u^ckl+Hw`GEZyF(;D-%&P1p(AJdqRY0SrT
zCPI~YhBKwhoZ(FQj6Wlo^1+RenDPpq)oPyAYM#|=A`~@E7-&H;(28F}X>O(lj!`%?
zPy{F|f+zx66b34A+>#7NEZIK;MFsTGKoLr5Fi?S&2C6{GKn3*BKoO!h(m(|^jHsq+
zpaObmpa{_;j)j2=Y#4<aIg|`kKxL@vgn^2*oCyO}pk$y3r7MzwB9uB|paRR8Fi-_b
z1}dPuCK)I~sS^e&u$&14RiI>`0?L_Wpa`W-7^uK<CJa=8l7R{+XOe*;l-CmmDzKah
z16818paRO7WS|J8P8g`bawZH^fs%m=C})y^B9uB|paRR8Fi-_b1}dPONd}5g>V$y`
zEN8+%6(|{~fN~}oC_<?d1}d<e2?JH2WS|1dnPi{{rA`>Az;Y%GRDqI#3Mglifg+ST
zVW0xbnJ`cVN(L&RoJj_XQ0jz%3M^;BKouw%sDN@N87M-j69y`<oCyO}pk$x|%9&)K
z2&GOKsK9b23{-)VfeI*Rl7S+WI$@v!%b74x1xf}gpqxnticso=feI{V!ax-$8K{7A
zCK)I~sS^e&u$&14RiI>`0?L_Wpa`W-7^uK<CJa=8l7R{+XOe*;lsaLc0?U~&Pz6c`
zDxjQ628vMXgn<eyXTm@gC>f}LawZulLa7r5ibyd~M5=)zR1FlNVxS5W2C6X0Kouq#
zsKSJSDohxt!XyJ#m}H;|69%d<VW0|=3{+u~fhtTGsKSJSDoip^g-HggFkzsG<kf|N
zBEl8pgGmO85SKxQ#FS$T14Sgq76yt)jx8A|LOHf%pa`*4bg~NzWkY+w|5-hte@O2p
z=%>)R`Lm~^^j|8iYS4Oz(QK_3;JE8W`f};ZGa1%i)=P9;rmqTpRn6=|Z5^ut!`b((
z{T(c_%pO?D>@&4>w>1kuE1#aTlAk2lEMEzFm))i|D~|74@cxc9&*%u9XkqDPbq4PU
z1-ay5W4VSFgG_YWPam@uKAB^)QMen!^PAyGjMa<mJYNSope~>{g>1U()qM5=9b5an
zWuDff7!YoY$4gzm<r}wm!ah)WY7eUy$EsuT<a<{yD%Fd;dJ+9os~5A=s~0={I%yY6
zX;|(HwOf%#DDNueU0&WDEAJjr-VMupW8y6=Xnk+>o>Jc9<-M`;-Vx=!uzYE}eC!d*
zmz44)UcNL|zH~(SQdqt`UOxT^<;zO>GA~~qD_=gMd^s#%884rBgz^=oe1(^<jFqn(
zQN9wEua1|Wd4%#+rF@l_ua1?k9#OuE@-cdpjhA;sdHL|bYXzpeSijZVvI#!r@k8@E
zOgBD_t+bvF?-~>7MBCJK6Z0~or^5@#L^{znHQmHK!xAvfGbs#jB@^jH+thRu^CqjO
z!>h_fI?*;Y-NZat)YIYpWg?wuo0@LozCNa>!%NLXI?*;Y-Nb#mq^HB1&O|!Vrl)fX
z=EDW;zBl97i`Z<z#)=)KRsVi5QLinB%i>Ssp9@-eZ>4sFH+H)>-q_l^akw5&yB$wj
z=Rbvg;}6?J2{!zQ4z6PL_X3&f1<K7kRV%kGJk<QwOGy@S)?TFb;ZDD5U46K(&}@}_
zITtKE0^ootx4Dt4zWH|W`rfZ|Z@qfs&Aqp_U%kOPhTB|S3Fk!0vMR>c_Sd#yWA6aY
zM+@{{+m_wA`9lf{Eax^$4a2Q9e8X+kUox=Fo~N&}!J@8P_pp?oA!O9`ORG7+y+S*O
z742H1W(JHJF}E&V<%5O}iB6^pZnKupFXyQnVtXo{O}p*#E0Li!*kK>J`FwsiTTNh(
zpfKAxfA#5@+(03rB!CwA$D2_sV7=kV!T1T15LokA+@CnJx^mFV*5f4W(Fz&ksgPl6
z{%rY}>$?r}2pOi^C|$`!MgiLnjB8(dnZY$9VAlep7qHDQSMA>ndd8h?H1&e*@seEd
zcq1;#aOuu?D=y3SSHs!CrZqyDuYzgkhmTK;99{Qd`xf<alkIJyS9hNuK05*9cLpxs
zwiOK~1_md=+uNq?%Ti42UsA#?woR8D+O|8()5T5XLVxzQrVn#{)?M@4_7TH8{cf4a
zkHHIer;JTtMaEkRdVRbR!#uTjoey82dm8f_A50J2*X9A;-IxLOLOY$bOolZLdH`hS
zur=FGk{GtLdp&y!lc&-wbxZk+ES&K)k?5Xs)?##uPyBFB<)35Op8~tgXdn*v9mT$w
z($I7pyr&w%sV|C|%D0~Qj_l>6^`~1Y7QsRUJ|p_VzT^Y@fo+&*H}KrU=Ube9U?0XQ
z>{K!KU%r*g&(q8IXhbjH^ocNSlh?#%*&oCi_IvHjJ?#E|C(hh^@%B^L7!I?EHX1G3
zX~V#2ABt%!)Qw?q#9lbxXD(oH#G{egm1m;Z9!-k(1pZ9SC2|Ra@26glHLJ~*7-HJ2
zewYM<H0Aj^nd_c?&o+)@GxSGSQQp7Q%_L$5`i|pgx*0QOMJy~8B6^n2kP_$T4=+Qf
zf1!NE74Di^FV#128(kzcwv5#tJ8>sYPjROaBMa#|<rrPXPCx1A^Kc~E{O|OC?B`z)
b0j`+AVEO*C$FMbugNyRu5<f`LEyDf}=hf0`

literal 0
HcmV?d00001

-- 
2.31.1


