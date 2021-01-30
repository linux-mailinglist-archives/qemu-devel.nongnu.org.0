Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF01309279
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 07:51:30 +0100 (CET)
Received: from localhost ([::1]:39918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5k6U-00011S-0k
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 01:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5k5S-0000JQ-Qe
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 01:50:26 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5k5N-0003EI-R1
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 01:50:26 -0500
Received: by mail-pl1-x62d.google.com with SMTP id d13so6692679plg.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 22:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BqMJwwOa60C05tCH+n6EjadH5sFkRYnbAqfScX/HHNU=;
 b=l/7soLuF0lsFqTu6fPJVBK/cAcuDGjdWm4JVYBmOmhnrjTtcpAVrxdYRbNIe9YMsCx
 UhmUGO3Fpo3ozIYQ4QFUk5hAIxU2wIg9J/6orBPKbJtN6KUEnIgEKZxZMjx+0cvrwd4a
 Z4TpMNnArNMFhUayXM7fl6txvvl4+Teyk4SA0KhQ2TKtwrX9XNvVQUl38maQ2RhNSBhz
 4bbJ/+dtkYICqKFnPnre1MtKfNso/PyDH/OK4e8DPguPnvkvd4VooxN4LzT45r79TiH6
 gak71vTB6TwvdrcXTBE1JygHqOwGoLed+4c3Xl4GF0XdEuVz3ZqnrqD76Kr7Uyd6F4RP
 ybVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BqMJwwOa60C05tCH+n6EjadH5sFkRYnbAqfScX/HHNU=;
 b=QaaM2lmptbLADeA/Hx+AfK2PnA7nLhWmWKlTyCHnzV6uOgnPgpF4r6XfMEDPt64Jfb
 +KuZ5d5EFb0VmKAiVNjTcScInM511Mncw3pXf7AG6ciwXp9Y3/9hcOWw1teIV2qWY6HS
 Xu4fjJjZ6iSZ3BhIjd7KnLdauc2CvD0rrGvhQ0bhBULmPXYeKrUemzVDKHFaqz0VC3KL
 enwi91uE2xuomK+n+opbXHK0mPpsak05iWCOA03wcTXYHGje/aBdTAJmsA1J3osftqra
 TvzC08HVCFEime+vjMJvArtDVIOFtceBDcJGuUwV0sgxA3zf16utry8xQUhI9wKbZK07
 7H3g==
X-Gm-Message-State: AOAM531KFRP8xbEAcvt2+PdGdEEqxnbQVe5ih/JKUmePe5CbhWKKJ+hQ
 +NKplKg6rIzGWOqUnU5Z8Ge5l9698WU5XLhK
X-Google-Smtp-Source: ABdhPJzySWIezKmCeWnj1f69Mng7KIU45jy1k1TfJOPqyEhjudMtpVPQP+4BqZ9u9HsK+p9M2RHc0Q==
X-Received: by 2002:a17:90a:46cd:: with SMTP id
 x13mr8125920pjg.194.1611989419543; 
 Fri, 29 Jan 2021 22:50:19 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 34sm11382576pgn.56.2021.01.29.22.50.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 22:50:19 -0800 (PST)
Subject: Re: [PATCH v3 04/24] tcg/i386: Tidy register constraint definitions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-5-richard.henderson@linaro.org>
 <CAFEAcA_L-vs8d+EMN3WAy3m8cBqtGtkRgy_6_SYLWGuMDSTFFA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <437b165c-5c9c-fefc-b2fc-3fa6152c36bf@linaro.org>
Date: Fri, 29 Jan 2021 20:50:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_L-vs8d+EMN3WAy3m8cBqtGtkRgy_6_SYLWGuMDSTFFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 1:20 PM, Peter Maydell wrote:
> On Fri, 29 Jan 2021 at 20:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create symbolic constants for all low-byte-addressable
>> and second-byte-addressable registers.  Create a symbol
>> for the registers that need reserving for softmmu.
>>
>> There is no functional change for 's', as this letter is
>> only used for i386.  The BYTEL name is correct for the
>> action we wish from the constraint.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/i386/tcg-target.c.inc | 40 +++++++++++++++++++--------------------
>>  1 file changed, 20 insertions(+), 20 deletions(-)
>>
>> @@ -226,11 +234,11 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
>>          break;
>>      case 'q':
>>          /* A register that can be used as a byte operand.  */
>> -        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xf;
>> +        ct->regs |= ALL_BYTEL_REGS;
>>          break;
>>      case 'Q':
>>          /* A register with an addressable second byte (e.g. %ah).  */
>> -        ct->regs = 0xf;
>> +        ct->regs |= ALL_BYTEH_REGS;
>>          break;
>>      case 'r':
>>          /* A general register.  */
>> @@ -247,19 +255,11 @@ static const char *target_parse_constraint(TCGArgConstraint *ct,
>>
>>      case 'L':
>>          /* qemu_ld/st data+address constraint */
>> -        ct->regs = TCG_TARGET_REG_BITS == 64 ? 0xffff : 0xff;
>> -#ifdef CONFIG_SOFTMMU
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
>> -#endif
>> +        ct->regs |= ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS;
>>          break;
>>      case 's':
>>          /* qemu_st8_i32 data constraint */
>> -        ct->regs = 0xf;
>> -#ifdef CONFIG_SOFTMMU
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
>> -#endif
>> +        ct->regs |= ALL_BYTEL_REGS & ~SOFTMMU_RESERVE_REGS;
>>          break;
> 
> Should these cases really be ORing in these expressions
> rather than just using '=' the way the old code was?
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

All of the cases should always have been ORd.
In theory, one can combine register constraints,
just like one can combine constant constraints.
Not that it would really make sense for this
specific case.

r~

