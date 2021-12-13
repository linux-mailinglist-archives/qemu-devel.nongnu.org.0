Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C417A472C71
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 13:41:01 +0100 (CET)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwkdY-0004Gr-Az
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 07:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkZD-0002gY-HP; Mon, 13 Dec 2021 07:36:31 -0500
Received: from [2a00:1450:4864:20::32a] (port=37823
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwkZB-0004QY-Fu; Mon, 13 Dec 2021 07:36:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso13915556wms.2; 
 Mon, 13 Dec 2021 04:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2bRhGSnS4UZRR/m3+9KQ94vzQubyZcN9RVLgx/IC78M=;
 b=Cbi3n7gNMFSed0i7gcSAmlOZQHUfriQ6qViNq2UR+D8zJQmZERLWpgDBnm3MMZIpFL
 1gDDhABmG+c3ycMM/NJC7fES+2/Z5rr+d6wDeewdo5vKb21mHferzuFUTnlol7Q2DgU2
 MvlS0U1N68DnHFoUPnyUApPun3sySylbhaLPbBRmpnpRuyNge3ry1MdrV0NwjTfacd+I
 +SDO0elOkgqzpSvZisstsHV3HTAtFNDwhRYLZBQ9jMq5u/BxmMqHOM42N/Z5YA5ENtKT
 InAPUY68o1wSzWHikZfkS+1XIJHM5uZN6gvZgszS+BfSkeOLnGMyhRLjdbXV6PUeVUuu
 HAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2bRhGSnS4UZRR/m3+9KQ94vzQubyZcN9RVLgx/IC78M=;
 b=g7xcqQfy+n8VHTapprOBsP3gluGNSX+vKkl+o8GO3UvhLo+KFE3c2ayOsIF/4Lf5mR
 sH5GF546rAb2Aztp3igJNNbhKJ6aMVUp6Z3+Qtyc3OgI3soLvUzHjwK9IEedwfC2gcMd
 gk9CNJDVB5PcrFrHK9VDJ42FmH9XLAQNGBDDWZWCGjUkenBcLFiht1qNfFpEeA9XuB2I
 PkCtVsPlV2pq5XLPga7lUzcg3gPqlbNfXcDi1f5wqKh9SzTEn1mHZ0BochgzvFIcNPW0
 +eSfMTx7G+ewJCQwWXiCuZ213IbZUWPYkTQDjkN1dWKFcFxvJ2afn8hUx32KoBYHhEyN
 XB4g==
X-Gm-Message-State: AOAM531JEkc3NHK4eNs3qvHOSid9CFtsh21zlE7/vgvRtGrd1/g4Rx00
 jOw4rVwd4W8fiyr5AJLO2JIIeliFm2ST1A==
X-Google-Smtp-Source: ABdhPJxm9lkc5fL+mlX/PkFmxxipjDUiVT7OXpSAJJHtCahMEQ7njTXSR58doJ1gWdCpLSgCaKf43w==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr36877477wmj.166.1639398984807; 
 Mon, 13 Dec 2021 04:36:24 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id az15sm7386513wmb.0.2021.12.13.04.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 04:36:24 -0800 (PST)
Message-ID: <e5c3273a-8438-e7cc-6856-796fa1639786@amsat.org>
Date: Mon, 13 Dec 2021 13:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] target/ppc: do not silence snan in xscvspdpn
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 13:13, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> The non-signalling versions of VSX scalar convert to shorter/longer
> precision insns doesn't silence SNaNs in the hardware. We are currently
> honoring this behavior in xscvdpspn, since helper_xscvdpspn handles the
> conversion with extracts/deposits/etc. OTOH, xscvspdpn uses
> float32_to_float64 that calls parts_float_to_float, which uses
> parts_return_nan that finally calls parts_silence_nan if the input is an
> SNaN.
> 
> To address this problem, this patch adds a new float_status flag
> (return_snan) to avoid the call to parts_silence_nan in the
> float_class_snan case of parts_return_nan.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> This behavior was observed in a Power9 and can be reproduced with the
> following code:
> 
> int main(void)
> {
>     __uint128_t t, b = 0x7f80000200000000;
> 
>     asm("xscvspdpn %x0, %x1\n\t"
>         : "=wa" (t)
>         : "wa" (b << 64));
>     printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>            (uint64_t)(t >> 64), (uint64_t)t);
> 
>     b = 0x7ff0000000000002;
>     asm("xscvdpspn %x0, %x1\n\t"
>         : "=wa" (t)
>         : "wa" (b << 64));
>     printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>            (uint64_t)(t >> 64), (uint64_t)t);
> 
>     return 0;
> }

Why not add this test in tests/tcg/ppc64le/ ?

> 
> That results in:
> $ ./xscv_non_signaling
> xscvspdpn: 0x7ff00000400000000000000000000000
> xscvdpspn: 0x7f8000007f8000000000000000000000
> $ qemu-ppc64le ./xscv_non_signaling
> xscvspdpn: 0x7ff80000400000000000000000000000
> xscvdpspn: 0x7f8000007f8000000000000000000000
> 
> PowerISA is more descriptive of xscvdpspn wrt SNaN but doesn't say
> anything about NaNs in xscvspdpn description. Should we match the
> hardware behavior? If so, does it worth adding a new flag in
> float_status for a single instruction? We could also handle that in
> helper_xscvdpspn, e.g.:
> 
> float32 sp = xb >> 32;
> float64 dp;
> 
> dp = float32_to_float64(xb >> 32, &tstat);
> if (float32_classify(sp) == is_snan) {
>     dp &= ~(1ULL << 51);
>     dp |= (dp & 0x7ffffffffffffULL) == 0;
> }
> 
> return dp;
> 
> but it feels kind hacky.

