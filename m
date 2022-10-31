Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D7F6137BA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:20:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUhM-0001mv-Th; Mon, 31 Oct 2022 09:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1opUhJ-0001Xu-Aq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:25 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1opUhH-00054Y-2o
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:25 -0400
Received: by mail-ej1-x62a.google.com with SMTP id n12so29246284eja.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AYoKJ2WBYFk9t+igStnXmoTH4kiWguIRoIsV2tY1uOY=;
 b=jqcDUJr8dGW1ErNp1WVfNxnfAIa/y/y554P5BZ+IwVSDLH/VRN+ZYtFUzTgkPyR3NN
 fHO1oSZK1/LNoTc5QsvJ6yWuXp0vCDDokNV40sqDum5EfZENy/7fREMd3CIJSksqJ9CQ
 MGCL0RNwT6MmqSjQnY2AtJ49Yrp0fZR0pRO/01cXfTjJ7bp3EvJXgxRF5PiV8iY2s1ht
 bhtD2cstRMhDRwCzejEzF9esQqH5PnIuHc9IKawofQKA65Yt7gjAAqlOHj77NnZ3r9pW
 oUgudWQhaRdqtXjF+35IUgAoQ8DEx2BvWAYkIBvL/I6rEBN1JJlE9gfi266K7WwVbGcc
 /9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AYoKJ2WBYFk9t+igStnXmoTH4kiWguIRoIsV2tY1uOY=;
 b=ihUURqd6Ss3tkl3UdlZ1LPPuG6I7xjdQa2pWRWCE3LqDa7uNTCcFBHD3Yk/8iARiue
 CMNU4ciB5K1l9T2sGkDUvtLW0nUGBPmk88li86xlQ+BoFRQgiVRuXoNd/bbR//pLHHg/
 5BXz8l4NJYjqt+olx4RDQcJ6ELGvI6dflqa2FxaZ4dEAnnw1CX6GBANDIVNgbFNjtiCq
 ZCvbDhdlg28XwcRjhKdtDzGA7iFteDTmLLeav76rn5pv1JAwH9b7Hd0Tcv9NgRgEp1Ad
 Vybt8fej3QCyduLtDarM9PEk9qjp6aLRGAWqxqJaWJgMcaM+gVpziJoo/QoWu/AEsa3w
 /smw==
X-Gm-Message-State: ACrzQf0c0rT0AMfmMuscxbt9W4WwDKsuy8dCLv3MLkbwN6nZArtHgkbL
 6eKuAdw62qUSdKc0RAT4drOhhJQRa1NbnSAi87Rgpg==
X-Google-Smtp-Source: AMsMyM6aLXPlgTTlTsPwFIn8al1qT/K5JCvU0VOB9eVQbrA7QN97ImTYK/O/aoVP6eVEX3ZlgftefhomRktep1boWUk=
X-Received: by 2002:a17:906:5dcc:b0:78d:e76a:ef23 with SMTP id
 p12-20020a1709065dcc00b0078de76aef23mr12442549ejv.317.1667222360340; Mon, 31
 Oct 2022 06:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221028174546.88683-1-imp@bsdimp.com>
 <CAJSP0QUbek3kWrWbWMoqKcQspL94vK9Xy7jFqmihGD86_pV-tw@mail.gmail.com>
In-Reply-To: <CAJSP0QUbek3kWrWbWMoqKcQspL94vK9Xy7jFqmihGD86_pV-tw@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 31 Oct 2022 07:19:08 -0600
Message-ID: <CANCZdfr_gPtznH+5HfWoz-01K-2mOzKsUiGdVPBFDMry01xWFQ@mail.gmail.com>
Subject: Re: [PULL 0/1] Imp 202210 patches
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>
Content-Type: multipart/alternative; boundary="0000000000008ccd9705ec5474f5"
Received-SPF: none client-ip=2a00:1450:4864:20::62a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000008ccd9705ec5474f5
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 31, 2022, 4:34 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Fri, 28 Oct 2022 at 13:46, Warner Losh <imp@bsdimp.com> wrote:
> >
> > The following changes since commit
> 344744e148e6e865f5a57e745b02a87e5ea534ad:
> >
> >   Merge tag 'dump-pull-request' of
> https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26
> 10:53:49 -0400)
> >
> > are available in the Git repository at:
> >
> >   ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git
> tags/imp-202210-pull-request
>
> Hi Warner,
> Please use https://github.com/qemu-bsd-user/qemu-bsd-user.git instead
> of an ssh URL. That way anonymous fetching works for people without
> GitHub accounts. Thanks!
>


Will do in the future. It's trivial to convert. Do I need to resubmit this
pull request for something so trivial?

Warner

> Stefan
>

--0000000000008ccd9705ec5474f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Oct 31, 2022, 4:34 AM Stefan Hajnoczi &lt;<a h=
ref=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Fri, 28 Oct 2022 at 13:46, Warner Losh =
&lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_blank" rel=3D"noreferrer">=
imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea=
534ad:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge tag &#39;dump-pull-request&#39; of <a href=3D"https:=
//gitlab.com/marcandre.lureau/qemu" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://gitlab.com/marcandre.lureau/qemu</a> into staging (2022-10=
-26 10:53:49 -0400)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0ssh://<a href=3D"http://git@github.com/qemu-bsd-user/qemu-=
bsd-user.git" rel=3D"noreferrer noreferrer" target=3D"_blank">git@github.co=
m/qemu-bsd-user/qemu-bsd-user.git</a> tags/imp-202210-pull-request<br>
<br>
Hi Warner,<br>
Please use <a href=3D"https://github.com/qemu-bsd-user/qemu-bsd-user.git" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/qemu-bsd-=
user/qemu-bsd-user.git</a> instead<br>
of an ssh URL. That way anonymous fetching works for people without<br>
GitHub accounts. Thanks!<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Will do in the future. =
It&#39;s trivial to convert. Do I need to resubmit this pull request for so=
mething so trivial?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Warn=
er=C2=A0</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
Stefan<br>
</blockquote></div></div></div>

--0000000000008ccd9705ec5474f5--

