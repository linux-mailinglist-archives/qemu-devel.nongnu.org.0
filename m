Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F304F198E
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 19:09:20 +0200 (CEST)
Received: from localhost ([::1]:50738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbQCd-0007hW-4o
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 13:09:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nbQBG-0006ms-So
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:07:54 -0400
Received: from [2a00:1450:4864:20::62a] (port=36590
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nbQBF-0004ms-2j
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 13:07:54 -0400
Received: by mail-ej1-x62a.google.com with SMTP id k23so17885061ejd.3
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kJJy9m7lsy/qsyEM04bal1kIR2bn06vN7EkfU1nyj9k=;
 b=DAA31YvnH4FxOLBuQ24Mt+d2YzruiK5HGteAE26E/6XLXTrbHt1JzHXNUFWSv5HuiF
 G3GNFhx9D5JHHCzt63sYRujN61c2oPn5F3y0ljft9eFjjQ0QdDxIUox4374vENGZHns+
 nWCUkzKX/wsMRmsSN7oORxmun2vMGYGVhFkh2Y3bBZ66SIvtsD2rD5glIM9Iq/jsJO/W
 /gSCLWtmsQ9PkYwaBqo11VHelD54w6Gr4z5mqceurSYtWoKnqurB0OzlFsRuyZmMTLse
 1EP4ZIUJOaiVZyEu3vn819f5rRKmAwRvzDGNcoIm8Iu4Uki+XvGjFeDCIGvbM84XvdDD
 yA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kJJy9m7lsy/qsyEM04bal1kIR2bn06vN7EkfU1nyj9k=;
 b=X1BR3Vv+yDtlyEUQP8i6ehoMMyJnvHLgcuGuWU6phuWJ/KJqpDMQk1jIE/rqG7IH7t
 GsKad9f3SgOga1OVkPJHFyppWbS2Eo7HpjrfQ340A1ysVhsgxW7WwY1R+7mpGGz35vYq
 NIDlNmJgEFkt+tgp0kcKrD2pitaGOCZrthQuZArksvt0WBtBaMZwtmIMArFuEEoW6bPy
 c5g8ndmO0SnGRf/Z39VHxZWXj3rPlSjScyo6Ft2Q8XGe5NedztQSZZE6oCYRypYCk+ro
 raP0TtawihAeUvMZzMkiByZ0ThB5BshJ2a4zshkyEPUz35EvMYDRjJpLcBDCTm9Xj1HX
 OdYg==
X-Gm-Message-State: AOAM533uze5SJVxcxfBMmAx9IiBFBmGrxi7hKGkVsLV0p3PhVkyPpelT
 HVYdNybwQE1Aflyioky2YN4GbA==
X-Google-Smtp-Source: ABdhPJyAG0O5Fbp9bYTjKLNxP+YWEUp0X1mF6VaUy7i5MqJLFDx+GUrC/KFhQpLgWSR1DIhOIzmDSg==
X-Received: by 2002:a17:906:4787:b0:6e1:409f:8deb with SMTP id
 cw7-20020a170906478700b006e1409f8debmr1108939ejc.80.1649092067928; 
 Mon, 04 Apr 2022 10:07:47 -0700 (PDT)
Received: from [192.168.3.227] ([185.81.138.21])
 by smtp.gmail.com with ESMTPSA id
 go40-20020a1709070da800b006dfc3945312sm4577095ejc.202.2022.04.04.10.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:07:47 -0700 (PDT)
Message-ID: <e9fbf63c-1e22-f5be-3552-ac28206e4d7b@linaro.org>
Date: Mon, 4 Apr 2022 12:07:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1] hw/arm/virt: Check for attempt to use TrustZone
 with KVM or HVF
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404155301.566542-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404155301.566542-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 4/4/22 10:53, Peter Maydell wrote:
> It's not possible to provide the guest with the Security extensions
> (TrustZone) when using KVM or HVF, because the hardware
> virtualization extensions don't permit running EL3 guest code.
> However, we weren't checking for this combination, with the result
> that QEMU would assert if you tried it:
> 
> $ qemu-system-aarch64 -enable-kvm -machine virt,secure=on -cpu host -display none
> Unexpected error in object_property_find_err() at ../../qom/object.c:1304:
> qemu-system-aarch64: Property 'host-arm-cpu.secure-memory' not found
> Aborted
> 
> Check for this combination of options and report an error, in the
> same way we already do for attempts to give a KVM or HVF guest the
> Virtualization or MTE extensions. Now we will report:
> 
> qemu-system-aarch64: mach-virt: KVM does not support providing Security extensions (TrustZone) to the guest CPU
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Not a regression, so not worth fixing in 7.0.
> ---
>   hw/arm/virt.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

