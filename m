Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380716F5866
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 14:58:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puC3x-0005mg-M6; Wed, 03 May 2023 08:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puC3l-0005gH-68
 for qemu-devel@nongnu.org; Wed, 03 May 2023 08:58:17 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puC3h-0005NN-7B
 for qemu-devel@nongnu.org; Wed, 03 May 2023 08:58:16 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bd87539c2so2408916a12.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683118690; x=1685710690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0l5N0Q8xjKDA5zjCf+wNEcl2LzNFZlRFdoEPd1aH0dE=;
 b=nuQHAWXT9yiDjrUFgzw6ZWakY0IxncJ2okm7KITWcmnC3GO8VO01xxX4Kb/Jg4WuJ7
 UeZ8aN+Yl72k78nwZ6wPEEOKzOP/En9/yLhB/ZzeLvUewnbI+3EmYFsIvDYzB5r7q8jP
 xe3VFsinJkFJEQwYRhixCdJ5BHMy32ytzQlpMUTl5JXJb3XBEvPAWpdzCPR01xNpGYPU
 a+1uEXFcyXG4ENQtz065drnK0UMrblgrHeV6PbLL/dLMyTmDN/0MZ/EqEYttzLgmhrK+
 pItS8n4DfEtF3Wb4vVZEKzWR/R6Q5Ob2Rm6JRZaX4ahHtnV5sjfVVmFcrR1ybLeLJbIV
 A+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683118690; x=1685710690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0l5N0Q8xjKDA5zjCf+wNEcl2LzNFZlRFdoEPd1aH0dE=;
 b=gyqrvfe7NBtToTHAWw/DTl6e93dMqs21B/DiF9fCy/W7WKD2R/FWNs2FR7v0En+rfr
 NtEEAXD3XHaqC1TZQsoFGiNv31oXL2zVO1CCQvGcOk+THUGIFW+YSyRYFMesIKqEvDpV
 Uyjw7gMcCUcDFCFwwVimrKNIln61iwfPDemPL2kADf82NDQY62IPRRAS4NN+xB2PMnpS
 99KmOrc9Q6OLa3UXXYCNwa4FEZDvWr2c9xZr9eceV3Sq+aYNT7a7aHNUYkjsiEPa+la4
 IjSUZOL4Zyircga/a+D3Jor9DNKOMjv+dU5HsgYePAS8jVUx4QMJ0eNTqx2ZlzbeGDG9
 fJcQ==
X-Gm-Message-State: AC+VfDzzvB3Ow6Qw7l17SOYjfTv3R0qX4ABXmF5UD/wF2uVEXglNjQbY
 xuLRhbBSDaG0EjNwAUB1U2bN+xwyQFP2yClRpyGi1w==
X-Google-Smtp-Source: ACHHUZ7mxUUke+apxT0FLsMWOzAK1BCfJ536uCuQDeeiQmIDM9ay1GfjulY1ymjIOsFrZKx5PsJ8hRTcIYXuVKkSodk=
X-Received: by 2002:a05:6402:4c5:b0:50b:c475:4f8b with SMTP id
 n5-20020a05640204c500b0050bc4754f8bmr7919342edw.15.1683118690172; Wed, 03 May
 2023 05:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230428191203.39520-1-quintela@redhat.com>
 <5f76c54c-b300-8597-1b4e-fd29b3603d35@linaro.org>
 <87jzxrt3u7.fsf@secure.mitica>
 <CAFEAcA_G734ap+L-YfLt5Pd65VXFm2xcx_SFwD_ke8B7pcQGbQ@mail.gmail.com>
 <87lei5sriq.fsf@secure.mitica>
In-Reply-To: <87lei5sriq.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 May 2023 13:57:55 +0100
Message-ID: <CAFEAcA-gu1Xxp49wOdtpif-C04fFd3nFrC+qNa8NizmPq9HGLQ@mail.gmail.com>
Subject: Re: [PULL 00/21] Migration 20230428 patches
To: quintela@redhat.com
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 Leonardo Bras <leobras@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, 
 Lukas Straub <lukasstraub2@web.de>, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 10:17, Juan Quintela <quintela@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > On Tue, 2 May 2023 at 11:39, Juan Quintela <quintela@redhat.com> wrote:
> >> Richard, once that we are here, one of the problem that we are having =
is
> >> that the test is exiting with an abort, so we have no clue what is
> >> happening.  Is there a way to get a backtrace, or at least the number
> >
> > This has been consistently an issue with the migration tests.
> > As the owner of the tests, if they are not providing you with
> > the level of detail that you need to diagnose failures, I
> > think that is something that is in your court to address:
> > the CI system is always going to only be able to provide
> > you with what your tests are outputting to the logs.
>
> Right now I would be happy just to see what test it is failing at.
>
> I am doing something wrong, or from the links that I see on richard
> email, I am not able to reach anywhere where I can see the full logs.
>
> > For the specific case of backtraces from assertion failures,
> > I think Dan was looking at whether we could put something
> > together for that. It won't help with segfaults and the like, though.
>
> I am waiting for that O:-)
>
> > You should be able to at least get the number of the subtest out of
> > the logs (either directly in the logs of the job, or else
> > from the more detailed log file that gets stored as a
> > job artefact in most cases).
>
> Also note that the test is stopping in an abort, with no diagnostic
> message that I can see.  But I don't see where the abort cames from:

So, as an example I took the check-system-opensuse log:
https://gitlab.com/qemu-project/qemu/-/jobs/4201998342

Use your browser's "search in web page" to look for "SIGABRT":
it'll show you the two errors (as well as the summary at
the bottom of the page which just says the tests aborted).
Here's one:

5/351 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test ERROR
246.12s killed by signal 6 SIGABRT
>>> QTEST_QEMU_BINARY=3D./qemu-system-x86_64 QTEST_QEMU_IMG=3D./qemu-img MA=
LLOC_PERTURB_=3D48 QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storage-daemon/qemu=
-storage-daemon G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-v=
mstate-daemon.sh /builds/qemu-project/qemu/build/tests/qtest/migration-test=
 --tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
stderr:
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
Could not access KVM kernel module: No such file or directory
**
ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status:
assertion failed: (g_test_timer_elapsed() <
MIGRATION_STATUS_WAIT_TIMEOUT)
(test program exited with status code -6)
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95
=E2=96=B6 6/351 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migra=
tion_status:
assertion failed: (g_test_timer_elapsed() <
MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
6/351 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test ERROR
221.18s killed by signal 6 SIGABRT

Looks like it failed on a timeout in the test code.

I think there ought to be artefacts from the job which have a
copy of the full log, but I can't find them: not sure if this
is just because the gitlab UI is terrible, or if they really
didn't get generated.

thanks
-- PMM

