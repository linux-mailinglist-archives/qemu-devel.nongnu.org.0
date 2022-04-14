Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CA5500D52
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 14:28:20 +0200 (CEST)
Received: from localhost ([::1]:56108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neyaB-0004LG-Ek
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 08:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gouicem@in.tum.de>) id 1neyWL-0003P5-1z
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:24:21 -0400
Received: from mailout2.rbg.tum.de ([2a09:80c0::202]:59459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gouicem@in.tum.de>) id 1neyWH-0005o5-Pu
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:24:20 -0400
Received: from mailrelay1.rbg.tum.de (mailrelay1.in.tum.de
 [IPv6:2a09:80c0:254::14])
 by mailout2.rbg.tum.de (Postfix) with ESMTPS id 7AF544C0472;
 Thu, 14 Apr 2022 14:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in.tum.de;
 s=20220209; t=1649939052;
 bh=rGvG2+uaD1YuagrQVm0xcON8pKQ9bzKwcokM9UvYSO8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uD/NTFC/7NOG2vZuGBC7fIlxnohdHFVM+z2hq5uIxofOUHMNcW2MNWYCpxVNXP20B
 2lZ34cRtZ3njW2c0rg97yI5ozLpagluFU5pPBQ/gnN6tGzenwJ26Xm+n3QtCRM5ukS
 072Wif2mBTThKlGzf5IfQt8bRvkggU65qK5f+M9x09/i3qN2H3efFr+epFEBBapH8r
 1S7XS9x0Aid+J7XoSz7BecvOtF/LH8NJXL/vwAxbFySdd20Y+ipJjkLpO6YiCV81xc
 tygZ/B8gulkS1nwJZ72ha+viwoNXqbfbgJ0uJbL0NezORcKKsIpZ7AHokXu4X0oliW
 LUHSgF4qkGMgg==
Received: by mailrelay1.rbg.tum.de (Postfix, from userid 112)
 id 782356D7; Thu, 14 Apr 2022 14:24:12 +0200 (CEST)
Received: from mailrelay1.rbg.tum.de (localhost [127.0.0.1])
 by mailrelay1.rbg.tum.de (Postfix) with ESMTP id 4D80C55F;
 Thu, 14 Apr 2022 14:24:12 +0200 (CEST)
Received: from mail.in.tum.de (vmrbg426.in.tum.de [131.159.0.73])
 by mailrelay1.rbg.tum.de (Postfix) with ESMTPS id 4BE4D24E;
 Thu, 14 Apr 2022 14:24:12 +0200 (CEST)
Received: by mail.in.tum.de (Postfix, from userid 112)
 id 478D84A025E; Thu, 14 Apr 2022 14:24:12 +0200 (CEST)
Received: (Authenticated sender: gouicem)
 by mail.in.tum.de (Postfix) with ESMTPSA id E1DEB4A0033;
 Thu, 14 Apr 2022 14:24:11 +0200 (CEST)
 (Extended-Queue-bit xtech_he@fff.in.tum.de)
Message-ID: <bdb292b9-9027-ebd6-48c0-d6384c7080b9@in.tum.de>
Date: Thu, 14 Apr 2022 14:24:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Support for x86_64 on aarch64 emulation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <648878dc-67c6-d919-c2a0-b7c6c5d613e2@in.tum.de>
 <0567b8bc-b327-9601-9acf-75711b77a1ef@linaro.org>
From: Redha Gouicem <gouicem@in.tum.de>
Organization: Technical University of Munich (TUM)
In-Reply-To: <0567b8bc-b327-9601-9acf-75711b77a1ef@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a09:80c0::202; envelope-from=gouicem@in.tum.de;
 helo=mailout2.rbg.tum.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: d.g.sprokholt@tudelft.nl
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I will start working on a cleaner patch to allow the correct memory
ordering enforcement to be implemented, as my current PoC is very hacky.
I'll post it to the mailing list as soon as I'm done.

Redha

On 08/04/2022 17:27, Richard Henderson wrote:
> On 4/8/22 05:21, Redha Gouicem wrote:
>> We are working on support for x86_64 emulation on aarch64, mainly
>> related to memory ordering issues. We first wanted to know what the
>> community thinks about our proposal, and its chance of getting merged
>> one day.
>>
>> Note that we worked with qemu-user, so there may be issues in system
>> mode that we missed.
>>
>> # Problem
>>
>> When generating the TCG instructions for memory accesses, fences are
>> always inserted *before* the access, following this translation rule:
>>
>>      x86   -->     TCG     -->    aarch64
>>      -------------------------------------
>>      RMOV  -->  Fm_ld; ld  -->  DMBLD; LDR
>>      WMOV  -->  Fm_st; st  -->  DMBFF; STR
>>
>> Here, Fm_ld is a fence that orders any preceding memory access with
>> the subsequent load. F_m_st is a fence that orders any preceding
>> memory access with the subsequent store. This means that, in TCG, all
>> memory accesses are ordered by fences. Thus, no memory accesses can be
>> re-ordered in TCG. This is a problem, because it is *stricter than
>> x86*. Consider when a program contains:
>>
>>      WMOV; RMOV
>>
>>
>> x86 allows re-ordering independent store-load pairs, so the above pair
>> can safely re-order on an x86 host. However, with QEMU's current
>> translation, it becomes:
>>
>>      DMBFF; STR; DMBLD; LDR
>>
>> In this target aarch64 code, no re-ordering is possible. Hence, QEMU
>> enforces a stronger model than x86. While that is correct, it harms
>> performance.
>>
>> # Solution
>>
>> We propose an alternative scheme, which we formally proved correct
>> (paper under review):
>>
>>      x86   -->      TCG    -->    aarch64
>>      -------------------------------------
>>      RMOV  -->  ld; Fld_m  -->  LDR; DMBLD
>>      WMOV  -->  Fst_st; st -->  DMBST; STR
>>
>> This new scheme precisely captures the observable behaviors of the
>> input program (in x86's memory model). This behavior is preserved in
>> the resulting TCG and aarch64 programs. Which the inserted fences
>> enforce (formally verified). Note that this scheme enforces fewer
>> ordering than the previous (unnecessarily strong) mapping scheme. This
>> new scheme benefits performance. We evaluated this on benchmarks
>> (PARSEC) and got up to 19.7% improvement, 6.7% on average.
>>
>> # Implementation Considerations
>>   Different (source and host) architectures may demand different such
>> mapping schemes. Some schemes may place fences before an instruction,
>> while others place them after. The implementation of fence placement
>> should thus be sufficiently flexible that either is possible. Though,
>> note that write-read pairs are unordered in almost all architectures.
>>   We see two ways of doing this:
>> - extracting the placement of the fence from the
>>    tcg_gen_qemu_ld/st_i32/i64 functions, and have each architecture
>>    explicitly generate the fence at the correct place
>> - adding two parameters to these functions specifying the strength of
>>    the "before" and "after" fences. The function would then generate
>>    both fences in the IR (one of them may be a NOP fence), which in
>>    turn will be translated back to the host
> 
> This has been on my to-do list for quite some time.  My previous work was
> 
> https://patchew.org/QEMU/20210316220735.2048137-1-richard.henderson@linaro.org/
> 
> I have some further work (possibly not posted?  I can't find a reference) which attempted to strength reduce the barriers, and to use load-acquire/store-release insns when alignment of the operation allows.  Unfortunately, for the interesting cases in question (x86 and s390x guests, with the strongest guest memory models), it was rare that we could prove the alignment was sufficient, so it was a fair amount of work being done for no gain.
> 
> 
> r~

-- 
Redha Gouicem
Post doctoral researcher
Chair of Decentralized Systems Engineering
Department of Informatics, Technical University of Munich (TUM)

