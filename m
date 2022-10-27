Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462C66104ED
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:59:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAs4-0007ix-LC; Thu, 27 Oct 2022 17:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooArz-0007gc-Cv
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:56:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooArx-0001Se-QR
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:56:59 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 r186-20020a1c44c3000000b003cf4d389c41so2383287wma.3
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LrEvYQ/d6pQCn55yDPGCE1ADzGSM2bZdesm7hXoQz5g=;
 b=VRz5kKOLFB2bZ6raLT4xx22zl1du6yoFzrnIuQEGfYL7Pl0jBrAVJDyFmOQZ0QlJvg
 MpUB56Yt0v4gFF4QMo1U3YI7vVy0VmQuxKVh2MJHud5GnMl7ePqHsMCVEXtnEP5e+3zT
 WtYtOyQkznA62EcEdbPrEUs2qzMisSlFeHUBvswg095ojdKRXU7iheiWnEkfmjse/nPW
 mdmYEr2TGQYy74TMaybM+V80MpeuxpuH/f2OaIT/8oNvf3dSBXZhRN+m8Rlfz8zbRTNq
 we0MXWsf6XC9c9NV6/cHWIfZFFxjgmx9m9qyz5oz2m1Kdk6HHjnEmvDBLjfILNYwAeYG
 rX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LrEvYQ/d6pQCn55yDPGCE1ADzGSM2bZdesm7hXoQz5g=;
 b=sj1p3J/b3Y3jXpuyARPItbmqKdn9u2FGREHNFuAVcrgkmVJ3EFrTBQheIX0bnjLajX
 +DBdV/ljG5e6zHYAmjVBUX5eirD94BBo5tm8EdcavYDFNKPJ2vwSu7fCocRYCN8LVaLt
 Kmvbr7sWVuJtxFZXuakvsIujFv3o50z2v8ZZ359HYYcE29zY8XQDXCJP9cSU8RKQfuh1
 PEX5RhoW0JF2LdrBEbUfPJ2jKBmUZtgd7mVxcORshWPjlaIZGufNeehRNh6luVMZn5+i
 lU9ivb8NoSr2c7SZ2AmZoaf9v2M1BmnmCtQi7phivim6S6p9QlWJhlNiZmI+fYFAtFLx
 OlTQ==
X-Gm-Message-State: ACrzQf04EBtruS7dX0Y5z4+SM+DFsma7kWWpbYrNYthOwnYHLxSctlXC
 Xn5HVXudFBnyt6E1fZS7wmQWjA==
X-Google-Smtp-Source: AMsMyM5Ey2/SRoWEr+5AQ5QciRq6/SuG2U8O6SIjtTELV1KFSqJESP/XlcwhX3b6rf94qKTi6ASiFg==
X-Received: by 2002:a7b:cb8d:0:b0:3cf:4969:9bc7 with SMTP id
 m13-20020a7bcb8d000000b003cf49699bc7mr7470429wmi.71.1666907815469; 
 Thu, 27 Oct 2022 14:56:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c350900b003b4935f04a4sm3314614wmq.5.2022.10.27.14.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:56:54 -0700 (PDT)
Message-ID: <d8f9dd49-e06d-c0a3-056c-30600c0f7388@linaro.org>
Date: Thu, 27 Oct 2022 23:56:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 3/4] hw/i386/acpi-build: Resolve PIIX ISA bridge rather
 than ACPI controller
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221026133110.91828-1-shentey@gmail.com>
 <20221026133110.91828-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221026133110.91828-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/22 15:31, Bernhard Beschow wrote:
> Resolving the PIIX ISA bridge rather than the PIIX ACPI controller mirrors
> the ICH9 code one line below.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/acpi-build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


