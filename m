Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E116568A033
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:25:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNznl-0002YZ-6e; Fri, 03 Feb 2023 12:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNzng-0002VY-CJ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pNzne-0005ia-9M
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675445072;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nyCfty4oBr4gmBkHliq+xfLFZyHX/y/fvClAKTYLccg=;
 b=b5DkDPHjKNyzYNTd1j3PrWIUdH3V44v5Y5OTip05OmBlSDqUcDKB++sNfg0gtmDUxU+gd6
 iermlOwj6tVBbONFSy2pVFhO/Sc5dahDpjM2MPRUb4Xlmd12B439VokXGJAreq1Uhqf/d8
 tKgSc4R1Y3exfTcZWHuA9hvhEcRcGMk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-UHV-9SoVNsCeuKLm-3qXMQ-1; Fri, 03 Feb 2023 12:24:31 -0500
X-MC-Unique: UHV-9SoVNsCeuKLm-3qXMQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 c18-20020ac84e12000000b003b5d38f1d29so2970587qtw.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 09:24:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nyCfty4oBr4gmBkHliq+xfLFZyHX/y/fvClAKTYLccg=;
 b=HOLhKEaN5+xkTlwcGN9eht2+Z1QYQxsY6j2/71/52yvecgwyIAacbVlfVR0b+8/ni/
 cMja448MrYOId7dePVBFscvI46+2dzddLiRu9SaDE5QVj5Vx9NUZ6+XN5eQnPK7FTCbK
 YYf46nxTxs0Cf2zJU5KgZgPjoifIhTYgssmL//2WquBz8NDOOolOB9ebkgg0lJOpJk2I
 t0ZgPI5YXo5hZiKaL8sJOrHjF5CmRWbC1takrwQEoOGo+K2pHKymjUJTB+DFiTUtPMWt
 4fuEyqPGjmh72xqpyxLYC+ThJtLskIpwcZ/HJdbE30ZEFFcmJiMpo3swPooeZBQnvsTo
 ebDQ==
X-Gm-Message-State: AO0yUKXO58WxUsOJnKvGKDkjetHaCFJEm4zQNHwfvG3vs4Rl7nD1owbG
 CRv/QkR2Rz2BHVsyR4BSTKyPZf8mzU9ZXS6eyw0y9X7z3wMlEZTLHDXh+KPS8NImENDsu0l3+zw
 kPlOA8KOV1AOoAK4=
X-Received: by 2002:a05:622a:54c:b0:3b5:5234:e895 with SMTP id
 m12-20020a05622a054c00b003b55234e895mr20538260qtx.15.1675445070862; 
 Fri, 03 Feb 2023 09:24:30 -0800 (PST)
X-Google-Smtp-Source: AK7set9+vpgo19iYZ0VaxzfYMxhCzG5HmAeUkAqH2hD46h+DtHVXNevctA80r2SYgaACxjb+75zq3Q==
X-Received: by 2002:a05:622a:54c:b0:3b5:5234:e895 with SMTP id
 m12-20020a05622a054c00b003b55234e895mr20538215qtx.15.1675445070591; 
 Fri, 03 Feb 2023 09:24:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 r19-20020ac87953000000b003b6953fbb8fsm1935921qtt.32.2023.02.03.09.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:24:29 -0800 (PST)
Message-ID: <08e2da2e-4e52-219c-ddad-a35cf4d1b08c@redhat.com>
Date: Fri, 3 Feb 2023 18:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] accel/tcg: test CPUJumpCache in tb_jmp_cache_clear_page()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20230203171510.2867451-1-eric.auger@redhat.com>
 <c7f8a9b3-fa05-10e7-bc1f-ad7cbefdc431@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <c7f8a9b3-fa05-10e7-bc1f-ad7cbefdc431@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Philippe,
On 2/3/23 18:21, Philippe Mathieu-Daudé wrote:
> On 3/2/23 18:15, Eric Auger wrote:
>> After commit 4e4fa6c12d ("accel/tcg: Complete cpu initialization
>> before registration"), it looks the CPUJumpCache handle can be NULL.
>> This causes a SIGSEV when running debug-wp-migration kvm unit test.
>
> Do you mean commit a976a99a29 ("include/hw/core: Create struct
> CPUJumpCache") instead?
No as reported in
https://lore.kernel.org/all/d91ccc02-a963-946d-169a-fd4da2610861@redhat.com/
my bisection pointed to 4e4fa6c12d ("accel/tcg: Complete cpu initialization
before registration")
>
>> At the first place it should be clarified why this TCG code is called
>> with KVM acceleration. This may hide another bug.
>>
>> Fixes: 4e4fa6c12d ("accel/tcg: Complete cpu initialization before
>> registration")
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   accel/tcg/cputlb.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index 4e040a1cb9..ac0245ee6c 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -103,6 +103,10 @@ static void tb_jmp_cache_clear_page(CPUState
>> *cpu, target_ulong page_addr)
>>       int i, i0 = tb_jmp_cache_hash_page(page_addr);
>>       CPUJumpCache *jc = cpu->tb_jmp_cache;
>>   +    if (!jc) {
>
> unlikely()?
yes maybe

Thanks

Eric
>
>> +        return;
>> +    }
>> +
>>       for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
>>           qatomic_set(&jc->array[i0 + i].tb, NULL);
>>       }
>


