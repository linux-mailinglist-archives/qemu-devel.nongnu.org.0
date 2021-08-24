Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BE93F60E0
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:46:11 +0200 (CEST)
Received: from localhost ([::1]:55838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXgi-000500-7N
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.hauschild@fs.ei.tum.de>)
 id 1mIXVh-0000Lz-UU
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:34:41 -0400
Received: from mail.fs.ei.tum.de ([129.187.54.7]:32838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <florian.hauschild@fs.ei.tum.de>)
 id 1mIXVb-0003Z0-Hq
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:34:41 -0400
Received: from [192.168.2.98] (pc19f2504.dip0.t-ipconnect.de [193.159.37.4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "Florian Andreas Hauschild",
 Issuer "DFN-Verein Global Issuing CA" (verified OK))
 by mail.fs.ei.tum.de (Postfix) with ESMTPSA id CC2311196149;
 Tue, 24 Aug 2021 16:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fs.ei.tum.de;
 s=default; t=1629815664;
 bh=DfHitMmxpkM9eSqnijq3B4+5+kNsJy6v5VKR6VgJ11Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PrDhs1lkimWf0XSLRWb1QkY3ksqkuEePxxHtf1h23Crc+6wQBvTMvTFarw2WNQo4v
 bRhZWIQgm9wuJ6PCwSdrm4gvNwIqhz76U4cU3gP5O7UOROogfKeV7R0cCSPvtbi+kh
 G+qPmhudpAvSKfsZOdvBbiv5Abou9m8aVkwGnD44=
Subject: Re: [RFC PATCH 1/1] QEMU plugin interface extension
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210821094527.491232-1-florian.hauschild@fs.ei.tum.de>
 <20210821094527.491232-2-florian.hauschild@fs.ei.tum.de>
 <CAFEAcA8vKOmD+e7h1PSBEv_BUtkkcq8+SskZGhBNZ-kACs4S3w@mail.gmail.com>
From: Florian Hauschild <florian.hauschild@fs.ei.tum.de>
Message-ID: <22e65815-7aaa-69d1-fa72-d40f3d480498@fs.ei.tum.de>
Date: Tue, 24 Aug 2021 16:34:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8vKOmD+e7h1PSBEv_BUtkkcq8+SskZGhBNZ-kACs4S3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=129.187.54.7;
 envelope-from=florian.hauschild@fs.ei.tum.de; helo=mail.fs.ei.tum.de
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-1.305,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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



Am 21.08.21 um 15:18 schrieb Peter Maydell:
> On Sat, 21 Aug 2021 at 10:48, Florian Hauschild
> <florian.hauschild@fs.ei.tum.de> wrote:
>>
>> This extension covers functions:
>>   * to read and write guest memory
>>   * to read and write guest registers
>>   * to flush tb cache
>>   * to control single stepping of qemu from plugin
>>
>> These changes allow the user to
>>   * collect more information about the behaviour of the system
>>   * change the guest state with a plugin during execution
>>   * control cache of tcg
>>   * allow for precise instrumentation in execution flow
> 
>> +
>> +static int plugin_read_register(CPUState *cpu, GByteArray *buf, int reg)
>> +{
>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>> +    if (reg < cc->gdb_num_core_regs) {
>> +        return cc->gdb_read_register(cpu, buf, reg);
>> +    }
>> +    return 0;
>> +}
> 
> At the point where these functions execute is the emulation
> definitely stopped (ie no register values currently held
> live in TCG locals) ?
> 
> -- PMM
> 
I am not sure, if it is definitely stopped.
I call them during tb_exec_cb and insn_exec_cb.
I have used the extension on ARM and RISC-V single cpu guests and the
data collected is the one i would expect during normal execution on real
hardware. How this would behave on a multi cpu/core system i have not
tested yet.

Currently i am looking into this and as soon as i have found an answer i
will write back again.

Regards
Florian

