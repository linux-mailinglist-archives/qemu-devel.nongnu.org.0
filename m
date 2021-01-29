Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D273308715
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:37:40 +0100 (CET)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PHf-00015d-5X
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5PEw-00085a-6Q
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:34:51 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5PEt-0003Go-2z
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:34:49 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g3so11779732ejb.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 00:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8mhyMrPfwPQaRh6RdtUpWtLJxmjlvAsP7fKvfjDk0+A=;
 b=M1xxV4UPB4YA26MhwjexB2omI27R8AyTQMpvcwLCnUT7bRbZTmfMq+o0+2Fv+0lo/W
 JVSgz5Qi4pAYp7Ck87Wbm1L0s5cmldF/wwEqE7Nuv/SZeRWovf6LowO44u1jGbu02VJo
 1qlqSsmxKyk0bGiNxtieCGhYOxaDny6gPY6LlylHjA+1v5d2Ehq6X8RsYpsaf75nqcEZ
 zeuiO3Qwy2LxZ8m2LlU468hXJpsKZawlb7QjcFZXKWSYhEzrynjtCDeFz1LAWxDd6Jv6
 58ZHukScgMYMrfqGZWLIJHBcE1iodaHC/kHI3qEtx2bBR3fjgpQC/O9q5gnpPwf97JBO
 jTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8mhyMrPfwPQaRh6RdtUpWtLJxmjlvAsP7fKvfjDk0+A=;
 b=PpQl/iJ9n5RFrXXV1UQUssa79tZJiS72Us96Y5BEYIu7KU15GfYq6k3RG9mOq9FSID
 PGcdB0B8y6v8Ni56Uw7NgDHuOQvGS4ijVyDAfL4Vhk4yKpg8osR0RwyXu2MSV3CTDeEJ
 W50mOpFfs71h7VkCefjZvUQcxHmdudHd+DNZMtonkEybakwXUZcAtz+bYXNXzwfzPcF8
 BcOQNTwuvRFSeLgxAUr3+z7P/Hp7r1ULJz9oJ0lLOFBhA4uyVlvQul+qm4eIlUjHRXHa
 2ks0jsOGLyR0Jvcz/HCM5c0jzoiSSJyI4JY1etga3o+c4CPhqM95M3u09cPSWXamYIkr
 t9yg==
X-Gm-Message-State: AOAM532smy54DRHDNP1eV+kFEKrXpDUXV6ngS05MQ8/SarZCiFfLddGv
 Lz8OjOSDWKzkZ4Q23ZuvnhZFY0m7lQXqhoMAf9w=
X-Google-Smtp-Source: ABdhPJyA6kuTkfWlujRx8brAx43ipQCDt8DtX58awA/W35a8tBPBYBzp1vDJDWAWzis1WlZTpKt2D+KVb94UWyNF+kA=
X-Received: by 2002:a17:906:2b9b:: with SMTP id
 m27mr3562492ejg.92.1611909284550; 
 Fri, 29 Jan 2021 00:34:44 -0800 (PST)
MIME-Version: 1.0
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <CAJ+F1CJvJM0Vjdz1nU92H+x00+NdbqfoJ9TA--9-BuQ8SNmoFg@mail.gmail.com>
 <20210129082758.vx6ebmqhk7e332g4@sirius.home.kraxel.org>
In-Reply-To: <20210129082758.vx6ebmqhk7e332g4@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 29 Jan 2021 12:34:32 +0400
Message-ID: <CAJ+F1CKLO=kBZy32e0kgh26K_9nv3c16hBJmKO+tWzr3wqOFNA@mail.gmail.com>
Subject: Re: vnc clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000050ddb705ba05e044"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000050ddb705ba05e044
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Jan 29, 2021 at 12:28 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>
> Well.  That is a completely different level of desktop integration.
> It surely makes sense to have that, and dbus-over-vsock looks like
> a reasonable choice.
>

(using vsock & dbus also goes in the direction where UIs and remote server
can run in different processes and come and go btw)

But I'm more after a solution for the "paste that long link into the
> guest firefox" problem, without putting everything upside-down =F0=9F=98=
=8A
>

In this case, I would say an agent-less text-to-type solution (even with
its very limited scope) is quite attractive.

--=20
Marc-Andr=C3=A9 Lureau

--00000000000050ddb705ba05e044
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jan 29, 2021 at 12:28 PM Gerd Hoffman=
n &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Well.=C2=A0 That is a completely different level of desktop integration.<br=
>
It surely makes sense to have that, and dbus-over-vsock looks like<br>
a reasonable choice.<br>
</blockquote><div><br></div><div>(using vsock &amp; dbus also goes in the d=
irection where UIs and remote server can run in different processes and com=
e and go btw)<br></div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">But I&#39;m more after a solution for the &quot;paste that lon=
g link into the<br>
guest firefox&quot; problem, without putting everything upside-down =F0=9F=
=98=8A<br clear=3D"all"></blockquote><div><br></div><div>In this case, I wo=
uld say an agent-less text-to-type solution (even with its very limited sco=
pe) is quite attractive. <br></div></div><br>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000050ddb705ba05e044--

