Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88898580278
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 18:12:09 +0200 (CEST)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG0gi-0005ro-7R
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 12:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oG0Xt-0004xt-2L
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 12:03:01 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oG0Xn-0002vc-LK
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 12:03:00 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id f73so20848286yba.10
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5b1iNNXdM+k4Y36waGvR5FLMxxKYaV7GdMA7dimYPs=;
 b=u2bHl9QtLeDt1u3AUFwj4fCbA0ueyj0ZQc+GfPXDnVAzASbRVTXaZFfmXlonAFs/5b
 iFiJuy0iNOfKokWD9EO7tZFjB9mQ5O03FTBDGpEmcz1FQVlb6s115jV9qfjLAE5stssx
 a8TvclKSw6CIAw0s+N//hgpPus/d6UqA5gkF9gxPyg7WGlr34oj/t5DQu/NbD134ClfW
 M3+PV0en2/djQ2AZpLh8Af96DneXLC4BSoQUd/upGdGL7AC63o4d/uoEZzUHsDS7J1/1
 WmWfmJ0OkWzzbmiIvSjQ5RZWnnaUSdPFWpf0kA3w1rsIiJmPMduPQ9CELYReynX/SU8p
 XpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5b1iNNXdM+k4Y36waGvR5FLMxxKYaV7GdMA7dimYPs=;
 b=kyccpdkuDrRkhQTKhUxwk3wvnSSdG/H0akKLU6mP/P0ErnNUh58gqS+PZFTgUQiXze
 kTcFvWst307osPWohijJfWnghZURsUwhR3X4g+uaaDIB35nqoLdUL8Gx3xbMW/CN9KR1
 b+U43qGv/zwpvQZhrytTmPx7U4/8sYutrJ3trI9caPJWSnVebAX23WiNXzdFJlRnjVSa
 HvkPHiwmiEJhHvPhEdptplEDqhHWdX07WjaPd+jN8LMMhzJA2hIegpbsIkGXPznQ5sG9
 1NPneMy1kvK3yCXPSaY8yz/igSicBr0qK0HHzxyBPt0w4QZvbUPuwKs1TQDuktC/KeAV
 rNdA==
X-Gm-Message-State: AJIora+6Ukhcbj/TusV64EyALemrwk+YURu4tp5Wbm3Bqc1YkdiZjDHi
 2yvmeyU0QsWEgGGkV9yxEVq60qC7ExdJUxhHPo4i1m9xzD4Giw==
X-Google-Smtp-Source: AGRyM1sstypB0GG0O7KgN/CEEcCsNx0ZJmyqOihUvvZDESqTpOueHwJPy+pIodHIRFLlgeg2zUFdxE/sPgqfq0HYa6E=
X-Received: by 2002:a5b:7c6:0:b0:670:6ba6:d046 with SMTP id
 t6-20020a5b07c6000000b006706ba6d046mr9534562ybq.140.1658764974548; Mon, 25
 Jul 2022 09:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
 <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
 <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
 <4B583095-ED34-4D33-A193-59666FBFAB8A@livius.net>
In-Reply-To: <4B583095-ED34-4D33-A193-59666FBFAB8A@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2022 17:02:14 +0100
Message-ID: <CAFEAcA8BJ+jphWCMNemBC30x+wf3PW2kqSqNz6pCHeD+RyBFeQ@mail.gmail.com>
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
To: Liviu Ionescu <ilg@livius.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jul 2022 at 16:56, Liviu Ionescu <ilg@livius.net> wrote:
>
>
>
> > On 25 Jul 2022, at 18:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > ... the memory map for the 'virt' board doesn't change for the a72
> > versus the a15. In both cases, the memory from 0x0 to 0x08000000
> > is the flash memory. So QEMU is incorrect to have reported that as
> > the place to put the heap in SYS_HEAPINFO.
>
> Could you also update the documentation pages to reflect the actual memory map for the Arm devices? It took me some time and experimentation to find this for my tests.

We document what the guest can assume about the virt board
memory layout here:

https://www.qemu.org/docs/master/system/arm/virt.html#hardware-configuration-information-for-bare-metal-programming

Flash at 0, RAM at 0x4000_0000, must look in the DTB blob
for all other information.

> > I suspect the fix to this bug is going to be "make sure that
> > SYS_HEAPINFO doesn't consider memory regions that are rom-devices"
>
> Sounds ok.
>
> > You don't mention which QEMU version you are using.
>
> 7.0.0
>
> > Do you have a test binary I can reproduce this with? That would save
> > me a little time.
>
> I have a template project that can generate several binaries intended to run on QEMU:
>
> - https://github.com/micro-os-plus/hello-world-qemu-template-xpack/
>
> The only prerequisite is npm/xpm, the rest of the dependencies are handled automatically.
>
> If this does not work for you, please tell me exactly which binary you need, and I can try to generate it.

The one where SYS_HEAPINFO produces the bogus result putting the
heap at 0x04000000, that you mentioned in the original report with
the command line

.../qemu-system-arm  "--machine" "virt" "--cpu" "cortex-a15"
"--nographic" "-d" "unimp,guest_errors" "--semihosting-config"
"enable=on,target=native,arg=sample-test,arg=one,arg=two" -s -S

thanks
-- PMM

