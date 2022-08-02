Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C612587E78
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:57:12 +0200 (CEST)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItKZ-0005ps-5I
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oItH4-0001yb-Ka
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oItH2-0003qA-Bx
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659452009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p1ZpnICV7qxekRvVvyUcIZgPIES9/Fa4ep2Nkr+UGCk=;
 b=Fpxp/bNj7LFQ/GR85JBM6mEoUj4Z9BidfG4YnLbvVzPM1gP57x1UY6ftK2t0o8yj4C9gv1
 hz61SySm0xt9PPnJxvxFqfOIzIbvEYfYD27GYuCkgFdImgE4QFx5mrxqVEVWg6GukPgbI/
 Ka/w5pN/b4vA4yVZBHcOFiBJ88EY+o8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-vDFZKDImPySvRulYYiVTIQ-1; Tue, 02 Aug 2022 10:53:25 -0400
X-MC-Unique: vDFZKDImPySvRulYYiVTIQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v24-20020a7bcb58000000b003a37681b861so2059003wmj.9
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 07:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p1ZpnICV7qxekRvVvyUcIZgPIES9/Fa4ep2Nkr+UGCk=;
 b=Y49/Ep0ynLtTfh4y29nyL+7J60aAh/3vd3t6oe3KklW3hBfMq2/iqk2MikfT2edkZs
 d8Ywm5fmY9U/fi5U4naOoQqE1OOZMHGLFA68fQj+aTx3/klrwGJ0M+PA5v34Esuafmv6
 XfzgmSAqDajlPk4KFxGrXXrmXlgjk2BHRwzRa+ZPWI2Pg94805XskY2F/D6f44rEUc44
 Thf0IHdAUKNggpgS9Vkhk+nJa0VRX91l3EFds/blQE4FnT2azB23alLRVseeu5HefcJS
 kS17b1PBPMIUkiQtt/OIOww4Ye0Qj1ey5eKOUrM5JbLFVL0pRn+6KisuLYdf7i5ozkBs
 azwg==
X-Gm-Message-State: AJIora/z/iFQKQPwyu9yl8XxSxVdMPh89U7Uk2T86IfG7V77Q5EO4MW5
 Q/hYbzAnuEIIaTS2qhRkB2y2yshs9T29JYF4XOIrS9D1dS4MZPh/fo4DamIriWsbkD9aNYtnOal
 B9xZw3jPKaXQy9F4=
X-Received: by 2002:a05:600c:22da:b0:3a3:3139:d8ff with SMTP id
 26-20020a05600c22da00b003a33139d8ffmr14601056wmg.178.1659452004066; 
 Tue, 02 Aug 2022 07:53:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vNrEhrr3NMo+Xsx/F8eIL2UU5a9mROT8zP3N0PefA+gi9e3pZYm92LE2UkKXqJ341eShYXtA==
X-Received: by 2002:a05:600c:22da:b0:3a3:3139:d8ff with SMTP id
 26-20020a05600c22da00b003a33139d8ffmr14601038wmg.178.1659452003747; 
 Tue, 02 Aug 2022 07:53:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3800:8435:659e:f80:9b3d?
 (p200300cbc70738008435659e0f809b3d.dip0.t-ipconnect.de.
 [2003:cb:c707:3800:8435:659e:f80:9b3d])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c029200b003a2fdde48d1sm18361672wmk.25.2022.08.02.07.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 07:53:23 -0700 (PDT)
Message-ID: <71b1b0f6-95b9-0249-e996-b8348470693f@redhat.com>
Date: Tue, 2 Aug 2022 16:53:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Content-Language: en-US
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
 <ef161533-0123-28f0-db1f-5257e82f6340@linux.ibm.com>
 <1afd34c3-0aa6-541c-07e9-b0eef7e0f0d7@redhat.com>
 <71d173c2-21eb-5966-8458-91de9bc48620@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <71d173c2-21eb-5966-8458-91de9bc48620@linux.ibm.com>
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 02.08.22 16:01, Christian Borntraeger wrote:
> 
> 
> Am 02.08.22 um 15:54 schrieb David Hildenbrand:
>> On 02.08.22 15:26, Christian Borntraeger wrote:
>>>
>>>
>>> Am 20.07.22 um 14:08 schrieb Jason A. Donenfeld:
>>>> In order for hosts running inside of TCG to initialize the kernel's
>>>> random number generator, we should support the PRNO_TRNG instruction,
>>>> backed in the usual way with the qemu_guest_getrandom helper. This is
>>>> confirmed working on Linux 5.19-rc6.
>>>>
>>>> Cc: Thomas Huth <thuth@redhat.com>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>>> Cc: Harald Freudenberger <freude@linux.ibm.com>
>>>> Cc: Holger Dengler <dengler@linux.ibm.com>
>>>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>>> [...]
>>>> +    case 114:
>>>> +        if (r1 & 1 || !r1 || r2 & 1 || !r2)
>>>> +                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>>>> +        fill_buf_random(env, ra, &env->regs[r1], &env->regs[r1 + 1]);
>>>> +        fill_buf_random(env, ra, &env->regs[r2], &env->regs[r2 + 1]);
>>>> +        break;
>>>
>>> I think I agree with Harald that some aspects are missing.
>>> Linux does not seem to check, but we should also modify the query function to
>>> indicate the availability of 114.
>>>
>>> As the msa helper deals with many instructions
>>> ...
>>> target/s390x/tcg/insn-data.def:    D(0xb91e, KMAC,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMAC)
>>> target/s390x/tcg/insn-data.def:    D(0xb928, PCKMO,   RRE,   MSA3, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PCKMO)
>>> target/s390x/tcg/insn-data.def:    D(0xb92a, KMF,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMF)
>>> target/s390x/tcg/insn-data.def:    D(0xb92b, KMO,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMO)
>>> target/s390x/tcg/insn-data.def:    D(0xb92c, PCC,     RRE,   MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PCC)
>>> target/s390x/tcg/insn-data.def:    D(0xb92d, KMCTR,   RRF_b, MSA4, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMCTR)
>>> target/s390x/tcg/insn-data.def:    D(0xb92e, KM,      RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KM)
>>> target/s390x/tcg/insn-data.def:    D(0xb92f, KMC,     RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMC)
>>> target/s390x/tcg/insn-data.def:    D(0xb929, KMA,     RRF_b, MSA8, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KMA)
>>> target/s390x/tcg/insn-data.def:    D(0xb93c, PPNO,    RRE,   MSA5, 0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_PPNO)
>>> target/s390x/tcg/insn-data.def:    D(0xb93e, KIMD,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KIMD)
>>> target/s390x/tcg/insn-data.def:    D(0xb93f, KLMD,    RRE,   MSA,  0, 0, 0, 0, msa, 0, S390_FEAT_TYPE_KLMD)
>>> ...
>>> and in theory other instructions might also have 114 we should at least check that this is ppno/prno.
>>> Or we split out a prno helper from the msa helper.
>>>
>>
>> Doesn't
>>
>> s390_get_feat_block(type, subfunc);
>> if (!test_be_bit(fc, subfunc)) {
>> 	tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
>> }
>>
>> check that? As long as we don't implement 114 for any other instruction.
>> that should properly fence off the other instructions.
> 
> Right that would help. We should still take care of the query function.
> 
s390_get_feat_block() should already take care of that as well, no?


-- 
Thanks,

David / dhildenb


