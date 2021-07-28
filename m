Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE033D9250
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 17:48:56 +0200 (CEST)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8lnj-0000UO-Cq
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 11:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m8lmW-0008Cn-QY
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:47:40 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1m8lmV-000457-28
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 11:47:40 -0400
Received: by mail-ej1-x634.google.com with SMTP id o5so5379356ejy.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 08:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vqpey9WUEYseUMSpCNWTH8ljoVXhnrvf3elIMPS0jIE=;
 b=j82CZ8kaesChT0ZqH8zK+iTCYZS6BmspCJwVCU8yu51ggsQfSUQDqumYCuF0Yx5Bx8
 e2vdtrBm04cH1M4iVi4Xdu2IFuTG3skQI0JwuhY56pMzc3VwRqWDNzn5qSoHhuvTgIyL
 HWWbsMZCngAxwH7hU4W5du0B3t3fUEUVMhnGFTfAS2c2RO/t78Lbh+PITQXQ9LppXfEV
 F8ekme/o6D3yXChinq395ECyQkoUHzqauYPN7HrLRiyswYHU5L9nNbqyUZmd1LFJ7nlP
 a1zWN2QZBEO86lJV4VN7KzW+jdMlcK+ADca2X+4MMKsO8Kmu0IsGecnZ+tg7CO+h8yS3
 /YdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vqpey9WUEYseUMSpCNWTH8ljoVXhnrvf3elIMPS0jIE=;
 b=jgg5UF84A3hP1Szl724txstCfOLpjh/Yc8jF0DOIIUtCI8rFdwDC7GUipvd3cAbGca
 8X3zRxtpZKDnOkARM8oo//+++3dVBuUXKAIBL3f2TFyIEqWaQeBmYrmMjnoHg1pNguIW
 p2ZSYGy1RH1ETTMOkAYSDzXbBzOlrI34jAmspNmpt/8ZgRaTEO+Usle1D6rEA+DWsOLU
 T0q8IxTFoEYH3u/los52rS3BTrOK2NWKtIzUxMt192FpqhoBfVZU4XjNGqs9eCnD1OQV
 A1Pz8KJ4IXo7j8rIYhQD/DdicomV8KXXDCmNh8+rtJ5VpOUThDym1bCpR8Mo0+QWIniH
 L80g==
X-Gm-Message-State: AOAM5303lE8H7A7ZZloC2OotztC0nutNpVCXxtus/Ah0L7FtGtdLrHAo
 rxWpct3tsFERdJ7L9FsXELkcLuK1R39Qe0+01Rs=
X-Google-Smtp-Source: ABdhPJwmnp7A97S+wD9MCzpfu6+2hpDPsq4Z5RD2XFFccFsRF+pWZ0gHUOiOBwdF3h/kM+dxKFNl+l+XZkMc1aX0gn8=
X-Received: by 2002:a17:906:ae91:: with SMTP id
 md17mr118803ejb.105.1627487256955; 
 Wed, 28 Jul 2021 08:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
In-Reply-To: <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 28 Jul 2021 19:47:25 +0400
Message-ID: <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d3cf4b05c830e7fd"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d3cf4b05c830e7fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 28, 2021 at 7:23 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 28 Jul 2021 at 11:51, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The following changes since commit
> a2376507f615495b1d16685449ce0ea78c2caf9d:
> >
> >   Merge remote-tracking branch
> 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-24
> 11:04:57 +0100)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:elmarco/qemu.git tags/libslirp-pull-request
> >
> > for you to fetch changes up to 565301284e83fd5f12024a4e7959895380491668=
:
> >
> >   Update libslirp to v4.6.1 (2021-07-28 13:11:11 +0400)
> >
> > ----------------------------------------------------------------
> > Update libslirp
> >
> > Hi,
> >
> > Let's update libslirp to 4.6.1, with its various fixes.
> >
>
> Fails to build, OSX, when linking the qemu-system-* executables:
>
> Undefined symbols for architecture x86_64:
>   "_res_9_getservers", referenced from:
>       _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.c.o)
>   "_res_9_nclose", referenced from:
>       _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.c.o)
>   "_res_9_ninit", referenced from:
>       _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.c.o)
> ld: symbol(s) not found for architecture x86_64
> clang: error: linker command failed with exit code 1 (use -v to see
> invocation)
>
> -- PMM
>
>
Argh.. that's because we don't use it properly as a submodule, and libslirp
must link with 'resolv' on macos now.

I wish my previous pull request with the submodule change would receive
more help or attention, as I either couldn't reproduce the failure (neither
CI) or it was just some one-time warnings due to the transition...



--=20
Marc-Andr=C3=A9 Lureau

--000000000000d3cf4b05c830e7fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 28, 2021 at 7:23 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, 28 Jul 2021 at 11:51, &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; The following changes since commit a2376507f615495b1d16685449ce0ea78c2=
caf9d:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/bonzini-gitlab/t=
ags/for-upstream&#39; into staging (2021-07-24 11:04:57 +0100)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git@github.com:elmarco/qemu.git tags/libslirp-pull-request=
<br>
&gt;<br>
&gt; for you to fetch changes up to 565301284e83fd5f12024a4e795989538049166=
8:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Update libslirp to v4.6.1 (2021-07-28 13:11:11 +0400)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Update libslirp<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; Let&#39;s update libslirp to 4.6.1, with its various fixes.<br>
&gt;<br>
<br>
Fails to build, OSX, when linking the qemu-system-* executables:<br>
<br>
Undefined symbols for architecture x86_64:<br>
=C2=A0 &quot;_res_9_getservers&quot;, referenced from:<br>
=C2=A0 =C2=A0 =C2=A0 _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.=
c.o)<br>
=C2=A0 &quot;_res_9_nclose&quot;, referenced from:<br>
=C2=A0 =C2=A0 =C2=A0 _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.=
c.o)<br>
=C2=A0 &quot;_res_9_ninit&quot;, referenced from:<br>
=C2=A0 =C2=A0 =C2=A0 _get_dns_addr_libresolv in libslirp.a(slirp_src_slirp.=
c.o)<br>
ld: symbol(s) not found for architecture x86_64<br>
clang: error: linker command failed with exit code 1 (use -v to see invocat=
ion)<br>
<br>
-- PMM<br>
<br>
</blockquote></div><div><br></div><div>Argh.. that&#39;s because we don&#39=
;t use it properly as a submodule, and libslirp must link with &#39;resolv&=
#39; on macos now.</div><div><br></div><div>I wish my previous pull request=
 with the submodule change would receive more help or attention, as I eithe=
r couldn&#39;t reproduce the failure (neither CI) or it was just some one-t=
ime warnings due to the transition...<br></div><div><br></div><div><br></di=
v><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lur=
eau<br></div></div>

--000000000000d3cf4b05c830e7fd--

