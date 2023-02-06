Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5B68C150
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 16:29:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP3PY-0003iA-0V; Mon, 06 Feb 2023 10:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP3PE-0003am-8O
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:27:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP3PB-00058t-2T
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:27:44 -0500
Received: by mail-wr1-x42a.google.com with SMTP id i5so3566140wrc.0
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 07:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bwiGbfcWt1cMeEWPC/yatRM1Hq2EpPB8luPfTJXNUR4=;
 b=Jh9h0L21/qfUtrwJ5GE1qBRWiHRAxgIHUCnmLB/em5VtdWRiqNZ3glrYjjIMMPRLZu
 hWgvdfHlEILh5Ha2B6NPhktAyr2pq5LPtDOINoZgL83xlAD0pQBlaHaj+6QlCJqXByjD
 AT6KjTcxHq4SFfOPpToUjkdu5K5xkgAf2HEdU1YfpU2CoYieCm7nZGU5xwcTZjG5ZLNJ
 aYBRf3DzCMaEKdzLUGP4Z1GEFpJnDiogGowv/QymY/BaHuH6wUFt9hUxWJEjF7ppyycC
 4fSc4bjygzx9I15asIW6M2hewf+GGwTZMQ98FeSuqXrC4YkdwAedvh5dY2FxpoUbj0v3
 IMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bwiGbfcWt1cMeEWPC/yatRM1Hq2EpPB8luPfTJXNUR4=;
 b=7Rt3T8ZSmW6ovP544U9mqvCVWsSvUE0ocjOXlDj9M8UU3gTDzP1Hn7Z3DExudRs7RB
 /SXi1iRgreZ4o3elRaEyTCIUuzHOdQ9DPnvThY2S7qxvxpggjNjuiUrZHkAeenzFhMJA
 ziPJQvnKMTCDTAgta3nDMTGA9gIhu1pNuKsyyTGCLz0t7t+bF8A3yWliFYIeu2RCDFpJ
 xuoYFs+6ImGM5OxHTH/RzUvNgb7GAmrdyQanihzqytp2QsKye1iP9isDmOYYL52NPdbn
 TGtV4RVoj4xBtWP2Hxv8rjH7pMU9UpKtjJ4a8FvD2JzUo33dY65VNNiY1D9A2BbeHp2l
 D67A==
X-Gm-Message-State: AO0yUKVqLeMdv6PHEPazD/tVDchxmGbPGC9Nn6hsHLFjpq32UP+Qw/Oa
 WwTHS5tI9YowWVIb/IfuDnk2yg==
X-Google-Smtp-Source: AK7set9QJKwbov+bo6S/4zINjWopjzpMf4kKqZQoZNQ1ixnCKiblYkkXYpYtXKrYSO97rNZj8Gqt9Q==
X-Received: by 2002:a5d:514d:0:b0:2bf:ae1e:84d2 with SMTP id
 u13-20020a5d514d000000b002bfae1e84d2mr16311798wrt.12.1675697259415; 
 Mon, 06 Feb 2023 07:27:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v7-20020adfebc7000000b002bc7e5a1171sm9219039wrn.116.2023.02.06.07.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 07:27:38 -0800 (PST)
Message-ID: <46f52043-368c-e153-2d02-ba30220685dd@linaro.org>
Date: Mon, 6 Feb 2023 16:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/9] hw: Use QOM alias properties and few QOM/QDev cleanups
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <e30899d3-06b5-645e-3f42-c99631b5a53a@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e30899d3-06b5-645e-3f42-c99631b5a53a@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 6/2/23 00:29, Mark Cave-Ayland wrote:
> On 03/02/2023 11:36, Philippe Mathieu-Daudé wrote:
> 
>> These patches are extracted from a QOM/QDev refactor series,
>> so they are preliminary cleanups noticed while working on it:
>>
>> - Use correct type when calling qdev_prop_set_xxx()
>> - Unify some qdev properties in MIPS models
>> - Replace intermediate properties by link properties
>> - Remove DEFINE_PROP_DMAADDR() macro which is used one time
>> - Use qdev_realize_and_unref() instead of open-coding it
>>
>> Philippe Mathieu-Daudé (9):
>>    hw/i386/sgx: Do not open-code qdev_realize_and_unref()
>>    hw/ppc/sam460ex: Correctly set MAL properties
>>    hw/arm/nrf51: QOM-alias 'flash-size' property in SoC object
>>    hw/arm/fsl-imx: QOM-alias 'phy-num' property in SoC object
>>    hw/usb/hcd-ohci: Include missing 'sysbus.h' header
>>    hw/display/sm501: QOM-alias 'dma-offset' property in chipset object
>>    hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
>>    hw/mips: Declare all length properties as unsigned
>>    hw/mips/itu: Pass SAAR using QOM link property
>>
>>   hw/arm/fsl-imx25.c           |  3 +--
>>   hw/arm/fsl-imx6.c            |  3 +--
>>   hw/arm/fsl-imx6ul.c          |  8 ++++----
>>   hw/arm/fsl-imx7.c            | 12 ++++++------
>>   hw/arm/microbit.c            |  5 ++++-
>>   hw/arm/nrf51_soc.c           | 10 +---------
>>   hw/display/sm501.c           | 22 +++++++++++-----------
>>   hw/i386/sgx.c                |  5 ++---
>>   hw/intc/mips_gic.c           |  4 ++--
>>   hw/mips/boston.c             |  2 +-
>>   hw/mips/cps.c                | 35 ++++++++++++-----------------------
>>   hw/mips/malta.c              |  2 +-
>>   hw/misc/mips_cmgcr.c         |  2 +-
>>   hw/misc/mips_itu.c           | 30 ++++++++++++++++++++----------
>>   hw/nvram/nrf51_nvm.c         |  6 +++++-
>>   hw/ppc/sam460ex.c            |  4 ++--
>>   hw/sh4/r2d.c                 |  2 +-
>>   hw/usb/hcd-ohci-pci.c        |  1 -
>>   hw/usb/hcd-ohci.c            |  3 +--
>>   hw/usb/hcd-ohci.h            |  1 +
>>   include/hw/arm/fsl-imx25.h   |  1 -
>>   include/hw/arm/fsl-imx6.h    |  1 -
>>   include/hw/arm/fsl-imx6ul.h  |  2 --
>>   include/hw/arm/fsl-imx7.h    |  1 -
>>   include/hw/arm/nrf51_soc.h   |  1 -
>>   include/hw/intc/mips_gic.h   |  4 ++--
>>   include/hw/misc/mips_cmgcr.h |  2 +-
>>   include/hw/misc/mips_itu.h   |  9 ++++-----
>>   include/hw/qdev-dma.h        | 16 ----------------
>>   29 files changed, 84 insertions(+), 113 deletions(-)
>>   delete mode 100644 include/hw/qdev-dma.h
> 
> I must admit to being slightly nervous about using QOM alias properties 
> in this way, simply because you start creating implicit dependencies 
> between QOM objects. How would this work when trying to build machines 
> from configuration files and/or the monitor? Or are the changes 
> restricted to container devices i.e. those which consist of in-built 
> child devices?

The latter. All parents forward a property to a contained child.

The parent forwarding property is replaced by a link into the child,
so accessing the parent property transparently access the child one.

The dependencies are already explicit. We can not create a parent
without its children (the children creation is implicit when we
create the parent object).


I thought this was the canonical QOM alias properties use. What is
the normal use then?

