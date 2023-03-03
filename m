Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D47E6A96FD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:07:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4Am-0000ea-LQ; Fri, 03 Mar 2023 07:06:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY4Ak-0000eD-RC
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:06:02 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY4Aj-0001Dg-1Y
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:06:02 -0500
Received: by mail-pg1-x52d.google.com with SMTP id bn17so1300354pgb.10
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677845159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zaTCnMNEhh9zv+yOtKux4pGWDREu6RdJLlJbGBShUg=;
 b=McDrB7aptbft2LG2iFMHUj4xIOR9fLa33PEZ7hjZvcgyHz8zdrLkPKlfeI5jvKQRjT
 AMD6pEKSMUFG7OXXB+YGimhMQgaLyI8p1pPwbx7CID0jN1gN0Dy/xlrTjL9FriQQMk1H
 7R+yTtn1DeZVrZjDHqYgs/6ZJYQB6KZPRJHUshf/iNycL3xxi4w0sixwtYmiKVzhdh3U
 lp0jkBMb1ok/WGRpc9G/44l6Ugmw/yFZccEmTONHe8SCRofaktJdMkJX0sxIYCoMUakE
 OjpbdE1ECq31emSwHl9HoZKYlP6P/Tl08w6ApctLXMSdS/ECsL0E/E4LNs9FBwbrrYJz
 EGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677845159;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zaTCnMNEhh9zv+yOtKux4pGWDREu6RdJLlJbGBShUg=;
 b=VGPKa8NQ7n8hX2Nb1RVK2Sb7DrrUJAhGA0pepLSOoSSc9tIofOnsoOcNQ5YcInauNA
 4S4+jPwi6x7fGYWgZt+Ajztd+b8FbIchMg2sVGZLCXyQYJEqKHzO8QbXpzHdNN5YzxCF
 dVB8o3sPF+Y8YNx9ptYNY0kQL3BhKzngj7gJ6nR5vlHTENsvLhhVbrkFNyvNykEGGgLV
 S+ANz64uH7F9B7DfJOCqIiQJ51diROlUD4XM8PSRBPXgN26EhWlBGztZx1k/nRqDqEch
 Od03PM6W98IA8MIKuB0XT6xYbM3HUMxnt9qayvnWrLR/9GRe98pE3w0gsIb8dQZk/hX3
 b2Hg==
X-Gm-Message-State: AO0yUKXI9Me+g0UAYPpvYW2Z6vqTJ7uz3cXQQIiqIYeaTuoZKBFuyiAH
 UduSgiEXmoB+kUT79x+tA+SAjfhzl2+xL8A9PpO5Gw==
X-Google-Smtp-Source: AK7set/MPVQyyXM69MRlUj8AL8PVGqjUG+vpFnumWaQpCgBchnMoOOP6f9Xp3vv7SEKaoxZQLnHX9xHRzF2nYRr83VE=
X-Received: by 2002:a63:f705:0:b0:503:7cc9:3f8d with SMTP id
 x5-20020a63f705000000b005037cc93f8dmr421828pgh.9.1677845159373; Fri, 03 Mar
 2023 04:05:59 -0800 (PST)
MIME-Version: 1.0
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com> <87edq6i4jf.fsf@secure.mitica>
 <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
 <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
In-Reply-To: <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 12:05:47 +0000
Message-ID: <CAFEAcA-U568vrLKHegfKQWu1RfUCRjdOKZQMoFXSde1yk4V3Wg@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
To: Thomas Huth <thuth@redhat.com>
Cc: quintela@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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

On Fri, 3 Mar 2023 at 11:29, Thomas Huth <thuth@redhat.com> wrote:
>
> On 03/03/2023 12.18, Peter Maydell wrote:
> > On Fri, 3 Mar 2023 at 09:10, Juan Quintela <quintela@redhat.com> wrote:
> >>
> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> >>> On Thu, Mar 02, 2023 at 05:22:11PM +0000, Peter Maydell wrote:
> >>>> migration-test has been flaky for a long time, both in CI and
> >>>> otherwise:
> >>>>
> >>>> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> >>>> (a FreeBSD job)
> >>>>    32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migr=
ation_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_=
WAIT_TIMEOUT) ERROR
> >>>>
> >>>> on a local macos x86 box:
> >
> >
> >
> >> What is really weird with this failure is that:
> >> - it only happens on non-x86
> >
> > No, I have seen it on x86 macos, and x86 OpenBSD
> >
> >> - on code that is not arch dependent
> >> - on cancel, what we really do there is close fd's for the multifd
> >>    channel threads to get out of the recv, i.e. again, nothing that
> >>    should be arch dependent.
> >
> > I'm pretty sure that it tends to happen when the machine that's
> > running the test is heavily loaded. You probably have a race condition.
>
> I think I can second that. IIRC I've seen it a couple of times on my x86
> laptop when running "make check -j$(nproc) SPEED=3Dslow" here.

And another on-x86 failure case, just now, on the FreeBSD x86 CI job:
https://gitlab.com/qemu-project/qemu/-/jobs/3870165180

thanks
-- PMM

