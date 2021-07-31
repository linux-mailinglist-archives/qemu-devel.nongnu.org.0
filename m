Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BB03DC78C
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 19:59:32 +0200 (CEST)
Received: from localhost ([::1]:57774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9tGk-00036t-Ql
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 13:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m9tFe-0002Om-GV
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 13:58:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m9tFa-0004Jh-US
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 13:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627754297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IyXyOk0JsD3L9we3Wn187H0FocamDKNCDbPbCpQd7Ro=;
 b=KiAaQQOFZ40NFxLLixjA/gjM9i85odk4rT+aJ6rSp66YAgOKy6vJkoFAYQrMPQwHrHeb3m
 4bQii9LCnZTfxSiOrboXz2xguIbN4eVvdufZ+eajuXLvlnBrXqyE5xFGE6dprSHskW3fxY
 HrLSnD5LNbzwNSVDx5Wrc6ixlVY/CtE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-kTxTf5XqNeu528vbcSa82w-1; Sat, 31 Jul 2021 13:58:16 -0400
X-MC-Unique: kTxTf5XqNeu528vbcSa82w-1
Received: by mail-ej1-f69.google.com with SMTP id
 q19-20020a170906b293b029058a1e75c819so3802367ejz.16
 for <qemu-devel@nongnu.org>; Sat, 31 Jul 2021 10:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IyXyOk0JsD3L9we3Wn187H0FocamDKNCDbPbCpQd7Ro=;
 b=eQF6rwSTNB12A/OPyNcjmiamUUwWk50Sfj67HU7Lhcz+HU9DuahWbaNarYzKPbxzaU
 Qiy1yoNIzsvkuAV2nUktq6zK71jFZ+Fc3U3jhGyD6zI9FqcdfDT4HJhsNCBcUMyCEqSp
 Ut4Vv8LqvxsmF9jHrJcVFz1BJUEJbR8kwX5CtinRlgtBCIakSPgr+TNPcAhDSwDG6Lz8
 Q8egEB01PpidkUXsnSejQIzdgSxJiEsldchmrZNtmq5UjBMKuLySjxuSqM6XXzMXPJkq
 pSyM7DIim4ak9YgJrtnh7/eH7d4S5JNCVkNmY2DjJLlw9ZeuMCnz04yd3z1ivNAcg1kj
 QUNQ==
X-Gm-Message-State: AOAM5319Ocxqf6ZXHElEy+9TQ0Qhhktj8AvwsiwfLRM5XAUF2kGej41m
 bgPhN8Ix+xqD67I77em4T1hQU449xV81a0OhacxJ/H1iCpW/bLuAoKvXcGGqwmuUOrtmsbZQlZ/
 wJxP17e+QRyeExb5tFNX4N0UcQgyw+LI=
X-Received: by 2002:a17:906:49ce:: with SMTP id
 w14mr8300934ejv.273.1627754294783; 
 Sat, 31 Jul 2021 10:58:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkCj5OYMAggUagN8YKCYu52BXPXuXCJ+E/f9WVgCvbu8DNoaZE9gVt+YT6yDPBImW2oZIlgMhGCnHIUiHGTiw=
X-Received: by 2002:a17:906:49ce:: with SMTP id
 w14mr8300919ejv.273.1627754294546; 
 Sat, 31 Jul 2021 10:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA8DX+OJQ7UnWhYLmUOgpa_mTCmvppRdHhZOE+n7HGPKZw@mail.gmail.com>
 <CA+bd_6JESu=ygwfSNe5BSzpy9WgYd_Ug0OFX6KeB=ut40hpwWw@mail.gmail.com>
 <20afa6d3-2ecb-c4f4-398b-08f298ae82d7@redhat.com>
In-Reply-To: <20afa6d3-2ecb-c4f4-398b-08f298ae82d7@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Sat, 31 Jul 2021 13:58:03 -0400
Message-ID: <CA+bd_6KY0trVXjf-1gAqZriZybu+skZf2P43oww1AEurpoGEXA@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.72,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 31, 2021 at 2:40 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 31/07/2021 00.04, Cleber Rosa wrote:
> > On Fri, Jul 30, 2021 at 11:43 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> On Fri, 30 Jul 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>>
> >>> "make check-acceptance" takes way way too long. I just did a run
> >>> on an arm-and-aarch64-targets-only debug build and it took over
> >>> half an hour, and this despite it skipping or cancelling 26 out
> >>> of 58 tests!
> >>>
> >>> I think that ~10 minutes runtime is reasonable. 30 is not;
> >>> ideally no individual test would take more than a minute or so.
> >>
> >> Side note, can check-acceptance run multiple tests in parallel?
> >
> > Yes, it can, but it's not currently enabled to do so, but I'm planning
> > to.  As a matter of fact, Yesterday I was trying out Avocado's
> > parallel capable runner on a GitLab CI pipeline[1] and it went well.
>
> Was this one of the shared gitlab CI runners? ... well, those feature only a
> single CPU, so the run was likely not very different compared to a single run.
>

Yes, the two pipeline executions I referred to were run in the shared
GitLab CI runners.  I was testing two things:

1. Possible caveats/issues with the parallel Avocado runner (AKA
"nrunner") and the Acceptance tests (first pipeline linked, with "max
parallel tasks" set to 1)
2. Any possible gains/losses with running with "max parallel tasks"
set to 2 (second pipeline linked)

> > But the environment on GitLab CI is fluid, and I bet there's already
> > some level of overcommit of (at least) CPUs there.  The only pipeline
> > I ran there with tests running in parallel, resulted in some jobs with
> > improvements, and others with regressions in runtime.  Additionally,
> > lack of adequate resources can make more tests time out, and thus give
> > out false negatives.
>
> It certainly does not make sense to enable parallel tests for the shared
> runners there.
>
>   Thomas
>
>

There could be gains on scenario #2 if there's considerable I/O wait
on some tests.  That's why I mention that previous experiences mixing
the acceptance tests with the iotests were very interesting.  But
you're right, with only acceptance tests, mostly CPU bound, there was
no clear gain.

Best,
- Cleber.


