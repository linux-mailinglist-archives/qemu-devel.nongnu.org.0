Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB34D8B47
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 19:04:08 +0100 (CET)
Received: from localhost ([::1]:55312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTp39-0006rg-QI
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 14:04:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nToyM-0006an-25
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:59:10 -0400
Received: from [2607:f8b0:4864:20::634] (port=33712
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nToyK-0002t3-Gn
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:59:09 -0400
Received: by mail-pl1-x634.google.com with SMTP id t22so2978412plo.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SVvd7Y91DDXJ+74u7eN7bCl/n8yBZ3mQsnmYmJ0F8+U=;
 b=PmkWCbcJZYu5UriP+uLwKZiscY4TChiOsMNKaT1UVAxv/AVDnF5MXQLQOVslCRnXh/
 /4kQVoT+fXlP8Tprnl7VsN5aEGp+tw709kuqHtL7mrf/++ey1GYWfNfzqQ9m7uo1l1Yv
 hKeS1/siLU/RULndQWygUUXbgr8x9tUudwPJM1XDQeADrRsVFSjTPpXqSUkcGRZTxjOT
 ymCwBZG2qosr9OpPN2wAusE3e2p79oA7U/DQZnN303mdf1xfj5yI62so/OsU+fSJ+855
 prBmvV8q1kVxghxovMBvpLudn0+sBgh4fnjmg9IBEjw++V+akQKbinAigtJ8JOKmr9jy
 FPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SVvd7Y91DDXJ+74u7eN7bCl/n8yBZ3mQsnmYmJ0F8+U=;
 b=f7lyZgd1fEpxt2MHJGvIEElyTa2dzyORZVOSofeUAqwMqWBYmWfpOq8YD5BxossaBc
 G9ud87i8+oNMrVWfq1/A7irUq/+fGdNNsQnFMFwxR9SPKf3ExJ4II+6iagD4/90ct3/Y
 kINFXl3Y/TNIpv8l4S17Z5AMmKynFKmvlgRSKJC3cr+XYQMW9ps1mApclqACKUJvATMr
 I29GVczHHun3ddnfWeW4IwcazXtWSbf1ygXCmrSPdjomlroaJ5k8R2gAcVJIgDrY64F5
 v05yq4yskpoAnNT0aIsGdJPsZ3lY/SX/MM57avbLYn2jCl8EVq0213uClqJeoMzl56qM
 AztQ==
X-Gm-Message-State: AOAM531cQW93Lcnbp98DcNoXAb1AmJKYnF2Zwn/+zkDjHmKt9Cwtpex2
 VL2ECI3gV5DinRXszd4VSorCng==
X-Google-Smtp-Source: ABdhPJzIDPYODVKD+H+CvY1dk/RH1+udPjOGZpvekkvI2+qmTFjC+kvXzQ3EH6ItWdhgSXhAZGuKjA==
X-Received: by 2002:a17:90b:1b52:b0:1c6:17b9:b430 with SMTP id
 nv18-20020a17090b1b5200b001c617b9b430mr386768pjb.75.1647280747124; 
 Mon, 14 Mar 2022 10:59:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s25-20020a056a00179900b004f737ce5c1asm20402322pfg.73.2022.03.14.10.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 10:59:06 -0700 (PDT)
Message-ID: <2b7a4974-4507-f335-44a2-383d0188e24c@linaro.org>
Date: Mon, 14 Mar 2022 10:59:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
Content-Language: en-US
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220311184911.557245-1-iii@linux.ibm.com>
 <20220311184911.557245-4-iii@linux.ibm.com>
 <46cd7fbe-c96e-71b5-a648-da0fce0d2f8d@linaro.org>
 <a97d0416-111a-4b03-c787-b51facea4a3c@de.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a97d0416-111a-4b03-c787-b51facea4a3c@de.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 01:30, Christian Borntraeger wrote:
> 
> 
> Am 11.03.22 um 21:32 schrieb Richard Henderson:
>> On 3/11/22 10:49, Ilya Leoshkevich wrote:
>>> +    size_t length = 0x100000006;
>>> +    unsigned char *buf;
>>> +    int i;
>>> +
>>> +    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
>>> +               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>> +    assert(buf != MAP_FAILED);
>>
>> I'm thinking exit success here, as such a large allocation may well fail depending on 
>> the host.
> 
> What about using MAP_NORESERVE ?

That can help, certainly.  But that doesn't affect RLIMIT_AS, or a 32-bit host.

r~

