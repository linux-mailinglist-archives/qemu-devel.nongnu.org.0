Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDE53CD49
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:33:47 +0200 (CEST)
Received: from localhost ([::1]:54794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxAF8-0005NA-GU
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nxADx-0004ew-Ld
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nxADu-0007NX-Dp
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654273949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0gF7Jyejy4qQAQpkIqL2IbNvJwW8Mp5JVd52UHblT8=;
 b=KCv36aWv7tXYpIapfN850Tp/z05Y4LsmBklO62ddBztuYnirLXrw7Bo4E/4JFcsN3vkIv+
 SCWYrZ2J5R+VbrC7VP/CRBVLN4UtBcrqQ/BCuQUPFZz9Of8CtLBPeOqXJGIcPxrMfalAw9
 6n6kJ4S67X9+Av7SDVGo49rtwxBHdss=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-fmhbqEqVNcaq5ZFHt_e84A-1; Fri, 03 Jun 2022 12:32:28 -0400
X-MC-Unique: fmhbqEqVNcaq5ZFHt_e84A-1
Received: by mail-wr1-f69.google.com with SMTP id
 s14-20020adfa28e000000b0020ac7532f08so1426050wra.15
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 09:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L0gF7Jyejy4qQAQpkIqL2IbNvJwW8Mp5JVd52UHblT8=;
 b=P3xEYC6aZpk5vTpEZAdIFQy0eyjIFNumpt9MvpQg2QSANBXfv+sh6OknULkWOXlWIG
 zIWNdr0ovtqNT4PPXPH3slD93sBiy6bVnjAPwqMmbTwWFB/icvCemm0pqyZeg3oQu7S4
 H3sGIrzYAQmRU3+G6Ys51S5gzWSAfpVlPJ6EbjbG6MceMdijI1tXrde2zuFblHY5Vm8p
 5GSdpNGlYSfZ4p0yvEW0EwhAKHwtIVJoLmKsljWAMRK63dkCz3FofnxSgAoHbt45dtdJ
 /k/vTRBS4DkNO2LXNMsUSoQumXSJYhIF/Y99L97BfWV0ECyXT10hoAie55M/FbkIzw3U
 ptJQ==
X-Gm-Message-State: AOAM532yet27iShgn7ghqa28oGZCP124MzymkMb8TkttdW+0D9ChHufG
 1dH0enLzdI5P+PeWnOyAQLReANX2c6Ev/ShctqVjuRkkADYN/P3zkWQnE2ustolYFfwlhM2Dkme
 QW0hpRp0N4w+5RGs=
X-Received: by 2002:a5d:6a0e:0:b0:213:1f7f:e1cc with SMTP id
 m14-20020a5d6a0e000000b002131f7fe1ccmr7854130wru.31.1654273946817; 
 Fri, 03 Jun 2022 09:32:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1X/q2kc3QZTu1iSnmeOcI3lNfI+ZHxLVcpwx+OP0i+vi3WWRcslxlIrx3e5CEuJK9o/3iFw==
X-Received: by 2002:a5d:6a0e:0:b0:213:1f7f:e1cc with SMTP id
 m14-20020a5d6a0e000000b002131f7fe1ccmr7854097wru.31.1654273946516; 
 Fri, 03 Jun 2022 09:32:26 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-213.customers.d1-online.com.
 [80.187.98.213]) by smtp.gmail.com with ESMTPSA id
 q16-20020adfcd90000000b00213abce60e4sm4253131wrj.111.2022.06.03.09.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 09:32:25 -0700 (PDT)
Message-ID: <2c37f3b2-1406-de56-f2be-0861bf427570@redhat.com>
Date: Fri, 3 Jun 2022 18:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20220603124809.70794-1-thuth@redhat.com>
 <dabe3016-83a7-e5f9-6ff2-0fb20c7cfb25@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <dabe3016-83a7-e5f9-6ff2-0fb20c7cfb25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 03/06/2022 18.17, Richard Henderson wrote:
> On 6/3/22 05:48, Thomas Huth wrote:
>> The job definitions recently got a second "variables:" section by
>> accident and thus are failing now if one tries to run them. Merge
>> the two sections into one again to fix the issue.
>>
>> And while we're at it, bump the timeout here (70 minutes are currently
>> not enough for the aarch64 job). The jobs are marked as manual anyway,
>> so if the user starts them, they want to see their result for sure and
>> then it's annoying if the job timeouts too early.
>>
>> Fixes: e312d1fdbb ("gitlab: convert build/container jobs to 
>> .base_job_template")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   I wonder whether we should remove the build-cfi-aarch64 job instead.
>>   When I tried to run it during the past months, it was always failing
>>   for me. This time, I tried to bump the timeout while I was at it,
>>   and it takes longer than 80 minutes here to finish - so I asume
>>   nobody ever ran this successfully in the last months... Is anybody
>>   using this job at all? I think if we want to have CFI coverage here,
>>   it should get replaced by a custom runner job that runs on a more
>>   beefy machine... (the ppc64-s390x job is fine by the way, it often
>>   only runs a little bit longer than 60 minutes - I still bumped the
>>   timeout here, too, just to be on the safe side)
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> 
> I think it might be useful to extend the other s390x jobs a bit too.  The 
> last couple of fails have the test *nearly* completing.  E.g. your most 
> recent pr:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2544009687

These tests are running on the custom s390x runner machine - I don't have 
access to that one, i.e. I also do not have any means to test changes here 
--> it would be great if that change could be done by somebody who has 
access to that machine... Peter? Christian?

  Thomas


