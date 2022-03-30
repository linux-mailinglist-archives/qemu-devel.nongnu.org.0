Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7614ECBCE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:24:02 +0200 (CEST)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZczB-0004ex-P7
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:24:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZckC-00044z-BA
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:08:32 -0400
Received: from [2001:4860:4864:20::2d] (port=37135
 helo=mail-oa1-x2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZckA-00068q-P2
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:08:32 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-dee0378ce7so12494530fac.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 11:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7w6N1ydciEbZHU6N0+T1BHRlU+5/Zroc9CXyPKNQCeM=;
 b=EvdhjTibnqP1VafUMf4A7PMkPPT1tz7T52xrx8SOcNERYpsCjmELYXvMrHi0CSQU8/
 2XwkjuLW/6BErupOd5WInLWE23ZoVI4w62GJ/HMy74Y+158Mx/Ifo3ZQquCjT8nVUCju
 EqE61Vyn42auGMOVmP42/s8FJ9uaMdg9MWc7h4//zaEKcomKLMBReUKgnizqewCpmSgY
 abH/TkEC8QskS5NGLFxx/a3UaTiMLtlH1flsCIE/xBCO5xhTm4H5nHrBWx61kEYEyy/H
 /zew/1sbxzE6Vb0EGoLSYBvlMrDM0BrXoCoUiXQfu403riPfxvVWsisSi62/AZ7P+2gI
 H1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7w6N1ydciEbZHU6N0+T1BHRlU+5/Zroc9CXyPKNQCeM=;
 b=oneXo6lPsuhtxf2KLh3+pRegT+OQUpu4Rf8hHuGy7YrDfd+DrG6UZdW8/jce89dSD7
 37KaNUtkwg4xfxLdpkdRS81WjxjD5KSXHVRIRkFZaF9u2dFoCThiN28TlucPEGwYrq8R
 LKCAF6+p7Rx1vehqccX/7tlX1UXYGHpfEJInN3F8W2pFXa+TDb4/gCFuPu3jCEKsWnEM
 oWAIUfyYH5oj1AyJ4SmBTdhCAf+TUVEFMsXbJWzBtQRqb0lQZ+Mzxqns1tvu+Y7EdXrA
 fbV8ML/0XhJdjpar902ejNGlC6r2d92pTZCTbD8w5XUzC/3ILMwJXVSIwwlq34+VswoU
 FSug==
X-Gm-Message-State: AOAM531c/hfmSentMHIFgzvavTf+bSkeGQs7yHXckui1u5mvWO3n/jv0
 T5dKMGSOjq3UqHAaqIHNDYVdzukZIXNy4Gfj
X-Google-Smtp-Source: ABdhPJzSsyBZR7Akj7gbc1iGPMmsa6tR3VDTxA+yVuBai3D0s9jvzkutKX3Wk1+3NgvNR8BoB37iPw==
X-Received: by 2002:a05:6870:a10e:b0:dd:bc3a:d2c2 with SMTP id
 m14-20020a056870a10e00b000ddbc3ad2c2mr479017oae.123.1648663709731; 
 Wed, 30 Mar 2022 11:08:29 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 bn13-20020a056808230d00b002f75bfbcf5asm3832899oib.56.2022.03.30.11.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 11:08:29 -0700 (PDT)
Message-ID: <b2bbac78-d166-80dd-f612-c20a5da4eb18@linaro.org>
Date: Wed, 30 Mar 2022 12:08:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 2/8] qemu/int128: add int128_urshift
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220330175932.6995-1-matheus.ferst@eldorado.org.br>
 <20220330175932.6995-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220330175932.6995-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2d
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/30/22 11:59, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement an unsigned right shift for Int128 values and add the same
> tests cases of int128_rshift in the unit test.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   include/qemu/int128.h    | 19 +++++++++++++++++++
>   tests/unit/test-int128.c | 32 ++++++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

