Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2C324C15
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 09:32:58 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFC4v-0007mU-Cu
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 03:32:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lFC42-0007Iz-SS
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:32:02 -0500
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:41532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lFC41-0005sz-17
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 03:32:02 -0500
Received: by mail-il1-x136.google.com with SMTP id c10so4198469ilo.8
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 00:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IOqz32nz7mkaeiIHmd/JiPYZGnjg372IdP/Q2VHu8Tg=;
 b=ojfXacgbxaBROWcOpUwZ27MYQSK7nw4YGuClE7kuouD1QAHOEVUIulaVyFzJSR1sdk
 ZofINggTJ6KWfYbhT9Dnqcue8RpdpnB5zEIPaKQqbXhEOhh+/HPOL1a5Dct/gA34QxRX
 3N39X+Oa9mH7UFJ2Q9qZFQZ1f7y3lCiCeS9JqKp5SXtQDmylkO81/UOOCV+xeRtzM76G
 Hyil81yQjDOVzM2/vUfN+bpMTu7ZXCJGRNO9lD9fH27YqGBl1s7k5sfyNt2+4QnN/igi
 Lhcg1juJyQ+SPDFucVKCVMk7MgZvt5KPHI/ginA/9NMOD46CQ6bQ2K4d19cKPVN0Ywc8
 a11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IOqz32nz7mkaeiIHmd/JiPYZGnjg372IdP/Q2VHu8Tg=;
 b=Ne0g4G54I/b7S12wp/btUz5/ZeH8ekI9dK3VOgQ1FqissfTz28ixMg+e5ps7ByBTwB
 nE75HYQXMcQ2TcTMWsHdX5Qz8Q6+HDGn+BI22TZYGbrcrPRm+FRLlmBsY4CzHJsoOHJn
 nT+27cjDK7mkvD1yON+nYLDBQZl8lr5rc5QseWxRIj44q5dFCePy4oK8PIGN9f+NaMxa
 gGQeoqjrT9KWtx9xctgO1rab+Z0uqOpYSTVYcf/dO2g1D7vy6ZOKDynjyTNsyZ5aG3H7
 RkFI4heWbB8VyXJYcgV/WNDPdSD9xssHOEKZI7+GNoezt/Lk2cGjiFOZs+JEsgpeZF5D
 Vyfg==
X-Gm-Message-State: AOAM5301TM/aAiI8CXalZE9W8cG3uJWebRLn65csWfGQ2MMbRcLoFa5G
 a4Vhv0fdXzXfD5swwoFfnmhByMjvfrSYrnBOXDI=
X-Google-Smtp-Source: ABdhPJwQepkHgeDeeDfZL3xvdctye7HKrJu6zVYXTl6chZROEOKiwBtI3iEhHZ3L7l3eYtsgvVslFA3Cu8lP21r5ET4=
X-Received: by 2002:a05:6e02:1a82:: with SMTP id
 k2mr1629766ilv.155.1614241919823; 
 Thu, 25 Feb 2021 00:31:59 -0800 (PST)
MIME-Version: 1.0
References: <20210224191927.19271-1-koalinux@gmail.com>
 <3407243.daszWApDLn@silver>
 <5694e258e36c6623aae5465aafeec951@hostfission.com>
 <31652865.Htn8XJslzA@silver>
 <ab566e57c5ec57e857834d7a70d4dfde@hostfission.com>
In-Reply-To: <ab566e57c5ec57e857834d7a70d4dfde@hostfission.com>
From: =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= <koalinux@gmail.com>
Date: Thu, 25 Feb 2021 10:31:44 +0200
Message-ID: <CANWZPgKuwQya4ZrVZzmRS1Rw+Y3-vXtaXY7iC__JH4NpXdyLuQ@mail.gmail.com>
Subject: Re: [PATCH v2] Autoconnect jack ports by default
To: Geoffrey McRae <geoff@hostfission.com>
Content-Type: multipart/alternative; boundary="00000000000036759305bc24fc7c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=koalinux@gmail.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000036759305bc24fc7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Feb 2021 at 00:38, Geoffrey McRae <geoff@hostfission.com> wrote:

> While I get where you're coming from, those using QEMU with Jack are
> already advanced users that are used to reading technical documentation.
> Having our one client do something that is unexpected/different would
> not only confuse existing Jack users but also anyone following any
> guides/documentation on how to use a generic jack client. IMO the better
> solution here is simply better documentation, perhaps even a known
> working sample setup.
>

    This is an interesting point, but hey, things be told in advance,
whether
the patch is accepted or not is up to you, I'll respect any decision in the
upstreaming, I'm just curious, how can a default behaviour that multiple
other applications and libraries adopt is going to confuse jack community?
For instance, I tend to work with firefox, and mumble that natively support
jack, and they perform automatic connection no patchbay extra config
required, the basics just work out of the box, while you still can do more
complex stuff if you want to use the full set of features of jack.

    On the other hand, I took some time to read to automatically configure
the connection over qjackctl patchbay, so thanks for pointing out that via.

    Jos=C3=A9.

--00000000000036759305bc24fc7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 25 Feb 2021 at 00:38, Geoffre=
y McRae &lt;<a href=3D"mailto:geoff@hostfission.com" target=3D"_blank">geof=
f@hostfission.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">While I get where you&#39;re coming from, those using QEMU=
 with Jack are <br>
already advanced users that are used to reading technical documentation. <b=
r>
Having our one client do something that is unexpected/different would <br>
not only confuse existing Jack users but also anyone following any <br>
guides/documentation on how to use a generic jack client. IMO the better <b=
r>
solution here is simply better documentation, perhaps even a known <br>
working sample setup.<br></blockquote><div><br></div><div>=C2=A0 =C2=A0 Thi=
s is an interesting point, but hey, things be told in advance, whether</div=
><div>the patch is accepted or not is up to you, I&#39;ll respect any decis=
ion in the</div><div>upstreaming, I&#39;m just curious, how can a default b=
ehaviour that multiple</div><div>other applications and libraries adopt is =
going to confuse jack community?</div><div>For instance, I tend to work wit=
h firefox, and mumble that natively support</div><div>jack, and they perfor=
m automatic connection no patchbay extra config</div><div>required, the bas=
ics just work out of the box, while you still can do more</div><div>complex=
 stuff if you want to use the full set of features of jack.</div><div><br><=
/div><div>=C2=A0 =C2=A0 On the other hand, I took some time to read to auto=
matically configure</div><div>the connection over qjackctl patchbay, so tha=
nks for pointing out that via.</div><div><br></div><div>=C2=A0 =C2=A0 Jos=
=C3=A9.</div></div></div>

--00000000000036759305bc24fc7c--

