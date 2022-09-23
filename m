Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4A75E7454
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 08:46:24 +0200 (CEST)
Received: from localhost ([::1]:35368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obcS7-0006zy-TN
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 02:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obc7p-00031j-NH
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:25:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obc7n-0000Ik-Eo
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 02:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663914321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/n4tA9XOXcYu0IlRYb3Rdzjr42YERRodUravZx6X5U0=;
 b=AFNxsU6sTjrHqlLTqTVsv8loTqEYsVWB+eYrHlsFdrxXx4HsEaeKU0KMGx/HDoIgsoc2xx
 JdRK2r6u+6yRjviNHDBkFnAaXj4Ol4nzv/GFLUdDXFvJ9Ij4xpOLRT9x2fiEIqW8OVeApz
 TaTH7iSFpjf9uRus5KEgJVDkqP8SrgE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-163-XwL3-BKmOkyRp6PUrahC7A-1; Fri, 23 Sep 2022 02:25:20 -0400
X-MC-Unique: XwL3-BKmOkyRp6PUrahC7A-1
Received: by mail-wm1-f71.google.com with SMTP id
 h133-20020a1c218b000000b003b3263d477eso5103173wmh.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 23:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/n4tA9XOXcYu0IlRYb3Rdzjr42YERRodUravZx6X5U0=;
 b=fRj2Dj2cUQVf+3H9Jdd5cTsMWGSe2fbdvh+UfyhpupsjfM4TYEZdI8FdPzoexA7rSC
 +Em/zRdmXOeeZctGskK6Vg0jP7pi1AZCig3iFxDfNou/naUsQncmLc2KLZuuFiUCZq/E
 JrF0VSA4wN/c1rvpmk53e2Pae7E38mEaq5i3p0nNPX2MEfOmSKF6x/NxCzpu3S8uwIuL
 q4DLZPSYYG2oPXS4n2Pekt6Bh90/+C0mA4ZJJq+dkreZhsermNif2Z4z2tvlzWxnvaiG
 0yLD01kQffZjRvvUsFrxzieBOy2snuc6ZKHMkNL2Fh8jRYaG5zI6b1Dy+cHQWxgeSEiy
 DDyA==
X-Gm-Message-State: ACrzQf3zvrx/vwCqiKlECYKFceevVDsceeTZr6uvcvlR8Q57EJ0bWlcI
 vjBrmo9sdpGg2+2aaza3NmvpBDBbtAuQSUYVhy4tTsrotuLfasqMac+oEtX90euTXBfr9c9Q773
 YJA1PUiJuQ+cJKoE=
X-Received: by 2002:a05:6000:1048:b0:228:6898:aa50 with SMTP id
 c8-20020a056000104800b002286898aa50mr4027089wrx.233.1663914319800; 
 Thu, 22 Sep 2022 23:25:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM63jwQqJg/NMpxH+tq1FcLt8GvjVZoousOhY34nzY7oTGRCHClDAvaL+Achy4xRQQtDyKlMYQ==
X-Received: by 2002:a05:6000:1048:b0:228:6898:aa50 with SMTP id
 c8-20020a056000104800b002286898aa50mr4027077wrx.233.1663914319625; 
 Thu, 22 Sep 2022 23:25:19 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-37.web.vodafone.de.
 [109.43.179.37]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b003b492338f45sm1627903wmq.39.2022.09.22.23.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 23:25:19 -0700 (PDT)
Message-ID: <fd5e8081-5144-2b7e-de0e-1ce0f6cb11a3@redhat.com>
Date: Fri, 23 Sep 2022 08:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8.1 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <20220922153820.221811-1-david@redhat.com>
 <abf6fbb6-14f4-8c65-f5ac-a75b9c8931dd@redhat.com>
 <CAHmME9pqFvYfat1yki86_x1k0A7x4eA0f9q=UeLaf+AOGV=Taw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAHmME9pqFvYfat1yki86_x1k0A7x4eA0f9q=UeLaf+AOGV=Taw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 22/09/2022 18.35, Jason A. Donenfeld wrote:
> On Thu, Sep 22, 2022 at 5:55 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 22/09/2022 17.38, David Hildenbrand wrote:
>>> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>>>
>>> In order to fully support MSA_EXT_5, we have to support the SHA-512
>>> special instructions. So implement those.
>>>
>>> The implementation began as something TweetNacl-like, and then was
>>> adjusted to be useful here. It's not very beautiful, but it is quite
>>> short and compact, which is what we're going for.
>> ...
>>> @@ -52,6 +278,9 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, uint32_t r3,
>>>                cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
>>>            }
>>>            break;
>>> +    case 3: /* CPACF_*_SHA_512 */
>>> +        return cpacf_sha512(env, ra, env->regs[1], &env->regs[r2],
>>> +                            &env->regs[r2 + 1], type);
>>
>> I have to say that I liked Jason's v8 better here. Code 3 is also used for
>> other instructions with completely different meaning, e.g. PCKMO uses 3 for
>> TDEA-192 ... so having the "type" check here made more sense.
>> (meta comment: maybe we should split up the msa function and stop using just
>> one function for all crypto/rng related instructions? ... but that's of
>> course something for a different patch series)
> 
> Maybe just commit my v8, and then David's changes can layer on top as
> follow ups? Checking len alignment, for example, is a separate patch
> from the rest.

Yes, let's do that now - that will also later help to distinguish who did 
what part of the code.

  Thomas


