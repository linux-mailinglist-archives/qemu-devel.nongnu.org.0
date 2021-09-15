Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8040C20C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 10:53:11 +0200 (CEST)
Received: from localhost ([::1]:55274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQfG-0007zk-8Q
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 04:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQQeA-000777-Fl; Wed, 15 Sep 2021 04:52:02 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQQe8-0002jy-3U; Wed, 15 Sep 2021 04:52:02 -0400
Received: by mail-wm1-x32f.google.com with SMTP id e26so1534034wmk.2;
 Wed, 15 Sep 2021 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RyvysqWVtjp2lByu0gUlF/jmURsLmVfpSoNq9WFejBQ=;
 b=ZmiqgbbTjpBetsY8Rt6aZ7T1fZdXMlzzGt0e1qxYFyt0oxxMqTznp80XwLys/resV4
 hiIY4Xq3Sf/cBuoVFXxWDwbQkZXVS9RL8kgYh+C2zNWnn3bEg6fkN3gZz76srlCX76Ml
 ECQqOcx3UKYz3lY8gU6up29gtgxABdW3H1CWG7ynuWOL0seHT/D4/z/JE5/jXskAZn5J
 8lWSn5GCSnf1vez2db8gjRWIhSw8iGgllP204GG620jlE7A3dRmgfGKcPAwtIfMHtGE/
 Zz1rHlDx7vDUvhDhjLH1yoCF4w1X8jvLuFNmrbZeVJPgpnBmeOsuTKDAVnCVIA9Rl213
 oafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RyvysqWVtjp2lByu0gUlF/jmURsLmVfpSoNq9WFejBQ=;
 b=Oe7jHFElgHSh6Uf1PSF76GndObdeFovDEULfgN3sAAyHo5Xgt4bQbbuQgIxWaPMrWh
 kOGdT7wTJeHx2SNc6Xaujtjh1m3/NynXNvbpF5/O8kKymxlFsrmlvOlZT0ntkUvZgKiW
 5E7CnAt2duo7+PgxLAiAwp9pm4U5x8i1gNuRS2X3Yi498lZ3vTMJ6nl5IAtPiCReekQ4
 7TpeQngB3G6BoaBfffffSW4eVt5fJYR4ROc2pGE8I6tMwrRDXLXPQOxvGmmGkS/lK7rL
 L1Amk9Xa1AIZWgkt4bhuWlUxRKa7aEppvmANUii4VXx0UphmxgcSvpcl5u9+lwzimwXN
 Pocg==
X-Gm-Message-State: AOAM53175k95M2mSSfWc9jPbOte0UodjXjsB8YOBYXSrc0Giqnl7slkN
 s1MTP2lpZ9AHlJtkud7JJBc=
X-Google-Smtp-Source: ABdhPJzE3VME2t4v0T5MmUGj4eo3A7qDSopDvVUoUl+9n5PDV+wethHm/nyRCIf3s9ntUavAZzLYvw==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr3054972wmh.165.1631695918023; 
 Wed, 15 Sep 2021 01:51:58 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id c7sm3759781wmq.13.2021.09.15.01.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 01:51:57 -0700 (PDT)
Subject: Re: Deprecate 32-bit hosts? (was: Re: [PULL 14/14] hw/arm/aspeed: Add
 Fuji machine type)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
 <ee5d379f-a792-aae1-370a-b5f21582ae58@redhat.com>
 <YUGw1v20jNRxq2zH@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a7a8ee29-cfc5-fec4-30fc-761df76107da@amsat.org>
Date: Wed, 15 Sep 2021 10:51:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUGw1v20jNRxq2zH@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Jeffery <andrew@aj.id.au>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Peter Delevoryas <pdel@fb.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 10:37 AM, Daniel P. Berrangé wrote:
> On Wed, Sep 15, 2021 at 09:42:48AM +0200, Thomas Huth wrote:
>> On 14/09/2021 17.22, Richard Henderson wrote:
>>> On 9/14/21 5:26 AM, Peter Maydell wrote:
>>>> (2) RAM blocks should have a length that fits inside a
>>>>      signed 32-bit type on 32-bit hosts (at least I assume this
>>>>      is where the 2047MB limit is coming from; in theory this ought
>>>>      to be improveable but auditing the code for mishandling of
>>>>      RAMblock sizes to ensure we weren't accidentally stuffing
>>>>      their size into a signed 'long' somewhere would be kind
>>>>      of painful)
>>>
>>> Recalling that the win64 abi model is p64, i.e. 'long' is still 32-bit
>>> while pointers are 64-bit, how close do we think we are to this being
>>> fixed already?
>>>
>>>> Even if we did fix (2) we'd need to compromise on (3)
>>>> sometimes still -- if a board has 4GB of RAM that's
>>>> not going to fit in 32 bits regardless. But we would be
>>>> able to let boards with 2GB have 2GB.
>>>
>>> I'm not opposed to deprecating 32-bit hosts...  ;-)
>>
>> I think we should consider this again, indeed. Plain 32-bit CPUs are quite
>> seldom these days, aren't they? And I think we urgently need to decrease the
>> amount of things that we have to test and maintain in our CI and developer
>> branches... So is there still a really really compelling reason to keep
>> 32-bit host support alive?
> 
> I think it probably depends on the architecture to some extent.
> 
> i386 is possibly getting rare enough to consider dropping, though
> IIUC, KVM in the kernel still supports it.  Would feel odd to drop
> it in QEMU if the kernel still thinks it is popular enough to keep
> KVM support.
> 
> armv7 feels like it is relatively common as 64-bit didn't arrive
> in widespread use until relatively recent times compared to x86_64.
> KVM dropped armv7, but then hardware for that was never widespread,
> so armv7 was always TCG dominated
> 
> Other 32-bit arches were/are always rare.

While I could understand there are rare uses of system emulation on
32-bit hosts, I still believe user-emulation is used, but would like
to be proven to the contrary. With that in mind, I'm not sure removing
sysemu on 32-bit hosts is worthful. Maybe we should ask distribution
maintainers first, then eventually poll the community? Or start with
a deprecation warning?

>> Could we maybe also decrease the amount of targets, i.e. merge
>> qemu-system-x86_64 and qemu-system-i386, merge qemu-system-ppc64 and
>> qemu-system-ppc, etc. where it makes sense (i.e. where one of the binaries
>> is a superset of the other)?
> 
> Regards,
> Daniel
> 


