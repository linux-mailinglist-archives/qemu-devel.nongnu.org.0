Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E017617BD5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:45:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqY5e-0001gA-Qi; Thu, 03 Nov 2022 07:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqY59-0001Xe-Vp
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:08:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqY58-0001qL-Iv
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 07:08:23 -0400
Received: by mail-wm1-x32c.google.com with SMTP id t4so889441wmj.5
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xIbQCrkcJfImG8cdWqyClu3+i6GpExPlrGJWMiW5x9o=;
 b=yk6tk2s2b60kXcaAhe4wNfxkBtYWpFA1K2NaPuVRgbUZumyWUlqzUQDH867PcyR3DI
 o6FNVY6aOSKXv6p3IQQKbOn7BQgmn1lfym4m/xJgZAS8QAfyDpr+rRRP+jKafFOFtpPu
 8jz9YqIPg8dWdyiN02aGEmIJLdA/jYQ2GRRmYLA6jiKrGikbBxFs8Eyi9m0gQlD78Afk
 bcxOeuwxE9fqT6exOoos9Q10znLhHQlsUl2U/cojNdlsbqiCKUnnAxYM9vvt6jU+G/Z6
 JcRDmOPBsf0rMUxoDXpLkTvztI//wtSGQDegXAX8aXs+Iv5U0Edxd28c452y0mHpSC0X
 U6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xIbQCrkcJfImG8cdWqyClu3+i6GpExPlrGJWMiW5x9o=;
 b=OqaSVpJCV9v7zIszHep/vNV6IMLp/y2QqiPDDZirinOsn02QO/j5LAdDPruNYK68Ty
 jVT7QjYFnK8cPPirJBLhxwL72QMpVN0eyfCw4vQhrdTL44FCliJOpvZLfUoFEGx4zbcX
 XDoKFO5QU0ay77F9YBN2eLBOXK5Y39hfU3PAiDy8H5DRNqmLSKD+KHVC1HwNlamSTcgL
 Ay19X8H+QEGzboIcxMfyA8FVnwu65gMNnMMAJp9x5EuESJTZZveZLLnJlMc1PmL8WM4T
 I+G8fnuK1rER1dJOJ5cu01QPZqg2U/etE4PdB0sXGHGofKXH0E6Q6GtwRNFREOzAX4LA
 C1hQ==
X-Gm-Message-State: ACrzQf3Tb4h0Ih3ZSAzQSQU3EiIaLT9MWUktcPqtzJcwB65zW6p2aJFM
 jHOZlu8aWuPnWQ4jDA5ygWg2Bg==
X-Google-Smtp-Source: AMsMyM6r4RIbo5Gvq6pAOFS7Yja9gtbO0j6tdOjHtDepDH1TdPZDF/PaWbzAL8K42W2zswCgNGvN4A==
X-Received: by 2002:a05:600c:468e:b0:3c6:f510:735c with SMTP id
 p14-20020a05600c468e00b003c6f510735cmr18638999wmo.179.1667473701169; 
 Thu, 03 Nov 2022 04:08:21 -0700 (PDT)
Received: from [192.168.182.175] (216.red-88-29-181.dynamicip.rima-tde.net.
 [88.29.181.216]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c350100b003c6c182bef9sm5625522wmq.36.2022.11.03.04.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 04:08:20 -0700 (PDT)
Message-ID: <77d8aaea-cab9-6e79-7fea-b228b7a9d82d@linaro.org>
Date: Thu, 3 Nov 2022 12:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] Add missing include statement for global xml_builtin
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20221103083815.464612-1-sw@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221103083815.464612-1-sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/11/22 09:38, Stefan Weil via wrote:
> This fixes some compiler warnings with compiler flag
> -Wmissing-variable-declarations (tested with clang):
> 
>      aarch64_be-linux-user-gdbstub-xml.c:564:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]
>      aarch64-linux-user-gdbstub-xml.c:564:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]
>      aarch64-softmmu-gdbstub-xml.c:1763:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   scripts/feature_to_c.sh | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


