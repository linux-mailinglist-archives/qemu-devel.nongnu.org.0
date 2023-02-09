Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528A6912B1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 22:38:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQEbk-0003oJ-5s; Thu, 09 Feb 2023 16:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQEbi-0003oB-F9
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:37:30 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQEbe-00047c-Pt
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 16:37:30 -0500
Received: by mail-wr1-x42b.google.com with SMTP id j23so3289439wra.0
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 13:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tMfah7tF96VwCvAduM1NURqgd3P+O4Kf95GCCHFShbw=;
 b=FIN9Rvkbq0wus88bnNJ9h/UWu6s+pu1Uvb95WRrWYVLjC/lhPnMtANaFtht8vhkSXP
 MzY8crpzSIIYFfmf4CRC7Uw2S3L3SNoegvQ08rAjZQ/czKMpGg66y6DfylC1KG7VdYle
 TKCIGlmullevQnw6TwXk1kxt9TeQrhgkCxSJ6BbVx5ha26FC8akjYgg9JkdzRWZsZfhS
 DdJq5/dIINaiMC8s0F6wDxgaDQs3BEA8Er4dfuxLFVidqlM9Kc7hGzeUMA201pPYrQ6V
 TJLUnm7KQUH2ye9InG7I3EUYMTxDOKP2HgEENZDIlyT9iRrRPUKLyxjgYyod6rTUodtB
 X+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tMfah7tF96VwCvAduM1NURqgd3P+O4Kf95GCCHFShbw=;
 b=Jqu+yJWXDkwNtk5IK7Jg3tNIJ+g4Xa1ENsX777qsvSOxSteijiEbuXiC/FrVnict0R
 VZravyKfCZp+804NI0AG+dXu7esF0uEIrfJHwHDNDvujVMUaExqnPjRoFUdhQFWIgolX
 0LcTPDOJapdi6tuQFLipuun8f1y60f+SIydzube/B2yTrZMJIvKqjW8E+nJ/W8bXWhjW
 s+7V1IxAYQpWxOTEtjAWAT1KJhyWKdU6qUx6tsnTxf22Ztux0i3nKmQh4IWMvXuRdMrp
 u75KxibxBNz2MQfwLgKRGV73k5pO7eRKN3veiUSvzU+mwa4oJ1eHPdvdResjYVkOu6XN
 Nx9Q==
X-Gm-Message-State: AO0yUKVig9IdgS8NaWXz+0Gl99VVuK6XQQ3T0Gsbt6fTG9Sz/xJOeyn1
 fG3C0BZAELmNHhtB4Of2ecU7fQ==
X-Google-Smtp-Source: AK7set+g4mKKhb6fY2GSwh1OWkPF9xQRpnCgjfIMSgNVfpGs8LXO8Bx4DS7VaSi+p+2eVyR/PLxwMw==
X-Received: by 2002:a5d:40d2:0:b0:2c3:db98:3e97 with SMTP id
 b18-20020a5d40d2000000b002c3db983e97mr12154835wrq.21.1675978642609; 
 Thu, 09 Feb 2023 13:37:22 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b0027cb20605e3sm2094848wri.105.2023.02.09.13.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 13:37:22 -0800 (PST)
Message-ID: <37ebba4c-b522-37ee-dab8-c88061848d34@linaro.org>
Date: Thu, 9 Feb 2023 22:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 14/15] qapi: introduce DEVICE_ON event
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-15-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209200808.869275-15-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 9/2/23 21:08, Vladimir Sementsov-Ogievskiy wrote:
> We have DEVICE_DELETED event, that signals that device_del command is
> actually complited. But we don't have a counter-part for device_add.
> Still it's sensible for SHPC and PCIe-native hotplug, as there are time
> when the device in some intermediate state. Let's add an event that say
> that the device is finally powered on, power indicator is on and
> everything is OK for next manipulation on that device.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   qapi/qdev.json | 24 ++++++++++++++++++++++++
>   hw/pci/pcie.c  | 12 ++++++++++++
>   hw/pci/shpc.c  | 12 ++++++++++++
>   3 files changed, 48 insertions(+)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 40dc34f091..94da7ca228 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -220,3 +220,27 @@
>   ##
>   { 'event': 'HOTPLUG_STATE',
>     'data': 'HotplugState' }
> +
> +
> +##
> +# @DEVICE_ON:
> +#
> +# Emitted whenever the device insertion completion is acknowledged by the guest.
> +# For now only emitted for SHPC and PCIe-native hotplug.
> +#
> +# @device: device name
> +#
> +# @path: device path
> +#
> +# Since: 8.0
> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_ON",
> +#      "data": { "device": "virtio-net-pci-0",
> +#                "path": "/machine/peripheral/virtio-net-pci-0" },

Why provide both device & path? Could the type_name be helpful?

> +#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
> +#
> +##
> +{ 'event': 'DEVICE_ON',
> +  'data': { '*device': 'str', 'path': 'str' } }
> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> index 37e2979b3c..bc7e60ff9d 100644
> --- a/hw/pci/pcie.c
> +++ b/hw/pci/pcie.c
> @@ -45,6 +45,13 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
>           (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
>   }
>   
> +static bool pcie_sltctl_powered_on(uint16_t sltctl)
> +{
> +    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON &&
> +        (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_ON &&
> +        (sltctl & PCI_EXP_SLTCTL_AIC) == PCI_EXP_SLTCTL_ATTN_IND_OFF;
> +}
> +
>   static HotplugLedState pcie_led_state_to_qapi(uint16_t value)
>   {
>       switch (value) {
> @@ -816,6 +823,11 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
>                               0, 0, /* no state */
>                               pcie_power_state_to_qapi(old_pcc),
>                               pcie_power_state_to_qapi(pcc));
> +    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) &&
> +        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
> +    {
> +        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
> +    }

Beside this series aims, but this probably belong to the QDev layer;
if we ever model power domains & co some day.
Then this would be refactored to something like:

           qdev_set_power_on(DEVICE(child_dev));

which itself emit the event.

Regards,

Phil.

