Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C893750B713
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 14:13:51 +0200 (CEST)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhsAW-0003HG-Vi
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 08:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqzA-00046U-6y
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:58:01 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqz6-0002RX-PS
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:57:59 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ec05db3dfbso81200607b3.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4LC+Zz99JMG5l1jU+lb1vsE/ayQU3XqxIVGwQz6wcJk=;
 b=RIxssJXnm5xqRdRGVcQv25B+n9DmCSs+eDlRfcisP1znSdG8OqIygxyOQCbPjcBWUq
 UidS6yF9NLBrqFAfGl5Ca4GEDWK+pUrJ8Qk0apjoxpHI0bcdZRRF4/T4peXRMD8TjCdJ
 IR9zoE34CT6eRY585SyqIEsfAz2FTqc9WSecOHd9TgBarI0KvtXp9QWjP8pqve7BrOfU
 WdS2FzB4ubU0NxKAbFmv4T/9swi1GohbHYTBpaT1JIFA1cgqMdu0E42QBa7dO0eZ+j6f
 9/Rz451rO7vzqdmBwZvG5kU0NObZgAPAQHVVSSGHIKi/NkNcmv/FTuKI+ZdseG1Gyz+5
 vTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4LC+Zz99JMG5l1jU+lb1vsE/ayQU3XqxIVGwQz6wcJk=;
 b=MLzxuHcqq7R6igfrd/gRPOVEO/U7s4jrpoXZnLoLEtr6XFR/RQ3EsUvln4AGZTsQ67
 ITWAa/BO9kpSMpQCfMkdm5+5VotrDU8WaOxAT0Q06A+ZTswzhecQo90EumV0o8UZUVLK
 7C0qLayhkompAvEGwBR6lPrfz27ROHukhL5Df8MF/ah8sD/YwkWilveFkILjJuafjH1W
 /FHCR610WuASGTnIFDCumbLid0FHJC6ewuJHNdTqFNapU9XnLzGmTv/XkoPOjPUtDtsL
 ZwZMRxQNw4er3WtrXbkJ3qjT35xl8MtlKuDqgsdU8X7Be3yz9L4/st2TKcKaTeWfiaeT
 5G1A==
X-Gm-Message-State: AOAM5325NbRrfz2xhqFxq1VuZCNUqTojTq16oP9fwQ7gYrjWzRx8Cjq1
 FN81vGzCDIaRpOxDkAEA96vw3HWe7AJQEKU2wSt6xA==
X-Google-Smtp-Source: ABdhPJyVJyvjBDeXdRiZu+jeqaqs6SZGKAe74wsejajKM86V+OZSuJMtR7nHoXx41ZIPF7agoN0a/3EEiMV15dwHFAU=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr4036071ywj.329.1650625075840; Fri, 22
 Apr 2022 03:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-36-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 11:57:44 +0100
Message-ID: <CAFEAcA_SsEXfU9J1+AjWQXb2VMnNkT2XVN5na69N3CvmUGYhhw@mail.gmail.com>
Subject: Re: [PATCH v3 35/60] target/arm: Handle cpreg registration for
 missing EL
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 17 Apr 2022 at 19:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> More gracefully handle cpregs when EL2 and/or EL3 are missing.
> If the reg is entirely inaccessible, do not register it at all.
> If the reg is for EL2, and EL3 is present but EL2 is not,
> squash to ARM_CP_CONST.

I don't think we should do this unconditionally. Just because
the architecture usually defines that an _EL2 register is
RES0 if EL2 is not present doesn't mean that it does so for
every register or that it guarantees that it will continue
to do so in future. (For instance I found ZCR_EL2 and TFSR_EL2
don't have that statement in their documentation, which might or
might not be an oversight.) You could add an ARM_CP_ flag for
"RES0 if no EL2" or something I guess?

thanks
-- PMM

