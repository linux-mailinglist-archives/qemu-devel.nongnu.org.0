Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0A41CAEC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:13:13 +0200 (CEST)
Received: from localhost ([::1]:41692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVd8q-0003eN-7D
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVd7I-0002Fj-1N
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:11:36 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVd7F-0004dU-QU
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:11:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d21so5430648wra.12
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 10:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WFvx7IMf4WN0a4VJurzxay8WhJ7VJ0rbsCqJw90qglk=;
 b=AbkPQLy2WG73bjNFw+8lmTiaChZr5C/tqegJoxVFmzI4Wi207bc8t1rCVzVv4MK+64
 D7jZO+NkcVz+o60iXmfGp7vuXagiMbIDyWw5cohiKdbQfd1hKUaPzm86hqDGEzU53S/q
 aw55NB7pw2hCrqs9t3nlMT5o7mFcxM8Soict3SMnaWSSKjfVlPPxdPXoz44JLxed36aH
 5gwgLor9aohmFEUZ/Z8oroal8qxpRiNHmW3ArJ6kI9ZeqQ2+Af8WcVWmSV9vW7OtSi9/
 /J8+BslFRyA42MQzE9GfnUl22YqfkFqxtlvc5NjlyNL8tmbvL56EwjAkyArkg+9MpUy6
 Iz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WFvx7IMf4WN0a4VJurzxay8WhJ7VJ0rbsCqJw90qglk=;
 b=3rolRCbRCC9DDkUn1BWm+cwI5jnJ6KK4uVj48L0yYO4uud1tHOYrkRpxTK1OywjmZy
 UDtUOOiYc8VSqtSyav4098xZ0JLY8Enc9HyIKyzpJeRjJybHgyTb9FdvcM8fm9w56WBf
 WNr7JlDrmiU25hUjgBK/5OOfCQ9ix0bIwWx8vg42UR/V7OL0VXgcaiqXKxoJyO2Nk4Bp
 sbvh9axgjAtFBj67MHS7z+29qsP7rVcrHBMXZDbxMjijCB9uL05bBQYta5hJpHVL3t8U
 RqSBIMFN8ppmNZeKnbsRV55zsJx9HTzrLeL46hyy2XCxIxlf7mkO6hM+C0uu2PHpW8em
 47gg==
X-Gm-Message-State: AOAM533VpBQUEhCa1Eajc6iD2NYAxgmRgUPzfKGd4bOJdlE/i1Dr4SPL
 XC4djzt1bquXyXjeRKmCBSM=
X-Google-Smtp-Source: ABdhPJzYiWCnrjakl9kgGISutQA2bCQ8g2YjxsY+RXWWM3Lz42dQ+L9eFkUDWhhkz2jcWvhq7IBLJw==
X-Received: by 2002:adf:ecd2:: with SMTP id s18mr1210106wro.99.1632935492407; 
 Wed, 29 Sep 2021 10:11:32 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l11sm500600wms.45.2021.09.29.10.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 10:11:31 -0700 (PDT)
Message-ID: <f2979fb9-a8b9-c4e2-3ce0-10228b67e9ed@amsat.org>
Date: Wed, 29 Sep 2021 19:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 26/30] tcg/loongarch64: Implement tcg_target_init
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210925173032.2434906-1-git@xen0n.name>
 <20210925173032.2434906-27-git@xen0n.name>
 <8fb1e344-a31d-02cf-edf8-fe775d3dc307@amsat.org>
 <f05efe32-0c0e-cece-54e5-5ea059f4717e@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <f05efe32-0c0e-cece-54e5-5ea059f4717e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.03,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/27/21 01:07, Richard Henderson wrote:
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
> It is not "safer", it is wrong -- there are bits set for which there are
> no registers.

OK, got it now, thanks.

