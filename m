Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B084B26E18A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 19:00:24 +0200 (CEST)
Received: from localhost ([::1]:40820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIxGh-000260-Mx
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 13:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kIxEx-0000iH-El
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 12:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kIxEv-0004wk-CF
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 12:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600361911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v0QPOLCH9UEhIrjTwnNF7UmDVv+/hXm0lmBU8WG0r/w=;
 b=EPGEW7JeH9aisx5IAygDqM/44vwjoPes+ssvrvI6TdnkDdvjlXQzdKSNDwoiksIk6AJfI2
 LQpN+2BcJ7uNUEmaJVRI781tMUDUuSV7fWfNTWAkHIpMhXtUCExYim4XCKCsdvB19v66nf
 0ZB9VrVzMBlilTFQM30TRnpuSy5KPUE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-eku8NAcBORqO_LzRgqYlfA-1; Thu, 17 Sep 2020 12:58:26 -0400
X-MC-Unique: eku8NAcBORqO_LzRgqYlfA-1
Received: by mail-ed1-f70.google.com with SMTP id d13so1140927edz.18
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 09:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v0QPOLCH9UEhIrjTwnNF7UmDVv+/hXm0lmBU8WG0r/w=;
 b=B6NIHtB0D8qMLY8gl3wK4Qgi8l0F2up7ATkMDLnrV83jngrclT7SjxJfvTiV1jdK9F
 +2KUgfpPvf9YZGaxtbnmMdsL9ttrmfen80gukpsgOJ0fhf+Zbx7Jf0gMrlhTvt3820/+
 1DLtQY1bxE06BbJF4WJLmBfIemRY/TlLpB350cSlVgCXe7JTvIRnP5YMhJ78SWjDd0+j
 64sIKw4+FwRGHkIDnmygWFuimE0fpEWZlaBv7at7ykdKK7hOpFJYUN/ciScDx9aHh4wb
 2e2OmDPmLf91yB6Xc9cZBm+rWWb32aQP583wbWxtV3UBCecx/QUNQOUIQb6ex2ux+yy+
 /XoQ==
X-Gm-Message-State: AOAM531eewlGt+8PxBJ/lMD0JKEaiw2IrLZGYh2aZT5nUT2qOVBPoQ7z
 61m5Gbd7XjFOS5AFSgFEUeb+E1DxCwNsNdGGEJffwl4YwEj1pkHTRoYNqDTAVOWqMgIQCKLx0ah
 xsAtsyZGjh3iE3zSACYW2BoUylX2MEN8=
X-Received: by 2002:aa7:d6ce:: with SMTP id x14mr34861667edr.359.1600361905504; 
 Thu, 17 Sep 2020 09:58:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzykiWKaLIm+GL8+YXUvdketXHDcs44zmY7j6i6gN2WmZ1KiFhgtqCt85FL38K7YvAqPBML6OqVAqZbs1YxAQg=
X-Received: by 2002:aa7:d6ce:: with SMTP id x14mr34861644edr.359.1600361905290; 
 Thu, 17 Sep 2020 09:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200917104441.31738-1-pbonzini@redhat.com>
 <faab2d69-4bd1-4878-d638-4c9414e56499@amsat.org>
 <87een0xs44.fsf@linaro.org>
In-Reply-To: <87een0xs44.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Sep 2020 18:58:12 +0200
Message-ID: <CABgObfYby_HfevgJ2fP0EDemd4hXbWc24h3C7mZ4ar_N0mE7AQ@mail.gmail.com>
Subject: Re: [PATCH] docker.py: always use --rm
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e09d2405af854aeb"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: berrange@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e09d2405af854aeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il gio 17 set 2020, 18:53 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

>
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
> > On 9/17/20 12:44 PM, Paolo Bonzini wrote:
> >> Avoid that containers pile up.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >>  tests/docker/Makefile.include | 1 -
> >>  tests/docker/docker.py        | 4 ++--
> >>  2 files changed, 2 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/tests/docker/Makefile.include
> b/tests/docker/Makefile.include
> >> index 3daabaa2fd..75704268ff 100644
> >> --- a/tests/docker/Makefile.include
> >> +++ b/tests/docker/Makefile.include
> >> @@ -243,7 +243,6 @@ docker-run: docker-qemu-src
> >>              $(DOCKER_SCRIPT) run                                    \
> >>                      $(if $(NOUSER),,--run-as-current-user)          \
> >>                      --security-opt seccomp=3Dunconfined              =
 \
> >> -                    $(if $V,,--rm)                                  \
> >>                      $(if $(DEBUG),-ti,)                             \
> >
> > Alternatively:
> >
> > -                       $(if $V,,--rm)
> > -                       $(if $(DEBUG),-ti,)
> > +                       $(if $(DEBUG),-ti,--rm)
>
> Surely that should b:
>
>   $(if $(DEBUG),-ti --rm,)
>
> I think being able to keep the container around is useful for debug, I
> have no problem with changing the behaviour for V=3D1.
>

You probably mean  $(if $(DEBUG),-ti,--rm) but that would not work because
the patch adds --rm unconditionally in docker.py. But $(DEBUG) gives you a
shell to run the test from, so I don't think skipping --rm is useful even
in the $(DEBUG) case.

Paolo

>

--000000000000e09d2405af854aeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 17 set 2020, 18:53 Alex Benn=C3=A9e &lt;<a href=
=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org" target=
=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt; writes:<br>
<br>
&gt; On 9/17/20 12:44 PM, Paolo Bonzini wrote:<br>
&gt;&gt; Avoid that containers pile up.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat=
.com" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 tests/docker/Makefile.include | 1 -<br>
&gt;&gt;=C2=A0 tests/docker/docker.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<b=
r>
&gt;&gt;=C2=A0 2 files changed, 2 insertions(+), 3 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile=
.include<br>
&gt;&gt; index 3daabaa2fd..75704268ff 100644<br>
&gt;&gt; --- a/tests/docker/Makefile.include<br>
&gt;&gt; +++ b/tests/docker/Makefile.include<br>
&gt;&gt; @@ -243,7 +243,6 @@ docker-run: docker-qemu-src<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(DOCKER_SCRIPT) r=
un=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(if $(NOUSER),,--run-as-current-user)=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 --security-opt seccomp=3Dunconfined=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(if $V,,--rm)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(if $(DEBUG),-ti,)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;<br>
&gt; Alternatively:<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0$(if $V,,--rm)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0$(if $(DEBUG),-ti,)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0$(if $(DEBUG),-ti,--rm)<br>
<br>
Surely that should b:<br>
<br>
=C2=A0 $(if $(DEBUG),-ti --rm,)<br>
<br>
I think being able to keep the container around is useful for debug, I<br>
have no problem with changing the behaviour for V=3D1.<br></blockquote></di=
v></div><div dir=3D"auto"><br></div><div dir=3D"auto">You probably mean=C2=
=A0 $(if $(DEBUG),-ti,--rm) but that would not work because the patch adds =
--rm unconditionally in docker.py. But $(DEBUG) gives you a shell to run th=
e test from, so I don&#39;t think skipping --rm is useful even in the $(DEB=
UG) case.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000e09d2405af854aeb--


