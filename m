Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5093453CC62
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 17:37:32 +0200 (CEST)
Received: from localhost ([::1]:40536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx9Mh-00071Z-5l
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 11:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1nx9KJ-0004C2-1q
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:35:03 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:35513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yu.zhang@ionos.com>)
 id 1nx9KG-0002s8-J1
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 11:35:02 -0400
Received: by mail-lf1-x131.google.com with SMTP id a2so13212574lfc.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhBgz5VeNrkjaQg4Pvm6FiHEFmSLq+aCnc0Jxe0jDns=;
 b=CHLaSFRETAQ3eTjWswhEVh+xyKCd9Mb55i2S+9W7AvI/dJigAy2S9MN2zm7xvPRlGT
 fm6a5cRWg3aNrVcXWNDH/dOfDm/EfJYeW3tVZBMolY2rNgspW7/A0qH75lcVsGqiC58Y
 zuUUxrhUlcLii74z9W2wnatCwu4dZf6IK3uYSHgfkLz4gqbDH7VzQ3seSHqVComc8boJ
 GVk6P/txOAdYbO65rqiyz8Z+pQkkxI5e70FJ04EmHqkQsqrlAaHSEdmNj7yEd6uNQn+i
 KFI1vOGurn12DBi1CksudA2OhNev0Ctp4pz2nxsF7ae8Qhy4MRCPwjBFulvfYO0TegHK
 gsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhBgz5VeNrkjaQg4Pvm6FiHEFmSLq+aCnc0Jxe0jDns=;
 b=WgrBoOEnmtFfASTFgjdiK4yTBm1ne9phXJWqPqSYaHPlxH8eptCmWKD+svuZWoNgPT
 R69zX+CSw7N553YP4O3mnTiKSPxxbkkGNdMkvTHY7tHuTSn7/w1QTEC4r9d0wssW0LG1
 0fcFqbkkc73vWWgyTqZPW2fbP0JEQXJxVIh4m+1x8G/bz/kGnFdXkc2JU3ATXajwM/91
 S/Luf6MltgH+tiWVcCwhr4OMjETxWkHpEiHZuuuah5HymSaE2Njl3kmIB/Itu3IN7If2
 +K34kBJ7fh6TVSLr2yWG4uRkkYeMm1g9HGiDDnmzkIjYWnXjNqFL0otoFiRaXAzZuFzf
 7UnQ==
X-Gm-Message-State: AOAM5322HTLDHanxXJAXyuqKzOdzeNCFcdBaQi5CqIuFsZUnp8P1ZpbM
 bwOMyCwGO8UrWXhdAWB4aohYAkM/AvbhNCVG7FA1Vg==
X-Google-Smtp-Source: ABdhPJxdyfSalFq0IExygvZPjovnJulLPsi7AzN/Uf5P25m2+28TuW5enx3gnbHDq9Ft6a1suCvyxFGdxHFGV6Go7Xo=
X-Received: by 2002:a05:6512:ea7:b0:477:aa40:ef43 with SMTP id
 bi39-20020a0565120ea700b00477aa40ef43mr7404778lfb.202.1654270498076; Fri, 03
 Jun 2022 08:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHEcVy7G6HR5=-uVv4GAxryBvdAmtQRo9GDXBO=gj18J+9FwwQ@mail.gmail.com>
 <616364ca-7ad7-4a3b-6737-3d3d06414b3c@vivier.eu>
In-Reply-To: <616364ca-7ad7-4a3b-6737-3d3d06414b3c@vivier.eu>
From: Yu Zhang <yu.zhang@ionos.com>
Date: Fri, 3 Jun 2022 17:34:47 +0200
Message-ID: <CAHEcVy4XKUzBR-quVx4w+ttCgFG6ykC-LAVq+UCBmeyy48dgfQ@mail.gmail.com>
Subject: Fwd: about the current status of Multi-process QEMU / out-of-process
 emulation
To: Dongli Zhang <dongli.zhang@oracle.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, 
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Jinpu Wang <jinpu.wang@ionos.com>, Elmar Gerdes <elmar.gerdes@ionos.com>
Content-Type: multipart/alternative; boundary="0000000000006693e405e08cdd96"
Received-SPF: permerror client-ip=2a00:1450:4864:20::131;
 envelope-from=yu.zhang@ionos.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

--0000000000006693e405e08cdd96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dongli, Elena, John, and Jagannathan,

I'm interested in the "multi-process QEMU" feature and got the kind reply
by Mr. Vivier that I may contact you for this.
On one of the QEMU docs [1] I saw the command line:

+      /usr/bin/qemu-system-x86_64                                        \
+      -machine x-remote                                                  \
+      -device lsi53c895a,id=3Dlsi0                                        =
 \
+      -drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-1.qcow2        =
   \
+      -device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0,scsi-i=
d=3D0  \
+      -object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D4,

It seems that the man page of qemu contains no parameter and option yet for
this feature. The qemu docs, such as [2][3][4] are either not up-to-date or
"doesn't reflect the current status of the implementation".
So may I know whether is it still in experimental stage or mature enough
for use? And even a few further questions:

- When creating the orchestrator, can we specify a machine type such as
pc-i440fx-7.0 for -machine?
- Can each device has a dedicated emulation process or shares one process
for emulating multiple devices?
- Can we find more command line examples showing the combination of
orchestrator, remote emulation process, memory-backend-memfd and
x-pci-proxy-dev?

Thank you very much and all the best

Yu Zhang
03.06.2022

[1] https://www.qemu.org/docs/master/system/multi-process.html
[2] https://wiki.qemu.org/Features/MultiProcessQEMU
[3]
https://lxr.missinglinkelectronics.com/qemu+v7.0.0/docs/devel/multi-process=
.rst
[4] https://qemu.readthedocs.io/en/latest/devel/multi-process.html

---------- Forwarded message ---------
From: Laurent Vivier <laurent@vivier.eu>
Date: Fri, Jun 3, 2022 at 4:14 PM
Subject: Re: about the current status of Multi-process QEMU /
out-of-process emulation
To: Yu Zhang <yu.zhang@ionos.com>


Hi Yu,

I'm not the author of this documentation, only the person that has merged
the last change in the repo.

According to the logs you should contact Dongli Zhang <
dongli.zhang@oracle.com>, Elena Ufimtseva
<elena.ufimtseva@oracle.com>, John G Johnson <john.g.johnson@oracle.com> or
Jagannathan Raman
<jag.raman@oracle.com> .

Thanks,
Laurent

Le 03/06/2022 =C3=A0 12:17, Yu Zhang a =C3=A9crit :
> Dear Mr. Vivier,
>
> I saw that you authored the QEMU page for "Multi-process QEMU".
> (https://www.qemu.org/docs/master/system/multi-process.html
> <https://www.qemu.org/docs/master/system/multi-process.html>)
>
> I'm interested in this feature, but feel a little confused with the
command line:
>
> +      /usr/bin/qemu-system-x86_64
 \
> +      -machine x-remote
 \
> +      -device lsi53c895a,id=3Dlsi0
\
> +      -drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-1.qcow2
\
> +      -device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0,scsi=
-id=3D0
 \
> +      -object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D4,
>
> It seems that the man page of qemu command contains no parameter and
option yet for this feature.
> May I know whether is it still in experimental stage? And even a few more
questions:
>
> - Is "x-remote" a standalone machine type for creating the orchestrator?
> - Can each device has a dedicated emulation process or shares one process
for emulating multiple
> devices?
> - Can I find more command line examples illustrating the combination of
orchestrator, remote
> emulation process, memory-backend-memfd and x-pci-proxy-dev?
>
> Thank you very much
> Kind regard
>
> Yu Zhang
> 03.06.2022

--0000000000006693e405e08cdd96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Dongli, Elena, John, and Jagannathan,<br><br>I&#39;m=
 interested in the &quot;multi-process QEMU&quot; feature and got the kind =
reply by Mr. Vivier that I may contact you for this.<br>On one of the QEMU =
docs [1] I saw the command line:<br><br>+ =C2=A0 =C2=A0 =C2=A0/usr/bin/qemu=
-system-x86_64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>+ =C2=A0 =C2=A0 =C2=A0-machine x-remote =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>+ =C2=A0 =C2=A0 =C2=A0-device lsi53c895a,id=3Dlsi0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =
=C2=A0-drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-1.qcow2 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>+ =C2=A0 =C2=A0 =C2=A0-device scsi-hd,id=
=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0,scsi-id=3D0 =C2=A0\<br>+ =C2=A0=
 =C2=A0 =C2=A0-object x-remote-object,id=3Drobj1,devid=3Dlsi1,fd=3D4,<br><b=
r>It seems that the man page of qemu contains no parameter and option yet f=
or this feature. The qemu docs, such as [2][3][4] are either not up-to-date=
 or &quot;doesn&#39;t reflect the current status of the implementation&quot=
;.=C2=A0<div><div>So may I know whether is it still in experimental stage o=
r mature enough for use?=C2=A0And even a few further questions:<br><br>- Wh=
en creating the orchestrator, can we specify a machine type such as pc-i440=
fx-7.0 for -machine?<br>- Can each device has a dedicated emulation process=
 or shares one process for emulating multiple devices?<br>- Can we find mor=
e command line examples showing the combination of orchestrator, remote emu=
lation process, memory-backend-memfd and x-pci-proxy-dev?</div><div><br></d=
iv><div>Thank you very much and all the best<br><br>Yu Zhang<br>03.06.2022<=
/div><div><br></div><div>[1] <a href=3D"https://www.qemu.org/docs/master/sy=
stem/multi-process.html">https://www.qemu.org/docs/master/system/multi-proc=
ess.html</a></div><div>[2]=C2=A0<a href=3D"https://wiki.qemu.org/Features/M=
ultiProcessQEMU">https://wiki.qemu.org/Features/MultiProcessQEMU</a><br><di=
v>[3] <a href=3D"https://lxr.missinglinkelectronics.com/qemu+v7.0.0/docs/de=
vel/multi-process.rst">https://lxr.missinglinkelectronics.com/qemu+v7.0.0/d=
ocs/devel/multi-process.rst</a><br></div><div>[4] <a href=3D"https://qemu.r=
eadthedocs.io/en/latest/devel/multi-process.html">https://qemu.readthedocs.=
io/en/latest/devel/multi-process.html</a>=C2=A0</div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message=
 ---------<br>From: <strong class=3D"gmail_sendername" dir=3D"auto">Laurent=
 Vivier</strong> <span dir=3D"auto">&lt;<a href=3D"mailto:laurent@vivier.eu=
">laurent@vivier.eu</a>&gt;</span><br>Date: Fri, Jun 3, 2022 at 4:14 PM<br>=
Subject: Re: about the current status of Multi-process QEMU / out-of-proces=
s emulation<br>To: Yu Zhang &lt;<a href=3D"mailto:yu.zhang@ionos.com">yu.zh=
ang@ionos.com</a>&gt;<br></div><br><br>Hi Yu,<br>
<br>
I&#39;m not the author of this documentation, only the person that has merg=
ed the last change in the repo.<br>
<br>
According to the logs you should contact Dongli Zhang &lt;<a href=3D"mailto=
:dongli.zhang@oracle.com" target=3D"_blank">dongli.zhang@oracle.com</a>&gt;=
, Elena Ufimtseva <br>
&lt;<a href=3D"mailto:elena.ufimtseva@oracle.com" target=3D"_blank">elena.u=
fimtseva@oracle.com</a>&gt;, John G Johnson &lt;<a href=3D"mailto:john.g.jo=
hnson@oracle.com" target=3D"_blank">john.g.johnson@oracle.com</a>&gt; or Ja=
gannathan Raman <br>
&lt;<a href=3D"mailto:jag.raman@oracle.com" target=3D"_blank">jag.raman@ora=
cle.com</a>&gt; .<br>
<br>
Thanks,<br>
Laurent<br>
<br>
Le 03/06/2022 =C3=A0 12:17, Yu Zhang a =C3=A9crit=C2=A0:<br>
&gt; Dear Mr. Vivier,<br>
&gt; <br>
&gt; I saw that you authored the QEMU page for &quot;Multi-process QEMU&quo=
t;.<br>
&gt; (<a href=3D"https://www.qemu.org/docs/master/system/multi-process.html=
" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/sys=
tem/multi-process.html</a> <br>
&gt; &lt;<a href=3D"https://www.qemu.org/docs/master/system/multi-process.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://www.qemu.org/docs/master/=
system/multi-process.html</a>&gt;)<br>
&gt; <br>
&gt; I&#39;m interested in this feature, but feel a little confused with th=
e command line:<br>
&gt; <br>
&gt; + =C2=A0 =C2=A0 =C2=A0/usr/bin/qemu-system-x86_64 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; + =C2=A0 =C2=A0 =C2=A0-machine x-remote =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt; + =C2=A0 =C2=A0 =C2=A0-device lsi53c895a,id=3Dlsi0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0-drive id=3Ddrive_image2,file=3D/build/ol7-nvme-=
test-1.qcow2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; + =C2=A0 =C2=A0 =C2=A0-device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2=
,bus=3Dlsi0.0,scsi-id=3D0 =C2=A0\<br>
&gt; + =C2=A0 =C2=A0 =C2=A0-object x-remote-object,id=3Drobj1,devid=3Dlsi1,=
fd=3D4,<br>
&gt; <br>
&gt; It seems that the man page of qemu command contains no parameter and o=
ption yet for this feature. <br>
&gt; May I know whether is it still in experimental stage?=C2=A0And even a =
few more questions:<br>
&gt; <br>
&gt; - Is &quot;x-remote&quot; a standalone machine type for creating the o=
rchestrator?<br>
&gt; - Can each device has a dedicated emulation process or shares one proc=
ess for emulating multiple <br>
&gt; devices?<br>
&gt; - Can I find more command line examples illustrating the combination o=
f orchestrator, remote <br>
&gt; emulation process, memory-backend-memfd and x-pci-proxy-dev?<br>
&gt; <br>
&gt; Thank you very much<br>
&gt; Kind regard<br>
&gt; <br>
&gt; Yu Zhang<br>
&gt; 03.06.2022<br>
<br>
</div></div></div></div>

--0000000000006693e405e08cdd96--

