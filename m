Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486184E422D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 15:44:35 +0100 (CET)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWfkP-0006e2-Qy
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 10:44:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWfiX-0004mV-MJ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:42:37 -0400
Received: from [2607:f8b0:4864:20::52e] (port=39817
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWfiW-0000Zo-AS
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 10:42:37 -0400
Received: by mail-pg1-x52e.google.com with SMTP id q19so12774479pgm.6
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rMQOYcqsgWUKfYPcIXWtcDwwnKFdM0p0dyqgJEXkhf4=;
 b=W9geh47YY0VIqA77s+PlbU9TanTFvPUYRCz1Tab1JC46ShaNB5N6Ez+TeY9bRsldoE
 lGov48zeeNsNOkl1btjc17u/qih2rP0zCQiHpfNDa/q9kfUwU0Zwz20dv5589F5LH1vb
 SuHQbCIx2FELmVYzrLqkklZ1jUN97BmB6oMFUUmB8i2zB5Vtl9yH2jF/K24IpTIT0ovl
 n6IzrsU58jUTEDtT50MiaRupnTwP6U3SI7Zf7wWKo2Mmw8Eh2puQv20Ska8hll/f+nFT
 5AVcyFEZ/J5k4UEb2jYevkyGn9/JqYoMLDInIzLI9a34Wdg8rjyRvC47QaQbL2J3gqi9
 azdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rMQOYcqsgWUKfYPcIXWtcDwwnKFdM0p0dyqgJEXkhf4=;
 b=30sQjGS+jQPNuqkxaZC9A+Xbq41qnUvQIqE5WDE3/mLXa3sfRLc+xpVr1/u1y1DfyK
 ZXFD5XVoqWZXLs/KsvYxQw+eyfPbJbsNJAZn2ygAklZgMRvd2F1s4yfCHYncJso/H+9C
 sZq2itbxzWHdfLhwDfTCeh1/q1EgxFNo7my8L7WS5YnHIy81qhx6FufgnaDeh49Skvh2
 xxv8+wPXVcrxNwevq1r8WxHYEDT3+yN2Td4veXkzaG9S8osu3iuZIJY7m7afV4JO7qVg
 XCnYw76KMzF/x9TMuB+jmgXvt3sx7t5zikrwS3Majspk6hAy1GMb4sJ+47oJsgVU6IG1
 TYxQ==
X-Gm-Message-State: AOAM531QfGP/bekiew5RDKca++VlNRR8Cu7yfPdjc91aU2wlU2hLh93B
 ziBflv+adDWVRtJUXOOnxEsscw==
X-Google-Smtp-Source: ABdhPJxKWWqNyovkPZz3PsLGaYIHJeSa/hE2iylEwY5PcW1ZK5X2ybjyZY3hiUzvnZEtOmnc+3uzsg==
X-Received: by 2002:a63:5c53:0:b0:381:309e:e72c with SMTP id
 n19-20020a635c53000000b00381309ee72cmr22753523pgm.40.1647960154763; 
 Tue, 22 Mar 2022 07:42:34 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00170d00b004f757a795fesm23419936pfc.219.2022.03.22.07.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 07:42:34 -0700 (PDT)
Message-ID: <69878475-d983-3729-255d-09c6de0a2816@linaro.org>
Date: Tue, 22 Mar 2022 07:42:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 03/11] target/s390x: vxeh2: vector string search
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-4-richard.henderson@linaro.org>
 <86ecb12d-2777-e83a-f375-368a3baebe86@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <86ecb12d-2777-e83a-f375-368a3baebe86@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/21/22 03:31, David Hildenbrand wrote:
>> +        for (i = 0; i < nelem; i++) {
>> +            if (s390_vec_read_element(v3, i, es) == 0) {
>> +                break;
>> +            }
>> +        }
>> +        if (i < substr_elen) {
>> +            substr_elen = i;
>> +        }
> 
> Maybe combine both, I guess there is no need to search beyond substr_elen.
> 
> substr_elen = MIN(substr_elen, nelem);
> for (i = 0; i < substr_elen; i++) {
>      if (s390_vec_read_element(v3, i, es) == 0) {
>          substr_elen = i;
>          break;
>      }
> }

Yep.

> We should do the MIN(substr_elen, nelem) maybe right when reading it
> from v4.

No, v4 does not get bounded until zs is set.

>> +    /* If ZS, look for eos in the searched string. */
>> +    if (zs) {
>> +        for (k = 0; k < nelem; k++) {
>> +            if (s390_vec_read_element(v2, k, es) == 0) {
>> +                eos = true;
>> +                break;
>> +            }
>> +        }
> 
> I guess we could move that into the main search loop and avoid parsing
> the string twice. Not sure what's better.

I'd leave it here, so that we only do the strlen once.  There's no obvious place within 
the the search loop that wouldn't wind up doing the strlen more than once.


r~

