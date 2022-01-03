Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022464837DD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 20:59:50 +0100 (CET)
Received: from localhost ([::1]:36480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4TUi-0006Me-9U
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 14:59:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4TTI-0005U3-2a; Mon, 03 Jan 2022 14:58:20 -0500
Received: from [2607:f8b0:4864:20::102d] (port=35769
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4TTG-0005no-M5; Mon, 03 Jan 2022 14:58:19 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso25409949pje.0; 
 Mon, 03 Jan 2022 11:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SBE6KQP37CWnde/CbhtlOyjyXw1Api0n+yun7sxgR/k=;
 b=nauJea3zM8Oh5iPcBvoOGPIT0Y9mqeYl98xfD0LoR85OkqdJW5c2GQH5w7LSYJYVOD
 y9R77UuvjdlBd4c/l+e2XwMmf6QNTbMfqYreKWkU1dvsNP6V2lMdtWpOHNdfsdAbBn3t
 84Kxvi9sJ5wpgivLrWLDACDyzA6JFqi9kVHWX4q6TqpoFtSJgMrkmncUZofpCl3QFdkv
 qQQ3aWP+YhTVTl9TXK4HL+s6msDF4yPZLhcbc3s1RTyJ7Se/QuwuSFLOaNYdqrdHf9Bn
 aGbMVl1GPoXh4GWsaiGJ3HBOrexYF0zAaK+jZd+bVf5v0blyswIiVGK6+2r2x4pn76ZI
 ZPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SBE6KQP37CWnde/CbhtlOyjyXw1Api0n+yun7sxgR/k=;
 b=ac4OWKJk7BfNJbmnE5Z/lhB96WBgBLKQw8IlIW1j4L/b9/U6bjNNffcsBYO9b2Wi9N
 dcXLAWCDSTfZb/+uBQWVm3aIQGGhjXCGnYzS//eZwKWbNoI/1orrPYfxkX/x++XVCE6c
 9bA4ng3T7K7MMi6ExmCJAo72kHtToxMrY7bLSlr4C3q68ROjw2A+RpX3Sv+0LQarZwCs
 PeO9qI6oGccXhOgyo+KrnVKAarFTRIKJI+61BJ6h66NOBOK1+dCEx+HhrJuZSByiMvYM
 IMxHe8SdOC2kuk8JfqBx/TIvY2dF0Pc0nZeQPqzFWzQCJQuiJcURcXD68gsPJ28g9mfb
 /Zhg==
X-Gm-Message-State: AOAM531GVtutlCA5rot6ECILv2W0Vxx8/GW5U3s7bMjwmBQfTj1S+78U
 uMV0QBia3flSfiaIEFAA5Jg=
X-Google-Smtp-Source: ABdhPJxVnV2mrZJW+eRaIkX5gzZftxdUqkd9vw2WCpeqcm1nXzLjc/d6qwpv3MlsbkGie/Wom5SD3w==
X-Received: by 2002:a17:90a:fe0b:: with SMTP id
 ck11mr57853472pjb.22.1641239896904; 
 Mon, 03 Jan 2022 11:58:16 -0800 (PST)
Received: from [192.168.1.37] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b9sm41473192pfm.127.2022.01.03.11.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 11:58:16 -0800 (PST)
Message-ID: <9f571604-6999-d12a-ac6d-ea461bf2fd64@amsat.org>
Date: Mon, 3 Jan 2022 20:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 3/4] hw/arm: add i2c muxes to kudo-bmc
Content-Language: en-US
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
References: <20220102215844.2888833-1-venture@google.com>
 <20220102215844.2888833-4-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220102215844.2888833-4-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wuhaotsh@google.com, titusr@google.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, crauer@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:58, Patrick Venture wrote:
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>   hw/arm/npcm7xx_boards.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

