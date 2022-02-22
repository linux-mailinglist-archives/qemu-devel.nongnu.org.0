Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96254C0135
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 19:25:10 +0100 (CET)
Received: from localhost ([::1]:44048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZqX-0008Ki-2D
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 13:25:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZls-0004Jb-TT
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:20:21 -0500
Received: from [2607:f8b0:4864:20::433] (port=36370
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMZlr-0003Xv-3t
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 13:20:20 -0500
Received: by mail-pf1-x433.google.com with SMTP id z16so12914634pfh.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 10:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+Mehn42dvaj1U/2Dktc/tr4ppkY2r05sdFUprnjXr+8=;
 b=RKHuUrDf5c4qdG0zJ3CNt9iLJBBVlpJ5EWD7JNd/Ld3a10FK2HFSGfCUOcju/zmt4R
 beaS+2zpEO0Ril0fJ7UEPDHObf5EQqjFIIfJeDGAngQ1xoQJkd1H0KFHtx1ziqljY1RK
 /gMkZYm7HL90mngJIHCgqIsk1fTIQpLrgUWfvbA1Y3zIFNdBepbRwP9VmKE3HEdGFbVo
 wOSAUmyk+io+JH2PJLsc+6itIqmf+OaxESrQ+eCVl11oh0r029F6KLRWbDew5iF2KKVm
 ElTcEGvNTzBtYwaoRdSiSO8G9SE9zbt8Y2KMo0RavamvkO4ND2sHLlho5K/BOFf3wbPa
 gTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+Mehn42dvaj1U/2Dktc/tr4ppkY2r05sdFUprnjXr+8=;
 b=X+s4wXn4l1EdHZGi26VcEn19LEuqQFhfpii8914m053bfbsM1ancrlgfAPJd1WKimq
 FKyVLIfXyi1WzLrk0VqEzFpPWFkuHlKnacVZCvhWVCvi9HKzdKz7LFQpE/BnGP31btt2
 Qk3OkRsABocf+Wnx83uhvK8iFa635z7rZnzdFDKPypn25UH1sRF5gst8XKSj/RRYHoE1
 FaD9BJZD456mxvrTqXMcTPMcLU0h+mBDyO69kSC+94Nmd2MHqcuEbh2Mdiwn8ntwrCma
 N5QmyVqnxyxKEBwnvBMTEPv+wFdeV0nK8exX0yV7eBMQKU+7V80ECMBGLKtWYGeiLhuX
 khNQ==
X-Gm-Message-State: AOAM531FyBdsFG9fIaCtbEVpUyn5KR7Gub6Soh75RW0YOg7erO3kah0I
 DfLUz9G1/qQuuTkli/AuPinwvQ==
X-Google-Smtp-Source: ABdhPJxeh4k6l8nGT/WT0yw4cugWiGpPjxO+MAVvcoPTtI91NGtCxVH6uv2nSDGKZRwxIVLiMZ57VA==
X-Received: by 2002:a63:914a:0:b0:36c:70c9:8057 with SMTP id
 l71-20020a63914a000000b0036c70c98057mr20567960pge.597.1645554003313; 
 Tue, 22 Feb 2022 10:20:03 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id m21sm21310364pgh.69.2022.02.22.10.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 10:20:02 -0800 (PST)
Message-ID: <432916c0-15bb-0620-b219-e97948fac57f@linaro.org>
Date: Tue, 22 Feb 2022 08:19:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 03/47] target/ppc: Moved vector multiply high and low
 to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.castro@eldorado.org.br>
> 
> Moved instructions vmulld, vmulhuw, vmulhsw, vmulhud and vmulhsd to
> decodetree
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  8 ++++----
>   target/ppc/insn32.decode            |  6 ++++++
>   target/ppc/int_helper.c             |  8 ++++----
>   target/ppc/translate/vmx-impl.c.inc | 21 ++++++++++++++++-----
>   target/ppc/translate/vmx-ops.c.inc  |  5 -----
>   5 files changed, 30 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

