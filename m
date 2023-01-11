Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0B3665C45
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:17:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFax6-0001Yf-CX; Wed, 11 Jan 2023 08:15:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFawu-0001XX-Al
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:15:24 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFaws-0000k0-1X
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:15:23 -0500
Received: by mail-wr1-x433.google.com with SMTP id k8so485329wrc.9
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 05:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qU/C7wn9xdtZS3vCc5UpYLK56R9uHLUvOsbu/Fl0fgM=;
 b=Q2LGj1ctbkcaV8zkvnac1n25tgoE+3P869NwNNc/P5m4vD1pLGBM1HsQ2sg3JwywO3
 kejGdb6hLXu+lc5BVeDRsWCT9QHQpDTCfwiNISUbzcD9TldUCMQ1FIMe11XJiTXNK4Vb
 CkEnAmxMeR8fsF7nCULRy+efxRLra/B8fs5GRvlk1wHVCJy7+U68iGA01Gwlmvoba9pb
 b0JsIzby918IiPTvddjAkthbGTlBtBVw8TI8jPdG0CzVGDss/o4MbsoopeLozCSM3Kex
 PqOBZqib/p3xuxzhbDRzHpl1wZqBU82/KXLjW1bddzp5GUimYgSr6U4bE1+ldWBSTg+Y
 ESfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qU/C7wn9xdtZS3vCc5UpYLK56R9uHLUvOsbu/Fl0fgM=;
 b=MaSLcwHhE/eF5HhQ0BpyFoPCrvk4mKo/1aPZl6H3jFM3OJNRiMRSA4TUprtrseXKyb
 AwL5n/D17LPP0ul7QoYxWDiIbjFPtwKER1UHETaeD3bzcOsCn1dIsufEaQ07oTta/H4d
 owOY8JnNz5RQ1hr9XRTIYYEH3XvIPqzui4TyEcNZmUJsD9eBJqxwSZg7layPhAnCGBic
 Vw6RJN2VRH6EdmdEFv8mWxAKK9doRDgpu+TmKoTQOKEZCWNfd9EU0WuCvKXYfALFVkqv
 NT52i4xx43uieW3XlFIdnf/TXZyMGhwMt02YaobPpnBM+2EMWC78YJHwOQNJZhSpaFoQ
 ye4Q==
X-Gm-Message-State: AFqh2kpX6Qm6PZyyN5toGqcG9Oygwj8G+NB/H5Cj5FMln2w0O+fmeds5
 bA4UFHHazfIkP5MtduocPm9eDw==
X-Google-Smtp-Source: AMrXdXuVnDM5rIvHyKl1K3E2RAa6jlPoYR82CLmu7i0bOEQ1vZfg4QVdqLfGTJD/XLeu1ASU/+xLVQ==
X-Received: by 2002:a05:6000:10d2:b0:299:4e2f:fca6 with SMTP id
 b18-20020a05600010d200b002994e2ffca6mr21548794wrx.58.1673442919343; 
 Wed, 11 Jan 2023 05:15:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm3493049wrm.78.2023.01.11.05.15.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 05:15:18 -0800 (PST)
Message-ID: <800755e2-82f8-b1e5-6b61-d4766f97641e@linaro.org>
Date: Wed, 11 Jan 2023 14:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 0/4] qom: Introduce object_class_property_deprecate()
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20230109225419.22621-1-philmd@linaro.org>
 <Y71h8JAqYxeB2hPe@redhat.com>
 <53028cf2-0028-b810-348f-b17df33a8149@linaro.org>
 <Y76IdVNKyIBAZLrl@redhat.com>
 <9a3d8a73-9d41-8cb6-e271-7753347f238d@linaro.org>
 <Y76PlQWd0PCvC7RS@redhat.com> <871qo1gvhd.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <871qo1gvhd.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/1/23 12:29, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Wed, Jan 11, 2023 at 11:08:05AM +0100, Philippe Mathieu-Daudé wrote:
>>> On 11/1/23 10:59, Daniel P. Berrangé wrote:
>>>> On Wed, Jan 11, 2023 at 10:55:47AM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 10/1/23 14:02, Kevin Wolf wrote:
>>>>>> Am 09.01.2023 um 23:54 hat Philippe Mathieu-Daudé geschrieben:
>>>>>>> Hi,
>>>>>>>
>>>>>>> There will always be a need to deprecate things. Here I'm
>>>>>>> tackling the QOM (class) properties, since they can be set
>>>>>>> from some CLI options (-object -device -global ...).
>>>>>>>
>>>>>>> As an experiment, we add object_class_property_deprecate()
>>>>>>> to register a class property as deprecated (since some version),
>>>>>>> then we deprecate the TYPE_PFLASH_CFI02 'width' property, and
>>>>>>> finally as a bonus we emit a warning when the deprecation period
>>>>>>> is over, as a reminder. (For that we introduce few 'versions'
>>>>>>> helpers).
>>>>>>
>>>>>> The last part means that increasing the version number (i.e. the commit
>>>>>> that opens the development tree for the next release) can change the
>>>>>> output, and this is turn can break test cases.
>>>>>>
>>>>>> If we are happy to introduce breakage with a version number change that
>>>>>> will require future commits to open the development tree less trivial
>>>>>> than they are today because they need to fix the breakage, too, why not
>>>>>> make it a build error instead of a different warning message at runtime?
>>>>>
>>>>> To avoid build breakages, maybe it is clever is to store the deprecation
>>>>> version in ObjectPropertyInfo and let QAPI inspection scripts enumerate
>>>>> / report deprecated features?
>>>>
>>>> I don't think we want the version information in the code nor
>>>> introspectable at all.
>>>>
>>>> We want applications to only apply logic based off features that are
>>>> actually available, not predicted future versions where something may
>>>> or may not be removed. This is why we exposed only a plain 'deprecated'
>>>> boolean field in QAPI schema for other deprecations.  This is just a
>>>> warning to be ready for something to change in future. If an application
>>>> has not been updated they are fine to carry on using the deprecated
>>>> feature. If an application has been updated, they should probe for
>>>> existance of the new feature and use that if available, in preference
>>>> to the deprecated feature. There's no reason for an application to
>>>> consider version numbers.
>>>
>>> Right, but "applications" can also be developer scripts right? Not
>>> only user / sysadmin.
>>>
>>> In particular, some HMP commands are only useful for developers, and
>>> they are implemented over QMP -> QAPI. So we already expose extra
>>> developer information via QAPI.
>>
>> Sure, but I still don't think we should expose any version info there.
>> A deprecated feature isn't gone until it is gone. In the deprecations
>> doc we only mention the release where it is first deprecated, don't
>> explicitly state when it will be removed. The 2 cycle timeframe is
>> a minimum, not an exact removal date, so it would be misleading to
>> claim we'll remove things in exactly 2 cycles.
> 
> I agree with Daniel.
> 
> I understand the motivation for making developers aware of expired grace
> periods.
> 
> A warning is one way to make aware.  It creates another problem, though:
> since the grace period is flexible, we need a way to extend the period,
> and we need to decide right at the beginning of the development cycle.
> 
> I think the existing process for getting rid of deprecated stuff in a
> timely manner is good enough: document all deprecations in
> docs/about/deprecated.rst, and check the file periodically.
> 
> I'd recommend to follow QAPI's lead and add a "deprecated" flag to QOM.
> 
> We may want to follow QAPI some more and add an "unstable" flag, too.
> See commit a3c45b3e62 'qapi: New special feature flag "unstable"' for
> rationale.

I understand breaking the build system is not a welcomed idea and that
the deprecation grace period can be flexible.

I don't understand why storing version information isn't helpful, as
I'd like to run some ./qapi-dump-deprecated-stuff script at least once
between releases, and being able to display this info directly seems
simpler than going to match in deprecated.rst.

But overall the discussion was enlightening, so thanks!

Phil.

