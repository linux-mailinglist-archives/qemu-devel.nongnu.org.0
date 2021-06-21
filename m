Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD113AEAAC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:02:17 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKVE-0006xh-Cq
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKSv-00060u-89
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:59:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKSt-0004to-ML
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:59:53 -0400
Received: by mail-pl1-x631.google.com with SMTP id i4so4899379plt.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 06:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y3dwqyu0ybxghyw0VE3lg4dC7az8hufS9p1pB3pNPaI=;
 b=s9x78zo/c/j/CvrYzylzIOz7hroMr6HE8JINuANt0RTRUzL4AesQq7eX6eRfSWg3j3
 41EvhYPCyNonj/EcZZJKLaSsk1QiSEVT1C/amQjVuuCvGHrQUBP6d3mMVZT2wjBUV5zY
 FRWAq6do7iohBAPN7s+F23SzG7jNH6VqT7V/zoj2lx4aSlnGEIojuNxcY1kbBd9UnY0U
 pkDCWQj8sw+rnK33d4lXF3b8+VNSR+YEyC+ibHqTEzCCDEBVWton9WyZ6ibpN0S6VRdW
 iNMb8QMn3EuV34jWmwu+pnERrrQKVWmfoPFUhVAOgQxKvln8nAYZtvgvpgwXzrQ3gneC
 HYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y3dwqyu0ybxghyw0VE3lg4dC7az8hufS9p1pB3pNPaI=;
 b=YuaAMTEaKj+telVUpbR56VVM8OrmyMGrIv48IObLPCBF2NSbHpTZccWSk6rjuJElx7
 VfwRrwSC1UGtkZAnRYcwE50pAvsqfy055LpD+NmWq/sEDJrmVS8/KB0DkkOsi8/AokMA
 J4gpq510x238+I/qEbIPn7+WobfanQzHK1yVnIxWxK2tJW079FuJdZkIGMBDXSYGEwm5
 bbVvegieGIdo0rwjUi0jIOpv1YRo/sRkjNN8IgHiNEQzLgNhInQKumYQ2gBxcK3rHCW6
 OWWQc6V+yfJCZNXJU7ZjtH2HT8g8RSRDjNc4KraUhK24jux+xBLNfp4Rm9u1CSArUXzT
 E1wA==
X-Gm-Message-State: AOAM530jjQ88aZ81PME+2qECiP+FDMp4Ur+KsKaNqRkA+QBYWd7+iZ6n
 7GEEfBArJzn3Dh/0g/UQUiRP6b3tg4Z6ig==
X-Google-Smtp-Source: ABdhPJwrf6TFJWyYdeRqDVZNI2Ed1Qg/Zikm5/P87MRQjUSFdqaQo3ZDqmL+OoZgkmdhUJcg5G7xlQ==
X-Received: by 2002:a17:90a:7aca:: with SMTP id
 b10mr39059693pjl.49.1624283990261; 
 Mon, 21 Jun 2021 06:59:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id ip7sm15756199pjb.39.2021.06.21.06.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 06:59:49 -0700 (PDT)
Subject: Re: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-2-richard.henderson@linaro.org>
 <CAFEAcA9ktX0famPUabJ3J_nhBp7CHOzd7S_auHEML7kPi9Yysw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0dae1c89-262d-742c-963c-543a3f2f9a6d@linaro.org>
Date: Mon, 21 Jun 2021 06:59:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9ktX0famPUabJ3J_nhBp7CHOzd7S_auHEML7kPi9Yysw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 6/21/21 6:41 AM, Peter Maydell wrote:
> On Mon, 14 Jun 2021 at 09:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This will eventually simplify front-end usage, and will allow
>> backends to unset TCG_TARGET_HAS_MEMORY_BSWAP without loss of
>> optimization.
>>
>> The argument is added during expansion, not currently exposed
>> to the front end translators.  Non-zero values are not yet
>> supported by any backends.
> 
> Here we say non-zero values are not yet supported by the backend...

I meant to say "non-zeroed" wrt the inputs and outputs,
i.e. the previous semantics...

>> +        tcg_gen_op3i_i32(INDEX_op_bswap16_i32, ret, arg,
>> +                         TCG_BSWAP_IZ | TCG_BSWAP_OZ);

which were these.


r~

