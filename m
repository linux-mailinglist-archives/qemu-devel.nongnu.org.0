Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69031FA17
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:47:36 +0100 (CET)
Received: from localhost ([::1]:40618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD687-00017c-Hk
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:47:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD62N-0005EB-NF
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:41:39 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD62J-0000yZ-CI
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 08:41:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id n8so8510940wrm.10
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 05:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lh4sInbGvd+c5/Szi0pGU5rJbwedoNnTS/uhx2DB/TQ=;
 b=bRRl202ilViOai1DehdiNXI8p0EMWo8FXgCKmLPhckHcYazenYSJ0/eFCgkzf/nbAb
 dTkxalXGA7k1DCvIURAvO0BM/S4BvtJLyGQfVkDtfpQm8ssiGoEskncr/fxuo8wSegeQ
 CQf2DdxcX861XQzZraeQxThgQBZAXnDVBvoMIcNH9Q7Fw4UUwMZTWeqO6w58NEmZCBzN
 Rlx+3AaEc1oqOHIvCf/wiUkT2Vzdk+wkM/lHlLUUoUYSlUxaO9lJkoKUvQoAUrjGEku4
 SErVX7xPa2wnttFRKflXTJGc6Q2w8tDnvl4IZMJnyme1xH0oPvv3c8j5yVLEffOKxCca
 swkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lh4sInbGvd+c5/Szi0pGU5rJbwedoNnTS/uhx2DB/TQ=;
 b=cYE7fGVhZnp8hcYXYt40beqix/TonY5C69iIxGWVMvtaX7Is0EGKdesp9r6cjr2r9e
 63tku7sOK3YRQ0KTCjxY5IFrAh2m34deaMRYjFhV2aWNi9Gz6Bfk3MSKmP8tFGBaOtzx
 pIEXCkYoYmKvHedbGH0yvNf0eo1xtE21Qhe0WSninNzTWUm5jrM5aDqUrPXBYlScuTOu
 2b6DhUsr4CPskq8g5/42VW3JCcPrqQzKO1qaq0OfOB7ZorkQnKePYfLr6dWOVbQRlcvs
 Oz8aJzJfIZXxQRi1sGaIDxOPSx1pPkxe/5VydFpRSsS5NLq0afjCmQLEqjGssfHD6dSE
 1hcg==
X-Gm-Message-State: AOAM5333vu68rDYAx0CrbofUR7pA3TtjqhKOuzY7eH8mX0D/j8SoR+LV
 c2/hHk1w1U8UrcFC0eikWnw=
X-Google-Smtp-Source: ABdhPJwyV8S5Fx1rGlOWzuk1WQ2UtjuGZoHH5iDSYCtbr+L/EZnpCluaVVygKV2c3mSGrrUvtf58cg==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr9111677wrt.67.1613742093847;
 Fri, 19 Feb 2021 05:41:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q24sm11252753wmq.24.2021.02.19.05.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 05:41:33 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci: Remove unused container images
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210219110950.2308025-1-thuth@redhat.com>
 <ca4a7cf3-c0b8-2074-d288-d402e5900cf9@amsat.org>
 <c429f806-ae37-9939-d215-fe98bffb84dd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <181952df-c036-f1c0-9edc-72b635ce7fac@amsat.org>
Date: Fri, 19 Feb 2021 14:41:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c429f806-ae37-9939-d215-fe98bffb84dd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 2:10 PM, Thomas Huth wrote:
> On 19/02/2021 13.00, Philippe Mathieu-Daudé wrote:
>> On 2/19/21 12:09 PM, Thomas Huth wrote:
>>> We're building a lot of containers in the gitlab-CI that we never use.
>>> This takes away network bandwidth and CPU time from other jobs for no
>>> use, so let's remove them for now. The individual containers could be
>>> re-added later when we really need them.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   .gitlab-ci.d/containers.yml | 92 -------------------------------------
>>>   1 file changed, 92 deletions(-)
>>
>> I'm not enthusiast with this patch because I use various in this list
>> from time to time for testing or cross build/disas binaries.
> 
> When I look at our current huge list of containers, I wonder how do we
> know which containers still get used (in the sense of not only build),
> and which ones are likely already bit-rotten? And why do we need that
> many containers? Why both, debian-arm64-test-cross.docker and
> debian-arm64-cross.docker and not combine them? And why do we need that
> many individual cross-compiler docker files if we already have
> debian-all-test-cross.docker that can be used to test most of them? ...
> for me, as a docker ignorant, this is all very opaque and some clean up
> IMHO could really help here.

debian-arm64-cross.docker is to cross-build QEMU, while
debian-arm64-test-cross.docker to cross-build the TCG tests.

debian-arm64-test-cross.docker could probably now be replaced
by debian-all-test-cross.docker.

IIRC the problem we had was on aarch64 hosts many cross-build
packages were broken, so we had to restrict them to the bare
minimal to be able to cross-build the TCG tests there.

>> Not having
>> these containers used mainstream probably show the failure of the
>> project to add good testing coverage on these targets. Most of them are
>> for hobbyist with little time. Removing them will make it even harder
>> to add tests.
> 
> Do you really use the docker files from the gitlab registry? I'd rather
> expected that people build those locally in case they need them...?

TBH I pull from registry 99% of the time. I only build locally if I the
mainstream image is missing something, and I want to add what is missing
in a patch. But even there once finished I pull from my namespace
registry and test with that image, as this is what other will use too.
I want to use the same images from our registry, not my local ones.

>> Can't we keep them disabled? Or put them in manual mode?
> 
> Well, I guess manual mode is fine, too, as long as they don't waste CPU
> cycles and network bandwidth anymore for most people who don't need them.
> 
>  Thomas
> 
> 

