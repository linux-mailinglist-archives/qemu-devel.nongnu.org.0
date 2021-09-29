Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426041CAD4
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:02:31 +0200 (CEST)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVcyU-0003z8-A7
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mVcwd-0002i3-5y
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:00:35 -0400
Received: from [115.28.160.31] (port=34724 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mVcwQ-0003jd-Ux
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:00:34 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B65C8600FF;
 Thu, 30 Sep 2021 01:00:10 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632934810; bh=LwZePhQCkzjv1Vwa3e/LQOWu6zUWRt08wyeuGBZ6M8k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OtZTOQgkqLqM47lz1K1e8nYRHsDiDGDW+o6EU8rLbMWizyEJ0mdEQgtq5/+znug1c
 seJVUK0BExu8acMZBs94NWS/zhLNP9Bysh/shwETKiHoauuvbjTaJLcmFgi6uHIc84
 orY5SCrbzPuUg4+TQL5+d2aCp4XbajdpEAirXgnw=
Message-ID: <3a225730-0cc1-750e-4952-63d3d027eca1@xen0n.name>
Date: Thu, 30 Sep 2021 01:00:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v6 26/30] tcg/loongarch64: Implement tcg_target_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-27-git@xen0n.name>
 <8fb1e344-a31d-02cf-edf8-fe775d3dc307@amsat.org>
 <f05efe32-0c0e-cece-54e5-5ea059f4717e@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <f05efe32-0c0e-cece-54e5-5ea059f4717e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/27/21 07:07, Richard Henderson wrote:
> On 9/26/21 3:15 AM, Philippe Mathieu-Daudé wrote:
>> On 9/25/21 19:30, WANG Xuerui wrote:
>>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   tcg/loongarch64/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>>>   1 file changed, 27 insertions(+)
>>
>>> +static void tcg_target_init(TCGContext *s)
>>> +{
>>> +    tcg_target_available_regs[TCG_TYPE_I32] = ALL_GENERAL_REGS;
>>> +    tcg_target_available_regs[TCG_TYPE_I64] = ALL_GENERAL_REGS;
>>> +
>>> +    tcg_target_call_clobber_regs = ALL_GENERAL_REGS;
>>
>> If you plan to add support for vector registers later, I think it is
>> safer to start today with:
>>
>>         tcg_target_call_clobber_regs = -1ull;
>
> It is not "safer", it is wrong -- there are bits set for which there 
> are no registers.
>
It seems this patch doesn't need touching after all, and the whole 
series have been reviewed by now; do I need to send a final revision 
with all tags collected? Or is this series just waiting for next queue 
chance / merge window? I'm not quite sure about the QEMU workflow so I'm 
asking here, apologizes if I'm pinging this too early (maybe I really 
should wait for another 3 or 4 days before asking this).
>
> r~

