Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253EE609B06
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 09:09:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompgT-0001FW-5E; Mon, 24 Oct 2022 01:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompgJ-0001BT-5x
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:07:23 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompgE-0007sw-BM
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:07:22 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 186-20020a1c02c3000000b003c6c154d528so9194557wmc.4
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d3OApg5AiT/G4eC69hRJaSZsc47p4rVtwtvw8rTb9/c=;
 b=J0JvysXgshVveRKWlKONoWZXUJW6MfXUkF+V+i1M+7bMr6T0F3TmHxLxpw13PMLPb6
 HYVmN4G8gr8Xi0/OL2EDXbpQ5WMqIaaHd3rfANthgzlBvtGorKPDpDsJzCZIZTes29zu
 1nG0K/ZsKNz3OY7Go00uaSU8qgIcdYSmcddg2DsdyFRpDClqBAXO2uaj/hX57D2gE4Ci
 85qe7g/8eXv1VIvJciT8obw7wumS+dqwl6e/IfFwDko/Td970U9SuG1VingSO3iOJrSz
 icbqycTBseHhhqqlaMDfprCS64VKD9qflPy/ycW8quPzK/obnyk3voIIjXbiZWm4pedl
 4xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d3OApg5AiT/G4eC69hRJaSZsc47p4rVtwtvw8rTb9/c=;
 b=0AcIX7gPCqFK/SuY+9nBPk1iaM/nRiy47/2nCCUyMWCEB5oUdIxyCsFhJoXSa/n4Gc
 aFkJ2aksoD9XP6fqpj8WglfG799z6aMe3VmJDc43opwo4qW9NqfYCuwyzhUHcUgYHa2g
 6W/lGj/iFGeMk9aapzOtg7jq7Vb2wSN9qZGwN9InETpux3r8CktHiGptSb984tSwkTf2
 8pGtZFvVtSxvJ7Dc7L+lU7o7xIC/VJxULMD24hJQ3yRUSNysCelOhpIZtcHoqXu1nCao
 bjL/mdZWYCD6ZOoqJgZNbYjwUcK2fur4C3bXPywOQbegV51V69M4hubbrJotUcuGYtj/
 FCGQ==
X-Gm-Message-State: ACrzQf30s+yp3HDUKRX6mK2O2zxQmT/mbjVP3s2TIcr0i2bZ/9d911xF
 svMVEyqaykp6/zTjMSEy3deYTQ==
X-Google-Smtp-Source: AMsMyM7kQKAYT1dCcZrjq9FSNF60m2tI9F7RdS/202ujt/cGcZLoko0OeSKC2JUOgNeiAUT3DrEhGg==
X-Received: by 2002:a05:600c:4f54:b0:3c6:edec:2787 with SMTP id
 m20-20020a05600c4f5400b003c6edec2787mr21245907wmq.109.1666588034281; 
 Sun, 23 Oct 2022 22:07:14 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 l39-20020a05600c1d2700b003c6deb5c1edsm9909978wms.45.2022.10.23.22.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 22:07:13 -0700 (PDT)
Message-ID: <d9b75a95-3241-e0cd-277d-d326cbed476f@linaro.org>
Date: Mon, 24 Oct 2022 07:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 25/43] hw/mips/malta: Reuse dev variable
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-26-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-26-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 22/10/22 17:04, Bernhard Beschow wrote:
> While at it, move the assignments closer to where they are used.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/mips/malta.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


