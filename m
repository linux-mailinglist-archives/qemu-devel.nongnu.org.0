Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289F8307D50
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 19:04:42 +0100 (CET)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Beq-0008Bv-Th
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 13:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5BXV-0003vL-Ua
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:57:05 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5BXU-0005DN-1k
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:57:05 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g15so4767562pgu.9
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9NqZ2uzbXTVpLxnAVpoywOfOFoWh9hCiNZhcPqQeeuU=;
 b=P+XGlnZLNLi29SE9TLaMm6QXNPvqB5qSGLwhVn6i7Pt0omFP09rCbr+ROz89MeikXY
 2hN80aUK2+GLSLPXpYgNgqESqtOhMLMPr2XVhjHcwuSLu7EyX6xT2QIvrCUHeb/HHSU1
 hJ+MOgAsQAkr1uduEBVZ58h1S8Qu4mQDr5kkP9fXZEKrXUvj+J/PWC1Wn1l9qI+TPM0Y
 TO57Zpa7cvNoEkdLc/0i7kxCwRNEqUAs+mTMnwKjf3koJrqyWXML0ansDQPeKDGKME9a
 eCP40+CmpwBNKiWSy5Ur/FmgelfxJOurtfq3YB6Vhws5TF48syXXrWEa6kxJplWke8rd
 Jh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9NqZ2uzbXTVpLxnAVpoywOfOFoWh9hCiNZhcPqQeeuU=;
 b=iHhmsyuVgaCbZWr5FYqkbWV4IBbXip3SyuA8tWS4KcEreQz8sBYZiuwYSnox9BkmYA
 LFUhF9VKz4cuAqVqvcUfqCTxDpVMM9SWUSuICiZ4wK9y7Kt/akekNYHHbRCWNYmK3qn8
 6XVh8hF3EH2bfOuG7sbGvTfod9tEiwqMKr5n2Y3E5yXE2p1GbUeuy3boZ0b1KeJcZYb1
 pqPl1lHVOa2GYuGP8ZJ8NeFX8Kb7Slbk3ABAR4df+ehO9IrT6eAJcsOtjCGtJBNjCtMv
 NDYRh2Pzsb9idfwv9uo/iKu+XBG7HpEFB2ka/DCyurvu4QcpYB21FuRcKRKKKUA4dtuf
 SKCw==
X-Gm-Message-State: AOAM532zkV24WMWUroRtYXeSt+9Lq+chtXkxbl7Z5xM15bukaA8rHyRg
 C5yk8UU2wnca14BRMsPKegkgBE3ofYv5RauJ
X-Google-Smtp-Source: ABdhPJyrUwpmF/JaUcVOUj/ZZ2X5PC+esIPleCKdepvU/y4DHto/Ll+6MNb/z0+M51fzA57rd3ACNQ==
X-Received: by 2002:a63:9f01:: with SMTP id g1mr607954pge.259.1611856621378;
 Thu, 28 Jan 2021 09:57:01 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id j14sm5512200pjl.35.2021.01.28.09.56.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:57:00 -0800 (PST)
Subject: Re: [PATCH 22/23] tcg/tci: Implement 64-bit division
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-23-richard.henderson@linaro.org>
 <8d395910-8656-9c4f-5dfa-749c50e8de22@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a100e37f-51fd-38ff-2160-3c626bc5d200@linaro.org>
Date: Thu, 28 Jan 2021 07:56:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8d395910-8656-9c4f-5dfa-749c50e8de22@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 12:04 AM, Stefan Weil wrote:
> Am 28.01.21 um 09:23 schrieb Richard Henderson:
> 
>> Trivially implemented like other arithmetic.
>> Tested via check-tcg and the ppc64 target.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/tci/tcg-target.h     |  4 ++--
>>   tcg/tci.c                | 28 ++++++++++++++++++++++------
>>   tcg/tci/tcg-target.c.inc | 12 ++++--------
>>   3 files changed, 28 insertions(+), 16 deletions(-)
>>
>> diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
>> index bb784e018e..7fc349a3de 100644
>> --- a/tcg/tci/tcg-target.h
>> +++ b/tcg/tci/tcg-target.h
>> @@ -100,8 +100,8 @@
>>   #define TCG_TARGET_HAS_extract_i64      0
>>   #define TCG_TARGET_HAS_sextract_i64     0
>>   #define TCG_TARGET_HAS_extract2_i64     0
>> -#define TCG_TARGET_HAS_div_i64          0
>> -#define TCG_TARGET_HAS_rem_i64          0
>> +#define TCG_TARGET_HAS_div_i64          1
>> +#define TCG_TARGET_HAS_rem_i64          1
>>   #define TCG_TARGET_HAS_ext8s_i64        1
>>   #define TCG_TARGET_HAS_ext16s_i64       1
>>   #define TCG_TARGET_HAS_ext32s_i64       1
>> diff --git a/tcg/tci.c b/tcg/tci.c
>> index 32931ea611..0065c854a4 100644
>> --- a/tcg/tci.c
>> +++ b/tcg/tci.c
>> @@ -889,14 +889,30 @@ uintptr_t QEMU_DISABLE_CFI
>> tcg_qemu_tb_exec(CPUArchState *env,
>>               t2 = tci_read_ri64(regs, &tb_ptr);
>>               tci_write_reg(regs, t0, t1 * t2);
>>               break;
>> -#if TCG_TARGET_HAS_div_i64
> 
> 
> I suggest to keep this and other identical #if TCG_TARGET_HAS_div_i64 and the
> matching #endif in the code.

As before, no ifdefs required.


r~

