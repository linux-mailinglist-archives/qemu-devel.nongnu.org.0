Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DDB3DDFCF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 21:05:17 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAdFU-0003er-OH
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 15:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAd91-00033w-1H
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:58:36 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mAd8y-0004Yt-8w
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 14:58:34 -0400
Received: by mail-ed1-x530.google.com with SMTP id z11so3444711edb.11
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 11:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GKAwZJCEsxAmNxESvhGYUWdVuf07i9K9CkQvJU3JW30=;
 b=f6GJzuBnalflypQbTUGJwFvZjYKYx7cY7ofw9M7P8BeXrHazOEaL3dlLPNdRWodnNC
 NHQUj42a4ZmrOToxe9D42FTJZyuFwXTiNnghlIqyzBlimhIZkgpv3+/vI5IXPpPfhIpf
 TWnIETGZCAsT10rt2AxiWjcDhwEuPwq3H48X7fjUgzsjhmzbd9yy3qK/rBXjgtjZS359
 qGtEBVURR23k8WL4H9YuX2Dw4YsFmhj2utHzs8+nZeXuNzLvkCY1gm+nF+1HqiHXxvb2
 keJcTDdW+NrGQGLUIko1xngQZNrfw0VQSNBNH6tj1//UXRRSHoto3cFT5CKH2Zrmj3S8
 /CvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GKAwZJCEsxAmNxESvhGYUWdVuf07i9K9CkQvJU3JW30=;
 b=tmKxipyEN+reGy/1kA8/l3NpNvHmti4Nrkm938g85v0fWjEYASzXjJ7LgrHGUc+0Y3
 +RBmqRzQomqPeWimu7qDM/uN1t/Lznr7meXN66cBWtI461ehBuioZL1w1gZFuz1cEITt
 dGbmJ+dW3OV+mOWL4Mflu3q/veDuRc3t4RJdWe/nuEJ77ez1OAeCq2OEdj6cCKAQtGhi
 AJ4x9Pk304PDvbn0MJqRzLLRFz6W0AS7lLRgG9oe2HsSYt2KBhbgFsEgAQyJqGHPGxIY
 MhQlnYUhwNt9MU9KYyBOne2K4yl8epVcTzW7Xx4kIN8umI9HpCZZ2MYYEANx5c52eRxi
 BF4w==
X-Gm-Message-State: AOAM5326j1oMvpIUEKjIKf4abUFIxPRD0NouVFR+vPa4JnrB27v7lMtd
 znS5krlISX2sw0jneK6m0BTuSX50vKSjVYpLg+0=
X-Google-Smtp-Source: ABdhPJzQ5wSA1KZbkBuTmL2raZ/5WhUG4u0kXfqpsZXK8j06obCR7ykfbewBXYgaNaXscppdIN75hWDH+eWTlQgYlfI=
X-Received: by 2002:a50:a6d7:: with SMTP id f23mr21171484edc.164.1627930710658; 
 Mon, 02 Aug 2021 11:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210728105133.2557239-1-marcandre.lureau@redhat.com>
 <CAFEAcA_L==a3+sp3smMCD1SBPkXQFavvJRzeK7Bd05Tf_DEZzw@mail.gmail.com>
 <CAJ+F1CKkx3JbL3Xw3CAzF7B7r6Nj=Cyn32tZcVZeY9V=uSq7sQ@mail.gmail.com>
 <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8R0yKvM40HmoTOmr_YEvq0kFOPFOzWwHN=4oFc-vLL=Q@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 2 Aug 2021 22:58:17 +0400
Message-ID: <CAJ+F1CK3OV8fHL2XGCxTPv8AotDHUzrcoe9JoE=5gKLnskw6Eg@mail.gmail.com>
Subject: Re: [PULL 0/1] Libslirp update
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ba525005c8982712"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x530.google.com
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

--000000000000ba525005c8982712
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter

On Sun, Aug 1, 2021 at 4:10 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 28 Jul 2021 at 16:47, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> > I wish my previous pull request with the submodule change would
> > receive more help or attention, as I either couldn't reproduce the
> > failure (neither CI) or it was just some one-time warnings due to the
> > transition...
>
> Well, I reported the failures back to you. I can't do a lot more,
> because libslirp development is now much more opaque to me because
> it doesn't happen in-tree. So instead of "some small change happens and
> we pick up issues with it early", you have to deal with all of
> the accumulated problems at once when you update the submodule :-(
>
> rc2 is on Tuesday, so we're starting to run short on time to
> get an updated slirp in for 6.1.
>
>
Do you mind checking the https://github.com/elmarco/qemu/tree/libslirp
branch?

From https://mail.gnu.org/archive/html/qemu-devel/2021-06/msg00031.html,
there would still be the one-time warnings from git, but osx and dist error
should be gone.

Only one left as a mystery is the Ubuntu-ASAN link issue.

thanks!

--=20
Marc-Andr=C3=A9 Lureau

--000000000000ba525005c8982712
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 1, 2021 at 4:10 P=
M Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.mayde=
ll@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Wed, 28 Jul 2021 at 16:47, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt; I wish my previous pull request with the submodule change would<br>
&gt; receive more help or attention, as I either couldn&#39;t reproduce the=
<br>
&gt; failure (neither CI) or it was just some one-time warnings due to the<=
br>
&gt; transition...<br>
<br>
Well, I reported the failures back to you. I can&#39;t do a lot more,<br>
because libslirp development is now much more opaque to me because<br>
it doesn&#39;t happen in-tree. So instead of &quot;some small change happen=
s and<br>
we pick up issues with it early&quot;, you have to deal with all of<br>
the accumulated problems at once when you update the submodule :-(<br>
<br>
rc2 is on Tuesday, so we&#39;re starting to run short on time to<br>
get an updated slirp in for 6.1.<br>
<br></blockquote><div><br></div><div>Do you mind checking the <a href=3D"ht=
tps://github.com/elmarco/qemu/tree/libslirp">https://github.com/elmarco/qem=
u/tree/libslirp</a> branch?</div><div><br></div><div>From <a href=3D"https:=
//mail.gnu.org/archive/html/qemu-devel/2021-06/msg00031.html">https://mail.=
gnu.org/archive/html/qemu-devel/2021-06/msg00031.html</a>, there would stil=
l be the one-time warnings from git, but osx and dist error should be gone.=
</div><div><br></div><div>Only one left as a mystery is the Ubuntu-ASAN lin=
k issue.<br></div><div>=C2=A0</div><div>thanks!</div><div><br></div></div>-=
- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br>=
</div></div>

--000000000000ba525005c8982712--

