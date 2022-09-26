Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE2F5EB3A4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 23:53:21 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocw2S-0005UP-Li
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 17:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocvpj-00014W-ES; Mon, 26 Sep 2022 17:40:11 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:44753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocvph-0005ty-23; Mon, 26 Sep 2022 17:40:11 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-13122bfaea6so5947284fac.11; 
 Mon, 26 Sep 2022 14:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zicPMDFIEJ8kqN2rhNDfXH9+zsffGYwPuRDBSdsoAk0=;
 b=ShtVhFJK2+A9zzOKHtT8KwrkuR3U3TLsfJHpvwpVNKatzQ5E5mVxQuC8kyJGdJsQw6
 XfrOicpiD/zNV4UJH32ghlp+P1EWLg/rZ/g2UFtPI5d6ztQCAQOjD4cDcjThOtPo/sKA
 8bF0ObOvKWCo0TDCIRjmdYssXP40BnQJ31qf5b2aA4zhihffRA4Zp3qEPpsDQJuj6pb8
 6weSZWkNWY7yfQgzWSMNBgU3R1tkb3QaIdQCZyjrwHDPujtKhz4TT93RnVvBHaugC3zy
 yrKyODmYjf45NHVuv3FAQSwKaqeFQtR1MZ4d4kkeIgtCerPv12llKAEBAgv01DjNP5+d
 Ejhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zicPMDFIEJ8kqN2rhNDfXH9+zsffGYwPuRDBSdsoAk0=;
 b=WMOHJ/RvUUqJ+7RDgXRTKMLAIICVT5xdJnOLTzlLhpckFGh7v7rFKVYU3gd/9YEIZN
 4+knNSsxm/Q+5nUjiEtGvdod7h1uwAWsGU2Ah57XpYTjohVAw9Rj6J7pWDwPBIM1F/yp
 PyULxEEl0YYNo/nlu+26NptLEhDFT4FvRQTWy7Eh+TmvNG147dLQHDL4yukWXuYerDLU
 8l+RANzxAKHSs0JOcqa7G6xPTc9RBBly4chiALHIkRN8wA4OsLQ6zXQiP21lQWG6rbHO
 RxIa7fCOiF5pAdfa0FaWL8Td+EIshwAsyFJYOGCNNuYVKGTQyh+SvezFrdMcFInOnyIb
 r4YA==
X-Gm-Message-State: ACrzQf2k2I56nZd/cRDW9gyltiFbIM2x9vs7KWjhRqnAGz+03zlcG8YP
 Dk9CrDFL7mpCIfUdsKFuUl0=
X-Google-Smtp-Source: AMsMyM6XLiZEdnp487KZDQaaroyqLxXhjvMcZocQVNq0NK6II2K2EEXVu19NjC4nQSV//SiLH59/YQ==
X-Received: by 2002:a05:6870:5804:b0:12a:f192:27de with SMTP id
 r4-20020a056870580400b0012af19227demr444303oap.224.1664228406790; 
 Mon, 26 Sep 2022 14:40:06 -0700 (PDT)
Received: from [192.168.10.102] (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 r65-20020acaf344000000b0034564365bf2sm7666813oih.17.2022.09.26.14.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 14:40:06 -0700 (PDT)
Message-ID: <6d15737b-bcfd-9fdf-2072-d906acf05a9c@gmail.com>
Date: Mon, 26 Sep 2022 18:40:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 00/13] Misc ppc/mac machines clean up
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1664108862.git.balaton@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <cover.1664108862.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mark,


It seems that you're usually push mac changes via a qemu-macppc PR (git log
says that the last one was Jan 2021), so feel free to keep doing so.

If it's convenient for you I can pick them via ppc-next as well. Just let me
know.


Thanks,


Daniel

On 9/25/22 09:38, BALATON Zoltan wrote:
> This series includes some clean ups to mac_newworld and mac_oldworld
> to make them a bit simpler and more readable, It also removes the
> shared mac.h file that turns out was more of a random collection of
> unrelated things. Getting rid of this mac.h improves the locality of
> device models and reduces unnecessary interdependency.
> 
> v2: Split some patches and add a few more I've noticed now and address
> review comments
> 
> BALATON Zoltan (13):
>    mac_newworld: Drop some variables
>    mac_oldworld: Drop some more variables
>    mac_{old|new}world: Set tbfreq at declaration
>    mac_{old|new}world: Avoid else branch by setting default value
>    mac_oldworld: Do not open code sysbus_mmio_map()
>    mac_newworld: Simplify creation of Uninorth devices
>    mac_{old|new}world: Reduce number of QOM casts
>    hw/ppc/mac.h: Move newworld specific parts out from shared header
>    hw/ppc/mac.h: Move macio specific parts out from shared header
>    hw/ppc/mac.h: Move grackle-pcihost declaration out from shared header
>    hw/ppc/mac.h: Move PROM and KERNEL defines to board code
>    hw/ppc/mac.h: Rename to include/hw/nvram/mac_nvram.h
>    mac_nvram: Use NVRAM_SIZE constant
> 
>   MAINTAINERS                   |   1 +
>   hw/ide/macio.c                |   1 -
>   hw/intc/heathrow_pic.c        |   1 -
>   hw/intc/openpic.c             |   1 -
>   hw/misc/macio/cuda.c          |   1 -
>   hw/misc/macio/gpio.c          |   1 -
>   hw/misc/macio/macio.c         |   8 +-
>   hw/misc/macio/pmu.c           |   1 -
>   hw/nvram/mac_nvram.c          |   2 +-
>   hw/pci-host/grackle.c         |   2 +-
>   hw/pci-host/uninorth.c        |   1 -
>   hw/ppc/mac.h                  | 105 ----------------
>   hw/ppc/mac_newworld.c         | 223 ++++++++++++++++------------------
>   hw/ppc/mac_oldworld.c         | 113 +++++++----------
>   include/hw/misc/macio/macio.h |  23 +++-
>   include/hw/nvram/mac_nvram.h  |  51 ++++++++
>   16 files changed, 230 insertions(+), 305 deletions(-)
>   delete mode 100644 hw/ppc/mac.h
>   create mode 100644 include/hw/nvram/mac_nvram.h
> 

