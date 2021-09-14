Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9392E40AE10
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 14:42:07 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ7lG-0000zW-LV
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 08:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7jc-0007Js-Lw
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:40:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQ7jZ-00056q-OO
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 08:40:24 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so1969750wmq.1
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1twui3MbJMRfORhQn7k1jz/q6lVR44CPzW04OF/7Bl8=;
 b=AlZWQGiukSd2Qmlt8stSQK2RQwiFjpS2AYhBKzWAT90qbAu3repfNkWQ72e28yR7uJ
 ciul9oc42bN07yylCq5G8qUpKLB0eDyA/Nmf3QorYTTiBpirhpS1lgu1VuHmncG2FPJk
 NisqpS6Rc1iTMlONHEn35QgjQ5iKodoFzVeD1DbEePxgRu2jbZKrZHfIVKYMzS2cIWCR
 ByF/fradMUJiVPlIRv6JB/Cjo61J9So8FvzMC9PZEmdflSh7EiYc6SQmgXQutuzshXz+
 zu2elUdBL73GZVihDjMU1n7bErM2gUGFyVTQZBbX50RA9NVamLUAqKLoWbJ+qXM8A2Ec
 U3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1twui3MbJMRfORhQn7k1jz/q6lVR44CPzW04OF/7Bl8=;
 b=w2eN0ezr1sFVg5AB8H2V5BfX716Y6jVBbbH4iWtu3Ss3UvtJWleBXQSCKBmc0UVQ+j
 jDjk7eyiCteynd4+5zp7Kpcsr43I6V9kx/VPJmrYxGabCqeDMH0X19DGGA72armIFJHB
 Jx9hApFNieBuD15GE5V5KO/A2NL+0Tns4ybMGcNeb8xBMCCUu9Nb2SVUzWDxUbsQXdNb
 uhgZn0fQM/euprQAAtNy3WvXQu7LyHoQrZyFa3qELvAVDzUU308r1j0HQ2kI1bGBXqdF
 eiAA8GiS/4MtlzbGkTNCrRVDPS4E+c022XHFhM3ILyu+DqekB4+EbSpLi98HBnsl2MX2
 YWOg==
X-Gm-Message-State: AOAM530FFfURHQ6Ap5nEzef1P09I8vmK6ko4k50v4z/V79ov/ar1xqOo
 dYNROAugSDxP9GoCqZA1LXp6uOVQ6qbcRvUZ5RD0Ng==
X-Google-Smtp-Source: ABdhPJz4T5ea2DYUoENsZELPf2JwcmFCmpGE2XdM5rXp44x4K5kTLk5Fm1K21HcfO4S8O2sghCosyH6vSy5eKVZ6Ud0=
X-Received: by 2002:a1c:a505:: with SMTP id o5mr1987076wme.32.1631623220156;
 Tue, 14 Sep 2021 05:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210914001456.793490-1-richard.henderson@linaro.org>
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Sep 2021 13:39:29 +0100
Message-ID: <CAFEAcA_H556Z7KH+WEgFRCfiYLXVkwG_sO7_n0PEQBWEsMQJ=w@mail.gmail.com>
Subject: Re: [PULL 00/44] tcg patch queue, v2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 Sept 2021 at 01:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 2 drops the bswap patch that caused such problems
> on the various BSDs; I'll have to look at that further.
> In the meantime I've also been collecting more pending
> patches, and I might as well include them now.
>
>
> r~
>
>
> The following changes since commit 7d79344d4fa44e520e6e89f8fed9a27d3d554a9b:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-09-13 13:33:21 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210913
>
> for you to fetch changes up to 5b778e9b4e0e0a37a86200e6af322b2a9b69c62e:
>
>   tcg/arm: More use of the TCGReg enum (2021-09-13 12:09:05 -0700)
>
> ----------------------------------------------------------------
> Fix translation race condition for user-only.
> Fix tcg/i386 encoding for VPSLLVQ, VPSRLVQ.
> Fix tcg/arm tcg_out_vec_op signature.
> Fix tcg/ppc (32bit) build with clang.
> Remove dupluate TCG_KICK_PERIOD definition.
> Remove unused tcg_global_reg_new.
> Restrict cpu_exec_interrupt and its callees to sysemu.
> Cleanups for tcg/arm

Hi; this has a conflict in target/arm/translate-a64.c  -- would
you mind respinning it?

thanks
-- PMM

