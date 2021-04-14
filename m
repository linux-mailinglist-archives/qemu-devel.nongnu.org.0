Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DAF35F114
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 11:52:04 +0200 (CEST)
Received: from localhost ([::1]:39804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWcBk-00064M-DD
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 05:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWcAH-00059U-BI
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:50:29 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:44881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWcAF-0007PR-5s
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 05:50:29 -0400
Received: by mail-ed1-x52b.google.com with SMTP id f8so22903023edd.11
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 02:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UTcobpO/9736ZBQJYMOKuThyr27AxSdM6qny0lqdy8Y=;
 b=mNc0DGgHPOcJjlkLrSPRcAnXgVnmzNS3/QrJ6TJTuRpPDg5zW+FInj7r0PUq9IMof+
 uj1SOJ5P+/oRZzD6kfWBR5wu9y2UOdFOMRdAorj/20w/1laiYVkhkTJCSo8cnhFyabIK
 3eYMJg7N25OhH4KFs4dVpqSuNxPXIPVkSqmT7v/bdxHgD1sitCJNzBSU7cxGEzefPz9f
 AH/H+TQRKwUTZ0z1HEYkDg2oFkjPii6l3NMgAExwGGABX9LT9KPsF8/V5/nh8QoyXssH
 aAZKoGV1G2N9obGNkIvMs2Xi4vy09Ir7c36+SqgQ2TKbiNSIv+yYKSWuoyLFP6rxcWnP
 7Z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTcobpO/9736ZBQJYMOKuThyr27AxSdM6qny0lqdy8Y=;
 b=W7i8ateqr/h9yYTBhFBvgXLbLZawwOPF0fA24cc2RZw3qWEs9mP0ONBJchEHe6SpDA
 kICB6KYNR3XJ/tpEGdQ99ad5S8ixPWM8MKXav22zHPQnHa6EQgevmaG05AE1u5ioQCaj
 e4Se8jg45iN1YNMMoGhwWBqgrwAr45VCB3iqNfjb0N4Bkhm7KAaoXm/H4lJVNYVh3Xcs
 e7mA4mm4uEMAkyBw5xzKubEwO1YApiTkHzn3w5kIXK+U5tnMZSqNqcIT6LdaSPmElkY1
 ysqHuaaHmeflxO6VjTL1+8CYXqdYHtBMKPED+0r4UaYbZy+CcxkGXR1F+9atWH7lJqO5
 eSWw==
X-Gm-Message-State: AOAM530PZy9JaevmiKf1nODVmqkP2D/fcmZIaNEZ4++1GMuQrDfccloM
 m7oP/HI/sCy5VwaOYfikSV6vz31vfB8LR+2M/l6IwA==
X-Google-Smtp-Source: ABdhPJxC+rW933C+OiQnuGfER2BF9Ex/EdYJ0lKmMDF8oUFSuwaAiWjHclNtLrJ26qsOO95UBTvy5cIlt8hTFjHGsBM=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr39817297edb.204.1618393825688; 
 Wed, 14 Apr 2021 02:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAEtFKsuPfRS1_exHPBNE-BLthbXoudUOcX6ND80FA=JqV8LrzA@mail.gmail.com>
In-Reply-To: <CAEtFKsuPfRS1_exHPBNE-BLthbXoudUOcX6ND80FA=JqV8LrzA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Apr 2021 10:49:39 +0100
Message-ID: <CAFEAcA_ywvyxvW_jbjy0SnQGyu3+eaW6KPK4Gfe5K11DxVbxQA@mail.gmail.com>
Subject: Re: Issues with modifying pc in a sigaction handler
To: Devin Hussey <husseydevin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Tue, 13 Apr 2021 at 23:44, Devin Hussey <husseydevin@gmail.com> wrote:
>
> In a toy project I was doing
> (https://github.com/easyaspi314/ThumbGolf), I found that qemu will
> incorrectly handle modifying pc in a handler.
>
> Specifically, on platforms with instruction alignment requirements
> (most notably ARM), if you set the pc to an odd address, QEMU will
> start reading unaligned instructions.
>
> Naturally, this is frustrating when dealing with ARM Thumb functions
> which have the lowest bit set when referenced, as you must manually
> clear the Thumb bit instead of it being implicit on hardware.
>
> The following code exhibits this bug for ARM:
>
> ---
> #include <signal.h>
> #include <ucontext.h>
> #include <stdio.h>
>
> static void hello(void)
> {
>     printf("Hello,");
> }
>
> static void handler(int signo, siginfo_t *si, void *data)
> {
>     ucontext_t *uc = (ucontext_t *)data;
>     // Effectively bl hello although we assume thumb state
>     uc->uc_mcontext.arm_lr = uc->uc_mcontext.arm_pc + 2 | 1;
>     uc->uc_mcontext.arm_pc = (unsigned long)&hello;

This is setting the arm_pc field to an odd number (because
the compiler/linker for Thumb will treat "take the address
of a thumb mode function" as a request for the value with the
LSB set to indicate Thumb mode. However, the ABI for the
uc_mcontext fields is that the arm_pc field should be the actual
required value of the PC -- if you want to go to somewhere in
Thumb mode you need to set the arm_pc field to the true PC
(with the LSB clear) and also set the T bit in the CPSR field
of the uc_mcontext.

So your code is doing something it shouldn't and has thus
wandered off into a corner case where QEMU behaves differently
from the hardware...

thanks
-- PMM

