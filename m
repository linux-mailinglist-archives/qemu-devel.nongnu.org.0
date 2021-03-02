Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE903295B7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 04:13:16 +0100 (CET)
Received: from localhost ([::1]:51724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGvTH-0004AU-8R
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 22:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gcf1129@gmail.com>) id 1lGvRJ-0003A5-Sq
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 22:11:13 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:54959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gcf1129@gmail.com>) id 1lGvQe-0002Pt-V2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 22:11:13 -0500
Received: by mail-pj1-x1036.google.com with SMTP id i14so949725pjz.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 19:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IOSuV67hNxL+aja19JFx5SrOq2Hwy+vHkDwRdfk0kmk=;
 b=EU4wj+DHmEFztNsNv0FkycmG3X41Yp4FxX01okJBRGWOh4gALI2DjQpOKxFkOvtDK3
 KoNPgFPx9JDoliDEipFQj5yKp3f6CwUrfRsKqywY+Erc7Ww97CH17x3tQHDIBOAgFaEA
 7tJ+Uk8wWnG/BekrM0yf8DGywWAXS9PVRGYLmZyismXvwl67nVDEZdoIs79LiQNkh1SP
 i6Jg7HcIuP856BV8em/ye98YxB7vzK62WT8fRrxHge8ftAMN/HX+whKaoBq6Xj6k1cup
 m4woY3fv6D7hNngpcqjmt2SUBsND33mfBLCQ4UVdgqjuCxn9sdnyZU081yKIaCykh4a6
 17RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IOSuV67hNxL+aja19JFx5SrOq2Hwy+vHkDwRdfk0kmk=;
 b=eaISwLBAQIBAoZRo9Tz1t+tWMo+0SLflEpayYLI51gBMZnNM6DsmT/0XgosrPFz7Ty
 EJUVVuq/4DcUAmP1vd6KaU+69YjYcKRtpZ0fDzFOpSNcAfpJGGocBT+K9WM++gEyDosC
 IMoiqBJWnFqDih32iqmSZFSa4GW3/T6EzjP+rEDyb7QheuXmlJGgaHkIE+M0ikawx+XA
 WYCTG6TL7PaELG6Pm587WuejsruWUGIBBoNKUAwXHUUHkx3cYgZy/q4BeFFfqmTSyG5+
 cMpIEbp+B885XxsjgREhNjj+2WAatDQ7qPIK7zA6vimCMUtfAYaEv3cOHBs7hxjOyUGy
 7h8w==
X-Gm-Message-State: AOAM530g7CnCFLes1IZsEHA6lgNwHnxeu9gWcV/nHuunEWVt8Klxd9W6
 MLLOklz58feCx1Zgi+zLj+rP4xsQJQthUjRcUagxTyWYE9A16WP6
X-Google-Smtp-Source: ABdhPJw8khzUT1xklIlaPsrnWjLgQ5a8H3gU9p0f5nnFh1ZQFhSGWXVD4EbODxho9F2hrGxYb3dhCmEzswYCVSBXF4A=
X-Received: by 2002:a17:902:b711:b029:e3:71f1:e08e with SMTP id
 d17-20020a170902b711b02900e371f1e08emr1808419pls.18.1614654630871; Mon, 01
 Mar 2021 19:10:30 -0800 (PST)
MIME-Version: 1.0
From: Sean Kuo <gcf1129@gmail.com>
Date: Tue, 2 Mar 2021 11:10:19 +0800
Message-ID: <CAFkVRJKUaHbMGSVAFpE4ETrLZTH0ShbTGtRGG38EvhfkmpKaXA@mail.gmail.com>
Subject: mst@redhat.com
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b5460e05bc8513a2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=gcf1129@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b5460e05bc8513a2
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Sorry for the disturbance.  I have to ask for your help since I can't
solve the problem by googling.

*Below is the problem:*

I met a problem when I tried to use IVSHMEM. Command lspci does not show
the IVSHMEM device.
Below is the configuration from my side:

*1.  guest vm xml configuration.*
  <shmem name='ivshmem'>
      <model type='ivshmem-plain'/>
      <size unit='M'>2</size>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x10'
function='0x0'/>
    </shmem>

*2. after the booting up and I found the qemu commandline ideedly  have the
device option:*
ps aux | grep ivshmem
 /usr/bin/qemu-system-x86_64
      .......(ignore other options)
-object
memory-backend-file,id=shmmem-shmem0,mem-path=/dev/shm/hostmem,size=4194304,share=yes
-device ivshmem-plain,id=shmem0,memdev=shmmem-shmem0,bus=pcie.0,addr=0x10

*3. lspci command  not shown the device.*

*4. lshw command indeedly show the device:*

*-memory UNCLAIMED
             description: RAM memory
             product: Inter-VM shared memory
             vendor: Red Hat, Inc.
             physical id: 10
             bus info: pci@0000:00:10.0
             version: 01
             width: 64 bits
             clock: 33MHz (30.3ns)
             configuration: latency=0
             resources: memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff

My host and vm os is ubuntu 20.04 and version is:
#49~20.04.1-Ubuntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64
GNU/Linux

Also I have asked a question on stackoverflow website, I provide the link
for your reference:
https://stackoverflow.com/questions/66432392/comand-lspci-does-not-show-the-the-ivshmem-device

Thanks in advance.

Best regards,
Sean

--000000000000b5460e05bc8513a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Team,</div><div dir=3D"ltr"><div><br><=
/div><div>Sorry for the disturbance.=C2=A0 I have to ask for your help sinc=
e I can&#39;t solve=C2=A0the problem=C2=A0by googling.</div><div><span styl=
e=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot=
;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&q=
uot;Segoe UI Emoji&quot;"><b><i><br></i></b></span></div><div><span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSystemFont,&quot;=
Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color Emoji&quot;,&qu=
ot;Segoe UI Emoji&quot;"><b><i>Below is the problem:</i></b></span></div><d=
iv><span style=3D"color:rgb(36,41,46);font-family:-apple-system,BlinkMacSys=
temFont,&quot;Segoe UI&quot;,Helvetica,Arial,sans-serif,&quot;Apple Color E=
moji&quot;,&quot;Segoe UI Emoji&quot;"><b><i><br></i></b></span></div><div>=
I met a problem when I tried to use IVSHMEM. Command lspci does not show th=
e IVSHMEM device.</div><div>Below=C2=A0is the configuration from my side:</=
div><div><br></div><div><b>1.=C2=A0 guest vm xml configuration.</b></div><d=
iv>=C2=A0<font color=3D"#ff0000">=C2=A0&lt;shmem name=3D&#39;ivshmem&#39;&g=
t;<br>=C2=A0 =C2=A0 =C2=A0 &lt;model type=3D&#39;ivshmem-plain&#39;/&gt;<br=
>=C2=A0 =C2=A0 =C2=A0 &lt;size unit=3D&#39;M&#39;&gt;2&lt;/size&gt;<br>=C2=
=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39=
; bus=3D&#39;0x00&#39; slot=3D&#39;0x10&#39; function=3D&#39;0x0&#39;/&gt;<=
br>=C2=A0 =C2=A0 &lt;/shmem&gt;<br></font></div><div><br></div><div><b>2. a=
fter the booting up and I found the qemu commandline ideedly=C2=A0 have the=
 device option:</b></div><div>ps aux | grep ivshmem</div><div>=C2=A0/usr/bi=
n/qemu-system-x86_64=C2=A0<br></div><div>=C2=A0 =C2=A0 =C2=A0 .......(ignor=
e other options)</div><div><font color=3D"#ff0000">-object memory-backend-f=
ile,id=3Dshmmem-shmem0,mem-path=3D/dev/shm/hostmem,size=3D4194304,share=3Dy=
es -device ivshmem-plain,id=3Dshmem0,memdev=3Dshmmem-shmem0,bus=3Dpcie.0,ad=
dr=3D0x10</font><br></div><div><br></div><div><b>3. lspci command=C2=A0 not=
 shown=C2=A0the device.</b></div><div><br></div><div><b>4. lshw command ind=
eedly show the device:</b></div><div><br></div><div>*-memory UNCLAIMED<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0description: RAM memory<br>=
<font color=3D"#ff0000">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pro=
duct: Inter-VM shared memory<br></font>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0vendor: Red Hat, Inc.<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0physical id: 10<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bus info: pci@0000:00:10.0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0version: 01<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wi=
dth: 64 bits<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock: 33MH=
z (30.3ns)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0configuration=
: latency=3D0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0resources:=
 memory:fcc1c000-fcc1c0ff memory:fdc00000-fdffffff<br></div><div><br></div>=
<div>My host and vm os is ubuntu 20.04 and version is:</div>#49~20.04.1-Ubu=
ntu SMP Fri Feb 5 09:57:56 UTC 2021 x86_64 x86_64 x86_64 GNU/Linux<br><div>=
<br></div><div>Also I have asked a question on stackoverflow website, I pro=
vide the link for your reference:=C2=A0</div><div><a href=3D"https://stacko=
verflow.com/questions/66432392/comand-lspci-does-not-show-the-the-ivshmem-d=
evice" target=3D"_blank">https://stackoverflow.com/questions/66432392/coman=
d-lspci-does-not-show-the-the-ivshmem-device</a></div><div><br></div><div>T=
hanks in advance.</div><div><br></div><div>Best regards,=C2=A0</div><font c=
olor=3D"#888888"><div>Sean</div></font></div></div>

--000000000000b5460e05bc8513a2--

