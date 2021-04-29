Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C4536EB44
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:25:00 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6f4-0000D2-Vn
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc6cZ-0006zo-Jm
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:22:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc6cW-00084b-L2
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:22:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619702539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtgejSpi+mcY9690wEfWGmbm84NGW1ZTzADykyyevHo=;
 b=ZXsiMexA30QBf6G765Vg0j9etXHMRMoMCJjyzp636mwqCf2jdFMZlspLNy6pmcVNQbIIXw
 r8dTBtdj8uDkrml7CAR++P3Y4WTXj3bgKLD49SuYmSQfKDYXgRH9xLouEgdYuCHzo3aVHm
 1jzmG5qpbuHXsQGEDhjrHUIs7rik8QQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-ivQnbKK3PlWjtotEDUKYhg-1; Thu, 29 Apr 2021 09:22:17 -0400
X-MC-Unique: ivQnbKK3PlWjtotEDUKYhg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j72-20020adf914e0000b02901073cdd9d65so14532651wrj.0
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 06:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GtgejSpi+mcY9690wEfWGmbm84NGW1ZTzADykyyevHo=;
 b=peqiyDhUq6dWkdihPWuujuKEA5M0GMRgAcP5SdUCjBQy5S0Mn6DW577jtrPykVBd9H
 uIh/bfocjmRN6G2jUd6kMJfifEjia5oAnx9b8KznMj4MhjtRhGXONjeYRAOKkTq9nWM4
 1CnC9WVxI0unlK/ZhA2OCT+H4na6cElVKumm81r4ircpN7KPtKc7xjdoZwtamut+gijr
 a5DYX57AtfSFy0ym6bg1WTodjsg3I2NlRnt9ezk7/b/Qj/yQro2knejk1CjZX3LNWCPC
 vgq0bZfIHxFEZD3Z4lAmGzNP1eq4I6g0Q9b6JEsGm5+tYfSbSU9LO7NiJN9Z2WczBsh7
 8V1A==
X-Gm-Message-State: AOAM532INHZy+3fq5tDD0O6seM3DY+JJwqxRfdEuh/gcur/oSRi90H3H
 ZF152UMYGfud101i6nkjsZ0ghwmDmqtJ3Ho8NI1LJh91P0W7Ujt5FKIGaNGO5W1lep6qjBjMvlU
 LaDX+u6lxMOuLh4w=
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr11340935wrm.104.1619702535971; 
 Thu, 29 Apr 2021 06:22:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpl6v0OYTzRHIU/DbLyL95W4CNKzWZqEJyvMWCWatJZBhooRSH4MJC2q/c5EQktud3ZhldwA==
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr11340904wrm.104.1619702535761; 
 Thu, 29 Apr 2021 06:22:15 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id g12sm10802535wmh.24.2021.04.29.06.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 06:22:15 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] gitlab-ci: Add a job to build virtiofsd standalone
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20210429083346.61030-1-philmd@redhat.com>
 <20210429083346.61030-3-philmd@redhat.com>
 <d64aa1d2-6fc3-4c4b-fa0d-2f3721ab7e9a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a19827af-7300-bb04-4124-a54f409b42aa@redhat.com>
Date: Thu, 29 Apr 2021 15:22:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <d64aa1d2-6fc3-4c4b-fa0d-2f3721ab7e9a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 3:16 PM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 4/29/21 5:33 AM, Philippe Mathieu-Daudé wrote:
>> Add a job which builds virtiofsd without any emulation or tool.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> https://gitlab.com/philmd/qemu/-/jobs/1222007991
>> Duration: 7 minutes 48 seconds
>> ---
>>   .gitlab-ci.yml | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 52d65d6c04f..ba3c7ade6ca 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -800,6 +800,19 @@ build-libvhost-user:
>>       - meson
>>       - ninja
>>   +build-virtiofsd-fedora:
>> +  <<: *native_build_job_definition
>> +  needs:
>> +    job: amd64-fedora-container
>> +  variables:
>> +    IMAGE: fedora
>> +    CONFIGURE_ARGS: --enable-virtiofsd
>> +        --disable-system --disable-user --disable-tools --disable-docs
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build/tools/virtiofsd/virtiofsd
>> +
> 
> Why it needs the executable archived?

I assumed if there were testing jobs as next stage, this is what they
would consume? I copy/pasted from another job and adapted, but you are
right, it is pointless. AnyhowI understood this job has been discarded
during review.

Thanks for having a look!

Phil.


