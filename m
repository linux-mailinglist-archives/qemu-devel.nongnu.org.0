Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB558383A42
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:43:05 +0200 (CEST)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligKe-0003gy-QY
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lifsY-0006xP-2i
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:14:02 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b]:43982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lifsV-0008OB-B2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:14:01 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id n1so1930388vsr.10
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=B0SzcGgJeUSp4EZtc1rcGhDYnoanwWSmonkzTFacQUI=;
 b=gr551bXM635YQpF5+l2FN43MNIlEigEscT4AC2Xkmf94EYfUMW+I2vGHoWNk7PEdph
 Rq63TMb7NYHfVP5yMlhWbwFE7QxYpesuFmRz7/v39AsIMoh+egHgz4CCjhauAiLX0qHT
 Ft8Is8aN1aWBARKUFm5uE3mVZXgxIId9GLSrtGI1LsRHtg/Sq7fxH7qFF5l/uOePnjl8
 3hZO2Wq+i7LQQRRn6wiJA2X7Pxhz7I69tvD4bDW9Dpc63IjEVTnPBMo3dY30zQZ0hIhb
 raD82/XanGt0FkgNG1Smeb5Yp+u3VwKnRNgWclxIiqdzqKsQGFO1Y5kn3g5uBLjr9x9/
 8llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B0SzcGgJeUSp4EZtc1rcGhDYnoanwWSmonkzTFacQUI=;
 b=Zzz2IvZ9npQB1w3QNi/Am7LJIOXQQtMOClAwshpiniZL/LZXkClS6CfD2ZcJJIQ2a3
 rHjDbhHagrbNaD3oUrxv2yzIK41LfFOMarvXIyJmi2m//gJnrG6NBUZtnVdCciXL8vo0
 KaGw1TDlzUm0s5aFZf/eczTtbEmfvdZc7n82YVCy9bfsOBAZJQvqNx0C9tfA1+Moj/5L
 fnS3eSNCoWVtWdilGQga172c2YZGbfr5EPdA4X863OfQYVBvH9KFXQVGgoHZWLn7oPkg
 I4mpxf3qJnxXgB85h3vRXXQdAKR4fJJVnPS2xTrPzPcH7nmIXeKcZKNgUh/l8UG2F7BT
 8j+Q==
X-Gm-Message-State: AOAM532hgV0nGkAys+8dkN/Jrz6LR82RNS8PfGhNA5NTvl6Xb60LffWs
 rGhbr0RyiTCA+8+pDwkt6SA/SWVpOMp2pb+A5S0=
X-Google-Smtp-Source: ABdhPJz+2MIXb6xdXIXhhrSL5dSZ2eR/PYYsTF+VKesPxaW+pBB7TQSYwTwxGVg3IWo3LZCt6sdawA==
X-Received: by 2002:a05:6102:194:: with SMTP id
 r20mr464863vsq.35.1621268038390; 
 Mon, 17 May 2021 09:13:58 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id t74sm2337737vkc.35.2021.05.17.09.13.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 09:13:58 -0700 (PDT)
Subject: Re: [PATCH v6 04/26] plugins: Drop tcg_flags from struct
 qemu_plugin_dyn_cb
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-5-richard.henderson@linaro.org>
 <c1f14c27-f1bd-093f-959f-85b6c072e08a@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4c84021-26bf-0b43-cead-82463876b34d@linaro.org>
Date: Mon, 17 May 2021 11:13:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <c1f14c27-f1bd-093f-959f-85b6c072e08a@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2b.google.com
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

On 5/16/21 7:53 AM, Philippe Mathieu-Daudé wrote:
>> -    op->args[*cb_idx + 1] = tcg_flags;
>> +    op->args[*cb_idx + 1] = (*begin_op)->args[*cb_idx + 1];
> 
> I don't understand this change, can you explain?

This patch drops a mostly-unimplemented feature from plugins, where in theory 
the registration of the plugin would specify the TCG_CALL_* flags.

Instead, take the flags from the plugin template function -- i.e. copy them 
across from the original begin_op.

>> -static inline uint32_t cb_to_tcg_flags(enum qemu_plugin_cb_flags flags)
>> -{
>> -    uint32_t ret;
>> -
>> -    switch (flags) {
>> -    case QEMU_PLUGIN_CB_RW_REGS:
>> -        ret = 0;
>> -        break;
>> -    case QEMU_PLUGIN_CB_R_REGS:
>> -        ret = TCG_CALL_NO_WG;
>> -        break;
>> -    case QEMU_PLUGIN_CB_NO_REGS:
>> -    default:
>> -        ret = TCG_CALL_NO_RWG;
>> -    }
>> -    return ret;
>> -}

This is where the plugin interface was supposed to convert flags from one form 
to another.  This got stored in a structure and then passed along as an 
argument to the function containing that first hunk above.


r~

