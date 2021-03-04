Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4567232D8CD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 18:45:51 +0100 (CET)
Received: from localhost ([::1]:34370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHs2o-0003xM-AU
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 12:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <babush@rev.ng>) id 1lHs18-0003OH-6x
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:44:06 -0500
Received: from rev.ng ([5.9.113.41]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <babush@rev.ng>) id 1lHs14-0005NJ-JB
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 12:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t2JM8k9es2BCI2n/dV6eWna4CS26ZdaOuHojl2rwrJs=; b=nuL+z2uBkvtfRb5KgbFk+Fv80H
 IZuktqDcAMuQ0ZXSWRf2MeC88K6ytlbeXb8uiLAL7mTHW5Ca/0zvGnqy3DufMXYISk//3quXPofg3
 I5Zc2W/ic7Xn0aOJsTVk6vdI5hFIF1Mj1cAJ4CcdSZsgYvBHm+mMZ4hWnGj8r/a9VusI=;
Received: by mail-vs1-f52.google.com with SMTP id l192so15028653vsd.5
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 09:43:52 -0800 (PST)
X-Gm-Message-State: AOAM532J+kMH9sCib4vlgFSsKSvgZ1t5YxK2xDUpZfGTbRxHM1hZA9cN
 9UbO+CIo2k/IFt26gH6igu6C/dbP1N/O0DK4Kg==
X-Google-Smtp-Source: ABdhPJychPCuMoAOv/dYc6CCeF6UsNMy8AhgH+6o29pm8kSOl36Q7AryJ6bnRnk2t9YfaihNOg5cvOQzgwq0W5qxXk8=
X-Received: by 2002:a05:6102:22f8:: with SMTP id
 b24mr3508284vsh.42.1614879827123; 
 Thu, 04 Mar 2021 09:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20210228222314.304787-1-f4bug@amsat.org>
 <20210228222314.304787-4-f4bug@amsat.org>
 <875z27glwo.fsf@linaro.org>
In-Reply-To: <875z27glwo.fsf@linaro.org>
Date: Thu, 4 Mar 2021 18:43:35 +0100
X-Gmail-Original-Message-ID: <CALU5z=Ne_QkdVRbrsXX9RSKwup2ta=FboVrD3J--yOZUQptymg@mail.gmail.com>
Message-ID: <CALU5z=Ne_QkdVRbrsXX9RSKwup2ta=FboVrD3J--yOZUQptymg@mail.gmail.com>
Subject: Re: [PATCH 3/4] gitlab-ci: Build Hexagon cross-toolchain
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 qemu-devel@nongnu.org, 
 Alessandro Di Federico <ale.qemu@rev.ng>, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=babush@rev.ng;
 helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Paolo Montesel <babush@rev.ng>
From:  Paolo Montesel via <qemu-devel@nongnu.org>

On Thu, Mar 4, 2021 at 1:10 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
> > Add a job to build the Debian based Hexagon cross-toolchain image.
> >
> > This image requires a lot of compute time, too much for the common
> > shared runners. To avoid having the job to timeout, it has to be
> > built with custom unlimited runner. For this reason we restrict this
> > job to manual runs.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  .gitlab-ci.d/containers.yml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> > index 7137cc4184d..ed57e02e769 100644
> > --- a/.gitlab-ci.d/containers.yml
> > +++ b/.gitlab-ci.d/containers.yml
> > @@ -103,6 +103,16 @@ armhf-debian-cross-container:
> >    variables:
> >      NAME: debian-armhf-cross
> >
> > +hexagon-debian-cross-container:
> > +  <<: *container_job_definition
> > +  stage: containers-layer2
> > +  needs: ['amd64-debian10-container']
> > +  when: manual
> > +  timeout: 3h
> > +  variables:
> > +    NAME: debian-hexagon-cross
> > +    EXTRA_FILES: tests/docker/dockerfiles/debian-hexagon-cross.docker.=
d/build-toolchain.sh
> > +
>
> We don't really want this - what we need is the ability to run the tests
> for hexagon when the registry contains a built container that we have
> manually pushed from a build machine:

Ok, so, just to sync, should we submit a minimal patch that only
addresses the docker part of our stuff and then worry about the rest?
That way you can build & upload a container to the registry, and then
we can add a job to .gitlab-ci.yml with the rest of the patchset.

Or, if you plan to mess with the CI yourself, please tell me so we can
avoid spending time on the same thing (should be 5 lines of yaml
anyway).

- Paolo

