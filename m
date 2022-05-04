Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E8951A6C4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:55:29 +0200 (CEST)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmIHg-0003ta-PC
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIEw-0001bx-Dz
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:52:38 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:43234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmIEu-0002QR-Qe
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:52:38 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e9027efe6aso1745016fac.10
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=SNZtDMmsc+c9c1SoEWxMk2qUk0moFAXWebf+3ShdMJg=;
 b=xqhV50zbkLbz6tuEfNhz4+AFY69xIvqo7kV3ojRfUNgb9xXO55FvdWdDw29KR3d1Wl
 lKVeyA2amHj/vlUcVkKQsU/4F40Xsv2NIKoAf/FI3H46bZh6vTwaw1gq/LsXCiBUf9H3
 pAFO/75fQsU/Gfd3WLZ6zoodvKoD343ucBlGn1dTY6FGNtY/El9+USeTF0v4mMYsLkur
 oiuqXlew49pdKPHDMbHtLqFA0Gwgyq4gp8dp5AukSoqjM21b9H4i7VtbUT0WeGfTDfKY
 G7kEqtEVxru8LbyaeVTaUgfeJpsaC0YAyN/bbAZbi+WlS9PzZJXRfrs2RF1Bm0BPT8D+
 E+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SNZtDMmsc+c9c1SoEWxMk2qUk0moFAXWebf+3ShdMJg=;
 b=wjdt3azaBY7jv3h55+ix1lJuv/JvIoC6gZsFbu9ucEddSRpOwiVxcgwhRNf+SWWpsu
 jXpOoMR5lxmkkG8KVguUxVyRYEu+YYGpHakbVzl8LpWE1tJEB2BHdTSq53Okz5pfnnQC
 N7Q3NRCzftx5BOP0LdcaeF+mhtidM7fa35/FJ6bPOtw3QXZPwFLhDasIeaQiaBWYE5iF
 tgSslggbr3GNU4gdXniozQz8zuMafb8WF7IQoxeQjyjUuvkBJ29EV8unlSmb8LATthT+
 lsjtIdu8MYI2WTx99NdNS1FeqOnCrabR2xfYETZbmaXpXYHnCUS95JsHbz9TJrcHcHW4
 B52Q==
X-Gm-Message-State: AOAM530CZpd34buiWGxpsM3/16cEZiksloyHlPjY/2fYKezKfqrY45bo
 ZQRb7dHHgqa1GcY/FHwn6rje+A==
X-Google-Smtp-Source: ABdhPJzw0ZaqgxFCz8XXWHvj2k+3GJeDN8dIMYDhmvGpJ8FVBbxrrsb5uX90S/7DUV4LOcFaCDIaMg==
X-Received: by 2002:a05:6870:c885:b0:e9:a6a7:6e54 with SMTP id
 er5-20020a056870c88500b000e9a6a76e54mr204153oab.130.1651683154629; 
 Wed, 04 May 2022 09:52:34 -0700 (PDT)
Received: from ?IPV6:2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1?
 ([2607:fb90:8a62:c821:2abd:6cc8:9397:7fb1])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a0568080a9500b00326293fa389sm2147421oij.44.2022.05.04.09.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 09:52:33 -0700 (PDT)
Message-ID: <06e15e2e-ef61-b659-6aee-9b7eb1061b76@linaro.org>
Date: Wed, 4 May 2022 11:52:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 05/50] dino: add memory-as property containing a link
 to the memory address space
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-6-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-6-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 02:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

