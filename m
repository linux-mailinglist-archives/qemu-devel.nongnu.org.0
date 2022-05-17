Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD052A987
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:44:59 +0200 (CEST)
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1Fa-0002St-30
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr19w-0007n5-UM
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:39:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr19v-0005ez-6e
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:39:00 -0400
Received: by mail-pj1-x1036.google.com with SMTP id ds11so6461987pjb.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=YNEHdEOSf7onPZgBo2fmHV/Z2H+0jOlXfD3VGLLV02Y=;
 b=CxPS0dfN9RsI6HFvt+XC3yq2WDXEFkPyaqnqJH9/MWUO+zMhmwK/YW+IF4Jb65lKb8
 ZrxsHaj3P9Gm8dBHLxrlVd6SS68pyac13ekMf/KcJSBNvrDOMX3zgxf2NzujzN3ZbL+Q
 Knv7yyiJ97h/VckEL8NPbOTNfcK2UR36lNbmtKYH9F2WuvawNffJHYy021YXIDsldzTQ
 a3hBrBox50ptC2c05tdwd1+N2+Qq2aLeH61Bb14miUlKerwyUmxRtO6Um8+sO6MNWj5+
 osfD1HnvSfiSPIevHoDNa9MLtKl5hKhKtT8gWWA2EVVZ/zA4B5Q6AKWlDYCssbLen/89
 I4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YNEHdEOSf7onPZgBo2fmHV/Z2H+0jOlXfD3VGLLV02Y=;
 b=2DD5KLvijdoJWIUOwrX/OHB5loCOEA36XvB1YA7StQzu1o5Iiby+jrGuTbDR7xiba4
 aS9HKFtw0EJsCCMpmnY2iXJUf1L7Oc6Se5hliT9+2DbaV/820TFEX5Ykde9kk00iV+69
 5DJ2QYz+foL9SKTcNEhaSm7XAjpPWqRI2/cnZptM41KWjk4eONX/GE5FkY1Nic0Cu/Qt
 BVNmoQls1w7I4nrDBdyEeO+XV2m/E3o/sG22rNqNdSEcHbcFqElUyWTxYzAwCsp6xlpJ
 vdlIymI9XaDq4Fl701jHcJa9iWgq8NLYae6rWYfDpHraK+5JoycjjMS/Dhum6YCdxey2
 lgUw==
X-Gm-Message-State: AOAM531ZDLwrffDvQ2q+0BQkxTcj7J8mojnabpx5Yp3pTg6HRTZprv9l
 WdCwGivWIS09/1B4Nco2XyQawA==
X-Google-Smtp-Source: ABdhPJytoFEspPghaEnNTrJiYIGWYV/14nBm+FTD8FopiDTFvt7byv4L1stJ3GsKmgjn6j6Ra+f/Bg==
X-Received: by 2002:a17:903:41cb:b0:15e:ab0c:5172 with SMTP id
 u11-20020a17090341cb00b0015eab0c5172mr22868283ple.170.1652809137364; 
 Tue, 17 May 2022 10:38:57 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a62d415000000b0050dc7628169sm15345pfh.67.2022.05.17.10.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:38:56 -0700 (PDT)
Message-ID: <04aef0dc-befa-460f-aaeb-579b537b4bdd@linaro.org>
Date: Tue, 17 May 2022 10:38:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 11/12] target/ppc: declare vmsumuhm helper with call flags
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-12-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-12-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Move vmsumuhm and vmsumuhs to decodetree, declare vmsumuhm helper with
> TCG_CALL_NO_RWG, and drop the unused env argument.
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  4 ++--
>   target/ppc/insn32.decode            |  2 ++
>   target/ppc/int_helper.c             |  5 ++---
>   target/ppc/translate/vmx-impl.c.inc | 24 ++++++++++++++++++++++--
>   target/ppc/translate/vmx-ops.c.inc  |  1 -
>   5 files changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index f0761fe38d..5127851f2c 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -242,8 +242,8 @@ DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
>   DEF_HELPER_FLAGS_3(vpkpx, TCG_CALL_NO_RWG, void, avr, avr, avr)
>   DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
>   DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
> -DEF_HELPER_5(vmsumuhm, void, env, avr, avr, avr, avr)
> -DEF_HELPER_5(vmsumuhs, void, env, avr, avr, avr, avr)
> +DEF_HELPER_FLAGS_4(VMSUMUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> +DEF_HELPER_5(VMSUMUHS, void, env, avr, avr, avr, avr)

Actually, you can set NO_RWG for the second as well, because the only thing from env that 
is modified is set_vscr_sat, which is not a TCG global.


r~

