Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CD63F89E1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:14:06 +0200 (CEST)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJG8m-0003v8-Sd
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:14:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.hauschild@fs.ei.tum.de>)
 id 1mJG7G-0003EP-A1
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:12:26 -0400
Received: from mail.fs.ei.tum.de ([2001:4ca0:22ff:10::7]:46705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.hauschild@fs.ei.tum.de>)
 id 1mJG7E-0000zw-1D
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:12:26 -0400
Received: from [192.168.2.98] (pc19f2504.dip0.t-ipconnect.de [193.159.37.4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "Florian Andreas Hauschild",
 Issuer "DFN-Verein Global Issuing CA" (verified OK))
 by mail.fs.ei.tum.de (Postfix) with ESMTPSA id 6927E119EE76;
 Thu, 26 Aug 2021 16:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fs.ei.tum.de;
 s=default; t=1629987130;
 bh=dDOAH8rSWEzmn6bk21oyJ38USackoSkZch1miA19N44=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KgrwFCK/tga19esw34m12edaVpiBLMSb3dUzNSVQG81DHbOcMSANYi1YcOCjzorZV
 Nhe7loCusfCbYtSLCdb813zNNUTtnbeFjGko77IqGm8GWEpblWbwmM3ypgYHJcmjmZ
 9l64Ct3efD+l3EGL2pHdqN8ANv+cfpmrtaUmOHxQ=
Subject: Re: [RFC PATCH 1/1] QEMU plugin interface extension
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
 <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
 <CAFEAcA8vKOmD+e7h1PSBEv_BUtkkcq8+SskZGhBNZ-kACs4S3w@mail.gmail.com>
 <22e65815-7aaa-69d1-fa72-d40f3d480498@fs.ei.tum.de>
 <CAFEAcA9itqeya5WVhfsVEvjvFStSW=yrAtOw6tcak9QrG+nxeQ@mail.gmail.com>
From: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
Message-ID: <3ff9641c-a6b8-00aa-2ade-f8c89412059f@fs.ei.tum.de>
Date: Thu, 26 Aug 2021 16:12:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9itqeya5WVhfsVEvjvFStSW=yrAtOw6tcak9QrG+nxeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4ca0:22ff:10::7;
 envelope-from=florian.hauschild@fs.ei.tum.de; helo=mail.fs.ei.tum.de
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-2.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 24.08.21 um 16:47 schrieb Peter Maydell:
> On Tue, 24 Aug 2021 at 15:34, Florian Hauschild
> <florian.hauschild@fs.ei.tum.de> wrote:
>>
>>
>>
>> Am 21.08.21 um 15:18 schrieb Peter Maydell:
>>> On Sat, 21 Aug 2021 at 10:48, Florian Hauschild
>>> <florian.hauschild@fs.ei.tum.de> wrote:
>>>>
>>>> This extension covers functions:
>>>>   * to read and write guest memory
>>>>   * to read and write guest registers
>>>>   * to flush tb cache
>>>>   * to control single stepping of qemu from plugin
>>>>
>>>> These changes allow the user to
>>>>   * collect more information about the behaviour of the system
>>>>   * change the guest state with a plugin during execution
>>>>   * control cache of tcg
>>>>   * allow for precise instrumentation in execution flow
>>>
>>>> +
>>>> +static int plugin_read_register(CPUState *cpu, GByteArray *buf, int reg)
>>>> +{
>>>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>>> +    if (reg < cc->gdb_num_core_regs) {
>>>> +        return cc->gdb_read_register(cpu, buf, reg);
>>>> +    }
>>>> +    return 0;
>>>> +}
>>>
>>> At the point where these functions execute is the emulation
>>> definitely stopped (ie no register values currently held
>>> live in TCG locals) ?
> 
>> I am not sure, if it is definitely stopped.
>> I call them during tb_exec_cb and insn_exec_cb.
>> I have used the extension on ARM and RISC-V single cpu guests and the
>> data collected is the one i would expect during normal execution on real
>> hardware. How this would behave on a multi cpu/core system i have not
>> tested yet.
> 
> Multicore isn't relevant here. What you want to check for
> is what happens when the TB covers multiple guest instructions
> such that a later insn in the TB uses a register that is
> set by an earlier insn in the TB, eg:
> 
>     mov x0, 0
>     add x0, x0, 1
>     add x0, x0, 1
> 
> In this case TCG is likely to generate code which does not
> write back the intermediate 0 and 1 values of x0 to the CPUState
> struct, and so reading x0 via the gdb_read_register interface
> before the execution of the 3rd insn will continue to return
> whatever value x0 had before execution of the TB started.
> 
> For the gdbstub's use of the gdb_read_register API, this
> can't happen, because we always completely stop the CPU
> (which means it is not inside a TB at all) before handling
> gdbstub packets requesting register information.
> 
> I don't know whether the TCG plugin infrastructure takes steps
> with its various callbacks to ensure that intermediate values
> get written back to the CPU state before the callback is
> invoked: it's possible that this is safe, or can be made to
> be safe.
> 
> thanks
> -- PMM
> 

Sorry, i misunderstood your question.

Form my observation all three insn_cb would see x0 == 2. They are
executed at the end of a tb execution.

During my testing these changes were stable and i assume they are safe.
But thats why i chose RFC. I am new to QEMU and might overlook something
important.

Please correct me if i am wrong:
When the TB is executed, first the TB cb is executed, then the various
instruction cb. If you would like to see x0 in between instructions (e.g
mov and first add), QEMU need to be in single step mode.
The plugin infrastructure does have some sort of infrastructure to tell
the tcg if the registers are read or written to, but does apparently not
use it. The register values seem to be written back before the various
cbs are called.

Regards
Florian

