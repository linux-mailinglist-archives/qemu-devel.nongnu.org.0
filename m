Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF3364828C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 13:46:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3cl4-0004oq-PC; Fri, 09 Dec 2022 07:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ckd-0004nd-Bn
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:45:18 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3ckb-0006XT-Iv
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 07:45:14 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so3349039wmi.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 04:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AR1yYNL2sEReO8s7XL1CbCSRY4T9T/J+588tKA67U+Y=;
 b=XkLzvn7o21EVc5cGDDeMDqkLQpC09yWjBlWP5yly8O1NNQd+LzpvAixvk//0O1u3T9
 82TsggLlFWhhgK6WeEJbbDFeEUaMdpa1XkaGFmogpSFlBWQmT1taA6qT50CaCNV2hB7H
 DNSDdiiJTmVk9na+44udLHzbfPpE0OTgJyl9gneZwulDaGhqbKzNOjjc5hzrVpwFacCx
 5C80Ero6H33Yos+ka3C/qxPJc6hQuczlCPljbXOlSzTVyp7N6wV3DwbnTejAgv0RxnCz
 2R/wUorBw3s6h/ER/y8OUKMH5SJqs0QNbsniL6YKorE6mth5oAb4enMPSa6s2SwgUyh8
 4lDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AR1yYNL2sEReO8s7XL1CbCSRY4T9T/J+588tKA67U+Y=;
 b=J6hXMPRHlit90U94tVk2VbaYJ/GxuF/V1D095GqunqXF4GyFT7LkcBwMxdKPE+Zs9Z
 wEUqlYYDmR4W7CCWW0gz2Yvfgo7KzAjPRUyaZ8yDjGpOY5tvhhAm5+xdPtNn6d4uoWtl
 XRRZqNnaB/u5npqedp/qgyiFchQdQ9oa0LhCJjlR69/rhun1h1jaKMcATH1/7WTccKsI
 uVEbqezlMxmLXCIsbRLqt4Fcl1YFfA+nLGsD0YJO7Qhr26eBNsovvAq9v6Y9INL4GSXB
 nkFEIn1igR8m/5JK2MOe9mfuvlcmScmiHe66YLycvTxNHEJAuBvnfcq30rmjdm29LGXD
 58ZQ==
X-Gm-Message-State: ANoB5pl4bysVD+bEKMI7xoJngz1F/5IP8upOy0KF3+hyerIWzmSVU6iq
 p8go9Hc1rMWma0XyZr1/B1jHUQ==
X-Google-Smtp-Source: AA0mqf6JFfX+848KdoJbNSk8OxmIWEbaXMBVipUKPpHDSgyvMiytuWv6VEMJXGoZUsAn+vwqvHpTjQ==
X-Received: by 2002:a05:600c:310e:b0:3cf:a39f:eb2a with SMTP id
 g14-20020a05600c310e00b003cfa39feb2amr4900229wmo.11.1670589911628; 
 Fri, 09 Dec 2022 04:45:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003b435c41103sm10796785wmo.0.2022.12.09.04.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 04:45:11 -0800 (PST)
Message-ID: <e8809116-81bf-2c8f-44dc-240174b105f2@linaro.org>
Date: Fri, 9 Dec 2022 13:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 14/30] configure: test all warnings
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-15-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221209112409.184703-15-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 12:23, Paolo Bonzini wrote:
> Some warnings are hardcoded in QEMU_CFLAGS and not tested.  There is
> no particular reason to single out these five, as many more -W flags are
> present on all the supported compilers.  For homogeneity when moving
> the detection to meson, make them use the same warn_flags infrastructure.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


