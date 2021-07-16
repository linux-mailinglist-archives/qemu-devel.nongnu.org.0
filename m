Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6F63CB3DC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:13:17 +0200 (CEST)
Received: from localhost ([::1]:39936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4IyC-0000ku-Kq
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4Ix5-0007kk-9a
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:12:07 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:35807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4Ix3-0002Wm-BY
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:12:06 -0400
Received: by mail-il1-x132.google.com with SMTP id a11so7540682ilf.2
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4ml+degU7Lvy6bchb1D7fcadhPPoZa3RvEq1b+B2Jnw=;
 b=KdMSr135A0n6qFljpY+tyPbYYbfezKT9V6/EV6sWSBwmSPU/ZhQff8L7VwvzBpBLL+
 4J8UKiG0KOtLulPzONiMwEg921eZ1WKJDXLfLYmYD2P9VKE+egBEb6D6+xZczoufzAFv
 BWMfChqjIW40YCejc5gAm3lEjMBhuUnJh/kHqVXLQzu8GvLE1Z/kB/FY57S2d/C9RkQG
 GrWP+mZQa3REPiIhngKBoh90OHkm5c6N2LZah1+GCKe40ZFtMYESiyk7gemEW4nNQka0
 O9apt25XsSq/KxiJU46SZ2utIGcaNR4chjmsDBhnZh9PFpy3AVKDi/uPVHILzXgzbwWi
 PSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4ml+degU7Lvy6bchb1D7fcadhPPoZa3RvEq1b+B2Jnw=;
 b=rRWT76uxeoiUp8Qm8WgvRQ6GL5iMJTr3YD8g7/MWyr2oql1WWa16XZIGBzx/QLvtig
 hJY/GInBhjBwchUOLKCI98gfcBYQ2qhoNNw/frq80rT/rSljy7GBI5TxHISKZU3GASMx
 IiXEEIsfEpEcB17rdhMz7gBGSA1610g9haTi7mRc/EBq7RrFs5KmOilEPo2G4rsiUOdn
 v5uj9BJEqaMzuQz/Tbplyx/v8fxwJ3N9yMGeLOUOS9TalrJr0szxPFfdtQTbLPnYyXbz
 98Ot9fBjx2W1fHekEj0VYkK+Xs0qfASlW7g/YcZXW71WJlEGoj/7FrGGxacqPJCjeIh6
 9BkQ==
X-Gm-Message-State: AOAM5339ULgiP2HSW/mAxnJtUGXCZUaOXq2LE/B3WlkGPHhoLaRB5JoV
 3tvjcjyGwMBoZcGVAB7b8C2HRpsifokQ4sCeeKLy82pA3IDP8g==
X-Google-Smtp-Source: ABdhPJw/NoUQS5KPA1AWVP1ULsCJKSyH0/2beT12h2ujyrtKqdVV8qQOBjNNGJ3F2dV9aSJpUVoP8GoX2OfqLdXdOqk=
X-Received: by 2002:a05:6e02:d41:: with SMTP id
 h1mr5401628ilj.191.1626423124093; 
 Fri, 16 Jul 2021 01:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210716080345.136784-1-ma.mandourr@gmail.com>
In-Reply-To: <20210716080345.136784-1-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Fri, 16 Jul 2021 10:11:53 +0200
Message-ID: <CAD-LL6g4diFXv-wGwbun28Szi26TnSnLfRJchD5ytCay-bUr6Q@mail.gmail.com>
Subject: Re: [PATCH 0/9] new plugin argument passing scheme
To: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000090f04905c739241c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x132.google.com
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
Cc: "Emilio G. Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000090f04905c739241c
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 16, 2021 at 10:04 AM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Hello,
>
> This series removes passing arguments to plugins through "arg=" since
> it's redundant and reduces readability especially when the argument
> itself is composed of a name and a value.
>
> Also, passing arguments through "arg=" still works but is marked as
> deprecated and will produce a deprecation warning.
>
> Right now, the code for parsing the argument before passing it to the
> plugin is unfortunately not so clean but that's mainly because "arg=" is
> still supported.
>
> At first, considering boolean parameters, those were not special to
> plugins and QEMU did not complain about passing them in the form
> "arg=bool_arg" even though that's considered a short-form boolean, which
> is deprecated. As "arg" is removed, a deprecation warning is issued.
>
> This is mitigated by making plugins aware of boolean arguments and
> parses them through a newly exposed API, namely the `qapi_bool_parse`
> function through a plugin API function. Now plugins expect boolean
> parameters to be passed in the form that other parts of QEMU expect,
> i.e. "bool_arg=[on|true|yes|off|false|no]".
>
> Since we're still supporting "arg=arg_name", there are some assumptions
> that I made that I think are suitable:
>
>     1. "arg=arg_name" will be passed to the plugin as "arg_name=on".
>     2. "arg=on" and "arg" will not be assumed to be the old way of
>         passing args. Instead, it will assume that the argument name is
>         "arg" and it's a boolean parameter. (will be passed to plugin
>         as "arg=on")
>
> The docs are updated accordingly and a deprecation notice is put in the
> deprecated.rst file.
>

Based-on: <20210714172151.8494-1-ma.mandourr@gmail.com>

However, the dependency is so light and it should only be in the patch

    docs/tcg-plugins: new passing parameters scheme for cache docs

where it depends on

    docs/devel/tcg-plugins: added cores arg to cache plugin

in the aforementioned series (conflict lies in the argument "cores=N" only.)


>
> Mahmoud Mandour (9):
>   plugins: allow plugin arguments to be passed directly
>   plugins/api: added a boolean parsing plugin api
>   plugins/hotpages: introduce sortby arg and parsed bool args correctly
>   plugins/hotblocks: Added correct boolean argument parsing
>   plugins/lockstep: make socket path not positional & parse bool arg
>   plugins/hwprofile: adapt to the new plugin arguments scheme
>   plugins/howvec: Adapting to the new argument passing scheme.
>   docs/tcg-plugins: new passing parameters scheme for cache docs
>   docs/deprecated: deprecate passing plugin args through `arg=`
>
>  contrib/plugins/hotblocks.c | 14 +++++++++++--
>  contrib/plugins/hotpages.c  | 30 ++++++++++++++++++----------
>  contrib/plugins/howvec.c    | 24 +++++++++++++++--------
>  contrib/plugins/hwprofile.c | 39 +++++++++++++++++++++++++------------
>  contrib/plugins/lockstep.c  | 31 ++++++++++++++++++++---------
>  docs/devel/tcg-plugins.rst  | 38 ++++++++++++++++++------------------
>  docs/system/deprecated.rst  |  6 ++++++
>  include/qemu/qemu-plugin.h  | 13 +++++++++++++
>  linux-user/main.c           |  2 +-
>  plugins/api.c               |  5 +++++
>  plugins/loader.c            | 24 +++++++++++++++++++----
>  qemu-options.hx             |  9 ++++-----
>  12 files changed, 165 insertions(+), 70 deletions(-)
>
> --
> 2.25.1
>
>

--00000000000090f04905c739241c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 16, 2021 at 10:04 AM Mahm=
oud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hello,<br>
<br>
This series removes passing arguments to plugins through &quot;arg=3D&quot;=
 since<br>
it&#39;s redundant and reduces readability especially when the argument<br>
itself is composed of a name and a value.<br>
<br>
Also, passing arguments through &quot;arg=3D&quot; still works but is marke=
d as<br>
deprecated and will produce a deprecation warning.<br>
<br>
Right now, the code for parsing the argument before passing it to the<br>
plugin is unfortunately not so clean but that&#39;s mainly because &quot;ar=
g=3D&quot; is<br>
still supported.<br>
<br>
At first, considering boolean parameters, those were not special to<br>
plugins and QEMU did not complain about passing them in the form<br>
&quot;arg=3Dbool_arg&quot; even though that&#39;s considered a short-form b=
oolean, which<br>
is deprecated. As &quot;arg&quot; is removed, a deprecation warning is issu=
ed.<br>
<br>
This is mitigated by making plugins aware of boolean arguments and<br>
parses them through a newly exposed API, namely the `qapi_bool_parse`<br>
function through a plugin API function. Now plugins expect boolean<br>
parameters to be passed in the form that other parts of QEMU expect,<br>
i.e. &quot;bool_arg=3D[on|true|yes|off|false|no]&quot;.<br>
<br>
Since we&#39;re still supporting &quot;arg=3Darg_name&quot;, there are some=
 assumptions<br>
that I made that I think are suitable:<br>
<br>
=C2=A0 =C2=A0 1. &quot;arg=3Darg_name&quot; will be passed to the plugin as=
 &quot;arg_name=3Don&quot;.<br>
=C2=A0 =C2=A0 2. &quot;arg=3Don&quot; and &quot;arg&quot; will not be assum=
ed to be the old way of<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 passing args. Instead, it will assume that the =
argument name is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;arg&quot; and it&#39;s a boolean paramete=
r. (will be passed to plugin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 as &quot;arg=3Don&quot;)<br>
<br>
The docs are updated accordingly and a deprecation notice is put in the<br>
deprecated.rst file.<br></blockquote><div><br></div><div>Based-on: &lt;<a h=
ref=3D"mailto:20210714172151.8494-1-ma.mandourr@gmail.com">20210714172151.8=
494-1-ma.mandourr@gmail.com</a>&gt;<div><br></div><div>However, the depende=
ncy is so light and it should only be in the patch</div><div><br></div><div=
>=C2=A0 =C2=A0 docs/tcg-plugins: new passing parameters scheme for cache do=
cs</div><br><div>where it depends on</div><div><br></div><div>=C2=A0 =C2=A0=
 docs/devel/tcg-plugins: added cores arg to cache plugin<br></div><div><br>=
</div><div>in the aforementioned series (conflict lies in the argument &quo=
t;cores=3DN&quot; only.)</div></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Mahmoud Mandour (9):<br>
=C2=A0 plugins: allow plugin arguments to be passed directly<br>
=C2=A0 plugins/api: added a boolean parsing plugin api<br>
=C2=A0 plugins/hotpages: introduce sortby arg and parsed bool args correctl=
y<br>
=C2=A0 plugins/hotblocks: Added correct boolean argument parsing<br>
=C2=A0 plugins/lockstep: make socket path not positional &amp; parse bool a=
rg<br>
=C2=A0 plugins/hwprofile: adapt to the new plugin arguments scheme<br>
=C2=A0 plugins/howvec: Adapting to the new argument passing scheme.<br>
=C2=A0 docs/tcg-plugins: new passing parameters scheme for cache docs<br>
=C2=A0 docs/deprecated: deprecate passing plugin args through `arg=3D`<br>
<br>
=C2=A0contrib/plugins/hotblocks.c | 14 +++++++++++--<br>
=C2=A0contrib/plugins/hotpages.c=C2=A0 | 30 ++++++++++++++++++----------<br=
>
=C2=A0contrib/plugins/howvec.c=C2=A0 =C2=A0 | 24 +++++++++++++++--------<br=
>
=C2=A0contrib/plugins/hwprofile.c | 39 +++++++++++++++++++++++++-----------=
-<br>
=C2=A0contrib/plugins/lockstep.c=C2=A0 | 31 ++++++++++++++++++++---------<b=
r>
=C2=A0docs/devel/tcg-plugins.rst=C2=A0 | 38 ++++++++++++++++++-------------=
-----<br>
=C2=A0docs/system/deprecated.rst=C2=A0 |=C2=A0 6 ++++++<br>
=C2=A0include/qemu/qemu-plugin.h=C2=A0 | 13 +++++++++++++<br>
=C2=A0linux-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
=C2=A0plugins/api.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 5 +++++<br>
=C2=A0plugins/loader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 ++++++=
+++++++++++++----<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 9 ++++-----<br>
=C2=A012 files changed, 165 insertions(+), 70 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000090f04905c739241c--

