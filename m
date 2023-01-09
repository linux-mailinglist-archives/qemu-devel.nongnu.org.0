Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A0661F03
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 08:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEmGp-0004Le-4d; Mon, 09 Jan 2023 02:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEmGn-0004LW-Vl
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 02:08:34 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEmGm-00012V-4g
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 02:08:33 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z5so6112145wrt.6
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 23:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pWH5upMTYES8bNmCov+cKCDiQLIT99KVIe4Aef2UuNw=;
 b=QqUoyMTRrS+cjIisv3Tl/6YmxYFzbOiCvjdiwpxG9O8VSEVjdQQnlGnarNHW6hzAcz
 LB3i6zj9YMsOuAgaZRujfsV5y7pO/SNvfWAuuauXC26P0ZligKIHuw9EhqPK0sfcQ4FM
 Ti99gFrtrRN44XiVyjxVsKCEby3xJ8TbzeWdGle1oZNaLMYj+gj6zXIL3R3I2O/pb91N
 sPmXCmyUDfLM+1LVhh0btl2koWevdxlSc6F2H7mkp5wUytqumA/4sJV5Iw2CvY5nGP2m
 +/otdV0dKU0OcSnOQbLn32BpiSvZbTprHtGCtxHBsIsuuYy8YmMFrEgbMdyO0Oqjzgku
 FDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pWH5upMTYES8bNmCov+cKCDiQLIT99KVIe4Aef2UuNw=;
 b=wekz18fH9teNpwxzTQbX6zcThBG9p7KTTA2BB+7DclAKYFVssXAiHnYeGqxod2F/Vj
 Wi/Hyh6Hud0uky+fvErjaX8XyJihpqDtn/94tNNLLMH6JAIDNE8D8KdgwaSehzu7hs0J
 Tek35x/reW3dsywWMc1LiVmWfaD8uChRK9lWiOihF7T7fmB1BY3pElyhRIZ80FwUbyRT
 wEiEBkWx3JsBcwsRTdNWaO/0lEqxuUO3b5kwGd1DRIpYGJAnazcN/O4dHU32uIXKlmFY
 tv7Vjev/AkzJ1077/4TQ0j/CG/eyjAjZgEXOjFzRKbpRfT27X1y8DF5FT+xil82ROVdu
 8MhQ==
X-Gm-Message-State: AFqh2ko1J917a0R+buBEBKXemLH1RiQwnTbWKymBleOGASyzx2gjoOyx
 phtD/uIJEOEQjUeoYFBqjjxpMg==
X-Google-Smtp-Source: AMrXdXuVmI/YVwd+Y4ZTg4nPzylKyZK4NBtxlKCkIjbk6OGgU/sMfFBy5Pd1z8amv1LrRbLDsyL0Tg==
X-Received: by 2002:a5d:624d:0:b0:2ba:bd95:e38e with SMTP id
 m13-20020a5d624d000000b002babd95e38emr6635560wrv.41.1673248109940; 
 Sun, 08 Jan 2023 23:08:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u8-20020a05600c19c800b003d9780466b0sm11269428wmq.31.2023.01.08.23.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 23:08:29 -0800 (PST)
Message-ID: <efc22d4c-d250-5bd2-d599-0a6460fa1d68@linaro.org>
Date: Mon, 9 Jan 2023 08:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] vhost-user: Correct a reference of TARGET_AARCH64
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230109063130.81296-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109063130.81296-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/1/23 07:31, Akihiko Odaki wrote:
> Presumably TARGET_ARM_64 should be a mistake of TARGET_AARCH64.
> 

Fixes: 27598393a2 ("Lift max memory slots limit imposed by vhost-user")

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   hw/virtio/vhost-user.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index d9ce0501b2..6c79da953b 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -48,7 +48,7 @@
>    * hardware plaform.
>    */
>   #if defined(TARGET_X86) || defined(TARGET_X86_64) || \
> -    defined(TARGET_ARM) || defined(TARGET_ARM_64)
> +    defined(TARGET_ARM) || defined(TARGET_AARCH64)
>   #include "hw/acpi/acpi.h"
>   #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
>   


