Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A540C7E0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 17:06:29 +0200 (CEST)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWUW-0001kw-MC
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 11:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQWPg-0006uA-UC
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:01:30 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQWPf-0002ia-0Q
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 11:01:28 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso2290019wme.0
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QnTk8fnCUN+j0bq1oMyi+n+xa2nanqnvAAbfuVZivKU=;
 b=EVmHN1k5zn8ByMU8KYU4xsYKQvWl+Yaki2Mg6heC++oBRCW2uanig84E3WrNM4uYQ3
 kGY14cZaeBiR4rhw0Tb2vdeguEw/WkiTafWoEVk3K+xvsWAVDxLfzf9J3ckvdWWJwk/l
 C8ispkNcd6s/LqduASAVXVL4ClQ4KALGaNC9J+/mpFIfjcrgBEqFjT7mIkkgmO1gwiCj
 Z6go71nL/xW5VcGlgr6v7DLPO+Hy2hIzygXmVgv1sGDpLofQmXP8Z4MK/i6rbPv6j9oD
 5pf6r1AWzWxM/400f2ZjbmVo1cvcvrHrAHqzFTSyqHs36DUd7C7BrQG5S+8C0x7sjMCn
 InMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QnTk8fnCUN+j0bq1oMyi+n+xa2nanqnvAAbfuVZivKU=;
 b=WNLAghxGT9XmrsY4JOc8eu8UMbB2qfjFTxIZMFMp+/1whQVe+6m9MgXKgLx1oKFGVQ
 9EvHlc2j3gb/guLjxh1tnyjTrBWMvC8Vi/HRzZH8RLBpsN/6U6t17iStgAnN3ZNooKyB
 Vhp9NyQWLiTBwwaFnft9u3GYRyqGLjQRLW69vANBGvyop7yhbRNREsY1N+OnNNpQEWBj
 K7pd0iFQqb+v0b1VDuWs7Moc25QbHJ7yfNF8Qc0rTi0H3PjTp+Y6DsmAdMlPU0bhRHOD
 5tVKo8ArLOc2uhmeOzj/Iv8BERZSSJbqzKnmkX6joUjlLgyjDseLS8uVlTWckTCDl4Kq
 TzPQ==
X-Gm-Message-State: AOAM5306ubwSoAvh993yH4qtLHQkU2R6A6uYoqcEICzoqNib01+BFwTK
 Jzo/L0F1LhsgFm0lmpWeuHI=
X-Google-Smtp-Source: ABdhPJwoxsMl9RRmZzLcNts1q9VVw0+O57+2ub6j0tq6M8PkdLhd2+Z5eB+p8SuIWl439SeU/Optvw==
X-Received: by 2002:a1c:c913:: with SMTP id f19mr162957wmb.86.1631718085550;
 Wed, 15 Sep 2021 08:01:25 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id w9sm201301wmc.19.2021.09.15.08.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 08:01:24 -0700 (PDT)
Subject: Re: [PATCH 1/2] tests/docker: promote debian-riscv64-cross to a full
 image
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210914185830.1378771-1-richard.henderson@linaro.org>
 <20210914185830.1378771-2-richard.henderson@linaro.org>
 <14f98dad-fb1c-7b1b-4194-484973a53c90@amsat.org> <87v932tfn2.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <145f1b51-bffc-85c2-f4d6-3240ba51611a@amsat.org>
Date: Wed, 15 Sep 2021 17:01:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87v932tfn2.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.698,
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
Cc: thuth@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 wainersm@redhat.com, willianr@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 10:15 AM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>> On 9/14/21 8:58 PM, Richard Henderson wrote:
>>> From: Alex Bennée <alex.bennee@linaro.org>
>>>
>>> To be able to cross build QEMU itself we need to include a few more
>>> libraries. These are only available in Debian's unstable ports repo
>>> for now so we need to base the riscv64 image on sid with the the
>>> minimal libs needed to build QEMU (glib/pixman).
>>>
>>> The result works but is not as clean as using build-dep to bring in
>>> more dependencies. However sid is by definition a shifting pile of
>>> sand and by keeping the list of libs minimal we reduce the chance of
>>> having an image we can't build. It's good enough for a basic cross
>>> build testing of TCG.
>>>
> <snip>
>>> diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
>>> index 2bbff19772..594d97982c 100644
>>> --- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
>>> +++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
>>> @@ -1,12 +1,48 @@
>>>  #
>>> -# Docker cross-compiler target
>>> +# Docker cross-compiler target for riscv64
>>>  #
>>> -# This docker target builds on the debian Buster base image.
>>> +# Currently the only distro that gets close to cross compiling riscv64
>>> +# images is Debian Sid (with unofficial ports). As this is a moving
>>> +# target we keep the library list minimal and are aiming to migrate
>>> +# from this hack as soon as we are able.
>>>  #
>>> -FROM qemu/debian10
>>> +FROM docker.io/library/debian:sid-slim
>>> +
>>> +# Add ports
>>> +RUN apt update && \
>>> +    DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
>>> +    DEBIAN_FRONTEND=noninteractive eatmydata apt update -yy && \
>>> +    DEBIAN_FRONTEND=noninteractive eatmydata apt upgrade -yy
>>> +
>>> +# Install common build utilities
>>> +RUN DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
>>> +    bc \
>>> +    build-essential \
>>> +    ca-certificates \
>>> +    debian-ports-archive-keyring \
>>> +    dpkg-dev \
>>> +    gettext \
>>> +    git \
>>> +    ninja-build \
>>> +    pkg-config \
>>> +    python3
>>
>> Alex, why not using a debian-sid intermediate image?
> 
> Well we removed the original debian-sid image a while ago having excised
> images that used it. Basing things on sid does cause problems given it's
> such a moving feast. Rather than encouraging others to build sid based
> images we decided it made more sense to make this a pure standalone
> image which we can migrate away from at the first opportunity.

Yeah, which is why I'm worried we'll get the same problem...

So this image can't be used as gating IMO.

