Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B8B3A6932
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:44:52 +0200 (CEST)
Received: from localhost ([::1]:50956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnpb-0002tH-4O
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsnoA-0001Xa-Ad
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:43:22 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsno8-0003tM-Rj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:43:22 -0400
Received: by mail-pl1-x635.google.com with SMTP id x10so6676688plg.3
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JyVvYjG0poM1sXA5a1G9tDtbRjmTeb3YFhVGrJih6MY=;
 b=hOJfmI0NeWZHJYpB/5kVgdWSVXNqPy8AHuXIg9SE1YC0sKbHxSN+qhRKt03uHsXm/O
 6qAuo44U1Th73x1V1Hn1JqtEFL+YxD3iuwMmno2wbzLC1vzaGVWIOo4SbYq8lNf++HOe
 MicjaRwqo83Ht9Xl5dwYHTD+p75zgDW7evemTZFrLi7EuZMW0qLbLSdjUTT5Axxrxako
 fT1+1vqbNd1ZZGrY+PMC1pZrGo7CMnRAxuM5S3oCfWYcyeZXU1MBJbzEfWqjgZXTV39M
 JFaEAwnxZiFMcY3gkeOrQQYth+N63q0HNeYmelA5Jx+y1QTarO6CSz2I4l9YjCu2tptj
 W90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JyVvYjG0poM1sXA5a1G9tDtbRjmTeb3YFhVGrJih6MY=;
 b=NamLeut/dH/O1g7dPQDv4iuV/fR3KTyszAdmMHqaU7xa5o1kdeevj8mPkE1wTzec6w
 UnDeT7pGVBEgABLy20A6ubPyoglKRQrkC9lrNfs80rY0T7MslVOmY89BsUN41HmUZWYJ
 PArQ9W2M4v50BbVhsmf7al1Ty8u3jaoUYLYaoixN3BYN+jFSsaskvNg2DVYmiPtc4ahQ
 CMa/upv+9d81PVa+9oogPE8YnF0LlpvnBFhvfDTeTYuRN4SwV+i04M6uJ001QawBkt6l
 K1WNh7Pm23FcFey3SC/6sQBP+dtZuuRVgFmrynrDa4PZIa5h1+kVXmCw77ZhSmiGTUtz
 RoKA==
X-Gm-Message-State: AOAM532E5lrub/OPoivksR8abowxCjCzhxufcFWpviQffGZ7P/PGWWyy
 AujHvtPfH4ROVi/BwtsxwpEAhQRh/wwoQw==
X-Google-Smtp-Source: ABdhPJxgEdKtBoF++JiOJUMaY1UasXp/i1tjJR31hhT3kPe9zgaddbysHH246My/el+nKuMiJdlQkQ==
X-Received: by 2002:a17:902:728e:b029:101:c3b7:a47f with SMTP id
 d14-20020a170902728eb0290101c3b7a47fmr17131750pll.21.1623681799307; 
 Mon, 14 Jun 2021 07:43:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 y205sm12724254pfb.53.2021.06.14.07.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 07:43:19 -0700 (PDT)
Subject: Re: [PATCH 01/28] tcg: Add flags argument to bswap opcodes
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-2-richard.henderson@linaro.org>
 <87h7i0k6n4.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <648591a2-7605-e0ed-5953-aa5a93302ca2@linaro.org>
Date: Mon, 14 Jun 2021 07:43:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87h7i0k6n4.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 4:49 AM, Alex Bennée wrote:
>> +/*
>> + * Flags for the bswap opcodes.
>> + * If IZ, the input is zero-extended, otherwise unknown.
>> + * If OZ or OS, the output is zero- or sign-extended respectively,
>> + * otherwise the high bits are undefined.
>> + */
>> +enum {
>> +    TCG_BSWAP_IZ = 1,
>> +    TCG_BSWAP_OZ = 2,
>> +    TCG_BSWAP_OS = 4,
>> +};
>> +
> 
> So is a TCG_BSWAP_IZ only really for cases where we have loaded up a
> narrower width value into the "natural" TCG sized register? We seem to
> assume this is always the case even though the TCG bswap op doesn't have
> visibility of how the arg value was loaded.

All of these flags are for narrower width bswap.  When you get to patch 17, you'll see 
that tcg_gen_bswap32_i32 and bswap64_i64 do not present this argument to the target/ front 
ends at all.

IZ is for when we know that we've used a zero-extending load feeding into the operation. 
I've also added code to the optimizer to *set* this bit when it can prove that the value 
feeding the bswap is zero-extended.


r~

