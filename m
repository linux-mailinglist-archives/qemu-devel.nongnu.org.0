Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499E467399
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 09:59:50 +0100 (CET)
Received: from localhost ([::1]:48758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4Q1-0002fA-JP
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 03:59:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mt4MT-00070K-FQ
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 03:56:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mt4MQ-0006dT-HQ
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 03:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638521765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcJLcEwRUPrsUDLf36kPZOZ2O0h3FAkoP/H/79RAjUQ=;
 b=cVVS3YDT+luKJh8GyEgk4KYeIH4c2FaBeIojvnt0zF4bjQydZK/TrSPAAXHz3b6YrJzSY/
 k/ZG0ydlJd8EUiWr6XJx4gqDA5Sz/PUq2338xuiSAFXmfawit0SAJt35C2CQrr6k2i4QEz
 6AW0xETRw2vww3EDLDxCgnMvuSuBMHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-0TVnkShBMHe0flgA-pvD4Q-1; Fri, 03 Dec 2021 03:56:04 -0500
X-MC-Unique: 0TVnkShBMHe0flgA-pvD4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B37B35F9CE
 for <qemu-devel@nongnu.org>; Fri,  3 Dec 2021 08:56:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.170])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1DE560622;
 Fri,  3 Dec 2021 08:55:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 017701800397; Fri,  3 Dec 2021 09:55:53 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] seabios: update binaries to 1.15.0
Date: Fri,  3 Dec 2021 09:55:52 +0100
Message-Id: <20211203085552.347186-3-kraxel@redhat.com>
In-Reply-To: <20211203085552.347186-1-kraxel@redhat.com>
References: <20211203085552.347186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes
 pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes
 pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes
 pc-bios/vgabios-ati.bin           | Bin 39424 -> 39424 bytes
 pc-bios/vgabios-bochs-display.bin | Bin 28672 -> 28672 bytes
 pc-bios/vgabios-cirrus.bin        | Bin 39424 -> 39424 bytes
 pc-bios/vgabios-qxl.bin           | Bin 39424 -> 39424 bytes
 pc-bios/vgabios-ramfb.bin         | Bin 28672 -> 28672 bytes
 pc-bios/vgabios-stdvga.bin        | Bin 39424 -> 39424 bytes
 pc-bios/vgabios-virtio.bin        | Bin 39424 -> 39424 bytes
 pc-bios/vgabios-vmware.bin        | Bin 39424 -> 39424 bytes
 pc-bios/vgabios.bin               | Bin 38912 -> 38912 bytes
 12 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/pc-bios/bios-256k.bin b/pc-bios/bios-256k.bin
index dea01da468932e67251e9ca3d443ec91d870a2ec..26f863b60926cb5dc768cff39fe944c9d297de80 100644
GIT binary patch
delta 135
zcmZo@5NH6R7RDB)EzBu_InG7-#l;GShI&SNhPsBD3Q3uHr6rj;#a0SssYS(^`FRRP
zddB9u#(HVV#-<Eu6Odt1YL2d<o}sCpfv$mWx=~7sNs?ufahipRfo?%jYEo%tPKjP&
aYHq1seo;D5>xAioGno9g%LOq%S_=TJy)8xn

delta 105
zcmZo@5NH6R7RDB)EzBu_)3XAZ<+)7tjC9TP(vpo$rauf}7S=6F&CxZ~Gc?gN&^0pG
zO*b=1Gd537HZ?X#Gt@08N=+)w%qh_;OwBFT%P&fw{?Lt4e4>ELbe|w*k!hjKEZY@=
Im>;YK0D%@DXaE2J

diff --git a/pc-bios/bios-microvm.bin b/pc-bios/bios-microvm.bin
index ca6375d65c9d0b77dda0da82f6a0575d7c800f00..ddeb24391d158c7b4625674ba23151e70032339b 100644
GIT binary patch
delta 125
zcmZo@;AjA%EsQM-Gn|X^i;EQu4fTxl40R1P6_PUZN=q_ximepNQj3Z+^Yavp^o-4Q
zjrG!!jZGQSCLqJ2)Er$yJwsDH16>2%bfc6MlO)R|<1`Bs1Kon6)TGkPoD#jl)Z9|N
R{G#;f2bMF6EL+4F2LMWlDu4h0

delta 99
zcmZo@;AjA%EsQM-r*|!6l=m^!GtxEFOG`F3VMv>R4vSKAbPe?kP4o<Ojm&k^%}mma
n&6AT&jSbQabqk78lS(slO7sd-b4&H|i_#g=w!dG<C>RF-$J-)}

diff --git a/pc-bios/bios.bin b/pc-bios/bios.bin
index e9fa99f006b74fa2c835dacf5ba8fb3c6825f426..6e6cde8c7fa722f28651e884a4c80573563baacb 100644
GIT binary patch
delta 125
zcmZo@;AjA%EsQMj+0I4z#l;GShI&SNhPsBD3Q3uHr6rj;#a0SssYS(^`FRRPddB9u
z#(HVV#-<Eu6Odt1YL2d<o}sCpfv$mWx=~7sNs?ufahipRfo?%jYEo%tPKjP&YHq1s
Peo;D5>-PM3#)%66@7F1`

delta 86
zcmZo@;AjA%EsQMj)4Adq<+)7tjC9TP(vpo$rYj~f3hNi8=I9#g8Jg%B=o*>prkk0h
o8Jj03n;ILW8R`}kr6!eT=9K6arskIF<rk$hq;1cSXPmeI0RPn)egFUf

diff --git a/pc-bios/vgabios-ati.bin b/pc-bios/vgabios-ati.bin
index 0de9c0d3c1ae44c061b3b6569a3c46e9f7d0f3de..fe497ea4f2938890dd24ae345b94472f1ba8150b 100644
GIT binary patch
delta 130
zcmZqJ!ql*Zi9K|c@5>LNy&KtMXXZE;<rfz#7#ivs=^5%8YAPgU=9QLY<`i2gl%*CG
zXXfWA80i_C>l*8&B^#SEq)kAEMX5QuhI)pkdIq`%y6HwKDJDslNycdwCI-3%MX5=p
XnK>nTg{irvdih1^3=B*x69WwZz>+JV

delta 103
zcmZqJ!ql*Zi9K|c@5>LNDI3{iXHL$VDer5lXQXSUmzHd7!jLur9TuhL=o;!7n&=tm
t8ky^+o0+5;n<pom8XKe;>J}8GCY5I9l;{<v=9cQ^7o{^Wu}lm!007A(Bk=$L

diff --git a/pc-bios/vgabios-bochs-display.bin b/pc-bios/vgabios-bochs-display.bin
index 76e076f0293629875daebf7a68d155ca5e325bb9..7ca04402e97fc844b7628175839c712acc2634ad 100644
GIT binary patch
delta 134
zcmZp8z}WDBkv(*k#Y-=n$c^l_c{$ES`NhQwhK71ZdWO1&nhHsod8H+pImK2AWvNBQ
znfZANMta8Py2g5G$;PG(X%moPQEHB^p`M|so`J4`Zn{xQib;}Xl5v`aiGglGQEF0Y
bW=@G-VQOxvUVc$J0|OJw=8bv&jEoEb01Yd&

delta 107
zcmZp8z}WDBkv(*k#Y-<6gN^LAd6T{J<b6%`jC9TP(vpo$7}6%7!=lt2T|+%X6Fmc6
wBXiw!Gm|u9^W<bxV}mq9-GZXjq|(fs61~FI+)};#qI3o(mdzXU{23V;0P5x=x&QzG

diff --git a/pc-bios/vgabios-cirrus.bin b/pc-bios/vgabios-cirrus.bin
index 0f16ad199db5f5e9041fc3e63e19a5ae8683cde2..020dfe6c56e75e28d4c754420ea706c3d4910a8a 100644
GIT binary patch
delta 132
zcmZqJ!ql*Zi9K|c@5_)t&W-GUr{_2q<rfz#7#ivs=^5%8YAPgU=9QLY<`i2gl%*CG
zXXfWA80i_C>l*8&B^#SEq)kAEMX5QuhI)pkdIq`%y6HwKDJDslNycdwCI-3%MX5=p
anK>nTg{irvdih1^3=B*xn-9iKU<3f#i7aaX

delta 105
zcmZqJ!ql*Zi9K|c@5_+D2OHV{PM^#*L*Ca^&q&uyFD=>FgduGLIxI@f(KXaFG|@BA
vH8R&tH#12yHcw7AH8w~y)Ga7VO)AaIDbXuT%`Mf-FG^=%V%dB!ZUQ3!9a$w?

diff --git a/pc-bios/vgabios-qxl.bin b/pc-bios/vgabios-qxl.bin
index 420f9ed3319025db97dd895ae574c0ee8aa41433..0cc20678a3faf187c6f5e3a83560e9f1a64dc986 100644
GIT binary patch
delta 131
zcmZqJ!ql*Zi9K|c@5{HLw>Glxosr{QlwVw|U}&gkq-UsWsHu>YnO9npnNw_~P?lO$
zoSC1eV5Dbku4}B9mTYXwkTwAs7NzFs8tNIE>KW)7=%yQ`q?jaGCK;z$m>B356s0DW
ZX6BUW6{hBv>g5-uGcYi*Om2+700276EqVX|

delta 104
zcmZqJ!ql*Zi9K|c@5{HL8#l7=oiX{;40&HuJtJK+y|iRw6Na=2=&&d?N7qo#&_vHb
u*T`Hq-OMD-*gQGe)Yu@+P`98cHK{Z+r$nzXHMdkRzbKu7iDhzQ`~?6>XC^8D

diff --git a/pc-bios/vgabios-ramfb.bin b/pc-bios/vgabios-ramfb.bin
index b9b2e230a5d568112dab419a67cfb8e32d9742d5..a7c5ae7c8f5e99a172c4639d4ec37df7d884e856 100644
GIT binary patch
delta 135
zcmZp8z}WDBkv(*k#mmDsijx_g#W%_w%gb>t$}cWfFf`ON(lgXG)Ko~y%quO)%qg}~
zC`&CW&dkqKFw!$N*EQBlOExxTNSlBRi&ArR4fPC7^$c_kbkmJeQcRL8lZ?|WObm1j
dic*tGGjmGx3R81S_413-85o#YCO5io003&PEo%S(

delta 108
zcmZp8z}WDBkv(*k#mmDsKPEFei*J-WmN)rTp1iNAo{_GZURtuT2}9ZhbXb&{qid*V
yXrgDJYh<pQZf25ZY@VEKYHW~Zs9R8!npB#ZQ=(Uxnp>)uUzE<k#4@?jeFFf{D<=^E

diff --git a/pc-bios/vgabios-stdvga.bin b/pc-bios/vgabios-stdvga.bin
index b59256572d3df9c467f45c1ee338846e15ae4bcc..abeea373d36ca0e02560140c7f4ac0f873b25fdd 100644
GIT binary patch
delta 131
zcmZqJ!ql*Zi9K|c@5{HLM>ewWosr{QlwVw|U}&gkq-UsWsHu>YnO9npnNw_~P?lO$
zoSC1eV5Dbku4}B9mTYXwkTwAs7NzFs8tNIE>KW)7=%yQ`q?jaGCK;z$m>B356s0DW
ZX6BUW6{hBv>g5-uGcYi*Om2+7001zjEo1-y

delta 104
zcmZqJ!ql*Zi9K|c@5{HLvp2HuoiX{;40&HuJtJK+y|iRw6Na=2=&&d?N7qo#&_vHb
u*T`Hq-OMD-*gQGe)Yu@+P`98cHK{Z+r$nzXHMdkRzbKu7iDhzQ`~?6(l_nGb

diff --git a/pc-bios/vgabios-virtio.bin b/pc-bios/vgabios-virtio.bin
index c00414ab835a0a1b1a9dec207626a352eee48e91..806647a009fb64645adc7054f21cbd200d4d6f1a 100644
GIT binary patch
delta 131
zcmZqJ!ql*Zi9K|c@5{HL`!=%gosr{QlwVw|U}&gkq-UsWsHu>YnO9npnNw_~P?lO$
zoSC1eV5Dbku4}B9mTYXwkTwAs7NzFs8tNIE>KW)7=%yQ`q?jaGCK;z$m>B356s0DW
ZX6BUW6{hBv>g5-uGcYi*Om2+7001rHEnWZs

delta 104
zcmZqJ!ql*Zi9K|c@5{HLQ#Z2joiX{;40&HuJtJK+y|iRw6Na=2=&&d?N7qo#&_vHb
u*T`Hq-OMD-*gQGe)Yu@+P`98cHK{Z+r$nzXHMdkRzbKu7iDhzQ`~?6%b0!V|

diff --git a/pc-bios/vgabios-vmware.bin b/pc-bios/vgabios-vmware.bin
index 5454aceda8b8ddae807bb7ac245a4c7eec924206..39e3093667d608a34891ded7745af9ab266c38d1 100644
GIT binary patch
delta 131
zcmZqJ!ql*Zi9K|c@5{HLi5uDX&d6~t$}cWfFf`ON(lgXG)Ko~y%quO)%qg}~C`&CW
z&dkqKFw!$N*EQBlOExxTNSlBRi&ArR4fPC7^$c_kbkmJeQcRL8lZ?|WObm1jic*tG
ZGjmGx3R81S_413-85o#YCO5`k00098Edc-k

delta 104
zcmZqJ!ql*Zi9K|c@5{HL78}|3&X{~^hP<z-o{_GZURtuT2}9ZhbXb&{qid*VXrgDJ
uYh<pQZf25ZY@VEKYHW~Zs9R8!npB#ZQ=(Uxnp>)uUzE<k#4@=t{sI6VWF@fx

diff --git a/pc-bios/vgabios.bin b/pc-bios/vgabios.bin
index ae82887d73b0c5615ee70deba93bd5ff68f122c4..c3a66af50e40448ec2100b2306bf9eaaf03ee8c1 100644
GIT binary patch
delta 135
zcmZqJz|^pTi9K|c&&#Zk*OL#%if@!VHZ8}wD8IN^!O&38NY7B$P*Wi(Gq1EHGpE=}
zp)9qiI5R&_!AQ^8T-R7HE!o(VA#DOOEK1GMHPkaS)icmF&`mc=Nij*XOfpWhFfq_A
cC`wH#&CDs$D@@HT)ypqRXJBAr0b05N0R3Mt0ssI2

delta 108
zcmZqJz|^pTi9K|c&&#ZkLz552if@!VHf{2&Y4X0NdPcftdTGhVCJbp4&|y((j;^7e
xp^2V>u93NJx|vCuv3YW`sj)$tp>9D@YEo%tPKjP&YHq1seo;CD6ARGf4FK;UC(r-@

-- 
2.33.1


