Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A26A0CB2
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDL6-0005F0-BQ; Thu, 23 Feb 2023 10:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDL4-0005Es-NV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:16:54 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDL2-000793-Ud
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:16:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bo30so10390891wrb.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VVInaEXUtmmROxLEArOG32Zf+m1+cS5kc5aziVbXZDM=;
 b=WYqyh6rJ/KTQGy3oQAAzLEpLvhDaVmUt09IGJsssRBgZgDbQOeuBqabT8RyaCNOKeT
 f0QTtrouBTNpygFguL4dFO5LMDbzpXRNJfxRPdyIJyDV4sLfmfklOMGnjRpKJ4KTLOZh
 Ue1pSleIWDtdaiMpQHExMgs2GgKlfx3kSLGJVT/9wU87ZL4vP7OvTGmZzXObkjGsb5fp
 KtTmDmwP3eT9tCoDrmK/UiwjY3/hteADitaIpMJ2++3qzm6khm2f8BlYmSxZuT9Oph9d
 bghxs+gXgBurt9wGTQDgtchdmh5HSE9o8GbwXAoHH1EGOAaGLsTMsE/LYiDEBhoN55D/
 R6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VVInaEXUtmmROxLEArOG32Zf+m1+cS5kc5aziVbXZDM=;
 b=zS10vk6mAK7nCMzReJubYml/80zf2EdA57XsCijttwUhbetV8Mpil/xkN2SoRQtI/t
 FBMN1xu3rsNXRRn5cIVEKziGQFH6kYdpkqQCwNJ4Ym1tfJO7o03vD0QOzqomyNjQ5JZ/
 sQwRXpmLdB5DoqUjbq8yOo8LOgwK7JhT41wqsR/PDNzfKdLNU/PPuiKJfPFQRRtP44bS
 YS40SLWhP5Y8Sia0AhSiGl5au1NzwIH3hoNX14O1iR38wdtgz0DVrtqLOqSKu++s2LPg
 NziwZQstWGrZT+1fs21dYyklSUfH8NO6g4BxDkaO84K6ezB4/k+B6LzGqxUWDRDXXu1N
 P7HQ==
X-Gm-Message-State: AO0yUKVTN3fL/kvjY1xZx08KVXeNSchP5ely9RjjRHEIELWf7rt6mi8Q
 RvHWFZjEpNf66ExyMNIrzCKrCqJCI0BWhVz6
X-Google-Smtp-Source: AK7set+QUpJuHge31PGN4UwmIfYnlYa6W09kQN4dFAfMCPT3kTDS8fdHjCUirGZjxU60MI4Wbg8mpw==
X-Received: by 2002:a5d:408e:0:b0:2c7:deb:c61 with SMTP id
 o14-20020a5d408e000000b002c70deb0c61mr3863539wrp.39.1677165410107; 
 Thu, 23 Feb 2023 07:16:50 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a5d4c88000000b002c5598c14acsm11578413wrs.6.2023.02.23.07.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:16:49 -0800 (PST)
Message-ID: <e432c04d-6682-596f-c5bc-5266a38bbe0d@linaro.org>
Date: Thu, 23 Feb 2023 16:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/7] hw/net/eepro100: Finish QDev conversion
Content-Language: en-US
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>
References: <20230213101048.94519-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213101048.94519-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

ping

On 13/2/23 11:10, Philippe Mathieu-Daudé wrote:
> Convert EEPRO100 to use the latest QDev conventions / style.
> 
> v1:
> https://lore.kernel.org/qemu-devel/20230213070820.76881-9-philmd@linaro.org/
> 
> Based-on: <20230213070423.76428-1-philmd@linaro.org>
>            hw/qdev: Housekeeping around qdev_get_parent_bus()
> 
> Philippe Mathieu-Daudé (7):
>    hw/net/eepro100: Abort if pci_add_capability() ever fail
>    hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract parent
>    hw/net/eepro100: Convert reset handler to DeviceReset
>    hw/net/eepro100: Pass E100PCIDeviceInfo as class init data
>    hw/net/eepro100: Remove instance
>      EEPRO100State::has_extended_tcb_support
>    hw/net/eepro100: Remove instance's EEPRO100State::device
>    hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100()
> 
>   hw/net/eepro100.c | 147 ++++++++++++++++++++++------------------------
>   1 file changed, 69 insertions(+), 78 deletions(-)
> 


