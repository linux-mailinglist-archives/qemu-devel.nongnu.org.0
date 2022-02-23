Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA14F4C0A30
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 04:25:40 +0100 (CET)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMiHb-0007FF-OZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 22:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMiFe-0005n5-OG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 22:23:38 -0500
Received: from [2607:f8b0:4864:20::635] (port=44031
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMiFc-0006XM-Dp
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 22:23:38 -0500
Received: by mail-pl1-x635.google.com with SMTP id x11so17451346pll.10
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 19:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uYRi2Hk732EBRdFgm9ZMCxIleGEBllFpzLR4J6ir6Oo=;
 b=pWEP5EjPsBq067YY6R3zVw+Tl8uW+/uzedAH2G+K6LSoGHoYOV4jivMSadmd2gjoCh
 NSyFAyX0ShU09XJXWZjTGYQPhOGN8qPyfo4+78A0OmV+bx23sD3TJ9FjTqYKkHnA0b8R
 1DyviVZLcSuShA+/p1ANX50+/5lANLaZ/Wkey0gaqlahAGkwSPvKspxmqLzPTyZoKN1/
 eEoo0g8nV1vJZHsI50s1zu4mhw6d0Vax8Usm6SsvPQ/kkGiNUTTAHA9bAHdLWR2viHGs
 BWcCU9k/pGVxPnXvftUmFQfXkZgL/idyCV89+NImWdg0k8uZPjyJtEZjCt/LoFeFWOq4
 +zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uYRi2Hk732EBRdFgm9ZMCxIleGEBllFpzLR4J6ir6Oo=;
 b=oMbrikwAxxP0ec0hQIkcnunLgeVueS+Go7Llf/gKamXRRyq41I4O0Pm6LqnarawI/+
 D9rz1DjqNH/qboA5XfqM99WtRaNHB4lpiljrvD4ST0c5jnH5/9exBLu8RAUejadzQfKM
 inUVAPF23KTNXExnxObQab1KAu6Ns1aSG6ZvvLYXw+X5OXXqlvRKbkStpU79+3asZ1rR
 Tg33zDLFRdV797EAkMwM62ZZ+pH3KEVY0G34IEDxxU3Vi/5kP7eYIhTRwnZzVfKOgnb/
 Dn9N2H7cTEzoXvlNpmnUGB3vMBbvbr3uZngPr4bXIwdhd9iOGNR6qj+dZcmf1CGiDIxP
 OkYw==
X-Gm-Message-State: AOAM530Ls4DkqSNSSzn5S6itVoim6Q7EfsjCks0N4028XWUfTaEvAOW/
 DchZvx95Xscbn1T4NDmVGbPBtA==
X-Google-Smtp-Source: ABdhPJzA4QmcKAGpFqN9qvAh/xt1HwH3jZeCdKql0bT0yZvSuRpz+crbgtPrDpqzFIAgT1wlc+QfYw==
X-Received: by 2002:a17:902:8e8a:b0:14f:a673:bb61 with SMTP id
 bg10-20020a1709028e8a00b0014fa673bb61mr14203682plb.151.1645586608841; 
 Tue, 22 Feb 2022 19:23:28 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id 142sm19106173pfy.41.2022.02.22.19.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 19:23:28 -0800 (PST)
Message-ID: <e3ce8de6-364d-2163-0916-4c78cdf4b307@linaro.org>
Date: Tue, 22 Feb 2022 17:23:24 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 47/47] target/ppc: implement lxvr[bhwd]/stxvr[bhwd]x
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-48-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-48-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: Lucas Coutinho <lucas.coutinho@eldorado.org.br>, groug@kaod.org,
 danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Lucas Coutinho<lucas.coutinho@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instuctions:
> lxvrbx: Load VSX Vector Rightmost Byte Indexed X-form
> lxvrhx: Load VSX Vector Rightmost Halfword Indexed X-form
> lxvrwx: Load VSX Vector Rightmost Word Indexed X-form
> lxvrdx: Load VSX Vector Rightmost Doubleword Indexed X-form
> 
> stxvrbx: Store VSX Vector Rightmost Byte Indexed X-form
> stxvrhx: Store VSX Vector Rightmost Halfword Indexed X-form
> stxvrwx: Store VSX Vector Rightmost Word Indexed X-form
> stxvrdx: Store VSX Vector Rightmost Doubleword Indexed X-form
> 
> Signed-off-by: Lucas Coutinho<lucas.coutinho@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  8 +++++++
>   target/ppc/translate/vsx-impl.c.inc | 35 +++++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

