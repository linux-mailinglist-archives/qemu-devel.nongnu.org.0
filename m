Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF13D588E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:33:46 +0200 (CEST)
Received: from localhost ([::1]:39598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yrh-0000oy-UI
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m7ypo-0007ev-D5
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:31:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m7ypm-0001tZ-HJ
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627299103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIQy7xdV5DaZXgmtB3lTx23nMFbOtxAMqZyDkKoXLd8=;
 b=LtyYbTBOM8DPKbnK0Dvl8SyeIYIZujuy3u6QramsyTi4xYNActKrXGs9k5WuTpl2B9cV2e
 q0RGyHSpqVHMJp95dIwR5I+oy3KmMYKMHNoLL2wZNZBvF/MxayyV7IGqLuLT3JpQEtDmgc
 CyL/69NoR88onXbBlAjMJkscTCgvvqY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-R1A9vassPxm36oh_yvU-Lw-1; Mon, 26 Jul 2021 07:31:42 -0400
X-MC-Unique: R1A9vassPxm36oh_yvU-Lw-1
Received: by mail-wm1-f72.google.com with SMTP id
 a1-20020a7bc1c10000b0290225338d8f53so3048918wmj.8
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uIQy7xdV5DaZXgmtB3lTx23nMFbOtxAMqZyDkKoXLd8=;
 b=GzIRPipZd+9PAngHVvP/sE2cRU+Jviplo1jeD4JBpyrk5vrNxalQJDrYyOsoGZSRxi
 UX2WKZzheMx0lAacUXa/45sJ7xQ/HyHX8/FjoJYw6XvVj9KXwevnQcWpNh9fxSwH2u4l
 +kTrb3l5sasd82i8TxKjpzq6ivQHayplvZy0ow5M4c3PWRZ+O08zd1xWfc2N/jzxlLu0
 QSJi5NuhpIigl0vxwJzZL0XbEFjMj608O1h4wG6mJuoyD04sXVpWWMUZNwEdPURI+vzR
 10heGdAHmAAQpWjXejp/zT8BmNvxdPX+E6hhPuQ+WCU/tp8dGqSaVX3ipp6YuDZ7/EkA
 7kLA==
X-Gm-Message-State: AOAM533JFZFDbetBoaWSCuP9bJ39UId7dWiGdedu9t0HsNFlfPWymrTi
 g3y/oatdv/PcwogCuJblVgkJPYksXXfKfWEBkgPkFdc0GrqCzNyZ2K10ntEmkmhcQr4TBf45kTR
 nByu+iZ8g1H9pT60=
X-Received: by 2002:a05:600c:3b98:: with SMTP id
 n24mr26562507wms.182.1627299100894; 
 Mon, 26 Jul 2021 04:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdhod9h4m8x89fxy9GjnXUlh443l7FWmGlG8nb4BP7dMiCmsXtfEGSyCVTtf9u9DyeAMT28A==
X-Received: by 2002:a05:600c:3b98:: with SMTP id
 n24mr26562485wms.182.1627299100687; 
 Mon, 26 Jul 2021 04:31:40 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id s1sm13371839wmj.8.2021.07.26.04.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 04:31:40 -0700 (PDT)
Subject: Re: Prefetches in buffer_zero_*
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Joe Mario <jmario@redhat.com>
References: <YPlCJpMIOb2Umc+Z@work-vm>
 <092f9b8b-4a14-d059-49be-010b760828aa@linaro.org> <YPnDdT1VYANI0Wzw@work-vm>
 <CA+c1WK7XCgdYTbG5FK3q=x9S1t2p2vxcreEwtiZf5L=rsg0i6g@mail.gmail.com>
 <YP52r9ck8jmV/RkR@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bcbca5e4-d804-2a2f-2dff-4b19f4ef07cf@redhat.com>
Date: Mon, 26 Jul 2021 13:31:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP52r9ck8jmV/RkR@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Lukáš

On 7/26/21 10:47 AM, Dr. David Alan Gilbert wrote:
> * Joe Mario (jmario@redhat.com) wrote:
>> On Thu, Jul 22, 2021 at 3:14 PM Dr. David Alan Gilbert <dgilbert@redhat.com>
>> wrote:
>>
>>> * Richard Henderson (richard.henderson@linaro.org) wrote:
>>>> On 7/22/21 12:02 AM, Dr. David Alan Gilbert wrote:
>>>>> Hi Richard,
>>>>>    I think you were the last person to fiddle with the prefetching
>>>>> in buffer_zero_avx2 and friends; Joe (cc'd) wondered if explicit
>>>>> prefetching still made sense on modern CPUs, and that their hardware
>>>>> generally figures stuff out better on simple increments.
>>>>>
>>>>>    What was your thinking on this, and did you actually measure
>>>>> any improvement?
>>>>
>>>> Ah, well, that was 5 years ago so I have no particular memory of this.
>>> It
>>>> wouldn't surprise me if you can't measure any improvement on modern
>>>> hardware.
>>>>
>>>> Do you now measure an improvement with the prefetches gone?
>>>
>>> Not tried, it just came from Joe's suggestion that it was generally a
>>> bad idea these days; I do remember that the behaviour of those functions
>>> is quite tricky because there performance is VERY data dependent - many
>>> VMs actually have pages that are quite dirty so you never iterate the
>>> loop, but then you hit others with big zero pages and you spend your
>>> entire life in the loop.
>>>
>>>
>> Dave, Richard:
>> My curiosity got the best of me.  So I created a small test program that
>> used the buffer_zero_avx2() routine from qemu's bufferiszero.c.
> 
> Thanks for testing,
> 
>> When I run it on an Intel Cascade Lake processor, the cost of calling
>> "__builtin_prefetch(p)" is in the noise range .  It's always "just
>> slightly" slower.  I doubt it could ever be measured in qemu.
>>
>> Ironically, when I disabled the hardware prefetchers, the program slowed
>> down over 33%.  And the call to "__builtin_prefetch(p)" actually hurt
>> performance by over 3%.
> 
> Yeh that's a bit odd.
> 
>> My results are below, (only with the hardware prefetchers enabled).  The
>> program is attached.
>> Joe
>>
>> # gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH ; for i in {1..5}; do
>> ./a.out; done
>> TSC 356144 Kcycles.
>> TSC 356714 Kcycles.
>> TSC 356707 Kcycles.
>> TSC 356565 Kcycles.
>> TSC 356853 Kcycles.
>> # gcc -mavx buffer_zero_avx.c -O ; for i in {1..5}; do ./a.out; done
>> TSC 355520 Kcycles.
>> TSC 355961 Kcycles.
>> TSC 355872 Kcycles.
>> TSC 355948 Kcycles.
>> TSC 355918 Kcycles.
> 
> This basically agrees with the machines I've just tried your test on -
> *except* AMD EPYC 7302P's - that really like the prefetch:
> 
> [root@virtlab720 ~]# gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH ; for i in {1..5}; do ./a.out; done
> TSC 322162 Kcycles.
> TSC 321861 Kcycles. 
> TSC 322212 Kcycles. 
> TSC 321957 Kcycles.
> TSC 322085 Kcycles. 
>  
> [root@virtlab720 ~]# gcc -mavx buffer_zero_avx.c -O ; for i in {1..5}; do ./a.out; done
> TSC 377988 Kcycles. 
> TSC 380125 Kcycles. 
> TSC 379440 Kcycles.
> TSC 379689 Kcycles. 
> TSC 379571 Kcycles. 
>  
> The 1st gen doesn't seem to see much difference with/without it.
> 
> Probably best to leave this code as is!

Regardless the decision of changing the code or not, it would be
nice to have this test committed in the repository to run
performance regression testing from time to time.

>> /*
>>  * Simple program to test if a prefetch helps or hurts buffer_zero_avx2.
>>  *
>>  * Compile with either:
>>  *  gcc -mavx buffer_zero_avx.c -O 
>>  * or
>>  *  gcc -mavx buffer_zero_avx.c -O -DDO_PREFETCH 
>>  */
>>
[...]


