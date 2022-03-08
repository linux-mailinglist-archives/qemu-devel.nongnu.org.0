Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7EE4D1FAA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:05:51 +0100 (CET)
Received: from localhost ([::1]:53452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReDW-000465-He
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:05:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRdOH-0002J7-QT
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:12:53 -0500
Received: from [2607:f8b0:4864:20::533] (port=41798
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRdOE-0007xh-Je
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:12:53 -0500
Received: by mail-pg1-x533.google.com with SMTP id o26so17015512pgb.8
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 09:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FbKkt2GMChw/gdDM2BH8Sw69CAIU+pcQBfXhPGI96HA=;
 b=nKEAhxFMOswT4o5bqehniY4rTDJQ85DhSiozppLwcNUSR25luVv5yZlTu+ubrE8P16
 i+uxUp3ZKjBB9vv30Iy0LH/sRUfYK4PlSTGsHS++lHpPvlitf7UeOe6hKOn7hVzC51Kz
 DysENi4pUDAyZ8Q8ZAB5asElk2px97gsSk+ZfxvdV0ebWSiRGI8c03+xwbxkQkkDCBc/
 csJzPL1TFKfewcZzMfn1VJ5BBMQN7Yku42uNcT/rVHbouSONUtvS3Dv3YfhxadAWs8rZ
 hkPMmw6MCi02cSf4ksU1fNdN+kFzyDdEEsURArBjpdcl2hnR1kAxN9bydwr1tN3d4r3G
 xw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FbKkt2GMChw/gdDM2BH8Sw69CAIU+pcQBfXhPGI96HA=;
 b=gCnANduCzyuyra7lkhG7/qqlKYjK4tKR5UwAfVOzNkQLuxL8ZyW/bzYX2Zw9ayPRul
 XgSlsM3MEZAgfZTBDtFft9qJEfI3b48L+RyIU6QxyjLVMQyHD+UmwzpycR5Kq1G/z3Ie
 SLwb9AMBgInWwqTzAFixAEhp4WSOd20JUqvdpGY14mJOHqez6SyhqpwL3BUFWTeYsaIF
 c1Y3p1TpdVEg7a6/ocOYFzXjmjcPJyudcsSqiP8Xl+4fCr5Pm6orctbZtk9ktgYzJynP
 O/EhRBDTdTcHVrrYorzENTT+0FJKfnDKaWF5sLDHpQWC8l42hKXOZoD2qs1i+bV7zZxb
 QSRg==
X-Gm-Message-State: AOAM533vaqLDbhtbWE1zRZq/qGjiuCnFILS5mXBdTtso4GZaQaCZN01w
 xAnFTE4XZhZKC3HFLjRwQFqZGw==
X-Google-Smtp-Source: ABdhPJxsB1+TCfTIOnoZkv5XG7p3dIKzBykRnSyOMGChJ7qa82IYzjESBmMRv5l3wJt7d9rz7epW+Q==
X-Received: by 2002:a63:e303:0:b0:380:83f6:55a2 with SMTP id
 f3-20020a63e303000000b0038083f655a2mr5268218pgh.519.1646759569188; 
 Tue, 08 Mar 2022 09:12:49 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056a000a8200b004e1414f0bb1sm21337815pfl.135.2022.03.08.09.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:12:48 -0800 (PST)
Message-ID: <a6489f6f-24da-aa1b-3845-a4b441bf80a2@linaro.org>
Date: Tue, 8 Mar 2022 07:12:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] target/arm: Fix sve2 ldnt1 and stnt1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220308031655.240710-1-richard.henderson@linaro.org>
 <CAFEAcA8fKkf4T0AhyhrFZS2=vGKBJ7ZtBBtZwEfpzWqztZ0xeA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8fKkf4T0AhyhrFZS2=vGKBJ7ZtBBtZwEfpzWqztZ0xeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/22 01:56, Peter Maydell wrote:
>> -# SVE2 64-bit gather non-temporal load
>> -#   (scalar plus unpacked 32-bit unscaled offsets)
>> +# SVE2 64-bit gather non-temporal load (scalar plus 64-bit unscaled offsets)
>>   LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
>> -                &rprr_gather_load xs=0 esz=3 scale=0 ff=0
>> +                &rprr_gather_load xs=2 esz=3 scale=0 ff=0
> 
> We correct the xs= value here...
...
>> +    switch (a->esz) {
>> +    case MO_32:
>> +        fn = gather_load_fn32[mte][be][0][0][a->u][a->msz];
>> +        break;
>> +    case MO_64:
>> +        fn = gather_load_fn64[mte][be][0][2][a->u][a->msz];
>> +        break;
>> +    }
> 
> ...but then instead of using it we hard code use of 0 or 2 here,
> which makes the change above a bit moot.

Yeah, sorry for that.  I was in the middle of reducing the argument set collected by those 
decode patterns, then decided there was little advantage, and left something in the middle.



r~

