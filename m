Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 775445ECC72
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 20:54:22 +0200 (CEST)
Received: from localhost ([::1]:38006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odFin-0004qu-3H
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 14:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odFcl-00069D-88
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:48:11 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odFcj-0005ms-If
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:48:07 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3450990b0aeso108806717b3.12
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 11:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=zAhBjMoxr6o95XUPXnCbEtK6mCmx+YM0tjxud7fml2I=;
 b=fDmP0B+OMBC7iZsyRtdcoUHsFh+sMc3+q1hb64/I6P9m96sfKRjWqLPxsrX//3ycYH
 yMdCUHPDQmCoLEqk5R6BsYylfSwta41zZvZgR2psNWlOl2TPPj6Jt6DXg42/ca2Vi+Sm
 hHF0H3vsVhoAR25P9dxn0RUw5iWN+jhtIHifJCO54Uasw5U47L2G0Z4FyD2ba6hMHivi
 hcB/zmzxcp/OrdPR6RfsUMXUT4dWaw5R0io2H/z7evq1EOdc3paQ4+fMQPQcVLinQ1el
 96Cx5diTs3RC2i4krTVtEuiaHMVotn9dtc4R5y7BF56g8wNQ6rrHeiGOnsl7ya1taUR7
 atWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zAhBjMoxr6o95XUPXnCbEtK6mCmx+YM0tjxud7fml2I=;
 b=DpGEFI14CHwKCPazWZ5TsyM4rp7u40P5ZavOp/TTsoa5ehg/dgoE9DegkPfy0PXQio
 QsGv1wBstNyE2feowy+mmtA3ally0IpjW3UE+cu8SMty1xBwrkzAv3KyWC56oMvGD9uC
 OxM6O2RK7UjEpluavrpmX8pX73UTEhggxGFqwU7sVOdrZVblkwxLPacKJNX4TguEiCpR
 cUa56uH+3veBxicJ5Qsnycmo6dgVD7L2h2rS/47wlQBPz5Kk1jsoeY2qU+QMXAJbagGw
 SwAqqXPN5iZhYF4I7znloMbxm8VuQdfJo1/HholGj4HpWignZPoNLBfD3nnoczkvk6tV
 SmGw==
X-Gm-Message-State: ACrzQf2m8qQVJ7+r8ryqy1TkmVu1dEu9rYuZFJLZdrMksHYs13IX8Cmm
 yacx5GgZ9cIRsYXC/exdDfU4jWW7u+yziJjoBXA=
X-Google-Smtp-Source: AMsMyM5OH4KaFHaouFs+Jswuj2J/t2NhhC6d13C42L62SSxYIBbmdo5oidfy5/bWS4NsY+s4U6jJI8ELFK6nvgXhc/0=
X-Received: by 2002:a81:1211:0:b0:350:b5ad:76bd with SMTP id
 17-20020a811211000000b00350b5ad76bdmr13850765yws.296.1664304483964; Tue, 27
 Sep 2022 11:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
 <YzMcobeWVAnHUkNu@redhat.com>
 <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
 <YzM5i5QP7NQq4OHV@redhat.com>
 <dc108d7d-297b-5a84-68dd-12da3a0e68d0@redhat.com>
In-Reply-To: <dc108d7d-297b-5a84-68dd-12da3a0e68d0@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 27 Sep 2022 14:47:52 -0400
Message-ID: <CAJSP0QVX8Q5Cg2rr7ee19Wvbghpx8FXyPBratjQi6D4mqHW8pQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
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

On Tue, 27 Sept 2022 at 14:40, Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/09/2022 19.57, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Sep 27, 2022 at 01:36:20PM -0400, Stefan Hajnoczi wrote:
> >> On Tue, 27 Sept 2022 at 11:54, Daniel P. Berrang=C3=A9 <berrange@redha=
t.com> wrote:
> >>>
> >>> On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
> >>>> On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrote:
> >>>>> now that Gitlab is giving us pressure on the amount of free CI minu=
tes, I
> >>>>> wonder whether we should maybe move the Cirrus-CI jobs out of the g=
itlab-CI
> >>>>> dashboard again? We could add the jobs to our .cirrus-ci.yml file i=
nstead,
> >>>>> like we did it in former times...
> >>>>>
> >>>>> Big advantage would be of course that the time for those jobs would=
 not
> >>>>> count in the Gitlab-CI minutes anymore. Disadvantage is of course t=
hat they
> >>>>> do not show up in the gitlab-CI dashboard anymore, so there is no m=
ore
> >>>>> e-mail notification about failed jobs, and you have to push to gith=
ub, too,
> >>>>> and finally check the results manually on cirrus-ci.com ...
> >>>>
> >>>> My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI jo=
b
> >>>> to run the cirrus-run container image that forwards jobs to Cirrus-C=
I.
> >>>> So GitLab CI resources are consumed waiting for Cirrus-CI to finish.
> >>>>
> >>>> This shouldn't affect gitlab.com/qemu-project where there are privat=
e
> >>>> runners that do not consume GitLab CI minutes.
> >>>>
> >>>> Individual developers are affected though because they most likely
> >>>> rely on the GitLab shared runner minutes quota.
> >>>
> >>> NB, none of the jobs should ever be run automatically anymore in
> >>> QEMU CI pipelines. It always requires the maintainer to set the
> >>> env var when pushing to git, to explicitly create a pipeline.
> >>> You can then selectively start each individual job as desired.
> >>
> >> Cirrus CI is not automatically started when pushing to a personal
> >> GitLab repo? If starting it requires manual action anyway then I think
> >> nothing needs to be changed here.
> >
> > No pipeline at all is created unless you do
> >
> >    git push -o ci.variable=3DQEMU_CI=3D1 <your-fork-remote>
> >
> > that creates the pipeliune but doesn't run any jobs - they're manual
> > start.
>
> Yes, sure, the jobs are not started automatically. But I *do* want to run
> the jobs before sending pull requests - but since the gitlab-CI minutes a=
re
> now very limited, I'd like to avoid burning these minutes via gitlab and
> start those jobs directly on cirrus-ci.com again. For that the jobs would
> need to be moved to our .cirrus-ci.yml file again.
>
> Well, maybe we could also have both, jobs via cirrus-run for those who wa=
nt
> to see them in their gitlab-CI dashboard, and via .cirrus-ci.yml for thos=
e
> who want to avoid burning CI minutes on Gitlab. It's a little bit of
> double-maintenance, but maybe acceptable?

I just noticed that qemu.git/master doesn't run Cirrus-CI. I guess it
hasn't been set up in our GitLab project.

Since it's not enabled for qemu.git/master nothing will change from my
perspective. Feel free to change it as you wish.

Stefan

