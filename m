Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE3F4EAC55
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 13:30:50 +0200 (CEST)
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZA3i-0002LA-Hq
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 07:30:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZA20-0001RA-Fn
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:29:00 -0400
Received: from [2607:f8b0:4864:20::232] (port=42660
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZA1z-0001YE-3G
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 07:29:00 -0400
Received: by mail-oi1-x232.google.com with SMTP id q189so18658559oia.9
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 04:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dzZBNvhG4NJ0KKC4DM89hnpYWniQe9EIQ3RdMAbxW50=;
 b=pLJo8+oubgtelFsh5c7KCBLoBJKU+Q+KVCMNc2qI/8y6yH/j1Be9U/L8/I8HITyL+T
 H7DTV3wh/p5k1tUlOeCgcK90eUadZnF8JEbZGs10onSfrJzji8voD5O8p7Bb/kLLD9BE
 pylkVP2O/KPbw41PyZrvB5QEGOacfKLAb+2weGxWWrk7u/05Oam1vi73lfbvn5xzvthc
 aAezGzmwTLiyItONBgvZJHUH3ClsYJToAhOfAgUKS4n81iT1a10Vinowy0dxU/bpAylh
 Hjhn+h5BYDSJ/Js50U/g+4XFieR7AlvVU/wHP90z10ES5IN5Vtd5CQuNLnEnxh+zWgrW
 tbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dzZBNvhG4NJ0KKC4DM89hnpYWniQe9EIQ3RdMAbxW50=;
 b=MaAhoVOcTVpDvyRpkZlP4Q0kyX/gLVi7TKX8Cegk/wMCPsdVfyiGoI9U11Rqy9CuVy
 zQT/THFVW7NpWDtsn94xOltmH3g3M1SPb5QN2c57u81Miy3AVQHe0G3Z3M+pDoIfUrHS
 26h4cZWhtDGBHBVP1BTMjl0QJQoyd5FAHR77yyDKcQ3OfuBdYT2V6lIjxmj5TV0oZ2Bi
 Aalq6sx3Pw1DYXeiRhC8kKO2+E4lc3tHypDaTaFkjaIk4Q2vMsarPkG3cURRb+Jjckhp
 nLe6zlsxR68nzkErnONhW8EYMAK9gihzGOt91MtV7h9V7BKdGDbWxJ7vCv37O9EinSGC
 0hMA==
X-Gm-Message-State: AOAM533qwrqipZXNInbf+6cgK4q9litjwFZEG5d3LdmJdNGs8BgObtWU
 lJI5P6iHgIXrOKRgT1SNOwV8bw==
X-Google-Smtp-Source: ABdhPJweZAslbNeaVIY40pZN+R5okTJ4dUqU6ov5BgJW2peJW6jwi1WL4fnVsFIHWgFtJQoVIg3VyA==
X-Received: by 2002:a05:6808:118b:b0:2cf:761c:184d with SMTP id
 j11-20020a056808118b00b002cf761c184dmr961983oil.87.1648553336569; 
 Tue, 29 Mar 2022 04:28:56 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 c9-20020a4a8ec9000000b0032438ba79b0sm8301811ool.0.2022.03.29.04.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 04:28:55 -0700 (PDT)
Message-ID: <50d7594c-f67b-14ac-7458-c0f69ac84546@linaro.org>
Date: Tue, 29 Mar 2022 05:28:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/6] softfloat: add uint128_to_float* conversion
 methods
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220328201442.175206-1-matheus.ferst@eldorado.org.br>
 <20220328201442.175206-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328201442.175206-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, danielhb413@gmail.com,
 groug@kaod.org, clg@kaod.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 14:14, matheus.ferst@eldorado.org.br wrote:
> +        p->frac_hi = shl_double(hi, lo, shift);
> +        if (N > 64) {
> +            p->frac_lo = shl_double(lo, 0, shift);
> +        }

shl_double(x, 0, n) -> x << n.

You could also assign to frac_lo before frac_hi and drop the N > 64 test, though I'm not 
sure if that reads better or not.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

