Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3202EF3D4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 15:18:15 +0100 (CET)
Received: from localhost ([::1]:45542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxsak-0004iD-3i
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 09:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsZ5-0003dK-Ff
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:16:31 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsZ3-0008Hl-39
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 09:16:31 -0500
Received: by mail-ed1-x533.google.com with SMTP id c7so11327390edv.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 06:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mLQfpG/xAL/ln16xrJTSA3DJ4YwPS5WhjEJngGqR6gs=;
 b=OHLVtNHB+2BCxQKaNgj6fgBd/yPMcjWxDycF9GYIoQdWppGbjIMzKSL4XztoDlQm5b
 oe2sY7sm8X5yW2gJbZYNK080Db1p9axUSMP2r56BRRhI5qFdL0ayV8d/gFeJ9+pyEcod
 bBU25DPYbjj24QP/r7oCmqjzmw6i7QxQ25fQn+LoO3dFrdy0HUUSQ3jr91hEVEVWMwcM
 ZZafUn7YYsjFqfQKkGrhZtTnO1unkIMdK9ghwmhDi37x43ihvf0HpWxBL8O/0M7PEZ3W
 0YaCx9UO4L29yjKGTM22TKmjqwwwL3trbMLxjYjX/hh7yHu7bxWIEw6HqkDbWKwZuwFc
 6nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mLQfpG/xAL/ln16xrJTSA3DJ4YwPS5WhjEJngGqR6gs=;
 b=X5auiAn668oQuLFDccRzTIdxK88pcB8eFTwPxaD1xuklSr2SCg35eqpGCgVywckJcN
 nFM3Anziu34qQhfAuCkYk4ja14W4Kw3ii1B81ZMdWzhDGN0ViOM67xy9SaETuHmUxq4l
 o7sc2ozI4qbZ0QBECmwFyAcIXts1mJfP+p/9AFI1qWUaPPBkgyHRuUV8HfnVoOEK54qc
 EfDZVENInz49ObxsvtQDlBUwjWUfEB2QB8Ob+HUTI+BoTu9pNlzBvL4gLt3hLjCNy+Sy
 GF2sIEvHtfIjSaw4T+maxSs3sE2yqHvt0FJhv3btqjU9B5mfxaq5/EI1sooQrgyEd2MX
 fhKA==
X-Gm-Message-State: AOAM532hsMHB0pSKpVvLon1Kv1iDjgbWC9d1rgqo4XCKIWDJDfL8Biws
 AeR9ljKynntJcY9Vqwr5n0TuUxjD+RVJiXLqtxM5Ig==
X-Google-Smtp-Source: ABdhPJw0aE36WY54qH+BMgSJyx0k7eybjb0JnPmB93miANsU45Jxtqvx/VAgZZgqHLY8McIXx6W02wqUzFQFWZHEYzs=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr5296788edw.44.1610115387614; 
 Fri, 08 Jan 2021 06:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20201216221247.522686-1-richard.henderson@linaro.org>
 <20201216221247.522686-3-richard.henderson@linaro.org>
In-Reply-To: <20201216221247.522686-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 14:16:16 +0000
Message-ID: <CAFEAcA-ptDOQ-yO5KXiVe3E1UFyDH8wj-705F7fQXR4bsVxxBA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] target/arm: Add cpu properties to control pauth
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Jones <drjones@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 22:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The crypto overhead of emulating pauth can be significant for
> some workloads.  Add two boolean properties that allows the
> feature to be turned off, on with the architected algorithm,
> or on with an implementation defined algorithm.
>
> We need two intermediate booleans to control the state while
> parsing properties lest we clobber ID_AA64ISAR1 into an invalid
> intermediate state.
>
> Tested-by: Mark Rutland <mark.rutland@arm.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Could we have some documentation of the properties in
docs/system/arm/cpu-features.rst, please?

thanks
-- PMM

