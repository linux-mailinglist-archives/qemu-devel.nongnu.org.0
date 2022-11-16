Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF9162C8EE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 20:27:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovO3R-0005m2-Jc; Wed, 16 Nov 2022 14:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ovO3P-0005lp-Fn
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 14:26:35 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ovO3N-0002Zs-Pk
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 14:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=97bRaQrwuMMxwytQLuB0HfHXzzW1zMqW8QHyv/UwGZs=; b=FFU3d+MkECSWHh/VEcoP4PxL5d
 tp1lavmxZw/PVn2+tW4sc5zS2AcyiRmgLPZB6TRJ4vcC4ifbnTdRp3RW8uBixpJA2lPPXpNE8gqdn
 GItkk+NARLUMXpu0n2DclQjuA9vz7ENWBbFSSgk4gO6JJE45VGj9eO5o04LOPJvUu0mKzKByI3NOY
 CdTST6waUKjWpfqKN3NqsqxLw/GAv6qjJa42oxvMgnCA4LoJW6lvgK/dtuLFFceY3iF8H9zCDbicU
 AiNbrt/8reuRgVeegbXJCZUqnGYxSwBoWveoDgEg07wCOUvlhmaZFRjFX0tncAjS38iJBJNY7cN3W
 pXg/Nn2R3BWa9Zd+Yn0HIXFzXQBw7QvzVP3rmQm0j8pK1Zk4iDdUaTr7wm7OgN1df25uu8dmWhtD9
 5PTBITxWHNfOWbJ7a44R7A2BImqJ1Lw35Z3Tw0oUeR5soQLsWRiOCiQ5JJng5cfz3wokS4uXtn669
 4+XPhV92b8LyhrImMbi3P16Bw+Nlo6XxxjoyK1T2CFRP05ZWL18kkQyQgZ6TMV1zZPw3FFvf/2ad6
 UryXPbK0q/JGsK4as8gFrB+EMuVvoQ83VJLyFMW385dIWsu4LEeYVyP/HllDLl9e11hguiBvTmBRr
 ODeIWJcrWjd4hjfFTjHioFJADc1ycASo4+8nCB2iA=;
Received: from [2a00:23c4:8ba9:3700:6d79:9193:91dc:35ee]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ovO3B-00096H-3a; Wed, 16 Nov 2022 19:26:25 +0000
Message-ID: <55f74ddf-47eb-d783-26f9-85dd3e95e413@ilande.co.uk>
Date: Wed, 16 Nov 2022 19:26:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu-daude@linaro.org>,
 John Snow <jsnow@redhat.com>
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
 <CAJSP0QVigz1nDq7JO2ABquzReGWkqY5dwXKrEaufw+FXnvsvkg@mail.gmail.com>
 <87r0y29287.fsf@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <87r0y29287.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba9:3700:6d79:9193:91dc:35ee
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Failure analysis (was Re: [PULL for 7.2 00/10] testing and doc
 updates)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/11/2022 18:20, Alex Bennée wrote:

> Stefan Hajnoczi <stefanha@gmail.com> writes:
> 
>> This pull request causes the following CI failure:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3328449477
>>
>> I haven't figured out the root cause of the failure. Maybe the pull
>> request just exposes a latent failure. Please take a look and we can
>> try again for -rc2.
> 
> OK after a lot of digging I've come to the following conclusion:
> 
>    * the Fuloong 2E machine never enables the FIFO on the 16550 (s->fcr & UART_FCR_FE)
>    * as a result if qemu_chr_fe_write(&s->chr, &s->tsr, 1) fails with -EAGAIN
>      - a serial_watch_cb is queued
>      - s->tsr_retry++
>    * additional serial_ioport_write's overwrite s->thr
>    * the console output gets corrupted
> 
> You can see the effect by comparing the serial write and xmit values:
> 
>    ➜  grep serial_write alex.log | cut -d ' ' -f 6 | xxd -r -p | head -n 10
>    [    0.000000] Initializing cgroup subsys cpuset
>    [    0.000000] Initializing cgroup subsys cpu
>    [    0.000000] Initializing cgroup subsys cpuacct
>    [    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kernel@lists.debian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 3.16.56-1+deb8u1 (2018-05-08)
>    [    0.000000] memsize=256, highmemsize=0
>    [    0.000000] CpuClock = 533080000
>    [    0.000000] bootconsole [early0] enabled
>    [    0.000000] CPU0 revision is: 00006302 (ICT Loongson-2)
>    [    0.000000] FPU revision is: 00000501
>    [    0.000000] Checking for the multiply/shift bug... no.
>    🕙18:27:17 alex@zen:qemu.git/builds/all  on  pr/141122-misc-for-7.2-1 [$!?⇕]
>    ➜  grep serial_xmit alex.log | cut -d ' ' -f 2 | xxd -r -p | head -n 10
>    [    0.000000] Initializing cgroup subsys cpuset
>    [    0.000000] Initializing cgroup subsys cpu
>    [    0.000000] Initializing cgroup subsys cpuacct
>    [    0.000000] Linux version 3.16.0-6-loongson-2e (debian-kernel@lists.debian.org) (gcc version 4.8.4 (Debian 4.8.4-1) ) #1 Debian 33 0.000000] bootconsole [early0] enabled
>    [    0.000000] CPU0 revision is: 00006302 (ICT Loongson-2)
>    [    0.000000] FPU revision is: 00000501
>    [    0.000000] Checking for the multiply/shift bug... no.
>    [    0.000000] Checking for the daddiu bug... no.
>    [    0.000000] Determined physical RAM map:
>    [    0.000000]  memory: 000
> 
> As a result the check for the pattern fails:
> 
>          console_pattern = 'Kernel command line: %s' % kernel_command_line
>          self.wait_for_console_pattern(console_pattern)
> 
> resulting in a timeout and test fail.
> 
> In effect the configuration makes the output dependent on how fast the
> avocado test can drain the socket as there is no buffering elsewhere in
> the system. The changes in:
> 
>    Subject: [PULL 02/10] tests/avocado: improve behaviour waiting for login prompts
> 
> makes this failure more likely to happen - I think because the .peek() and
> .readline() behaviour have different buffering strategies. Options
> include:
> 
>    - enable the 16550 FIFO for the Loognson kernel (command line option?)
>    - increase the buffering of the python socket.socket() code
> 
> I can get it to pass by shuffling the time.sleep() and a few other
> checks around but that seems flaky at best.

Nice work! This is the well-known problem whereby the kernel sometimes expects the 
BIOS to have pre-configured the serial ports, which of course never happens when 
booting directly with -kernel.

Given that the fuloong2e machine already has a mini "trampoline" bootloader, would it 
be possible to tweak write_bootloader() at 
https://gitlab.com/qemu-project/qemu/-/blob/master/hw/mips/fuloong2e.c#L166 to set 
UART_FCR_FE on the available UARTs before jumping into the kernel?


ATB,

Mark.

