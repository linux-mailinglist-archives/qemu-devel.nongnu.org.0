Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7944586419
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 08:34:07 +0200 (CEST)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIP0A-0000EG-IC
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 02:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oIOvc-0006mD-Hj
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 02:29:24 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:44993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oIOva-0000FU-Lw
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 02:29:24 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id s129so1840673vsb.11
 for <qemu-devel@nongnu.org>; Sun, 31 Jul 2022 23:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=NVHKy2okYpJDqY4BPMJIocF3tHykLBwYjec4nEP40Ts=;
 b=PATm8gdJ57csiDOrF89N0XCGRZFYsz6mGgRFmF89PiToHZdXGecr1q7tNORz+zYGlE
 0MvA7lwlwmAB0LCG6FXK6Ff/naGJXXaCsnQfBUe8/EC4/bqlupYYjO4GC5lOLw0h97wQ
 nptRLPqNbzRLSFBZUh8yyKAyKNeFrVatp7t5OlmshVqjwNtwGIoGf7g/gBF2gw03Nuvz
 ZOu6vWV9uMuUt98hHySbVhU26/Fc+ar1i005hskVoEnUV531yqBkatkOaqsT1XlCOI2b
 9bNCQk09pwRR62xGmMiXkGyTmgouJS+/zY+wcAQyqur2alFWbBMumfw6vQ0IZKNk4xdP
 /tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=NVHKy2okYpJDqY4BPMJIocF3tHykLBwYjec4nEP40Ts=;
 b=UCd0W8S5axjHki0SuJodgtZoU48ZOB6CNHPiv/6Lyes0uEoCIiTvpT378ZuQVJ03AA
 FNLxFI0hzvfxJrRIAWeQQcbVahn5DlIBpVidnzkSwecDqDEczulz2RZJQwF7y+RxavHC
 bJohvk6qUGQcc+q6Gm1nnkdLo7VJE4qg7Ina9o4CXbhhjUs6mkVMDYl+Lxih5EKJfC0e
 fOekK5ThskxY8DBART56buMau/jvbN+x0kZAtL98YEdRgvy2MDn/brmh5mb5vAjephtD
 VGftVV2wjg6Z/+WOssFJDkKWezCFuIGn94d7XGnh3N+raitgbaFdKoh15KYIVKLvW7Jb
 4K4g==
X-Gm-Message-State: ACgBeo0SlH73FV6NbNNvdlQ5Db0SCOVyRmO7BAj8Vzq1m08vXjsRwgrh
 fyItp2AOMw9Nl6N7lq4kVXPOeQx1bbK/LYyQZPLldfbTCYg=
X-Google-Smtp-Source: AA6agR4xxf4cAyz+mzpDZ4dz/PgM1deVgNeNsm40uwGo3WTsQYH2MHXVC4zYscCLemp8zljkrvCAbzL2qpQTBQ4mqoo=
X-Received: by 2002:a05:6102:30a1:b0:386:4657:d6e1 with SMTP id
 y1-20020a05610230a100b003864657d6e1mr617764vsd.17.1659335359594; Sun, 31 Jul
 2022 23:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20130516173422.20571.91890.malonedeb@gac.canonical.com>
 <165930116695.48062.10370149944063594891.malone@dale.canonical.com>
In-Reply-To: <165930116695.48062.10370149944063594891.malone@dale.canonical.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 1 Aug 2022 14:29:06 +0800
Message-ID: <CAE2XoE8NUw+6fEHA4EvpkSBoqSv_iTrHotMxD7SkQFFrF5+J3w@mail.gmail.com>
Subject: Re: [Bug 1180923] Re: unused memory filled with 0x00 instead of 0xFF
To: Bug 1180923 <1180923@bugs.launchpad.net>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ac044705e5281e94"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=luoyonggang@gmail.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ac044705e5281e94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I create a issue at https://gitlab.com/qemu-project/qemu/-/issues/1133 to
tracking this

On Mon, Aug 1, 2022 at 5:06 AM David Glover <1180923@bugs.launchpad.net>
wrote:

> I know this is expired but it's still a problem in qemu 7.0.0. For
> example, when running MS-DOS 6.22, "mem" reports 0K of upper memory, and
> memmaker fails to run, complaining that it could not allocate any. I'd
> love to know if there's a workaround.
>
> --
> You received this bug notification because you are a member of qemu-
> devel-ml, which is subscribed to QEMU.
> https://bugs.launchpad.net/bugs/1180923
>
> Title:
>   unused memory filled with 0x00 instead of 0xFF
>
> Status in QEMU:
>   Expired
>
> Bug description:
>   Qemu, ever since it was made (so, since 2003), has this problem in DOS
>   (either PC-DOS or MS-DOS and partly Windows 9x) not recognizing the
>   memory available when the memory is filled with 0x00 but when it is
>   filled with 0xFF it gets recognized properly, where should I patch
>   qemu to solve this memory problem?
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1180923/+subscriptions
>
>
>

--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000ac044705e5281e94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I create a issue at=C2=A0<a href=3D"https://gitlab.com/qem=
u-project/qemu/-/issues/1133">https://gitlab.com/qemu-project/qemu/-/issues=
/1133</a> to tracking this</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Aug 1, 2022 at 5:06 AM David Glover &lt;<=
a href=3D"mailto:1180923@bugs.launchpad.net">1180923@bugs.launchpad.net</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I kn=
ow this is expired but it&#39;s still a problem in qemu 7.0.0. For<br>
example, when running MS-DOS 6.22, &quot;mem&quot; reports 0K of upper memo=
ry, and<br>
memmaker fails to run, complaining that it could not allocate any. I&#39;d<=
br>
love to know if there&#39;s a workaround.<br>
<br>
-- <br>
You received this bug notification because you are a member of qemu-<br>
devel-ml, which is subscribed to QEMU.<br>
<a href=3D"https://bugs.launchpad.net/bugs/1180923" rel=3D"noreferrer" targ=
et=3D"_blank">https://bugs.launchpad.net/bugs/1180923</a><br>
<br>
Title:<br>
=C2=A0 unused memory filled with 0x00 instead of 0xFF<br>
<br>
Status in QEMU:<br>
=C2=A0 Expired<br>
<br>
Bug description:<br>
=C2=A0 Qemu, ever since it was made (so, since 2003), has this problem in D=
OS<br>
=C2=A0 (either PC-DOS or MS-DOS and partly Windows 9x) not recognizing the<=
br>
=C2=A0 memory available when the memory is filled with 0x00 but when it is<=
br>
=C2=A0 filled with 0xFF it gets recognized properly, where should I patch<b=
r>
=C2=A0 qemu to solve this memory problem?<br>
<br>
To manage notifications about this bug go to:<br>
<a href=3D"https://bugs.launchpad.net/qemu/+bug/1180923/+subscriptions" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.launchpad.net/qemu/+bug/1180=
923/+subscriptions</a><br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =E6=AD=A4=E8=
=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=C2=A0 =C2=
=A0 sincerely,<br>Yonggang Luo<br></div>

--000000000000ac044705e5281e94--

