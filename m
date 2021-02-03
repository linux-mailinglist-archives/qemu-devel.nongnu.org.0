Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B1430DE19
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:28:40 +0100 (CET)
Received: from localhost ([::1]:50130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7K58-0006HF-Sq
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:28:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7K2z-0005QZ-Oj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:26:25 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:42736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7K2x-000488-7s
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:26:25 -0500
Received: by mail-ej1-x62b.google.com with SMTP id r12so36389722ejb.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 07:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=llwwOIvKhGLRhh4735rAHXtKBgbXi62qgm9FyRRJeOk=;
 b=pRvCDqWWwgYrVhUreCVXjnrUaCwVolXS9SEzQm45NJV7rNAXXxg9zad9mor2ANiKd8
 cMmyJlXeM0Xwq5JcAhBeDqUJuxW23ppOzW6VEbb7FqnGFUy7pqcTXbhkFYNFEqVfOYSN
 uNCuL0I6+6iBPXeK19kJ3dQO8SQWMakFjcldMMvtngUqM+QBOaIfDo6s3fxVNLmyCzPP
 f/nUI9uW1z210eYozVP/N7hKfeH8wezd/OzCG/zEfQhWzKx8II4kuhUs4jGmSYKi6Ys0
 cpVf8W/r2c9GfpexTLn1t+CIYtVPglVzt8SnpzQvrGkYo47Cvm6ajGJvmfanjYdsmllv
 0TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=llwwOIvKhGLRhh4735rAHXtKBgbXi62qgm9FyRRJeOk=;
 b=QttiSDRHSWCvTRh/cW2pMQpYdLwhigWAUMBfzSJQsExzS6RUtiYNb8JSXdybl6u6sK
 nl6Bq/BfvXuJudNnc/Yr4jb0VLdDGG4LDA7jX2bBeWeCSKI1BpNvegg0VujlTKkYP9W8
 bV6kst0/q9v+tR3diWld7N9/5lc3AGFgqSuAN2Y2bbW9fog5OPE3vGo5Zz1GhKaDfc0K
 r1tbpMdo+/ArYShDwelk9jYsTyJ6fJPK2xy0QqAQKPCIvaZIvbErTDqVI3/ZyFTigdjU
 7teiy7jo+OJzh9wIikVNCr12TnzSIjqfFWV8vJUs9us9YstI/hRje26QmSbVkIrQPLVx
 aMEA==
X-Gm-Message-State: AOAM531fPtNVjMfvMgUjllHS7JbduwroREpsm5aa+6yjIBc94YUQqK+R
 7dcAe3onmL4UtiP8mh506C2zHRp5HIkW3Z1/AIQxpw==
X-Google-Smtp-Source: ABdhPJxWqFLm6UN0aIGc2FbdB2VRXY26o7MfU4LoY0Iv0QK6s7k7GkPhVv9J+w7o6D0iHLuVmv4ZDmq036LbPAezqOM=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr3757131ejc.482.1612365981711; 
 Wed, 03 Feb 2021 07:26:21 -0800 (PST)
MIME-Version: 1.0
References: <YBogDGJRU5pcDKmi@strawberry.localdomain>
 <CAFEAcA-_N2CiNtjPi3hnk285Xdy3RuL8dY8QFhF0TnCydng6yA@mail.gmail.com>
 <YBq6Ct8M6AfMr0Bx@strawberry.localdomain>
 <2572efa4-8aa3-32e4-7559-f93e6522d284@redhat.com>
 <20210203151053.GK2950@work-vm>
In-Reply-To: <20210203151053.GK2950@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 Feb 2021 15:26:10 +0000
Message-ID: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
Subject: Re: ARM Snapshots Not Backwards-Compatible
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 15:11, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> It's interesting that on x86 we've got a longterm request to *add* cpu
> features to the stream to detect screwups caused by using mismatched
> CPUs; so it's not necessarily a bad idea to include it once you realise
> it's there.

I think we would want to do that by checking the ID registers,
not the legacy ad-hoc feature-flags word. In fact I think for
KVM at least we already perform the check on the ID registers,
in that the kernel will return an error if we pass it a value
for an ID register and it's not the value it should be.
I forget whether we try to check this for TCG (the mechanism
for handling sysreg migration there is different).

As a side note I suspect that the first two issues Aaron ran
into are TCG-only and don't affect KVM.

thanks
-- PMM

