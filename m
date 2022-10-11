Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9D55FB6C3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:17:11 +0200 (CEST)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiH0H-0006bP-LP
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiGts-0000z3-OK
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:10:32 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:46897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oiGtq-0000GD-Ud
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:10:32 -0400
Received: by mail-qv1-xf34.google.com with SMTP id o67so8674742qvo.13
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MIB1i8t3d4VNwUifvETPqTGvDPlOeGGQPzw1MYZ+q/Q=;
 b=JUWSOzIqmkPeHS6ZZE0oJd/Ag/DC/CbxB38lfx8KN4orRodwQ3vn4jlkFwJJQoEezj
 8grylu2MAWR9dfXeDORNs9axd3fMDTS/xnWuAnTsklgxY7eyKSrtEgak9G4i2Z5/4A/+
 4/2RhsgVXWozlBx45Z4VW9lH9B0hyRuFDhB3j2gW1zFNC8Yu/w0eAAwWEnK8+AQ0a8Mb
 h07HkVchEtr8xEfbpe6PJmIacXhECTvqiUnWpF5SLrQ2+Xyu1mCxJZk9vMVUaQBgQYZ2
 bBwdhrHtJKkCMfTrMRaod9eCJvFcCWVR+CKbDa+63DheHdcQdVpgD83YaMXmBLsS759l
 TlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MIB1i8t3d4VNwUifvETPqTGvDPlOeGGQPzw1MYZ+q/Q=;
 b=04wGM7e13xu6B9xJ6znJZ4aNb3/MDL/BozSVaiSGLHI1+UJGVD92cZLGOzDiYwe4B7
 PpArTizJwE3qRVF+HkPwUXRCnKDKiS5roK6jJUQ5yX9UV9cdQ3ZrulJyKNvhvxeNVT8y
 8RDLwPcFfV/zYR+3rgJexuG1slf6tgOIk7BLsNvtyakAIT3VCxYXGv02p+zSJUFvjnng
 m1X/rFO2Boza1x+efuF4FndIq6pbHgNoeJj3A6j/CYKr/fkCP0QOZVAAQATfsTTVQCGW
 5w8gysrLTBqp9NhiSelU7UzNP/N9Tv3BU0C9qvG73b+sVUwiKPm9jFdiWubTmQTidw0B
 ZPvw==
X-Gm-Message-State: ACrzQf0c7Rd2LoZy4jYp1lSBXNRMiYPwm3NmVHN5XPr+6IRtB0YOnbre
 WpusPQ2afNNgSHPCE9PCJrcr9bEAyq9MxnY9juE=
X-Google-Smtp-Source: AMsMyM4wEQ0lt3KMJctzUilPLUwGleh+Qpt+YI0VG3RNSLAlfgqtl5H+5w/Dhnxx4eOtimjeJFLoYdPd6XhKflUeD4E=
X-Received: by 2002:a0c:f2c6:0:b0:4b1:79bb:77a9 with SMTP id
 c6-20020a0cf2c6000000b004b179bb77a9mr19165775qvm.51.1665501029774; Tue, 11
 Oct 2022 08:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <20221006151927.2079583-18-bmeng.cn@gmail.com>
 <e80726cc-633d-435c-7a2a-5cae43624282@redhat.com>
In-Reply-To: <e80726cc-633d-435c-7a2a-5cae43624282@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 Oct 2022 23:10:18 +0800
Message-ID: <CAEUhbmWbtFhu3mSVeO6YsTxT0scuYxanOXKiTx_ET4YCqRWpaQ@mail.gmail.com>
Subject: Re: [PATCH v5 17/18] .gitlab-ci.d/windows.yml: Increase the timeout
 to 90 minutes
To: Thomas Huth <thuth@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qv1-xf34.google.com
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

On Tue, Oct 11, 2022 at 10:41 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 06/10/2022 17.19, Bin Meng wrote:
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
> > let's increase the timeout to 90 minutes and drop the configure switch
> > "--without-default-devices" to get a larger build coverage.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> > (no changes since v2)
> >
> > Changes in v2:
> > - Change the timeout limit to 90 minutes
> >
> >   .gitlab-ci.d/windows.yml | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> > index a3e7a37022..093276ddbc 100644
> > --- a/.gitlab-ci.d/windows.yml
> > +++ b/.gitlab-ci.d/windows.yml
> > @@ -10,7 +10,7 @@
> >         - ${CI_PROJECT_DIR}/msys64/var/cache
> >     needs: []
> >     stage: build
> > -  timeout: 70m
> > +  timeout: 90m
> >     before_script:
> >     - If ( !(Test-Path -Path msys64\var\cache ) ) {
> >         mkdir msys64\var\cache
> > @@ -60,7 +60,7 @@ msys2-64bit:
> >     - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
> >     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
> >     - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
> > -      --enable-capstone --without-default-devices'
> > +      --enable-capstone'
> >     - .\msys64\usr\bin\bash -lc 'make'
> >     - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
> >
>
> I just gave your patch set a try in the gitlab-CI, and for me it even did
> not finish within 90 minutes:
>
>   https://gitlab.com/thuth/qemu/-/jobs/3156107033

That's longer than mine. My test took about 80 minutes.
https://gitlab.com/lbmeng/qemu/-/jobs/3137520040

Not sure if it relates to the MSYS2 required tools installation before
the build starts? Or the shared runner was too overloaded?

>
> I think we have to do something different if we want to run the qtests in
> this CI pipeline ... e.g. disable some subsystems? Try if compiling with
> "-O1" is faster than compiling with "-O2" ? Use a different target-list ?
> (well, the latter would be a pity since we would lose compile-testing the
> HAX and WHPX support) ... Sorry, I've got no really good clue here :-/

The gitlab shared Windows runners are too slow. Is there any
alternatives for this (e.g.: github, azure)?

>
> Additionally, there was also this error in line 2792:
>
> ERROR:../tests/unit/test-aio.c:501:test_timer_schedule: assertion failed:
> (aio_poll(ctx, true))
>
> Is that something new?
>

I never saw this error before. I guess it's unrelated as this series
did not touch unit tests but qtests.

Regards,
Bin

