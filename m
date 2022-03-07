Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97C4D05B4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:51:49 +0100 (CET)
Received: from localhost ([::1]:50588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRHWO-0004gW-43
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRHUy-0003wE-WF
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:50:21 -0500
Received: from [2607:f8b0:4864:20::530] (port=43820
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRHUx-00011K-JV
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:50:20 -0500
Received: by mail-pg1-x530.google.com with SMTP id 27so14217845pgk.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MOTfyWeMbrMB4KtwsVsk/zbUoScw+bU4ZVswEDOxNfI=;
 b=srTQREdAcmULbZH4RfgY373xjVnSP2JnuGpL87VdvT4HxnUdYmSX2+M8fFTZ959cV8
 C5SiYiXxvsYAVwUGCjO5FiaEjDxkCaS53btFKWQGST5qIpl1c3LoY4+4sYpMaum6l8S4
 YyGelJHWGYu9kLwF+MYgbO8PhEdDxOae/nfAK3MHEfc6wB7ImKeI6E7laKxSRAcPtKVh
 csKnJMJ36OBkmpEaLwJs5D380f4/V3gWGi/Yam+gac1wT9bWk3KF/JJYv8YCflLL9M60
 nhpc/kDgzBNQ41YDzka5QgZ4LyqUo6K/L/AJ9hxb5ZV8UFrVNvJtWNULbqQ7+NxCWK80
 NHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MOTfyWeMbrMB4KtwsVsk/zbUoScw+bU4ZVswEDOxNfI=;
 b=FJo4hi8R9Q0cEyU/Cklh0LxWCZ7N6Lbio5zaIFO6r4UgVmRNzFwUG1zJpKoEgiB8a5
 CtvD/6pn9ODiceyNajM2IXm913/FDw/0hKD6s3Ey4H7fEkMMf9QPc/rHboS3umdhfzRz
 94G6bz1iyVLO3GMxBOTxXwbKyJgS2XwGNHjxZng/8Xf6U7W1ewdfWl6dTnGpvK0WsM8O
 GO8E5nbYQm3N6iU5j9zTQgmWStMjj6YIJeHceLxLTnT837QUKkwrKH/r2q/tzwgd380O
 WDj/wtUfWXgYMU4YryLC0LrHsFVXyNn2JzrBa01Ufj/xRRS2+Am9e1pzabVMP6KlCf/g
 78bA==
X-Gm-Message-State: AOAM531SQ4fHBWhVIukhrWB+RXGR/ccuDlfFZarXlUaT3n/g+23lDNbr
 hEfSDcUJ/ouTarWwNusxqQvqUg==
X-Google-Smtp-Source: ABdhPJxzPczSutjFcl5xYefQ5jUbQI5iwwto9PV3pN6bXMqhxhLwm5nI3qvUXYkrZbN1HRo2NC4Y2w==
X-Received: by 2002:aa7:8585:0:b0:4f6:f528:2e02 with SMTP id
 w5-20020aa78585000000b004f6f5282e02mr7154634pfn.76.1646675418210; 
 Mon, 07 Mar 2022 09:50:18 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 o7-20020a056a00214700b004c169d45699sm16438840pfk.184.2022.03.07.09.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 09:50:17 -0800 (PST)
Message-ID: <6bbb469f-3043-6a7c-bfbe-c2bd5d138907@linaro.org>
Date: Mon, 7 Mar 2022 07:50:14 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] tests/tcg/s390x: Cleanup of mie3 tests.
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, David Miller <dmiller423@gmail.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220301214305.2778-1-dmiller423@gmail.com>
 <23a9e21b-5f2b-1945-1b04-8bf71a9c637b@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <23a9e21b-5f2b-1945-1b04-8bf71a9c637b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/6/22 22:42, Thomas Huth wrote:
>> +asm volatile (          \
>> +    "llihf %[res],801\n"\
>> +    ASM                 \
>> +    : [res] "=&r" (res)  \
>> +    : [a] "r" (a)       \
>> +    , [b] "r" (b)       \
>> +);                      \
> 
> Hmm, don't we still need "cc" in the clobber list? AFAICS some of these instructions still 
> alter the CC register... so I'd suggest to rather drop the changes to this file?

Yep, my bad.  I wrongly assumed cc would be auto-clobbered, like i386.


r~

