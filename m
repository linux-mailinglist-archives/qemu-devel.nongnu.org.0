Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637F3498150
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 14:45:01 +0100 (CET)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBzeW-0003Sh-1L
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 08:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBzbA-0000rF-I5
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 08:41:32 -0500
Received: from [2a00:1450:4864:20::52a] (port=39873
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nBzb8-0007YF-GO
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 08:41:32 -0500
Received: by mail-ed1-x52a.google.com with SMTP id u18so42388017edt.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 05:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cCSb3qFv6JASFxgNFRczME7sd9QhPwNHoIEzx2Vxaj4=;
 b=p4YiBpg2VgavK2DAEHGx7qRIK16d5fTVa4veU/gDK9AeGD/LeHc47/z47uxAABfqAZ
 uqYUSKmNr8sutxoPrwKw+MeHFooxMQIXvy8WMfC6GztTPJiio+bnl8Qxuquie7Ahq1nw
 7Y1BFfk8Wxv07trBIm1vkMKbHRUJ7Mw8VDK9UT8uP0+tDJRJ2soq8jQjS3AmerBpeJbv
 9BR7zjMjZdfUbnNPeUqX+JnK0Wd6VNNl5yM5YUqfs96E+NDqEa6mjXN3cj7DsPMb+4p2
 1I1MNk3acb29DqQ7hKrPDJjab3eZd3Rb2IK5q6PSLgZ62nQh61eUBt7hWBop5+QQLgg5
 aLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cCSb3qFv6JASFxgNFRczME7sd9QhPwNHoIEzx2Vxaj4=;
 b=sYzBjCkHxgAyT4ek0yYyQv/BC+uCL2+1zjtgAKNEeD4/8v7Zbfu7ya4hWT9BRczs+D
 T7WIf5jCtRuYoU6Nh9v8B2iPjbmrRXqw2LglX7dqQNMbqokVcIjO6bYxHgJyr3K+e7Xn
 FKaf5ls4ZOAjc885M8Is1m3gvgjCbz8ol9NlOViHF9YwlzL14TjX2MsnDk6XLlSVm6yD
 MyMsP+wNTZYGJkcKPRCGWlVp0UtWbKl3o6bXdRPFon+F2zlSnxZkVhgm2hDykkuzuAXZ
 ieUWPI33Wgip4I7tkHsCI81SJETWB0mwT5E5g4/AeemzyUW3mMnNHsrF96b9vlx2qITH
 okHA==
X-Gm-Message-State: AOAM533GUEPKL9gcomw8Tr3OrWY6AjyCu0b+om5O6W5HsoqYJsADsAFJ
 i99dwc2AgsIznAY7prEfdqg=
X-Google-Smtp-Source: ABdhPJxrg6fr9vMjz+/ckCIJOuyIYwySHuWljxt2zGzcgg48v9kLS3vAlkd0jfJfU2pXA0DXw08tcw==
X-Received: by 2002:a05:6402:42d3:: with SMTP id
 i19mr13922855edc.52.1643031683385; 
 Mon, 24 Jan 2022 05:41:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 my25sm4947723ejc.100.2022.01.24.05.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 05:41:22 -0800 (PST)
Message-ID: <567b658e-7283-769c-8c05-720b8546e34e@redhat.com>
Date: Mon, 24 Jan 2022 14:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] meson: Use find_program() to resolve the entitlement.sh
 script
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220122002052.83745-1-f4bug@amsat.org>
 <b7c904ac-5246-79b8-bcc7-5b7a377e0d52@linaro.org>
 <CAMVc7JXYAPLpiCO1CCKAcsSi7p9tj8nQJOB=usaMOvELUX31AA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMVc7JXYAPLpiCO1CCKAcsSi7p9tj8nQJOB=usaMOvELUX31AA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 10:04, Akihiko Odaki wrote:
> On Mon, Jan 24, 2022 at 5:16 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 1/22/22 11:20 AM, Philippe Mathieu-Daudé via wrote:
>>> Using ../configure without any particular option generates 31 targets
>>> on Darwin, and meson search for the entitlement.sh script 31 times:
>>>
>>>     Program nm found: YES
>>>     Program scripts/undefsym.py found: YES (/opt/homebrew/opt/python@3.9/bin/python3.9 /Code/qemu/scripts/undefsym.py)
>>>     Program scripts/feature_to_c.sh found: YES (/bin/sh /Code/qemu/scripts/feature_to_c.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Program scripts/entitlement.sh found: YES (/Code/qemu/scripts/entitlement.sh)
>>>     Configuring 50-edk2-i386-secure.json using configuration
>>>     Configuring 50-edk2-x86_64-secure.json using configuration
>>>
>>> Use find_program() which seems to cache the script path once found.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>>> ---
>>>    meson.build | 9 +++------
>>>    1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> r~
> 
> Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> 

Queued, thanks.

