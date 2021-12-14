Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75B3474612
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:10:49 +0100 (CET)
Received: from localhost ([::1]:35490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9S4-0005FN-VU
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:10:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9NW-00009O-6Z; Tue, 14 Dec 2021 10:06:06 -0500
Received: from [2a00:1450:4864:20::434] (port=39715
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx9NS-0001zc-B7; Tue, 14 Dec 2021 10:06:05 -0500
Received: by mail-wr1-x434.google.com with SMTP id a18so32891553wrn.6;
 Tue, 14 Dec 2021 07:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i0/y1b9tOWBAfwUt3vf4VlmUcCEIxSCiagphfK2Awfo=;
 b=bzf7n+8wdrnRIUmYROYi3fIqBqv3ALuhWjLrSp10/FwciTuHMlbv/nTE5WMWLiQWKa
 EWfAziCNi2qV190AsfEefhDlrC2qGYQofrrNrEKs/7TL3eZB3Q0yWAeatmHeIdtpn1B1
 VUf+3km+a3964yr4LfILMOesdddZpA24rrTvxyDn7nHhBllIipncjNFv4ubDP2NoHfCx
 VZ0NAbK+rxvj09hTnx3/qiq1l8vak5Dsyujb4gmDR9TWNqYVCqhb0Ecrfq2ZVkityVEp
 Zk5fwk9SvmDOa1pbnytL25W0OmLEFFECRGTQdvEm4HMfWpKI/25b2Tcf/MIESgnbfJk2
 QtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=i0/y1b9tOWBAfwUt3vf4VlmUcCEIxSCiagphfK2Awfo=;
 b=NDvktcWunvaLAIkCyYk8K6X/fI77fvas0fdwfu2oAalqccCxgVw2GJ8stTtLHVZI0/
 06Sgs+v0s0Mu15FBVDEdAlwiZ0WavI5UygclxY2M/efCVE+lw3HVyqk8WIzhxy25Wpde
 arugf3+l+TQ0YihFei9LPSN+8o0/XxEyOKZISxWhwmrr47ioyWJJ7ZI6joerLro6QMbP
 dXSoQCt1f5bpg/FuMRqArex/AQBRlssDNEtVsJ6JSOzLqHEGCZYDxNHdlqH0V0xHEBr3
 KOjWu9EMqKigJ+ewjMkwgtjXL5oMAKbNpE4R/+yc1PgExauuaDv3OJDwaodoX8vZ0u9b
 wcDA==
X-Gm-Message-State: AOAM5317u4D35gSxkqab8jsUYuhOjHzRob6xeFx9eDx5o6TLY3sZLd7V
 GImbfLpUKkSvg6BahEJoPAw=
X-Google-Smtp-Source: ABdhPJx1RwSZ5b4it/DzgHHfiWGxGvFOEj4hnCn0ppJ5Bqt0tbb9tAvfQDi8kB0TMQuJy3q9OC70mQ==
X-Received: by 2002:a05:6000:18a2:: with SMTP id
 b2mr6514415wri.31.1639494360425; 
 Tue, 14 Dec 2021 07:06:00 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b19sm2668252wmb.38.2021.12.14.07.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 07:05:59 -0800 (PST)
Message-ID: <a956f9e9-3252-735f-3f00-e2c2cf5165f4@amsat.org>
Date: Tue, 14 Dec 2021 16:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0 v2] target/ppc: do not silence SNaN in xscvspdpn
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211214144459.1086343-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214144459.1086343-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 15:44, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> The non-signalling versions of VSX scalar convert to shorter/longer
> precision insns doesn't silence SNaNs in the hardware. To better match
> this behavior, use the non-arithmatic conversion of helper_todouble
> instead of float32_to_float64. A test is added to prevent future
> regressions.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v2:
> - helper_todouble instead of changing softfloat
> - Basic test for SNaN->SNaN case of xscvspdpn/xscvdpspn and SNaN->Inf
>   case of xscvdpspn
> ---
>  target/ppc/fpu_helper.c                 |  5 +---
>  tests/tcg/ppc64/Makefile.target         |  4 +--
>  tests/tcg/ppc64le/Makefile.target       |  4 +--
>  tests/tcg/ppc64le/non_signalling_xscv.c | 36 +++++++++++++++++++++++++
>  4 files changed, 41 insertions(+), 8 deletions(-)
>  create mode 100644 tests/tcg/ppc64le/non_signalling_xscv.c

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

