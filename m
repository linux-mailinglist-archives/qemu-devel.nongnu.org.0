Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0A14E9658
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 14:14:19 +0200 (CEST)
Received: from localhost ([::1]:34280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYoGH-0004gz-PO
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 08:14:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1nYoDD-0003fa-CI
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:11:07 -0400
Received: from [2a00:1450:4864:20::535] (port=42676
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jerome.forissier@linaro.org>)
 id 1nYoD9-0001pN-0z
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 08:11:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id a17so16644987edm.9
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=Mz3Bk+dT5FwbimJT2UkMDrF4GuvCgciWCNtQbRXzpWw=;
 b=gWzC+LhOVEzTmC3242y+2wgx4NjN2IB4HO4iRu+4qTVy8T6n4qK/tL+PfPz/Lk3avg
 gFkvZOc0ADzijPsUoIDgzzIXNNG4BXSbLSDDfO12jBzhUGCRGFILr49srSqpSl5DHK6L
 xK2I24a4wUhUZA756WYFFw8Obv1HaG8ZPqdpEbk64oUBJf0BljcKlVaPydHMmRa0/Wfc
 pXO0dKvLelkTvzaLDk5AbuyZUYtwtdspzUYi356ECyDIKI6EDfofDRDbX6kcEBeKe3v7
 I5SSgB1pdS5l+yxeB79s7h7ErSWNnAzwMBoptsT51d7bHoJy0GxufPppfSPDQGX/nI+z
 Bmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=Mz3Bk+dT5FwbimJT2UkMDrF4GuvCgciWCNtQbRXzpWw=;
 b=KWOOF17H5U0cVX+P4pc1SRbRM4QIzPaOpEo39oF6aKRcE6LhThnW6pzbnKo1o7Pa3C
 yK46MLn/+1kgYCkng2iJqgH4vP6P6c+IEMoRYa3wNc1YigLL5XlppNb6BOUueB9fpYjg
 MW2l+9ihmtG4td+3h+lcUCAp4QUIMQBKgbQCOscEOhkjPgk8YnaSXMq/T3XLfWUr8dXC
 cacD/OTj8WWqWorUBR/KToS+yffdtomKG26Jb73uHJplwsqVSeAyMnP48ZzyopcEoRE+
 TTfZjci79wZcTfdCaK0to7aHyIuv26pE1oLcxJvonG3CqsSO6ChdmAdCrZRdEn7qkplT
 pG4A==
X-Gm-Message-State: AOAM532KfGvkkbql8dnFf1clGHvL1VvLvjHWBz8E4mans5w4ljnmKoLo
 MwYyxANpZo8jrwz+aS1ii6HG6A==
X-Google-Smtp-Source: ABdhPJyr8Xc6biFNaLv6ZN9s8koW/bvt56ypcYZaTP0YTJ6+z34HOa3Y88BiQ6wTQ6VHa6jXqne9Ow==
X-Received: by 2002:a05:6402:280f:b0:419:4c6f:a91b with SMTP id
 h15-20020a056402280f00b004194c6fa91bmr15615993ede.84.1648469461107; 
 Mon, 28 Mar 2022 05:11:01 -0700 (PDT)
Received: from [10.7.3.3] ([195.216.219.14]) by smtp.gmail.com with ESMTPSA id
 f5-20020a1709067f8500b006da68bfdfc7sm5896853ejr.12.2022.03.28.05.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 05:11:00 -0700 (PDT)
Message-ID: <4c2faa25-d7b3-1a69-587f-f93183327f91@linaro.org>
Date: Mon, 28 Mar 2022 14:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Jerome Forissier <jerome.forissier@linaro.org>
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
Content-Language: en-US
In-Reply-To: <20220318132824.1134400-12-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=jerome.forissier@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Vincent Palatin <vpalatin@chromium.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Cédric,

On 3/18/22 14:28, Cédric Le Goater wrote:
> The initial eMMC support from Vincent Palatin was largely reworked to
> match the current SD framework. The parameters mimick a real 4GB eMMC,
> but it can be set to various sizes.
> 
> This adds a new QOM object class for EMMC devices.

That is interesting. Is RPMB emulation implemented? I doesn't look like
so, although...


> +    sd->ext_csd[EXT_CSD_RPMB_MULT] = 0x1; /* RPMB size */

...this indicates that the device has one block (128 KB) of RPMB if I'm
not mistaken.


I would be quite interested in testing and possibly helping out
implement RPMB, although I must admit don't know much about QEMU
internals. I have written some quick & dirty emulation code for RPMB at
the Linux ioctl() level, see [1]. This code is useful for CI testing of
the OP-TEE OS project [2], but having a lower level emulation in QEMU
would be much better since the Linux kernel would "see" the device and
report it in sysfs etc.

[1] https://github.com/OP-TEE/optee_client/blob/3.16.0/tee-supplicant/src/rpmb.c#L494-L571
[2] https://github.com/OP-TEE/optee_os/

Thanks,
-- 
Jerome

