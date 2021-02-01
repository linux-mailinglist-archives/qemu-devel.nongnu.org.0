Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2830AD82
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:13:38 +0100 (CET)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cld-0005lF-PX
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1l6cYC-00085K-LZ
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:59:44 -0500
Received: from smtpbg704.qq.com ([203.205.195.105]:52220
 helo=smtpproxy21.qq.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1l6cY6-0007O5-A2
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:59:43 -0500
X-QQ-mid: bizesmtp8t1612198749t0igcrph0
Received: from [192.168.0.105] (unknown [144.255.82.34])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 02 Feb 2021 00:59:08 +0800 (CST)
X-QQ-SSF: 0140000000400070U000B00H0000000
X-QQ-FEAT: nZfAq5E6KeixezhTa+dqgGwOKYaOnxYjYSg/ckGQXKY+qLNvSVQ0ab3UQrHFp
 h+/UkkvCryCA4UaYW89kmVJb1hjaMQx/Kw1I+csnEgtwuSn6utnQ15vwTRWCq4DBare8qb0
 qkkIzIFbfAEc3RyTua/vjTA3z/dTrZ5vFCh5SU+eLP5oaq34oYOEk0QmtwH/RLelMbElURm
 i+2QDTDTJoCn4bVfqB8zgajYJB5fSqCj4m4pGCPi5TLxfnXSG8UYdGVdw50Oxvud1IkCpRa
 HNJILLokutd7mv67Qx2hLLC6W6NuEr7aZL8YodMTVZTQjXe6CFvPNj5pb6/+dcpa7c/5pda
 1q9rmhU
X-QQ-GoodBg: 2
Subject: Re: [QUESTION] tcg: Is concurrent storing and code translation of the
 same code page considered as racing in MTTCG?
To: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <60169742.1c69fb81.90ae8.cdc6SMTPIN_ADDED_BROKEN@mx.google.com>
 <cebad06c-48f2-6dbd-6d7f-3a3cf5aebbe3@linaro.org>
From: Liren Wei <lrwei@bupt.edu.cn>
Message-ID: <8c7d31df-7a77-b7fa-6357-60b079f42a88@bupt.edu.cn>+F1B01F0F2D385E2E
Date: Tue, 2 Feb 2021 00:59:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cebad06c-48f2-6dbd-6d7f-3a3cf5aebbe3@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=203.205.195.105; envelope-from=lrwei@bupt.edu.cn;
 helo=smtpproxy21.qq.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, FORGED_MUA_MOZILLA=2.309,
 INVALID_MSGID=0.568, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 2/1/21 7:01 AM, Richard Henderson wrote:
 > Yes, this is a bug, because we are trying to support e.g. x86 which 
does not
 > require an icache flush.

That is too bad :(

I know nothing about the modern hardware, it's really hard to imagine what
is done in CPU to maintain the coherence when this kind of cross-modifying
scenario happens.

 > I think the page lock, the TLB_NOTDIRTY setting, and a possible sync 
on the
 > setting, needs to happen before the bytes are read during translation.
 > Otherwise we don't catch the case above, nor do we catch
 >
 >     CPU1                  CPU2
 >     ------------------    --------------------------
 >     TLB check -> fast
 >                           tb_gen_code() -> all of it
 >       write to ram
 >
 > Also because of x86 (and other architectures in which a single 
instruction can
 > span a page boundary), I think this lock+set+sync sequence needs to 
happen on
 > demand in something called from the function set defined in
 > include/exec/translator.h
 >
 > That also means that any target/cpu/ which has not been converted to 
use that
 > interface remains broken, and should be converted or deprecated.

I failed to figure out what do you mean by lock+set+sync, in particular:
   - What is the use of the page lock here (Is this the lock of PageDesc?)
   - Is the "possible sync" means some kind of wait so that TLB_NOTDIRTY is
     definitely able to catch further "write to ram"?

 > Are you planning to work on this?

No, sorry for that.. Neither do I see myself qualified enough to do this 
job,
nor do I have enough time for it. But I did considered the following:

Since "TLB check" and "fast path write to ram" are separate steps, it seems
to me that CPU1 can always (in the extreme case) enter the fast path before
CPU2 starts doing translation, and then write to already-translated code
of CPU2 without informing it.

Therefore maybe we can mark the RAM backing page in QEMU's page table as
non-writable at an early stage in tb_gen_code() using the ability of the
underlying OS, register a signal handler to intercept the first "write 
to ram"
happened, restore the page to be writable, and eventually inform the
translating thread to do something about it. (e.g. queue_work_on_cpu() and
cpu_exit() the translating vCPU so that it has chance to invalidate the TB
after possibly running that TB for several times)

But all these sounds very intrusive to the existing code base, and I'm not
sure whether it make sense...

Thanks
Liren Wei



