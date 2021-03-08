Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DF33169E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:51:37 +0100 (CET)
Received: from localhost ([::1]:39596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKye-0006XK-5p
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJK3L-0003l7-45
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:52:23 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJK3J-0006mp-3h
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:52:22 -0500
Received: by mail-ej1-x636.google.com with SMTP id mj10so22111331ejb.5
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CSR+RofT0Ct3BEUPKdnvi4db5uf53x6vobQd1CVXkis=;
 b=XVYEwWxzko+nxprRahLoeLdMVebLJEK7hoOkPTmj4Bb8/x2a7NUtQyOyfP2I6N4zLG
 b/UAAAW0fhJcoECSsRPdLTLuLEDolyw1swZr2wauk6qObRNavwAgcqTLc8xAskWJQHch
 EK9F1tF99uUrs+i+gm8BXYb9V92oqhxJ8WNvYioDmoSlZGR8I+RGZOQDMV0lyP3ALgHg
 FpYduhaP4ZuHzXEmpP3ZChEOQz+4LW6Z6K3gdXkMkzYEi4rNHvNkRRpIDradcbsF61Ec
 YjwLIxpJGek18HNUs0YsoUXIH/3iHxVj35LE/M08SRTxpHkS4DfP3+hMUkMdvHOc0N/I
 q6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CSR+RofT0Ct3BEUPKdnvi4db5uf53x6vobQd1CVXkis=;
 b=tYkYp/BuesmS/JfdZcjW1eOblYD0O1QHP2OuSNqATRvZCQ6t3m0W1v1YwTKudcqbAQ
 zq4LW882ZjfSdPE18+36kAWCbEQUOrMAPcoYJtayRnpvJWPJ2dzW7ER6j5jSbF8r5mKL
 IR417UUeht+XsE4lWa6dO2McF7oTKf4fiugyYshOretFdxklDTCbmQ5qVno94I9z+6gp
 07Xavf5v2CEQKZnffE4n0beinH56pKHBOl15/H23lm0+vHT7BW+RJLZH7kfNobEO+GV2
 UWbj7R4+C4r0GmvPHrQDi9QinpNu195gRTA3eyCRv3CpWSMs0SrIUDNKTQHOUEP9PrCy
 RweA==
X-Gm-Message-State: AOAM532MKxXHoiNudHexVGpMy0AFcxsF3vXnkbEP1wHvA7OP1oVt2kXi
 wtqQEW8zIHcuBJ7BB0NotdE=
X-Google-Smtp-Source: ABdhPJzkw3VpXfKGP+PytXlPSP9wx+4CQrw79qgYNGSS5MoE1RWnXN1IxdpG3hhbfc5xnrW+sQVnSQ==
X-Received: by 2002:a17:906:f02:: with SMTP id
 z2mr16321610eji.469.1615225939225; 
 Mon, 08 Mar 2021 09:52:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u16sm7733522edq.4.2021.03.08.09.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 09:52:18 -0800 (PST)
Subject: Re: [PATCH v2] MAINTAINERS: Merge the Gitlab-CI section into the
 generic CI section
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210308154633.158915-1-thuth@redhat.com>
 <78fb219e-fba5-0dfc-b21e-0cc657a9c372@amsat.org>
 <8532b756-f53c-e606-b900-6dc77527fd71@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <508bacf5-0c3e-9817-4514-93f0452c619b@amsat.org>
Date: Mon, 8 Mar 2021 18:52:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8532b756-f53c-e606-b900-6dc77527fd71@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x636.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 6:01 PM, Thomas Huth wrote:
> On 08/03/2021 17.35, Philippe Mathieu-Daudé wrote:
>> On 3/8/21 4:46 PM, Thomas Huth wrote:
>>> The status of the gitlab-CI files is currently somewhat confusing, and
>>> it is often not quite clear whether a patch should go via my tree or
>>> via the testing tree of Alex. That situation has grown historically...
>>> Initially, I was the only one using the gitlab-CI, just for my private
>>> repository there. But in the course of time, the gitlab-CI switched to
>>> use the containers from tests/docker/ (which is not part of the
>>> gitlab-CI
>>> section in the MAINTAINERS file), and QEMU now even switched to
>>> gitlab.com
>>> completely for the repository and will soon use it as its gating CI,
>>> too,
>>> so it makes way more sense if the gitlab-ci.yml files belong to the
>>> people
>>> who are owning the qemu-project on gitlab.com and take care of the
>>> gitlab
>>> CI there. Thus let's merge the gitlab-ci section into the common
>>> "test and
>>> build automation" section.
>>>
>>> While we're at it, I'm also removing the line with Fam there for now,
>>> since he was hardly active during the last years in this area anymore.
>>> If he ever gets more time for this part again in the future, we surely
>>> can add the line back again.
>>>
>>> Now to avoid that Alex is listed here alone, Philippe and I agreed to
>>> help as backup maintainers here, too.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   v2: Keep Philippe and myself as maintainer instead of reviewer
>>>
>>>   MAINTAINERS | 21 +++++++--------------
>>>   1 file changed, 7 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 26c9454823..5c4c179abb 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -3262,17 +3262,21 @@ F: include/hw/remote/iohub.h
>>>     Build and test automation
>>>   -------------------------
>>> -Build and test automation
>>> +Build and test automation, Linux Continuous Integration
>>
>> I'd rather not limit it to Linux hosts...
>>
>>>   M: Alex Bennée <alex.bennee@linaro.org>
>>> -M: Fam Zheng <fam@euphon.net>
>>
>> I'm not sure about Fam removal, he is the one maintaining patchew
>> (see [*] below)... Maybe we need an Ack from Paolo?
> 
> We could split the Patchew part into a separate section... OTOH, there
> are no patchew related files in the main git repo anyway that we track
> in the MAINTAINERS file, so maybe it makes more sense to simply remove
> that line? (Patchew admins are already mentioned here:
> https://wiki.qemu.org/AdminContacts )

Also here:
https://wiki.qemu.org/Testing/CI

So it makes sense to me to remove the patchew line.

