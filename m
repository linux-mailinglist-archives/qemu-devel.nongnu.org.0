Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9322FBE71
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:02:45 +0100 (CET)
Received: from localhost ([::1]:53484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vL2-0005aW-4X
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1v5d-00057v-Kk
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:46:49 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1v5b-0002X8-Sj
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:46:49 -0500
Received: by mail-pl1-x62a.google.com with SMTP id t6so10937707plq.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uwLTup1vEyxhbChMysMzjHzF5T05H8lHqmTC5Kjd+ng=;
 b=ZFT/3PPmH2G3wGHxcmtsWoN/TX0Nw3mIWLvQa9g8pn6pf9Bh4+Wbk1IO1rAJ1g4vAz
 am14oLvUnUPcxqgIaGiKUmTWQrmefqBZTKg2Li2Q16iPFUTrEglwaZ7Hma1Jkn0tYnZ0
 DtBvw7MsPJvXj6uDzqw3GrhUCsrb1P2ba1yc8OWGZTp2opGIVsMhKvxFxaZ7+eiB1z2R
 I9RJ+Yw5I30954Uvcrq+rqnYW6S3E7FrLMHZLdDAYMkNy5t5ezUnOTWdl5mFLpeRU/8s
 qJqL2ralijvij2ERfgdNtVDQxO1acaWtuz5XmtiyxbaTjYmu3Gt1vJSbNrPddTR1KEtJ
 srNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uwLTup1vEyxhbChMysMzjHzF5T05H8lHqmTC5Kjd+ng=;
 b=D/lbMmPwoBJQbNDMTc8gs7pN9EccYoNODXXjopl+P60VDY5obgd2AHpV4JlE3F+0x+
 pzd9QPd0rGrHnUuTTgs2iEuW9nKvQ7Jz71GhIfjoCjIQ+HFU8Tn6iw3RGSXTVaMA8a4Z
 rhw8rWEtI/Dy0oElqA5IXbWD5nEKH05k8OKKeFmiFitJwQPxZUkOJe4praKldLBWNuk1
 N7GkwnZG6F4z/Hf7JqaUI5s84zu5CJubB0EMcDcfn21zRO/o578InAKt+mqnSMZaKqMM
 S8SrJdAL3675NWaKpDBTbd5hs5dk3YhgS0GMFlMIxTPX4fEJnvRRw53cIbX1W/Rx4/wk
 BqEw==
X-Gm-Message-State: AOAM531QHECFq6AAj4w4g0YcrQ44hqlXQaPlHhhRmfdfxHKNKTKBlhtA
 TwgS+6pLFGL3rw3459IOlN5yEU2ehWFBKg==
X-Google-Smtp-Source: ABdhPJyE+nxfQyP6QLLm8ZadviXCoWSqR2kyZ1yH8UGSSYGA1K/H6/g032Qq32O9d7CEiKMIRu+I8w==
X-Received: by 2002:a17:90a:5d03:: with SMTP id
 s3mr859892pji.150.1611078406308; 
 Tue, 19 Jan 2021 09:46:46 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id l190sm19326117pfl.205.2021.01.19.09.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 09:46:45 -0800 (PST)
Subject: Re: [PATCH v2 03/22] tcg/i386: Split out target constraints to
 tcg-target-con-str.h
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-4-richard.henderson@linaro.org>
 <CAFEAcA9pnbrQYihP8NkajM0LHYzciuoO9xNmRmCbBaqB+WV5Qg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0852e1ab-bf36-09cf-81fe-4c6349a2cdfc@linaro.org>
Date: Tue, 19 Jan 2021 07:46:42 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9pnbrQYihP8NkajM0LHYzciuoO9xNmRmCbBaqB+WV5Qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 1/19/21 4:38 AM, Peter Maydell wrote:
>> -    case 's':
>> -        /* qemu_st8_i32 data constraint */
>> -        ct->regs = 0xf;
>> -#ifdef CONFIG_SOFTMMU
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L0);
>> -        tcg_regset_reset_reg(ct->regs, TCG_REG_L1);
>> -#endif
>> -        break;
> 
> But in the old code the 's' constraint is 0xf for both
> x86-64 and i386.

That's perhaps laziness, or simply the lack of names in the old code.  It
logically should be BYTEL, because that's where byte stores go from.

In the end it doesn't matter, because this constraint is *only* used by i386.
The opcode INDEX_op_qemu_st8_i32 is not used by x86_64 at all.  See
TCG_TARGET_HAS_qemu_st8_i32 in tcg-target.h.


r~

