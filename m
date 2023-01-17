Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E866D81F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 09:26:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHhGv-0004Jy-Or; Tue, 17 Jan 2023 03:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHhGs-0004Jl-Uu
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:24:42 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHhGr-0003Qh-CI
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 03:24:42 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r30so5309866wrr.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 00:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5WfRPJdv70fvJos/l9zCy8faGvr1NXjnAvf5NSFdq9E=;
 b=DlS0cMPka8Q5onPI3evePIR1TZh+cfyA+WQWrWnIF8LQ2AD5rrZPjIYIDMSDUfgIXD
 ZDjPCHUuFRPdOOIMMhL5g6htKc9bLPcpOq8teE/Ps5Z9c3xVwPiljnoZYfPVi7/244Qk
 39N5vhHLfqWoGXTnmGdhvYDkniaqUmG5UeLiHUNjthU3SW5+/A+Rwjt0SRi9knudR2tQ
 fn+LnC/fynLUlh14HxVE7tiZJgoA3xNqsK1W3XWVENHodO2AfshcYci1qBzBzzaA013z
 PxBBP+vUo5l4PQfyKOpbFvmOU97FLoFxpA6le57TQz/c5DFHlMi0Lxw9NeEQjgzOJnKa
 /0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WfRPJdv70fvJos/l9zCy8faGvr1NXjnAvf5NSFdq9E=;
 b=BPLbcAAt8LUiDsmG/7tuRxegUvM9mbC1EU0C3l/R10CdnW/SbJenMPGBZ+PdDg9Mgk
 uDQnIxfjRhvFcmgkd+BugPsF3ROAEiHn/p6LOAoE6QfCm5rZJ5hbLGUlId/SplnGTfAS
 HtOU3tipLWWhCN4QabXC0nGAoV4MuvgaVAgpkCjyRCOjkpWtt7SmzgBZrSRIH9G776fh
 Qdxr721Np0KEdMAmvshZmBNsG+Q21f32ZhtBhiQG17AXQRGqP2imsGRKrJcGgTuM+rw2
 NZokcnv5fJS8glwyZ6RYu7mR39SfmH8lqUw/TzL38YAzxbiTcw8P63/XhVi9GjWA/EzY
 mXlQ==
X-Gm-Message-State: AFqh2koiIn5wvcP6vh1wl/I9oaRohJEMUNJz0i5KDNDGBgP38lGiMANi
 x+Z/3RYRgP9dDQgFI6DvZwoIBw==
X-Google-Smtp-Source: AMrXdXttQez9ZeUZEFIuhYIcSpn0yU1ZYKDYGn65umyOooWmtgXhJ718NmNwykBeiUcrZXFgxtEK+A==
X-Received: by 2002:a5d:4450:0:b0:2bd:ca69:5ce6 with SMTP id
 x16-20020a5d4450000000b002bdca695ce6mr1997714wrr.17.1673943879389; 
 Tue, 17 Jan 2023 00:24:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e1-20020a5d65c1000000b002be15ee1377sm2369278wrw.22.2023.01.17.00.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 00:24:39 -0800 (PST)
Message-ID: <4be6001c-b496-574b-499d-7bc0abf57f4b@linaro.org>
Date: Tue, 17 Jan 2023 09:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/6] qemu/bswap: Use compiler __builtin_bswap()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ira Weiny <ira.weiny@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230111163147.71761-1-philmd@linaro.org>
 <988c2552-f378-f028-d11f-1261c0be1281@linaro.org>
 <26c3c3c8-61f5-8f56-9094-1699fcd516ed@linaro.org>
In-Reply-To: <26c3c3c8-61f5-8f56-9094-1699fcd516ed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 13/1/23 08:05, Philippe Mathieu-Daudé wrote:
> On 13/1/23 02:05, Richard Henderson wrote:
>> On 1/11/23 08:31, Philippe Mathieu-Daudé wrote:
>>> Implement Richard's suggestion to use __builtin_bswap().
>>>
>>> Convert to __builtin_bswap() one patch per OS to simplify
>>> maintainers review.
>>>
>>> Since v2:
>>> - Rebased adapting ./configure changes to meson
>>>
>>> Since v1:
>>> - Remove the Haiku/BSD ifdef'ry (Peter)
>>> - Include the Haiku VM image from Alexander
>>>
>>> Philippe Mathieu-Daudé (6):
>>>    qemu/bswap: Replace bswapXX() by compiler __builtin_bswap()
>>>    qemu/bswap: Replace bswapXXs() by compiler __builtin_bswap()
>>>    qemu/bswap: Remove <byteswap.h> dependency
>>>    qemu/bswap: Use compiler __builtin_bswap() on Haiku
>>>    qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
>>>    qemu/bswap: Use compiler __builtin_bswap() on NetBSD
>>
>> If this passes on all the odd OS's, great.
>> Failure on some oddball is what blocked my patch set years ago.
> 
> OK I'll double-check.

Tested successfully on:

- QEMU GitLab CI
- Darwin 22.2
- FreeBSD 12.4
- NetBSD 9.3
- OpenBSD 7.2
- Haiku r1beta4

