Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E972137B553
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:07:57 +0200 (CEST)
Received: from localhost ([::1]:54982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgh6C-00011E-V6
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgh53-0000L6-K2
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:06:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgh51-0004MJ-Tm
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:06:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620796003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRdOsVAzjAJCpwkI3A76ewTX4q8uAiWgjJzmGE9uE0E=;
 b=LpinyC/FwvaQwcwU9R5ONulY+JiSkaHeyd509717+5xMJPsqUSH91zVhjtEF5T69Fkm7G1
 dCVYUTKO/i8+z43ulBybm2FOPht+aKbG9RWC40ZrqkdsY2BSS3IKs7UT6Fz5klFeJBN3Dc
 ju9kswE6xeNoVaf6YOF+Yf90T42/1Dc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-VV3AuofpNFCvTyuV3cpxyw-1; Wed, 12 May 2021 01:06:37 -0400
X-MC-Unique: VV3AuofpNFCvTyuV3cpxyw-1
Received: by mail-wm1-f72.google.com with SMTP id
 b16-20020a7bc2500000b029014587f5376dso310147wmj.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eRdOsVAzjAJCpwkI3A76ewTX4q8uAiWgjJzmGE9uE0E=;
 b=fXwF+wt3LAdvRhsy0G+fHk7Z+8Mk/XkKlX/peLag8DiKb/TXuyrpJx60PPpARBnxVb
 rMEQQ2+7JHgsdw1ouZ7MJDT6cxPi0SB/ywlSYWV70v5r0iHAo7tc26Lv01BJLMlb8WCI
 02RDa0qfgg/0juXcyt+n5iGwkulDOi0+78QP0/wkzj4RNtjJRkOET54Oaj3n6Prg5Xf4
 8TpCKrHLEjw9hhR3zWSPBfc5VjvOHm7hmEkmBaSCgT0OAZ3VdHpmclukRenySWVArlsT
 VFY9UVhSMlv/zKThPU3tXsJUwULoITi7eSN8WFRjitIg4VGhU1o20LK1eC5nG8qnHu7O
 rITg==
X-Gm-Message-State: AOAM532OG+kW0VFl8aW6st5l/l27dU0FiQXTDEoeGtXgJNd1ewzZxaJA
 wNHRhwKY6HOt5meawyqQzX8qHaw8jL/7I4rW5qeoKcyBi2GXxiW/+xzM3hbKnwPF3jPHvCUOH7C
 Ztg6kLtqVJf0QMz8=
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr35404035wmb.66.1620795996153; 
 Tue, 11 May 2021 22:06:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMnLDnsCNDzovyXsHiSYbGxgrD75ZWWmyiRuxv/pD2jfvN/WD6t6exhKVmFhXHus2FuLr4HA==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr35404011wmb.66.1620795995897; 
 Tue, 11 May 2021 22:06:35 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id r1sm28887109wrx.22.2021.05.11.22.06.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 22:06:35 -0700 (PDT)
Subject: Re: [PATCH 1/1] gitlab-ci: Add KVM x86 cross-build jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210512044228.3254073-1-philmd@redhat.com>
 <20210512044228.3254073-2-philmd@redhat.com>
 <cb1077a4-a1ff-b88c-f648-7dfbbfafebc3@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e8f7ad46-fe09-1027-be13-114003f12fa6@redhat.com>
Date: Wed, 12 May 2021 07:06:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cb1077a4-a1ff-b88c-f648-7dfbbfafebc3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 6:57 AM, Thomas Huth wrote:
> On 12/05/2021 06.42, Philippe Mathieu-Daudé wrote:
>> Add a new job to cross-build the x86 target without the
>> TCG/XEN accelerators (IOW: only KVM accelerator enabled).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index e44e4b49a25..a8eac2cddba 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -198,6 +198,14 @@ cross-win64-system:
>>     variables:
>>       IMAGE: fedora-win64-cross
>>   +cross-i386-kvm-only:
>> +  extends: .cross_accel_build_job
>> +  needs:
>> +    job: i386-fedora-cross-container
>> +  variables:
>> +    IMAGE: fedora-i386-cross
>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-xen
> 
> We already have build-tcg-disabled in the main .gitlab-ci.yml file ...
> so I fail to see what additional test coverage we get by this job?

Doh I missed build-tcg-disabled was the x86 job, sorry.

Please disregard this patch!


