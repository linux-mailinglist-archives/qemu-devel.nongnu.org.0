Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B535436ED25
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:12:16 +0200 (CEST)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8Kt-00055o-Rl
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc8J5-0004X1-Vz
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc8J4-0005Dx-9l
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619709021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+CkLtUjD5IoIZJAbNeYQM0I6kO+AZj8Cn3OrDcpS1A=;
 b=SVdcHK9ZYTjnIOdaocQtYkyXeYJLYkolw75lRF7YIF5CIOg8LDC5GcCh4qoxUPimzD4xcP
 2Rds5nMC4oDLkTNs8TQIr09kWKwloqCdAOwZ22dIfCZSvQdfSfq/FZQtZZ9g/pGO+RPxsg
 BFBIPQoY0XCPAQKBLPtYoGkz2p3ElQI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-fJFfcg9bP2O5qjuBt2aBIw-1; Thu, 29 Apr 2021 11:10:20 -0400
X-MC-Unique: fJFfcg9bP2O5qjuBt2aBIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a1ce00a0000b029013893b0532cso3513604wmg.2
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 08:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G+CkLtUjD5IoIZJAbNeYQM0I6kO+AZj8Cn3OrDcpS1A=;
 b=O/0CPaitA++r1zpds6bAzi4gXUEaz8hgVDtnPHj69NS02MLExddkKOHh6Hx9Px5B5U
 XfjT6/TvcQiuQRnrVdNqHDKllz9y88alCWh97Zn+cmXM9xNU7n8eyAL2tNfkjj7CqsSL
 W3bc6zu4X0FeWZRvuKaYJsZ11HH1utPK5aSvi4Kx9mgYUc2GvpU1CnYlWn290JXAzC4R
 e0pfRac17wpnv8Vw60hWtUT6a9xVc//2g8znKpCKTOhrVRU01InhkQUNs3G3xd/BkXP1
 srj58pnekumEvzxX/3AKOecwcCdbqQxKw/kkC9LEKN4UTZEkLo9q4oh4LdGehoVcmV0H
 jlZQ==
X-Gm-Message-State: AOAM532L0+gdpz2Iu7nrc2qpiVbix3yrVgiciWdgPFNrhDjYJQkK8M8F
 Z3s4sVRNH8kcG8eguBdeTk68b4vXSCCbpCBeEbUcAM/1ACi5p21r2GjzJOwJsMToUaHXWzxjT/k
 ir64QlsvsBqyelcs=
X-Received: by 2002:adf:efca:: with SMTP id i10mr301165wrp.316.1619709018418; 
 Thu, 29 Apr 2021 08:10:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy87M52LACj3AXqLEZxl6rwifqZ4fel8lvkJVVPxBtq33Vg2+lq8MgQ+NoI7VyOKWAHKAwPUg==
X-Received: by 2002:adf:efca:: with SMTP id i10mr301137wrp.316.1619709018279; 
 Thu, 29 Apr 2021 08:10:18 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id k15sm5146526wro.87.2021.04.29.08.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 08:10:17 -0700 (PDT)
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test build-independent
 from accelerator
To: Markus Armbruster <armbru@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
 <87lf91ir1m.fsf@dusky.pond.sub.org>
 <1de6b3f8-7d7c-9280-4cd3-633a19dd9b8e@redhat.com>
 <874kfprzrw.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <603c7934-ea16-baf8-9ae5-ab221db345c7@redhat.com>
Date: Thu, 29 Apr 2021 17:10:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <874kfprzrw.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 3:22 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>> Now than we can probe if the TCG accelerator is available
>>>> at runtime with a QMP command, do it once at the beginning
>>>> and only register the tests we can run.
>>>> We can then replace the #ifdef'ry by a runtime check.
>>>>
>>>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>> Please read the last remark first.  The other ones are detail; feel free
>>> to skip them until we're done with the last one.
>>>
>>>> ---
>>>>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>>>>  1 file changed, 14 insertions(+), 4 deletions(-)
>>
>>>> +    tcg_accel_available = qtest_has_accel("tcg");
>>>> +
>>>
>>> When does tcg_accel_available differ from defined(CONFIG_TCG)?
>>
>> qtest_has_accel("tcg") is a runtime check, while defined(CONFIG_TCG)
>> is build-time.
> 
> Let me rephrase my question: under what conditions can the values of
> qtest_has_accel("tcg") and defined(CONFIG_TCG) differ?

They are currently the same, so this patch is a no-op. *But* it
allows us to remove the global dependence on CONFIG_TCG in the
Meson machinery (see the last commit in this series).

Is that missing part of the commit description?

"This will allow us to remove the global CONFIG_TCG dependency
in our Meson machinery in a pair of commits."?

>> Having tests doing runtime checking allow to:
>>
>> - have easier reviews, having less #ifdef'ry
>> - build them once for all targets
>> - build them once for all ./configure options
>>   (thinking about CI, the a single job could build the tests, then
>>   we run them using the QEMU binaries from other jobs)
>> - use the same binaries to test the built binary and the distribution
>>   installed one
>> - remove the dependencies between tests and binaries
>>
>>>
>>>>      g_test_init(&argc, &argv, NULL);
>>>>  
>>>>      qmp_schema_init(&schema);
>>>
> 


