Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BA56489
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 10:27:11 +0200 (CEST)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hg3Go-0002sE-Ru
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 04:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45545)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hg3F9-0001S5-Ju
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hg3F8-0002ru-6h
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:25:27 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34652)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hg3F7-0002rU-Vy
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 04:25:26 -0400
Received: by mail-pg1-f193.google.com with SMTP id p10so874293pgn.1
 for <qemu-devel@nongnu.org>; Wed, 26 Jun 2019 01:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=h8oU2b5N/pf/gNarMwQOz8ETjwfR+tQx32syhVexM+k=;
 b=Dm5vGRTS6syoFgq9f5c67IWU/On2UEa9DSO9IAxojwEFQYZq6ZBagSeHv32KgyhB/e
 K7+npttFIYdk47Kw5gcNM4E+9kpSvUVrWzRn3zk5nvZjlAPUswTFh84T0bI6vSyzlmW8
 vgheO4a2xcmxgLOoZtaLAuevk1b/zFhQHT11fHlYc/wv8SzfyYlLBrkY2vU71uWjC4nO
 TdblsBqDmIUG/GQRZykBYF5ZdmxNWNi4iSQZicyokOWwpnXXa0w4wu37NAXqAACQT7Ye
 e7PEy+V4oYlUzojgSH4BX8J+8sZnsnty3zMZhz7xI/NJJ1mGaeTmCLe3S88nKvR2QMN0
 Rz3A==
X-Gm-Message-State: APjAAAXQVvWGzf12wo0zERf900qnELOlM6a6Gf/yqu9++gKaI1tkdXiq
 vGAe+AMu5TcveMdH0JuW+9ySyA==
X-Google-Smtp-Source: APXvYqzkJMiLNh9vqIy3aFQPO/lWLatci+1Bvxkz5o5ncbbsmFQggrxvkxVcAcyx89wxiJPITIv3gw==
X-Received: by 2002:a63:2323:: with SMTP id j35mr1767083pgj.166.1561537524533; 
 Wed, 26 Jun 2019 01:25:24 -0700 (PDT)
Received: from localhost (220-132-236-182.HINET-IP.hinet.net.
 [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id d12sm16914631pfd.96.2019.06.26.01.25.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 01:25:23 -0700 (PDT)
Date: Wed, 26 Jun 2019 01:25:23 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Jun 2019 01:03:33 PDT (-0700)
In-Reply-To: <CAEUhbmVdVXaFhM2b1U2d5G0My5Gq3cMM1zhQKU3n051KuXu4HQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: bmeng.cn@gmail.com
Message-ID: <mhng-667253d2-f664-40a4-8849-fc1a08ffeaf7@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.193
Subject: Re: [Qemu-devel] [PATCH for 4.1 v3] target/riscv: Expose time CSRs
 when allowed by [m|s]counteren
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
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, fintelia@gmail.com,
 qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Jun 2019 23:54:06 PDT (-0700), bmeng.cn@gmail.com wrote:
> Hi Palmer,
>
> On Tue, Jun 25, 2019 at 5:57 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Mon, 24 Jun 2019 16:03:20 PDT (-0700), fintelia@gmail.com wrote:
>> > Apparently my previous message didn't make it out onto the list (sorry
>> > about all these email glitches!). I've included the message again below.
>> > Hopefully either a patch like this one or something simpler that just hard
>> > codes mcounteren.TM to zero (so QEMU is at least conformant) can be merged
>> > in time for 4.1.
>> >
>> > On Fri, Jun 14, 2019 at 8:55 AM Jonathan Behrens <jonathan@fintelia.io>
>> > wrote:
>> >
>> >> I'm not sure that is accurate. Based on the discussion here
>> >> <https://forums.sifive.com/t/possible-bug-in-counteren-csrs/2123> the
>> >> HiFive Unleashed actually does support reading the timer CSR from
>> >> unprivileged modes (from that discussion it does so a little too well...
>> >> but it should presumably be fixed in later iterations of the processor).
>> >> And even if no real hardware supported this capability, it still might make
>> >> sense to provide it in QEMU as an optimization.
>>
>> time and cycle are different registers: rdtime should trap, but rdcycle should
>> work.  The hardware traps rdtime into machine mode and emulates it via a memory
>> mapped register.  The bug in the FU540-C000 appears to be related to the
>> counter enables, not the presence of the counters.
>
> I don't think rdtime is required to mandatorily trap.
>
> Per privileged spec v1.10, chapter 3.1.17 Counter-Enable Registers
> ([m|h|s]counteren), it says:
>
> "When the CY, TM, IR, or HPMn bit in the mcounteren register is clear,
> attempts to read the cycle, time, instret, or hpmcountern register
> while executing in S-mode or U-mode will cause an illegal instruction
> exception."
>
> In the same chapter, it also says:
>
> "Implementations can convert reads of the time CSR into loads to the
> memory-mapped mtime register, or hard-wire the TM bits in mxcounteren
> to 0 and emulate this functionality in M-mode software."
>
> So per my understanding when mcounteren.TM is set, rdtime should NOT trap.

Implementations are allowed to implement the instruction, but all the exsting
implementations trap to M-mode.

