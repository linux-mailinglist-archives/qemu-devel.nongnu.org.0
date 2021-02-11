Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F13318C61
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:50:08 +0100 (CET)
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACMB-00021P-Su
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:50:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABpR-0005Xk-N2
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 08:16:18 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABpO-00075n-7c
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 08:16:17 -0500
Received: by mail-ej1-x62c.google.com with SMTP id bl23so10008270ejb.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tWxorh/X8/6luqEWfHVFvTNKWGTDatoq4XOZ0BUEycU=;
 b=bL437tQ4qAndHywaeXhJBXiiF+zQs/6+vZBEasq2WZH4OcI6QlUibykO9+iLHT5Tt1
 /6imvxxJWjvTM2+MwPXyhskSfdNhwyd03f6owDSw3AQAROgDjs+HjnUPFyELN7WBcNBC
 5aG2c10uaoUVN94cgjYpbV8iun1POUZN2ygLZMg8nxlFFeUzwn7AJ6TnNs4c9XpVZii/
 fal98YvqxoyUEipFLplWpaET6fmymhLCkglrGu9mhLZYMFK7Gz9XRq4rWGaaN6/LOLJS
 G2NwV49Kjlr0sKBjNvGp1JEA3X+65pw2fZRRXs4TQQShPEvaFx9jmJ0rBwr8GmUmA7Ox
 3GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tWxorh/X8/6luqEWfHVFvTNKWGTDatoq4XOZ0BUEycU=;
 b=ITgEdm8csmJ/dpSZhJxj6z3Pc7v53QczO7FFkjhWppp2Ase359nBh9DuVgMLIcZFHG
 Ga1joULaffEIJt9xoyzhvQnQOvcy0MB+r928ROmlJy3T8w5neb7gHp1J09KGzcV/KGMz
 eCKclL0ZHFeCSAdzX1mqcDU57Zr78/BSf5ZGOsN4jdZ7LYxnYVTuFOV8Ge74PYoD3mtJ
 GqtWBDL2nJEwbDB18gqE6XxLszStgsEO23HZqoWC+uJGXfSpJmEwMYi7bIDM9l3uL35K
 SPaCwYJdt6i63OtTIIWDyojpclmGR7Pd1DGEE8QcRH5vdh8M0awIAZTHUpUEcnCyliMG
 Dxiw==
X-Gm-Message-State: AOAM53170u7GRQN2v2m0dt0R+1AI1ex/BR9Mmv6eQPY+RRH/KGyNHBfn
 4tIBfVCUAwyTOWmIVpb1oxKoGh0WYEaSBxno09iFLg==
X-Google-Smtp-Source: ABdhPJz/KDj+QdgAwQCkqTOGlqSTVM9tJxQx1adRXdYbUY1V1AYTG3jsB1L7c0jsOzJrmFNe2wyRZhLEKyzkePh8aRU=
X-Received: by 2002:a17:906:2e4f:: with SMTP id
 r15mr8489803eji.407.1613049372166; 
 Thu, 11 Feb 2021 05:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-8-agraf@csgraf.de>
 <CAFEAcA_-4GYk_+jdczWE720-VH1CLcS+1jVB2LzG=bBBJc8w-g@mail.gmail.com>
 <298dcf49-1a99-9406-275f-b05c8befd13b@csgraf.de>
 <CAFEAcA_ze+J7geayqgaV274anQubqiv56qan7wo8EkxZ14Nydw@mail.gmail.com>
 <37018444-82a8-96c0-b5ce-da056646a1b8@csgraf.de>
In-Reply-To: <37018444-82a8-96c0-b5ce-da056646a1b8@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 13:16:00 +0000
Message-ID: <CAFEAcA9bmV4jUubwqrQXzPXMFfNCsyw7XD34dLW6HBU7_uQvRQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/11] hvf: Add Apple Silicon support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 13:06, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 10.02.21 23:39, Peter Maydell wrote:
> > On Wed, 10 Feb 2021 at 22:21, Alexander Graf <agraf@csgraf.de> wrote:
> >>
> >> On 28.01.21 16:52, Peter Maydell wrote:
> >>> On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
> >>>> +            break;
> >>>> +        case EC_AA64_SMC:
> >>>> +            cpu_synchronize_state(cpu);
> >>>> +            if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
> >>>> +                arm_handle_psci_call(arm_cpu);
> >>> Have you checked that all the PSCI code really can cope
> >>> with being called from a non-TCG accelerator? (As an example
> >>> the CPU_SUSPEND implementation calls the TCG wfi helper...)
> >>
> >> I have not explicitly tried it, but I don't see why the TCG
> >> implementation of wfi should in principle break with hvf.
> > Because the TCG implementation of wfi is "set some state fields
> > and then longjump out to the TCG exec_cpu code-execution loop",
> > and hvf doesn't use that loop.
>
>
> I can confirm that it breaks, but are you really sure about the longjmp
> not working?
>
> What would you prefer instead? Duplicate the PSCI implementation for HVF?

I would prefer that you worked through the details. In other
words, mostly my concerns with this series are that it feels
like it has a lot of quick-hack "this makes the guests I tested
boot" stuff in it. Examples include this PSCI handling, the
WFI/timer interrupt bits, the way the GIC is done, and the
"let's ignore bogus SMC calls" below.

> >>> This should inject an UNDEF exception into the guest. (Compare
> >>> the pre_smc helper in target/arm/op_helper.c for TCG.)
> >>
> >> That would break Windows, which is one of the main use cases for hvf
> >> support in QEMU.
> > Why is Windows making bogus SMC calls ?
>
>
> Let me have a quick at my crystal ball ... mmmmmmhhhh ... it's a bit
> blurry unfortunately.
>
> I really don't think I'm the right person to answer that question :).
> But the Windows loader does invoke weird SMC calls on boot:

Does it boot under TCG ? Under KVM ?

If there's an SMC API that we ought to be implementing but aren't,
then we should implement it consistently. If the guest is doing
something wrong, we shouldn't put in fudges to work around that.
Once that kind of hack gets into the codebase it is practically
impossible to ever get rid of it.

thanks
-- PMM

