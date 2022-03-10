Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E9E4D4762
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:56:06 +0100 (CET)
Received: from localhost ([::1]:40072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIKr-000618-7P
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSHu9-00048D-Fv
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:28:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSHu5-0001aA-DA
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646915304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+OV+fgC/oemx4o2XY4fnGrQj6E6KgE1nlapaLM0mzM4=;
 b=J/580CYoepVIgTBP77/v4iwP8FH9hvvv+Q3lrYizNDzy5rCBJ+z7ID2QHUZy9TXFIX6AEQ
 yVzFXc35kHn1OH3nm2eO6ZU2xppx1ilQVlZCy4g+9ysTaQCV2l1cHAbwkV3HIR3Q8EQe1V
 Kju/a7w0sqzjlvxybBrEsPnUUb1nCDA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-gZqmWtteMo6tZKmGk89zEA-1; Thu, 10 Mar 2022 07:28:23 -0500
X-MC-Unique: gZqmWtteMo6tZKmGk89zEA-1
Received: by mail-wm1-f69.google.com with SMTP id
 10-20020a1c020a000000b0037fae68fcc2so3998194wmc.8
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:28:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+OV+fgC/oemx4o2XY4fnGrQj6E6KgE1nlapaLM0mzM4=;
 b=oRPw0z8ZX4sb8tKjBekPs1dX3ZE+R9unC2VEh+npOV/26eJgdyMHCOEmewmvysnlYh
 R8eoyD8dO93i9bwBtJUpyaV+Gm6PyO2iNAeTo1/2SB0WXEwmRwRhJnCcc9LoeBV+2j29
 p371u8VG8q+L82ymdGVMOBLpbOMNBE2mZofauCn7BB8VwccHll/bAsPDsgXjLvt6BMbA
 jBkC5Kf1zXQrjAU143td7xNENW10wjywM3PAPJ0T9AxRtPHi+1j92VvWkSsxd6X/6IFP
 9A7xVAkjYHfPMwtRNZ3Uz183KCR3wMc63c9i6mbqB4ygydPUDgkYJv+CyxGvyZwb5sRw
 j01A==
X-Gm-Message-State: AOAM533H3X6gFin7LrbS/ExVJVxyqB/cPQZEL/YltRpojPuGvh4KVYpD
 1gDW7APnuv3YE0EgoYbG1KV1J0l56fHiX35gygWYdEBeITl+9Z5tKvbxIaFeL3m/K1yM/GeyZUw
 l8TA2qyLirDhU/WY=
X-Received: by 2002:a05:600c:3011:b0:387:a08f:44d8 with SMTP id
 j17-20020a05600c301100b00387a08f44d8mr11662039wmh.59.1646915301945; 
 Thu, 10 Mar 2022 04:28:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtvZBkkMXyOG5ka4VpEDsWghpE0f3TT0ds72iGRvak0ordgv6R69wy/yjQPE2gs3RQYjnbxw==
X-Received: by 2002:a05:600c:3011:b0:387:a08f:44d8 with SMTP id
 j17-20020a05600c301100b00387a08f44d8mr11662024wmh.59.1646915301719; 
 Thu, 10 Mar 2022 04:28:21 -0800 (PST)
Received: from [192.168.42.76] (tmo-097-147.customers.d1-online.com.
 [80.187.97.147]) by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b001e7140ddb44sm4068736wrw.49.2022.03.10.04.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 04:28:20 -0800 (PST)
Message-ID: <647e89a6-07f5-128b-71fb-9473d28fc69d@redhat.com>
Date: Thu, 10 Mar 2022 13:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH] tests/tcg: drop -cpu max from s390x sha512-mvx
 invocation
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20220309112248.4083619-1-alex.bennee@linaro.org>
 <5ac2ce87-90a3-05f9-d65e-a8ef9854863c@redhat.com>
 <9a47f844-85a3-25ff-38e2-1c6d079cd18d@redhat.com>
 <f036a033-fca7-0125-b90c-0e840d79a59e@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <f036a033-fca7-0125-b90c-0e840d79a59e@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 12.35, Richard Henderson wrote:
> On 3/10/22 02:21, Thomas Huth wrote:
>> On 10/03/2022 09.36, Thomas Huth wrote:
[...]
>>> However, the error still persists. I now had a closer look by running the 
>>> test with "qemu-s390x" on my z15 machine directly, and all tests are 
>>> failing! The problem happens with both, gcc v11.2.1 and clang v13.0.1. 
>>> The problem goes away (i.e. test works fine) if I compile the code with 
>>> -O1 instead of -O3, or if I use GCC v8.5 instead. I'll try to find out 
>>> more, but as a temporary workaround, we could also switch to -O1 instead 
>>> of -O3.
>>
>> I noticed that the problem does not occur when running the test natively
>> on my s390x box, or via qemu-s390x on my x86 laptop, or when running it
>> via qemu-s390x v6.1.0 on my s390x box. So it's something wrong in the TCG
>> backend, I think, and I was able to bisect the issue down to this commit
>> here:
>>
>> $ git bisect bad
>> 9bca986df88b8ea46b100e3d21cc9e653c83e0b3 is the first bad commit
>> commit 9bca986df88b8ea46b100e3d21cc9e653c83e0b3
>> Author: Richard Henderson <richard.henderson@linaro.org>
>> Date:   Mon Sep 14 20:36:36 2020 -0700
>>
>>      tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
>>
>> Richard, could you please have a look? 
[...]> Ok, will look soon.
> Would you pop this into an issue so I don't forget, please?

Sure, I've created a ticket here:

  https://gitlab.com/qemu-project/qemu/-/issues/898

  Thomas



