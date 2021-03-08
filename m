Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7A6330FD3
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 14:47:08 +0100 (CET)
Received: from localhost ([::1]:57720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGDz-0002vm-Fw
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 08:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJG1V-0007ce-8X
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:34:13 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJG1S-0001kb-QI
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:34:12 -0500
Received: by mail-ej1-x631.google.com with SMTP id dx17so20435713ejb.2
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2GMxVklie4vmHIPQCvWWOhONMn+AEDnZu+IiqlNnhII=;
 b=BBac93dtKc+MpEGziPZ6iAWPvTwC1KgqTKurIMQwY1py4GD3h4bZWQRvoUYPX6mwSz
 aeuQaIefyMFsZpuacqRQ4idQwgRj+AXlTSIr5+doY0gvmx4Rb+5Mnwifwy+LnuFykBF5
 GQk2X5jV51ZeNRV0guplM2zPxxkBNLIJSDIZljsnNRUvj0bFI0Fbd7cTY8by1pqhFojn
 dZ7CvmGBJsTMT1i4S46VfUwDR9N5ooKPuL+zIKiNvQFmMNCeVc7TBTw/yk0faDKS6lng
 8n2V2foMq010yee/Wv85hlFRL6zW4oZ/IqProdGOP/wlgmw1VWn/9dz+uc2jy7Mhb7I4
 T4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2GMxVklie4vmHIPQCvWWOhONMn+AEDnZu+IiqlNnhII=;
 b=G67AuyUh56NO4Ja80P3pHehk8tNNYWtSfAImm0cySusjwoIDTNVjyRAyxV7RvZxpjI
 ybDNrzZgxJ8Sgd/ZO74ZzffKc7jzUHPS13UNE6FSz9w1XPfeC5BJLojNrH3FPWHQPmKD
 L7R9dO56rG9gFbkrcLRYTMauWEhw44cyi+qVNgtBG4zLb9wubByF8zfB3JdE9+tGNkeM
 EcdaRX8xW7l6q6xekN3pgtk/9xJNC0Y4YRjGawqFPR5hM61DPlMe9KtasEk22C7+xJKT
 u8c/azpRYxAgA1oaaKHcjEW84YpxpDJPVmancrPdWOUwAWfDP7TGURPprbGi49K726u2
 OUNg==
X-Gm-Message-State: AOAM533YXevX7leH89wO9ZD+8DEp61ZV/ZIf4P81GmukkeHKoZtyzLzZ
 8YyjFnl4q3ZjlNcJ7foIYQI=
X-Google-Smtp-Source: ABdhPJz6+PR/tJsslXlRlFbWU4fHQDm2QNpqDNhgB78N2286v51vrYhDMO9NyMaTevZF2/gdFONaQg==
X-Received: by 2002:a17:906:ae96:: with SMTP id
 md22mr14523237ejb.409.1615210448595; 
 Mon, 08 Mar 2021 05:34:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y12sm6778319ejb.104.2021.03.08.05.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 05:34:08 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Merge the Gitlab-CI section into the generic
 CI section
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20210307113403.11028-1-thuth@redhat.com>
 <878s6xam83.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d451b382-c5dc-2346-a463-e95e48f205e4@amsat.org>
Date: Mon, 8 Mar 2021 14:34:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <878s6xam83.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On 3/8/21 12:57 PM, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> The status of the gitlab-CI files is currently somewhat confusing, and
>> it is often not quite clear whether a patch should go via my tree or
>> via the testing tree of Alex. That situation has grown historically...
>> Initially, I was the only one using the gitlab-CI, just for my private
>> repository there. But in the course of time, the gitlab-CI switched to
>> use the containers from tests/docker/ (which is not part of the gitlab-CI
>> section in the MAINTAINERS file), and QEMU now even switched to gitlab.com
>> completely for the repository and will soon use it as its gating CI, too.
>> So it makes way more sense if the gitlab-ci.yml files belong to the people
>> who are owning the qemu-project on gitlab.com and take care of the gitlab
>> CI there. Thus let's merge the gitlab-ci section into the common "test and
>> build automation" section,
> 
> I have no problem with this, might as well keep it all together.
> 
>> and change the status of myself to a "reviewer"
>> there instead.
> 
> Can we not have multiple maintainers? Considering how important keeping
> the testing green should be wouldn't it help to keep the bus factor
> lower (not to mention holidays/breaks and just plain busy with other
> things periods). It shouldn't be to hard to track as long as we mention
> when we queue things to our trees?

I'm OK to be listed as backup maintainer as I do have a genuine
interest in CI/testing. It will be in my scarcer personal time
although, so better if another maintainers with more resources
could pop up along instead.

>> While we're at it, I'm also removing the line with Fam there for now,
>> since he was hardly active during the last years in this area anymore.
>> If he ever gets more time for this part again in the future, we surely
>> can add the line back again.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  MAINTAINERS | 19 ++++++-------------
>>  1 file changed, 6 insertions(+), 13 deletions(-)

