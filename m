Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82074EC622
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:06:06 +0200 (CEST)
Received: from localhost ([::1]:33398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZYxZ-0006ZR-G5
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:06:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYvC-0004Cz-Bn
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:03:42 -0400
Received: from [2607:f8b0:4864:20::232] (port=37606
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZYvA-0001Q3-1y
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 10:03:37 -0400
Received: by mail-oi1-x232.google.com with SMTP id q129so22160711oif.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2ypWwyUw6bzuhI1anlFzdEwYgwLEnZp+hvFopIjbR/k=;
 b=UYbeiE4+brT38rRST42WzDPCGIrb8jPfItmRpAE6W6HwNbaUO48Omm4zUCBIDWSdqz
 CsK2XmY6lW8WuEOixK/2403M7wsWccANu128XVY/5xyGInb7X+VSV4MVNRdeckAhl2rO
 ewJ431EI2/wSrZRdXXrxJP1BM3eibRKHfvdTfqosxeC4JEjOyg77qV57z1POEjun/v2d
 JAdeijge/1lRUUS0cAsCprozUjd0z1YiqQmWV3UNg/C3yxgSlE5ztgr0kFXzHkdKCcsS
 jsOPJSiPsvlw8TSFksVmiFJRxn8WQIBfIv8RQ9R+dsYhbZNezdrqd5j1GAZlQ6gsC2Ob
 BpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2ypWwyUw6bzuhI1anlFzdEwYgwLEnZp+hvFopIjbR/k=;
 b=MHBTfl2fbbK/PBUWnh7kHNxjudXZGLMixUNuDV7VUuW8YDVJPtVlrx/blz9I/fZ9SA
 Yk0IujaOEPUm1cSBxuwFay9AxaZrAmsO/Ru4Ug+jQgT6J2gtuCui2MpA2S2sMGHdn6N5
 IJ1mkcAJGfqX9ojJqpyjZO+nagkLBq4KzkSLImar5XVwB9sAu19hrwZGWO9PKiD0YYq/
 fJ2Ab2Yh/MgAgEF2QhD45QDVxiDCs2ducvToDJl61u1dE2QD3rwga8Nckxe3zyNAXs+3
 59tb7tgqDXWZzoruc0l+5zWVk2cQjlRRrmfdU9GnH4C/ZFEEjYUVN+OJgP65F6yRO67U
 dfqQ==
X-Gm-Message-State: AOAM530HwhcUu+Gir3DCxjQ9UexjgPooogIDuYbNoITZJ4hO0JX7Lkcd
 6XMgHJw9za41GwdfZXdpVFF/nJE0gze5Qfny
X-Google-Smtp-Source: ABdhPJx+RDIMM2BJ0DDjiOgrvDMTXlpmc9MD9UFWEPxuRhMc2nJ4DltTE+OMud8iBUu9S3htU+HRAA==
X-Received: by 2002:a05:6808:178e:b0:2ef:9854:777d with SMTP id
 bg14-20020a056808178e00b002ef9854777dmr1821954oib.281.1648649014884; 
 Wed, 30 Mar 2022 07:03:34 -0700 (PDT)
Received: from [192.168.249.227] (172.189-204-159.bestelclientes.com.mx.
 [189.204.159.172]) by smtp.gmail.com with ESMTPSA id
 96-20020a9d0469000000b005c959dd643csm10115909otc.3.2022.03.30.07.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 07:03:34 -0700 (PDT)
Message-ID: <bfca5877-a673-f720-f58f-a65b8c956472@linaro.org>
Date: Wed, 30 Mar 2022 08:03:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] target/s390x: Fix determination of overflow condition
 code after addition
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20220323162621.139313-1-thuth@redhat.com>
 <20220323162621.139313-2-thuth@redhat.com>
 <2b82de5e-a259-576c-5ea5-eb5c10e6bbeb@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2b82de5e-a259-576c-5ea5-eb5c10e6bbeb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 02:52, David Hildenbrand wrote:
>>   static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
>>   {
>> -    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar > 0)) {
>> +    if ((a1 > 0 && a2 > 0 && ar < 0) || (a1 < 0 && a2 < 0 && ar >= 0)) {
> 
> 
> Intuitively, I'd have checked for any overflow/underflow by comparing
> with one of the input variables:
> 
> a) Both numbers are positive
> 
> Adding to positive numbers has to result in something that's bigger than
> the input parameters.
> 
> "a1 > 0 && a2 > 0 && ar < a1"
> 
> b) Both numbers are negative
> 
> Adding to negative numbers has to result in something that's smaller
> than the input parameters.
> 
> "a1 < 0 && a2 < 0 && ar > a1"

If we're not going to just fix the >= typo,
I'd suggest using the much more compact bitwise method:

     ((ar ^ a1) & ~(a1 ^ a2)) < 0

See sadd64_overflow in qemu/host-utils.h.


r~

