Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D843BCB5E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:06:17 +0200 (CEST)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iu7-00043a-SC
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0isd-0002Q6-P5
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0isa-0004ft-EX
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 07:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625569478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7AbVnA5e9vYP2819AcRFl5Chq8Aly/fAP0a660hw+o=;
 b=A07kst4tsV1T8xQJv/HkoaUqjlZtekbwhBJ1l7CvUegnRXgZrMebfdPbFqXrszsTl+21Oc
 7qnBjdWMNbFsJsagmfpUF2q1tP3vs+99vU/5cxQEz2sEs6ODOXY1DSTuOSC2QOfOyyIiqn
 g5VQvVS+5YvWvSMP+XXsxrlnmHfaFiU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-B18FwwyoNY64tb0cT5vXWg-1; Tue, 06 Jul 2021 07:04:37 -0400
X-MC-Unique: B18FwwyoNY64tb0cT5vXWg-1
Received: by mail-wr1-f71.google.com with SMTP id
 y5-20020adfe6c50000b02901258bf1d760so7028089wrm.14
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r7AbVnA5e9vYP2819AcRFl5Chq8Aly/fAP0a660hw+o=;
 b=dYCZ4GLlmjBbMFUW/x2ZW70aE7hZxcCjfvoJD66a3UW1g273XhEWs4tWJyOUUAAKPx
 ioMkg41CuihwUxcQ7EzABzCKjpJDtdtEtdZp3u7EBV2WICeh+Rc7iwEHH/cpi2RodgJY
 vnSY+tTnbQq/7xLShIq3gTZ/2OJB4FTrManttIqNBIbFk9v8Cb1sKT1wNMlOU6q/QP+R
 yH7vPf9wGAn39au0yhdw83x73cV7kPWD744IMMbik1XTRYThhyFhpShCWIxB5TWFE+5+
 qpVS1hFIJzE1sib6UBZkyA9CZ7RS5ToZ10hFeRFq7xG27j/v4KJcy505JZ9jUyBrIbDS
 M2Jg==
X-Gm-Message-State: AOAM533HNZhK/qZstHQiIaL1OGnEk7qjbwWt6ZL4x0lJ8PI79uyGi3Fx
 WiXxDRIYg2/TGpbvYxIJ5LRlmH3KyxGc/hEJQr1MXmvBSQg+E9waspgbR+Lis9WrpePO7WVF4Cg
 tM4N07hWTh7rl4TA=
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr4160496wmk.124.1625569476490; 
 Tue, 06 Jul 2021 04:04:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkMrWgMFY3EcMwVWoaNHqzST/cNGd9TxNZ55biwaRLblx1xBRjqKjdvY5qi7wKsKmQNVR5rg==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr4160463wmk.124.1625569476259; 
 Tue, 06 Jul 2021 04:04:36 -0700 (PDT)
Received: from thuth.remote.csb (pd9575e24.dip0.t-ipconnect.de. [217.87.94.36])
 by smtp.gmail.com with ESMTPSA id n5sm7679401wri.31.2021.07.06.04.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 04:04:35 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v1 3/5] hw/arm: move CONFIG_V7M out of default-devices
Message-ID: <7dbd2f9f-9c00-1771-1b5b-4992fc0930cf@redhat.com>
Date: Tue, 6 Jul 2021 13:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/06/2021 17.21, Alex Bennée wrote:
> We currently select CONFIG_V7M for a bunch of our m-profile devices.
> The last sticking point is translate.c which cannot be compiled
> without expecting v7m support. Express this dependency in Kconfig
> rather than in default devices as a stepping stone to a fully
> configurable translate.c.
> 
> While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
> as that is implied for M profile machines.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> vconfigs
>    - cherry pick from re-factor
>    - minor tweak to subject line
> ---
>   default-configs/devices/arm-softmmu.mak | 3 ---
>   hw/arm/Kconfig                          | 3 +++
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 0500156a0c..4114aa9e35 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -1,8 +1,5 @@
>   # Default configuration for arm-softmmu
>   
> -# TODO: ARM_V7M is currently always required - make this more flexible!
> -CONFIG_ARM_V7M=y
> -
>   # CONFIG_PCI_DEVICES=n
>   # CONFIG_TEST_DEVICES=n
>   
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 528f71bb9d..062fe94b64 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -296,7 +296,10 @@ config ZYNQ
>   
>   config ARM_V7M
>       bool
> +    # currently v7M must be included in a TCG build due to translate.c
> +    default y if TCG && (ARM || AARCH64)
>       select PTIMER
> +    select ARM_COMPATIBLE_SEMIHOSTING

Reviewed-by: Thomas Huth <thuth@redhat.com>


