Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5E457C9C
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 09:53:44 +0100 (CET)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moM7z-000138-FM
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 03:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moM6p-0008Nq-QG
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:52:31 -0500
Received: from [2a00:1450:4864:20::42e] (port=39798
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moM6n-0006tv-M3
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 03:52:31 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d27so22363639wrb.6
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 00:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QRdwGdjhcx240cn2m3OGmznmhXkLSBj5/caFwG2jcI0=;
 b=gzDt5dkAfR9788rNsKYDPS2dLcG6/S4fHsDuw6S45yPGr//nC5wuSZfwF53w8//9/O
 Atccwdb23HR6FDQNFVCGxIhizfyT/y1310CMmS3NxQfPO7xOYQEHs5vO6fTx5zE+KbV/
 qKF5rxv7alZg/okiA60hZ9MpU70XAg9wU481r3k67mT75SqGc+J3xfhhCaGuIGk/UOLg
 N/kc2PgGrOSwrrgpcbsnYcpxcKA9Yr0bfJXHNZ5USDnBuMggUBt+uJ5Anj7fH6+Qi0Gw
 b6R6AbMEqjM6rivjNLPQd/UViDguavCafJibIyMxiaQxnI6Fprx3Csyv5Q6omNvaPhzG
 r+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QRdwGdjhcx240cn2m3OGmznmhXkLSBj5/caFwG2jcI0=;
 b=mn3CEVGsSk8bWcXCRBNEkAxAdcsCYHpcUi6FvcLJMGdyB8QmB9wlf8nN22BNM5nh25
 c/bNiZPlBF898v5VYQody4N8rSr7nwjyIgs3Y2fMWgt5LufYr4SnvdlVMMgX11uFYdU2
 eKML4tK6B0fHTAtNRWRgN6Xhk4QYnIHfzHnCDv5tBvLxtkFU6Cobnukh6dDbkknPpIGa
 oqXnP+vnof2ZGEO6zLnqSaCngpWMWkdLdQ5i9HLBgutWRo2Ha69vSBSQTdjVlHs5qCiF
 rFgfbR/2LB6t6HnhWuCZA2bcDsTehYsotrnSBymK/qe0cpvSI0FAqIJTpXKdQaAYb+43
 Sudg==
X-Gm-Message-State: AOAM531J2gsoTINsDh7/a5qeXFztzPcBlqJZDRfA3OZ0Gwd49cV+PCP4
 6nroQH9gpABjDSfcaV1jlvBjaA==
X-Google-Smtp-Source: ABdhPJz5vkGn1uAUgQzdGSZ7opiiK8kyph4D5TOghBu6Eb8sEuYC3LSTMuAPKsybaRXPOZGtZyixcQ==
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr15776149wrx.292.1637398346141; 
 Sat, 20 Nov 2021 00:52:26 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id r8sm2563721wrz.43.2021.11.20.00.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 00:52:25 -0800 (PST)
Subject: Re: [PATCH v11 09/26] target/loongarch: Add fixed point extra
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-10-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0ab788fe-a22b-8dfc-978d-73c5f8b1d246@linaro.org>
Date: Sat, 20 Nov 2021 09:52:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-10-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +DEF_HELPER_3(crc32, tl, tl, tl, tl)
> +DEF_HELPER_3(crc32c, tl, tl, tl, tl)
> +DEF_HELPER_2(cpucfg, tl, env, tl)

DEF_HELPER_FLAGS_N, TCG_CALL_NO_RWG_SE.

> +target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
> +{
> +    return env->cpucfg[rj];
> +}

The value of the source register should be bounded by ARRAY_SIZE(env->cpucfg); 
out-of-bound indicies read 0.


r~

