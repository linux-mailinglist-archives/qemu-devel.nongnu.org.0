Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3783BF453
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 05:43:21 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1KwZ-0003ga-Id
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 23:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1KvZ-00030m-4t
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 23:42:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m1KvW-0006rb-Hm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 23:42:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625715733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QwosA+88ovEgjWsh4qC5/zCBmm7qU523z6P+fMllsuQ=;
 b=MmF9e/0p/WOcmGtw88VlMR+jyVpu6pvpVnYntQg1Mi5VzDTg4aroUpiA427bDgbmW3e9p8
 kUU9OBO32dRSxgqVu+bVgcU6/yJWKHxnUnxc/ILPVL3rsZEGO2dl5AeX5qift4JkSCjBet
 Ssqoh5o+QuVLTs8a4YtIvQSI9tU8OxI=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-gVOmRigBPwi6AmRT_-1L-A-1; Wed, 07 Jul 2021 23:42:11 -0400
X-MC-Unique: gVOmRigBPwi6AmRT_-1L-A-1
Received: by mail-oo1-f71.google.com with SMTP id
 q1-20020a0568200281b029025a8f02e31dso2114130ood.23
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 20:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QwosA+88ovEgjWsh4qC5/zCBmm7qU523z6P+fMllsuQ=;
 b=Rk5ocqPKpBptGhgmQXs+7gQTD6U9wGdKIaUYGBMqaBAATZLZdi2blu/G7pxfHTpysm
 TQWq/1rAwqCB/X8e44SAHD40HDApRxmO1LF2+rWIaHG5gTqNopmLiCHcZYLrk47wCMF2
 /oKQjju0l/4EfM8X505Vm1EMRQdHn6nfm8F00uUVNUoIy03ExobJK+NKF3722eP5GZrY
 5Pe6P4zfkDMOb3+0ALw1MY+uWj1gnXD1K4U4QGB/F6/tDVk+e8oYpAn2HC8gSYuvZGh0
 jhO1nRhcTltnSPgG1BLccRQP+PC8o6rsqzGy7InCMAvXEzC7RsUcB9agGh7jy1CIVAPl
 k/Ig==
X-Gm-Message-State: AOAM531QUU11bqbhnxJfDUb/WUtFgbIlW/3pLDt0juaTUsaiSZ/a4SG1
 qmG3IBCNIYmLVnjgH5aEtugkMYx04Qcarg5nJL3tmtDigaVUpAAM6R5Y9EAY8j+/sUiiZO9rtnQ
 LAZuewegP3DuljWdFKtPqE0R0eSyAzds=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr20910906ota.263.1625715730606; 
 Wed, 07 Jul 2021 20:42:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXWin71i6HlX6QAjy/3AKziXyqTDX1zA2GGSuKOA04JZ91LBndAam/Ft7CptjQ1NK3GYdiv2smpmm0yiA4N8Y=
X-Received: by 2002:a9d:20a2:: with SMTP id x31mr20910890ota.263.1625715730438; 
 Wed, 07 Jul 2021 20:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210630184546.456582-1-wainersm@redhat.com>
 <CAKJDGDYv5xo+qCBcksAfMXx1b5i5hkc9NDcyzSNfkgbmYE996Q@mail.gmail.com>
In-Reply-To: <CAKJDGDYv5xo+qCBcksAfMXx1b5i5hkc9NDcyzSNfkgbmYE996Q@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 7 Jul 2021 23:41:59 -0400
Message-ID: <CAFn=p-YBQETeX2Qqa42oUyr5vghuCLZiNcondyCDSKUNsbKfyQ@mail.gmail.com>
Subject: Re: [PATCH] python: Configure tox to skip missing interpreters
To: Willian Rampazzo <wrampazz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009e75af05c6947092"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa Junior <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009e75af05c6947092
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 30, 2021 at 5:00 PM Willian Rampazzo <wrampazz@redhat.com>
wrote:

> On Wed, Jun 30, 2021 at 3:46 PM Wainer dos Santos Moschetta
> <wainersm@redhat.com> wrote:
> >
> > Currently tox tests against the installed interpreters, however if any
> > supported interpreter is absent then it will return fail. It seems not
> > reasonable to expect developers to have all supported interpreters
> > installed on their systems. Luckily tox can be configured to skip
> > missing interpreters.
> >
> > This changed the tox setup so that missing interpreters are skipped by
> > default. On the CI, however, we still want to enforce it tests
> > against all supported. This way on CI the
> > --skip-missing-interpreters=false option is passed to tox.
> >
> > Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> > ---
> > Tested locally with `make check-tox` and where I only Python 3.6 and 3.9
> > installed.
> > Tested on CI: https://gitlab.com/wainersm/qemu/-/jobs/1390010988
> > Still on CI, but I deliberately removed Python 3.8:
> https://gitlab.com/wainersm/qemu/-/jobs/1390046531
> >
> >  .gitlab-ci.d/static_checks.yml | 1 +
> >  python/Makefile                | 5 ++++-
> >  python/setup.cfg               | 1 +
> >  3 files changed, 6 insertions(+), 1 deletion(-)
> >
>
> Seems reasonable.
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>
>
Nice, I get to have my cake and eat it too :)

Reviewed-by: John Snow <jsnow@redhat.com>

--0000000000009e75af05c6947092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 30, 2021 at 5:00 PM Willi=
an Rampazzo &lt;<a href=3D"mailto:wrampazz@redhat.com">wrampazz@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, Jun 30, 2021 at 3:46 PM Wainer dos Santos Moschetta<br>
&lt;<a href=3D"mailto:wainersm@redhat.com" target=3D"_blank">wainersm@redha=
t.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Currently tox tests against the installed interpreters, however if any=
<br>
&gt; supported interpreter is absent then it will return fail. It seems not=
<br>
&gt; reasonable to expect developers to have all supported interpreters<br>
&gt; installed on their systems. Luckily tox can be configured to skip<br>
&gt; missing interpreters.<br>
&gt;<br>
&gt; This changed the tox setup so that missing interpreters are skipped by=
<br>
&gt; default. On the CI, however, we still want to enforce it tests<br>
&gt; against all supported. This way on CI the<br>
&gt; --skip-missing-interpreters=3Dfalse option is passed to tox.<br>
&gt;<br>
&gt; Signed-off-by: Wainer dos Santos Moschetta &lt;<a href=3D"mailto:waine=
rsm@redhat.com" target=3D"_blank">wainersm@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt; Tested locally with `make check-tox` and where I only Python 3.6 and 3=
.9<br>
&gt; installed.<br>
&gt; Tested on CI: <a href=3D"https://gitlab.com/wainersm/qemu/-/jobs/13900=
10988" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/wainersm/qem=
u/-/jobs/1390010988</a><br>
&gt; Still on CI, but I deliberately removed Python 3.8: <a href=3D"https:/=
/gitlab.com/wainersm/qemu/-/jobs/1390046531" rel=3D"noreferrer" target=3D"_=
blank">https://gitlab.com/wainersm/qemu/-/jobs/1390046531</a><br>
&gt;<br>
&gt;=C2=A0 .gitlab-ci.d/static_checks.yml | 1 +<br>
&gt;=C2=A0 python/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 5 ++++-<br>
&gt;=C2=A0 python/setup.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 1 +<br>
&gt;=C2=A0 3 files changed, 6 insertions(+), 1 deletion(-)<br>
&gt;<br>
<br>
Seems reasonable.<br>
<br>
Reviewed-by: Willian Rampazzo &lt;<a href=3D"mailto:willianr@redhat.com" ta=
rget=3D"_blank">willianr@redhat.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Nice, I get to have my cake and eat it=
 too :)</div><div><br></div><div>Reviewed-by: John Snow &lt;<a href=3D"mail=
to:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div><div><br></div></div></d=
iv>

--0000000000009e75af05c6947092--


