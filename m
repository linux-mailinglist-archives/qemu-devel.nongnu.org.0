Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCD467E645
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 14:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLOWm-0001E6-Up; Fri, 27 Jan 2023 08:12:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLOWl-0001Ds-MJ
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:12:23 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLOWi-0002nn-Ly
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 08:12:23 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z31so3199356pfw.4
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 05:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z/Cc0zw/YIMoO6vxFFwgHi+aTaXxKXL378C+1UIkUFw=;
 b=S+hFitRyg+AvfpgAg7A4sHd53OVtMuVOeW/RVubGtAUQQzQ9zeL2/o2lRCL6DMOE9h
 wAE4AERgBVruSrlRc7C/xn7Ckh5kOMd6kobUfFWJErWQjlC0ZuDtX5oK0D2A4fOnWLKn
 3bmGAEk/+fCFrooHNRPwrynIbd6odjpB8E1NqS57WLfqLUoc/0wB3VBe6Bp109rPEMqX
 xqZnruuVr7gpTN+jWC0k1YUn9WEuQrcQ0CHIpiDPbPI6DvuFCF5Hv1zB2ERJHXH5DMBu
 L6yFKqKKGm9Q6afvtWbMunOWmb60YHdwoyNwbPwkKCYeo1UPMTJ3FRfSA7XmPbJHVfh2
 Z8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z/Cc0zw/YIMoO6vxFFwgHi+aTaXxKXL378C+1UIkUFw=;
 b=AJKzPwbyP0sbibMb36hMOXqmT6nsw20P3zdiLN4nJ9sUtktNydToQMdsI0epmELuGD
 rFQJpBi62zg/ZPCWHTHQDHNveHq0IjIe7cAflfv605lo/xEy8VSxcHORWt8MVf9zF1tl
 PvWpwMWegeVQ80/r2f3PtI7tHOK/piEUupdA0m+VV5KboOhqFH9C36u+jFxQ8Q/6rPoi
 /J98Ou9kfswBNsVKOU6y2TBijXkocDGsCsHS8u3tTsnOrUp56Ju8Uv16YqlbdqkF4rZ3
 n8O0rrfZnhYmJmFg5MDV4Mv214aUkLG6dBgCkQmPbsXYB4opsQYQ6Y+F4Kq1f9veOkE2
 PGbg==
X-Gm-Message-State: AO0yUKXyUzZydVyNsUMG06mUAmlkNrkyEXueKPiGK37Jeyxmq8XuNfjJ
 kpa8hpWh/I8QEc/FCBH7D2r/++4qq6m6vY1kFIaOuw==
X-Google-Smtp-Source: AK7set/FyvqQR6Qbfv/KrzMO3Lf2lij89NlhDTYKkwM0BS93I/vZrzhq/Tzb1HdjO+PmSDq7QhIzdm+BL9cc1kh+oGk=
X-Received: by 2002:a62:144d:0:b0:591:8ac8:7c78 with SMTP id
 74-20020a62144d000000b005918ac87c78mr925377pfu.54.1674825139186; Fri, 27 Jan
 2023 05:12:19 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <CAJSP0QXC3z-UyP5HoVTOmAfyz_vV6cpZJvnTYazWq9=52bndpA@mail.gmail.com>
 <CAFEAcA_CJ3VjHx1GhjBJjCY=+twBZM3UnR_g0sZLJhvVLcY=GQ@mail.gmail.com>
 <Y9PF7C29TNSuvz9o@redhat.com>
 <CAFEAcA-_3FSQGNYXZo0yBdeMDkXj45O82O7s3t+Fbi1Lb3RQtQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-_3FSQGNYXZo0yBdeMDkXj45O82O7s3t+Fbi1Lb3RQtQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2023 13:12:07 +0000
Message-ID: <CAFEAcA_3EvPjgThntY6JZeRYV+FkC89b70P9osCMmW+y0PvBNA@mail.gmail.com>
Subject: Re: no more pullreq processing til February
To: Kevin Wolf <kwolf@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 27 Jan 2023 at 13:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 27 Jan 2023 at 12:39, Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > Am 26.01.2023 um 15:28 hat Peter Maydell geschrieben:
> > > On Thu, 26 Jan 2023 at 14:25, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> > > >
> > > > Are you batching pull requests? I used that approach last release
> > > > cycle. CI takes so long to run that I didn't want to run it for every
> > > > pull request. Batching worked well overall.
> > >
> > > No, I just do one test per pullreq. IME the CI is flaky
> > > enough that I don't really want to batch it up, and it
> > > isn't so slow that I build up a backlog of unprocessed
> > > requests.
> >
> > But obviously so slow that we've run out of minutes. It would be good if
> > this didn't happen every month in the future.
> >
> > If it worked well enough for Stefan, I think it would be worth trying to
> > batch some pull requests going forward. What is the downside of it? If
> > CI fails and flaky tests seem to be at fault, I assume you just re-run
> > the job, no matter whether it tests a single pull request or two or
> > three of them?
>
> It means that if something fails it's harder to see whether
> it was pullreq A or pullreq B. It also means there's a higher
> cost to "abandon processing the merge and try a different one
> to see if that one goes through and come back to this one later",
> which is also something I sometimes do in an attempt to figure
> out whether a problem is the usual flaky CI or not.

Put another way, I think that an important thing we need to do
is to look at all the CI failures we get and track down exactly
why we have a bunch of intermittent failures and squash them.
A lot of these problems are secondary things that we've ended up
with because we have a lot of flakiness.

-- PMM

