Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ABC3DC0BE
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 00:05:22 +0200 (CEST)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ad7-0006kk-Ew
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 18:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m9acD-0005zn-56
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 18:04:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m9ac9-0002w4-70
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 18:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627682659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kqwiS3FVs21KPHItqeloq3P6TAS6cUKhUyi3IT+A15o=;
 b=VNubwpsNRr5BCRNEkuJsMWzkgj0Qg58bIQlc3t4Pg/buRe5D/tziOBzQAV0FQlZ3aEBmrq
 R0wSO74fUrZTqlFMLsTC5ocCoanSpLh9I+fW8+r/1GGegwY8N8LQC4I/TbrqDOULiwDBFu
 t73o3feYXjHK9HnFByPQYXDzMX3XhVQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-98RkNNRcP7C-o2XPWv8Y9w-1; Fri, 30 Jul 2021 18:04:18 -0400
X-MC-Unique: 98RkNNRcP7C-o2XPWv8Y9w-1
Received: by mail-ed1-f69.google.com with SMTP id
 d6-20020a50f6860000b02903bc068b7717so5261875edn.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 15:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kqwiS3FVs21KPHItqeloq3P6TAS6cUKhUyi3IT+A15o=;
 b=UxLU7yU8wujfvvNJgLOQjzNzTwyf1lnpU4EFXJCbJq+ZAUaDWfv1+JNoD9HfkUpFyD
 2Q9XUpISFWcuTJIdmEOZmuQXsc4oa+k1YHSXimv7eErMr3YBZ+rkMxraFiP7U5WsjUE4
 OdLutKw7c+AoLMqlUrTeCDCr/SmgITUPf235tNzt8msZT7leI+tc7jyNgDgjuqXrKrQI
 iPYB3uI6xykeHb6mdHewZ2KNrsOuz3eGHz9WlonNbU09Pm5a5CFvLP9nFgiEc/63Dl6L
 NDiv6bEjGEzDV5VGEftbvzHcw+Ba58QVABF4Z2rq28yThYlkLEM+c6cS/gsjAPHfu2Sz
 gthg==
X-Gm-Message-State: AOAM533rWG1advFxaJaTdauY8oVm5B7/HvSX6EDVz7wVsWYjeqRxY+Et
 DBcRY8p39skOSdXhSB2Qy2nSbIV8O1nGt1p0h+SVBdrpSdg87PvqtKsEVs+gQOHE2gCeqblg2Il
 oCZJ/Fk8gNe8CnfmCNI6lWspv1TuEV7o=
X-Received: by 2002:a50:ed89:: with SMTP id h9mr5618862edr.106.1627682656888; 
 Fri, 30 Jul 2021 15:04:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8suoEdahNs2ZOypfEZp3mrosoLVM6Ue0J/HoUEYZXXoRZe5j9CpdIay9r7n7avYB2B8Nkm/uWNiujKlERpj8=
X-Received: by 2002:a50:ed89:: with SMTP id h9mr5618820edr.106.1627682656669; 
 Fri, 30 Jul 2021 15:04:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA8DX+OJQ7UnWhYLmUOgpa_mTCmvppRdHhZOE+n7HGPKZw@mail.gmail.com>
In-Reply-To: <CAFEAcA8DX+OJQ7UnWhYLmUOgpa_mTCmvppRdHhZOE+n7HGPKZw@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Fri, 30 Jul 2021 18:04:05 -0400
Message-ID: <CA+bd_6JESu=ygwfSNe5BSzpy9WgYd_Ug0OFX6KeB=ut40hpwWw@mail.gmail.com>
Subject: Re: "make check-acceptance" takes way too long
To: Peter Maydell <peter.maydell@linaro.org>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 11:43 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 30 Jul 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > "make check-acceptance" takes way way too long. I just did a run
> > on an arm-and-aarch64-targets-only debug build and it took over
> > half an hour, and this despite it skipping or cancelling 26 out
> > of 58 tests!
> >
> > I think that ~10 minutes runtime is reasonable. 30 is not;
> > ideally no individual test would take more than a minute or so.
>
> Side note, can check-acceptance run multiple tests in parallel?

Yes, it can, but it's not currently enabled to do so, but I'm planning
to.  As a matter of fact, Yesterday I was trying out Avocado's
parallel capable runner on a GitLab CI pipeline[1] and it went well.

> Running 3 or 4 at once would also improve the runtime...
>

About the time savings, on my own machine I see good results.  On a
build with only the x86_64 target, the parallel execution gets me:

$ avocado run -t arch:x86_64 --filter-by-tags-include-empty
--filter-by-tags-include-empty-key --test-runner=nrunner
--nrunner-max-parallel-tasks=4 tests/acceptance/
...
RESULTS    : PASS 37 | ERROR 0 | FAIL 0 | SKIP 6 | WARN 5 | INTERRUPT
0 | CANCEL 0
...
JOB TIME   : 244.59 s

While the serial execution gets me:

$ avocado run -t arch:x86_64 --filter-by-tags-include-empty
--filter-by-tags-include-empty-key tests/acceptance/
...
RESULTS    : PASS 37 | ERROR 0 | FAIL 0 | SKIP 6 | WARN 5 | INTERRUPT
0 | CANCEL 0
...
JOB TIME   : 658.65 s

But the environment on GitLab CI is fluid, and I bet there's already
some level of overcommit of (at least) CPUs there.  The only pipeline
I ran there with tests running in parallel, resulted in some jobs with
improvements, and others with regressions in runtime.  Additionally,
lack of adequate resources can make more tests time out, and thus give
out false negatives.

Anyway, my current plan is to allow users to configure the
parallelization level on their machines, while slowly and steadily
experimenting what can safely improve the runtime on GitLab CI.

BTW, another **very** sweet spot, which I have experimented with
before, is letting Avocado run the acceptance tests and the iotests in
parallel because they compete for pretty much different resources.
But, that's a matter for another round.

> -- PMM
>

Best regards,
- Cleber.

[1] https://gitlab.com/cleber.gnu/qemu/-/pipelines/344471529
[2] https://gitlab.com/cleber.gnu/qemu/-/pipelines/345082239


