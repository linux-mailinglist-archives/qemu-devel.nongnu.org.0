Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0417667278
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:45:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwxF-0005Rl-50; Thu, 12 Jan 2023 07:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwxB-0005OC-R4
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:45:09 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwxA-0004FO-33
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:45:09 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bn26so17993044wrb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7F/xXmpfa6gcNdKv8Dx8M5etMEkhCkv+n97k0/aw9zo=;
 b=pKkPh3fQABWAQ7P4+l/NtU6NCnuiCjSg4KzavtYgGNO/HceLoZvbyy+BRI4JSxUWA1
 gAUGpzNTvJwkD1TjeYXVJX6ou7aA96b3J/fyHJ5qeaR36/QAOyofoCLQ7dbKh5bYoWhh
 6qRr3iIlbUowyi65XpEx5XHHdL1am3fkIxS6zRidsHnmzOEMMDIjeA5Ucc9iR75Uqm34
 x9qJWlMoTiYw++QURvtQBtaatRL27Nkz+27t4rNhzsPnUZ9Pn8L3CQFEFr+pEMmGy+MQ
 pe30QT8J1XxH220dj1sf3/HiLg+AR9JigR8+jnsSq3VSi3JZtBqp3wqyrkRgQC5AC4b7
 xCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7F/xXmpfa6gcNdKv8Dx8M5etMEkhCkv+n97k0/aw9zo=;
 b=gk/R/+rwJXy7JztCBldgenHlHcM11oRZgoO8HEqRvUj7HvgsKvgRqIz/yGQ4orIO15
 OMJ0ap7N6o5BrWICopcD/Yyw7uSGHG+xSJG0Eciir85VN64HYtTGOXsgnHsVVWzueBeW
 3qGIOKxNWxt56GbRuudR3b1FEqZm1vVTXYy5BNRYzDRdtONMPzs7NzKErAg3lcVKwoim
 6sQpVaPZd2wmYCNWxoQ8TsLnGjX4NONeeBacnYt43Dzztu18BKk5Luc/yB1fcL+YHzVQ
 ll3qVoiIdxz8lLcD8fIZ2DK3B7SnVEtYQaAmiPR+9R/pYEoXdLUtcaUSJOix2etngiDC
 zAfg==
X-Gm-Message-State: AFqh2kqcuLm7q8rD6o6QaCcNnbM5kR6m7VwyCYUBFfgnwigtWBbsdpUe
 ick7ORp86Flxy5PAS0rMWxx+Wg==
X-Google-Smtp-Source: AMrXdXtkBnvRqkXGB/F1IJAUGLEPar9R3vuS8DULRrZrMaA6uL2YGXQeG7esyoogVFTFpVyjcdYH+w==
X-Received: by 2002:adf:e88b:0:b0:2bd:c6ce:7bef with SMTP id
 d11-20020adfe88b000000b002bdc6ce7befmr3677814wrm.26.1673527506613; 
 Thu, 12 Jan 2023 04:45:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w5-20020adfcd05000000b002bdc914a139sm3476400wrm.108.2023.01.12.04.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:45:06 -0800 (PST)
Message-ID: <0b268419-a089-0a3a-5fdf-7bf107d746ae@linaro.org>
Date: Thu, 12 Jan 2023 13:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 14/33] hw/isa/piix3: Create USB controller in host
 device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-15-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-15-shentey@gmail.com>
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

On 9/1/23 18:23, Bernhard Beschow wrote:
> The USB controller is an integral part of PIIX3 (function 2). So create
> it as part of the south bridge.
> 
> Note that the USB function is optional in QEMU. This is why it gets
> object_initialize_child()'ed in realize rather than in instance_init.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-13-shentey@gmail.com>
> ---
>   include/hw/southbridge/piix.h |  4 ++++
>   hw/i386/pc_piix.c             |  7 ++-----
>   hw/isa/piix3.c                | 17 +++++++++++++++++
>   hw/isa/Kconfig                |  1 +
>   4 files changed, 24 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


