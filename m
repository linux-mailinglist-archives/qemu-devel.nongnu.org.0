Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 556636B68E3
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 18:43:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbPiM-0004CK-3M; Sun, 12 Mar 2023 13:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbPiA-0004AP-TM
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:42:25 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbPi8-00014q-DQ
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:42:22 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so14822639pjb.1
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678642939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QjvdzZ3/+iomuuTr8wJvk2+ouYHjK9XmaNE9F3q12us=;
 b=aShRkgqOgLMzVqvPmxIkThBDmqWJlW81NOP5ua234LKEJve0Sr/SgtcTZp34sIIlaf
 6UewFbCISL8z92Jxt8t/6lb4iKgy6T14KeEQ7scoGgA7535D28swkDKIDYopF93YVVWr
 VeSmE4FzQLbdc7K+tJAJLC/HPqB6ZWUf0cmgesoMKGrRxEH4imp1OZ1VGn+JiGrtVmhK
 bmk0jIbK4RmoJI+uTw9OawDSBZcPUnU1VVEvtHWDWzTCLlYZA1TwJ3CzKrH1MM/+zTX2
 OYMb8LnRhAJRs/Uh60WokVeidvFHpe1yoqYr3gDPD1Uy8Juw7IOrcf77KrFe91ETLbHy
 FLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678642939;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QjvdzZ3/+iomuuTr8wJvk2+ouYHjK9XmaNE9F3q12us=;
 b=AzIxU4cUtzpYNdEq+tjTLDZ5D/IhYhsyVuYtQVcWuZ3Ay/2lTiHQpvjfP1Enyar3oP
 eDZ5F0A5RQ/Bk+5J/YHoVEc78Lu1cov4vWyJRTlEdN5mDfYwkts3/vMZ4KGCToc4lh17
 qVwID53aynaqisuKL+MIP7wXqkbstl1TOH8/DoovGJYvaEWBxR19L22ObGFb59Hwp0dP
 fUrI+K/yqWxQVGJ3czRhDFYxLUHNVzP9pUzD4vH3ZRdoVih7P2VODs9R843WRmuts4uv
 KYl7Sc5Ot4htDald2FaacnnnGt45R6IXcuY1izNzcucqI+y/Qnc2NBW0W7N4Y75088JU
 SAhw==
X-Gm-Message-State: AO0yUKWlJ+o1vLdOAUfauYWadhjerIKRwJaC7hqY+wx9dq28H/WP4Md3
 zbSqfCd+TWQxzacmNCkN7klu3LfZNXI1JNGA5L24MEittWZxNA5B
X-Google-Smtp-Source: AK7set+13+ufkE7VXHPO66XqQ595pTIpExwk1KHupf4W5FmbMY8G9qtPbw2UkoHm4lBPGc1rXfb+vpTW9IPwSM4DqtY=
X-Received: by 2002:a17:902:ba94:b0:19f:2164:9b3b with SMTP id
 k20-20020a170902ba9400b0019f21649b3bmr1957367pls.13.1678642939186; Sun, 12
 Mar 2023 10:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230310220927.326606-1-laurent@vivier.eu>
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Mar 2023 17:42:07 +0000
Message-ID: <CAFEAcA_SgWD9SZgM78bLx4xX_DSpaaDz8M1P6MM8SS6KpPyyrA@mail.gmail.com>
Subject: Re: [PULL 00/28] Linux user for 8.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Fri, 10 Mar 2023 at 22:12, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 817fd33836e73812df2f1907612b57750fcb9491:
>
>   Merge tag 'audio-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2023-03-06 14:06:06 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-8.0-pull-request
>
> for you to fetch changes up to 2732c739d846fc7a1972e984d71a3de0d3eef77b:
>
>   linux-user: fix bug about incorrect base addresss of gdt on i386 and x86_64 (2023-03-10 20:50:11 +0100)
>
> ----------------------------------------------------------------
> Pull request linux-user 20230308-v2
>
> Fix gdt on i386/x86_64
> Handle traps on sparc
> Add translation for argument of msync
> Emulate CLONE_PIDFD flag in clone
> handle netlink flag NLA_F_NESTED
> fix sockaddr_in6 endianness
> Fix brk() to release pages
> fill out task state in /proc/self/stat
> add support for xtensa FDPIC
> Fix unaligned memory access in prlimit64 syscall
> add target to host netlink conversions
> fix timerfd read endianness conversion
> Fix access to /proc/self/exe
> Add strace for prlimit64() syscall
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

