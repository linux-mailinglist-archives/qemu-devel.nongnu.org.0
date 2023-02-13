Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22C76947BE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:11:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZXV-00040H-1R; Mon, 13 Feb 2023 09:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZXR-000406-Ud
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:10:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZXQ-0007VV-DN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:10:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso11361629wmp.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xUFCpeMZVEy94xLaOvCS1bAJflJJY9Q5X8N+dIL9ZF8=;
 b=pm0RZ2v6QKdNdAKmTe+Yq+zbK6qZSWvLQnYTsmuZIOGqWAI1BtHGVlEFVgNJb6vrPF
 3YuMCh194kClHlOfzHZhe5yP295zCaZ6fLsU62uRko+sZiivN4f7DR61ntuPdzBG6iN2
 44u+ponKoEbJisDhfYr4IwdjDB9As6WqBlzgn4WvE+620UnyLlnMequjqmM81vm7xwq5
 r98vqQxZI+9onp76Uf3RpEKEtLbwpwjKr4+M2aRvCRuSVnMOjbhoyo/7x4cSmwNaUgVX
 m667AuqpfIq26J1Zy72Vcmt3Inz85OqjAWOcmkqAXrXsJkrwviF2BYzC18tlvyPwv0Ed
 MZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xUFCpeMZVEy94xLaOvCS1bAJflJJY9Q5X8N+dIL9ZF8=;
 b=OILqd7HO5oWftCo8e+s0yttNAKKNAZ6XnIAwCGiybby7TnsizY7aw2Ni/79/Yr1cb5
 Y9Y+rvWE2rhxb/JY3wvYsI/4gD4giVtOBlXT64Q+T5cFdf5WF2CbeCcD89PX0UlrRrnw
 m4MRXe/AUu/BR7kXf/bQuoK/BQobYrnDQvnvKac6BM336hH6yWxQqcQuwNY0HxAY8Tjl
 7V6L5NzPea8yKoDffNJsfpKBN2XZztP7fVhGpNDZtTkyTwc3dEC1qSS5I10PaxX1Gao8
 3tU8roPYtDJ3AqGmvHwM+EDISxhP6wFhCMHL5zKUQI8naJaO9Vz3Jsj0rMqNbtrLBsSt
 HO5g==
X-Gm-Message-State: AO0yUKWFvYWZCmAd2rw8l5EPM8qV1YvlJGXseezwLGEYsjJNad1MOAeU
 AB7i4yl7wX+XdsZCXDNl9S7zLg==
X-Google-Smtp-Source: AK7set8gL70jkIXm8IB4zPhkwZB0zTgIlOpYLeV+sJArj0+oLLPIz3nEz5/colvKK+N5KTLSWNCIag==
X-Received: by 2002:a05:600c:32a7:b0:3df:dea7:8ec with SMTP id
 t39-20020a05600c32a700b003dfdea708ecmr19666471wmp.20.1676297432147; 
 Mon, 13 Feb 2023 06:10:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m23-20020a7bca57000000b003de8a1b06c0sm17087061wml.7.2023.02.13.06.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:10:31 -0800 (PST)
Message-ID: <7fc9712a-136a-d296-4a7b-194195f3b699@linaro.org>
Date: Mon, 13 Feb 2023 15:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 15/16] qapi: add HOTPLUG_STATE event
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-16-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213140103.1518173-16-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 13/2/23 15:01, Vladimir Sementsov-Ogievskiy wrote:
> For PCIe and SHPC hotplug it's important to track led indicators,
> especially the power led. Add an event that helps.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   qapi/qdev.json                  | 175 ++++++++++++++++++++++++++++++++
>   include/hw/hotplug.h            |  12 +++
>   include/hw/pci/pci.h            |   3 +
>   include/hw/pci/pci_bridge.h     |   2 +
>   include/hw/pci/pcie.h           |   2 +
>   include/hw/pci/shpc.h           |   2 +
>   include/monitor/qdev.h          |   5 +
>   hw/core/hotplug.c               |  13 +++
>   hw/pci-bridge/pci_bridge_dev.c  |  14 +++
>   hw/pci-bridge/pcie_pci_bridge.c |   1 +
>   hw/pci/pcie.c                   |  79 ++++++++++++++
>   hw/pci/pcie_port.c              |   1 +
>   hw/pci/shpc.c                   | 102 ++++++++++++++++++-
>   softmmu/qdev-monitor.c          |  39 +++++++
>   14 files changed, 445 insertions(+), 5 deletions(-)

-ETOOBIG

> +##
> +# @HotplugSHPCSlotState:
> +#
> +# Standard Hot-Plug Controller slot state.
> +#
> +# @power-only: Slot is powered on but neither clock nor bus are connected.
> +#
> +# @enabled: Slot is powered on, clock and bus are connected, the card is
> +#           fully functional from a hardware standpoint.
> +#
> +# @disabled: Slot is disabled, card us safe to be removed.

s/us/is/

> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'HotplugSHPCSlotState',
> +  'data': [ 'power-only', 'enabled', 'disabled' ] }


