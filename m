Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD7677FC9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 16:31:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJylV-0002fz-Bu; Mon, 23 Jan 2023 10:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJylS-0002fX-VX
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:29:42 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJylR-0002Ou-7V
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 10:29:42 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r9so11169892wrw.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 07:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ag7ITHTYVgJVxAJpVhIXSpT7l89y1QU2TY+2UBhcQLg=;
 b=N/hfbLkwtIiOnnUCwe+6G0R0yH1OISVvccHsBfNnM9+68oB3frKpUvCyE+/GbmFbKI
 3mclV9s6eEUxxgvbKrrx3vCnsw2q3IX20e4hWfoHOo/zPyhDonsM1dFPNt0/8pUNDsZ+
 66nab0+RBgTUGeSRNXW8EEIYROXbY6yRfBgO7YPHRithOCVIMNhvmAVxfygm00BPMliP
 xYKgS4I+vJ2gesohg928DrIer2QRUPkASRMugw/tnLJ6vv5GBkOkQb8dTRkaMeedFGUf
 8vpNLRhNTZMqb1WHyGxoBH+Pp3pmh+UNGmZItMgE8L9bC/V3UBVZS9BUlWfO4rFJqpTs
 1Arw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ag7ITHTYVgJVxAJpVhIXSpT7l89y1QU2TY+2UBhcQLg=;
 b=mpxKFmPgpcyirhRpQ93G4QK3E4ADcortrkwEOjIMsK78brum2scdByW5QYeJdRDFAZ
 yQ81WQK8INmniw1f3HHGLePzkYxsV8PXdwuDas7gxBPTmSO5yLxGOcs42Jjvt9vcqpAr
 s3k/RNj3jXxxWpoSrCWdFHcZyk8coynnwwtKVaFVyIEVgPlMLGb4GIxeWk6NxAjXV22H
 LbczaPQo+okJlsLLERuUivJ/i9aUVHIQ/2yRK/ue/09/YjaKwbHgfb2g6E2ZWUI1MCQP
 FHKjKnJNVyqIKiqDhAYfr9p1a6+81mMP7Cb560EQdJHU++EwDjYTYWWOeN/WKp5xlmPB
 stzA==
X-Gm-Message-State: AFqh2kp1CqAe9f4SizvpJN45cqJrlY19rtar4pMQqYmmcwGPVIg9ILAm
 sz3kCzmVYVVLVgbtjX9otExhcQ==
X-Google-Smtp-Source: AMrXdXu/0iu5bjJowzEZ4SCeKLJW3JFz/tPzrJX44rLswL/IRKsiW6tKvM1395eMYe2aH0KuiMSz2Q==
X-Received: by 2002:adf:f852:0:b0:29f:4e42:33c3 with SMTP id
 d18-20020adff852000000b0029f4e4233c3mr21866250wrq.56.1674487779750; 
 Mon, 23 Jan 2023 07:29:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b9-20020adff909000000b002be5401ef5fsm8310826wrr.39.2023.01.23.07.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 07:29:39 -0800 (PST)
Message-ID: <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org>
Date: Mon, 23 Jan 2023 16:29:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
 <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org> <874jshco5h.fsf@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <874jshco5h.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/1/23 15:37, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 20/1/23 19:48, Fabiano Rosas wrote:
>>> The migration tests are currently broken for an aarch64 host because
>>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>>> line. Most other architectures define a default value in QEMU for
>>> these options, but arm does not.
>>
>> There was some discussions around that in the past:
>> https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redhat.com/
>> https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ12PT6PmLjdZ5h_YA@mail.gmail.com/
> 
> There's more than one topic being discussed, specially in this last
> thread, but here's my two cents.
> 
> About defaults: It's probably best to be explicit in tests. And if we
> wanted, have a separate test to make sure the lack of an option still
> does what it's expected, either outputting a message or behaving the
> same as the explicit version.
> 
> About host architecture-specific tests: Unless we're talking about KVM,
> I see no point. Having to change hosts to test agnostic features makes
> no sense (the migration test is one example).
> 
> About generic tests: If a feature is required to behave the same for all
> architectures/machines/cpus then sure. But most low level stuff would be
> quite dependent on specifics.
> 
>>> Add these options to the test class in case the test is being executed
>>> in an aarch64 host.
>>
>> I'm not sure what we are aiming to test here.
>>
>> Migration in general? If so, any random machine should work.
>> By hardcoding the 'virt' machine, at least this test is reproducible.
> 
> Yeah, I cannot say for sure there isn't some machine property that gets
> transferred during migration. It seemed more conservative to define a
> specific one.

Why did you choose 'virt' and not 'xlnx-versal-virt' or 'sbsa-ref'?

What does this test require? Any machine running KVM?

Adding Juan and David for migration since I'm still confused trying
to understand what we are trying to test here...

>> I'd rather fix that generically as "if a test requires a default
>> machine and the target doesn't provide any default, then SKIP the
>> test". Then adding machine-specific tests. Can be done on top, so
> 
> I agree, but the only tests that should *require* a default are the ones
> that test the command line parsing or adjacent features. We could always
> test "-machine foo" and then separately test that the lack of a machine
> option still gives the Foo machine.
> 
> The fact that we sometimes use defaults to be able to have the same-ish
> command line for every case is more of a limitation of our testing
> infrastructure in my opinion.


