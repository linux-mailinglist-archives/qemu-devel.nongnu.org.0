Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D70F5ECCA6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 21:13:24 +0200 (CEST)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odG1D-0000sB-Kp
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 15:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odFz9-0007IH-9Q
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 15:11:15 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:39798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odFz3-0001CI-Uv
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 15:11:11 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-352ffac3941so3590837b3.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 12:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=S6QmxKTtdfrOjmZPSLZweEYA+qMv3HvmKvtYHcCy7bg=;
 b=DGkldR14cLyBfwmTK57q+otZcC4SoDOiHPYzZJGMHqB8VWrfPwQjCc/+Uqe70ASlUA
 fZOJT6V8nQewwjlrMXcp7ZGiUku9Eq4SYC+FxFD2nglQkyDjNYyxkxB6+zBnjn/ad1Da
 f6zZM2xac/2upq7zcMUNlcOFHtUPtFZRTeSgJ8elwBdsIwlLzV+DABsvdi+ugFQsOso4
 9nOMxpPnoYdBLCh1CdrymgFZLdW+MGZWoeSalWCGd926niy3u25HjOzwXPCmbKcEUWFX
 MzepbVKKWtBOshq2gAnK7r0ny/94U5Zr8os/jI8/mnrh8s6ydDVxlGM6pLUufus0Z3MG
 CLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=S6QmxKTtdfrOjmZPSLZweEYA+qMv3HvmKvtYHcCy7bg=;
 b=PyKDhUvjSUeCgWEMOSifPW2M69j13sSflNruKUTPCjFrLsZ2rX1LF7LkWsZfEQCddc
 JbDkXuivhK1+lu1BaA8gbUQcY+jc8IMr0XzWSsfAb21OTOJsN15FTxLYcCB0Ckq/AjZZ
 F8jR60De0jbAlaLYkzC3zByzaB5yowSjJifBHChK7MrpkuQaattLcjohEdfJFJgvhX8S
 Q7nJmMff3CGl95l4lquFLpPmibiOI9EnY746rQrti7M6J6TiXh+yN48f72eowA8UM/Ac
 NFcJsiooPm15rsBuWaP9hPlFVeymoGub0x3CIzVMR0OD/4Z6a7f4GoyJYJhSRtZEZmEJ
 Akzw==
X-Gm-Message-State: ACrzQf3iceYhgUuy1azcAD5EAVY1nZOE5TzY8s8llv0xvC0CmjA7QD/r
 su8Tm8zac5+bcTDGCOtm0CxinkAUsYz3vGoe7TI=
X-Google-Smtp-Source: AMsMyM5nU7mfziyiN7uWLBG9FsgZb1nK9Yu0lM4wrkRFeKHSx1lYMj6+1gdZ1dhXVBCYthmck9jpAy4R1fi0Eq5UaEw=
X-Received: by 2002:a0d:df46:0:b0:345:22d9:f5c1 with SMTP id
 i67-20020a0ddf46000000b0034522d9f5c1mr26811519ywe.239.1664305866461; Tue, 27
 Sep 2022 12:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
 <YzMcobeWVAnHUkNu@redhat.com>
 <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
 <YzM5i5QP7NQq4OHV@redhat.com>
 <dc108d7d-297b-5a84-68dd-12da3a0e68d0@redhat.com>
 <CAJSP0QVX8Q5Cg2rr7ee19Wvbghpx8FXyPBratjQi6D4mqHW8pQ@mail.gmail.com>
 <8407a398-a006-b009-b48c-7814dc15c811@redhat.com>
In-Reply-To: <8407a398-a006-b009-b48c-7814dc15c811@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 27 Sep 2022 15:10:54 -0400
Message-ID: <CAJSP0QW7EQKWk7F5UP9gKWqpooEkqdOUbxiMW2ac-5YL5ytY5A@mail.gmail.com>
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Sept 2022 at 15:04, Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/09/2022 20.47, Stefan Hajnoczi wrote:
> > On Tue, 27 Sept 2022 at 14:40, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 27/09/2022 19.57, Daniel P. Berrang=C3=A9 wrote:
> >>> On Tue, Sep 27, 2022 at 01:36:20PM -0400, Stefan Hajnoczi wrote:
> >>>> On Tue, 27 Sept 2022 at 11:54, Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote:
> >>>>>
> >>>>> On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
> >>>>>> On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrot=
e:
> >>>>>>> now that Gitlab is giving us pressure on the amount of free CI mi=
nutes, I
> >>>>>>> wonder whether we should maybe move the Cirrus-CI jobs out of the=
 gitlab-CI
> >>>>>>> dashboard again? We could add the jobs to our .cirrus-ci.yml file=
 instead,
> >>>>>>> like we did it in former times...
> >>>>>>>
> >>>>>>> Big advantage would be of course that the time for those jobs wou=
ld not
> >>>>>>> count in the Gitlab-CI minutes anymore. Disadvantage is of course=
 that they
> >>>>>>> do not show up in the gitlab-CI dashboard anymore, so there is no=
 more
> >>>>>>> e-mail notification about failed jobs, and you have to push to gi=
thub, too,
> >>>>>>> and finally check the results manually on cirrus-ci.com ...
> >>>>>>
> >>>>>> My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI =
job
> >>>>>> to run the cirrus-run container image that forwards jobs to Cirrus=
-CI.
> >>>>>> So GitLab CI resources are consumed waiting for Cirrus-CI to finis=
h.
> >>>>>>
> >>>>>> This shouldn't affect gitlab.com/qemu-project where there are priv=
ate
> >>>>>> runners that do not consume GitLab CI minutes.
> >>>>>>
> >>>>>> Individual developers are affected though because they most likely
> >>>>>> rely on the GitLab shared runner minutes quota.
> >>>>>
> >>>>> NB, none of the jobs should ever be run automatically anymore in
> >>>>> QEMU CI pipelines. It always requires the maintainer to set the
> >>>>> env var when pushing to git, to explicitly create a pipeline.
> >>>>> You can then selectively start each individual job as desired.
> >>>>
> >>>> Cirrus CI is not automatically started when pushing to a personal
> >>>> GitLab repo? If starting it requires manual action anyway then I thi=
nk
> >>>> nothing needs to be changed here.
> >>>
> >>> No pipeline at all is created unless you do
> >>>
> >>>     git push -o ci.variable=3DQEMU_CI=3D1 <your-fork-remote>
> >>>
> >>> that creates the pipeliune but doesn't run any jobs - they're manual
> >>> start.
> >>
> >> Yes, sure, the jobs are not started automatically. But I *do* want to =
run
> >> the jobs before sending pull requests - but since the gitlab-CI minute=
s are
> >> now very limited, I'd like to avoid burning these minutes via gitlab a=
nd
> >> start those jobs directly on cirrus-ci.com again. For that the jobs wo=
uld
> >> need to be moved to our .cirrus-ci.yml file again.
> >>
> >> Well, maybe we could also have both, jobs via cirrus-run for those who=
 want
> >> to see them in their gitlab-CI dashboard, and via .cirrus-ci.yml for t=
hose
> >> who want to avoid burning CI minutes on Gitlab. It's a little bit of
> >> double-maintenance, but maybe acceptable?
> >
> > I just noticed that qemu.git/master doesn't run Cirrus-CI. I guess it
> > hasn't been set up in our GitLab project.
> >
> > Since it's not enabled for qemu.git/master nothing will change from my
> > perspective. Feel free to change it as you wish.
>
> It's only run for the "staging" branch, I think. The idea was that things
> get tested before merge on the "staging" branch, then there is no need
> anymore to rerun everything when it gets pushed into the "master" branch.

I don't see a cirrus job:
https://gitlab.com/qemu-project/qemu/-/pipelines/652051335

Stefan

