Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EF851990C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:58:32 +0200 (CEST)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9u3-0000Vm-E0
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nm9di-0002oq-2R; Wed, 04 May 2022 03:41:38 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nm9dg-0007VW-Do; Wed, 04 May 2022 03:41:37 -0400
Received: by mail-lj1-x232.google.com with SMTP id q14so622269ljc.12;
 Wed, 04 May 2022 00:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4l5c1TagE86iLy8NoyKuu9R0AyoGb91AHPjuctgeggU=;
 b=Rf0GVfwUtoBtFgwTtNerR8dMSNlNw2ykYbV/hlCRZNilCJWOPRvtOHyz+gFsLz1L8o
 N9Amxth9oope9XHC/PB8ZtahRtp4+TuqFqtDiQ7ozQ6iWcHywavnH4jsezeHTPcIv9QY
 32KKeO176OW411MIxXoEirzzwx0w+s637FBvNYUA//4Yj5+3qsimLM+n++9WeKEpO/YR
 T77EMt6b73KCet5aBIxg44wLYgejwNxcntXmg3weBNxJyrsrRzhUwlxfWkFqedJ4NYWc
 ZZqYZ4k2weR4WaQKhyfGBR5H9yr2AoOTTv1OLORRUoNw5xPUPgoGV74H7e8VZhVNt0x+
 NOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4l5c1TagE86iLy8NoyKuu9R0AyoGb91AHPjuctgeggU=;
 b=d0x73+/pf2xp0RqEYu45WHupvCvxZs7V99j2D/BZ/W9IgS/5JwpwR6uKouJpFRZmFV
 HBqzQifcykFRltrgTqVSZQZYg1yOXGHHlBnpSPHu9Q23xfbXQW77HlAahzF6QdlshTBl
 Osrh7jm9/Xv9cV0+kqgyU5cZIZ3cGScf6/iTrqIt8QZpR/dLeaBDMfcHx8XykB/uyNGk
 BXS91JTufuNqnEOWxjfmp1W1kSNiIYyWTpxww6GN9a/OyyPQ/IBs5oLLfLGyV2Dx40ow
 Vdcb+qo+aO+jN9eCXT6a5GkJVMCxdmBMa9ab/X0kQSlCCbCcUNGHGm256LGiQPjOfMKW
 NWDw==
X-Gm-Message-State: AOAM531vLE5NNAaZCDJACO5MBlT7YK9me4xxUA6xBKGvJtMWyJiA8czT
 bWT4X5A0XDyPB7QHauXRSfoCEZy3VVW+ePw+smM=
X-Google-Smtp-Source: ABdhPJyuCaPIEN9SeFh0klTOzYqsphXXPc8RPqG3SrRMtvb6dXMkD7Nnxob/SATakEy4q0KuGuOawrvLefBaYX/xKOg=
X-Received: by 2002:a2e:b0d7:0:b0:24f:1300:df37 with SMTP id
 g23-20020a2eb0d7000000b0024f1300df37mr11851416ljl.507.1651650093426; Wed, 04
 May 2022 00:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220503200524.1868-1-luoyonggang@gmail.com>
In-Reply-To: <20220503200524.1868-1-luoyonggang@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 4 May 2022 11:41:21 +0400
Message-ID: <CAJ+F1CLhE5LFVv6ZHV-=Bek3xO-3wV-ovFUAsRnJYYmgwjOQvw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Upgrade mingw base packages
To: Yonggang Luo <luoyonggang@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 qemu trival <qemu-trivial@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000001caaff05de2ac163"
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001caaff05de2ac163
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 4, 2022 at 1:19 AM Yonggang Luo <luoyonggang@gmail.com> wrote:

> v1. upgrade both cirrus and gitlab-ci to the newest mingw base release
>
> Yonggang Luo (2):
>   cirrus/win32: upgrade mingw base packages
>   gitlab-ci: Upgrade mingw base package.
>

lgtm,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

It would help though to have some rationale for the change. Unfortunately,
the installer news/changelog leaves a lot to be desired:
https://github.com/msys2/msys2-installer/releases.

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001caaff05de2ac163
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 4, 2022 at 1:19 AM Yong=
gang Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
v1. upgrade both cirrus and gitlab-ci to the newest mingw base release<br>
<br>
Yonggang Luo (2):<br>
=C2=A0 cirrus/win32: upgrade mingw base packages<br>
=C2=A0 gitlab-ci: Upgrade mingw base package.<br></blockquote><div><br></di=
v><div>lgtm,<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=
=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=
</div><div>=C2=A0</div><div>It would help though to have some rationale for=
 the change. Unfortunately, the installer news/changelog leaves a lot to be=
 desired: <a href=3D"https://github.com/msys2/msys2-installer/releases">htt=
ps://github.com/msys2/msys2-installer/releases</a>.</div></div><br>-- <br><=
div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div><=
/div>

--0000000000001caaff05de2ac163--

