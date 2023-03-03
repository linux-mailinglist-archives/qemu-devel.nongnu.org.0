Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ABF6A95E6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 12:19:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY3Qy-0007wd-UT; Fri, 03 Mar 2023 06:18:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3Qx-0007wL-9t
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:18:43 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY3Qv-0001xy-Ms
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 06:18:43 -0500
Received: by mail-pf1-x430.google.com with SMTP id a7so1291425pfx.10
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 03:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677842319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HbpQhNZ/dSPaFmyNoEXBlhteytNsJs9z2iPj6cVUqhY=;
 b=phxaI1w8JZV9/77RX2arnfdVecR1rEl3WwkJJ3xijd53BA+oBnTLAAKSUYR4EvIA1d
 CLu20qUX7CV+zkg/UyqEWDj/F4QA5Hq3Yhsvgp2iTbauSNH02mmhEHsccJvQ3wrorpoq
 UK+YOP1kPQyxCywPWAWuepiqM+9QM+Gn27eZ2v1dkRIXaA4i4XQwe+AOrmxXrlrAN3Lq
 fMoEF781H2y/vNioY+wJv/icjp2zxB2B/kdKGdRQO6XTXDw0B8AJ77aoLyg9TmRQRNOt
 u5CkG8z937s2B7EFw3rFQHokje3M4tJRiO3s2Hz7sHjDecPFnuG0iu8rdLvybRJebBFl
 yh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677842319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HbpQhNZ/dSPaFmyNoEXBlhteytNsJs9z2iPj6cVUqhY=;
 b=TVKL6Y7RHapDXayZLBNrxninDlYlkruLsWKhCpxv3RF/CjczxcOWNdna8+cgdtFWY5
 P/lAiVEnH0MBaQR5psa6PoKuD/3YeaE3i3fok880EMDO07Z1QgkQzedI91Bsht4lPhFo
 +FlQtUVeNckkiWg8amPnzuori65wJAUJ+RQEHEqv3IPYf0LISwpws6/ic7GSYDqfS0/e
 R0Ro8p0qYMA9lpfg7oDbjZO/FSl065WkekaiT6oWvm1iJYTFjJeEmK9OqxRFGse3eHMi
 HTsrSu9LS5/f9TYmKTuk5Jf2/t5rjAM0jJKDrCeI4OyLeubxZzSlwRSWlzsR7QnjxEpU
 YGAg==
X-Gm-Message-State: AO0yUKWIQVeMGZ3c8Leww94zTaXkYzK9DMo7F+wdnJ0Y32GHnOA8VRlm
 bNe8JxU3LGO3amL1X2wetzvX2o5XFYe40PW7lWyV3w==
X-Google-Smtp-Source: AK7set9r6//k1CungiSRz6HBxJGE+0rmPzaqhqN7Bjf/OuHDpM7XJogKEL5xFB0feW0YqX1KvW9mCZ5Ma2u+gNPomDI=
X-Received: by 2002:a63:7d03:0:b0:503:4a2c:5f0 with SMTP id
 y3-20020a637d03000000b005034a2c05f0mr341299pgc.9.1677842318840; Fri, 03 Mar
 2023 03:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com> <87edq6i4jf.fsf@secure.mitica>
In-Reply-To: <87edq6i4jf.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 11:18:27 +0000
Message-ID: <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: quintela@redhat.com
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x430.google.com
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

On Fri, 3 Mar 2023 at 09:10, Juan Quintela <quintela@redhat.com> wrote:
>
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > On Thu, Mar 02, 2023 at 05:22:11PM +0000, Peter Maydell wrote:
> >> migration-test has been flaky for a long time, both in CI and
> >> otherwise:
> >>
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> >> (a FreeBSD job)
> >>   32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migrati=
on_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAI=
T_TIMEOUT) ERROR
> >>
> >> on a local macos x86 box:



> What is really weird with this failure is that:
> - it only happens on non-x86

No, I have seen it on x86 macos, and x86 OpenBSD

> - on code that is not arch dependent
> - on cancel, what we really do there is close fd's for the multifd
>   channel threads to get out of the recv, i.e. again, nothing that
>   should be arch dependent.

I'm pretty sure that it tends to happen when the machine that's
running the test is heavily loaded. You probably have a race condition.

thanks
-- PMM

