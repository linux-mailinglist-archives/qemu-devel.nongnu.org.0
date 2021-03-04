Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7AF32D947
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 19:10:51 +0100 (CET)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHsQz-0007lX-Kh
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 13:10:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHsPI-0007JH-RK
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 13:09:04 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:45615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHsPG-0008Re-TK
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 13:09:04 -0500
Received: by mail-lj1-x230.google.com with SMTP id y12so21584464ljj.12
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 10:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2FHvWs9EXhNszpdPGUyo7QV+cbyAE/Jl10WmFDGjx6g=;
 b=XizCn+8MjWoDTtvwMBHI96+ELeyGFfeNCn/QRLoT+RVHIBG/6vzf3ZC9iqq9q6ATDa
 7pmRgM+SMd4GTWHlCAORyMT33NERuSMMTSvKU42jnJ3Kq2YLktsT+1EPSwNCWCaQG+Ht
 QTUrGwqHB30r6ooyLXamK2Bp8I9hfotvXaJ2qHaZczWHfEFqQbNSSyOobiAn1iA+RFjk
 8a78eYNqhlPR2fLxAKIayHO3Foy4gO0WyXL/i3hEpiXYBcVuycl5VTTi5jd18rLMbCIn
 eci8zcN6mVa+64/PlDFy1CyR67gpmJhYB5gObiLQrtFnSEFTtBNId7Ce4Hy+3tK4BXzs
 7UHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2FHvWs9EXhNszpdPGUyo7QV+cbyAE/Jl10WmFDGjx6g=;
 b=rZLAQd1s0t8TmLPJIll8QzHQDcjhLkXjHbGIAr/tdYl8ugj9hqgnawRmWaIfvZh1IT
 wZDQF+ei8NALoJfMv24BzXb/kwANquux4AeUMXG9xQUMtbNmLCoMhEv5w6XTINO6Im6e
 vxk3NfsjGeUYZsYQtocTXIWhCa9QwdEt/2nwnyODhLpbOq+CaQUFD3oZ7JelkrH8ts6f
 Z6LusYHKMDmXw/hP/WWT7PjkMbdJyCNAqrXUhqDkKgm8V1U1dDS5YKmifYGY43h8uWEv
 xYOzPbdr/nE8HIU/TZIFSbFuk+z9KSaeg7E+YS0/WqkDtQ+vRFM7gkHiNCdaR6y6wsdS
 m20A==
X-Gm-Message-State: AOAM532JgpGzN6GjkP7o/nk2whMqT4iRjX/s6W5ko2wbAhxRQNcC6cGZ
 pchIi1YUfojaKqVPxR6dJwVN14AZlFRH1yUnL0L3wg==
X-Google-Smtp-Source: ABdhPJwbmDn7d90WDe6c9B8alFI7tnovbKrYr8hs9TMgsVknh0O9+xToPqGYM5xQF75RampOyY2xCpzD4ffZ/Kkc9Lg=
X-Received: by 2002:a2e:8151:: with SMTP id t17mr2821742ljg.163.1614881340401; 
 Thu, 04 Mar 2021 10:09:00 -0800 (PST)
MIME-Version: 1.0
References: <20210228222314.304787-1-f4bug@amsat.org>
 <20210228222314.304787-4-f4bug@amsat.org>
 <875z27glwo.fsf@linaro.org>
 <CALU5z=Ne_QkdVRbrsXX9RSKwup2ta=FboVrD3J--yOZUQptymg@mail.gmail.com>
In-Reply-To: <CALU5z=Ne_QkdVRbrsXX9RSKwup2ta=FboVrD3J--yOZUQptymg@mail.gmail.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Thu, 4 Mar 2021 18:08:48 +0000
Message-ID: <CAHDbmO1Q4q6FDuTac2epjT6iaou5Zt1g-G6ejjyPC52O7HiTug@mail.gmail.com>
Subject: Re: [PATCH 3/4] gitlab-ci: Build Hexagon cross-toolchain
To: Paolo Montesel <babush@rev.ng>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yes, exactly. Already done:

  https://gitlab.com/stsquad/qemu/-/jobs/1073206662

On Thu, 4 Mar 2021 at 17:43, Paolo Montesel <babush@rev.ng> wrote:
>
> On Thu, Mar 4, 2021 at 1:10 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >
> >
> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
> >
> > > Add a job to build the Debian based Hexagon cross-toolchain image.
> > >
> > > This image requires a lot of compute time, too much for the common
> > > shared runners. To avoid having the job to timeout, it has to be
> > > built with custom unlimited runner. For this reason we restrict this
> > > job to manual runs.
> > >
> > > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > > ---
> > >  .gitlab-ci.d/containers.yml | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.ym=
l
> > > index 7137cc4184d..ed57e02e769 100644
> > > --- a/.gitlab-ci.d/containers.yml
> > > +++ b/.gitlab-ci.d/containers.yml
> > > @@ -103,6 +103,16 @@ armhf-debian-cross-container:
> > >    variables:
> > >      NAME: debian-armhf-cross
> > >
> > > +hexagon-debian-cross-container:
> > > +  <<: *container_job_definition
> > > +  stage: containers-layer2
> > > +  needs: ['amd64-debian10-container']
> > > +  when: manual
> > > +  timeout: 3h
> > > +  variables:
> > > +    NAME: debian-hexagon-cross
> > > +    EXTRA_FILES: tests/docker/dockerfiles/debian-hexagon-cross.docke=
r.d/build-toolchain.sh
> > > +
> >
> > We don't really want this - what we need is the ability to run the test=
s
> > for hexagon when the registry contains a built container that we have
> > manually pushed from a build machine:
>
> Ok, so, just to sync, should we submit a minimal patch that only
> addresses the docker part of our stuff and then worry about the rest?
> That way you can build & upload a container to the registry, and then
> we can add a job to .gitlab-ci.yml with the rest of the patchset.
>
> Or, if you plan to mess with the CI yourself, please tell me so we can
> avoid spending time on the same thing (should be 5 lines of yaml
> anyway).
>
> - Paolo



--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

