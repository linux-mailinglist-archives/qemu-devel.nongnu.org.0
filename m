Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24233E7DE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 04:53:16 +0100 (CET)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMNFD-0002vQ-Kg
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 23:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMNDr-00025c-93
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:51:51 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMNDp-0002Lv-J0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 23:51:50 -0400
Received: by mail-qk1-x72f.google.com with SMTP id x10so37615665qkm.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 20:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pq7HUPGXGyIJHq7oRnj1ofjFJRlk9NtnApCIc6UUcYU=;
 b=DWh0Htq9xYwWUNGEl7CAqHVzezt9FXzbbNsiQg0SqiO2fR5QSZfG5+ZJ96utjmQKex
 91MoBVyOLUGmq2bRjjFPCHA3/zqFvVO3YqhVMPIupztzoLnnsGX7JMXK4C2p9QqdTAnY
 c5kepAkSeBJF3yBGq8BoxSwF8ibkMIS1/mF3ZYngM4eZoGANdUz6DvFfw/z/qrKmX7my
 mZkrkLRA+EbIpc7Ys9ZZE2Xjav69M2ZnXcyXRKy3X9hZzNMjjrJLY0TFtDlSdByScO/c
 rQZAWZUulC9u5z2IlvoSmOTiwDxioeuPrXgZYvnoF1yrpEk+bF60GU5mgB/K0pgX/gPa
 A9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pq7HUPGXGyIJHq7oRnj1ofjFJRlk9NtnApCIc6UUcYU=;
 b=QkfigiVQHT4gKMOZiSvWEqY9AwztCeQPbI/Of/B2HYGUOpPcNpMoGoYlulwpa8WoF8
 DjWcwHammhOMZENnxXu9+wDWWAgls60ZtAmUQC+gJHgCrPJFT+3uTdcmFLlEl7MTU58j
 h/cAWYKQR1jx4/xMPlA6pPz+55G2yDyRaR/7LRYWK35+DCXeJ6QvE+JQYRBo4VY4zpex
 VkwPJ8uCC9tPWmCPzT6jusWc0MerzpXJNDrDSi1BFI2trETXVCnzy/jPNAf/6UtPzQoW
 wzEWhmcTA9wxM4AGyxL2/jqBvOvVuuDIacinJMSK1PNNLFR4WU8gG6D1CpV6h+7i8jOF
 ndWQ==
X-Gm-Message-State: AOAM531YSRNam7pySJCp2EBkcW+WAdrGgOk8r4Jk5gfoP2r17eN/Gdne
 7+sLHNP5T6gE9BVdifuusor43g==
X-Google-Smtp-Source: ABdhPJxvQviM+szW+V5zEc4QxCZvKwsrZ8tk7+TDAyvsA+/0Qpgbik0MqDl6g5Zbs6/ysYhJYehpYQ==
X-Received: by 2002:a05:620a:15d6:: with SMTP id
 o22mr2582870qkm.181.1615953108297; 
 Tue, 16 Mar 2021 20:51:48 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x22sm12527783qts.41.2021.03.16.20.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 20:51:47 -0700 (PDT)
Subject: Re: [PATCH v5 22/57] tcg: Build ffi data structures for helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-23-richard.henderson@linaro.org>
 <269e1fd0-dd33-c9db-8792-49c60be1ae16@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eeb08266-967d-f47e-31ce-1eaebd024128@linaro.org>
Date: Tue, 16 Mar 2021 21:51:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <269e1fd0-dd33-c9db-8792-49c60be1ae16@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 4:35 PM, Philippe Mathieu-Daudé wrote:
> Hi Richard,
> 
> On 3/11/21 3:39 PM, Richard Henderson wrote:
>> We will shortly use libffi for tci, as that is the only
>> portable way of calling arbitrary functions.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build                            |   9 +-
>>   include/exec/helper-ffi.h              | 115 +++++++++++++++++++++++++
>>   include/exec/helper-tcg.h              |  24 ++++--
>>   target/hppa/helper.h                   |   2 +
>>   target/i386/ops_sse_header.h           |   6 ++
>>   target/m68k/helper.h                   |   1 +
>>   target/ppc/helper.h                    |   3 +
>>   tcg/tcg.c                              |  20 +++++
>>   tests/docker/dockerfiles/fedora.docker |   1 +
>>   9 files changed, 172 insertions(+), 9 deletions(-)
>>   create mode 100644 include/exec/helper-ffi.h
> 
>> diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
>> index 27870509a2..a71b848576 100644
>> --- a/include/exec/helper-tcg.h
>> +++ b/include/exec/helper-tcg.h
>> @@ -10,50 +10,57 @@
>>      to get all the macros expanded first.  */
>>   #define str(s) #s
>>   
>> +#ifdef CONFIG_TCG_INTERPRETER
>> +# define DO_CIF(NAME)  .cif = &cif_##NAME,
> 
> The comma in the macro bugs me... What about adding it as last field?

Hmm, I think I can rearrange things so that happens.

The first iteration(s) of these two patches Knew Things about the layout of 
TCGHelperInfo, and the cif pointer needed to be immediately after the function 
pointer.

But in the post-uint32_t conversion part of this patch set that's no longer true.

So I think I can bodge things here pre-uint32_t conversion too.

>> +++ b/tests/docker/dockerfiles/fedora.docker
>> @@ -32,6 +32,7 @@ ENV PACKAGES \
>>       libcurl-devel \
>>       libepoxy-devel \
>>       libfdt-devel \
>> +    libffi-devel \
>>       libiscsi-devel \
>>       libjpeg-devel \
>>       libpmem-devel \
>>
> 
> What happened to the other Docker images?
> 
> Otherwise the rest LGTM.

This is the one we use for the gitlab build-tci job.  Or rather, we did.  It 
looks like build-tci was changed to debian-all-test-cross recently...


r~


