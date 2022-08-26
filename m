Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E065A26EF
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:36:27 +0200 (CEST)
Received: from localhost ([::1]:53086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXdS-0004YH-0c
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:36:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRXTW-0006xS-HH
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:26:15 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:41957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oRXTU-00082a-65
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:26:09 -0400
Received: by mail-qk1-x72f.google.com with SMTP id w18so841086qki.8
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=NaDgUkKi1Xrh4/tswkU63n7BeaGZ8xI6nhNFIdFJxwU=;
 b=jxePz8pkkBZrk1oDcRPWqDb5LXG4WpUMvlv7+iF1K+RZCTNTmUWAIikbQlsINVbAWc
 pig7KB7ifOYpZOCAc08aS5TZpGGOOLuHtxAG0/jS+NotZX9UCAt0peePAx1QjyEac8kt
 7KioMvln/o4mHyI36ix7F2PpcBjKykgWQ5gmi+QEKceK6FawyhjJqGy5RYcbinbeW/Ez
 JiXfb01zfvzBabFUUv26N+NMOYUjEPube5AGxLey5U7EVfu1Dhp75+ZLSs6YEvKetNf5
 1ELt5EL1CB75wxxajm0t+/fZdfCpeTUOTuOwvSioYzUvS2p8wp9PgROQGVq1lfq3n1rW
 y2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NaDgUkKi1Xrh4/tswkU63n7BeaGZ8xI6nhNFIdFJxwU=;
 b=Ubj+mkXy2og/T63JX5Rfg/GAToixLTab1MFXyoB/HJ2N/w89keFUcW+DQYMJ3p1Hpm
 1LYWB9LDj0WL5Oo2UZ5MAPuP75i2KtlE1phKgrGcra7IEOvd7HcG3y4x8Q4LBPpct7Ne
 OgxUs4tC65NBtYPq1jlPplBwaeXq2QD8AnuWKvHd1EVeslEgeHPbBJ3Qn6HC+glr+j05
 +Fi+1eGibA9h/UcvSf3DeCIaGd2V05RvfxvJ/K2+t6GwK6YBO1A5tWEvxUu99ZEUwRk8
 Qo7Ng7fz0pvGeyQmZ1aftCIv2H0sAb2bqCPUbPZgOsF161/4yIVB2aWGbOhyaK+LXltt
 IspA==
X-Gm-Message-State: ACgBeo2nKzlbUcPh5Rr0mdaaML7icdsFJvndwvKXA0mH0PusJ4/fftCG
 f5Fs3Rx9eLHJQhj/61ppLzYXSXcdx/rAUl41yCA=
X-Google-Smtp-Source: AA6agR6NkI7udB8T3WBKVs2mY82bWWlRx9XxM9G4YEp3tsRKWHbC+YQgLhwfLZ97d1S4JZWTxbwGtbibKyUmu8cZidQ=
X-Received: by 2002:a05:620a:2548:b0:6b6:113d:34fd with SMTP id
 s8-20020a05620a254800b006b6113d34fdmr5965196qko.132.1661513167097; Fri, 26
 Aug 2022 04:26:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-51-bmeng.cn@gmail.com>
 <c04114e2-f7ba-c985-f4ff-955b0f82e716@redhat.com>
In-Reply-To: <c04114e2-f7ba-c985-f4ff-955b0f82e716@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 26 Aug 2022 19:25:56 +0800
Message-ID: <CAEUhbmVOB8JNGZOoH84msXs81bz4UQBZAiVXMasqoBiyOknYJQ@mail.gmail.com>
Subject: Re: [PATCH 50/51] .gitlab-ci.d/windows.yml: Increase the timeout to
 the runner limit
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 25, 2022 at 4:18 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/08/2022 11.40, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
> > changed to compile QEMU with the --without-default-devices switch for
> > the msys2-64bit job, due to the build could not complete within the
> > project timeout (1h), and also mentioned that a bigger timeout was
> > getting ignored on the shared Gitlab-CI Windows runners.
> >
> > However as of today it seems the shared Gitlab-CI Windows runners does
> > honor the job timeout, and the runner has the timeout limit of 2h, so
> > let's increase the timeout to the runner limit and drop the configure
> > switch "--without-default-devices" to get a larger build coverage.
> >
> > As a result of this, the check-qtest starts running on Windows in CI.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >   .gitlab-ci.d/windows.yml | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> > index c4bde758be..d4fd821b5f 100644
> > --- a/.gitlab-ci.d/windows.yml
> > +++ b/.gitlab-ci.d/windows.yml
> > @@ -10,7 +10,7 @@
> >         - ${CI_PROJECT_DIR}/msys64/var/cache
> >     needs: []
> >     stage: build
> > -  timeout: 70m
> > +  timeout: 2h
>
> IMHO 2 hours are too long ... we're normally trying to limit the time of
> each job to 1h only and only extend it a little bit if we cannot really
> make, but we should not double the amount of time here. The highest timeout
> that we currently have are 90 minutes ... would that still be OK for this

90 minutes is okay for "make -j2" on the CI machine, but if we disable
the parallel build I am afraid 90 minutes is not enough.

> job, too? If so, please use 90 minutes here. Otherwise, it might still be
> necessary to cut down this job here and there a little bit...
> (maybe the tests now also work a little bit faster now that the migration
> test has been speed up in 7.1-rc4 ?)

I believe the build takes more time than the testing. But definitely
the latest migration test speed up patch will help on windows too.

Regards,
Bin

