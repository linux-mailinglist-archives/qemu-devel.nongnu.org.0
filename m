Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F932AC36
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:28:48 +0100 (CET)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCZT-0003Ll-8b
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <romain.naour@gmail.com>)
 id 1lHCLe-00060G-Tw
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:14:30 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <romain.naour@gmail.com>)
 id 1lHCLa-0002xr-Vj
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:14:30 -0500
Received: by mail-wr1-x434.google.com with SMTP id u16so3381248wrt.1
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 13:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ubUN+fHZJxqOVr9mXdjO3lIeWp/Qefm3OZboabAwvfE=;
 b=JLy7hDUVS9wFwLzSxsTK2HDltZCM2qdkjh7T9G9Ku5bg3JnkFQip5OMiJAwMLA0ltF
 RPUrkfTreRX5j+V7Bsvqii4S/rXNPGqKR32D+ky24NqQWXN25XI3TGVT5dMNJuvFkGex
 lJbKl/5LWT3KGxIyqR8Lwp1UzcsZMEMs4LMOBZGASn5Z4LxuuKnd8n00dKcIQM4f7YNN
 h785R5T0MjjWT/LUYUVnOBrnJAGmkVlHs8EVcXOb1YAXRZhx3YPF2MqCQesKavEeT3jH
 8To7t3SDe1kDem6aMCt9ffQ1bTIv6491pXY8ffZliY0aEAtq81wZgTDILOa83RDV8/0S
 NobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ubUN+fHZJxqOVr9mXdjO3lIeWp/Qefm3OZboabAwvfE=;
 b=l6Fm6nh89LRejA+ItfxY/Sbfk+K6nPX5FhnON1U92co5qz5YJnHwNnKgTvsd8pYv4U
 1W72VV5z+MXYHoZRb678ZHzQh2vj0+vf9SbbWCSc/qIV109l3tBMsZ6eo1fNQFlxCnaT
 iBqmZhft2Jjn6VAJ5ecT7vJzEnjNIesQxTWrUq5by2MJlMwapNgP784sV8xYMY/eRyuB
 C3k8X4dtB3T04l/Ia01GsYo8wvEsmzx3srwMilLAmUcZAnTsIUnO0wU/Yq3phElwtO2K
 ao7+FDIX+OdXxrHeELJxtQ33KTXLaxqIogwghgyOiWtupnubCiKySJPFrGo9l88qe+7H
 +anw==
X-Gm-Message-State: AOAM532FZD/oTx8yAI3gJBUilcMrmZjFh3dfyd7R9o2JvNyvLFKgzoT3
 Frj0oIcvAIAOwxDEbtUwcKBLiVhexMQ=
X-Google-Smtp-Source: ABdhPJw/UUYcBCWKMg1/ttQIz/HhvhD+QYuBQ3Mh5YfkrUGo1cAs50UpS68PZszyE+qGk8XhJhBotA==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr5094362wrm.389.1614719664789; 
 Tue, 02 Mar 2021 13:14:24 -0800 (PST)
Received: from ?IPv6:2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce?
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id v13sm3584752wrt.45.2021.03.02.13.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 13:14:24 -0800 (PST)
Subject: Re: [PATCH] meson: add tests option
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
References: <20210226220715.3103110-1-romain.naour@gmail.com>
 <eabd866e-71c5-3ac3-7688-0318fc758f94@redhat.com>
 <14d34883-5e97-972d-87d1-49b47324cac5@redhat.com>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <8d5714d1-d92b-60fc-531f-73eb05852c8f@gmail.com>
Date: Tue, 2 Mar 2021 22:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <14d34883-5e97-972d-87d1-49b47324cac5@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=romain.naour@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Le 02/03/2021 à 12:08, Paolo Bonzini a écrit :
> On 02/03/21 11:22, Thomas Huth wrote:
>> On 26/02/2021 23.07, Romain Naour wrote:
>>> tests/fp/fp-bench.c use fenv.h that is not always provided
>>> by the libc (uClibc).
>>
>> For such  problem it might be better to check for the availability of the
>> header and then to only disable the single test that depends on it if the
>> header is not available.

You're right, I thought about adding a header check but I noticed that was no
option to disable all tests. Buildroot try to avoid as much as possible building
tests program.

>>
>> Anyway, a switch to disable the tests completely could still be handy in some
>> cases, so FWIW:

It can save some build time:

qemu build with tests disabled
real	3m27,310s
user	19m56,887s
sys	2m1,738s

qemu build with tests enabled
real	4m0,638s
user	23m34,963s
sys	2m32,944s


>>
>> Acked-by: Thomas Huth <thuth@redhat.com>
> 
> I disagree, without a use case the right thing to do is to check for fenv.h. 
> It's as easy as this:

Is it ok if I take your patch to disable fp tests when fenv.h is missing and
resend my patch with an updated commit log to disable all tests to save some
build time?

Best regards,
Romain

> 
> diff --git a/tests/meson.build b/tests/meson.build
> index 0c939f89f7..3b9b2f0483 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -281,7 +281,7 @@ test('decodetree', sh,
>       workdir: meson.current_source_dir() / 'decode',
>       suite: 'decodetree')
> 
> -if 'CONFIG_TCG' in config_all
> +if 'CONFIG_TCG' in config_all and cc.has_header('fenv.h')
>    subdir('fp')
>  endif
> 
> Thanks,
> 
> Paolo
> 


