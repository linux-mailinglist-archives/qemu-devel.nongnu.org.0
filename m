Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED63DA6FE
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 17:01:26 +0200 (CEST)
Received: from localhost ([::1]:45556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m97XJ-0006TB-JQ
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 11:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m97Vp-0005hf-5K
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:59:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m97Vn-0005e2-Ht
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:59:52 -0400
Received: by mail-wr1-x435.google.com with SMTP id n12so7350552wrr.2
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dsWvhip2KhqItxIqo9ad63O6C0K/O65FScFfvHKJYjE=;
 b=N52mqsvVWjaDbFiLkVU8ivMQNeuh4IlAJQxzE/ZYAJDPsAqcGMYwvcj5YqNg5/v1Uy
 bYmZ7gct3P0qCwH61Mq2dTGi9diGx1SKQFFlT2SVFK4poUnDPRYW3LtPkXacgv7KLeCk
 iBClusljT+sWQS0seiHLiPSRtX3rLtzeUWtK1TDluDI6f96NMhHcSlOtoI90F0eviz9h
 gQM1gVs3elUqdmPLGYS0/FF/1JVvWKcsZQVpUZaXCe/m+kcdapZRr7JkzczG5NNaVjD7
 /TWYYBeQZSrirmE+3yHOkb/D3PehCLEBGzCS/pdrVa8pONZ1ZzSjwLCLOBjoFKF0+una
 wq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dsWvhip2KhqItxIqo9ad63O6C0K/O65FScFfvHKJYjE=;
 b=AMlz3V8JjePShTJdK+oEQNEs6XkR/6okPO5JJR0Mlg8eQ/2T76mJ390dUivxUnzKY7
 aCB5H26hc7s6VKj6oMCtFfMICMLmwsGJ5sRZufGQPZ5yfgfihX5fbzXMcsv5nvytwFw1
 zT/neCxJXHkSJfLlx4uPA/TkwqYgFD8jjJjc2V8ITk+OZCGx63Ully45lux8WdAn4cbV
 TJ6IpRGbyb80mI+vRvd38EdcBH4qD8zrU+xiRB/CLY19+EEE6tapSpuHYLvBuAxxvgV2
 tEcCEuDuGyp3VoRqKIhStElnIvjs/i4hNSJ0L6NEftQ0+40HWQj9QzfOVT+boTwHlXBI
 soxQ==
X-Gm-Message-State: AOAM533ICJwfyyoatrlEAVQqbtsT8m7Lhik+0wzIOJTGEcyKfaRQ8SbU
 mp28lNmhtYKt5ZoaWLvq5OQ=
X-Google-Smtp-Source: ABdhPJyUMMLEALr2AG9XENEAjEaPCDZIM15BEvW3RQWRzJa/OsLLIBbEZ/IJIWYtRGcahRpwo3fKcg==
X-Received: by 2002:a5d:49c8:: with SMTP id t8mr5316150wrs.365.1627570789672; 
 Thu, 29 Jul 2021 07:59:49 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h16sm3723118wre.52.2021.07.29.07.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 07:59:49 -0700 (PDT)
Subject: Re: modular tcg
To: Claudio Fontana <cfontana@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <f264970b-b12c-4e36-548f-d2411c7e3842@suse.de>
 <20210729102955.k34jqpetqy6owivr@sirius.home.kraxel.org>
 <75a7378d-63b2-d1d7-c7e1-ca4d13cf01cb@suse.de>
 <6514e353-fca6-98a7-cb35-46a90c37389b@amsat.org>
 <71567414-d0e3-8f5b-d4d3-b34caa8c1f59@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fdd11497-f802-fd37-0ede-347f6fc97263@amsat.org>
Date: Thu, 29 Jul 2021 16:59:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <71567414-d0e3-8f5b-d4d3-b34caa8c1f59@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.125,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 4:22 PM, Claudio Fontana wrote:
> On 7/29/21 1:34 PM, Philippe Mathieu-Daudé wrote:
>> On 7/29/21 12:44 PM, Claudio Fontana wrote:
>>> On 7/29/21 12:29 PM, Gerd Hoffmann wrote:
>>>>   Hi,
>>>>
>>>>> And another comment: I think we should have some progress on ARM with
>>>>> the kvm/tcg split and with the KConfig of boards, before we continue
>>>>> here.
>>>>
>>>> Why?  This can easily be tacked in parallel.  We can flip the switch
>>>> for modular tcg per target in meson.build.
>>>>
>>>> take care,
>>>>   Gerd
>>>>
>>>
>>> Because in the end we need to do this for ARM too and for the other archs too (s390 is already ok),
>>>
>>> and in order to be sure not to end up in a dead-end, I think it would be good to have at least a sketch for the other archs as well..
>>>
>>> Just my 2c ofc, I think really here still ARM is behind, and we should help it catch up.
>>>
>>> If I had more time I would have pushed more on the ARM series, but.. yeah.
>>
>> IIUC Alex is waiting 6.2 release to respin.
>>
> 
> How does the Kconfig for ARM improvements go? I mean I think those improvements (enabling only compatible boards with the chosen accelerators) are important for both tcg-kvm split and possibly for modularization of ARM accelerators too right?

I think we all (Alex/you/me) reached the same point where builds work
but current the testing framework isn't ready for non-TCG or
modularized-TCG so the CI ends failing.

I don't want to push for 'CI build-only' because most of the annoying
problems were from runtime (interfaces not resolved, ... which are
important when using modules or board with unavailable devices).

I tried to address that with a QMP command to query accelerators but
there is a disagreement whether we should query for available/built-in/
loaded/modularized-but-not-installed/...). At this point I think I
fairly understand the technical problems but misunderstand the big
picture here, in particular w.r.t. management apps. I spent too many
time on this to appear enthusiastic, sorry.

