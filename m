Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3627360FF36
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:19:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6Uw-000801-4f; Thu, 27 Oct 2022 13:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo6Ub-0007Wu-Ab
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:16:33 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo6UX-0006tu-1N
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:16:32 -0400
Received: by mail-ej1-x632.google.com with SMTP id fy4so6575443ejc.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mFh+VtJ+8w8lCWumnBGA0yFq+jHO8lpNTWCilWL+Ows=;
 b=GBF0JAy2l4j8EuV9hQMZXVI5n8PuSxa8kYAbw5zbc/5Bm9vU8P9R3+yzc/zTWWI6eH
 8c6RqymOnK/8QWdVy+cT6kPeBJPfDa41QsWOhQ6jUZYU2r/GgfBB2jt/WHKnsTvmnAnb
 VCgHAj83Yci3JrkYJ0bgsdNzNpJ6VuMnekgFSIzoCsDQZSEFXri5nbIxFkI2gGaBxWYR
 O1HtuC/c6j28I4Y7Zw6r2VsSyut5X1MLKdJU7IIe9/+Nm/A5o/JnYx1iUTsRWU0Ukm1W
 CXRDP08xyVtAnK6mlKeyjIuhTQI/9+lYXRSOmA9YaiD1BaSiSlODVSmZEPFAg9+eOvdl
 9jUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mFh+VtJ+8w8lCWumnBGA0yFq+jHO8lpNTWCilWL+Ows=;
 b=062dFxXfrkm00jkCIV8EKy3FotXgCsejoVb0ygKMboGqx55NljeutOgNhS9rcz/lGg
 Q1KcVv19UkN8m0o7XWzLRsBescCCLwegCTHfEFgXKV1S3xaLpdiD5/KR5M7Be/tQe6iO
 MnyMWh2BP+lvc/LmJOpAHrfrgd2VgdIRvTSfX/HHI3uudSNTVA+GrgmrHYLUdkYY+/70
 /Kb9PmCOKkt9vPciGtawO4yGi1LTwbJYrYXZsiKLh48k5OFuZTMHp/d1U9W4gsNklr38
 8qLe/2aSlDqeVofUtQjMP1Z4tyLwsYkfq7C/ZNRc19Q5Xp7OtqEC+avwV0+fvfVRw/GJ
 oYmQ==
X-Gm-Message-State: ACrzQf2tGiZxwZlfDrCYkOjmV2buNmebytW+9mPPXqaBXxkeUIsmSlfY
 xiuypG1GtfhUaM3EUiqlNHyct3vDG7ZrrxNqzwwqcw==
X-Google-Smtp-Source: AMsMyM6KufPmiKobgCrmu2RMQNcov0SHaIa9q1VWZ+Agi8+NZ6M+bTjIaG2hF17iVIy47Dc5TXys8L7OreCbLXLaPao=
X-Received: by 2002:a17:907:a06b:b0:78d:d25f:b726 with SMTP id
 ia11-20020a170907a06b00b0078dd25fb726mr43228093ejc.203.1666890986837; Thu, 27
 Oct 2022 10:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <CAEUhbmVfPzw0R3GgitUGVTTOA9GvHNRRv40FTGvW5352w+rsHA@mail.gmail.com>
In-Reply-To: <CAEUhbmVfPzw0R3GgitUGVTTOA9GvHNRRv40FTGvW5352w+rsHA@mail.gmail.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Thu, 27 Oct 2022 18:16:13 +0100
Message-ID: <CAHDbmO0yH4ud9uL6vryBGR366XnOg+jYBDjaZwPW73P-wjJbLw@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] testing/next (docker, avocado, s390x,
 MAINTAINERS)
To: Bin Meng <bmeng.cn@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>, 
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002683c205ec074df6"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000002683c205ec074df6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've posted an RFC to fix the regression in test-io-command and once that
is reviewed I'll push out the pr.

On Thu, 27 Oct 2022, 16:06 Bin Meng, <bmeng.cn@gmail.com> wrote:

> Hi Alex,
>
> On Thu, Oct 20, 2022 at 9:53 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
> >
> > Hi,
> >
> > The testing/next changes have accumulated a few more fixes since the
> > last posting. Including:
> >
> >   - a bunch of Bin Meng's test cleanups for windows
> >   - some avocado test fixes and tweaks
> >   - disabling an sh4 avocado test (possibly a missed recent intermitten=
t
> regression)
> >   - enabling some sh4 check-tcg tests (now bugs are fixed)
> >   - a minor excursion into the s390 translator
> >
> > The following still need review:
> >
> >   - target/s390x: fake instruction loading when handling 'ex'
> >   - target/s390x: don't probe next pc for EXecuted insns
> >   - target/s390x: don't use ld_code2 to probe next pc
> >   - tests/tcg: re-enable threadcount for sh4
> >   - tests/tcg: re-enable linux-test for sh4
> >   - tests/avocado: disable sh4 rd2 tests on Gitlab
> >   - tests/avocado: set -machine none for userfwd and vnc tests
> >   - MAINTAINERS: fix-up for check-tcg Makefile changes
> >   - MAINTAINERS: add features_to_c.sh to gdbstub files
> >   - MAINTAINERS: add entries for the key build bits
> >   - tests/tcg: use regular semihosting for nios2-softmmu
> >   - tests/avocado: extend the timeout for x86_64 tcg tests
> >   - configure: fix the --enable-static --disable-pie case
> >   - configure: don't enable cross compilers unless in target_list
> >   - tests/docker: update fedora-win[32|64]-cross with lcitool
> >
> > Alex Benn=C3=A9e (16):
> >   tests/docker: update fedora-win[32|64]-cross with lcitool
> >   tests/docker: update test-mingw to run single build
> >   configure: don't enable cross compilers unless in target_list
> >   configure: fix the --enable-static --disable-pie case
> >   tests/avocado: extend the timeout for x86_64 tcg tests
> >   tests/tcg: use regular semihosting for nios2-softmmu
> >   MAINTAINERS: add entries for the key build bits
> >   MAINTAINERS: add features_to_c.sh to gdbstub files
> >   MAINTAINERS: fix-up for check-tcg Makefile changes
> >   tests/avocado: set -machine none for userfwd and vnc tests
> >   tests/avocado: disable sh4 rd2 tests on Gitlab
> >   tests/tcg: re-enable linux-test for sh4
> >   tests/tcg: re-enable threadcount for sh4
> >   target/s390x: don't use ld_code2 to probe next pc
> >   target/s390x: don't probe next pc for EXecuted insns
> >   target/s390x: fake instruction loading when handling 'ex'
> >
> > Anton Johansson (2):
> >   tests/docker: Add flex/bison to `debian-all-test`
> >   tests/docker: Add flex/bison to `debian-hexagon-cross`
> >
> > Bin Meng (6):
> >   semihosting/arm-compat-semi: Avoid using hardcoded /tmp
> >   tcg: Avoid using hardcoded /tmp
> >   util/qemu-sockets: Use g_get_tmp_dir() to get the directory for
> >     temporary files
> >   block/vvfat: Unify the mkdir() call
> >   fsdev/virtfs-proxy-helper: Use g_mkdir()
> >   hw/usb: dev-mtp: Use g_mkdir()
> >
> > Paolo Bonzini (1):
> >   tests/tcg: include CONFIG_PLUGIN in config-host.mak
> >
> > Peter Maydell (1):
> >   tests/avocado: raspi2_initrd: Wait for guest shutdown message before
> >     stopping
> >
>
> Will the PR be sent soon? Thanks!
>
> Regards,
> Bin
>

--0000000000002683c205ec074df6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I&#39;ve posted an RFC to fix the regression in test-io-c=
ommand and once that is reviewed I&#39;ll push out the pr.</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 27 Oct 20=
22, 16:06 Bin Meng, &lt;<a href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Alex,<br>
<br>
On Thu, Oct 20, 2022 at 9:53 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex=
.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro=
.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; The testing/next changes have accumulated a few more fixes since the<b=
r>
&gt; last posting. Including:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- a bunch of Bin Meng&#39;s test cleanups for windows<br>
&gt;=C2=A0 =C2=A0- some avocado test fixes and tweaks<br>
&gt;=C2=A0 =C2=A0- disabling an sh4 avocado test (possibly a missed recent =
intermittent regression)<br>
&gt;=C2=A0 =C2=A0- enabling some sh4 check-tcg tests (now bugs are fixed)<b=
r>
&gt;=C2=A0 =C2=A0- a minor excursion into the s390 translator<br>
&gt;<br>
&gt; The following still need review:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0- target/s390x: fake instruction loading when handling &#3=
9;ex&#39;<br>
&gt;=C2=A0 =C2=A0- target/s390x: don&#39;t probe next pc for EXecuted insns=
<br>
&gt;=C2=A0 =C2=A0- target/s390x: don&#39;t use ld_code2 to probe next pc<br=
>
&gt;=C2=A0 =C2=A0- tests/tcg: re-enable threadcount for sh4<br>
&gt;=C2=A0 =C2=A0- tests/tcg: re-enable linux-test for sh4<br>
&gt;=C2=A0 =C2=A0- tests/avocado: disable sh4 rd2 tests on Gitlab<br>
&gt;=C2=A0 =C2=A0- tests/avocado: set -machine none for userfwd and vnc tes=
ts<br>
&gt;=C2=A0 =C2=A0- MAINTAINERS: fix-up for check-tcg Makefile changes<br>
&gt;=C2=A0 =C2=A0- MAINTAINERS: add features_to_c.sh to gdbstub files<br>
&gt;=C2=A0 =C2=A0- MAINTAINERS: add entries for the key build bits<br>
&gt;=C2=A0 =C2=A0- tests/tcg: use regular semihosting for nios2-softmmu<br>
&gt;=C2=A0 =C2=A0- tests/avocado: extend the timeout for x86_64 tcg tests<b=
r>
&gt;=C2=A0 =C2=A0- configure: fix the --enable-static --disable-pie case<br=
>
&gt;=C2=A0 =C2=A0- configure: don&#39;t enable cross compilers unless in ta=
rget_list<br>
&gt;=C2=A0 =C2=A0- tests/docker: update fedora-win[32|64]-cross with lcitoo=
l<br>
&gt;<br>
&gt; Alex Benn=C3=A9e (16):<br>
&gt;=C2=A0 =C2=A0tests/docker: update fedora-win[32|64]-cross with lcitool<=
br>
&gt;=C2=A0 =C2=A0tests/docker: update test-mingw to run single build<br>
&gt;=C2=A0 =C2=A0configure: don&#39;t enable cross compilers unless in targ=
et_list<br>
&gt;=C2=A0 =C2=A0configure: fix the --enable-static --disable-pie case<br>
&gt;=C2=A0 =C2=A0tests/avocado: extend the timeout for x86_64 tcg tests<br>
&gt;=C2=A0 =C2=A0tests/tcg: use regular semihosting for nios2-softmmu<br>
&gt;=C2=A0 =C2=A0MAINTAINERS: add entries for the key build bits<br>
&gt;=C2=A0 =C2=A0MAINTAINERS: add features_to_c.sh to gdbstub files<br>
&gt;=C2=A0 =C2=A0MAINTAINERS: fix-up for check-tcg Makefile changes<br>
&gt;=C2=A0 =C2=A0tests/avocado: set -machine none for userfwd and vnc tests=
<br>
&gt;=C2=A0 =C2=A0tests/avocado: disable sh4 rd2 tests on Gitlab<br>
&gt;=C2=A0 =C2=A0tests/tcg: re-enable linux-test for sh4<br>
&gt;=C2=A0 =C2=A0tests/tcg: re-enable threadcount for sh4<br>
&gt;=C2=A0 =C2=A0target/s390x: don&#39;t use ld_code2 to probe next pc<br>
&gt;=C2=A0 =C2=A0target/s390x: don&#39;t probe next pc for EXecuted insns<b=
r>
&gt;=C2=A0 =C2=A0target/s390x: fake instruction loading when handling &#39;=
ex&#39;<br>
&gt;<br>
&gt; Anton Johansson (2):<br>
&gt;=C2=A0 =C2=A0tests/docker: Add flex/bison to `debian-all-test`<br>
&gt;=C2=A0 =C2=A0tests/docker: Add flex/bison to `debian-hexagon-cross`<br>
&gt;<br>
&gt; Bin Meng (6):<br>
&gt;=C2=A0 =C2=A0semihosting/arm-compat-semi: Avoid using hardcoded /tmp<br=
>
&gt;=C2=A0 =C2=A0tcg: Avoid using hardcoded /tmp<br>
&gt;=C2=A0 =C2=A0util/qemu-sockets: Use g_get_tmp_dir() to get the director=
y for<br>
&gt;=C2=A0 =C2=A0 =C2=A0temporary files<br>
&gt;=C2=A0 =C2=A0block/vvfat: Unify the mkdir() call<br>
&gt;=C2=A0 =C2=A0fsdev/virtfs-proxy-helper: Use g_mkdir()<br>
&gt;=C2=A0 =C2=A0hw/usb: dev-mtp: Use g_mkdir()<br>
&gt;<br>
&gt; Paolo Bonzini (1):<br>
&gt;=C2=A0 =C2=A0tests/tcg: include CONFIG_PLUGIN in config-host.mak<br>
&gt;<br>
&gt; Peter Maydell (1):<br>
&gt;=C2=A0 =C2=A0tests/avocado: raspi2_initrd: Wait for guest shutdown mess=
age before<br>
&gt;=C2=A0 =C2=A0 =C2=A0stopping<br>
&gt;<br>
<br>
Will the PR be sent soon? Thanks!<br>
<br>
Regards,<br>
Bin<br>
</blockquote></div>

--0000000000002683c205ec074df6--

