Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9437E54A9D8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 08:55:55 +0200 (CEST)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o10Sw-0003yB-Ml
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 02:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o10M3-0000QJ-SO
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:48:47 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:44732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o10Lx-0005U5-8e
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:48:47 -0400
Received: by mail-pf1-x42a.google.com with SMTP id s37so5092016pfg.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 23:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dCpj0mmg9nB8LLmv6XIVDvs36DM5FLyeTvTA4ViQ7Is=;
 b=Ui5pc+gLLck1Xof2I76MvywftpqVNBK0hwbBNv3pY71gj2D0Mf+n0n7g45Q1NMNgny
 zGK9pwtwRUT+c5Zoaa+rMUJNVo1SZqj3PgTOuccuWsZwHOHc96q5rPUqkxhlOxyazFEe
 j3F0I416HTn88Nx5eSQ47tB0kgI/9cWIEOJpzYDuKK1geagrgrHPbMpLiE1Xr+gHjrn0
 aRl2qWDmb8kE4Nwhp7Lma98VirXnUHxxMXDov1AcxNNcWP1cq9/akuK9Ld5s9S9RZsHn
 4Kxf2jYLxTlTZ5CDNQGnFZr2zHdY3wn+oZLKPU/QSwNM4iZfLoyAv5SxmCeL9jGRLkHI
 GYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dCpj0mmg9nB8LLmv6XIVDvs36DM5FLyeTvTA4ViQ7Is=;
 b=kkPwYCYH6CYunN3Q7wZREOt7qAXC1g2iSOkK+CePvoZOecpqApa4YlnfhzJhrUDd2e
 ax3R/oucTDp0tAjAB3ESPAs0gM/mv+l7cv1DaBzvlw1ooA57iFRv4O8WTl/WVEXn3JJa
 p8mPzwJ1Dor61Tiv8UqV/j/QZadamaF/pbZbDN2NHLwY3EIFeXNS8JSe8B00B01gWKIn
 PgyH8OE6rxpl0Tt4J/1MIl8URRP02KRG6aYptQCcfGtXXlMS28ehsaB6MICb6H6LB3E0
 mWtDPRm6L0ra19U7O1ibv+C5W+WCMccwY5Rq35+6Ef9VIqIZhr6zKt6jvGmyMpphIsNL
 WZew==
X-Gm-Message-State: AJIora+fnBZk5qDQ2uVMUL5+Q3osnB6qNiayO4naFan81BneK6x8gKKG
 HDLbbcX/4dAIxoP1zsWT+1A=
X-Google-Smtp-Source: ABdhPJzbiyG2RBLtXdGF6nCcpGBg4Ld8FnjpnLjiKEAW9WIV1s0D7/wnTS6SiqhDAauJH2kteHj6Pw==
X-Received: by 2002:a05:6a00:8cf:b0:522:93a6:46e9 with SMTP id
 s15-20020a056a0008cf00b0052293a646e9mr3242029pfu.62.1655189318301; 
 Mon, 13 Jun 2022 23:48:38 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a63950a000000b003fbfe88be17sm6907392pgd.24.2022.06.13.23.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 23:48:37 -0700 (PDT)
Message-ID: <94fe1761-4b22-3d95-05a6-601410833452@amsat.org>
Date: Tue, 14 Jun 2022 08:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [Phishing Risk] [External] Re: [PATCH 4/7] crypto: Add ECDSA key
 parser
Content-Language: en-US
To: =?UTF-8?B?5L2V56OK?= <helei.sig11@bytedance.com>
Cc: "S. Tsirkin, Michael" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, pizhenwei@bytedance.com, jasowang@redhat.com
References: <20220613084531.8086-1-helei.sig11@bytedance.com>
 <20220613084531.8086-5-helei.sig11@bytedance.com>
 <50d14368-8dca-0b11-d4d5-f3cd8814fe82@amsat.org>
 <F4394DBC-4594-4A45-8B11-048088A2D6D7@bytedance.com>
In-Reply-To: <F4394DBC-4594-4A45-8B11-048088A2D6D7@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/6/22 03:43, 何磊 wrote:
> Hi Philippe, lots of thanks for your review!
> 
>> On Jun 13, 2022, at 10:19 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 13/6/22 10:45, Lei He wrote:
>>> Add ECDSA key parser and ECDSA signautre parser.
>>> Signed-off-by: lei he <helei.sig11@bytedance.com>
>>> ---
>>>   crypto/ecdsakey-builtin.c.inc | 248 ++++++++++++++++++++++++++++++++++++++++++
>>>   crypto/ecdsakey.c             | 118 ++++++++++++++++++++
>>>   crypto/ecdsakey.h             |  66 +++++++++++
>>>   crypto/meson.build            |   1 +
>>>   4 files changed, 433 insertions(+)
>>>   create mode 100644 crypto/ecdsakey-builtin.c.inc
>>>   create mode 100644 crypto/ecdsakey.c
>>>   create mode 100644 crypto/ecdsakey.h
>>> diff --git a/crypto/ecdsakey-builtin.c.inc b/crypto/ecdsakey-builtin.c.inc
>>> new file mode 100644
>>> index 0000000000..5da317ec44
>>> --- /dev/null
>>> +++ b/crypto/ecdsakey-builtin.c.inc
>>> @@ -0,0 +1,248 @@
>>> +/*
>>> + * QEMU Crypto akcipher algorithms
>>> + *
>>> + * Copyright (c) 2022 Bytedance
>>> + * Author: lei he <helei.sig11@bytedance.com>
>>> + *
>>> + * This library is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU Lesser General Public
>>> + * License as published by the Free Software Foundation; either
>>> + * version 2.1 of the License, or (at your option) any later version.
>>> + *
>>> + * This library is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>>> + * Lesser General Public License for more details.
>>> + *
>>> + * You should have received a copy of the GNU Lesser General Public
>>> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>>> + *
>>> + */
>>> +
>>> +#include "der.h"
>>> +#include "ecdsakey.h"
>>> +
>>> +#define QCRYPTO_ECDSA_PUBKEY_FMT_UNCOMPRESSED 0x04
>>> +
>>> +static int extract_mpi(void *ctx, const uint8_t *value,
>>> +                       size_t vlen, Error **errp)
>>> +{
>>> +    QCryptoAkCipherMPI *mpi = (QCryptoAkCipherMPI *)ctx;
>>> +    if (vlen == 0) {
>>> +        error_setg(errp, "Empty mpi field");
>>> +        return -1;
>>
>> Functions taking Error* param usually return a boolean.
> 
> It's a good idea to make such functions that only return 0 or -1 return bool directly, but this change
> will require modification of rsakey related code. If you strongly request it, I will modify it in another patch.

QCryptoDERDecodeCb seems to only return a boolean, so should follow the
style recommended in 
https://gitlab.com/qemu-project/qemu/-/commit/e3fe3988d7. Can be done 
later as a follow-up cleanup of course.

>>> +    }
>>> +    mpi->data = g_memdup2(value, vlen);
>>> +    mpi->len = vlen;
>>> +    return 0;
>>> +}
>>> +
>>> +static int extract_version(void *ctx, const uint8_t *value,
>>> +                           size_t vlen, Error **errp)
>>> +{
>>> +    uint8_t *version = (uint8_t *)ctx;
>>> +    if (vlen != 1 || *value > 1) {
>>> +        error_setg(errp, "Invalid rsakey version");
>>> +        return -1;
>>> +    }
>>> +    *version = *value;
>>> +    return 0;
>>> +}
>>> +
>>> +static int extract_cons_content(void *ctx, const uint8_t *value,
>>> +                                size_t vlen, Error **errp)
>>> +{
>>> +    const uint8_t **content = (const uint8_t **)ctx;
>>> +    if (vlen == 0) {
>>> +        error_setg(errp, "Empty sequence");
>>> +        return -1;
>>> +    }
>>> +    *content = value;
>>
>> You need to check (vlen >= sizeof(uint8_t *)) to avoid overrun.
> 
> The decoder will parse the meta data of ASN1 types and pass the real data part to the callback function.
> The above statement only saves the starting address of the ‘data part' and does not actually access the
> data, so there is no need to check the size of vlen.

Oops, indeed you are right :)

>>
>>> +    return 0;
>>> +}
>>> +
>>> +static int __qcrypto_akcipher_builtin_ecdsa_pubkey_parse(
>>> +    QCryptoAkCipherECDSAKey *ecdsa,
>>> +    const uint8_t *key, size_t keylen, Error **errp);
>>
>> Why use the reserved __prefix?
> 
> I will fix it later.
> 


