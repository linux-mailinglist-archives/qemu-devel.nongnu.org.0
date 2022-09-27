Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C225ECB3A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 19:40:38 +0200 (CEST)
Received: from localhost ([::1]:43670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odEZP-0005WS-3k
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 13:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odEVa-0001oN-JZ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:36:39 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:36770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1odEVV-0002XQ-Ei
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 13:36:38 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-349c4310cf7so107417677b3.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 10:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=JGJaXf7JxqSUcXKgg6b1m+RLz0qmoYcBb/6ThFxJdz4=;
 b=DTOK2sD7ciZnXrYsFCCcQco0VLclWSeRX/QkG2ZMJFvp8ZmbgzDiW0AILbPDRh4EEC
 4UEUNmSXOZ+FjSz0k/2mUcZ6kc+iEAJAFY0imxlmRnL3jup3DTEP6dhUg+yXQpsnkGVM
 hOZNmvP5x/E0jU31wOOpGy1q0feVzzvkdaQ7fxPl8hyifALT7PBCfwh5tgDladdilwQ3
 aqHwOHLyDOflkIy78Xk2pViABFxC/RfE+IuwSWnifchMhkymVdt5DnHuN1Ng4yrJyVoW
 ciiU8Oar7Kk8ffA4ZzuYM+vYzlo49SDNZM1MJz1CTcDvQEnIYXlbjzhdezovNaFVA5yq
 aEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=JGJaXf7JxqSUcXKgg6b1m+RLz0qmoYcBb/6ThFxJdz4=;
 b=7/ZH9VQD55QfI+usqPguphcTCiG4NshXmsBC/KSafVlaiD1HmRRcyPKlDMeew8DjZ+
 XKxa180ZAFExGIvZTBXfq7oe1Sx53pXstuAl7k1pInWZjKMjY9ZAq2Vk56v74cfh7IIJ
 ql48WqbYRxkJhrFv7xjae7rn3keDUewXV4k/kvEQ2j6849cvE+5WBQgqFwvHdb76SPhM
 X2P1TGJl+dlK4qFQHZxi37zYpzhBtkDk8wzaIlkgaMamrt/1X9EVHeu37xxvZWB+RMUX
 saZiq3hpIbwcqEOXo12A3kMaanLqiSzrxgZ6AMfPk31fB3Q5T22pPR7BVjofTFCd+yDo
 IQCw==
X-Gm-Message-State: ACrzQf2ApaJTRnZLiEucJWUfEdFd08hU28VRMSxQUxBn6aVtgJ+m2/wh
 gQB4fScPnRc+SYr7+gYBr7+VuHFdeX/pvupakik=
X-Google-Smtp-Source: AMsMyM5M0ivXJvSkqu97lxPCV9ldvoSEkbySWxXxRJR3S25oqJFdumjJzTVyv9LYjX9sGzigY/HW/kI97uPCj5jcFns=
X-Received: by 2002:a81:6a54:0:b0:345:4292:4dfe with SMTP id
 f81-20020a816a54000000b0034542924dfemr26569051ywc.62.1664300192398; Tue, 27
 Sep 2022 10:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
 <YzMcobeWVAnHUkNu@redhat.com>
In-Reply-To: <YzMcobeWVAnHUkNu@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 27 Sep 2022 13:36:20 -0400
Message-ID: <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
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

On Tue, 27 Sept 2022 at 11:54, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
> > On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrote:
> > > now that Gitlab is giving us pressure on the amount of free CI minute=
s, I
> > > wonder whether we should maybe move the Cirrus-CI jobs out of the git=
lab-CI
> > > dashboard again? We could add the jobs to our .cirrus-ci.yml file ins=
tead,
> > > like we did it in former times...
> > >
> > > Big advantage would be of course that the time for those jobs would n=
ot
> > > count in the Gitlab-CI minutes anymore. Disadvantage is of course tha=
t they
> > > do not show up in the gitlab-CI dashboard anymore, so there is no mor=
e
> > > e-mail notification about failed jobs, and you have to push to github=
, too,
> > > and finally check the results manually on cirrus-ci.com ...
> >
> > My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI job
> > to run the cirrus-run container image that forwards jobs to Cirrus-CI.
> > So GitLab CI resources are consumed waiting for Cirrus-CI to finish.
> >
> > This shouldn't affect gitlab.com/qemu-project where there are private
> > runners that do not consume GitLab CI minutes.
> >
> > Individual developers are affected though because they most likely
> > rely on the GitLab shared runner minutes quota.
>
> NB, none of the jobs should ever be run automatically anymore in
> QEMU CI pipelines. It always requires the maintainer to set the
> env var when pushing to git, to explicitly create a pipeline.
> You can then selectively start each individual job as desired.

Cirrus CI is not automatically started when pushing to a personal
GitLab repo? If starting it requires manual action anyway then I think
nothing needs to be changed here.

Stefan

