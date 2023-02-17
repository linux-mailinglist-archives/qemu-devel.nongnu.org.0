Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE769B5B0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 23:51:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT9YD-0005r2-9T; Fri, 17 Feb 2023 17:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pT9YB-0005qa-D6
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 17:49:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pT9Y9-0007Ca-JW
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 17:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676674192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hD2NmWuec7QMc6ZXZQWdSlg4n8WDaviBPEk/8Z7WLd8=;
 b=Eh7z2dsECUvYHZ7E+UPwWOlzd8a06pbT9PK2Sbip6GjzsakvC6etypM5xUyvR6PyAMukmS
 wAgArHMcgHbkLXqVra+sf+XM8/mKRQPKbkIBZVh+WNCbTsi6ZGkLpURMFwKsfZDSjWQE0U
 Ldf0m4UGH9BgB5IkumPQZ6O+f5A5qj8=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-xJTjfZ5LOO-GxiEUEL3VJw-1; Fri, 17 Feb 2023 17:49:49 -0500
X-MC-Unique: xJTjfZ5LOO-GxiEUEL3VJw-1
Received: by mail-pg1-f197.google.com with SMTP id
 x127-20020a633185000000b004fac0fa0f9eso904034pgx.19
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 14:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hD2NmWuec7QMc6ZXZQWdSlg4n8WDaviBPEk/8Z7WLd8=;
 b=wiGsGZ6PQ+l6b/lTH+Ydyp82BV+pFkTKPBh2ksG2LeEsQAf9sqHr+3ROQvYHfrq9rF
 olUAXstBGDRBPFOSxKd2U10aESZzfazKS2zo3SKW7eL1PRPPTlmDQc9aiDYhXpT/n8JB
 fo+1P/sKJmKYTCtHImsuXk2q8v+ovRcYQbBY1mklaQ1PSG/hzl7RllPxaKUCrBMdYutr
 S2mXZSYkuAGb2mKEGI6iV1HVCX6NkXKiL1om/1WvBHlUhazPmEXleP4RdKVn+TFJsu5p
 xbYQNcj5w2g6vT3qPS72+C1FLHcyRtrT+phGWE16IdoINKgxCAQDhvkxONJe3T+rNig3
 Oj1w==
X-Gm-Message-State: AO0yUKW3gwNeecnO8asCIMv/FAaEgxwvpuTyE0EHGlRu2eN/MryxlYJ1
 6a5qJroIgkLGESVMTb0QcgmnhJY10Ehd7K+R8utA4hWOkqqu82+ozr5sa6Gg+MRhOpAnVX7qOtR
 DKhrcnhrwQXGLG9V8/Spad9n7xCIQMB4=
X-Received: by 2002:a17:90b:3906:b0:234:2592:efbe with SMTP id
 ob6-20020a17090b390600b002342592efbemr1680088pjb.131.1676674188102; 
 Fri, 17 Feb 2023 14:49:48 -0800 (PST)
X-Google-Smtp-Source: AK7set8oPLXgdU4mf28v0zmnYIy+UP+ZyTTdsbLRHYgfwFew7cnf3Cg2hxR5MJ50I3f8WIGj/a4gJPUKnhJTvbMNIJk=
X-Received: by 2002:a17:90b:3906:b0:234:2592:efbe with SMTP id
 ob6-20020a17090b390600b002342592efbemr1680072pjb.131.1676674187799; Fri, 17
 Feb 2023 14:49:47 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <20230210003147.1309376-7-jsnow@redhat.com>
 <CAFEAcA-c5y0TR8vYg_FYEmGv3mOOmBgeD0cyb+mVotsP=r-Dsw@mail.gmail.com>
 <CAFn=p-aDV9=vG6hjTWRE6c52TpYSjDBU22nthTuejDCv_XrYMQ@mail.gmail.com>
 <CAFEAcA_eGvz_BQVLhVWtedRh2mcBuMEhv0RKF+6DW4t+9FdPAw@mail.gmail.com>
 <Y+Z2Kcq17HGWuoTV@redhat.com> <87cz6cpue3.fsf@pond.sub.org>
 <Y+t1J72iMsLWXHne@redhat.com>
 <CABgObfb-_upmc=36_bnxLMCB+0KqWoZNK62rnD5KpBKhW4N+hw@mail.gmail.com>
 <Y+vEKTgwoPtj86Z1@redhat.com>
In-Reply-To: <Y+vEKTgwoPtj86Z1@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Feb 2023 17:49:36 -0500
Message-ID: <CAFn=p-Zg-LsRxG3rc7W1tmXcEWjqQtYF4c8RiioWpHEoa-JT5Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] CI: Stop building docs on centos8
To: Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Michael Roth <michael.roth@amd.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 14, 2023 at 12:26 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 14.02.2023 um 15:03 hat Paolo Bonzini geschrieben:
> > In the case of Python the issue is not the interpreter per se, though
> > there are a couple new feature in Python 3.7 that are quite nice (for
> > example improved data classes[1] or context variables[2]). The main
> > problem as far as I understood (and have seen in my experience) is
> > linting tools. New versions fix bugs that caused false positives, but
> > also become more strict at the same time. The newer versions at the
> > same time are very quick at dropping support for old versions of
> > Python; while older versions sometimes throw deprecation warnings on
> > new versions of Python. This makes it very hard to support a single
> > version of, say, mypy that works on all versions from RHEL8 and SLE15
> > to Fedora 38 and Ubuntu 23.04.
>
> Why do we have to support a single version of mypy? What is wrong with
> running an old mypy version with old Python version, and a newer mypy
> with newer Python versions?

Well, the problem is, ...

>
> Sure, they will complain about different things, but it doesn't feel
> that different from supporting multiple C compilers in various versions.

...well, it's this.

The first dimension of the test matrix is the version of mypy itself.
The second dimension of the test matrix is the version of Python mypy
runs under. A given version of mypy can run under multiple versions of
Python and may indeed have different behaviors under each.
The third dimension of this test matrix is the version(s) of Python
our code is targeting; for instance we configure mypy to understand
that we require Python 3.6.

Trying to cast the net wide on *all of these* gets tough; the very
latest versions of mypy don't support 3.6 at all, so you'll have cases
where the mypy that just so happens to come with your Fedora
installation just won't work properly with our code anymore, which has
to test under 3.6 appropriately.

In general, the majority of python package upstreams I am aware of
simply pin a python version and a mypy version and leave it at that.
Compatibility concerns for most of the upstreams just do not really
ever consider that you'd be running *and* testing against a large
spread of versions. I've gone the extra mile and I run mypy and pylint
under all versions of python from 3.6 to 3.11 to ensure that developer
workstations can run the same linting tests and feel assured that if
it passes locally, it will pass on the CI and vice-versa. Our matrix
is generally quite a bit larger than most upstreams, so I am playing a
lot of whack-a-mole to keep things functioning consistently across the
versions. I will probably even add support for Python 3.12 alpha
*soon* because it's already available in the Fedora repo, and it will
be good to find any compatibility issues before that version is
officially released. (I'll need to do this for the qemu.qmp package,
which should have support for 3.12 on the day 3.12 releases and not
sometime afterwards.)

I know the "check-tox" test was annoying upstream as it sometimes
turned yellow because a new pylint version was released, but that's
how I stay ahead of breaking changes before they're on local
workstations.

We could avoid at least one of the reasons for dropping 3.6 support by
saying "Tough cookies, you'll use precisely this version of mypy and
precisely this python interpreter, or you'll get nothing" and that
does relieve a huge amount of pressure as-is. But, as a courtesy, I do
go out of my way -- where possible -- to ensure that developers can
use whichever versions of tools their distro is providing them so that
they don't have to mess around with that stuff. Unfortunately, that
means when upstreams start dropping support for older things, it gets
hairier and quite a bit more painful.

I think 3.6 being the first version that offers full-throated type
hint support has unique pain in this circumstance because a lot of the
details did not get hammered out until 3.7 or later; in general the
amount of workarounds I have had to apply because something type
checks only in 3.7+ but not 3.6 is fairly high compared to the number
of times I've found that a different version was the odd one out. I
don't expect this to become a recurring desire where I start to whine
about old Python versions before our support window would otherwise
let me drop them; I think this is actually just a unique pain point of
this one version if we keep static typing.

That's the tooling issue, anyway.

>
> Kevin
>


