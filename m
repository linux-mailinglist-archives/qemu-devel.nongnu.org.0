Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1F360BD74
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 00:33:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on5yn-0003Wp-0I; Mon, 24 Oct 2022 18:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on5yb-00031J-Or
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 18:31:24 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on5yZ-0008M8-U3
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 18:31:21 -0400
Received: by mail-pl1-x631.google.com with SMTP id c24so9631239pls.9
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 15:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4P23ZXw/vPWgL27NpKz7T1GHcZgfYve8CnOZdhtbtkk=;
 b=bkpAuQM8x4RUTORK75Czzdrmue6+zdRXxJvqB5RjbYn5y+NRnMVDWgciCtcvSSfKIq
 Rs4gz9QoqdsMEITvWrOcX5fy9m8UNEDQAEad50IgND5j/8JCLNUx5Ppn1gMy6Gm56gOj
 nfGywQr+BCuOZPfEj7zDgWtTnUcP+Nn2+YYOVkYPTZxRfC2qYW5q+XdsLTxVwiqHusz3
 wJHNzdbfGsOwVVV6GOHIvIlmo4/2QAK9tpjnTbQalNfz23Ug22e6yQx+YIjxZkPiB6dX
 EcmP8BzK478T0WrbFOQxxzUqUJa6UiWDlaoSaxaEfdc8FO5zrfEOsUFsg+OaoCZZiU9R
 mLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4P23ZXw/vPWgL27NpKz7T1GHcZgfYve8CnOZdhtbtkk=;
 b=Pq96iU5EJVwPo0K3b6Ent4PLv+btBSnk+ENxAUk9qkpaCTjf9C8XRlAsE8oSlMFwSW
 bVk1zAkbrl+fkz+eZ+bw5HRcRshcX28QNdt2AgxrXsxnLBudnCj1d//RmmAbfMivNMzH
 jap7IwCR0LApTsK84kWtR+kVY+zrBWZR/2rZiPK+kgRlcokml9ytf2bKhVidgk+Q6gVQ
 LiaeLjOm9p19igb3/x03wbjW6q1gNIsTLhjEhIcqvtbeCNBDGt7/wlhfjrgeyOGC5bp4
 /28x8fd2FV4QjGz+AkLQYpR2WbcilFxc6ELAhy/LebCWXIdXCadzjgnLp+My3jBo9edi
 mp3g==
X-Gm-Message-State: ACrzQf2cjJuzx56DthiWi2WfoIridey9OMJOhgcYhTULM5u+F1NZ1qUf
 d9p9qSmNq/J0mrXeuExic8EDmw==
X-Google-Smtp-Source: AMsMyM7/yIF2IdzHgHioqsyRmKQhTPNoKb1tZZA7Z+PmzkkSg/sTbYC0RCAvOpuZDFrzA5hgssglRw==
X-Received: by 2002:a17:90b:4a47:b0:212:f7ef:1bd6 with SMTP id
 lb7-20020a17090b4a4700b00212f7ef1bd6mr12490682pjb.79.1666650677775; 
 Mon, 24 Oct 2022 15:31:17 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a621e02000000b005613220346asm254204pfe.205.2022.10.24.15.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 15:31:17 -0700 (PDT)
Message-ID: <472ae8a3-d61b-d3a2-7725-2666b7ecb8e1@linaro.org>
Date: Tue, 25 Oct 2022 08:31:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 9/9] target/s390x: Use Int128 for passing float128
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-10-richard.henderson@linaro.org>
 <ab7457e6-d06f-6f0e-f46c-f103e39795fa@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ab7457e6-d06f-6f0e-f46c-f103e39795fa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 04:01, Philippe Mathieu-Daudé wrote:
> On 21/10/22 09:30, Richard Henderson wrote:
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/s390x/helper.h          | 32 ++++++-------
>>   target/s390x/tcg/fpu_helper.c  | 88 ++++++++++++++--------------------
>>   target/s390x/tcg/translate.c   | 76 ++++++++++++++++++++---------
>>   target/s390x/tcg/insn-data.def | 30 ++++++------
>>   4 files changed, 121 insertions(+), 105 deletions(-)
> 
>> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
>> index d1ffbb8710..8023bbab2f 100644
>> --- a/target/s390x/tcg/translate.c
>> +++ b/target/s390x/tcg/translate.c
>> @@ -305,6 +305,18 @@ static TCGv_i64 load_freg32_i64(int reg)
>>       return r;
>>   }
>> +static TCGv_i128 load_freg_128(int reg)
>> +{
>> +    TCGv_i64 h = load_freg(reg);
>> +    TCGv_i64 l = load_freg(reg + 2);
>> +    TCGv_i128 r = tcg_temp_new_i128();
> 
> Maybe rename as load_freg_new_128() to make emphasis on the returned
> TCGv need to be freed?

It's no different from the other load_freg* functions just above.  As with those, the 
result is assigned to one of the DisasOps slots, and all of those slots are freed at the 
end of each instruction.

r~

