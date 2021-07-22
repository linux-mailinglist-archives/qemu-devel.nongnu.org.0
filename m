Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E43D2BAB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:03:48 +0200 (CEST)
Received: from localhost ([::1]:36270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6d2x-0006EZ-2S
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6ctE-00082Z-6h
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6ct9-0002hC-O2
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626976419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9TV1/lFRatmqI5dmNrwpYqE71zifdWvQsfRBYltSCg=;
 b=cfhsMUHbgVeJfInTfP6GHuD1tE3SVQZTLrKP+DU4pL7+MJYBs2HiJ5V/pOK8RTJKqaG+8G
 k8NqUqyE7ZFl5RzNyXOIktxNkk+ApKZIeCegGybKBadJ5FtkQJQHIQ99HZJotnS9O3aBmg
 3miTYQcr8F9DnPf6f7jhTXFzcFFlcr0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-_lFo2nD5PFGgsSAO-RtovA-1; Thu, 22 Jul 2021 13:53:38 -0400
X-MC-Unique: _lFo2nD5PFGgsSAO-RtovA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d9-20020adffbc90000b029011a3b249b10so2704018wrs.3
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G9TV1/lFRatmqI5dmNrwpYqE71zifdWvQsfRBYltSCg=;
 b=OH3EyvNQHNSiDoIYK95UP3nZncUlqTFCWxjPJGs7Hq471lqsdtRKGpvwIuetEZPbRB
 dNx/X25GS9V9OHkHtwELbxp1AiBjYEGAIi+F9fEy+b8TsAtoUw3Gth4rMO8XirBjfHfQ
 9JOZYpOd1356/nDpo6oFSFCoIfOxxIMXl6s3s+f/2hswA8+tvfTjBXrkCn3Mv345i1bz
 AqoxvG3SvqBggysvseJHaAokZ4WLVvM5pZLfDkMCjWPH5pfStyKEIFNceJ/xXAeuZw9d
 m7AVje15i3yb2+5FKA4F+xKtkIh+IQsGbq3WgRYYZMXv5yFtkqrbQ2uNzqgAs4xB/JgS
 HZPw==
X-Gm-Message-State: AOAM530Spqb2ucTKoEqGvRysms63eYguzK5zIDydkE263SsMrV0ZwLH8
 0ZbQtsg+7vIc9tRVp9Xwp22dr8uQln9OekYxf6Zeg733tmsSLHO+3YMcb3uH8w9Iugaih2jNPTh
 80Vy8ORQOVoogSW4=
X-Received: by 2002:adf:f411:: with SMTP id g17mr1161354wro.160.1626976416612; 
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvajnB3Y+iOJbP+Uw1gasn+xx24YiWn2QhBPsJZzx7zAqrFoqko/h2li5OinMhYxCvEM9sIQ==
X-Received: by 2002:adf:f411:: with SMTP id g17mr1161339wro.160.1626976416478; 
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id s13sm30281041wrm.13.2021.07.22.10.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 10:53:36 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] gitlab-ci: Extract OpenSBI job rules to reusable
 section
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210720164829.3949558-1-philmd@redhat.com>
 <YPmTb2jC3Fp2yO+E@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <52591403-f1f6-bffe-4325-074a75a85317@redhat.com>
Date: Thu, 22 Jul 2021 19:53:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPmTb2jC3Fp2yO+E@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/21 5:49 PM, Daniel P. Berrangé wrote:
> On Tue, Jul 20, 2021 at 06:48:29PM +0200, Philippe Mathieu-Daudé wrote:
>> All jobs depending on 'docker-opensbi' job must use at most all
>> the rules that triggers it. The simplest way to ensure that
>> is to always use the same rules. Extract all the rules to a
>> reusable section, and include this section (with the 'extends'
>> keyword) in both 'docker-opensbi' and 'build-opensbi' jobs.
>>
>> The problem was introduced in commit c6fc0fc1a71 ("gitlab-ci.yml:
>> Add jobs to build OpenSBI firmware binaries"), but was revealed in
>> commit 91e9c47e50a ("docker: OpenSBI build job depends on OpenSBI
>> container").
>>
>> This fix is similar to the one used with the EDK2 firmware job in
>> commit ac0595cf6b3 ("gitlab-ci: Extract EDK2 job rules to reusable
>> section").
>>
>> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Latent bug on CI, safe for 6.1.
>> ---
>>  .gitlab-ci.d/opensbi.yml | 28 +++++++++++++++++-----------
>>  1 file changed, 17 insertions(+), 11 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
>> index f66cd1d9089..d8a0456679e 100644
>> --- a/.gitlab-ci.d/opensbi.yml
>> +++ b/.gitlab-ci.d/opensbi.yml
>> @@ -1,10 +1,23 @@
>> -docker-opensbi:
>> - stage: containers
>> - rules: # Only run this job when the Dockerfile is modified
>> +# All jobs needing docker-opensbi must use the same rules it uses.
>> +.opensbi_job_rules:
>> + rules: # Only run this job when ...
>>   - changes:
>> +   # this file is modified
>>     - .gitlab-ci.d/opensbi.yml
>> +   # or the Dockerfile is modified
>>     - .gitlab-ci.d/opensbi/Dockerfile
>>     when: always
>> + - changes: # or roms/opensbi/ is modified (submodule updated)
>> +   - roms/opensbi/*
>> +   when: always
>> + - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
>> +   when: always
>> + - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
>> +   when: always
> 
> In debugging why the acceptance jobs rnu despite their prerequisite
> jobs failing, I've realized we've been making a mistake in most of
> 'rules' sections.
> 
> 'when: always'  will make the job run regardless of status of any
> dependant jobs. IOW, if you have a 'needs: [....]', it is almost
> always wrong to use 'when: always'. Instead  we need 'when: on_success'

Indeed, when the first job fail, the second is marked "skipped" with
no "retry" option.

> So this patch needs to make that change, and likewise the edk2 patch
> with the same logic.
> 
> Alex has queued this one, but I don't see it in a PULL yet, so I
> guess we can just do a v2 of this.

Sure, thanks for updating me.


