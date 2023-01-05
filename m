Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E265ED98
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:47:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDQZF-00048K-90; Thu, 05 Jan 2023 08:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDQZD-00047e-7v
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:45:59 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDQZB-0002fw-Nq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:45:58 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h16so36127692wrz.12
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XsGlZaKkPX4ROS4QH5s803iAer2NzQBJ208hJe36hDA=;
 b=GLrJgbQeR627q+uCt4h3YKEhcmRxpaoi/nGKmVm1549fGP7hHTlc7MDTyjbZ4loO18
 /zXJnsfCgsEuI7zJELGfS0gZZIifB87ipNizU82MMIRbgFqqcUWuP/42EQsB5FKgpFIq
 GUiaC5qivqYYGWDo2TFEe7kFv3aaZ5UTbX/HsKGkcZXl2kl4ukyrsveCex5nJn/2YH3T
 EWitCOmYy4SfiL0/tpbL2A5J7uEQGqRczl0Pgr/QDvJZXSnnBASCswma2x91hPP9BKCN
 DaIBdipXu7EMuo231UqhcfMgiZNQE7vzIOnNcq8CiwiN4SmPelNMZaSCoHyHFXvjs2Jp
 noyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XsGlZaKkPX4ROS4QH5s803iAer2NzQBJ208hJe36hDA=;
 b=d204EGGdMEFZGzIZW8QgBZVDpRQdeNV8qqK3NdgbIQ+E+CqE/uwlVA6LnvYQ+YmKh4
 OdU78hlM3gSfao2i9/RTs/Z1VFPF1v11coQ9SgaZmUj5OER1BnNPAdJk6WlEs2e3uSqh
 1abhmgs45+tYitCdaw6ixvBMwZ99YXF7DgyIzp95G2KuSjbHWE6IjocXdAf2hqLTpDUt
 pmscRFqpk1YST+CL6INebtDFjib6Ok0X+1hVv3aSZrxfpio2gDsGXI2dyVTVJ3+Rpeqs
 4/IYz4gLtCWUCzlCtD5RGBntkHntOX7jKqQpRwsuhSjncjTQCx45hA4EjSRCrl9CQzFq
 oUOQ==
X-Gm-Message-State: AFqh2koMntszluHj1rRasKmQa55RAYA/FLKWLK7vZPSwZlfv5aQNEizJ
 qh3XZY4N3CznAzmw28UloM9VSA==
X-Google-Smtp-Source: AMrXdXv6bXJWoMVMken2sHYwY0l3yFal3MwANLXgJFy4jta47pfFbiLkSXaQXaF0fdd3bo/uHFKkqQ==
X-Received: by 2002:a5d:5259:0:b0:2ae:a029:ddba with SMTP id
 k25-20020a5d5259000000b002aea029ddbamr2451126wrc.2.1672926355981; 
 Thu, 05 Jan 2023 05:45:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w17-20020a5d5451000000b0023662d97130sm36931751wrv.20.2023.01.05.05.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 05:45:55 -0800 (PST)
Message-ID: <e82561d4-f934-c966-2a41-ff319e754031@linaro.org>
Date: Thu, 5 Jan 2023 14:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 1/7] input/adb: Only include header where needed
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <f46bc751e8426f9d937c9540f2e67d2f0b2cc582.1672868854.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <f46bc751e8426f9d937c9540f2e67d2f0b2cc582.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 4/1/23 22:59, BALATON Zoltan wrote:
> The header hw/input/adb.h is included by some files that don't need
> it. Clean it up and include only where necessary.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/cuda.c         | 2 --
>   hw/misc/macio/pmu.c          | 3 ---
>   hw/misc/mos6522.c            | 1 -
>   include/hw/misc/mac_via.h    | 1 +
>   include/hw/misc/macio/cuda.h | 1 +
>   include/hw/misc/macio/pmu.h  | 1 +
>   include/hw/misc/mos6522.h    | 3 +--
>   7 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


