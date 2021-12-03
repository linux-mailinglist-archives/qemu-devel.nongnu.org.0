Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CE24680EC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 00:49:19 +0100 (CET)
Received: from localhost ([::1]:50602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtIIo-0001sW-9k
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 18:49:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mtIGd-0000Qr-Gf
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:47:03 -0500
Received: from [2607:f8b0:4864:20::92f] (port=36448
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mtIGQ-00083x-DZ
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 18:47:03 -0500
Received: by mail-ua1-x92f.google.com with SMTP id r15so8495109uao.3
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 15:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VsD6PxrpYb0Oao+gThxOAEHy93/acGf6zptL8kRc6hc=;
 b=eBigLyocWOy7YSQ7cFiytO3Gi/1/xtMxTNo7v34k/LP8yo9Z4gudNjQj/6H52FDrrK
 3Xq1wBtugEa6xWn/XawOo6UBGd6RfcxgD/0pIs7uEKA/DACbQk6zpS0ahyrHwbwbuN3y
 maUDNfPaWFWQNm2qEukvuyYfZM0VuuinS/dwlJH/FOoqmUnqo3AgYFp4icnYFvgnRB29
 PtFFcGFMUBm+OmtrzJ0vbSg0gpmJSU5KlZGoUaJ6pyVwd8of4UlSp0YeWBc2JsQTEto5
 xwuUVMfWbLnSaQDbg8LClFG8tAmtIEv30f03FVVw9thkgZUmTiWIPltGh7v1upG02a03
 Njow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VsD6PxrpYb0Oao+gThxOAEHy93/acGf6zptL8kRc6hc=;
 b=0TDwXtqNl6QabbWK8YBEKKZrx3co/5UiZItIWeALit29/CIvCOk3ZcpjdA66fLpx5a
 O8qxYtwZf/aWhMtfYAY2m3HMO3BlzVH1UMNIQLHvgkgvrxHWCpags9va5HvjGU+m/SMW
 t27oVvXjQS5vE+xkr7WnycGUjKPMs2gjed9TXb4bYDrZYi9EG5joPr8TjduEp0PDVG/x
 015hwL4oncfxebjZaeQAsMh1MIB18xhq2cgu/HHlxoI+YLMu3wQPTwbzuChDS3v+iXgC
 c9IhgbNLng78lE58OzTEme/qrCqdEZ6iPaXBezVHQKp4CS75fcmX9x450TnVwHBFBjYp
 CAmA==
X-Gm-Message-State: AOAM533gFi2WdoH+JS7LvzRWFiprm8WtumNHSbhYVG3zNzDOxhIgcOnN
 okYOqEm2VQf99xVRaja8BqA+5J7VRc8SWY8Bz/doPc5Ke3ahKA==
X-Google-Smtp-Source: ABdhPJwXuF5+XD6VRmDmPGyhh339rq5VKmnejH9Af7323JajK/4nlm7oU1sYRZ6NNbdIArC7QvGBBqw5jddYLcIMSgc=
X-Received: by 2002:a67:f950:: with SMTP id u16mr25096922vsq.68.1638575208516; 
 Fri, 03 Dec 2021 15:46:48 -0800 (PST)
MIME-Version: 1.0
References: <20211127201846.64187-1-imp@bsdimp.com>
In-Reply-To: <20211127201846.64187-1-imp@bsdimp.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 3 Dec 2021 16:46:37 -0700
Message-ID: <CANCZdfpUYJZHfSZCZrk05U3K=gUM8gudFDEHjm3xhZU5bX0ztw@mail.gmail.com>
Subject: Re: [PATCH for 7.0 0/5] bsd-user-smoke: A simple smoke test for
 bsd-user
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000003de14605d24685bf"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Konrad Witaszczyk <def@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Gleb Popov <arrowd@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003de14605d24685bf
Content-Type: text/plain; charset="UTF-8"

PING!

If anybody (especially the BSD reviewers) could look at these, that would
be great!

It's been suggested I rename bsd-user-smoke to just be bsd-user and we put
our tests there until we can switch to the more generic tcg tests, so I'll
do that and resend in a few days.

Warner

On Sat, Nov 27, 2021 at 1:19 PM Warner Losh <imp@bsdimp.com> wrote:

> This series adds a number of simple binaries that FreeBSD's clang can
> build on
> any system. I've kept it simple so that there's no extra binaries that
> need to
> be installed. Given the current state of bsd-user in the project's repo,
> this
> likely is as extensive a set of tests that should be done right now. We
> can load
> static binaries only (so these are static binaries) and hello world is the
> canonical test. I have binaries for all the supported FreeBSD targets, but
> have
> included only the ones that are in upstream (or in review) at this time.
>
> In the future, I'll integreate with the tcg tests when there's more in
> upstream
> they can test.  Since that requires putting together FreeBSD sysroots for
> all
> the supported architectures for multiple versions, I'm going to delay that
> for a
> while. I'll also integrate FreeBSD's 5k system tests when we're much
> further
> along with the upstreaming.
>
> The purpose of this is to give others doing changes in this area a
> standardized
> way to ensure their changes don't fundamentally break bsd-user. This
> approach
> will work for all setups that do a 'make check' to do their testing.
>
> Based-on: 20211108035136.43687-1-imp@bsdimp.com
>
> Warner Losh (5):
>   h.armv7: Simple hello-world test for armv7
>   h.i386: Simple hello-world test for i386
>   h.amd64: Simple hello-world test for x86_64
>   smoke-bsd-user: A test script to run all the FreeBSD binaries
>   bsd-user-smoke: Add to build
>
>  tests/bsd-user-smoke/h.amd64.S      | 28 +++++++++++++++++++++
>  tests/bsd-user-smoke/h.armv7.S      | 37 +++++++++++++++++++++++++++
>  tests/bsd-user-smoke/h.i386.S       | 39 +++++++++++++++++++++++++++++
>  tests/bsd-user-smoke/meson.build    | 31 +++++++++++++++++++++++
>  tests/bsd-user-smoke/smoke-bsd-user | 22 ++++++++++++++++
>  tests/meson.build                   |  1 +
>  6 files changed, 158 insertions(+)
>  create mode 100644 tests/bsd-user-smoke/h.amd64.S
>  create mode 100644 tests/bsd-user-smoke/h.armv7.S
>  create mode 100644 tests/bsd-user-smoke/h.i386.S
>  create mode 100644 tests/bsd-user-smoke/meson.build
>  create mode 100644 tests/bsd-user-smoke/smoke-bsd-user
>
> --
> 2.33.0
>
>

--0000000000003de14605d24685bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">PING!<div><br></div><div>If anybody (especially the BSD re=
viewers) could look at these, that would be great!</div><div><br></div><div=
>It&#39;s been suggested I rename bsd-user-smoke to just be bsd-user and we=
 put our tests there until we can switch to the more generic tcg tests, so =
I&#39;ll do that and resend in a few days.</div><div><br></div><div>Warner<=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sat, Nov 27, 2021 at 1:19 PM Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">This series adds a number of simple binaries that=
 FreeBSD&#39;s clang can build on<br>
any system. I&#39;ve kept it simple so that there&#39;s no extra binaries t=
hat need to<br>
be installed. Given the current state of bsd-user in the project&#39;s repo=
, this<br>
likely is as extensive a set of tests that should be done right now. We can=
 load<br>
static binaries only (so these are static binaries) and hello world is the<=
br>
canonical test. I have binaries for all the supported FreeBSD targets, but =
have<br>
included only the ones that are in upstream (or in review) at this time.<br=
>
<br>
In the future, I&#39;ll integreate with the tcg tests when there&#39;s more=
 in upstream<br>
they can test.=C2=A0 Since that requires putting together FreeBSD sysroots =
for all<br>
the supported architectures for multiple versions, I&#39;m going to delay t=
hat for a<br>
while. I&#39;ll also integrate FreeBSD&#39;s 5k system tests when we&#39;re=
 much further<br>
along with the upstreaming.<br>
<br>
The purpose of this is to give others doing changes in this area a standard=
ized<br>
way to ensure their changes don&#39;t fundamentally break bsd-user. This ap=
proach<br>
will work for all setups that do a &#39;make check&#39; to do their testing=
.<br>
<br>
Based-on: <a href=3D"mailto:20211108035136.43687-1-imp@bsdimp.com" target=
=3D"_blank">20211108035136.43687-1-imp@bsdimp.com</a><br>
<br>
Warner Losh (5):<br>
=C2=A0 h.armv7: Simple hello-world test for armv7<br>
=C2=A0 h.i386: Simple hello-world test for i386<br>
=C2=A0 h.amd64: Simple hello-world test for x86_64<br>
=C2=A0 smoke-bsd-user: A test script to run all the FreeBSD binaries<br>
=C2=A0 bsd-user-smoke: Add to build<br>
<br>
=C2=A0tests/bsd-user-smoke/h.amd64.S=C2=A0 =C2=A0 =C2=A0 | 28 +++++++++++++=
++++++++<br>
=C2=A0tests/bsd-user-smoke/h.armv7.S=C2=A0 =C2=A0 =C2=A0 | 37 +++++++++++++=
++++++++++++++<br>
=C2=A0tests/bsd-user-smoke/h.i386.S=C2=A0 =C2=A0 =C2=A0 =C2=A0| 39 ++++++++=
+++++++++++++++++++++<br>
=C2=A0tests/bsd-user-smoke/meson.build=C2=A0 =C2=A0 | 31 ++++++++++++++++++=
+++++<br>
=C2=A0tests/bsd-user-smoke/smoke-bsd-user | 22 ++++++++++++++++<br>
=C2=A0tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A06 files changed, 158 insertions(+)<br>
=C2=A0create mode 100644 tests/bsd-user-smoke/h.amd64.S<br>
=C2=A0create mode 100644 tests/bsd-user-smoke/h.armv7.S<br>
=C2=A0create mode 100644 tests/bsd-user-smoke/h.i386.S<br>
=C2=A0create mode 100644 tests/bsd-user-smoke/meson.build<br>
=C2=A0create mode 100644 tests/bsd-user-smoke/smoke-bsd-user<br>
<br>
-- <br>
2.33.0<br>
<br>
</blockquote></div>

--0000000000003de14605d24685bf--

