Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131A44018CB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 11:27:51 +0200 (CEST)
Received: from localhost ([::1]:49706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNAus-0008D5-5p
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 05:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNAsu-0006rY-Vi
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:25:49 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNAst-0006yS-5x
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:25:48 -0400
Received: by mail-wr1-x433.google.com with SMTP id v10so8824995wrd.4
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=THfGlBol6wmZdZN87ntqx1yN+eYUhN7rrliCHA5eOr4=;
 b=axZ4jE7f28P0dF8FcAEkcWfS/FlLq3kYWlAYbAmYZvcNHZnQrboonegJ2ogpYo0EoZ
 wXnfYcFN1IUQSCB3qYk9Qq66yXBwppBqZTvRFnfAGATEnE5e/qc626F8Uye21OqwKZrk
 t7QyGkmrfQfrLUyCmW3lnTZw2ieXl38gAENK09hiopNwAhklSGQ2O7no3el5FAvYNlN0
 uH4QGvilMu6nvwC2QZJ2PPyyZNKadGjBn/9PXuZOjzB2LVDqZ2KPlmWhIJv3gYKgEWFP
 W/OhjUftj9No3UuaPiUZ3D/FVr2jNND0WraNH586q8GQg52VYSkwtookY8fr425H93tN
 61Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=THfGlBol6wmZdZN87ntqx1yN+eYUhN7rrliCHA5eOr4=;
 b=LkjpBbiKqsPkhd5aW9rTaBMhzWVZzGxhk3fu4WJDe7AwpFS1xZz6Dy4lTIlji/3FfU
 ns5mN5HPGQzCKmVqsmuThgOE66ffTshKsRXi0BwGWafJa0Hmg28Tz5rXHCNsMr1DnwzH
 D7s/Vsj+Ju+wlPCtKRTvm34fyfnZpX1ce4UMlUBrnNYmdqAPIFby7p4IAO+WMtpvdgc/
 qlNZn4GQRDAuIyqMYLxtRLAUcLsI4Y9Yv2KD4bWUKPcylS5Q3AaqNdo/RZd0k0HRbSEw
 MofD5DjYksCCtlLfBJXPLTAq9LSEhMovQKrnnm1y9sojKehISbqGoQONbiCgc98pLfgH
 xHkg==
X-Gm-Message-State: AOAM532cwtXDBc8feI92eunQB5xnSNbyjcMK6mmNeBnWEM4j2H/cxPyY
 2fAO72jTPmkZCchSIWKDXlkW/ww7t80a0iQxzEXonR/kkDw+HA==
X-Google-Smtp-Source: ABdhPJxLo66IKaBsI9rw3n0/b96iQmzVNf67KjKffBBjKb/mJOEb+PqbrPcTgpfElJYUCBhqLCX6Pc1612HybqhOW9A=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr12316867wrs.149.1630920345019; 
 Mon, 06 Sep 2021 02:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
 <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
 <CALUzjTY56_A3mMtvWGFTyyZAKshWSeUfcHWJFFxYSm7P7BuNAQ@mail.gmail.com>
 <CAFEAcA_Zvw1V5=8OxUXerb3zg=C6AGLfQgZ5k1kCY5NGT-CdHw@mail.gmail.com>
 <CALUzjTa1ZNFFjdo6eCy13TCrqAibYLMzJ7JqjY5+GwpukhfMAQ@mail.gmail.com>
 <CAFEAcA_EAx858BpONn+7+wCCxwCOsUm42gUMP0LW5JZwd5AkCA@mail.gmail.com>
 <CALUzjTaDo94110xX7bAr4B5y_XEXqoFH==88hsgffau0rNgZAw@mail.gmail.com>
 <CAFEAcA-8iXVQtjv3akpwz==D6wvY7JDvKbpP5QgrLGdxBNLJeg@mail.gmail.com>
 <CALUzjTZKYx92qkxxmcVTMJ5_b0_eL+kwjW5ZYsr8SDXi58EPpw@mail.gmail.com>
In-Reply-To: <CALUzjTZKYx92qkxxmcVTMJ5_b0_eL+kwjW5ZYsr8SDXi58EPpw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Sep 2021 10:24:55 +0100
Message-ID: <CAFEAcA8_yfknWwRgz_kfYXQLHEk1bKgy0AHWQSX49OzodGNiyg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Duo jia <jiaduo19920301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

On Mon, 6 Sept 2021 at 03:47, Duo jia <jiaduo19920301@gmail.com> wrote:
>
> Thank you for your explanation.
>
>>  And finishing the execution of the interrupt routine will automatically
>> allow a pending second interrupt to be taken immediately
>
>
> I think this is a hardware feature. But how to achieve it with qemu

That is what my explanation was trying to tell you how to do.

In a bit more detail:
 * your interrupt controller device should assert the irq line
   to the CPU for as long as there is any pending interrupt
   (regardless of its priority). It should deassert it when
   there is no longer a pending interrupt (ie when the guest
   writes to the interrupt status register to clear the pending
   status of an interrupt, if that was the only pending interrupt
   then the interrupt controller should stop asserting the
   irq line).
 * your stm8_cpu_set_irq function should set and clear the
   CPU_INTERRUPT_HARD flag in interrupt_request so that it
   follows the irq line value
 * your .cpu_exec_interrupt function should only take the
   interrupt if the CCR.I1/I0 bits permit it. Otherwise it
   should return false (telling the QEMU core code that there
   was no interrupt taken). cpu_exec_interrupt should *not*
   clear the CPU_INTERRUPT_HARD flag, whether it decides to
   take an interrupt or not.
 * your do_interrupt function should set CCR.I1/I0 from the
   ITC_SPRx registers (as well as doing everything else that
   interrupt entry needs to do)
 * your implementation of iret should reload the CCR.I1/I0
   bits, the way the spec describes

There are other ways to structure this (mostly involving
tying the interrupt controller model and the CPU model
together more closely), but the above is the "classic"
and probably simplest way of doing it.

-- PMM

