Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C93D3727
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:58:11 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6r0U-0002lN-Hn
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6qzd-0001tZ-Cg
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:57:17 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:40536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6qzb-0007Qf-FQ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:57:17 -0400
Received: by mail-il1-x136.google.com with SMTP id d10so890133ils.7
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 01:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JooSUbxPqY4sLF4byQL/rzI+jHqNpkj7+DUyF9gRBS0=;
 b=L0KpOyak0ySQ/UkPtyu/iURQtB1Wm330Y4OJuoQgUvBn+SIdXJ0BOE42UIEb50blBw
 BJNS1QYwhqOXLEkEgPeplHcUgJu1isOyT+dGYzoUqO/qb/UQaXy1lDL1FVVZOEctIZ/0
 ppUKP+hDc/2+uxbv9I5q6tjGeNOmOAUJ66XEXxEALoLhlj2VqB19e4b2s/r8ef6qss60
 boG2UnEiBovn3OK55NcVhd1sPxEo4YxC2PRj0gDcMV1DQuetsrWhC08p2HGfwKHYXU0M
 TTRiRztfmYqpce0M/Ft8pYfzHCREAmZn0IzXCF2nWg4mhe3YB0hr5uTocfMelKVlLGgD
 3jPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JooSUbxPqY4sLF4byQL/rzI+jHqNpkj7+DUyF9gRBS0=;
 b=UXClJXEy20175Q+4zlJpkP+a5rBpZZIrkkpO57OwnjRehTAu7c7eXx4ed6hie8/Tgt
 lQESCQtrMHq637ilLuxc/+37VZzDNTOBWlqWBIP9pO4JjL4SuWrYjC8OUru9/pdzDfDC
 pPsEH3tYAzjZFcuYYLoLfQDF6FJflxNm3woXV6m8ma4G4OO3aQvWYkx+wnBY6IMyNQNO
 f6TFCiN9+qYl9z+JGwcqZMR7l9ripVphgj9qZdBxO3yeS0Cgi2zFMKvr6Xwev7En2Vfb
 tDVJz/9vvHJ7dvhWn0IzMfS1z0Jy89WEcnUz+jwTCP7nBn2Ojeqzik7eeYoXVbYY1Ymw
 KzBA==
X-Gm-Message-State: AOAM533qsNGD52S0FD5ZgnruZ7y/a2b423dkeoanYI1E3SyQF5ZJ9VMl
 nAmNL1AlPx+nzKrFPMf1vM4G0klrG3OQsqynGCMH34o1Uao=
X-Google-Smtp-Source: ABdhPJyYVROLj991TsLQWiVv1satBkLum8VmWIfFe/4LGa+BLKOZ4YJDSnpgvBma6gzwKsef/lcaFKZYz2I6D78UwiM=
X-Received: by 2002:a92:d3cb:: with SMTP id c11mr2909544ilh.178.1627030633900; 
 Fri, 23 Jul 2021 01:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210722071236.139520-1-ma.mandourr@gmail.com>
In-Reply-To: <20210722071236.139520-1-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Fri, 23 Jul 2021 10:57:02 +0200
Message-ID: <CAD-LL6i_qQcpR08nvRMcjm1RkSE858RkXDzR1sav_P6P9uztrg@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] new plugin argument passing scheme
To: "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f8ed5d05c7c69606"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x136.google.com
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
Cc: "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8ed5d05c7c69606
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 9:12 AM Mahmoud Mandour <ma.mandourr@gmail.com>
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
> Based-on: <20210722065428.134608-1-ma.mandourr@gmail.com>
>
> However, the dependency is so light and it should only be in the patch
>
>     docs/tcg-plugins: new passing parameters scheme for cache docs
>
> where it depends on
>
>     docs/devel/tcg-plugins: added cores arg to cache plugin
>
> in the aforementioned series (conflict lies in the argument "cores=N"
> only.)
>
> Patches that still need review:
>     plugins/api: added a boolean parsing plugin api
>     docs/deprecated: deprecate passing plugin args through `arg=`
>

The patch
    plugins/hwprofile: adapt to the new plugin arguments scheme
was also not reviewed in the previous versions so it still needs review.


>
> v2 -> v3:
>     1. Protected calling `qapi_bool_parse` by ensuring name & value are
>     not NULL.
>     2. Updated the docs for the hotpages plugin to include its arguments
>     3. Typo in tests/plugins/mem (hadrr -> haddr)
>     4. Reword the deprecation entry in deprecated.rst
>
> Mahmoud Mandour (13):
>   plugins: allow plugin arguments to be passed directly
>   plugins/api: added a boolean parsing plugin api
>   plugins/hotpages: introduce sortby arg and parsed bool args correctly
>   plugins/hotblocks: Added correct boolean argument parsing
>   plugins/lockstep: make socket path not positional & parse bool arg
>   plugins/hwprofile: adapt to the new plugin arguments scheme
>   plugins/howvec: Adapting to the new argument passing scheme.
>   docs/tcg-plugins: new passing parameters scheme for cache docs
>   tests/plugins/bb: adapt to the new arg passing scheme
>   tests/plugins/insn: made arg inline not positional and parse it as
>     bool
>   tests/plugins/mem: introduce "track" arg and make args not positional
>   tests/plugins/syscalls: adhere to new arg-passing scheme
>   docs/deprecated: deprecate passing plugin args through `arg=`
>
>  contrib/plugins/hotblocks.c | 14 ++++++++--
>  contrib/plugins/hotpages.c  | 30 ++++++++++++++-------
>  contrib/plugins/howvec.c    | 27 +++++++++++++------
>  contrib/plugins/hwprofile.c | 39 ++++++++++++++++++---------
>  contrib/plugins/lockstep.c  | 31 +++++++++++++++-------
>  docs/devel/tcg-plugins.rst  | 53 ++++++++++++++++++++++++-------------
>  docs/system/deprecated.rst  |  7 +++++
>  include/qemu/qemu-plugin.h  | 13 +++++++++
>  linux-user/main.c           |  2 +-
>  plugins/api.c               |  5 ++++
>  plugins/loader.c            | 24 ++++++++++++++---
>  qemu-options.hx             |  9 +++----
>  tests/plugin/bb.c           | 15 ++++++++---
>  tests/plugin/insn.c         | 14 ++++++++--
>  tests/plugin/mem.c          | 47 +++++++++++++++++++-------------
>  tests/plugin/syscall.c      | 23 +++++++++++-----
>  16 files changed, 252 insertions(+), 101 deletions(-)
>
> --
> 2.25.1
>
>

--000000000000f8ed5d05c7c69606
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 22, 2021 at 9:12 AM Mahmo=
ud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hello,<br>
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
deprecated.rst file.<br>
<br>
Based-on: &lt;<a href=3D"mailto:20210722065428.134608-1-ma.mandourr@gmail.c=
om" target=3D"_blank">20210722065428.134608-1-ma.mandourr@gmail.com</a>&gt;=
<br>
<br>
However, the dependency is so light and it should only be in the patch<br>
<br>
=C2=A0 =C2=A0 docs/tcg-plugins: new passing parameters scheme for cache doc=
s<br>
<br>
where it depends on<br>
<br>
=C2=A0 =C2=A0 docs/devel/tcg-plugins: added cores arg to cache plugin<br>
<br>
in the aforementioned series (conflict lies in the argument &quot;cores=3DN=
&quot; only.)<br>
<br>
Patches that still need review:<br>
=C2=A0 =C2=A0 plugins/api: added a boolean parsing plugin api<br>
=C2=A0 =C2=A0 docs/deprecated: deprecate passing plugin args through `arg=
=3D`<br></blockquote><div><br></div><div>The patch</div><div>=C2=A0 =C2=A0 =
plugins/hwprofile: adapt to the new plugin arguments scheme<br></div><div>w=
as also not reviewed in the previous versions so it still needs review.</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
v2 -&gt; v3:<br>
=C2=A0 =C2=A0 1. Protected calling `qapi_bool_parse` by ensuring name &amp;=
 value are<br>
=C2=A0 =C2=A0 not NULL.<br>
=C2=A0 =C2=A0 2. Updated the docs for the hotpages plugin to include its ar=
guments<br>
=C2=A0 =C2=A0 3. Typo in tests/plugins/mem (hadrr -&gt; haddr)<br>
=C2=A0 =C2=A0 4. Reword the deprecation entry in deprecated.rst<br>
<br>
Mahmoud Mandour (13):<br>
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
=C2=A0 tests/plugins/bb: adapt to the new arg passing scheme<br>
=C2=A0 tests/plugins/insn: made arg inline not positional and parse it as<b=
r>
=C2=A0 =C2=A0 bool<br>
=C2=A0 tests/plugins/mem: introduce &quot;track&quot; arg and make args not=
 positional<br>
=C2=A0 tests/plugins/syscalls: adhere to new arg-passing scheme<br>
=C2=A0 docs/deprecated: deprecate passing plugin args through `arg=3D`<br>
<br>
=C2=A0contrib/plugins/hotblocks.c | 14 ++++++++--<br>
=C2=A0contrib/plugins/hotpages.c=C2=A0 | 30 ++++++++++++++-------<br>
=C2=A0contrib/plugins/howvec.c=C2=A0 =C2=A0 | 27 +++++++++++++------<br>
=C2=A0contrib/plugins/hwprofile.c | 39 ++++++++++++++++++---------<br>
=C2=A0contrib/plugins/lockstep.c=C2=A0 | 31 +++++++++++++++-------<br>
=C2=A0docs/devel/tcg-plugins.rst=C2=A0 | 53 ++++++++++++++++++++++++-------=
------<br>
=C2=A0docs/system/deprecated.rst=C2=A0 |=C2=A0 7 +++++<br>
=C2=A0include/qemu/qemu-plugin.h=C2=A0 | 13 +++++++++<br>
=C2=A0linux-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +=
-<br>
=C2=A0plugins/api.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 5 ++++<br>
=C2=A0plugins/loader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 24 ++++++=
++++++++---<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 9 +++----<br>
=C2=A0tests/plugin/bb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 ++++++=
++---<br>
=C2=A0tests/plugin/insn.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++++--<=
br>
=C2=A0tests/plugin/mem.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 47 +++++++++++=
++++++++-------------<br>
=C2=A0tests/plugin/syscall.c=C2=A0 =C2=A0 =C2=A0 | 23 +++++++++++-----<br>
=C2=A016 files changed, 252 insertions(+), 101 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000f8ed5d05c7c69606--

