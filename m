Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A601B699B30
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:23:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShy4-0007gW-0y; Thu, 16 Feb 2023 12:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShy2-0007gE-AE
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:22:46 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShy0-00035l-H9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:22:46 -0500
Received: by mail-pg1-x52d.google.com with SMTP id e1so1719906pgg.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676568162;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sbio814rV6jzgN5Pjf79wpkew0WRoB/DmJ59mYScAAE=;
 b=Mb/lBjHhHavtmQEiI3iRKW+plXv0tyvhwHcGtAaFor5auzXahb6SSQ3AIpbzmsalXi
 DWbvdLSBPC+Jf4H/bRacRy5AQrflutRO/SlCsULHvtdV7MxT5a80oQRovHdpL5wOdPfD
 0VCKGZBPDWj6XOKvydVq89xeY6VdlzXAjgHlL4npTfL5XrgNDkWt5o8G5HGMRlcuCWey
 M+Zgo+84eUNN2Y+jkOGI0g1w3k5SERmw7kncTaitxNqGhEe1ZK1ZRxpK9jBrefSv5KLO
 rcRpFpZdkBDnivXMRXogF8SZyViCELIW0OaZQXcxAhk2W/d9NeDsyVvRhq2gu8zwExr0
 DdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676568162;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sbio814rV6jzgN5Pjf79wpkew0WRoB/DmJ59mYScAAE=;
 b=UmWkWslpmKcN9EljLGpD3rzqOgb29bxMqsElsmiA3ygySfgAkTWxARJEkJV1CNUY77
 v8J+9v7y9Ft4sE6NzbG+3ooq3EW7Vu/CasOLeimmeo9Q/fexJd9ccdySknQhr63b1hbN
 +vi8qQthxZf+ombcWPLJbeHgihCnGaqFbO64BCuPjsvX/anVwi1skLFwEKbLXax88T50
 AVteT189Gfhn2r0TwsF1h64fbiA/fLhJahLWukKGUUeA+iuucoZ8YRSxXwY7PCNQjSfz
 h8QtoHWfPNfylLQLBz0B3VtVfwj4apDHbK3bN+dtio+qwJosyGcgtx14nuTKDMzNUxfb
 06jA==
X-Gm-Message-State: AO0yUKVDlyeTwYAvwPNwkq1STYpv6ZATFVVjDvT70cr6wUR1RoXKBZqA
 hw2yKznTehH8WPafL8h89p0eIUyO0W7X5gNcV/ZlLQ==
X-Google-Smtp-Source: AK7set8OwqF3mDfKQvEpHPj8Uq+y3r9H+p0pb9S6JnX/twBzlfN3/WjNbg3LNzKmgUyG7AjiSeK+b669YdzRK3AtHzM=
X-Received: by 2002:a62:840e:0:b0:5a9:babe:6cb9 with SMTP id
 k14-20020a62840e000000b005a9babe6cb9mr211464pfd.48.1676568162597; Thu, 16 Feb
 2023 09:22:42 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de>
 <CAFEAcA8yXgqdCvt6KWHQBUNrjca_n2gWeBG-=RGQQKR1vWrf6A@mail.gmail.com>
 <87357536br.fsf@suse.de>
In-Reply-To: <87357536br.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 17:22:31 +0000
Message-ID: <CAFEAcA_Zz2ko88N4x=x=mPabf5674VgNmewK3e49Gjs1GSTL=w@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 00/28] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 16 Feb 2023 at 16:47, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
> >>
> >> Hi, could someone take this?
> >>
> >> I rebased and put the two series together to simplify. I'm keeping it
> >> up-to-date and tested while it doesn't go in.
> >>
> >> CI run here: https://gitlab.com/farosas/qemu/-/pipelines/776103500
> >>
> >> Based on master.
> >> Supersedes "target/arm: CONFIG_TCG=n part 1".
> >
> > I've taken patches 1-5 into target-arm.next.
> > Patch 6 doesn't apply on top of my tree, which is unsurprising
> > given that it's trying to move 9000+ lines of code in a single
> > patch. That's so much I couldn't even figure out how to recreate
> > the code movement locally. The diff is not very legible either.
>
> Ugh, sorry about that. I forgot to apply --patience on this last resend.
> That diff should be just a sequence of 9k '-' lines and 9k '+' lines.
>
> I'll try to split it up, let's see how it goes, the ARMCPRegInfo arrays
> are huge, they might end up pulling everything with them.

If there are opportunities here to split some of the different
categories of cpreg into their own file, the way we've done
already with the debug registers, that might be a way to help
structure it. For instance the PMU registers could probably
all live in their own file, and the generic-timer regs similarly.

thanks
-- PMM

