Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77268633002
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 23:54:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFfP-0001Yg-Eq; Mon, 21 Nov 2022 17:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxFfJ-0001Y5-Vv
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:53:28 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxFfF-0005xB-7G
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 17:53:25 -0500
Received: by mail-pj1-x1031.google.com with SMTP id mv18so4035979pjb.0
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 14:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+L2XyAP2QtZG06yU/YY+gA0urXPunf8TFoELSDix1BA=;
 b=VW6Ost2/1qhrvWYOweNhPrBxyYHVjpj1VQi6rJlvfUAQkW0qfIUJPlp0LIvjtOZMxl
 U5897AnSS3R61RF7cGxZQryB/WD95nvolDEb6BMjBs3jz/b7br0UQ3VmVqt5oSssb3dg
 EOH6toBIBUtTzolXpgHV+AWkG4+eQar/yPB4NkMydXoYuGyRa2sHUMKal+3FkohniXwk
 w+efdAP9HPPRsX5+S0bHtgB6jdhUSKgfWRXCT9OAGEA4KvnJHrHYL7PJW1TqUdNWsScm
 vLghWlO4jttshK6N5lEvQ0Er9t1z5JVMf5ANKNuy/nVoDAwrqqTYlF3mmo0EXurzFSKN
 x8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+L2XyAP2QtZG06yU/YY+gA0urXPunf8TFoELSDix1BA=;
 b=7YNi1C68OIpYcT5NryzM1W3LEdiM+x+zt+ZQHWGEJ32GL9hwa1jN4P62BgUgsf2epp
 HYVn6eNGSHv8O/BEeX/KkrdEvBK7bJQWK3UZXSeSMgilLJo4ClU1yaS4RvTC6HbEjAEu
 sKy31Alo3L0RSOl9U2oCtiUhrmLcK8K9lOx0HLT95u8zPvgQ70xBYSvdLGHpkUSjJqWx
 urKexvvWgrQpAylP495LDVbqAvUmMFbBMec8e3yzIXNO6bmP2FaerIpraAcypyKxuBoY
 /udFW01F8lcQnS3mbReXMbhHidQ5c99BuiMTtoXt8sA0lmpYJoV7mg2d6YpSO6mxmRwZ
 KnUw==
X-Gm-Message-State: ANoB5pktD2JOUXsSDb30JNbhyhaEzdLHSwnJ+u1yC6rlANlhIkXgwL2h
 +AwXNI/WArPEjhxwujP1pmI90A==
X-Google-Smtp-Source: AA0mqf6zFJBH4wVVH0UOvpzBFqRtR/+UDJirNxJ/dKSFk0s6ylkzNntCWEswvc10yXBgxTVbGIWvVA==
X-Received: by 2002:a17:903:3254:b0:189:2184:62f6 with SMTP id
 ji20-20020a170903325400b00189218462f6mr1549953plb.24.1669071199618; 
 Mon, 21 Nov 2022 14:53:19 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:dd04:f222:eac3:5b54?
 ([2602:47:d48a:1201:dd04:f222:eac3:5b54])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a635456000000b00477078686a9sm7995129pgm.42.2022.11.21.14.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 14:53:19 -0800 (PST)
Message-ID: <744b2570-180f-1b72-44a2-3391c2d629c0@linaro.org>
Date: Mon, 21 Nov 2022 14:53:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 1/1] target/ppc: Use tcg_gen_atomic_cmpxchg_i128
 for STQCX
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org
References: <20221112061122.2720163-1-richard.henderson@linaro.org>
 <20221112061122.2720163-2-richard.henderson@linaro.org>
 <f456f0e6-e69a-bda3-f2ee-7e4d4b7c8cd4@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f456f0e6-e69a-bda3-f2ee-7e4d4b7c8cd4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/21/22 14:37, Daniel Henrique Barboza wrote:
> 
> 
> On 11/12/22 03:11, Richard Henderson wrote:
>> Note that the previous direct reference to reserve_val,
>>
>> -   tcg_gen_ld_i64(t1, cpu_env, (ctx->le_mode
>> -                                ? offsetof(CPUPPCState, reserve_val2)
>> -                                : offsetof(CPUPPCState, reserve_val)));
>>
>> was incorrect because all references should have gone through
>> cpu_reserve_val.  Create a cpu_reserve_val2 tcg temp to fix this.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> Richard, since this depends on your int128 with helpers, do you want to
> queue this in the same queue?


I certainly can.  Thanks,


r~


