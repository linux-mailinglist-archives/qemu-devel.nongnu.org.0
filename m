Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB26190B31
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 11:36:28 +0100 (CET)
Received: from localhost ([::1]:45938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGgv5-0004q0-8o
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 06:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jGgu1-0003tg-EJ
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1jGgu0-0005v2-7S
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:35:21 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:35754)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>) id 1jGgu0-0005uk-2C
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:35:20 -0400
Received: by mail-yb1-xb35.google.com with SMTP id x63so8869698ybx.2
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+FVjR8g+PfMAVweILYa4+WCnUrLHD31rYhzlOPuOaw=;
 b=PJAGKgBNEgPt0MLXEF7qX0gXDXVzEwUTYimDGzcs0Etn8/bjf6obImvUoG6EX1ecK2
 L1ZIrABc/khHVYXJSfGAH4yhO1wOP/afNdSk7tRpmEymPhRHN7YGyhPnplCY1+PIzQP8
 jgMH5pTRe1RHMhKogk2g8R+hd+rhPbrSF7VNXzmgf/b633XWk0xieopNmpQu7btui76b
 +TaNIgm0zi/eww4dXe0Wjh8i4InKTzCb6E/MaGWrTRd78of78rOqrvD6U0zK9xjR+Kkd
 FAeoxemXkRu2zRUHzmBHiAdGfZhFVBGmXhxUXA51d0YWUEBmgAsM1uWXEDk5lBKcOka+
 lvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+FVjR8g+PfMAVweILYa4+WCnUrLHD31rYhzlOPuOaw=;
 b=MGPhlaRv9ypstrgjnEyaV0dSD4ou/rgrfXfnkiurU5PS3HtKNcieGoKEx6rJclfGiK
 t3UslNP+iEvVWbPmBtYikijYhTuXePF2I4bpkC5YzsJ9x71QvZ59bpXLynMlHdOztKR3
 Vf75Ls72KfUXNM8zJeSN8vDD8KEP/mPZK4ZL3IRroVBaF5RLXvTmZLGjASBpYU40U7hz
 gH99ODN6IiSofDd2fkFGbI9Q3SV2tgchQQ6jSsoOTkwhPlpJTYlCkN+UY8ban/JfpV5k
 A5oA/eX4+HPYx6N+KDxZM/9dmcdEf/HD9Nr2tdqWB7asKrjUlVnps4OGVUlGZ/Rn/Yfs
 CWBA==
X-Gm-Message-State: ANhLgQ1vKbcmY3hPa9iRxdSc9esIbVrxP/HZUInm4x4AZW3ugApk2u7s
 XidpehZZjOx0u5xHCyXZOjA67IBtxOnAdofR7caEdJ5I
X-Google-Smtp-Source: ADFU+vtKBaQHn1D19WeDVvpnUTOMXfXCh8LILNQKteYamMO1/ppl4/3ss0Svil8EZ9g7oVNjc+YH0mWeQKkRlZc9oqQ=
X-Received: by 2002:a25:ae8c:: with SMTP id b12mr29651511ybj.392.1585046119259; 
 Tue, 24 Mar 2020 03:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <155004342499.19242.14077661245921319117.malonedeb@soybean.canonical.com>
 <158503767628.19604.846014029546093014.malone@wampee.canonical.com>
In-Reply-To: <158503767628.19604.846014029546093014.malone@wampee.canonical.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 24 Mar 2020 18:35:08 +0800
Message-ID: <CAEUhbmV8YECctHEnLACq_aD9JwqLpMixPAvC=UGFNwJKrb9_tA@mail.gmail.com>
Subject: Re: [Bug 1815721] Re: RISC-V PLIC enable interrupt for multicore
To: Bug 1815721 <1815721@bugs.launchpad.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b35
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 24, 2020 at 4:20 PM RTOS Pharos <1815721@bugs.launchpad.net> wrote:
>
> Hi,
>
> After some debugging (and luck), the problem (at least in the Virt
> board) was that the PLIC code inside QEMU addresses the core x 2 instead
> of just the core (core=hart). That is why it worked for core 0 (0x2 = 0)
> but for core 1 it has to address the PLIC memory area for core 2.
>
> For example, the interrupt enable address for core 1 starts at offset
> 0x002080 (see https://github.com/riscv/riscv-plic-spec/blob/master
> /riscv-plic.adoc) but we actually have to change the enable bit for core
> 2 (at 0x002100) to make to work for core 1.


https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc says:

"base + 0x002080: Enable bits for sources 0-31 on context 1"

This is context 1, not core 1.

It looks to me you were running an image built for SiFive FU540.
Please test your image against "sifive_u" machine instead.

>
> The same is true for the priority threshold and claim complete registers
> (we need to multiply the core by 2)
>
> Either the documentation at https://github.com/riscv/riscv-plic-
> spec/blob/master/riscv-plic.adoc does not have the correct memory
> addresses for qemu virt board, or qemu appears to be wrong.
>
> --

Regards,
Bin

