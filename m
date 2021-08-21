Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B3B3F3AC2
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Aug 2021 15:21:14 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHQvx-00059s-7z
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 09:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHQu5-0004Ss-H5
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 09:19:17 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mHQu3-0002s3-O2
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 09:19:16 -0400
Received: by mail-ej1-x629.google.com with SMTP id e21so10140181ejz.12
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 06:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hLY9RR4vkz3NMhK0bxpN6+qID/AY4VlxO+UtG//mixo=;
 b=OPJYX08t6+cAX2ETRFx532nVlcaj93f2OvtZHE/oeqEf1ruCh2fcGCZk0XLdK5RbTn
 dDMDa1E3D/1UhHLCQXtPmjssUM+CmWZuKkXr5XymzaOXPZfN7zVP7I7BkILxCpN+umCK
 1uv9QGVr37C389FHMkNmPj7OpvhVSWYecAi68D8NO3jyLee7pQNabTjnOWm0mmTkVBS1
 /x+PRV5I+xNpOqJ6/kHvU26NG/fymvSS7jp7ZpQ9KfFeyANF+JbMNfnv/sWZx+QVkcju
 afBrGbb75ADJd4lwTJZWhqF4HkqI/EIcsYRJSfDQAOULApwrmFa5vA+wYnXCit6nOQmM
 KaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hLY9RR4vkz3NMhK0bxpN6+qID/AY4VlxO+UtG//mixo=;
 b=RDQxS1io3qLYWjzlzFHId1z1CZUoqegP6LtIelTCa84WooXUFFMW3kKMDYA0JPuvY3
 rvScmCWbybDQK16ZDhrHQRqGycVKeEffXDi2kvLAgN92mmW5E/Ucm2S+FNT8EWk/IW1F
 2HDGTYRWv+bwNkJpIHvlHttV23tm9oNLzkSNHip5vMVMZQHxBACTIbmNyJZtmFsTvI/x
 TwtILYvqW6F72U1EtstyTx1BVcr3RJ+uGHDsE+72OEabIZtScHFTjgI6YozNZeUtaqGJ
 DiAez0WB7nmI0kklyIfImi/VsQBF+qeFbN1vXh2rkYOdTtdNkuL6OmeXIPJfNePLReAb
 URBg==
X-Gm-Message-State: AOAM531j68Bi5By7VZ7t4tgd1F9/3fGj+Vg4/FcE1v6d+0zdh90zzNNr
 RjRTOVmc7xKRetbcIbGnksALgeWb0VjBfKJixbb1vg==
X-Google-Smtp-Source: ABdhPJwHE4en/c2PiOUK4tMz0mx4iyonDBZQBAiebCkdYXkZItBM2L4+ERwbxNQjABWcmr+fdQ0+6OHPP+b5loSTNq4=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr27397935ejn.56.1629551953238; 
 Sat, 21 Aug 2021 06:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
 <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
In-Reply-To: <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Aug 2021 14:18:26 +0100
Message-ID: <CAFEAcA8vKOmD+e7h1PSBEv_BUtkkcq8+SskZGhBNZ-kACs4S3w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] QEMU plugin interface extension
To: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 Aug 2021 at 10:48, Florian Hauschild
<florian.hauschild@fs.ei.tum.de> wrote:
>
> This extension covers functions:
>   * to read and write guest memory
>   * to read and write guest registers
>   * to flush tb cache
>   * to control single stepping of qemu from plugin
>
> These changes allow the user to
>   * collect more information about the behaviour of the system
>   * change the guest state with a plugin during execution
>   * control cache of tcg
>   * allow for precise instrumentation in execution flow

> +
> +static int plugin_read_register(CPUState *cpu, GByteArray *buf, int reg)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    if (reg < cc->gdb_num_core_regs) {
> +        return cc->gdb_read_register(cpu, buf, reg);
> +    }
> +    return 0;
> +}

At the point where these functions execute is the emulation
definitely stopped (ie no register values currently held
live in TCG locals) ?

-- PMM

