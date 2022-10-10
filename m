Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE25FA37E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:40:59 +0200 (CEST)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxhy-0004Rn-9o
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdi-000514-Ab
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwdb-0007ba-E4
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zvXCf8qkkFDdUiGZXobQDZMUIVQTzfnb4ghL0RQe0Nw=;
 b=gymFiaYAeXXFjNQT/B4A0mH3CnfhTleKBWadS+8qjt0JsRa9bUV5dQm8544Ib32XZsO/y9
 vuEGfn7B4SgDJI7Pr8fjvkQ/eTHgiZRLWQlaZG+qU+SKePgoVMF1PwZrV1Ken/kiOgVyr2
 bQB0iU9USvpdfbpIpKoCSEFDHifW0Nk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-44-CBLbUO5ZOe-LLu-iMu4F3w-1; Mon, 10 Oct 2022 13:32:21 -0400
X-MC-Unique: CBLbUO5ZOe-LLu-iMu4F3w-1
Received: by mail-wm1-f71.google.com with SMTP id
 3-20020a05600c020300b003c5eefe54adso985027wmi.9
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zvXCf8qkkFDdUiGZXobQDZMUIVQTzfnb4ghL0RQe0Nw=;
 b=1P+59ehvcXhI3e33zNLqPc/i2+1ybVn4uSGa5cRQJDCsQxfdujnGW1FaZwwZTsUa6E
 aLi3KYDLxtpA0ZlznK6Nga4ELWly7yHs7lRh/Nc1F9ZRqAzD573NuUqgurw1gKECvD98
 W6UhfvMqmlqdMaRVd7DyBz2hqKhx4iq90DfMWBukBdw6Y6Uy44Xk01+bKG24FsgJ+zou
 zq+aD+/P7lYdJlGYuOpS7CIfQtL9oZ7PpImu7LeRY6YAuEW8NG13+y3ejlkjIupr7+RK
 blfB86RGS7AoF/kR9iOwAiNS4495KZZ9fJdkv4ST0s3kTTzOJt7r6QzEZG1XHSDpArKb
 yswQ==
X-Gm-Message-State: ACrzQf1RdisvvWdLdyC9KbbD7i/jvgydCe0VpY3/ZK5iMoEyxWdBVWi8
 IjO6N8QvqJG3xo7FmF5txy4//vECHUsmhvdMWPD8MclX36xH1ytQTELjjayBt7dltFsIJOqDb/A
 CQspyHwDaX0x5fRVz6/UMs/vUWfPPrXyPCbPPcf62whzDo6Au3JxczpA6wwaV
X-Received: by 2002:a7b:c056:0:b0:3b4:e007:2050 with SMTP id
 u22-20020a7bc056000000b003b4e0072050mr20730309wmc.38.1665423139374; 
 Mon, 10 Oct 2022 10:32:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM67GZVP+EvKwYEV8g4pqeikIeTUYTdMmdmBmdLb0V93fu67Tm/Kfp+cPlrC+ydpBHLDsNH0VA==
X-Received: by 2002:a7b:c056:0:b0:3b4:e007:2050 with SMTP id
 u22-20020a7bc056000000b003b4e0072050mr20730280wmc.38.1665423138889; 
 Mon, 10 Oct 2022 10:32:18 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 w3-20020a5d4043000000b0022b1d74dc56sm9209829wrp.79.2022.10.10.10.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:32:18 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:32:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 48/55] tests: acpi: update expected blobs
Message-ID: <20221010172813.204597-49-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

From: Igor Mammedov <imammedo@redhat.com>

It's expected that hotpluggable slots will, get ASUN variable
and use that instead of _SUN with its _DSM method.

For example:

  @@ -979,8 +979,9 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)

               Device (S18)
               {
  -                Name (_SUN, 0x03)  // _SUN: Slot User Number
  +                Name (ASUN, 0x03)
                   Name (_ADR, 0x00030000)  // _ADR: Address
  +                Name (_SUN, 0x03)  // _SUN: Slot User Number
                   Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
                   {
                       PCEJ (BSEL, _SUN)
  @@ -991,7 +992,7 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
                       Local0 = Package (0x02)
                           {
                               BSEL,
  -                            _SUN
  +                            ASUN
                           }
                       Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
                   }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220701133515.137890-11-imammedo@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |  14 --------------
 tests/data/acpi/pc/DSDT                     | Bin 6219 -> 6422 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 6186 -> 6382 bytes
 tests/data/acpi/pc/DSDT.acpihmat            | Bin 7544 -> 7747 bytes
 tests/data/acpi/pc/DSDT.bridge              | Bin 9078 -> 9496 bytes
 tests/data/acpi/pc/DSDT.cphp                | Bin 6683 -> 6886 bytes
 tests/data/acpi/pc/DSDT.dimmpxm             | Bin 7873 -> 8076 bytes
 tests/data/acpi/pc/DSDT.hpbridge            | Bin 6186 -> 6382 bytes
 tests/data/acpi/pc/DSDT.ipmikcs             | Bin 6291 -> 6494 bytes
 tests/data/acpi/pc/DSDT.memhp               | Bin 7578 -> 7781 bytes
 tests/data/acpi/pc/DSDT.nohpet              | Bin 6077 -> 6280 bytes
 tests/data/acpi/pc/DSDT.numamem             | Bin 6225 -> 6428 bytes
 tests/data/acpi/pc/DSDT.roothp              | Bin 6434 -> 6656 bytes
 tests/data/acpi/q35/DSDT.bridge             | Bin 11227 -> 11449 bytes
 tests/data/acpi/q35/DSDT.multi-bridge       | Bin 8628 -> 8640 bytes
 15 files changed, 14 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1983fa596b..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,15 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT",
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/DSDT.acpihmat",
-"tests/data/acpi/pc/DSDT.bridge",
-"tests/data/acpi/pc/DSDT.cphp",
-"tests/data/acpi/pc/DSDT.dimmpxm",
-"tests/data/acpi/pc/DSDT.hpbridge",
-"tests/data/acpi/pc/DSDT.ipmikcs",
-"tests/data/acpi/pc/DSDT.memhp",
-"tests/data/acpi/pc/DSDT.nohpet",
-"tests/data/acpi/pc/DSDT.numamem",
-"tests/data/acpi/pc/DSDT.roothp",
-"tests/data/acpi/q35/DSDT.bridge",
-"tests/data/acpi/q35/DSDT.multi-bridge",
diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
index cb718f1a8a591b27ca841f70f40762562c15c837..8282d449ceaefd914b419f507a13f3fb7b318aaf 100644
GIT binary patch
delta 1170
zcmY++OHRU207l^w3Y0==%cD>pC2<9aFC2o!nHsImOu7UUx8MRCkhlsHV;r#tSKw}p
z=0C~3(~~dfd-1mP^CG`bQpc&hfBH{>f3<%si%l7A_q&(iHM?<(!&T|6i-&8!>XqyK
zuI)Hg$1DHC?lwHweFX6zTQ0<0m@DR5j9U#>6RVl*h+7?27pq&0TLab*Ynbeqn+Nm6
zJd1H_!kS`Dlbvw$VZNAeF>WnbORQzGQ*LcoTdZv{ZUHP13ru##tpn?bbu7j$goR?E
z$yVGVSR@u%j9Uzg#bT44bL+yoVqJ@I>%n?rJ(I1u^<jOnzQwo=U<0v%$u`^)SR$5K
zjN1@46dRiCg4+l-5*t~JTMA3XQj_J}#;~#2*kar!u!-2jWLs`i*i>w4F>W*1Ol)Sd
YOKuq~6U!{dZ4R4@&Bem6=j5mI3(bW3jsO4v

delta 1329
zcmaLPIZnd>6aZ0MaT3R|9cQ((OR1<Jge{aY1|bj#VW>cIN|u5%00*Fm#0e;&KpcaE
za19nQ<^S#IX`UyaV<$<Iv%|<R%;k6I&U50o%Pftv;NW%f=skt|R=PUP>?}P$c5-$$
zOHN(G$Qg@!f3)-)=PxHodUSPtb34Cy_`#F$KeoV@f;s2Gc^R*9E`SRP=3E39WxUSW
z2HOheTmqM5yusN4I|}Ap2A5^L$=L<F3g+yAJsEFt_QAe_Iak0H8BaL};6TBgtKh1P
zw>j6qH3f67gX=P$ac+Pc3g+AdH)R}iZh>10<{W}U8Sik8z>$JEx4~^0C!9Orj)FON
k!Ce{ea_)h93g+Ag_hr1tc>o?LnDY=k{KIDUu@Zin-wNzyDF6Tf

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index aebb29c2a4ae67b732bef3eb8e72c5665bb3a7b3..9520f3b7303a43091e8c77b64d1f76407e85f1f4 100644
GIT binary patch
delta 1131
zcmY++OG?8~07l^y`bck+Cg~$hUn#hP`mV#))R_uKXJVG%B3wdu;Y38x6*zO^M!E(;
z{sZ?;4<F}sxj!^TS={e4&#Ud<&2wnBUyoI}sp9L;-AnkL-`2~cW#zBShZ|G(t95Y~
zcwXJ}tN*b3jShBiVe-#bVhvbBtYNcbZcSKItm!arEm%veWwR4*KFk;M9mcH<Ym2pQ
zcFN7bjF@p4w+^f$*0I?cw*VH11rFmD!a}joX6M|xu&!9wVca5EBo^6h#Vv-#VzI-x
zC9p&+vDpQ;9;_$Ua~QWitS{EL*_zt`HV_*)jN1@46dT%X!!3oSVyVNpjbJ0Ok<Bi-
zWw1;va~QWVY%DgmS;1`rn}|&u#%&6licM{{<u-%O#AXiTHiyl{<~F<Hmcw$f++o}n
Ou!Yz{Ec$p#e`<d~%mMfS

delta 1284
zcmaLPJx;=K7=ZCMDNsra6bdchiIZ_cMa8jLjSd=Pb<*U|C^~otJpxy7!pV3BFX83|
zJcGgbjPJWX`Q`c9UX8sh&#t!;%d#i$-c#VEZ+9l2nflpk`4W7_r%t{zHm=EUE<DFI
zX?EpXmSZiy!;Q^#oWEXX`T70g;c<TZyvEaiTmTnjyvw-=E-ILF30#u#gtH5F70kH|
zF3Wh2vj_GR%(()t$atT#5B3$zIRFPTKHyvhR~5{;2Cm6?%DE1%E0}W#4rP4ExdCn{
zm~#`{lyS;A0!Iqw+yb{`JmcI3w-wAe2FEf!;+%jJ1#|9zJ2K8Vcfnl+bMAqAGCt<q
e2lo}sc>o^B_=NKiJXA2}5qR{6ZSxVuU-mC@|70cr

diff --git a/tests/data/acpi/pc/DSDT.acpihmat b/tests/data/acpi/pc/DSDT.acpihmat
index b7c5de46346d2777b33f7fc464d319bd762fda8d..33169838bed50710495d45e0d9486ac59b4e504c 100644
GIT binary patch
delta 1170
zcmY++yGp}g07vl@dr8x@x%Hkl1)spXRb1MpZYmhvgv>sTLsvl`L2>HrQwTnYqbUCa
z-?tuqoS*a03okG7yH(~mmB)AQIrgr$4`s0|!}WIa7C&V-)nb2Mx{Koe+S_r<MSkl$
z&W_`j|6%i*>~6l}=#L%jiB(}$v8u(m)nGNTn#m5i)nRq9y2ZFPU=6W`$&R?WFjvgA
z7`G;@Db_UEF*gt9iFp>|)`GRfS|&T;=EHn3-(uX_u(nv+WT)IZu#Q;AV%!2)AQqTx
z&Mkz6Vxh&jMX*RLGT9lo7#54g7UPz{60yW&3vOLlSFCF>Zar8}tY@+%w?3>d*0&h9
z0c;>PFxiUR5H=JWT8!HWHWC||Eax_cjm5?m<CelwvD9R1ZWGu<Y+^BPQ`l5&YO+gi
W87vdaEXHjHn~BZDf{&N<tMUu^%?hCa

delta 1329
zcmaLPyGp|V7(n5K-qJK}(==^*Nm_7n^llZG#wa2vVsx^Qj#Xd4*%xr=>LNHQC_aJ@
z<KPQ8dciaP|9bd1?>k@Hc9JG%H<4kOpRe}4XUETzER8ew@M-?y-315vba|9nS$ckK
z=d5g;oH~Y)Gv*Ke!s2h7KAt4$(d_c-dU|pDgIAXRaUPskFy{ieAmdfeMQ~BUoJ-)6
zjMq3@U`xTA%iyw%*E!o@Tfv+w;EIelI6GiR!JMn$s*E=|*T6LebFPEyG9Gbu!LEWi
zH^2=UZ*lg(o`N|y!A%*DIs0H=!JJ#*mW*T0ZE#z`oC9zm<6X`ja7V$MyWp;j6V5$w
oPr;n~;J%FaIEUa+!JH#-B;$R~1Mon>oQL4yA2zeMN%&!Y1Jnj<Y5)KL

diff --git a/tests/data/acpi/pc/DSDT.bridge b/tests/data/acpi/pc/DSDT.bridge
index e04b5b2035fb665b1e75075d4c47776a51fa77e2..407066e1ac46922751969b823000e4fdfa542662 100644
GIT binary patch
delta 2499
zcmeI!IZnes7>424aS~^|X7iH8VG(`U15^nn5=elAp$d|ZK%F*1NK_!XfewxkaR#oy
zQK*@a|C5-hDbtLmc=T4*H~t>IoUu5GuY-+TPI;ZNJIi>QD7R@cOx=e`c5gka!_UmK
zkNi_D>Ge{5klbA4^mGtk@sr=PnY*4H+D<f{o^#P(2<2Cpytz<H_8zXy*~)l&sU@2f
zVk(@va7>jT^;jM-PcSdSEfh6Cji4q$6bpa_f&~$7qgVti5-ds(#S&nNU`d2KDC&SZ
zL0y6<mI2EI%Oc!GkpVJ-OoAvHfCfQBgnKBOfF?mxf+$*m7C}pd`zYFgHbGm0C^~=+
zK}Upr6kR}<pesQXD}WV(6%ihwSOu&StV$5Y8eolJO@sp!>wtBFbqS)_0BjI!h;WFa
z2j~&>B#5F9=o9osc#L8I7!V93h++sB5)4Hcqu2y&5^PEk#TH<TU`vE2D7FFH1ltls
zu>;s4*b(6f#RxDW7)cPtE?}2n7x3fJSJa3P+H!vQgTUv0IX{11xjsIi<^0V56xecp
N_)`4q{JgDxDL<$GC>sC(

literal 9078
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
R_IU7$9`ENDsa>Zr{{!R>?|A?K

diff --git a/tests/data/acpi/pc/DSDT.cphp b/tests/data/acpi/pc/DSDT.cphp
index 3e8a202b0f32d585b38d4f8c85247124de5ec73d..013de154913063ed1ce3f154444b9e11f4608eac 100644
GIT binary patch
delta 1170
zcmY++OHRU207l^w3bdurmS-tYqATzLiX#ISXKG?~X40j&1P2UVg>l4E+yLt^n*SvC
zPEWp^&*gCy6lL*p%p9kdd<C~r@Njsm%54?z4*N3t$e-Nud|i2)^7S#Od)20R4jrfN
zc-4Q{pCqUI_bB;e7iVHF%oTGj#;pNsh&4=h$*l=%iZw09tp#g|wM@3;=D|EM&tlws
zm@np=Y{e~r1!954xV2$zv9`&sxP`D#EVLN64y+^AG1)b@F03oowHUVu7KueBTXTzH
zu~=*|ZV4<AOH6jdtq1Fg^(@A%59^EdO}61SfDOb37UMRA4aJ5g+j1MhMq(q2aT~+N
zVq=rtaZ6#TSZXnD6WBy-VzPo;2Ft`Ui*cL6reaf*?YPZgGqIV)xXod6vAN0ax#h52
TEVmf91#BU<5R1OI=}+w!HXZNv

delta 1329
zcmaLPyH3IY7(n4R6ey+8a&2k3Bu<WAKyfnEYK)0StxlSh5%n#60TUTr9d$6ilRk#G
zc*g%<PrjUw$<x?Lv-Bd448weUb9Ox^dA-iFB=?VAmYMeu99r4>G`I8Y^290F`7Awm
z4WnQz&-|6u-#C9hO|#?0&F$U%>i!3Bto>sPY$=#?5nPn<Cg&2kq+rfva9PG<&NkRq
zFy{)mBI5~X2ka=Aa}`{b@fK$n>?)XZ4P2A)Hs?CHu3*j{*pu;;vk&$a%(($>$asfy
z6WmlV=N7mn;~D2RxUFE$9dJj+3Fj`jt6<InIFRuk=MWq!m~#)@lX1#90!Iqw9D`#S
h?{n^h`wHef01sq*z<CHBDwy*KJo>|C{{9tyn%@v~V8s9c

diff --git a/tests/data/acpi/pc/DSDT.dimmpxm b/tests/data/acpi/pc/DSDT.dimmpxm
index f7d6ca1448cf0ae3c609fc1e1391cccc2d7221fc..289ec07c07734f6fb10e1f1f3de7b3de2a4642fd 100644
GIT binary patch
delta 1226
zcmZ9^y-vbl7>3~z3Y3pRTUyFrX^ltVzc?5J7B@AqI!V%VaVBBtkr*dN&%zUM@DOy;
znCBVZcfE7ve!tvYnY_p!H<@MCeqPOIXl{4wvRIb>YFB-S+w|Tp4(Fw_D4y<2-6<FO
zgKJrJ%PIdu6~z11I`a0OU;g0H0iaE21KJAm*dS~GHY7aeu}RnjY%0iOi?9XQlJJB_
zhtL6Z6y&i@*amD%c*>(8G=N4y9y^2`z>b7xJi3G~psOH{UBWJ4SHg21dxSl}o`O7j
zgdU(L;haaG&<FGt<S`%&00Rjxc<dAQ0s9K_7!rnnp@a(_Bf<zUQjo_1;Q(+T;gZLg
zFb0ej<Z(zi1RP3u&Etr01UOQV$1&j;a4ccY<AiVmI8l(tDd7}wD&dO9gfIb26y$M6
dI0KwXc*A2#m;$B>@|Y23fEl3w_LY3pegScr1^oa3

delta 1329
zcmaLPyH3IY7(n4R6ey)Yp+L)}5S$#ni-R%LYK)1-Se-N}qnB53ayD_`6?D_V_yjzR
z@fqB_#54Z?dh+Ew?98{FBu&od1H&-y-kcBLiC-_XG|s%km)V#97#vvX@;I}z^!(V#
z+1VsHbqynD%tqnD;%}Tjoh0ee)%DHo^y2;puPpsz3v4Nva~_<R@hay6xS(LpMQ~BZ
zYn*Mctzgb2a7o7NoE@;EV9sT5S;iZjU9hWQ&J}P)#+#h0;HrW-*T6Lyk2!l_Pr;n)
z;JS>rI5)rz1#|YnzKkcFo8YE`Ik&(q8ONO4;I@J}2jD=)yPQLCs9??=a7V@o=PtOb
nV9q^oPsV$k`{2HUIY;0~#`~NH;DLfU55dDfY-aDz(Wm(h&iY-i

diff --git a/tests/data/acpi/pc/DSDT.hpbridge b/tests/data/acpi/pc/DSDT.hpbridge
index aebb29c2a4ae67b732bef3eb8e72c5665bb3a7b3..9520f3b7303a43091e8c77b64d1f76407e85f1f4 100644
GIT binary patch
delta 1131
zcmY++OG?8~07l^y`bck+Cg~$hUn#hP`mV#))R_uKXJVG%B3wdu;Y38x6*zO^M!E(;
z{sZ?;4<F}sxj!^TS={e4&#Ud<&2wnBUyoI}sp9L;-AnkL-`2~cW#zBShZ|G(t95Y~
zcwXJ}tN*b3jShBiVe-#bVhvbBtYNcbZcSKItm!arEm%veWwR4*KFk;M9mcH<Ym2pQ
zcFN7bjF@p4w+^f$*0I?cw*VH11rFmD!a}joX6M|xu&!9wVca5EBo^6h#Vv-#VzI-x
zC9p&+vDpQ;9;_$Ua~QWitS{EL*_zt`HV_*)jN1@46dT%X!!3oSVyVNpjbJ0Ok<Bi-
zWw1;va~QWVY%DgmS;1`rn}|&u#%&6licM{{<u-%O#AXiTHiyl{<~F<Hmcw$f++o}n
Ou!Yz{Ec$p#e`<d~%mMfS

delta 1284
zcmaLPJx;=K7=ZCMDNsra6bdchiIZ_cMa8jLjSd=Pb<*U|C^~otJpxy7!pV3BFX83|
zJcGgbjPJWX`Q`c9UX8sh&#t!;%d#i$-c#VEZ+9l2nflpk`4W7_r%t{zHm=EUE<DFI
zX?EpXmSZiy!;Q^#oWEXX`T70g;c<TZyvEaiTmTnjyvw-=E-ILF30#u#gtH5F70kH|
zF3Wh2vj_GR%(()t$atT#5B3$zIRFPTKHyvhR~5{;2Cm6?%DE1%E0}W#4rP4ExdCn{
zm~#`{lyS;A0!Iqw+yb{`JmcI3w-wAe2FEf!;+%jJ1#|9zJ2K8Vcfnl+bMAqAGCt<q
e2lo}sc>o^B_=NKiJXA2}5qR{6ZSxVuU-mC@|70cr

diff --git a/tests/data/acpi/pc/DSDT.ipmikcs b/tests/data/acpi/pc/DSDT.ipmikcs
index a7b4760817e07cb36e13c835d04abd7bedcabe7a..59a6d5860887b511b7ce5f17d7044a08c14f0f60 100644
GIT binary patch
delta 1226
zcmZ9^O-{mK6h`3^3Y3rjQA(lw6ypMnASw>Q;!I7fjx=@+Zov&O=t_(OLtKIzaO7Gv
z=6whEPEVekYW}k@d6C~gr<PS)zL^itT<@RCVpE3Oef8z-vRk{DuS#cKJlvSNQ?Bzn
z*RtxCQ~rnQ#Xqc${NUj6^$#wN0c}DX&{mMg24MrRA>j#+O~NK%Q$ZeEge}09gi9VB
zLI==MkjFM*8?Y_mDUXKG02&2(>=1SUI})Dp=n}esu7W&zgdU(L;W>{!p%3UQ$YVel
z00t7Scnk?cz)(RRyM$f9u7npnMuZVyq#%zy!X98x!ZnXEVGI~6$YY<d57?J*!(&32
z0456ZI3OGV4kWzfaY#4>94g3TN|*ws66QRP2uFY;1$i73jseFKZh4##P5>tg@;D`&
c0!}5o;xQx405b)7oDt3dXMo}RXYyV91&d7xh5!Hn

delta 1329
zcmaLPIZnd>6aZ0MaT3R|6FZxoU815SVGCu9K?n&17%GsQGQa`oxd4T)KnVpxf<tfz
zTCTw&ru@GhJ<aDdpEyaHoad2Ym~Su6yXVBuS6Lco{^3*p;XQ;0Ryvtwc9vcoI|VzN
zCugo<6pZ{dSXupzi^r2BJz8Gh+%7KffADneA6sBc!JLcWqKwx$m%t?jb1s9+GTz{9
zgKY(Ku7E2t-sJ3n9R+i)f~zv#;_QN51#|Ymo{YCS*T6LebFPEyGM;hv!M=hy2jD=)
zJDeNfhJraa!A%*@Ik&(q1#@nL+cJ(hcfcJ5a}L3wjCVOl;7GxoyWp;j6V5$wPr;n~
k;J%FaI1j)B1#=#Phce#hJOYmt%y|qR|6wzGy$iq0Z?SP<$p8QV

diff --git a/tests/data/acpi/pc/DSDT.memhp b/tests/data/acpi/pc/DSDT.memhp
index 63fdfe8c025f8b2f19411792817cd21b506fa984..47d63dec8f997417d7512a694a4825fee874d995 100644
GIT binary patch
delta 1170
zcmY++Jx;=40Eh7s3zSlzE#<RN5>Mc_7+t{PrY2T5lTMz;fz82q1>?kG;uYLHfY&fa
z^M8`}U7!5&Je_`@`FWAwK4gwld4BcZWB+n<Ulz+UTy55$@nd%F7Q6G(TNHO!{+3rR
z@|(bMwj8hg59^m?d;Jqfe{63@%!RpPuEn@jVO6oJ$@aO`U^TIt#kkdBb+Nk14!C(R
zPt3Czw+5^s)-c&2Hy`GU`4;2Wgf+#QCOhI5zyh(rV%%D=mRQSV$K2YmwpiO@+&Zw1
zSjS{@ZXqlb3oXVif<<DH$xgV%uvjd%7`HC0E7mpHf?EPh#1e~f>%n?rJ(DfD^<jOn
zzQwo=U<0v%$<DbAVMDQ@#kh@NBe9Xma&BYTSZr)DZYeAkOHH=oHi1pVCKls1g-yk#
aCcEI4!7{PTV%%o1nb=IM^Y)Q`Rek|G+7B84

delta 1329
zcmaLPyH3IY7(n4R6ey+KN}*g@P$x(4VsxQaV@x#0>Lf`Sy}W~iFW|t&?5Klr_aS@-
z<7;?{XZ-*5<jeWoo9{YFnq15y!!Q?Kop;ZPUnW@^XZ7Rf*@yQS99ik=D6_Nl^3=)M
z**H0O4I^jF7X78=-#C3bOVX3;o7=nT)x!^7TlvQp*ita(JUB1ob<PEFLBX7h;G&E-
zINM-b!JJFrl8iSwJ77n_oXg;{jJG(uU{}GME8vQZw>ekARRwddfon1zajt{w3g+AZ
zH)OoS*#mnD=G+7~WjyBWgM9^aZh>1ejybo%Z3S}<z=4eSId{Mv1#|9#yE0BV_rN^`
mbMAxtGCtrOf<py!j=+(O4>=FO0|j#)f`@<D%--(9FY_B$=3Hz5

diff --git a/tests/data/acpi/pc/DSDT.nohpet b/tests/data/acpi/pc/DSDT.nohpet
index 281b0955ca223a1bd2c24f5e58fb8b73ae37a957..47e4bf62ebe742304783e76984045d7322c3a421 100644
GIT binary patch
delta 1226
zcmZ9^IZne+00v=4aT3R|V`p*p1#tlgYbX;OIzYl8A%WyuZ~&@w6gdG$KvXHX2Q39h
zpa-FUiuc;lr}@}h&-^q?Z`VD?DLlRTUx9zQeay3E9<R2WpWtP3?Pjxi?k%#rE5GRF
zi}WUNoTB69|6%hQ?QZVFXy@Vi4<76bx<FUZwIIh5uq0SA;UUK|uq;@%Ajb-@B3Lou
z5l0W`33?XfSOr!Et0p|==mUL0-+~-#z?xvqgeM#WU?3P+kYfl81w#{_a;yXEf^`dW
zjDV3~WWqVe7#Iu27Ub9fHUt|cJmc5|HU*m&<k$kX1Y0ItaBKtHf^7?OOn`}CV!|cI
z4zMHGu^`7Tuq)U#;W@`1uqW8FAjdwiFW5I>%5eZ32o5aBaR?j=4o$e?I0B9YM;7Eb
e295>CCcNM{0Zs%b7UVbuP6ele@%wl3S@;EQTN7^p

delta 1329
zcmaLPyGp}w7(nra-qJK})3i-`FF3hrz1FcYiU^7rofQ7<=H)G%+#LD@f};-N+=p@U
z2?R$kc*gHr4?oWRXtClZX>zuREX)3Sb>BTVez`PhZ2ZIL`KR{~9c0td*f=IVKXx;Y
znIxy4Wo4}SELd9pjnk)-Bt5#izPX)V-2LFS)qk7?XBEsj2hPcOopT<XS1{)SxFF*V
z&JNg7Fy|t;DC14eF4$Et=MuOi<1Nk}*i$g)GPo?`ZO#>NMZuh_;Hr$roPDsbV9qsg
zO~yN%18|^V&UJ8I#uLsBa6`eIo8YF5W6mKsR50fV9Lac>a|_&3Fy}V7E#ri92i#FG
m=PtM_<2}wja8JRU`{2He_c;&10|j#)f`@<DHgAvNhy4v#7-Ve#

diff --git a/tests/data/acpi/pc/DSDT.numamem b/tests/data/acpi/pc/DSDT.numamem
index 34914bf1ed362ebd07f0dbc22434dfddd26d9a82..1c4e0c80216b53463fbec8fc548007f0326c1829 100644
GIT binary patch
delta 1226
zcmZ9^yH3Jj07vl>3zX8*ax1q2#wS3$;RqHtHL>cVNuR>O)y>I))x}3JPCSO258*>-
z%>NAEx1RiRzGiQ8Kg+Y5bl^CpyAS^{^e?s#MZPNH^>*_TzD};(e1B1R%l!7z-|>oN
zb{#m*j^h>oVe=mCZGOUN_x|}0&S!!y&=qto$gvD83zkiIz_9|X2v#h}u?nmTR!w-w
z(F1ydo&`D9fHlFI36D7XKwr?eAjdkeE?76=F~<NH2nH797y?7V(1a%(8^DHO!-5<m
zU?dosaKSMK#)7d0IW~b!!KMjMIktc;!IlL%wt;QIwh5OUJHU=$$ATQYz^-7|ge#5-
zFcC~F$gv0P3HD5Q#<36V3-&F@aR3|$4osMF90G@eLkn^o0Y`!(6RtU?z*I1`AjdIq
cEI2mdImZcbA~>-i$0=|sI2DXPpOWv=FViF<kpKVy

delta 1329
zcmaLPyH3IY7(n4R6ey*ImRrj`adJcy#gST#G0~{iNs}_7&c1+~lLM=xqYlI;aq|s)
z4KMMG|G%DmInU#dk&~p!#aUz+=I6?}_ni3cI!oisKYCq0dQah@m2ONkJ4-K5oSdD_
zl5^KEa>jBMtgZjX`O9gN9xrZg@8(wzKX^R)#}?R9Fy}ltFXK(l1#m&ZoQvS1jJG)3
zU|YeQOW=}>C!8IyqhQWua9PINoL#W1V9p-clkpDc3b>+R&Q)+###7Ed*jF&;03678
zmvaqVQ!wW`xGv)v=LWc;V9rf&Q^qmp7PzHg&LKFI@gC<094VM{8{C$0!np(PD425>
k+?DY@=N`DHV9tGTU&aTV2jGE%IS;|ZKWt|2lkm&@27uLTz5oCK

diff --git a/tests/data/acpi/pc/DSDT.roothp b/tests/data/acpi/pc/DSDT.roothp
index bba1612c972948911ca5f5b301b10a380b8d83b7..f9a5164e0cba7c209bd3e52020cb855e8688f682 100644
GIT binary patch
delta 1703
zcmZ|JO-{l<7{>8wDNu%%md`?glIT{$hp4zR#iB70F;-WYl%*dFuVC;9+`xDN;|<*C
zar6eZ@;)o`ZYGnN`Mv*n89WVT5C&Jm6++p1laHo6`MQb1ab(XvSI_2Qclr_bN0A=+
z!KEQYO6cQoawg`>Q!VWEBHa(K&&A(uyvF<0x3#&Q94=ljf^d3!cmJ@MFQ@V2ct~=t
zV3e{3%Ie43=>8KkE$q{Hse-6$B30f{MW$flA1D8kDb@_o(O@((8gI}^!=%ZiS+j#q
z1|~x$!y9z6Fj+EL)(p|nVRSM&Z_vrX<jCY$vx|;|kz^!q(8<H($>dqHhmHYbkTH0J
zjtOIuF<G;ZP64JsrobC?EEtQ7#hMX1HjGWi<_$VUm?D`XYYxyU!Ia39c!N$Erc9>H
z8XuhsOodE^H|SJhs${CH8KYB!sgbGi1|0{+A>**-2%S1iolKoK=rmv&WE!jq&~ag0
zGA?h>X~HzgG+8r2rv=j@)8Y*}ZJ0KhHfxU2@nAeM9&ga;z;wuT5~KL<n&YXzKF-7S

delta 1450
zcmZ|HNlpS$5P;#=bOTL8GtXn9iN+luDy|IBI3!N-X<~v&vvgQ^1%pT62F42*U2z<5
z;0>e=|H{;|s=oSPdT(9F)86%3MJeO<!+Ca{lf|8{hkkmnn7_IQTNhut)AwzE;9Vt@
zGL=2l<5M-6jV#@6FZcT9T>V|=KkoWQFizhuJ$-in@c1;H%#M~Ucwg=fB1S+r|IuSh
zcUDCwgbm4dm32(4DcUYw3v0=iZWtRD?Ka&AHX>WPQEXJSJ-Rm5mMz^FHYVB~x(?Qn
zE!{XaF4|qX32Z{PbX}|~+C92SY*My#Q`nSf`*hRTv~1~Suo=<r)6HVDvZb5D=0rQ7
zo5$v5OSgb6h;~S~h%L&NZV6iw?TBs}Tb3=|3brCzk8TxPl`Y*GwkFy!-8!}|Te=Nw
YL$rr<o7kpo>9(+~z#9JNcc~fr1)C(Bwg3PC

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index d03e14b24d0841b4003e7954b70cd7601e571902..f8a0bc150f5a249bd5d09be6949c97160de1ef82 100644
GIT binary patch
delta 1703
zcmZ|KNlpSm7>40)XrL(?Xy$nkH=1a`850u&wi*)=V{44T1eOk`kSlNnFJN4;aN|br
z;4M6X4Se6q{F_SUuX^fD{oGFPl;b+r(=|=gf8W$fU7dd458dw2?te`V>W9tVr@PS_
zn!}EBWoepEGrR8bxi%P|8E(s)cifu`ZGP&l-hT43w7fnWj$SVvxA*Y)^gJ4jd*0>t
z;<C=C^aao-qei3oPxOs>b~aZ&60bgMD4%RlQGOafj9)aH_=YlQ3>ZT;>;z~6FagnQ
zu@j^T!USc*PKYK16B5lfJ0^_@W6Fk|FijXHESep56peyWvSBAe6M>0{W|tj{#)7eA
z!%mbY3KJF09y>9b7)(qy?8Ir}Fmche*|BMC7+W^%Bxn*a3DNAclcY()BxS=+iY5h<
z5>1DlG))>NEgN<+G#QwTXu9lVX|ga`*|3wN$-(4AbHq-bCJ&RB4Lb#z0!%?P4m(Af
zB1};>?38FqFeT9(vs0!i!<1#iPKBldQxVMxJ5`!0OjS1Q)M#ojwVBa7?;opG-yboi
Bw*3GA

delta 1482
zcmaLRNlpSm6oBFCrh%rJ=eZ%ekl+R!F)=Yf<B&MT))<3HvvjxxS77PZ3mDzVRk(~y
z|H@P?>%A}ktKX;Dqvg2H{cKwZ&Hl0)b?ajK?72NJ(Vb3?>nF{dAGh7|Ot0(QMTF3W
z*>eY%VmR&_Zfh}jAFjo6D<<vDjjhFd^m*&JS1+$`@1x=PZ0<TMr%}<Cw(-xN8>?IM
zhNXjb1zv|OAJ`|yJL}(C2G~$w%6_n4j&~^szySrO90UjDc#pCPHWiq12pp2*eaaTt
zQeetqa9EBHC`Z5%1*RMYN9FjCats_(V9IfDT#h@G6X1jbQ%-`Da(qNN1x_h2<uo`g
z$6d-9a7KYCXTe!H?orNxa|%p356;VRpK<|QP+-bMa8ZsO$|Z0~fhm{4WjP*Du7E2F
bOt}iK%JC^>8*D2u<r=uQ#G3d0(X{nHb~%S0

diff --git a/tests/data/acpi/q35/DSDT.multi-bridge b/tests/data/acpi/q35/DSDT.multi-bridge
index ae47b004e39f9f78f3c98093727fb92a0c6c74cb..df91b798f79d4564b049e8a7dbeaa5bb99abe635 100644
GIT binary patch
delta 150
zcmdnue88E@CD<k8fFc6}<Jyf}8VX!~5;5_?PVoY65|eEd?DbtZgAEPhIpQ5%f_NAh
zm>4*mf?a(WqnkWgf(?M;j=`aR3}9Ix31m-RqM*#^IQfKvGgzl3R3{??Gejo?A)OJ5
FF#zFGBxwKu

delta 142
zcmX@$yv3QzCD<ioiy{L9<G+nu8VX!a5;5_?PVoX>;*)I@>^1#3f(;GgIpQ5%f_NAh
zm>4*mf?a(Wqnn&rf(=08!J&Q(VA;tIipq@flg}wQgY{TK^)NCpL-a7<)1x`LSJ4;%
D?2jW;

-- 
MST


