Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCA667285
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:48:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFx0A-0007mF-GX; Thu, 12 Jan 2023 07:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx03-0007kB-Ve
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:48:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx02-0005AH-Dt
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:48:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m3so13125390wmq.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4uDrzEhn9Ql1uGXWp3heg9u1rvBVu6E9pTu8NEZagTg=;
 b=BxBVDuzI+7uKbojvbKuBNQmK9GI9dyOJWj20Dx/X3Qm9tT7fwK7HXA5SruWSneBiIg
 ddHRwSH0hQNWN9FoQ13k8wGZBVqXZ2v84eKOlYnLuYjNWnOhMQQ8X6RUHfvD2WhSphZ3
 +1u88lLhR4HWLg6Ws452aNOi0SSbt7fmkfQVlMBJt59YQWZFQLdtg0AxaStVKKZ3FeDL
 tuaTueOoeQoFQWsqJXEUAIIwvyOFaQTWAcm/DEiZX2vLEpmZvvTWydpy3R+hl4j3w/Je
 1hSmolR3wO4zLij2tr4su3h/MaXCaGHMmhGvJiJ3krmYwAGcorlaE6uKuQeBTAtYhiRC
 3QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4uDrzEhn9Ql1uGXWp3heg9u1rvBVu6E9pTu8NEZagTg=;
 b=Pj5Qdnp8NWndmADgollsYpZiagYgg1kcgHJ1Ojy3C/3og5w5WnAtgGTUkOiXBFcVXK
 9rdXuIdDA2FvQjbltwz5n6MlJ72V9gdeatox4lhnfGpFhfdofkwkE0IXKGv7crcFticJ
 3Bw0hzHm8Bjy++vIDPAR6MquUtqmQ5KiBj3nKXvuWC/8+b10WgeMSX3b/NbIFGShuq+c
 53/D7fcO4nfe8+XQ9JEWTpMgFYMVHN7X7f8KkOKagDu2OLJlWzsxUcxUUy+r537KKbmk
 Z+jUtd898e8dU917vVRvg2qQLgLIeoR2f9tjtK14F1l0FBguz4NnLdAOTc6wrajD2dLc
 8KOg==
X-Gm-Message-State: AFqh2krI8HhhIfwMZ9oqqFeXPGt32KKPp0YVHb9Znem8L7nkbdmFVLcK
 eyHm7j1Du0+WgRaR+2yUnLbt5g==
X-Google-Smtp-Source: AMrXdXuIWskHhS877RKMbDVxM68ye1LuZbLiir35zUuKueQ8MzAR7Kbs5VJsBO58JoUKaZLQTeIkaw==
X-Received: by 2002:a05:600c:46cd:b0:3d9:a145:4d1a with SMTP id
 q13-20020a05600c46cd00b003d9a1454d1amr34836422wmo.34.1673527684921; 
 Thu, 12 Jan 2023 04:48:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003d22528decesm30517209wms.43.2023.01.12.04.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:48:04 -0800 (PST)
Message-ID: <50473bb7-c91f-4264-45b9-525125e3c2bf@linaro.org>
Date: Thu, 12 Jan 2023 13:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 22/33] hw/isa/piix3: Drop the "3" from PIIX base class
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
 <20230109172347.1830-23-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-23-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
> This commit marks the finalization of the PIIX3 preparations
> to be merged with PIIX4. In particular, PIIXState is prepared
> to be reused in piix4.c.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-25-shentey@gmail.com>
> ---
>   include/hw/southbridge/piix.h |  6 ++--
>   hw/isa/piix3.c                | 60 +++++++++++++++++------------------
>   2 files changed, 32 insertions(+), 34 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


