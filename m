Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0D0588B98
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 13:57:47 +0200 (CEST)
Received: from localhost ([::1]:56064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJD0T-0003Cr-VO
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 07:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJCyH-0000Zb-Jj
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 07:55:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oJCyE-0000Vx-Ak
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 07:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659527725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3b9h3MlF4bEtPT1bd3YOD9SEX8BrjiAxbSpvfEZa3hU=;
 b=h+VWgYYPcfn5MXsruWHeT0UiEKanEwzuHFNGD7qo6A75I/ysVAJwDEf55nCP0oZWrLzFvT
 QtgLV+zRauB1Q0+XiTKpBSZr33zplLCSXB035Nctcl8YV6ORMZarhpMh9YVBmRYWb27tMb
 xcMsvjW7tqlXi+P6cKVLkeUFZl0QwQw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-J8rX6bKiPNWzDxb4TJ1SHg-1; Wed, 03 Aug 2022 07:55:24 -0400
X-MC-Unique: J8rX6bKiPNWzDxb4TJ1SHg-1
Received: by mail-wr1-f72.google.com with SMTP id
 t12-20020adfba4c000000b0021e7440666bso4215569wrg.22
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 04:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=3b9h3MlF4bEtPT1bd3YOD9SEX8BrjiAxbSpvfEZa3hU=;
 b=MRH+nY6UGjO3ZclZyI0601FLh2NaYkuhEsCvCqykuUWpJQNPNb6KqFdcW/DDaMbdQH
 rdj5xXdSKKQObOVEtI5W0BR8DIayAJy3QwtlkbZZKJEU+tInRn0r1gYaExRBNnj0R5e7
 bFsmmL0Tl7fKuTaKJlrRkDwFXenToHzR7BnLl4MJiGW6ZWnP9bkqnGD12eTpyvrAWBZp
 4P8bTwM2TBI+ZjPhoB1l4BHOPxj31n5vbdCu0zPoea2aDza2BU4YJpbgIg4lfoLGGKl6
 BerCsbKDeLL6KfHAw8iacW5lOmsTVK38xY2SkZbdDtH6BzG/rjvNWjrV2l9oiDslvL93
 6sHw==
X-Gm-Message-State: ACgBeo0NBqjsmGT+OalBEgMdPYv8rT14grThVr4yowIC0APmFgiDa9MV
 zGObeok5+tpt3EA5KDAnbxAMuYpm7Xj1bWPKmy/+rzFiiL8jtxUaFlPv4+IitBl/6aMrlDTCE19
 FnhhXQoYE/gOhn+w=
X-Received: by 2002:a5d:60cf:0:b0:220:5f08:90d9 with SMTP id
 x15-20020a5d60cf000000b002205f0890d9mr9940543wrt.180.1659527722830; 
 Wed, 03 Aug 2022 04:55:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4q0HNQD1X3HR7msEJpklN7r4Z5euy1gmK9vBuzTlCEmt3jk1b8k4RUag0RjNWwu+8ZSqkyyA==
X-Received: by 2002:a5d:60cf:0:b0:220:5f08:90d9 with SMTP id
 x15-20020a5d60cf000000b002205f0890d9mr9940513wrt.180.1659527722448; 
 Wed, 03 Aug 2022 04:55:22 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:9a00:1f5d:aaab:2398:9728?
 (p200300cbc7059a001f5daaab23989728.dip0.t-ipconnect.de.
 [2003:cb:c705:9a00:1f5d:aaab:2398:9728])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a1c2b06000000b003a35516ccc3sm2251794wmr.26.2022.08.03.04.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Aug 2022 04:55:22 -0700 (PDT)
Message-ID: <5758f0a3-ee4e-97d4-3e32-469b56029208@redhat.com>
Date: Wed, 3 Aug 2022 13:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Yul0G2YCKLXiypvv@zx2c4.com>
 <20220802190011.458871-1-Jason@zx2c4.com>
 <20220802190011.458871-3-Jason@zx2c4.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 2/2] target/s390x: support SHA-512 extensions
In-Reply-To: <20220802190011.458871-3-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02.08.22 21:00, Jason A. Donenfeld wrote:
> In order to fully support MSA_EXT_5, we have to also support the SHA-512
> special instructions. So implement those.
> 
> The implementation began as something TweetNacl-like, and then was
> adjusted to be useful here. It's not very beautiful, but it is quite
> short and compact, which is what we're going for.
> 

Do we have to worry about copyright/authorship of the original code or
did you write that from scratch?

[...]

I cannot really comment on the actual math, so I'll point out some code
style thingies.

> +static void kimd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
> +                        uint64_t *message_reg, uint64_t *len_reg, uint8_t *stack_buffer)
> +{
> +    uint64_t z[8], b[8], a[8], w[16], t;
> +    int i, j;
> +
> +    for (i = 0; i < 8; ++i)
> +        z[i] = a[i] = cpu_ldq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), ra);

Please always use curly brackets in QEMU for code blocks, they are
mandatory.

> +
> +    while (*len_reg >= 128) {
> +        for (i = 0; i < 16; ++i) {

i++, also for all cases below.

> +            if (message_reg)
> +                w[i] = cpu_ldq_be_data_ra(env, wrap_address(env, *message_reg + 8 * i), ra);
> +            else
> +                w[i] = be64_to_cpu(((uint64_t *)stack_buffer)[i]);
> +        }
> +
> +        for (i = 0; i < 80; ++i) {
> +            for (j = 0; j < 8; ++j)
> +                b[j] = a[j];
> +            t = a[7] + Sigma1(a[4]) + Ch(a[4], a[5], a[6]) + K[i] + w[i % 16];
> +            b[7] = t + Sigma0(a[0]) + Maj(a[0], a[1], a[2]);
> +            b[3] += t;
> +            for (j = 0; j < 8; ++j)
> +                a[(j + 1) % 8] = b[j];
> +            if (i % 16 == 15) {
> +                for (j = 0; j < 16; ++j)
> +                    w[j] += w[(j + 9) % 16] + sigma0(w[(j + 1) % 16]) +
> +                            sigma1(w[(j + 14) % 16]);
> +            }
> +        }
> +
> +        for (i = 0; i < 8; ++i) {
> +            a[i] += z[i];
> +            z[i] = a[i];
> +        }
> +
> +        if (message_reg)
> +            *message_reg += 128;
> +        else
> +            stack_buffer += 128;
> +        *len_reg -= 128;
> +    }
> +
> +    for (i = 0; i < 8; ++i)
> +        cpu_stq_be_data_ra(env, wrap_address(env, parameter_block + 8 * i), z[i], ra);
> +}
> +
> +static void klmd_sha512(CPUS390XState *env, uintptr_t ra, uint64_t parameter_block,
> +                        uint64_t *message_reg, uint64_t *len_reg)
> +{
> +    uint8_t x[256];
> +    uint64_t i;
> +    int j;
> +
> +    kimd_sha512(env, ra, parameter_block, message_reg, len_reg, NULL);
> +    for (i = 0; i < *len_reg; ++i)
> +        x[i] = cpu_ldub_data_ra(env, wrap_address(env, *message_reg + i), ra);
> +    *message_reg += *len_reg;
> +    *len_reg = 0;
> +    memset(x + i, 0, sizeof(x) - i);
> +    x[i] = 128;
> +    i = i < 112 ? 128 : 256;
> +    for (j = 0; j < 16; ++j)
> +        x[i - 16 + j] = cpu_ldub_data_ra(env, wrap_address(env, parameter_block + 64 + j), ra);
> +    kimd_sha512(env, ra, parameter_block, NULL, &i, x);
> +}

Are we properly handling the length register (r2 + 1) in the
24-bit/31-bit addressing mode?

Similarly, are we properly handling updates to the message register (r2)
depending on the addressing mode?


It's worth noting that we might want to implement (also for PRNO-TRNG):

"The operation is ended when all
source bytes in the second operand have been pro-
cessed (called normal completion), or when a CPU-
determined number of blocks that is less than the
length of the second operand have been processed
(called partial completion). The CPU-determined
number of blocks depends on the model, and may be
a different number each time the instruction is exe-
cuted. The CPU-determined number of blocks is usu-
ally nonzero. In certain unusual situations, this
number may be zero, and condition code 3 may be
set with no progress."

Otherwise, a large length can make us loop quite a while in QEMU,
without the chance to deliver any other interrupts.

-- 
Thanks,

David / dhildenb


