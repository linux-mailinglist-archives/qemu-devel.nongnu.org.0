Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1DF365908
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:37:04 +0200 (CEST)
Received: from localhost ([::1]:48004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpcl-0004l0-KQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYpbK-0003va-KM; Tue, 20 Apr 2021 08:35:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYpbE-0005TQ-F3; Tue, 20 Apr 2021 08:35:33 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so13067086wma.1; 
 Tue, 20 Apr 2021 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SkvZjq7/VFh9GAzcay8N2xYIKNEfBpH6OBFAL3+R4q8=;
 b=Gz0yBIBHSYLQiTUFImZM8LFZ+vNHnLQSs28hLdZhKPYoUKhuIHv0OCs17ZMPZUekjF
 vX2Gg0ma2+jsi2JR+GrG9HvLvWkFDNoCdli7qZ2VLW6jKk/NY64hDTGeYXR+542GNkFI
 QYI+Zzop6vwGQP1xlmXWHC6VHyceirPLWWZtWuN721TMRhDhUq/sekH1qDqQQBPQrsVL
 1ujN8OStueSUjWy2SL7x/EgEtReSy1URtAEI1GzprATFTEwz5eM60ysCKpa09NSuspF5
 pOclgdidEYMVwWNWP78SYn+HiOYzOA9KTC0GDEQLkTlOSgODnxlt8vwHyXH5MtN4flop
 3wHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SkvZjq7/VFh9GAzcay8N2xYIKNEfBpH6OBFAL3+R4q8=;
 b=sb3COHzUQO7yeaUERky9SFvufcgEf+AGzjc29yyx0ZN04TdpL/NP4Gqu0ksHy3DULH
 A3SF7IeunJ5fYOSrBya0qhT/Yk1hFa6uBN8WcLtUyf6WqhlEtC5N8LKbItH/bzfYoA9B
 211IZJ7Z75/sRz5w7GuLegMlBHPp3PqQ6h7CmlWNOUpJ3aJkMYQNqHpr6VabkS3ZYPHi
 W4KpdD1rUi89wjBI8w5Ackn7Pcge7QhCokQroPZpYmU7RSJgGtEcgovlTM20JTFdN/HL
 UcnotfQp+M6g2m78qoV428fg7zhqQZhcWN89F1WAuTCpj8veYLHmHFh8oSgLK3Clolqg
 u+8Q==
X-Gm-Message-State: AOAM533hEROjTyY3zLAd1+5qPl9OL6OLY/oiz2h2SzxXEBz9fzFS/nKp
 1lEducfgIF9n7jrIr43BG88=
X-Google-Smtp-Source: ABdhPJx0L0i4QysSfkQknv9XCX1d2q1tTY2+IBKwYFztJAagg95z6TDkTdRGT9Kn3o57oPAyA5zSDg==
X-Received: by 2002:a05:600c:20e:: with SMTP id
 14mr4253866wmi.161.1618922126649; 
 Tue, 20 Apr 2021 05:35:26 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e9sm28109346wrs.84.2021.04.20.05.35.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 05:35:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] tests/docker: gcc-10 based images for ppc64{, le}
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210420013308.813323-1-matheus.ferst@eldorado.org.br>
 <20210420013308.813323-2-matheus.ferst@eldorado.org.br>
 <YH5RkjCx2Bk4mbop@yekko.fritz.box> <87eef587qc.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2e297129-ed1e-4620-982b-27546ce554ff@amsat.org>
Date: Tue, 20 Apr 2021 14:35:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87eef587qc.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: bruno.larsen@eldorado.org.br, gustavo.romero@protonmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org, matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 2:20 PM, Alex Bennée wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
>> On Mon, Apr 19, 2021 at 10:33:07PM -0300, matheus.ferst@eldorado.org.br wrote:
>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>
>>> A newer compiler is needed to build tests for Power10 instructions. As
>>> done for arm64 on c729a99d2701, a new '-test-cross' image is created for
>>> ppc64 and ppc64le. As done on 936fda4d771f, a test for compiler support
>>> is added to verify that the toolchain in use has '-mpower10'.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>>  tests/docker/Makefile.include                   |  2 ++
>>>  .../debian-powerpc-test-cross.docker            | 17 +++++++++++++++++
>>>  tests/tcg/configure.sh                          | 12 ++++++++----
>>>  3 files changed, 27 insertions(+), 4 deletions(-)
>>>  create mode 100644 tests/docker/dockerfiles/debian-powerpc-test-cross.docker
>>>
>>> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
>>> index 9f464cb92c..f1dbcc639f 100644
>>> --- a/tests/docker/Makefile.include
>>> +++ b/tests/docker/Makefile.include
>>> @@ -152,10 +152,12 @@ docker-image-debian-sparc64-cross: docker-image-debian10
>>>  docker-image-debian-tricore-cross: docker-image-debian10
>>>  docker-image-debian-all-test-cross: docker-image-debian10
>>>  docker-image-debian-arm64-test-cross: docker-image-debian11
>>> +docker-image-debian-power-test-cross: docker-image-debian11
>>>  
>>>  # These images may be good enough for building tests but not for test builds
>>>  DOCKER_PARTIAL_IMAGES += debian-alpha-cross
>>>  DOCKER_PARTIAL_IMAGES += debian-arm64-test-cross
>>> +DOCKER_PARTIAL_IMAGES += debian-power-test-cross
>>
>> You add these "power" (as opposed to "powerpc" or "ppc64" or whatever)
>> images here, but they don't seem to be referenced anywhere else.
>>
>>>  DOCKER_PARTIAL_IMAGES += debian-hppa-cross
>>>  DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
>>>  DOCKER_PARTIAL_IMAGES += debian-powerpc-cross debian-ppc64-cross
> 
> I was expecting the new debian-power-test-cross to replace both
> debian-powerpc-cross and debian-ppc64-cross.

Maybe rename the images as:

DISTRIB-TARGET-crossbuild and DISTRIB-TARGET-crosstest-tcg?
(as it is not obvious for every contributor than 'cross' imply
emulation and not virtualization).

