Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A63296BE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:03:05 +0100 (CET)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzzl-0006PU-2e
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGzx8-0004B7-11
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:00:22 -0500
Received: from mx2.suse.de ([195.135.220.15]:42654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGzx2-0000zS-PL
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:00:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70734ADCA;
 Tue,  2 Mar 2021 08:00:15 +0000 (UTC)
Subject: Re: [RFC v2 05/24] target/arm: wrap arm_cpu_exec_interrupt in
 CONFIG_TCG
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-6-cfontana@suse.de>
 <a0d82589-e36e-d5b6-4d39-5a6c543a2e04@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <cd587988-ec91-1ca2-34d1-a029412e636a@suse.de>
Date: Tue, 2 Mar 2021 09:00:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a0d82589-e36e-d5b6-4d39-5a6c543a2e04@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/21 6:50 AM, Richard Henderson wrote:
> On 3/1/21 8:49 AM, Claudio Fontana wrote:
>> +#ifdef CONFIG_TCG
>>   bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>   {
>>       CPUClass *cc = CPU_GET_CLASS(cs);
>> @@ -607,6 +608,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>>       cc->tcg_ops->do_interrupt(cs);
>>       return true;
>>   }
>> +#endif /* CONFIG_TCG */
> 
> Drop this and just wait for the move to tcg/tcg-cpu.c.
> 
> 
> r~
> 

Right, will do, thanks.

C

