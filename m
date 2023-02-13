Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48046947CA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:16:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZdC-0000kr-5k; Mon, 13 Feb 2023 09:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZd7-0000kX-K3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:16:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZd5-0000Kz-Mm
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:16:29 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so9182535wms.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BFxk8m/A3l9GDF2CsHCPm2IsE2DccSguqHJGCG0BKpI=;
 b=TAwVUNx4CmFewlGIvSOfSTre9T9URzv1rzbhA+SZwizFc5XR/SfhBdA3byJoykQ4XN
 ZRkC1JjPMPY5ClAcGq09DRIWZPdfKW68fN2MeS1MhkoOWmj5fWS3Oq8sCN0UHncFMLXk
 mfYGBKfE1MxPQg8SRNi0ul99aujTTu2tceN+9Q0rk3rK8mf9Gixe2hjuOJAhqyWmBfEZ
 Rk4T+NpdtFMUZSP6W4Yar5jjHeBaW1qBvgwnwYOhjmV7neTocKLjE/zel4d1xqTRXRtT
 09CmfCcJ5YyWX7ULHFzPe35KlBQxFrr/akRbnObZps0UbZBKbjuS3ngbd1sHQRkObMA0
 t1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BFxk8m/A3l9GDF2CsHCPm2IsE2DccSguqHJGCG0BKpI=;
 b=myIRNomPRK6lqKjBr+5H767kTaz7GAnB9CoNI+VoKWO2hPx6xJ/e/NaRTS+bF7OEPn
 r34TyzwlRvGhac+DAT6SLZlKXm3GjtWk0YloordoR76j16Gf9bqFT29K48O5YXk/GrMI
 9eWkaXXFc/Ijwp02w5UHJwHnCJLMmk770GztEJgzn03FQu7+j4AzXaxRbANAfJC2y/fs
 Tbhv2I3P7PQRkvieDRLsnqqipDHU3PySQnfILA6XgkBqoZPAvV52Ph8BlyvRKi19N0HB
 QZBFN3gKG0j1sVfAChUujOq/uaZWZ9LucRmelk1i30kCpdRhL5d5OBFfSAgQaU+Bqrss
 Tt6w==
X-Gm-Message-State: AO0yUKVcVBLVuFlKfZCShrs0u5xXEfeOyrTlTH3qrSmArg4qpzz57Ewb
 cIkCyrv7DxODNbFZdX/rXSSODQ==
X-Google-Smtp-Source: AK7set8C05YYAgk1bsK0YrxCZp9LI6roQ36Kq3OF5TU0jAYePQijRv+FSeiQ3pQxDJAgS7gf+jXFTw==
X-Received: by 2002:a05:600c:1817:b0:3dc:405b:99bf with SMTP id
 n23-20020a05600c181700b003dc405b99bfmr19347780wmp.15.1676297785151; 
 Mon, 13 Feb 2023 06:16:25 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q3-20020a1ce903000000b003dfdeb57027sm17136048wmc.38.2023.02.13.06.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 06:16:24 -0800 (PST)
Message-ID: <4bc420b3-ce51-12c5-5373-ac5031105709@linaro.org>
Date: Mon, 13 Feb 2023 15:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 01/16] pci/shpc: set attention led to OFF on reset
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-2-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213140103.1518173-2-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 13/2/23 15:00, Vladimir Sementsov-Ogievskiy wrote:
> 0 is not a valid state for the led. Let's start with OFF.

"0 is not valid" so we should abort(value != 0) in shpc_set_status(),

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/shpc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index fca7f6691a..1b3f619dc9 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -223,6 +223,7 @@ void shpc_reset(PCIDevice *d)
>                               SHPC_SLOT_STATUS_PRSNT_MASK);
>               shpc_set_status(shpc, i, SHPC_LED_OFF, SHPC_SLOT_PWR_LED_MASK);
>           }
> +        shpc_set_status(shpc, i, SHPC_LED_OFF, SHPC_SLOT_ATTN_LED_MASK);
>           shpc_set_status(shpc, i, 0, SHPC_SLOT_STATUS_66);

... however value=0 is used:

hw/pci/shpc.c:215:            shpc_set_status(shpc, i, 0, 
SHPC_SLOT_STATUS_MRL_OPEN);
hw/pci/shpc.c:226:        shpc_set_status(shpc, i, 0, SHPC_SLOT_STATUS_66);
hw/pci/shpc.c:522:        shpc_set_status(shpc, slot, 0, 
SHPC_SLOT_STATUS_MRL_OPEN);
hw/pci/shpc.c:531:        shpc_set_status(shpc, slot, 0, 
SHPC_SLOT_STATUS_MRL_OPEN);
hw/pci/shpc.c:543:    shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_66);
hw/pci/shpc.c:589:    shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_66);

Is this fixable?

