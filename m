Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9F31F338
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 01:05:27 +0100 (CET)
Received: from localhost ([::1]:34726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCtIT-0000BK-QP
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 19:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCtGK-00080l-EL
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:03:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCtGI-0002nV-UI
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 19:03:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id a207so5433036wmd.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 16:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PbFZ328eo5XeUkX51JoJ7FZSxC6rew0M8K8i36lsPFc=;
 b=UKQeDvsY6TyjCnbqI8A/uTanWBh3GrltAJHmR2MNOlKPtp6jPc3M3i2nCtlqMqzKs+
 eKwGjjAB3y9qqJC/AETumdcocsEyDKZ2uRwJfb7Y3qYxOuKc97vsO4u1xMQ5XXu8wten
 17NmEFTgJ7G1e3LUN0yeJKI2dBosnEjF16q8bwykS+OjA6pgTWEQ1cpeTdf2R0T0ipLL
 lUP8LYd3bOJlWvlxHc+khyoalbAf+b9vd/3JGoEtiD3OiOVZ2KjUu5ebqj1s1kWCIOpJ
 wb8e3+XGZyAPj08R2mGpvf37yQw2qiGxboktm38JbnuLfeQ+KYd9PQ+HdzCxrzkk9/ik
 FM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PbFZ328eo5XeUkX51JoJ7FZSxC6rew0M8K8i36lsPFc=;
 b=GoeYYaImmtGgpBhF5HQtmKSkhFybwb2v5sR+v9acwEnIrjgGOTm/Qw8ISN33unWvDh
 fYN3peil87RTS/7YZYffxEv/qD4com83KxoNa9FEiPEs0Q0MWYTVv5dLdDh7WkDTiwEr
 ImrENCgkj5hHJalwfe7purTDRAY89U2Z1zbLwqHMuMT5sE5qS8uc+4zvjE2Xc+NbnRGe
 dTtQeSWyV77rmKuIMxrL37r7QrjQHNnplCoQBVlRYvN5chuNPbQxZQIzOJEkOZ7pJjDO
 /kULCB7rT2T/6nCU7KjyehFzeUhAKtE4M4DsPag143vbvy3Fq3B8jrEU1ypyWlxxB8OK
 QdeA==
X-Gm-Message-State: AOAM530sgE05/qeXJYNoH8KofXPnuIQxizH6YdaErjedFvFhTGurBXJg
 wlPvHoXjdBB7dyB5Qsepujg=
X-Google-Smtp-Source: ABdhPJw4BdatFrwhOOwQ86qRjvX3TPw0mDOcDkVrs5+EpyjDlHvYHfDJ5lGJd92yO2H5o6e8HV4nZQ==
X-Received: by 2002:a1c:105:: with SMTP id 5mr5690330wmb.89.1613692988510;
 Thu, 18 Feb 2021 16:03:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm12188014wro.15.2021.02.18.16.03.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 16:03:08 -0800 (PST)
Subject: Re: [PATCH v4 05/71] tcg/tci: Remove tci_read_r8
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-6-richard.henderson@linaro.org>
 <7f634553-3e1c-2cd6-a712-31c335e79508@amsat.org>
 <4e95c957-4e06-a6c5-280b-c6ea7829bece@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <37a1ef84-cc95-e362-d8a9-8c4bdf98682c@amsat.org>
Date: Fri, 19 Feb 2021 01:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4e95c957-4e06-a6c5-280b-c6ea7829bece@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 12:33 AM, Richard Henderson wrote:
> On 2/18/21 3:11 PM, Philippe Mathieu-Daudé wrote:
>>> @@ -533,7 +520,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
>>>              tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
>>>              break;
>>>          CASE_32_64(st8)
>>> -            t0 = tci_read_r8(regs, &tb_ptr);
>>> +            t0 = tci_read_r(regs, &tb_ptr);
>>
>> No need for tb_ptr++ here?
> 
> Done in tcg_read_b, called by tci_read_r.

Doh I missed it is done in tci_read_r() indeed.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

