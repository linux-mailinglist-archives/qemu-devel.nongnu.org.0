Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43DA38C688
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 14:30:46 +0200 (CEST)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4If-0000JD-Vz
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 08:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lk4Fb-0007IS-O9
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:27:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lk4FZ-000331-Qw
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:27:35 -0400
Received: by mail-wr1-x42b.google.com with SMTP id n2so20981985wrm.0
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 05:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xqEnTrUlATUn+b5CpPqklH+e8IKQzrPT3fz15+sB8R0=;
 b=bcGf6mR2kBSlIq9BNDIzdnQu60i7KNtRWQgRu6Z/apiyfI4WmGrgd7+dNlcU6Y9MeH
 ClTF308aX7Jt0RMheuoCddL0GWQKtwpbb7sVU/Br/oGc5UTFb3JsWneNbtQR9LeNEPzU
 Ojs+0PcqHRkFOYprlS4XKATWCxkQF2kxPfaYKcK5Mf42bdygARuWbSpLofkGIyke5Rpg
 g2eHCfHHcaLu9RZJfwZUm9PhVjY2VRa3VC4EWnih66rvefc4f8+ODhrGG6uIEvWDjqpb
 QEbyaz1VypjDwVGl8fzXZ+6ux47JQbLkvDyX5a0c5H+SmRwsz58PA+G8FpkBSXhmt2GX
 IQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xqEnTrUlATUn+b5CpPqklH+e8IKQzrPT3fz15+sB8R0=;
 b=rZslJOrwxcfDyJMwCPoqkulqNhKuo/iP1UliCqjQgkqXFGFMBN+ERBOxctJrJXQHQY
 oJEEQNBTrfYaXH/+PltBVf+dF5JXN1w5u0AVvY4se7A1T/rWLP4ZLrnwDIJwmt41qM1T
 qJjpKcO0v+XpIbEks5k5BqE++d+gTDu6FVVQHj+xUFOGW5JL7aEydDQiGrVwtghXG8Pb
 aYmKeyAsd7/9mwMeRd7mp2e4rh9PMmy3plc28NzDQlX6ieUudk8vSuupfGTe+wrDJEOn
 U9QYQwkHjVePvkHEAO5COhoCKt2acz3bpUeimzBaIrxLVPaCMrpaPvZZUxDaeuHsCZ7F
 S5ZA==
X-Gm-Message-State: AOAM533pgAGwQ0XlwNVnX0bw61TKl4xX0Q9LoZrmBhFNLji3SSS2oKqc
 +MkyP7SmPFlXDuealCu2afc=
X-Google-Smtp-Source: ABdhPJwfMGalonVPiyuiJoodxn0puwyeRSk5YdLuUGklhS+nQIeEJP1cyMjiYJ0gQB2XMuyCUuWIpA==
X-Received: by 2002:adf:d234:: with SMTP id k20mr7985105wrh.82.1621600048569; 
 Fri, 21 May 2021 05:27:28 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r5sm6837733wmh.23.2021.05.21.05.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 05:27:27 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
 <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
 <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
 <396e75d2-fe22-3054-fbee-d6de02339b2a@redhat.com>
 <YKeQkqviHbxqcC6Y@redhat.com>
 <afa421f3-337a-c488-c767-b73aaf3780b8@redhat.com>
 <YKefRcVrr9Gtehlk@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c7f01111-bada-49b1-ebce-03e6eff96aae@amsat.org>
Date: Fri, 21 May 2021 14:27:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKefRcVrr9Gtehlk@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/21/21 1:53 PM, Daniel P. Berrangé wrote:
> On Fri, May 21, 2021 at 01:02:51PM +0200, Thomas Huth wrote:
>> On 21/05/2021 12.50, Daniel P. Berrangé wrote:
>>> On Fri, May 21, 2021 at 12:48:21PM +0200, Thomas Huth wrote:
>>>> On 20/05/2021 13.27, Philippe Mathieu-Daudé wrote:
>>>>> +Stefan/Daniel
>>>>>
>>>>> On 5/20/21 10:02 AM, Thomas Huth wrote:
>>>>>> On 19/05/2021 20.45, Philippe Mathieu-Daudé wrote:
>>>>>>> If a runner has ccache installed, use it and display statistics
>>>>>>> at the end of the build.
>>>>>>>
>>>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>>> ---
>>>>>>>     .gitlab-ci.d/buildtest-template.yml | 5 +++++
>>>>>>>     1 file changed, 5 insertions(+)
>>>>>>>
>>>>>>> diff --git a/.gitlab-ci.d/buildtest-template.yml
>>>>>>> b/.gitlab-ci.d/buildtest-template.yml
>>>>>>> index f284d7a0eec..a625c697d3b 100644
>>>>>>> --- a/.gitlab-ci.d/buildtest-template.yml
>>>>>>> +++ b/.gitlab-ci.d/buildtest-template.yml
>>>>>>> @@ -6,13 +6,18 @@
>>>>>>>           then
>>>>>>>             JOBS=$(sysctl -n hw.ncpu)
>>>>>>>             MAKE=gmake
>>>>>>> +        PATH=/usr/local/libexec/ccache:$PATH
>>>>>>>             ;
>>>>>>>           else
>>>>>>>             JOBS=$(expr $(nproc) + 1)
>>>>>>>             MAKE=make
>>>>>>> +        PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
>>>>>>
>>>>>> That does not make sense for the shared runners yet. We first need
>>>>>> something to enable the caching there - see my series "Use ccache in the
>>>>>> gitlab-CI" from April (which is currently stalled unfortunately).
>>>>>
>>>>> TL;DR: I don't think we should restrict our templates to shared runners.
>>>>
>>>> I'm certainly not voting for restricting ourselves to only use shared
>>>> runners here - but my concern is that this actually *slows* down the shared
>>>> runners even more! (sorry, I should have elaborated on that in my previous
>>>> mail already)
>>>>
>>>> When I was experimenting with ccache in the shared runners, I saw that the
>>>> jobs are running even slower with ccache enabled as long as the cache is not
>>>> populated yet. You only get a speedup afterwards. So if you add this now
>>>> without also adding the possibility to store the cache persistently, the
>>>> shared runners will try to populate the cache each time just to throw away
>>>> the results afterwards again. Thus all the shared runners only get slower
>>>> without any real benefit here.
>>>>
>>>> Thus we either need to get ccache working properly for the shared runners
>>>> first, or you have to think of a different way of enabling ccache for the
>>>> non-shared runners, so that it does not affect the shared runners
>>>> negatively.
>>>
>>> Is there anything functional holding up your previous full cccache support
>>> series from last month ? Or is it just lack of reviews ?
>>
>> It's basically the problems mentioned in the cover letter and Stefan's
>> comment here:
>>
>>  https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02219.html
> 
> I'm not sure I understand why Stefan thinks gitlab's caching doesn't
> benefit ccache. We add ccache for libvirt GitLab CI, and AFAIR it
> sped up our builds significantly.

I think Stefan is referring to a comment I made, when using both
shared runners and dedicated runners (what I'm currently testing)
various jobs are stuck transferring artifacts/cache {FROM, TO}
{shared, dedicated} runners at the same time, which is sub-optimal
because it saturate the dedicated runner network link.

If we want to use pool of runners to restrict transfer between
runners from the same physical pool, then it because a maintenance
headache.

