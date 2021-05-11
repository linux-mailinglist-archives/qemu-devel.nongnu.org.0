Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B437A040
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:00:32 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgMNb-0000dc-R7
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMCH-0007Q0-He
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:48:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMCF-0007dC-N6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 02:48:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id m9so18939552wrx.3
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 23:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t6gMK3WNXsjF6I6dDyJvOkv80qtADCktkgyd6bY68pM=;
 b=t4UFwrEoIwalNBumcshg8nZ5T4sO1O7WeEKNEzhvC126s0f8GUfONlTpDU/sfB8waq
 ovKnXbK5olCxRqFPH3rrybYt7q4rGfHFTa29e6mBe9K9iRzoEXUp3QK0gxdxzB500sLY
 259fx/5C3SKnuzIcx4U4Dl+PjZcxrgxGTgYmfPaLztSreRijfXjgbk90yvjbiN5phKnb
 zmml8y0eLu3GV9sG0WgK0Mc/PURWtTuEChags26M1DrgEz7yPY2yTwo7TQOhNba8mgUQ
 CrPwXW1UXThaY8WULlh0jdY0EQY/6FuLKKx8dmo0fkpy2kq32ChEh+5vywyzMI4Ea2QQ
 ySkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t6gMK3WNXsjF6I6dDyJvOkv80qtADCktkgyd6bY68pM=;
 b=K43XmnLipg7LMyQ1REDk4rAjiUysXi1L8lzM2HvSyqpXrLC7EAfJaTaX5bTnhdi+4y
 3yhUhr3HcnIwkDofgQNKjg7v2JM/n40ErIALBCJl5AhotekTxEyYLfo1JOQq2BU/wAhB
 qdYj56V24IcEujetfTOyR1O4v/Dz+XpVLxUkoThlbXNzP4o+4yoX9AUajMIf0V4dyt/i
 tFz4lAnzREOmmh4ll9odnKMCorNYRh799A1J1c7SF14FVWbYg/WdPo9Acpi7XfQQOBCz
 91TAw4XRN+0PFIjX4kBqzh+IllyPxqT2bmY/6f+A9VUqOka8uStDXJqEJh9dMUOjs1Xq
 Sxlw==
X-Gm-Message-State: AOAM532OjmIgT3q81dHmOECyOo3W/yoFvawuXO2j0X++iNUr5FB9vLMG
 fs/33fWSVBnhFAJUDALIn3k=
X-Google-Smtp-Source: ABdhPJwXWE9phekaxEMBMNKGEi5Sm5q9KGUBv5bV1hjEMTAGUzd7fT33Oh8ucB+Oxuw5kLE2ie3bLA==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr35061700wrf.130.1620715726127; 
 Mon, 10 May 2021 23:48:46 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b6sm2449324wmj.2.2021.05.10.23.48.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 23:48:45 -0700 (PDT)
Subject: Re: [RFC PATCH 14/15] gitlab-ci: Allow forks to use different set of
 jobs
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-15-f4bug@amsat.org> <YH1QJZGYQXc6x9Et@redhat.com>
 <YH1XLd34h7OXXqYR@nautilus.local>
 <1140e403-fbb0-8021-f2b6-9528247dfbc7@redhat.com>
 <YH1dQfy3H80/p0Ch@redhat.com>
 <f9bc5520-3cda-0904-241d-e3ee7b918b73@redhat.com>
 <YH1gtK/JFtVE4lF1@redhat.com>
 <49bd757d-5fe8-e5c2-cb9c-4dc0fbf37648@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a0e83ef7-13ee-6f45-96b5-b9d848bb8a43@amsat.org>
Date: Tue, 11 May 2021 08:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <49bd757d-5fe8-e5c2-cb9c-4dc0fbf37648@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Erik Skultety <eskultet@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Stefan/Peter

On 4/19/21 12:59 PM, Thomas Huth wrote:
> On 19/04/2021 12.51, Daniel P. Berrangé wrote:
>> On Mon, Apr 19, 2021 at 12:48:25PM +0200, Thomas Huth wrote:
>>> On 19/04/2021 12.36, Daniel P. Berrangé wrote:
>>>> On Mon, Apr 19, 2021 at 12:20:55PM +0200, Thomas Huth wrote:
>>>>> On 19/04/2021 12.10, Erik Skultety wrote:
>>>>>> On Mon, Apr 19, 2021 at 10:40:53AM +0100, Daniel P. Berrangé wrote:
>>>>>>> On Mon, Apr 19, 2021 at 01:34:47AM +0200, Philippe Mathieu-Daudé
>>>>>>> wrote:
>>>>>>>> Forks run the same jobs than mainstream, which might be overkill.
>>>>>>>> Allow them to easily rebase their custom set, while keeping using
>>>>>>>> the mainstream templates, and ability to pick specific jobs from
>>>>>>>> the mainstream set.
>>>>>>>>
>>>>>>>> To switch to your set, simply add your .gitlab-ci.yml as
>>>>>>>> .gitlab-ci.d/${CI_PROJECT_NAMESPACE}.yml (where
>>>>>>>> CI_PROJECT_NAMESPACE
>>>>>>>> is your gitlab 'namespace', usually username). This file will be
>>>>>>>> used instead of the default mainstream set.
>>>>>>>
>>>>>>> I find this approach undesirable, because AFAICT, it means you have
>>>>>>> to commit this extra file to any of your downstream branches that
>>>>>>> you want this to be used for.  Then you have to be either delete it
>>>>>>> again before sending patches upstream, or tell git-publish to
>>>>>>> exclude the commit that adds this.
>>>>>>>
>>>>>>> IMHO any per-contributor overhead needs to not involve committing
>>>>>>> stuff to their git branches, that isn't intended to go upstream.
>>>>>>
>>>>>> Not just that, ideally, they should also run all the upstream
>>>>>> workloads before
>>>>>> submitting a PR or posting patches because they'd have to respin
>>>>>> because of a
>>>>>> potential failure in upstream pipelines anyway.
>>>>>
>>>>> It's pretty clear that you want to run the full QEMU CI before
>>>>> submitting
>>>>> patches to the QEMU project, but I think we are rather talking
>>>>> about forks
>>>>> here that are meant not meant for immediately contributing to upstream
>>>>> again, like RHEL where we only build the KVM-related targets and
>>>>> certainly
>>>>> do not want to test other things like CPUs that are not capable of
>>>>> KVM, or a
>>>>> branch where Philippe only wants to check his MIPS-related work during
>>>>> development.
>>>>> For contributing patches to upstream, you certainly have to run the
>>>>> full CI,
>>>>> but for other things, it's sometimes really useful to cut down the CI
>>>>> machinery (I'm also doing this in my development branches manually
>>>>> some
>>>>> times to speed up the CI), so I think this series make sense, indeed.
>>>>
>>>> For a downstream like RHEL, I'd just expect them to replace the main
>>>> .gitlab-ci.yml entirely to suit their downstream needs.
>>>
>>> But that still means that we should clean up the main .gitlab-ci.yml
>>> file
>>> anyway, like it is done in this series, to avoid that you always get
>>> conflicts in this big file with your downstream-only modifications.
>>> So at
>>> least up to patch 11 or 12, I think this is a very valuable work that
>>> Philippe is doing here.
>>
>> I don't see a real issue with downstream conflicts. They'll just
>> periodically pick a release to base themselves off and change once
>> every 6 months or more.
> 
> It's not only downstream distros that rebase every 6 month. Like
> Philippe, I'm sometimes hacking my .gitlab-ci.yml of my development
> branch to speed up the CI during my development cycles (i.e. I'm
> removing the jobs that I do not need). And I'm regularly rebasing my
> development branchs. Conflicts in .gitlab-ci.yml are then always
> painful, so a leaner main .gitlab-ci.yml file would be helpful for me,
> too, indeed.

Not sure if following up this thread or start a new one, but I got
blocked again from Gitlab, tagged as a crypto miner for running QEMU
CI...
[1]
https://about.gitlab.com/handbook/support/workflows/investigate_blocked_pipeline.html#trends--high-priority-cases

I pushed 5 different branches to my repository in less than 1h,
kicking 580 jobs [*].

I didn't try to stress Gitlab, it was a simple "one time in the month
rebase unmerged branches, push them before respining on the mailing
list".

I'm considering changing my workflow:
- not push more than 2 branches per hour (I know 3/h works, so choose
  a lower number, as we want to add more tests).
- merge multiple branches locally and push the merged result and
  bisect / re-push on failure
- run less testing
- do not run testing

This sounds counter productive and doesn't scale to a community of
contributors asked to use Gitlab.

So far I don't have better idea than this series.

Who is interested in sending patches to improve our workflow?

Thanks,

Phil.

[*] NB I have 3 extra runners added to my namespace, but it didn't
help, as per [1] I got blocked by reaching an API rate limit.

