Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8B44162CA
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 18:12:07 +0200 (CEST)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTRKP-0006Zs-KU
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 12:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTRAR-00033w-H0
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:01:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTRAB-0005zO-HE
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 12:01:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id w17so18527174wrv.10
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 09:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfzRawJda6mvj5kS0jBtyYMDPU6QJ17qRFLbeUyW5vs=;
 b=wqI+xG9w7WIW1UxG9uCXAFO9lyzeX8HF2OBsmcSTMyTE2AUEm67nb3W9V7MTW16bFi
 Bt+N24zBD/Qg2SEUtUof3PMvkvYiomHE1Tof4FvoxE1VBTSPApOo0tDcW66pPyQxLFoo
 o8AzCscCZ5OLGK8g1AkWj9PmHwxxW3c4XwFyjLCQXgHoCiO6LyQAaW33OGmgNQxUvigF
 NxaP/kublmdJcajtKG838x1Skz1O7ULFTrU7P1Arymf1hizos1cnMgAWpQFotQYOw5Mg
 HNjhQqZ+2F/rFlL90uQ2v3ng6h4n4ytEvlfxFeXlKsbNIMCUjcgJtFG1vXNaWmdujvNs
 aQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfzRawJda6mvj5kS0jBtyYMDPU6QJ17qRFLbeUyW5vs=;
 b=pRVaByHuh3ZZsrXEluTiTXL7WFOvGTOhhyBRPBAcmLLxUhv1M3OqTOQV6aa8tdSyTY
 x1nP+xIXai7ibkfXFFuZyL9hKCm17KKENR+2JShsaICAxttXFIZi4QeRT+NlidIjgs2Q
 dtUS5st9E1kA7ExfWxEmG7faZy5u+ak2oqJkzYTgqcbrflHb9puORX6AYl5jXuF6yVFy
 DuDzt2PexVpI41N6PQLy0p1qpPhhuV/+Fcw5TkCtU2vpJnMZNrh/53KE9ODuIKiBDHbt
 fW4iXbDXYsjmeh8GTPBBnBTF/e1eaaN2OGVtZnf2GGrmAkwkgTc3PKhaNI/Pn7kJQLvT
 UW9g==
X-Gm-Message-State: AOAM532Wa//dh6/Wq8sW7UIt9/6y+CAwr4lsGFix4VOTBHyqxPAu/3nb
 IQ2iRLHiBqbWOweRh47ghUyC6tF3Cv3sL4GFD7CUAA==
X-Google-Smtp-Source: ABdhPJxNnXgZyyJKAPW4gCWH+PRqPqQBtqrctlO89c361Re7YOjLxOLBwQ5RA+w7uFHPV8ZG2JIIuTZIZO8xKzGOpRU=
X-Received: by 2002:a1c:a505:: with SMTP id o5mr5354215wme.32.1632412888332;
 Thu, 23 Sep 2021 09:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
In-Reply-To: <20210902124258.mqjhx7lqqvkczf6a@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 17:00:35 +0100
Message-ID: <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
>
> Typing that, I'm getting the feeling that if I was the maintainer,
> the third option would be my preference...

So, we took that third option just to get the initial ITS support
into QEMU, and it has now landed. Where do we want to go with
the sbsa-ref support ?

There doesn't seem like there's much coding required on the QEMU
side, it's probably about an afternoon at most to update this patch
to match whatever we decide we need to do. But it's very unclear
to me what it is we should be doing.

Leif, what's your plan/preferences here ?

Presumably somebody also needs to do the system-software side
of things to handle the ITS being present and the redistributor
frames moving...

thanks
-- PMM

