Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFAF6A429F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:28:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcKI-0006S3-N3; Mon, 27 Feb 2023 07:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcKE-0006QM-Ld
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:09:52 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcKC-000421-I1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:09:49 -0500
Received: by mail-wr1-x42d.google.com with SMTP id j2so5941636wrh.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5lRBRknSELuGTs0/7v9WdVG72nz6IsbLE0VnVlwp+v8=;
 b=cMK4SReVzIIq6tbw5pz93sFEEU6FzmnrU21I+Z3LnT45SaSweq8BB7sdF5+ZbH1ajy
 1b3g6Q/hkyXL9p2Q4G7rAFlIETTa2GATak8hKpG4hepg+Vtex6/kpTTn9T+hxXGkH1tG
 X72Oussp766eQkNmfe3eazuOzkBpDMwsMwRhenWatjKOlNDl6ooJSN/s3PvdMCEuNi0u
 o+cPfbsfLfe7dUTeJWnYQSWpwCfwKMuhWfSh3wt0iylQivQ/S4Q/0WO/QecXmMxfcHWZ
 ZYXORCH0U2iG+38ndt2b0O+8Jcnx0bmH/cqZuFRjUvvt2VPAyy4Rd5ZUAvgmju89he0V
 ulAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5lRBRknSELuGTs0/7v9WdVG72nz6IsbLE0VnVlwp+v8=;
 b=BvrwGT4nhKEasNEE+8uX4iYCq3DIeJsuhLOblbHbedE7q5jW5mG//w6IfGuKga7Hse
 6niAv6WbII0CU80xg9+bTBjPQ2fXpHvl1PHqBTYIReWm4sPCeRuQKWvXej3kgp9uAhXw
 2+8Zz84qkCIu9fv73Gi6Z7b4MxqR0uzP7zwGB6Mad9O+oxuxKdoZqFTUb/KipcoEXiOC
 /YsNyOHCbA+utx6RVgxLlzraAM9J8yUULRhovS9k0LZ13181CNWrLpG1TbOEOV4DrvrU
 2jbeHVSmY5hEFaqvGmErW6copsN3hvGF6uM/ccPQHIpES54/iYXMJAAM7MK1ujntHgts
 SQ7w==
X-Gm-Message-State: AO0yUKUQFE3nBRalrBCsbq5b8buH+09wGjCk/0tusQ+ikHrNYNufNaIx
 SYoO4YohEc+SB2zurOOTfba4pg==
X-Google-Smtp-Source: AK7set8OBqsBLfxMOr4fWneLzeMCOr0r20jAQlLQUUX/UDizvGr220ix2WgME6syGVG+386yguoaaw==
X-Received: by 2002:adf:d84b:0:b0:2c9:f488:5f54 with SMTP id
 k11-20020adfd84b000000b002c9f4885f54mr4279033wrl.57.1677499787054; 
 Mon, 27 Feb 2023 04:09:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v14-20020adfedce000000b002c7b229b1basm6980240wro.15.2023.02.27.04.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 04:09:46 -0800 (PST)
Message-ID: <60ff1957-3b78-a371-e5a4-e7f091883b32@linaro.org>
Date: Mon, 27 Feb 2023 13:09:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 11/12] hw/i386/ich9: Clean up includes
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-12-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-12-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 13/2/23 18:30, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/i386/ich9.h | 8 +++++---
>   hw/i386/acpi-build.c   | 1 +
>   hw/isa/lpc_ich9.c      | 2 +-
>   3 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


