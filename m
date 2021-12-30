Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CAB481AFE
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 10:06:41 +0100 (CET)
Received: from localhost ([::1]:48926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2rOS-00037V-5Y
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 04:06:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasper.ruehl@tum.de>)
 id 1n2rML-0001fp-Rh
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 04:04:29 -0500
Received: from postout2.mail.lrz.de ([129.187.255.138]:48097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasper.ruehl@tum.de>)
 id 1n2rMI-0000dI-HG
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 04:04:29 -0500
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
 by postout2.mail.lrz.de (Postfix) with ESMTP id 4JPj4s57VRzyXf;
 Thu, 30 Dec 2021 10:04:13 +0100 (CET)
Authentication-Results: postout.lrz.de (amavisd-new); dkim=pass (2048-bit key)
 reason="pass (just generated,
 assumed good)" header.d=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tum.de; h=
 content-transfer-encoding:content-type:content-type:in-reply-to
 :from:from:references:content-language:subject:subject
 :user-agent:mime-version:date:date:message-id:received:received;
 s=tu-postout21; t=1640855053; bh=ZWtwOFmFlR5nV4ANPHPj2HbZxi63dJ
 OUYmzeuJ3P/n4=; b=NLU+aKZ6Zu0jUcjE5+wpC14i9k816WxGqaHaErigRVi0Wr
 MPoov/VU32BQY2kwOZmbEVfu+7j9IWJDasnZ82adx7kJ0UVOGNEPhEQ8EZQjwyYz
 obRxf2CS8pE/H9DKSYYnAldPU5RtcwecBl9sKWG97l59rbU5mspKS2a9aPrcoqzt
 eCHVP84xkMR7l8F3aM+oZy+tv/RGt++Erz/bHm4+9yZMC+kuVpywsAKgnWsCzNKg
 J/XjDcV6aoZ5CW7ryWT2+zllfHKoygGhphLnChGGu1qPuoAhJIXpBWX26FGrwuXB
 SdKVIvL69ty14zVjuBlrnE5B1iXeTi2iyaES6+jw==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Score: -5.208
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new,
 port 20024)
 with LMTP id sdFetsf2XIsR; Thu, 30 Dec 2021 10:04:13 +0100 (CET)
Received: from [IPV6:2003:c2:bf09:dc00:d70e:dfb:455:3a4e]
 (p200300c2bf09dc00d70e0dfb04553a4e.dip0.t-ipconnect.de
 [IPv6:2003:c2:bf09:dc00:d70e:dfb:455:3a4e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4JPj4s0L91zyXb;
 Thu, 30 Dec 2021 10:04:12 +0100 (CET)
Message-ID: <3e004ec2-7b36-e397-82e5-2119e365bb7a@tum.de>
Date: Thu, 30 Dec 2021 10:04:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: QEMU CAS
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <67ba86a8-abd2-1715-ed8b-ed360b648c72@tum.de>
 <37803792-b7ad-85c9-194e-5f92c1493da1@linaro.org>
From: Jasper Ruehl <jasper.ruehl@tum.de>
In-Reply-To: <37803792-b7ad-85c9-194e-5f92c1493da1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=129.187.255.138; envelope-from=jasper.ruehl@tum.de;
 helo=postout2.mail.lrz.de
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Redha Gouicem <gouicem@in.tum.de>, peter.maydell@linaro.org,
 lex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for the great response pointing out many details we have missed!

The fixed constraints solved the optimization problem.

I am going to see what I can do about the other issues, it will take a 
while.

Best regards


On 23/12/2021 20:24, Richard Henderson wrote:
> On 12/23/21 1:51 AM, Jasper Ruehl wrote:
>> Dear QEMU Community,
>>
>> after chatting a bit in the IRC channel, "stefanha" advised me to 
>> contact you via EMail about my problem.
>> My advisor and me from the DSE chair at the TU Munich had the idea to 
>> improve the emulation of the x86 cmpxchg instruction on ARM64 CPUs by 
>> improving the translation scheme: instead of generating a call to the 
>> GCC helper function, we introduce a new TCG IR instruction (CAS) and 
>> directly translate that into the ARM casal instruction.
>
> If this is intended to ever be more than a class exercise,
> there are a number of things that will have to be fixed:
>
> - Host vs guest address size differences.
>   This affects, to begin, the number of arguments to the CAS opcode.
>
> - Host vs guest address space mapping.
>   For system mode, this must go through the softmmu tlb.
>   For user-only mode, this must take guest_base into account.
>
> - Host vs guest address alignment.
>   The x86_64 guest allows cmpxchg at odd addresses,
>   the aarch64 host requires cas at aligned addresses.
>
> - Host isa support -- CASAL requires ARMv8.1 FEAT_LSE.
>   For ARMv8.0, you would want to emit an LDAXR/STLXR loop.
>
> - No changes to target/ are required or desired.
>   The tcg_gen_atomic_cmpxchg_{i32,i64}() functions
>   are the interface that should be modified.
>
>
>>     case INDEX_op_cas8:
>>     case INDEX_op_cas16:
>>     case INDEX_op_cas32:
>>     case INDEX_op_cas64:
>>         return C_O1_I3(r,r,r,r); 
>
> Your constraints are incorrect.  For the CASAL instruction, the cmp 
> input (1) must match the old output (0).  This would have to be 
> "r,0,r,r".
>
>
> r~

