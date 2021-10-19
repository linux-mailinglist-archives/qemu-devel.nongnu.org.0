Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6004334AD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:29:33 +0200 (CEST)
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnJE-0006BP-NE
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAW-0000Cf-H3
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAP-00028I-29
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ny6i22dSZQC3mrPDi4s6PRK4pnVtAekpF8G2Yb/TCEg=;
 b=iYByZr7crYnfDoqHLGClbnFTNbRoga585ZRq1tIsgo1a0YT7T6CRUFRh5SsRoF4V49q7D8
 LX+iYjhKCRjnduzSKmOv4khlczTHveyUU7QkS8H3n8WR+bTxMiBFkEx0bRnr5J+IqKXxSZ
 9VUdfA5xJbZsoDksHky5KeTgFp4fu3c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-6TO03oXCMXOMEqnuZMtBsQ-1; Tue, 19 Oct 2021 07:20:14 -0400
X-MC-Unique: 6TO03oXCMXOMEqnuZMtBsQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 h19-20020aa7de13000000b003db6ad5245bso17345313edv.9
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ny6i22dSZQC3mrPDi4s6PRK4pnVtAekpF8G2Yb/TCEg=;
 b=qsGLOjaQcFjsx3tFVui2ZliE9iusSNQ5iiXPGuGhPhLd1iEhWDjZ/EKmQz9PCp1mVM
 sdpKZ4bIs6IVN2NkMO7vrKpQAawtu7StFaNKI7sxFD+iEi2NworeJG7dNuoleUFn9EH3
 07gUfkNN4UA87B5aeFwmV4DCh3xm2G0yeuGT8YmezbgSw0bcIWWd9Io6CmkCuppQLFyv
 YxvTmeioJ8rL4v8QsjMQkMbiDQInMOwj0q9fk0nhry7a7ADSGNrWGxaJqSjiYen3pLBO
 zH/8bYKFyCRBCnS1sGUmNou3l4zVQ5V7aindIdDUL/dN7BN3KjvFE3mycjQP4tvehUqA
 R32g==
X-Gm-Message-State: AOAM530QExMkuZBWwMqMj3v8M5ofLdTU18t1fqern16UWTQ1js/GXu/m
 kcnBmV3HDUsu2xh9wYHgAX2M6Ew1U4kwStnac6vWfFPkxgTfO8vHqpnr2oKmZfodkFTPhvWb9gP
 31L+6NhAKWicNYOmv+Sp928md927Jjci7WwyKuR8RRUcvFsiztZWbMIHdEnwy
X-Received: by 2002:a17:906:3784:: with SMTP id
 n4mr37478171ejc.129.1634642412976; 
 Tue, 19 Oct 2021 04:20:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/1W+ngNm7MZBMSGruAQ+AuF76DnrFBh2Z3tnCJPb3+Bqb56wRYjeoJqTq7v7VyQLd/gQDBg==
X-Received: by 2002:a17:906:3784:: with SMTP id
 n4mr37478132ejc.129.1634642412671; 
 Tue, 19 Oct 2021 04:20:12 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id jg21sm6935638ejc.14.2021.10.19.04.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:12 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/29] tests: acpi: update expected blobs
Message-ID: <20211019111923.679826-12-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

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
Message-Id: <20210902113551.461632-12-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.ivrs               | Bin 0 -> 8306 bytes
 tests/data/acpi/q35/IVRS.ivrs               | Bin 0 -> 104 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 4fe8e8272a..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.ivrs",
-"tests/data/acpi/q35/IVRS.ivrs",
diff --git a/tests/data/acpi/q35/DSDT.ivrs b/tests/data/acpi/q35/DSDT.ivrs
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b0eafe90e5832935557ec5e6802c0147c88f379c 100644
GIT binary patch
literal 8306
zcmb7JOKcm*8J^`sS}m8-lA<iX5)n?)SBiwP^J<F*C3pF<L~6yQ;si9nmF2XulOl^G
z2J%1vSpgEqhoTAVpuN$70`%6NdaZ$8+M91R&{Ge+<XRN*$?W&f?8q}D1;jk8_MiQ}
z|DSJmXTQ~q7kJ&bi;Nk6sBE~6pjdg;cZ>KLj4?W=zfLoCk@fbxO1*Dn5-Fp1J;Tp&
zsF;NxdzG!a@%!EI%P@TR)6m$C*rl(WTbH(@k8gyR7=f-`iY$vxoa%f(sPudLuI0PU
zlG$%GJ-d9@GR?j#&XQ)o>~)yg-)efSus+-02;9`oH<;^PSRJ<0gWcSs<@8$rI`{3$
z>0f+#;ob6`pa1ihH{Y;Q0G!2N6MxS|bO=8Tt(9=-d@;CUd_;79ZFRW##eiQHZ4O<D
zLTb5fizZ67dhkYX|0S<ec6lGOe%mj(rB(FH?F6|M>-49~jM+3e^!xK@H2SMJWzPG|
zX_-Q0)ol3Hu2gA28>#B;HT-Ui*^J$NkYTCbb%)}`SE_BV=y$w+vG77a=$2VTEn!4W
z+aH9M6Ataq2O%4TnbGKg4d*`}Y_s2O+w9-}OCPWUYeDoaXU%^yM}4{bfTb8iZ@%{o
z^@hf~w|}x3l>2;$QGNwo@td8^gcVx0v$pVTQUVFp+kbAY;sGq~Q4+mJuVk6y)>7RF
zS;!2dZd_)U@%Kyu)q49+wl=m7SqqCA%e2yGXoPzEXV?Ais?41d_uJ60j+Lz&?<L<$
zn&z23p82f1(K_U$fyQV~;oMK&Pcrk2!#PiNy6$0bGV%T6sUsFK!#u+b3{gAxaE$hR
zH|QFfJGN!w)==PL?6!(Hc*WjcP(6=X@ORt7jmuErR!Y_LxKL@gI!5NMpi$sf+FPxn
z-}GKB_KeE9yT%Gn`EK=mqW1(vqfxX=i0FOe3Zopo?^E*uD?D8WXBvufMRW*bY*_GS
zd@pFt57*<Varec4{3m$+gVyKE-?UEr&22@L>&;(>!zTt;+3>{Rij}|&_=rD8HXhp%
zJIE!C>vUkZmxoJ(tJZ9kPbXNGZAamaZN?6^O~2{ZSi$b&uMzE1<oxC}gB}*g{f19u
zzti>eYwzskGbucsY`wi!W#Zhxd5z_5YPS*y>M}?oXs~=Xg??Zr30xcz3&44Cjq?DN
zAu*AkV-uVSY#b3&LKBQL0p(1D#6)j6Hp!W?2T4Xu2~7$npqz=2n6e7ymB8{mDbAG8
zlwiuvBUE*!HJxeBl+d(b%FZKHb<SuyXE;+rXLOwiRh_e%&RI?8tgaKGs?*eTnwm~i
z*NIToi8qik(sP>5IbA10Ri~xtv^1TTt`niEGo$IuXgV{xPK2sXybG24X=^%dT_-|S
zXI9gh)pTZcod{K(^P0|iP3OF>6QQbeLDRXQ>0HotB2;xcnodX4>F7EUsycI;&YY$*
zr|U$h>db38^P0}Qt`niEb5YZ|sOenPbs|)C7Brm&O=m&ZiBQ$Kr0HDJbS~*S5vn?m
zX*!Q-I*;i(5vn@zC4r|;zK51Ioy)pTgsRTtn$F{z&f~gHgsRRHoLP?FgeN$&62I(D
z2&VfmB&HW*PioAQ8uO&iM5r=PY0Og^^OVj+s4`D$%+nh4w9Z7RG9S~Jk7>-ubS6TT
z`8a1vmwB8s<vady!IUp<gv6A0a7C-RqSai{Ya$diO&DldG0=L@L}_lO2F_79Hc$j8
zD}p2fSri5;aNLp%Ml9Js14RY&&_EGNX)sWMl?JLn$v_44&_EHQH_|`_Hjb#KYM=so
zXrKtuBaVfE3Tzz38ab2<R6u2@>V$!cw44b8RiI>`2&F5Mfg+STVW0xbnJ`cVN(L&R
zye1haLa7r5DzKah16818paRO7WS|J8P8g`bawZH^fs%m=C})y^B9!+N1}d<e2?JH2
zWS|1dnPi{{rA`>Az;Y%GRDqI#3Mglifg+STVW0xbnJ`cVN(L&RoJj_XQ0jz%3M^;B
zKouw%sDN@N87M-j69y`<oCyO}pk$x|%9&)K2&GOKsK9b23{-)VfeI*Rl7S+WI$@v!
z%b74x1xf}gpqxnticso=feI{V!ax-$8K{7ACK)I~sS^e&u$&14RiI>`0?L_Wpa`W-
z7^uK<CJa=8l7R{+XOe*;lsaLc0?U~&Pz6c`DxjQ628vMXgn<eyXTm@gC>f}LawZul
zLa7r5DzKah16818paRO7WS|J8P8g`bawZH^fs%m=C})y^B9uB|paRR8Fi-_b1}dPO
zNd}5g>V$y`EN8+%6(|{~fN~}oC_<?d28u{AP(-SMB2*0&p<<v469%d<$v_n*8K}a9
zfhtTGsKO)zRhVR;3KIsZFkzqylMGa0l7T8r7^uR8fhtTgP=!ebsxV=oh~(Xcfg-{k
z<AX^CiV(L!hQyR(3j;+Y#})>PNRBNTC_*{5WS|JKRCKZr3uQxl!2el2pnphj&(NQ8
z@A^-lP11j<w5mbt9fsf8EW>d(D|B$_;F%0-FPl|5uhF4ShlW{LY;IyTU^w@owYQ5!
zmbn8fQ+Teq>2~G-=#+BvR_3!AHpf?j-e)(d%}V3gj6U4878sqO6CEtQtk2>bp)8j?
zY%JH%Vvvb$2f1U`;%D=0E(v#Icz-jziLrW7Sm5hG2h;`hrd-JNy=K5ZqH}AHw=B?l
z6a&KT@OZf&bOPh%ZrledPwjE_%2;(Qo_y!(6{UKGSFfOdYV}HCdi6?gzeU=`QW}=~
zV(nJq5z4ztd6$=W$I81$ly~Fu-k5j`3tHb<y{DA-czJKEymv%-FD_plFQ0mZ@>QjL
zm6xxMm9HLAz8aUWjh9b9Liw6fzQ)Vf#>&@@C|`@q*T>7xJVN=pQohd1*T>4&k0@V{
z%Qwc$&ptx=hEl%4%Qwc#H;yRZK=~BC%Erq(qP%>0;IjhLU98{gZG{;=<?)B+b)0T|
z8e2I%9lkXt(uuaI=_cl7UQdS)kco7nZECuSd4?rmnrBiNzDg$2iMFZfCgx2+Plr#H
ziFBfEYPyMeu%xHM_sc{&(Ka>R#B+U2Plu11iFBfEYPyN%bXiY_FP({WqD@cdoO-yP
zy}uB&D%fhlwu+s^n!mI0ve=zySQj6z`1_q|AfHkTlM~*Qb^Wbk<E?k2H?RGw`1b4X
zymjsEo!8%CJ;U|a*W#x&Ygu*Uo_)_YY^>_TlW6Juo^9E^>p!5N%!;mGZ5wX09T;w>
z^@@Q7@Dd$r21~kb%fljjo{&j5sIC_Q_sZQO)|#8`rWrA6#8ZFnBG-csiB4wAuHP(`
zR!h_kv2m0x<lJuUwZzaG?6ObXQmJ&M(3rvMeR;0;#KmV*a%+Qxk^owMA8$snh=s$G
zgYgR_A+i>*>^^a2eeEDDw9+K&(Fz&ksgPl6{zC1T8@O%r2pOi^u3pF|MiJYIjLTnn
z`N3r)VwWQ$jM(;9>-KL4p>b;mO<}Y%UXlwQZ^TU*F5en&#ckR7dN?=OwnixPbu{hz
z@X3jhqx&B1+@L;gvuoSv)$JFD&riVklY!f}V<n@Bfx$)auI<pqVl^dp7AfH+wnMiZ
z+ID)Y)5T5XLVvDZnm){}Id>!I+D8oY^rvMaKL#(lGG%NcD>2?m(5vH(80M+H>wWwZ
zJ=2)~_+fhBxi$~z>BbCbmAko&WiqTb(06EI9-F4!42fa8SFRRLVe-`dYQI`K%i<YN
z6N#QFXCp<I_{5LrROtm)_zAG9j0WOxM^NloDGk2c<~`LAPHRcbRK6+1_e#%atiRmI
zvILe0@Eg$qJBIh|`?g`C-M~8uzi)B*zI_;Hv4_OifB7aWzfPaUqY-@;(=Wla?N<}q
zSbq{%*dMhkcd#$}KwP==^3A8QWgBM`Z8Tc62Zn*ueiYLtrJKUwh+S&F16;=7h*u-E
zEAK?HahVYg&fkf}nc|GWcRJ6f{D$8VLrmMq50hY!ro3M#bKSA;*v4^eQ~vNG$_MBA
z`I(e~zT^D4e%?%32@8vOh@Ph_q{R8z!`sl?f2MZ96~33<thToB7@Z|FHgnY;J836P
zZ*gZMeUWeN)zfqrd;6K7R1$l}7?K|arI$p2J7zGLaj@z!Y+B;vtUNhKCp{R?YD@$+
L!3s0<%&`9h*gn5%

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
MST


