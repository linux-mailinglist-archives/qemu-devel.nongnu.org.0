Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941246C813C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:31:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjCC-0007aO-2u; Fri, 24 Mar 2023 11:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi.duraffort@linaro.org>)
 id 1pfhrc-0002mq-UK
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 09:53:52 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <remi.duraffort@linaro.org>)
 id 1pfhrO-0007Qp-6D
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 09:53:52 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cn12so8263188edb.4
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679665996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tc9oQF86Whcu9PBslfUKIJ+qdqZwjfb9E8bfzXn9jAs=;
 b=yNCgufjM/Axx9HWMKDwebt1cle8s9lVrJW6jl3g0UPXCowIxTo0nYmNyn7OGrLbJ9n
 HDXKTW2MB2pEj3yz28WsyqLMVMD6CTFwMxoEL5yNUPHQXoA4hEeXUpoWMkOn9wRC0dwv
 OAojGRTXcCYTC1Q6UiEXRbHTyT3EXQwNv19SU1fWZyRSg8es29SeesWpqInuIec+v9a7
 wUnUtg1m73eEkprzMjlO+wj5ROgdy2zJyRvF/jFfDT7Z2486tYhLLIAXPyB8x8htBOvM
 qTmctUHXgv9w3trs+ScZwW8MUVa9RWesEd461KxBcZY6eNby27t3hFvyTy3l5h9/6LC+
 JyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679665996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tc9oQF86Whcu9PBslfUKIJ+qdqZwjfb9E8bfzXn9jAs=;
 b=igO3sZQalUoNwUzjldSnCShRCFOm9KnNd7YGe8TJMMs1Mf2CKQIkUCWzEd5IWQRipI
 h3XUbbKj5BsE3U/t3CwR6+fqQVioJ0PeHJTvlHC807PoV5cWn24osrMrFZyQp0OJVTla
 x57XD9GdbMrKTDsniveiP201pzEtj2YtdgIVB8RaY1szEXgnf29G1RJK55qMOMOVhB6b
 5zZt6k1sRmeRBJD08XZAL3KsxmYG7iPG+G5krbCOtrBpTVtTQzANvOCFDk5ZtkxVAUpw
 9qypJfU90GalbwZkTk9AjPUfM/J8EEV6r8YCmnzHl/umA0ow5r+ilpz2lPe/zMoegphh
 ib6w==
X-Gm-Message-State: AAQBX9ec1RnAUDSzKFXm29JQdqefxriN5YVPDdZKgf3HYvLRncbU/FUt
 iNz3ZattCgOEBrIL4HBwIDFzmK90lzi3qvObZaQGFNXVrb3UuWZ9g0g=
X-Google-Smtp-Source: AKy350aTfFoxYYZ1CgntgB+0aZakX/hDcECdpfXTt0T0Q9BcjFHWtzDC8SE/kiAQA4dZzYKKHi9Fz5d+2zDvDXRrvpo=
X-Received: by 2002:ac2:4434:0:b0:4dc:807a:d140 with SMTP id
 w20-20020ac24434000000b004dc807ad140mr697204lfl.10.1679662448895; Fri, 24 Mar
 2023 05:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <87h6ua4dkw.fsf@linaro.org>
In-Reply-To: <87h6ua4dkw.fsf@linaro.org>
From: Remi Duraffort <remi.duraffort@linaro.org>
Date: Fri, 24 Mar 2023 13:53:58 +0100
Message-ID: <CANJfhHe-E-+F_P_=+ww46Szp_To=C4QWxKG5hdeCriwQr821jg@mail.gmail.com>
Subject: Re: Adding default config options to the tuxrun baseline kernels and
 enabling sshd
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009bfbfc05f7a4e305"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=remi.duraffort@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 24 Mar 2023 11:19:07 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000009bfbfc05f7a4e305
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alex,



Le ven. 24 mars 2023 =C3=A0 12:02, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> a =C3=A9crit :

> Hi guys,
>
> I've been working with David on adding testing for the new KVM Xen guest
> functionality and had a couple of questions. His original test is based
> on fedora and is fairly comprehensive:
>
>
> https://git.infradead.org/users/dwmw2/qemu.git/commitdiff/48f78f9bb860dca=
446e20d6ed8db3aa9d857505f
>
> but we did try building a scratch kernel and using the rest of the
> baseline infrastructure which worked well enough:
>
>
> https://git.infradead.org/users/dwmw2/qemu.git/commitdiff/8b9e04d1c7c942f=
51b575b94fd280bd2353f76b6
>
> but obviously the kernel there is pulling directly from tuxsuite so will
> time out soon enough. They were built with the following tuxbuild
> config:
>
>   version: 1
>   name: Xen Guest Kernels
>   description: Build Xen Test Kernels
>   jobs:
>   - builds:
>       - {target_arch: x86_64, toolchain: gcc-12, kconfig: [defconfig,
> "CONFIG_XEN=3Dy", "CONFIG_XEN_PVHVM=3Dy", "CONFIG_XEN_BLKDEV_FRONTEND=3Dy=
",
> "CONFIG_XEN_PVHVM_GUEST=3Dy"]}
>       - {target_arch: i386, toolchain: gcc-12, kconfig: [defconfig,
> "CONFIG_XEN=3Dy", "CONFIG_XEN_PVHVM=3Dy", "CONFIG_XEN_BLKDEV_FRONTEND=3Dy=
",
> "CONFIG_XEN_PVHVM_GUEST=3Dy"]}
>     test: {device: qemu-x86_64, tests: [ltp-smoke]}
>
> The other nice thing about his original tests where using ssh which
> avoids a) avoids some of the flakeness of using the serial port and b)
> has an explicit success/fail for each command without having to scrape
> pass/fail from the log.
>
> So two questions:
>
>   - is there a process for adding kernel options to the baseline kernels
>     or should we build our own and store them somewhere?
>
>   - what would it take to get dropbear added to the baseline ext4 images
>     so we can enable sshd?
>

The kernels and rootfs are built by this gitlab project:
https://gitlab.com/LinaroLtd/tuxsuite.com/tuxtest/tuxtest-buildroot using
buildroot.
So for sure we can add sshd support quickly. Regarding the support for xen,
this can be added for arm64 if you want (only arm64 or something else)?




> Thanks,
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>


--=20
R=C3=A9mi Duraffort
Principal Tech Lead
Automation Software Team
Linaro

--0000000000009bfbfc05f7a4e305
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Alex,<div><br></div><div><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Le=C2=A0ven. 24 mars 2023 =C3=A0=C2=A012:02, Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; a =C3=A9c=
rit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi gu=
ys,<br>
<br>
I&#39;ve been working with David on adding testing for the new KVM Xen gues=
t<br>
functionality and had a couple of questions. His original test is based<br>
on fedora and is fairly comprehensive:<br>
<br>
=C2=A0 <a href=3D"https://git.infradead.org/users/dwmw2/qemu.git/commitdiff=
/48f78f9bb860dca446e20d6ed8db3aa9d857505f" rel=3D"noreferrer" target=3D"_bl=
ank">https://git.infradead.org/users/dwmw2/qemu.git/commitdiff/48f78f9bb860=
dca446e20d6ed8db3aa9d857505f</a><br>
<br>
but we did try building a scratch kernel and using the rest of the<br>
baseline infrastructure which worked well enough:<br>
<br>
=C2=A0 <a href=3D"https://git.infradead.org/users/dwmw2/qemu.git/commitdiff=
/8b9e04d1c7c942f51b575b94fd280bd2353f76b6" rel=3D"noreferrer" target=3D"_bl=
ank">https://git.infradead.org/users/dwmw2/qemu.git/commitdiff/8b9e04d1c7c9=
42f51b575b94fd280bd2353f76b6</a><br>
<br>
but obviously the kernel there is pulling directly from tuxsuite so will<br=
>
time out soon enough. They were built with the following tuxbuild<br>
config:<br>
<br>
=C2=A0 version: 1<br>
=C2=A0 name: Xen Guest Kernels<br>
=C2=A0 description: Build Xen Test Kernels<br>
=C2=A0 jobs:<br>
=C2=A0 - builds:<br>
=C2=A0 =C2=A0 =C2=A0 - {target_arch: x86_64, toolchain: gcc-12, kconfig: [d=
efconfig, &quot;CONFIG_XEN=3Dy&quot;, &quot;CONFIG_XEN_PVHVM=3Dy&quot;, &qu=
ot;CONFIG_XEN_BLKDEV_FRONTEND=3Dy&quot;, &quot;CONFIG_XEN_PVHVM_GUEST=3Dy&q=
uot;]}<br>
=C2=A0 =C2=A0 =C2=A0 - {target_arch: i386, toolchain: gcc-12, kconfig: [def=
config, &quot;CONFIG_XEN=3Dy&quot;, &quot;CONFIG_XEN_PVHVM=3Dy&quot;, &quot=
;CONFIG_XEN_BLKDEV_FRONTEND=3Dy&quot;, &quot;CONFIG_XEN_PVHVM_GUEST=3Dy&quo=
t;]}<br>
=C2=A0 =C2=A0 test: {device: qemu-x86_64, tests: [ltp-smoke]}<br>
<br>
The other nice thing about his original tests where using ssh which<br>
avoids a) avoids some of the flakeness of using the serial port and b)<br>
has an explicit success/fail for each command without having to scrape<br>
pass/fail from the log.<br>
<br>
So two questions:<br>
<br>
=C2=A0 - is there a process for adding kernel options to the baseline kerne=
ls<br>
=C2=A0 =C2=A0 or should we build our own and store them somewhere?<br>
<br>
=C2=A0 - what would it take to get dropbear added to the baseline ext4 imag=
es<br>
=C2=A0 =C2=A0 so we can enable sshd?<br></blockquote><div><br></div><div>Th=
e kernels and rootfs are built by this gitlab project:=C2=A0<a href=3D"http=
s://gitlab.com/LinaroLtd/tuxsuite.com/tuxtest/tuxtest-buildroot">https://gi=
tlab.com/LinaroLtd/tuxsuite.com/tuxtest/tuxtest-buildroot</a> using buildro=
ot.</div><div>So for sure we can add sshd support quickly. Regarding the su=
pport for xen, this can be added for arm64 if you want (only arm64 or somet=
hing else)?</div><div><br></div><div><br></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div>R=C3=A9mi Duraffort</div>=
Principal Tech Lead</div><div dir=3D"ltr"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;white-space:pre-wrap">Automation Software Te=
am</span><br></div><div dir=3D"ltr">Linaro<br></div></div></div></div></div=
></div></div></div></div></div></div></div>

--0000000000009bfbfc05f7a4e305--

