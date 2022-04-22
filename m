Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270B250B3E8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:20:25 +0200 (CEST)
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpSi-0002ij-99
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpAx-00026r-UJ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:02:03 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:46610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpAw-0001RL-1E
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:02:03 -0400
Received: by mail-yb1-xb35.google.com with SMTP id b26so7692525ybj.13
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f9+wGOBMOHnMd8HAk5Klcn/KBZXpyBJEBr/MoSNKGK4=;
 b=XktiUGLBr/MbYqndi1n69bKoztppaX/5Hj/PrDKv/jNQy0usPjDEEwGPvKzSx8Pf8Z
 2rdhf4awezh9hFC7KwTSsvNDhyuXdB0sY+bS3LEAUh5GjYlxnDvFxAU3zY904OjwRwsp
 UmPOBZihZLMewn0gBuMhhc4tdg/est2D0DIBeprJmfKn6bkA/Wvp3WZa2lkXL7BAQu8Z
 zsYJNb60CRMt7jdiH2dN8S29xAaZALMNfUAUvqRoecyhA+MG0cukSmpvB9rrRp5Yu99x
 1SsM++UvOHoY4C2W6GacD3HoywGFvcloRfETN4Ip8ZjlmpW70NV4deSTeytk5nBI0A0M
 4Cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f9+wGOBMOHnMd8HAk5Klcn/KBZXpyBJEBr/MoSNKGK4=;
 b=KH5uik0PBwVreMOVJe7NSRpIZ7/yRTJd+NxkiQMLw2u/aJsyXD4mZelqmO+L4vElho
 wbn623P+SZz2sb+GYDFM4s+qUyvTxybzDm9H6KxYVP/eewDrDgj/wDHMDkb+23UGKVZ+
 mXpnYZoOqpsEX8ps1SmtbOBX8rL19IBnYHxQDMUc6tkrSzVKYlc/Lfq9qSgNoXqX8mNp
 0dkPUZ7J3rDYVY13zjOD7qWSeR2zdFj3eV2TC9mgyWzWtdJTs7u9Z5Q0OIwQwgIHDNok
 LXzVtmbKWpoK0KV5/UzVGgb/gRai/UGctluFBr7O0jhRTzfxzPSIi0rql7BDuvshntAL
 UJRw==
X-Gm-Message-State: AOAM531ftEDiGQMRquFzi04tNxdsLVnyCr/vbCnQJndXrFc4njpT9ggg
 GufFAWOZS6xH8JkHxPyX3hZ0ooV2IibqtEH/wMSgaQ==
X-Google-Smtp-Source: ABdhPJz4DhrRf+b+9k1xw8kY6bNlkMf15hLDL9xpsCsPzLhDpr/1c/AN95kEg6/qRCgDocbIS57H+fS7lsnFRLBYUZs=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr3355865ybg.140.1650618120025; Fri, 22
 Apr 2022 02:02:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:01:48 +0100
Message-ID: <CAFEAcA_65pJg47Qsk8CSuivCJw+cze+h5fhaoRRD4qT4wn=e0A@mail.gmail.com>
Subject: Re: [PATCH v3 00/60] target/arm: Cleanups, new features, new cpus
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 18:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Supercedes: 20220412003326.588530-1-richard.henderson@linaro.org
> ("target/arm: 8 new features, A76 and N1")
>
> Changes for v3:
>   * More field updates for H.a.  This is not nearly complete, but what
>     I've encountered so far as I've begun implementing SME.
>   * Use bool instead of uint32_t for env->{aarch64,thumb}.
>     I had anticipated other changes for implementing PSTATE.{SM,FA},
>     but dropped those; these seemed like worth keeping.
>   * Use tcg_constant_* more -- got stuck on this while working on...
>   * Lots of cleanups to ARMCPRegInfo.
>   * Discard unreachable cpregs when ELx not available.
>   * Transform EL2 regs to RES0 when EL3 present but EL2 isn't.
>     This greatly simplifies registration of cpregs for new features.
>     Changes contextidr_el2, minimal_ras_reginfo, scxtnum_reginfo
>     within this patch set; other uses coming for SME.

To help reduce the size of this patchset for v4, I've taken most
of the first third into target-arm.next. More specifically, I've
taken patches 2-12, 14-16, 18-20, and 22, making the minor tweaks
noted in code review for patches 7, 14 and 18. Patch 1 is already
upstream. Put another way, I have not taken:

>   target/arm: Use tcg_constant in translate-a64.c
>   target/arm: Use tcg_constant in translate.c
>   target/arm: Use tcg_constant in translate-sve.c

or any of the patches from here on:
>   target/arm: Split out cpregs.h

(I'm still planning to review the second half of this v3.)

thanks
-- PMM

