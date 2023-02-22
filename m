Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A40569F320
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 12:06:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmwI-0005fb-6A; Wed, 22 Feb 2023 06:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUmw4-0005eq-8l
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:05:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUmvz-0006qb-RY
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 06:05:17 -0500
Received: by mail-wm1-x333.google.com with SMTP id p16so3181620wmq.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 03:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+kgomDHpkSnrdgmz+gghLUeXTacAChli+ikmvB1LUo=;
 b=jeBo7V/BvZ89uii38IMjuwBd9Qqt/iNat5XiIMYjxDl9gAuVwN2LDwJiH3c/88EBvg
 umHBALPMkLDD5O0KvLW6y9ySCXiQ8tUzmf/wQvbGJy9MSLHHvaeWZ4wjXXKyzD7c5KUc
 WrR0CcPQW3M0isTXl22LU13nvdZrIvQIvDgUChwBUGJ7VPQXKoAr+NJpBDhydqh2GM9/
 0JMTqOv0X1pKCUxbSVD9+VT0Pdgpp7lY7ps+GBg26+Eoq/Kr0hejbjWX+g5f/rzky799
 77Dot/KfSzdqXiuyCq7/1zIFPiKuKRZxKF5eBPLz4NJnbDlwW2n3B9/rG0az0h3SwdKA
 puCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+kgomDHpkSnrdgmz+gghLUeXTacAChli+ikmvB1LUo=;
 b=AL1pX3lMwrflyIzEEGelxEYQe3weux93ZYlr00oZPN9kdbTNcTYjUx2ozKy15PpTx5
 Gv8Dft/wuymI4WFJ7n8JFTnIFOpqEf+2yfrSHWGva82rqNLCUSwbRwyY5tnhCMLtqlgV
 EIShLZZRYVx7PX5LLyDkRwXpvovYzfZjxrShy2uQaTPvXYikrUtSAHCgS4xYehm2pbl0
 GGaWcCzmxAkNg6zSno2RG8MN9VsYcTBfFcGSj0dbferHmSvgiHyDRMaHIhgCEz1ippFk
 0E1U+tk/Rf8WFfyGtGGVBwvIcfK7q1F+h8nfUaH5OY+qJS2nmCXtP1aKASuEv29Qts9a
 4QVw==
X-Gm-Message-State: AO0yUKU++cQRF/puo1gW0Gu8BnueB7piypSXC+dGF7LTP8F/zRtH14gN
 8tMRTf8K3HQc3zk1ws1Bg6fxCg==
X-Google-Smtp-Source: AK7set8zPLnca2t3Z+Q5osLae87Qy8qYK5bb1j0bQx8TxdXStppbdBQR6FYgNnBKUXjTiusht1gYhQ==
X-Received: by 2002:a05:600c:44c5:b0:3db:bc5:b2ae with SMTP id
 f5-20020a05600c44c500b003db0bc5b2aemr5865166wmo.41.1677063913460; 
 Wed, 22 Feb 2023 03:05:13 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z6-20020adfe546000000b002425be3c9e2sm6710223wrm.60.2023.02.22.03.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 03:05:13 -0800 (PST)
Message-ID: <85e92bb7-161e-41f8-2ea0-bb4f285d19aa@linaro.org>
Date: Wed, 22 Feb 2023 12:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 5/9] hw/i386/pc_{q35, piix}: Minimize usage of
 get_system_memory()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230213162004.2797-1-shentey@gmail.com>
 <20230213162004.2797-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213162004.2797-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 13/2/23 17:20, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/i386/pc_piix.c | 2 +-
>   hw/i386/pc_q35.c  | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


