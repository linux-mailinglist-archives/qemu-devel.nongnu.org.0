Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9442B5EFBB3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:12:39 +0200 (CEST)
Received: from localhost ([::1]:52300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odx5S-0005jO-3T
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQp-0003hR-CK
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQl-00036A-RA
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2H9YJuqTTj92hjMhPMv/Yqbt6AHiYRl7GDRFXnI5NXg=;
 b=Y8btQHqaKgb/B9QXWNrXYf7+PJR1c8q35qCmYzMhNqKhuSRVfi6lhS9Ef7KHEus17/GRt+
 jbmpUlnNc7HZo1ztvU6HLWCwWLsgxQuuLNyeUp/6oG4ySZDCAnOl8Q6L03ZroUD6fUyWo5
 aQFh6/NwCxIKEkSI6796H0X8qGbzMd4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-320-u85y4Ik_NpCRYcl2RkAcVA-1; Thu, 29 Sep 2022 12:30:33 -0400
X-MC-Unique: u85y4Ik_NpCRYcl2RkAcVA-1
Received: by mail-ej1-f70.google.com with SMTP id
 7-20020a170906328700b007838b96bf70so952463ejw.7
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2H9YJuqTTj92hjMhPMv/Yqbt6AHiYRl7GDRFXnI5NXg=;
 b=ZM+2dArZIVsAdEHjK/p2Cnw3oWCqBMJr/ojUMUbqMvw0BqATR1QvggnEILWk4o3xFm
 6dbAcLm4TYemvc79fdgz8row5c6RO5mLWz1oBMGeRNnSVHpdy+oi2ew+wVd3u7sR5V4T
 ArhG5P0siDck70wzrNarHahytQ16azmJWeA/l/3at5Qa0zVaBudysu03oCCp0OFUNYmh
 Tt0j/+0hXItNg3QmREj2o2wPCaErpa06H1zWIV8EEA6TOBGhVIpp4cq4/le1HoejYtHp
 VELOduJGyH87SShLdxyYNCUDGLK+K9iPiwuDAwXiWYj5JqxRzSuZH/B4yJEzjRKR9fpG
 1J3A==
X-Gm-Message-State: ACrzQf1vdqdrNIIspvh0zD7J6FfI7k4n7leH+Y4Z0MUpJiD2AIswdb4K
 JvGZalKtm88WcbesJCxgJQqrmKNzR7Blykr04SQOsbfBEXz8mWUYKr7PXqlno1WlgBN0WcbUO7p
 aJJrbRCidwtBHGlj0Ylpgd7ZOcdWmOWCozF5tgdM1V4sv5Xdwt9dgP+axH9zCVGWi174=
X-Received: by 2002:a17:907:a04f:b0:772:da0b:e2f1 with SMTP id
 gz15-20020a170907a04f00b00772da0be2f1mr3364197ejc.327.1664469032004; 
 Thu, 29 Sep 2022 09:30:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ULVPvWaOApiEjNM5n7BCf5FZTtYzAEwiB4oh8oyvAYvf22j8DXQPRqOssPigRyc4dJ1xd2w==
X-Received: by 2002:a17:907:a04f:b0:772:da0b:e2f1 with SMTP id
 gz15-20020a170907a04f00b00772da0be2f1mr3364154ejc.327.1664469031393; 
 Thu, 29 Sep 2022 09:30:31 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a170906539700b00738795e7d9bsm4130416ejo.2.2022.09.29.09.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PULL 05/14] qboot: rebuild based on latest commit
Date: Thu, 29 Sep 2022 18:30:05 +0200
Message-Id: <20220929163014.16950-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929163014.16950-1-pbonzini@redhat.com>
References: <20220929163014.16950-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

df22fbb751 ("qboot: update to latest submodule") updated the qboot
submodule from a5300c49 to 8ca302e8. However, qboot isn't built during
the QEMU's build process but rather is included in binary form. So
rebuild it here.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
[Rebuilt it myself for paranoia. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/qboot.rom | Bin 65536 -> 65536 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100644 => 100755 pc-bios/qboot.rom

diff --git a/pc-bios/qboot.rom b/pc-bios/qboot.rom
old mode 100644
new mode 100755
index 7634106a0766913077e88dfcb1021c1168dcad3c..684000f57aad8925c81890d97345500eb266827e
GIT binary patch
delta 8383
zcmchceOy#!+Q-isW=2qS&=7$cWJEAgG+$6bPzL0vp(v<hY1-<plD(Oxl=?`FJD46P
z47;o~vlhg9T2s?>bHG*y1+hfKa+3^oq-pmUvx+$>)!2D{_Zb+_t$!arAJ6x9uIqlk
zulwbU7K_?qQJc-;cUD)6)g2;T4db|tnX$U>BRCxw$Vu_x9JkXrSI1e_#_G708fjGm
z$4OHScpU7C$LHhlsAjK6jCeeijK{Q|c)X$CVm_sE%sCj%=c=@MqTm(lX-&X$bm@U$
zwOF4gQm#72@RTgey2ECVO=z_`Ro%V89H%?%kdk07p>gWbd^qVs!}v2~Q;+O+=2uy^
zvn0}sq|=NDEy4SJ8N-+(Hp}PGeeCd;Xum7VpPpd-bcc(AN9sk3HRt$P8l!bY-So<G
z^D{QVW1Aevo;e2gG^trjUZv13i>a{71YV{SUDEg%3J4s^n`lH}A|FCe1jcmF57cq2
z;GaDu&3EbbKyycD<0&d=xoTH$DhUcxSM=sMx?v0-62m&Dv}Gnn+}=}z4&6qJ(Ogkz
zMTe@Kf#M0D{W9GMir}l+^O4=YG(io%RJQrvwhpzGv8lZbuP^T!-#bbR6532pw3|Zw
zrdhPQ>yD|_b99_Nf<sG0B$3MS5QP?-&{BR19<a)(m1e_QUgv)okC(9*=>pGjwSotk
zx#lr2(ZX((Dj+I2T6Jm;jSr49D4EROswOR8Z{ymUtwv0+<b}ZlBYg=xz68q1+p^s@
zbBpu=RR#a4Pb>f8trFjuS>1swmdveX)pKZE_lP0SVK|$6*~}O@uXwIf8O|ZUv=6b>
zZ4?E!XqLom7t3Mo9y_})%MoQ0+-!nxBdN{ovI$aq=5s%{XU6=*+5_3B)FYK-Mx0<&
ztOYGxzDC-KWcDu1d5}4i=x%po|6(S4-IMMQEFG2#CoN;nAIa1s4q=_wL*NZm-y@V9
zJ#>odkEf@{uqXpon~k%XJ;}#)f1ZoB+Cy0G=TMI1p>$nXR?<(hjEF<?Ld%rYA!0r6
z;OncL0lrz2cqB%@F@oqOI)(x`X%n)wP1LowVX#FRs7yB!)t2c7(p_D!q6W~gkl@05
z8j*`epd6)?@<23C>>Z4!uWqh91iGX>9MPy*wHhY^V^z)4k+m8Z6as{+)ksk6uU6ys
zt59TRfA&y3q@P;R#h1`Zu~5K_xTFdgM4=v1JZ=-}#dG3uJC+eA5r!BBUyE8%oY>oo
zr@b3<9%RL^F=8VixYs*YF7!>ncIJpy91Uz-P-cTtW-pd4O)0ZMDYH-%_K4>F?VT2d
zL!#MUEbQ@B*rHVE!PD0l)<3BkJB%+_5?M9ArhBXf9u_RxJMGihhdFoPftj+a_U|2h
zgpCy@N<1fDl`h{_X4YEhPVx=OHDr{QD#=~G-d$jpd5XpDtFMMxvJ{KQ-bWb$W=Vnt
zQN-7af@H_G&Ph9%xu24-4gtU3p)0C_-Htt;lM3Oq33Zj6k-hwY04f&hq##7NwS_No
ztc-@UExI<Lh;fC&)QRX>ceY>r36X6R8ppA`FZ6*L!W0|dI*n3ZIf}F6Sm2}xRt?+m
z&nqLZ*iONF?;H<eNk3A|Z2rRjd$wM0Yv8_vnGbAN53R=_DjTSTj+u6{*U~myvLNMm
zvzfivS*0MhoJ!_WaQO8Awq0*d9ZRDl)+gIIQHeN>N`;E8NHuQqqUUGk>(MNYmf3P(
z!ztF3x2~W`=3j_v?y{e|=H=<fh|N)-Dchyg+@)5KkZep@IKp~ziXg2BDhsF5NaGZC
zbTtn`VOEE+GOZlty$K6igm%T(V;{m6RGbwf9v4qZh48f1(v4Lgg6dCl`<aPTy^u^j
z^^pc8+Yk<(w!E8Sp_S}|DO;Z!5uy~|XfqjE$(s!A-d5VFpF%(C`_W*7A@G2n<H9+q
zj;0&JRdsrL(l96t!{R?CaSm20n@>2sZ?N$eN{s5qFQeH}edjOhf~|iRdMgWFYk~L0
zm%gtofyuX5rNUfU&t8?)Is~u2-TRT*GuOFa!Q|RY(~!U6I$H-$Yk^ZnC>>YY?3A=O
z=v>q=Wef6cG3Ev_L{Y^#>LYuQ(T+2d6EBFD#j0EHwt2#jIDW^IaOC{&cuYs6`#rUS
zOO3)yja@N^2>TJX?grY_*HGxaKV@@(oZVnEH)0z_Qd_o5JXPgX@yes2_))b@a3aJn
zO6ln2wGUAyN@5AkE)hGmifz|OZOaM7RU@b#i*fyi-%k|M&1MQNXK}^aGb=jA@SA0Y
zAeC*DfnJLq)W3ZTcd>IM4O5^DRF$O8D|cXdl&q_Mg|0;Ro?nEHA)fAB#7=<~+j^&=
zUwt_<ma#|2rHP%QWfquNDv7Tz&Orc6N@`~HxdgARH+#c^<?G8WX_RZ+(0(CmGR9?{
z_J@N1?o$ervUJ-nDJ8!5&i9src2mc_<tfVTSKHI1gp5>dK3>6QO`1>fF$*$2$5xD$
zQ*5sFS>3+(lO`=D1xqlnf*tCWAtr=iz0YTLgjC>W$yFMd@d%xcna2;Of&E|O-=QP@
z4cY`|{u^EDKZehw-m!(alf52WhU?&%xJ$}TQWqFS{R6Vw`}+TL(+&Ntn=UOLxQQP~
zEdv{R4nVx<4&(g9bm7)iI*7iGujU`4cLq%`om2K~b_c5P1fb)}3H(WiaTyPzax(mH
zhjArKiQ7IWy+-{84~p8`;o>ZCWiZz^7@Hq29Y{+C4_zG3n(#52z-q!xM7d;^`m*h0
z&awnNOy%s^%=<5S;U_iBDc5S4gZ<ebkH-{zi$l7Uc{U1nN(U;uQI<fz3?3d9i#O9w
z_AF(Ooy?0yWF(9o#KwWI&nst?QV>jeWlY-4Qq}hX)~4wAHeYEhy_b*@k$Ouxo@)iS
z3731^ew8q)9BHDT6aF@G5G$;?&$@z^mo1L?{GgK>X5pGO(jzz*B^5$aQlk#vj_3O<
zhzuG=nxUWauhHj2XY%8z|3gozHm1?$hYGq0mv9`$AIF{`QP{A@n0dvp<=up)4)cv+
z%lXx`aQJwHWa;n`iTQ}Qp1PyvTgA8|C1FIaxiMKdY>RVv(OkC)gLBJLa4Rmq7ZOy)
zu{r5Q>Jdi%CdG}I%)duVM`ZD@P{oM2Zh6RUtqwusuh6v-$*S<XR5>DgsIuw*;P>U@
zux(z0BA4Z-qe$Gr<$P?}jg?7kS&XLTBjfm8^p}wXqOTz(D=)acd6Sew9BnGX26vnq
zM~3IIduy=}$}SW0TWr}OHgm8|2(-F`XG(ckjmVBKH1-MB_Jy;~E#VeYECjP0*)2A6
zVDWk*h8j6?5mEJUN<;h^eLktn!ABEC{-J*OD%j);z*a^FM%wJVmG#ESC9@AM7j`ny
z>{{>0|AKmr9-vMZyw4v@9sL8(yXm2%EdD!Mlk_nE7F8$BFiu9~nwm9s7LmS_i+?HB
zmhD8N&|+yHB_${ElWBSK4}DSu&x!}I^fsAzWdV5kdYGQ4HDmi1rm%54%5I`3?CDH@
z1kInY3rxSqbc5Alz<uMoJ%^b*=U7Ba)&fb^6>V20Tax;JfiY-})~y#|ut&3Lj>9nE
zCSxsdak`>>mQMM!sZgBbksiIxvzg+;*j2{<BrAG*=b|Sfi|+9JCNx{Bq4bn6{scXm
z62pH*|C2I1gte}MHMde}{|vgCG9fZWxV{3{D-<hS&l58+3@+cDVFHa$9e_`Y#i<Xr
z-L*2KOjs#xCraCA9Oeh#Zer+q(_Ffd8aes!=gQi{qLW$_>BjdKyB#dRlEOtn_abgt
zP8Oe*f<{$7g2#!yMf#?RW%D%mXnTK$a>waMeTx#5WJ57IzD@tntk21a9!z&QtK}h-
z>$}!-Xq?zvO=aVZDe_sRJT|Adu%HonZJ&MbD<{r*>2gPcFO&pmr<+~%H;{MS6LaTx
zxO4BxuT}DUB#V-OeV-%?P8KKb6ru5XT=?9Bg~k*iaD_(th8<1p3$C#^ScMfLvfJSa
zvX39q%f@<f?hI=fy6=>_o~1kE(?Wj1u-LL2ZRYdLs69&))28r$rPtD8`B8K@EuKG0
zSJMWY#-a_rMgIhrxQwr>hAL;5Dya*mkzE#IVHCa10VSfhc(LcP$Nw<@1PX5dE17$6
zhG{IXdg~Z%PVcLF`xxy5=op;^-Z)0rfgQ)FM@C=OhsS7WMojuPhb&KK*)w_su2)Uy
zu2H4e1gq5?J4o2ap#%O=o&8G{x8gU#|4-VI5zYUT4rD~Dv{lq&TBODT^RILh=AWqN
zglOz+!}0tc7QKdDi@&4gcyFXF6Z%k2t~$>Io2p8dXR>P2Su--wjOqSnEP#I${4?(H
zPxJdN@IL`Re(vhXzq+HDrSKP3(b;KXtU9d&ue&>5op`OUqNB4SGdP@}H7KYnO#X%h
zXjQBzcG?=@KUyuz?1tj^L&oA?Dtx=E>7&dT?IOsEYBm(wBFF>PG!$|d<eqBUhgJ*|
z)Y@vimRHl+oS3cyk-Y`4yQ=A>tN~gBZcBT8*;66kRb<vY$hT2<6cYREp5yDJ5vH~9
zZ-@Wc&i+hmfNF8giT3#{MVfD`>8b3<0S?GMHL}cZ7XIRLI>yWif43TpN?2DTOTsSo
zHT1&7zS>yGt~IoMVx%?`GO&g!As0bzs-cS$BQ-^k=jf-2dd)7VA1PvzUQ-R_rQ}I^
ztqY1fNpmMf4p3`3F65*vFJ=|^=Y65l2o`>^@S9K4_DQG-a@9$yoD><e2=WkeZAO&&
zbD^U~yjtKJaEfkE>YK3(GU8KNo^W3>R<Hv;(`T}r*x45_jAu17zZ3phr<DohaDYuc
zO-nI>Mo8f_CNNTKf=oT#9#In);PsEVJ^yZi!oL;%-wIGR`K9n5IL#(sQwLc|=@08Q
zZm3_GiVH@(Wz^y07)kv-Rvq$>Qv&=KsSJ6hLV2hP>KUlbbQS6qs1w9z={0+xHc~&R
zI;d|bJxkxu4RsUS9neuW<Usrj4C1&;RFL(cHWBJyXK6FKJ`3`@vuye`D<Qw7Ygu~j
zR-Y06`G+7~C{Va(4W;|n(0TZSaI7VEt`O75)>jLB^WnR{F>FqP@iX1Sv~G%ClK_=Y
zWl&S0#!%H1ec>}uamYFSzEV|_I-<V>X>yQeL+3Oqt1^rUu<eKcF#PO$+&|0@ZwPo<
zZPf$>t4^e!Ot1CrjqJmm<D5uuIV8)Ea2$TYX^&qxSaZE_ZlL8;^%?_y_u5KZpi-gi
zbYSX(+9gmGUn;A8E9CJnl~_9jS@|W~EHvjK|4t8Q>op#zkLXFLP<#XZi^OcbHW5m7
zo_1%)q|bxwa$c4*v0nXc2r#KxuUI43!aum-w}*5ae0`|<G`+?SrK2I!^n3#aO^epH
z;$79CM16R7j{D_;(x@cJ+q4(yABFl4otdWW-*Kz(_5kYmz5RO|{1d6?bkqa2iiSfq
zK)p`6P_0l$XgO4P501M^Tc$s#$%Ja6e?TpRYNl(`qcvNhim7{!UULYlD-D4<4`ron
zC=b+A^lVPFCLH(u8?+@y-!BO&?$UqvoyGPn_<GWroCmcQs9u*?Up1wW-6$eguXR9;
zzSO?JHBP+FqdB=azi_*`NUNcYQ2XgkC==9^RFSJMTmbdK6<J=@IfMdMD#33=trqwL
za2py1?Vl|K{}Nx6Dv`4bX>>@F-Z@Qy5~Yg28vbGM$9MKGR{S)5hDPIpKbhvt&}-HB
z0q?OUW!1()&TXQfv1&6RU!sZ`dd(szqOWJ@<BFipqRhFS%T&!)3T4r}3;sZgn2C)X
z>W`ER<$@Av4wM={(T33KnR;z3)IgX2P|Lw<yi3{F)<TY;n=|!sJD>)+WO>s)oA1m1
z&G!@dx6<%gdQBr#3gzMl7488<Dt^AZe`8=XX@D<4QYx7Y8BG6}rPnTj;w8E~D^jx&
z@-E#)dGAA&P?R~kunsEp8h%CX++TKBuJ=tu0_-hFQ-Cx}I=6FT+jj66f6sQn>jP4p
z&9b~5`6hoL%MSch{8!KmTNP+<%kl*<75w=Fxlo=5Vca9jYr&b|4sgL<WCY&_o!}*q
z`;RQ&1&!deefYcq^S}k*I?w{X36_E%fe!Et=mcFLcU_hTeTe*E0cZk0|F94RKm_kc
z0pJX<6x;?nz`dXoJb4fW+>qt7paIliv&#gdz(rsZSOiW7cY$lcdhh_~1wRE1EwX$S
zOa*@h=YdZb{v8!V90N<iFF^+=fle^&V_8<;#2Ep`f?t7|;JCx67+ePyf$xL6z&fxR
z^nxyMp&j{ufDeoXxeDY5H&>$LVBxz*PymGV2^s(zj-mlzBIpFOK@LAOECP+-ZqNjJ
z!3ALQF?0Z23hn{F0PDcfxGcND>tL`)mIvZ8nE*C{Q^7IEW%(Ho=HGBamS2J4Rd5ej
z1J;3OKnYagCKvjnEcXKw!8C9dxDZ?kTEMMf4K6~5z)`grdT<=*2F+kFg79fD0bC7E
z1y6y?Ze#wZpTdtIECH@Tjo>!W3pRp=JF*;f8lMH=cyJ{+8{7&m2M>Xp!Si4f=mGoI
zp~0=PJOxYzU#-VngMR^6fggg~z|TN?Aw&~I1NaNr3WlAN<#2pl4*}W#53K+n1y6#j
z!0<0n0B8p7;9Fn=col2~dwhwx#_t&uz#K5>JQ@zZ2W|z^zCy#ni5D>c=OJ!Dw1Pqd
z3jYOj4km(Yzy%<I7Vt92eiMuR8ZiPM2c4k(B4PxeXj{HPjDWX56ZrIH<OkmZi@-*3
z7pS>{AO$B~kqc!PL>>%kd`9jDW5Fw6COFoKzyr5}MPQGsC;&8r)u0!2fr;3#)xRPp
zz+vDU;5=|2xE4%uVP64d@Ds*=q2XYce?NjkAX5L02!%ZtoD4n-E&+{_EN=u)fqOtR
qc0tUN%&r*hPQh;Qlct&Rb;vuIjct%BrVlQkt9zF$b3Y-AZ23Rp`4sX1

delta 9151
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
SEQnQ-4%R&t{Vp*}=KleWh?AlK

-- 
2.37.3


