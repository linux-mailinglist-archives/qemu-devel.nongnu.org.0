Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B563FEE87
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:15:59 +0200 (CEST)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmZR-0005rV-VY
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLmCY-0002oB-MC
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:52:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLmCW-0007df-Ub
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:52:18 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q11so2743243wrr.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 05:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYNmEGkIuFx6TjJSX+P6lLIIW6Ug3xJdcY/Vmj7fk5Q=;
 b=j9/+L7kt/r5BwbJCJUxsrFb2ll/Cf83FDNDq06t4CJbw1tNKuhIpQepoEaqxF81L9P
 /mLf7bdKXvN3cBIhswvZsFSRr9ZjrQ2g9xBXdxYfTdDAQFWvTbJ0/CbuoJbT4P9C2wAW
 GQzaLI0TA3mTCqnwrKSTq4JYP4EF/btJmcJgWP61jN1NMROheD3xOLFhglDUOc1FhREh
 T4bX2WtChc1/c8n/kHQC5T/ek4wFR7P3H7UCamkZwcRnJZb8WVVBP1OGLj6t73xt4lt+
 /6nuMlQzCJtyb76lxcn0Qdw3B7hhrqmmG14jBalE5mrvby78eiMxFg5Fo7j+j7/s6PTl
 3tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYNmEGkIuFx6TjJSX+P6lLIIW6Ug3xJdcY/Vmj7fk5Q=;
 b=LVgsCBbREB/VqxIyvvzw9UIt/XPSXdJBegRBPU0pjiXZZZF2J69mKYgu+JAo8BfUcC
 klcuVJt/RXiyIRlBWFSI6rcOyogw9PEtOAc2SpArXPiwig/STJ+nOg1pCR24rAoYaQUE
 GP9G+0Q/rGJ/6/kQsBzWvnbuDvlFhrB1HZbBcqG671OiI7FxQx7+gBnhHHeLglvcuWNC
 4TkFD9VZ/k8xyr6K1Yvk5EcZwc2oYRdYVDQk8aSnlgYhAV33xxlj/FNEf0gT+TBcGHun
 KSNSv+wmSDtKwBL0xLdTRfybMg33HCbys4Ng74Q4w/RXS7vgcKrWnh8gsDnqz8+qR+XA
 NuZg==
X-Gm-Message-State: AOAM533pD1xPLNwzG/sn0bb0R0VD3agS+sLyVDZZsf8Kn4EkBu/N2yNY
 2jWBqqzuNOtghqmsXuO24bwtHr+OqSPxm8marP8tZg==
X-Google-Smtp-Source: ABdhPJyu8fQZGxsp7XGM1iDn+hYFCoBKnDrIgCj+XJEd/0P1JSyVmLEhb1L8K7Gkx1qiUbq9TwwxPjHgouMkO0JOdWI=
X-Received: by 2002:adf:ba0f:: with SMTP id o15mr3539200wrg.386.1630587134332; 
 Thu, 02 Sep 2021 05:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
In-Reply-To: <20210902124258.mqjhx7lqqvkczf6a@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Sep 2021 13:51:26 +0100
Message-ID: <CAFEAcA-HC1=arh_4ysPv2L1JyT6sA9n_1aqJv__1Z7+09kYxiA@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sept 2021 at 13:43, Leif Lindholm <leif@nuviainc.com> wrote:
> On Thu, Aug 19, 2021 at 14:27:19 +0100, Peter Maydell wrote:
> > If you want a command line switch to let the user say whether the
> > ITS should be present or not, you should use the same thing the
> > virt board does, which is a bool property "its".
> >
> > If you want the sbsa-ref board to become a proper "versioned machine
> > type" such that users can say "-M sbsa-ref-6.1" and get the SBSA
> > board exactly as QEMU 6.1 supplied it, that looks completely different
> > (and is a heavy back-compatibility burden, so needs discussion about
> > whether now is the right time to do it), and probably is better not
> > tangled up with this patchseries.
>
> Hmm. I mean, you're absolutely right about the complexity and need for
> discussion. My concern is that we cannot insert the ITS block in the
> memory map where it would be in an ARM GIC implementation without
> changing the memory map (pushing the redistributor further down).
>
> It is also true that simply versioning sbsa-ref does not mean we end
> up with a properly aligned with ARM IP register frame layout. Some
> additional logic is required for that.
>
> If we assume that we don't want to further complicate this set by
> adding the additional logic *now*, I see three options:
> - Implement memory map versioning for sbsa-ref for this set, placing
>   the ITS (if enabled) directly after the DIST for sbsa-ref-6.2.
> - In this set, place the ITS frames in a different location relative
>   to the REDIST frames than it will end up once the further logic is
>   implemented.
> - Drop the sbsa-ref ITS support from this set, and bring it in with
>   the set implementing the additional logic.

I don't think implementing versioned machine types helps you much
anyway, because your users are all going to be currently using
-M sbsa-ref, so they will by default see the change in device layout.

I do think that we should get the "with an ITS" device layout right
from the start, so that we're only dealing with 2 possibilities
(what we have today, and the final intended layout), not 3 (today,
final layout, some intermediate thing).

How does guest software on this board figure out the memory
layout ? Is there a mechanism for telling it "this is version 2
of this board" ?

-- PMM

