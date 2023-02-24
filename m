Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB626A1B62
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 12:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVWBU-0007Zc-1E; Fri, 24 Feb 2023 06:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVWBP-0007ZH-0j
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:24:11 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVWBL-0002Z5-Cy
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 06:24:08 -0500
Received: by mail-pf1-x429.google.com with SMTP id a26so7733270pfo.9
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 03:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6J+E/BDUi0vbJWCId2Ueel5lv5wUONtEXQKRxXY918I=;
 b=XnrSYuAWrlBBHnV3rObG4ACwf1EBkyv5ZlBzos4nZrKiM0ydFc2O8tlB0SJrqtOfu4
 AX5u3W9BGKsl8Uzl07torPgoBqZodHRoH3yV4tTRbx+TCj4oZSc8bgpE6gRo2BO/K4Sp
 rAaGqCSQh6ajpwAKJHeN+M/dC4wK1ADg4KPZPQ1zcmX2jAKat2ENn/o7xaCPXGVbQZ1h
 2QspyUPReaTlCohYbG3c2fqqVTAhkhFtdmjZ0UfUdJBW/TLg1evZIrGoYKO1jPRGg980
 s/BD26lRbEkC336rKDVj7VFCQ8bBieExPY6804SQ6Yr/ieIi9631x3gGStn+dogU9Q0H
 3pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6J+E/BDUi0vbJWCId2Ueel5lv5wUONtEXQKRxXY918I=;
 b=VPz3ebJZbJ/E9GM4RRh+yI+Sx74XuwYMn15DSVx8b10L2QfsOqZxT08eTGWSKaNygD
 vMaVag0p80ud3wONfk9xEP1GPnl6a2ocdBSzzZuiMJES4xu9jZC8eymPo6zsD8glMC+e
 EowVnMLb6HmSEyfakkewEisS3Y6NaVAnVq0MVoa0yA48EEoVjfP8hTW3a+pmW0Us5/Gs
 aZD9A5q8oz2ZvR6sfSDq1OTEA4r7K6CQSqYB6vJUkli3y1V2Zv6pl0nm+NXW54xetcAi
 1HPNhUTrTyX8dJYsDT5E//MEf1Fd5uC/iLdvRW4yqfs7FedrceA4HpL0zSK/2rCX/fUc
 9hUg==
X-Gm-Message-State: AO0yUKXkoiboEVoOWcjhxJQAVJP+upFTypVXINYQE/HDtVVOp5t34Jm1
 JplxAuRXvPlIXhRvyoBp36x9wDKgnTa5Zy9NBwwYsQ==
X-Google-Smtp-Source: AK7set/4bp8xqhyi3H0DP43FR8nb78Rh2gX5ctCtE0Tl8bH72KEtzZZjIYZvgA36y1WCyOlPNFsMfUX3/bmEvTTToSU=
X-Received: by 2002:a62:ce47:0:b0:5db:b9b9:ba05 with SMTP id
 y68-20020a62ce47000000b005dbb9b9ba05mr1601002pfg.5.1677237845782; Fri, 24 Feb
 2023 03:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-8-aaron@os.amperecomputing.com>
 <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
In-Reply-To: <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 11:23:54 +0000
Message-ID: <CAFEAcA-==sYd-icB3Yu3LvJOocrrwXc1Yzzy9m0upn3r05JKgA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] target/arm: Add CPU properties for most v8.3 PAC
 features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
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

On Wed, 22 Feb 2023 at 22:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/22/23 09:35, Aaron Lindsay wrote:
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > ---

> > +static Property arm_cpu_pauth2_property =
> > +    DEFINE_PROP_BOOL("pauth2", ARMCPU, prop_pauth2, false);
> > +static Property arm_cpu_pauth_fpac_property =
> > +    DEFINE_PROP_BOOL("pauth-fpac", ARMCPU, prop_pauth_fpac, false);
> > +static Property arm_cpu_pauth_fpac_combine_property =
> > +    DEFINE_PROP_BOOL("pauth-fpac-combine", ARMCPU, prop_pauth_fpac_combine, false);
>
> For -cpu max, I would expect these to default on.
> Or perhaps not expose these or epac as properties at all.

Yes; unless there's a reason why we want the properties, we
shouldn't bother defining them. As Richard says, having
a 'pauth' property is a special case where we needed to be
able to avoid the massive extra emulation overhead of doing
it per the architected algorithm.

thanks
-- PMM

