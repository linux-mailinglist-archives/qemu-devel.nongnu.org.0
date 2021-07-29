Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D173D9EC8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:37:50 +0200 (CEST)
Received: from localhost ([::1]:34364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90c2-0003It-1B
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90az-0002ck-4N
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:36:45 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90aw-0001BW-Da
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:36:44 -0400
Received: by mail-wr1-x433.google.com with SMTP id z4so5633135wrv.11
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MRcXjMb6mWbBdexoGdzhK3nAWHRtUEZaiFe/kmAnD90=;
 b=Urevc/OLpSiRQlxta5eLcnurNTZftQRMWiCrSxOjseY1MyENUQxQ18Erdlwoy73Kox
 cMUwffKYpf0GkXQRuGW/EP8HW7/6TJUNopnRqFgkgWqTFU6f7VUzqlJryK0qI01/db93
 bBYs4Nd2Ia10Q9XgPC5wCNptokV4e/7vIHrOfTJF848nNVpRHR3s5VeUqxCzXhP/uE1n
 D9iU34gsGXA3RtMc9asusZ5rwTvQm1xNpe0cTxfxiyIJlb+H5lJkzk5Vbt/GHm2udhTb
 tbB7tM3OKJQgvjeI79bf0IFWFPTR4pNd4nKCjzoERBtqa0psrDZmvXvURhTrZErPozYk
 YDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MRcXjMb6mWbBdexoGdzhK3nAWHRtUEZaiFe/kmAnD90=;
 b=akcP+CYNAdmW5HUm2efSrnVBbqk3BWPjvhsT7pRr3/betp1K0isRPTaWAmSnk3twwl
 Mh6ODE7Bt9UZnVYjSihNAHs2UQLubO5zkijb+7WTaY10xWr2SQrqMSVapdfIPG/RpfGX
 zjEk7nCqwGou1LCKQqtydD1JL1VF2eUzgalBpKl9tAnv6nnUWo1bYodf5VvBBwrARnzE
 mNsZDa0dzDZhjaPDJWJqm8s7gYp3MMX8GaNpSD8NKbp92mwlob9qyvMRu6Xu+UnTZIMa
 hc+lGaDbcW6HrRqdWnYvKzNdPZ/agA8m2Pkk1hr30UzxcTNRCzkduaax58nVlV/Op55g
 SMfw==
X-Gm-Message-State: AOAM533p6vOWfS+2y1LBEvv61rYaF/d7uolTpjyiM5ugcktsmPFtyN7z
 p7fVwrICWBldr3OHD4IHtK19RjZmMoRKXQ==
X-Google-Smtp-Source: ABdhPJxItVwbOzZ+vf+x3VggOeTRYAwEV/0n998f8nEbOgBxBd0kORk9wHXKK+Mh/72H0Wy8PRhMNg==
X-Received: by 2002:a5d:58c1:: with SMTP id o1mr3319217wrf.6.1627544200329;
 Thu, 29 Jul 2021 00:36:40 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id 19sm8557560wmj.2.2021.07.29.00.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:36:39 -0700 (PDT)
Subject: Re: [PATCH for-6.2 33/43] accel/tcg: Move cpu_atomic decls to
 exec/cpu_ldst.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7413793a-8feb-0fc8-1768-09e1c414f16a@amsat.org>
Date: Thu, 29 Jul 2021 09:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 7/29/21 2:46 AM, Richard Henderson wrote:
> The previous placement in tcg/tcg.h was not logical.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h       | 87 +++++++++++++++++++++++++++++++++++
>  include/tcg/tcg.h             | 87 -----------------------------------
>  target/arm/helper-a64.c       |  1 -
>  target/m68k/op_helper.c       |  1 -
>  target/ppc/mem_helper.c       |  1 -
>  target/s390x/tcg/mem_helper.c |  1 -
>  6 files changed, 87 insertions(+), 91 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

