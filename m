Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D73A9578
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 11:01:51 +0200 (CEST)
Received: from localhost ([::1]:35646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltRQj-0008L2-Tl
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 05:01:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ltROK-0007eI-BU
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 04:59:20 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46036
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ltROH-0004B6-MM
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 04:59:20 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ltRO5-000AwH-7C; Wed, 16 Jun 2021 09:59:05 +0100
To: Richard Henderson <richard.henderson@linaro.org>,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org> <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com> <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
 <878s3cjyvl.fsf@linaro.org> <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
 <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <e809eeed-c635-c48c-c6b6-9c2d5718b60d@ilande.co.uk>
Date: Wed, 16 Jun 2021 09:59:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: tb_flush() calls causing long Windows XP boot times
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU devel list <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/2021 02:58, Richard Henderson wrote:

> On 6/15/21 6:58 AM, Programmingkid wrote:
>>> Ahh I misread - so those are the addresses of the routines and not where
>>> it's sticking the breakpoint?
>>>
>>> I notice from a bit of googling that there is a boot debugger. I wonder
>>> if /nodebug in boot.ini stops this behaviour?
>>>
>>>   
>>> https://docs.microsoft.com/en-us/troubleshoot/windows-server/performance/switch-options-for-boot-files 
>>>
>>>
>>> -- 
>>> Alex Bennée
>>
>> Hi Alex,
>>
>> I tried your suggestion of using /nodebug. It did not stop the tb_flush() function 
>> from being called.
> 
> We are not expecting zero calls to tb_flush (it is used for other things, including 
> buffer full), but we are hoping that it reduces the frequency of the calls.
> 
> I'm guessing you didn't immediately see the slowdown vanish, and so there was no 
> change to the frequency of the calls.
> 
> FWIW, if you switch to the qemu console, you can see how many flushes have occurred 
> with "info jit".

Looking at the diff of b55f54bc96 which first introduced the regression, presumably 
the difference is now that everything is being flushed rather than a specific address 
space when WinXP twiddles with the DB7 register:


diff --git a/exec.c b/exec.c
index 67e520d18e..7f4074f95e 100644
--- a/exec.c
+++ b/exec.c
@@ -1019,14 +1019,13 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, 
MemTxAttrs attrs)

  static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
  {
-    MemTxAttrs attrs;
-    hwaddr phys = cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
-    int asidx = cpu_asidx_from_attrs(cpu, attrs);
-    if (phys != -1) {
-        /* Locks grabbed by tb_invalidate_phys_addr */
-        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
-                                phys | (pc & ~TARGET_PAGE_MASK), attrs);
-    }
+    /*
+     * There may not be a virtual to physical translation for the pc
+     * right now, but there may exist cached TB for this pc.
+     * Flush the whole TB cache to force re-translation of such TBs.
+     * This is heavyweight, but we're debugging anyway.
+     */
+    tb_flush(cpu);
  }
  #endif


Unfortunately my x86-fu isn't really enough to understand what the solution should be 
in this case.


ATB,

Mark.

