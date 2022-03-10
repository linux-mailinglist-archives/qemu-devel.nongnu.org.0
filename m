Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF124D4219
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 08:59:26 +0100 (CET)
Received: from localhost ([::1]:60348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSDhl-00089J-1f
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 02:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSDeo-0007Rv-Bp
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 02:56:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSDem-0006by-6j
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 02:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646898979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcZp9io2H7vepEj56kCqvp2Ooy/4JOEKdqUcqTBmcys=;
 b=N1kdZuHaEtuJsLCObLaZGc86l4+jz3lAw2Fd2CCOom4lP+QLry6EcZ2VaM63ci9009J796
 ehttmgBcfgC5DGfZdJs3P7LQeBA8Kb9fXaED4Gyo0uv7DWGzNNHkC7CLiRbm+YQwXAXDYS
 qTWghflJ3fdq7HKGU/Z2+m2lDO+Un2g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-DU1j9v3wMz-G7foLEcJDfw-1; Thu, 10 Mar 2022 02:56:18 -0500
X-MC-Unique: DU1j9v3wMz-G7foLEcJDfw-1
Received: by mail-wm1-f72.google.com with SMTP id
 d8-20020a05600c34c800b0037e3cd6225eso1797460wmq.6
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 23:56:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TcZp9io2H7vepEj56kCqvp2Ooy/4JOEKdqUcqTBmcys=;
 b=W/60Eew8mIo9tj6u60A8zpf9nAqpdYfsUbVYedQf0vR2oeWSpdIyEOcxQE+8dPcrL4
 3UlVFORWAbieGGS5y7+7jmuuHwj3o6AE83RQQ3/e+acMTtKbxhV8MpNof0sK3lXH5aKt
 /vaUCXEkjZ5oCHsEIjFxDnEw8IQbamRGuiANZ8xttHixJ4L5E18R0WL5bxTBcc5GhACs
 ZhTfiYtF7ygtz3VKUB8HswXY/Rpaf7QjmDfm1h+oYRxtHpM+iFFZzb9jEzI+ldbGlGjd
 nl6t4+AqhkxS/b77vZT/JQhTDXFO7H+/8Ibv3laXLxDW55PXLP4kzMzixIBH5ZeHiVVy
 Cxng==
X-Gm-Message-State: AOAM532lghqosM7uKshp1if3Y2HTPsJ5x7+aq1yyMZZ68vN78xE/9jRn
 6r4azfcanWtC/aEUlYJy7F7sz7J8gS8a5MRrmOuRzW59DFhwi2n8eysSo/ETl1ARDYUob3SBDtc
 991LbAyUbLITEOD8=
X-Received: by 2002:adf:9f11:0:b0:1f0:728c:8fac with SMTP id
 l17-20020adf9f11000000b001f0728c8facmr2520306wrf.245.1646898976751; 
 Wed, 09 Mar 2022 23:56:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFLQ1ois4RnLOOYRZhs3mS6BjjueBm8xtjsNwzj6AEMsnjrm5fvTQCnWGeMfL5C3CCEMiH0w==
X-Received: by 2002:adf:9f11:0:b0:1f0:728c:8fac with SMTP id
 l17-20020adf9f11000000b001f0728c8facmr2520298wrf.245.1646898976469; 
 Wed, 09 Mar 2022 23:56:16 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 l18-20020adfe592000000b001f064ae9830sm3425791wrm.37.2022.03.09.23.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 23:56:16 -0800 (PST)
Message-ID: <689406f4-429b-f1b2-c22e-9aefdcf145e3@redhat.com>
Date: Thu, 10 Mar 2022 08:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PULL 00/23] QEMU changes for 7.0 soft freeze
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220307181633.596898-1-pbonzini@redhat.com>
 <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
 <06fed507-e09f-b62a-30cc-046fcdd80760@redhat.com>
 <391c0c77-3072-2299-f675-6e214110002e@redhat.com>
 <e45024ca-2845-527d-fe14-b3675532d944@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e45024ca-2845-527d-fe14-b3675532d944@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/2022 17.07, Paolo Bonzini wrote:
> On 3/9/22 10:46, Thomas Huth wrote:
>>>
>>> That one also drops the progress report of non-failed tests, so I'm not 
>>> sure it's an improvement.
>>
>> That only works here anyway if I don't run "make check" with the "-jX" 
>> option ... which I hardly do, since it then takes forever to finish the 
>> testing. So at least for me that's not really a reason.
> 
> The point of having a separate "make check-block" was to have the progress 
> report ("--verbose --num-processes 1" gives the progress report, the same 
> with --print-errorlogs doesn't).

Yes, understood, but again, that only works for me if I run:

  make check-block

But if I run:

  make check-block -j8

I only get one single line saying:

  [1/1] 🌓 qemu:block / qemu-iotests qcow2                   2s

And the progress report is only printed in one go at the end, after all 
tests have finished. Since I'm using -jX with X > 1 by default, the progress 
report that you get with -j1 is simply no advantage for me. Is your build 
behaving differently? ... then this maybe depends on the meson version? I 
think my build is using the one from the submodule, version 0.59.3.

>> Ok ... could you maybe ask the meson folks to include the fix in the 
>> upcoming stable releases?
> 
> Did it, hopefully will be in 0.61.3.

Great!

... but I guess this will be too late for QEMU 7.0 ?

I just sent out

  "[PATCH v4] tests: Do not treat the iotests as separate meson test target 
anymore"

in case we want to continue with the TAP mode for 7.0 (only updated the 
patch description) ... but since we're in freeze mode already, I'm also fine 
if you say that this is not appropriate for QEMU 7.0 anymore and that we 
should revert the TAP patches instead.

>> ... the meson master branch has been switched to Python 3.7 already,
>> but AFAIU we still target Python 3.6 in QEMU, so I'm not sure whether
>> we will be able to jump on the next main release with QEMU... we
>> might need to stick with a 0.61.x release for a while in the future?
> 3.6 was EOL'd in December, so I expect that QEMU will bump the requirement 
> sometime this year too.

Yes, that makes sense ... I was just thinking about RHEL 8 and its clones, 
which have Python 3.6 as default ... but I think they also ship Python 3.8 
as alternative, so I guess it should be fine to increase the minimum Python 
version for QEMU 7.1 ?

  Thomas


