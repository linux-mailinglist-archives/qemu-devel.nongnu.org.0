Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0557B6947BF
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:12:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZYx-0005xh-ON; Mon, 13 Feb 2023 09:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZYv-0005xH-2i
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:12:09 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZYt-0007xo-1m
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:12:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id a2so12377758wrd.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L6fNJ+RMJi5N7GKiZW7cQoLKcNQ0PW/qxkRV51xy5+c=;
 b=JgeOzUm6RHr98O2r4XznzOBushiXwNnlt6Drk4k9xqBfhvpAe8gjm+Zoy6SVbsxZP0
 n14PxCOoA8DgsIGa01Jzsmk5XrX9PIXjon+5v3sdkipDAlyhlKmp6amlUsF4FdjmIEDM
 Xa5w/NTM62mbzsYhpq3IP7tQYI8NjD/dGQc7KT4h+kQVu2hhcKOpbwCBkNFHyH6yYa1N
 gH2/ChZkg9wZfjX8Ipu4YaQ2Z0ggtYvQJYt50nyZTcldTm6gVlja0J/6m18MV0B4Wbgr
 zCH2jjcwyqmhJ7KA1v/zGBbLBifEMLE4UX1XXksDttA+Y8V6kiCjphHWUr/NmHPFJa2a
 n2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L6fNJ+RMJi5N7GKiZW7cQoLKcNQ0PW/qxkRV51xy5+c=;
 b=yKVJuKDG87yzA9ARQLo66lofK9Kd8jyoZ7Jb69iMl0tUkuHz3giup6G2Ai/j/qNR1b
 TtddvHGk1+oPnlgPcgSK5NQo16Pp7Qp+q8Abe3ryS1oikPPumkrlCvquAkN9VMg0Q0a7
 eubakH6R/znuUX1naXLkk4/OaL1OCbN7oXnZVTklRwQcTuHqo6eskm7XK00wNTogcwdc
 ZwfS+DFPwtbUy/5LRm5EhN/TWx/cmyxFXsxlQpiOqGyvK88B/MqVKw793pfmnuIRVWqm
 vM9qN1HHTgLk2S0NkuynExO4etXEfZDHmSOW26Oiq7fKME9eNNl3acHvPhC3OczOQldr
 oC9w==
X-Gm-Message-State: AO0yUKWVNuSCxIVHFLZ5VIE3LlTZjr6o9IE4f1JyLesctG2w6BQGMTKm
 OFHhLTJpoe+bgflw9zgPCqLYQg==
X-Google-Smtp-Source: AK7set/MRgU5QXB3Jt06e74zaIQzlw54gbgVEs3wf+sm88fMfbGOuHLguqVjv2xizEvz0b0H/GdY9w==
X-Received: by 2002:adf:e402:0:b0:2c5:592b:b70b with SMTP id
 g2-20020adfe402000000b002c5592bb70bmr2579071wrm.50.1676297525448; 
 Mon, 13 Feb 2023 06:12:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 a4-20020adfeec4000000b002bfc0558ecdsm10553537wrp.113.2023.02.13.06.12.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:12:05 -0800 (PST)
Message-ID: <2bd9ad31-39c8-f85b-ae5a-80de8d9ec448@linaro.org>
Date: Mon, 13 Feb 2023 15:12:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 16/16] qapi: introduce DEVICE_ON event
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, armbru@redhat.com
Cc: eblake@redhat.com, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-17-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213140103.1518173-17-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
> We have DEVICE_DELETED event, that signals that device_del command is
> actually completed. But we don't have a counter-part for device_add.
> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
> when the device in some intermediate state. Let's add an event that say
> that the device is finally powered on, power indicator is on and
> everything is OK for next manipulation on that device.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   qapi/qdev.json | 13 +++++++++++++
>   hw/pci/pcie.c  | 13 +++++++++++++
>   hw/pci/shpc.c  | 12 ++++++++++++
>   3 files changed, 38 insertions(+)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b6ad311dd4..2143bb2792 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -341,3 +341,16 @@
>   { 'command': 'query-hotplug',
>     'data': { 'id': 'str' },
>     'returns': 'HotplugInfo' }
> +
> +##
> +# @DEVICE_ON:
> +#
> +# Emitted whenever the device insertion completion is acknowledged by the guest.
> +# For now only emitted for SHPC and PCIe-native hotplug.
> +#
> +# @path: the hotplugged device's QOM path
> +#
> +# Since: 8.0
> +##
> +{ 'event': 'DEVICE_ON',
> +  'data': { 'path': 'str' } }

Could 'qom-path' or 'canonical-path' be more meaningful here?

> @@ -816,6 +823,12 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>           qdev_hotplug_state_event(DEVICE(dev), NULL, child_dev, &changed_state);
>       }
>   
> +    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) &&
> +        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
> +    {
> +        qapi_event_send_device_on(child_dev->canonical_path);
> +    }


