Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2E4CED2C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 19:20:33 +0100 (CET)
Received: from localhost ([::1]:54904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQvUe-0006p6-1f
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 13:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQvQe-00021F-2X
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 13:16:24 -0500
Received: from [2607:f8b0:4864:20::112f] (port=40098
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQvQc-0006yl-AC
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 13:16:23 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2dc0364d2ceso141555237b3.7
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 10:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xPWP9hWIrkrwR2NqonYG0Kltw/iEcElWChG+T/ZDaPg=;
 b=tg2lgIOBUZcrRABTGDLP25COCBI4yNNHAcXrB7xnsmQeBkagfe7egUCXuEqN7eA9jN
 8Fran2NuF3+79vVj4IyeOnnpVonlrxVufIRwaa4yt0f0FsdIGj/ak3GqhmhEtGCY99BE
 Y3mMlo4KeAtNgw4Zi7tpXiV2pk/qtBn2JlbWpBRh6ML6B5Mioz5ceLDGal1II8CZTrJP
 HokH8V8TMOkXB/YWJHQch7s5akiyZhiuPUFI3Y5Rkuxhe74txsM8ijJ/C3bKtrxxdnaw
 OC4MGZ/LTjUzIPyEa1CVxkSodhWTKwPe7v2V4oiDOnMA007gP8ge+WbaSiP8KrW6MVD/
 9RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xPWP9hWIrkrwR2NqonYG0Kltw/iEcElWChG+T/ZDaPg=;
 b=LtGcgl6p+CAtUpR7zUYtyvkeoR1SAoE4Bm7+YpHUChC/MZcq8iqv5gr+Aj6F8Fc+jb
 YokcNeUWukV4yo8mE0Pv+/LGPEa1R2g76Ae9v4jvO/vJTQ9mbj4uHa2LyqSX6Ll4Rcq9
 jreRkfmkdUuSTakKf1qKC8OzssL6cMWcF8NAXsKgubZeF4N6SyW1ITexdc8jSY9B/OxE
 WQ7EyQbJ185TNawcAnop5K09ytqhGOurTK7YtgRU8C7SrgtHrfKsg5aoNn2y3hOTCjb+
 qVdIkAD2UU3pa54LIw2J+74NM0023u+s2xveRt4Xb8wHhQWpCbFNH5DTK2LeVdRguBwN
 kIfg==
X-Gm-Message-State: AOAM532bbZC6D/WHVV+tWjgpjOuYoasFd8vu/5tDkdk/W+d+Xupf6nNA
 XL1H5XyYsbFxsMrLRR7MlI/tNQFawbxVCLNQKOtaZQ==
X-Google-Smtp-Source: ABdhPJypMl18N6gs7cKPFeMDbzr4TVt0YrILIQF5NfQA+8VQExiLmDuhnkWu4HIn/7wil35tPsicZ/bJpp9S/IrIWz8=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr5813985yww.64.1646590581199; Sun, 06 Mar
 2022 10:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Mar 2022 18:16:09 +0000
Message-ID: <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
Subject: Re: [PULL 00/33] Abstract ArchCPU
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022 at 13:03, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33=
a5:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' =
into staging (2022-03-05 18:03:15 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/abstract-arch-cpu-20220306
>
> for you to fetch changes up to 5bbf37aa89881751828d28e38608db0371874aef:
>
>   accel/tcg: Remove pointless CPUArchState casts (2022-03-06 13:15:42 +01=
00)
>
> ----------------------------------------------------------------
> - Re-org accel/ and softmmu/ to have more target-agnostic objects.
>
> - Use CPUArchState as an abstract type, defined by each target
>   (CPUState is our interface with generic code, CPUArchState is
>    our interface with target-specific code).
>
> ----------------------------------------------------------------

I get a compile failure on my OSX box:

In file included from ../../target/i386/hvf/x86.c:24:
../../target/i386/hvf/x86_emu.h:27:30: error: declaration of 'struct
CPUX86State' will not be visible outside of this function
[-Werror,-Wvisibility]
bool exec_instruction(struct CPUX86State *env, struct x86_decode *ins);
                             ^
../../target/i386/hvf/x86_emu.h:39:27: error: declaration of 'struct
CPUX86State' will not be visible outside of this function
[-Werror,-Wvisibility]
void write_val_ext(struct CPUX86State *env, target_ulong ptr,
target_ulong val, int size);
                          ^
[ditto for all the other uses of struct CPUX86State]

thanks
-- PMM

