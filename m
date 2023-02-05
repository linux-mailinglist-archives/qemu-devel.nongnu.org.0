Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D266568AF65
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcdz-0006dV-2G; Sun, 05 Feb 2023 05:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcdu-0006dJ-Gf
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:53:06 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcds-0004NW-Rc
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:53:06 -0500
Received: by mail-ed1-x529.google.com with SMTP id v10so9014893edi.8
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O+9Qi7hgz5CbZOJmdtcTuw8atxYbc06dyVclq2HHwQw=;
 b=IvnpQDt9AUTX2iFDrvZ5DieubxL2HIPVsrHUyLpZKJCsojAvI/0Nzl80U1+w3XZWZi
 +0mnbUIeaTZHe1Bo4ovpW2w/RfbPGlSS6PbBhfmaG1GYE6NdQ+jYq9eThVbqgTVDwUnO
 xDOxbU0GS8OrytwIgyEWe3JfSgsswiER+XmEKyP4Ynz0S+DGvrPwXkBWU/LvVyU3KsHX
 h38t1bOjJNZqnZjNCUJ1Zg391z2kjnZ0qe3KnXIV772t91SUGiydvRE9LsnOGgOIDJ3z
 Hm0n7q0YtFjtFS77IG8FN+B63PfPHZdC/h0HPxHyeEPHbwxxB2gZke5/Rv5W7QBrUH+F
 +Img==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O+9Qi7hgz5CbZOJmdtcTuw8atxYbc06dyVclq2HHwQw=;
 b=ndVPhSxSMBdf2xseOXf21EoCRwte3SP5sczYiTs3h4di3fOV8UuBqh3FCe4stwho7D
 0JH3f0lYJ5xHSKTVmjHIgfyPzoBgBCTv216S50X8hGnsDeaIf2CyUmznclOJcYY9rQRj
 +1254NgfsvuQO/VswJSm6vseph4wiRQI3lju3QnKSDQQyU2LrzrLHdSaSgLMllYxjEAU
 NfkkTb7nW3L6WtU5GxlbQgBqKyLt1GNmviGvUAMveMiew3wVIL+fSc04ldjwhEQmTQzu
 ylDEAsKFYWrp42RW4tEH3R5zjjM5LnHHB7mT6Mn1umdBfIEYQFKk+L/oFvQm5VV5035W
 Fx5g==
X-Gm-Message-State: AO0yUKWl/Uv1DPG4mU3UTbX3JRIAVk3j3xL5iGn2RV2kiPTKFQpZV9go
 Z7mlEQ+Ep1rg7aKHWgzqrkvSdA==
X-Google-Smtp-Source: AK7set+7OWwpQLLsT6QnYw0pfifSqXjqtMyB7angZNnilo/Yo8yxGh+tM9N8QJWWgvnV8OPxO/r86g==
X-Received: by 2002:aa7:c40c:0:b0:46c:2c94:d30b with SMTP id
 j12-20020aa7c40c000000b0046c2c94d30bmr19077945edq.33.1675594383454; 
 Sun, 05 Feb 2023 02:53:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a1709068a5000b0087879f8c65asm3954244ejc.89.2023.02.05.02.53.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 02:53:02 -0800 (PST)
Message-ID: <d2b469ca-bd6d-a1cc-1a5c-91e4beaa66bb@linaro.org>
Date: Sun, 5 Feb 2023 11:53:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/4] pcie_regs: drop duplicated indicator value macros
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com
References: <20230204174758.234951-1-vsementsov@yandex-team.ru>
 <20230204174758.234951-3-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204174758.234951-3-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 4/2/23 18:47, Vladimir Sementsov-Ogievskiy wrote:
> We already have indicator values in
> include/standard-headers/linux/pci_regs.h , no reason to reinvent them
> in include/hw/pci/pcie_regs.h. (and we already have usage of
> PCI_EXP_SLTCTL_PWR_IND_BLINK and PCI_EXP_SLTCTL_PWR_IND_OFF in
> hw/pci/pcie.c, so let's be consistent)
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   include/hw/pci/pcie_regs.h |  9 ---------
>   hw/pci/pcie.c              | 13 +++++++------
>   2 files changed, 7 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


