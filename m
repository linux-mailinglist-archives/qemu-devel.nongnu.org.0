Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDCC68AF73
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:06:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcpo-0005Eh-CM; Sun, 05 Feb 2023 06:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pOcpl-0005Dn-1x; Sun, 05 Feb 2023 06:05:21 -0500
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pOcpj-0006Ix-8h; Sun, 05 Feb 2023 06:05:20 -0500
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-169ba826189so12049656fac.2; 
 Sun, 05 Feb 2023 03:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eJVRX7SYxO8VXj/fUeKdCubkstmkGDQ9DxhvW2TWSfQ=;
 b=njlj8RbYcCRNEZtr1hlKh8U8koZkl41QbU29yv/EHZXacHwSAslW2E6U1jz107wnnK
 p3pxwgc33AmFNXsGwiZjR3LcDGud0bRUJ/OOVQRy85rdMKuWjVQjqGHFeVHi/6hGeblM
 yoesoOplJwl7DmSry+QcqSDxa3N04UhEfehVhF7WATYAMWWlfA4WmYUuFuaFvQE3YaUM
 RGsuMz6xUS3faPIK9tU4HSOFHhdR8MW46KasfBrvqKFI4ISKXmIdxuXCJ/DLU+tdmDGx
 KhAyIZSg8U8UuBMf9XMV5uucgnDuw4SVIitKJCR62h1VE9vMXYrABy/eSXzG0CYabhH9
 HGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eJVRX7SYxO8VXj/fUeKdCubkstmkGDQ9DxhvW2TWSfQ=;
 b=QkEmh5D6bt8L5Z+opV6CoJhYgp9kVBkdrHmqIatkpWBE0v4cJ0vOYkvCeWKljZxlqJ
 PbWLV48z6pzQHkVtgaxnFXcJBelWf2ZCGOJ/8/RYU1XUpiVyMoGJoW00Gak76JKMb+sl
 Afj31NFx1JMTNQE/sKYDyt3Eo+sjPvmtsBHcn1P1mC51ODd9Ua1YEe71V7Rniz+GCwu7
 gAKjqHaqcqWxseUUoeyCQ4SqN2/H/mPTQZsVfAwjkbZoub7SXCG/xgtFoeZ9BrNLCeRu
 EFYy1EL4E44Mw1F+9zZYk8tZxJY9NPJATceX2SbFjP5ZMKH6oa1eJ4ASQy8h3T1F8MkS
 lJeA==
X-Gm-Message-State: AO0yUKXU6IUPVoZHy9fxEbWbec1trA0uDXp2Wtwb+ABfwwBXWv1cKa0C
 9+sXihnA3tDHSD/KFCUpZRE=
X-Google-Smtp-Source: AK7set8KOn2iRQERgQM3Hs+5ENtnM8dD9tEhpcshfcwFalHwjbatmihqmfm6pss5GNehty4qpUiB+g==
X-Received: by 2002:a05:6871:5d4:b0:163:18f6:e5a8 with SMTP id
 v20-20020a05687105d400b0016318f6e5a8mr9039129oan.42.1675595117574; 
 Sun, 05 Feb 2023 03:05:17 -0800 (PST)
Received: from [192.168.68.107] ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 dd6-20020a056808604600b00364e50e10c0sm2801301oib.56.2023.02.05.03.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:05:17 -0800 (PST)
Message-ID: <586ca3ab-ea1c-f5cc-15bf-8b36ea49cb2d@gmail.com>
Date: Sun, 5 Feb 2023 08:05:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/5] hw/ppc: Set QDev properties using QDev API (part 2/3)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20230203211623.50930-1-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230203211623.50930-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.09,
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



On 2/3/23 18:16, Philippe Mathieu-Daudé wrote:
> part 1 [*] cover:
> --
> QEMU provides the QOM API for core objects.
> Devices are modelled on top of QOM as QDev objects.
> 
> There is no point in using the lower level QOM API with
> QDev; it makes the code more complex and harder to review.
> 
> I first converted all the calls using errp=&error_abort or
> &errp=NULL, then noticed the other uses weren't really
> consistent.
> 
> A QDev property defined with the DEFINE_PROP_xxx() macros
> is always available, thus can't fail. When using hot-plug
> devices, we only need to check for optional properties
> registered at runtime with the object_property_add_XXX()
> API. Some are even always registered in device instance_init.
> --
> 
> In this series PPC hw is converted. Only one call site in PNV
> forwards the Error* argument and its conversion is justified.


Feel free to take the 4 patches I acked via your tree when pushing it together
with part 1/3.

I can't ack macio because that's Mark's turf.

Thanks,


Daniel

> 
> Based-on: <20230203180914.49112-1-philmd@linaro.org>
> (in particular [PATCH 02/19] hw/qdev: Introduce qdev_prop_set_link():
>   https://lore.kernel.org/qemu-devel/20230203180914.49112-3-philmd@linaro.org/)
> 
> [*] https://lore.kernel.org/qemu-devel/20230203180914.49112-1-philmd@linaro.org/
> 
> Philippe Mathieu-Daudé (5):
>    hw/misc/macio: Set QDev properties using QDev API
>    hw/pci-host/raven: Set QDev properties using QDev API
>    hw/ppc/ppc4xx: Set QDev properties using QDev API
>    hw/ppc/spapr: Set QDev properties using QDev API
>    hw/ppc/pnv: Set QDev properties using QDev API
> 
>   hw/intc/pnv_xive.c         | 11 ++++------
>   hw/intc/pnv_xive2.c        | 15 +++++---------
>   hw/intc/spapr_xive.c       | 11 ++++------
>   hw/intc/xics.c             |  4 ++--
>   hw/intc/xive.c             |  4 ++--
>   hw/misc/macio/macio.c      |  6 ++----
>   hw/pci-host/pnv_phb3.c     |  9 +++------
>   hw/pci-host/pnv_phb4.c     |  4 ++--
>   hw/pci-host/pnv_phb4_pec.c | 10 +++-------
>   hw/pci-host/raven.c        |  6 ++----
>   hw/ppc/e500.c              |  3 +--
>   hw/ppc/pnv.c               | 41 ++++++++++++++++----------------------
>   hw/ppc/pnv_psi.c           | 10 +++-------
>   hw/ppc/ppc405_boards.c     |  6 ++----
>   hw/ppc/ppc405_uc.c         |  6 +++---
>   hw/ppc/ppc440_bamboo.c     |  3 +--
>   hw/ppc/ppc4xx_devs.c       |  2 +-
>   hw/ppc/sam460ex.c          |  5 ++---
>   hw/ppc/spapr_irq.c         |  8 +++-----
>   19 files changed, 62 insertions(+), 102 deletions(-)
> 

