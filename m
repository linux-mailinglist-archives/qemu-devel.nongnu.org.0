Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3224C0489
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:25:14 +0100 (CET)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdar-0001os-5c
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:25:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdVO-0003PB-8y
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:19:34 -0500
Received: from [2607:f8b0:4864:20::1031] (port=40465
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdVM-00074c-EJ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:19:33 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so323105pjb.5
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N31XJ+pl6t8iMRrHv8RUa1eR0Bl4+NI0ORh/87zqT38=;
 b=tRF1x4bedPet0K+IFyGUKRQ9PJLu8Oq8pOcWaRNbonLyhtkkBjAiMVE37AX/I5l+Ww
 /bARj2ABU67LTnlGIglyVjHh3XhjvlrI71pXH+B6GmvXlJzjtI0/nndXDUBMfCapPzON
 KYk5Vx346KwjRVrSK/xAv2eUIaofG799W1K2j+6BsJZQLinP/wda4aK4O8wj9E6yeGN/
 EiwtycLDX37tgXiWDtdKceIbTZQh+aqHEZo35aFAm2kacmNbpx41aFzPw4W8IL+afxaa
 ZTDNCSF+bX9be1Q9KFON6I01AgYnklzMD4VwDloZp1Q1gBf2yQnNSezc2OVhIF7VTgdq
 VQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N31XJ+pl6t8iMRrHv8RUa1eR0Bl4+NI0ORh/87zqT38=;
 b=EzOyyCCqAluk8YJOcNaf93OaHqkt3paLEVd2wxVtpXe0aYSWJNYSb5rEe/E/2GHHVe
 iYrGKVr3f8CuAc+5vJuxDM9KFZdLax/0fYCV1GvqVMUnxHJPoURYf/OMIPizUHPww1KV
 GR284qJmu3L8uSpJt++VnOOvjflRNI4XNPIWHJjtZCEOoSzSAaA1mfJDyxMdRvT/tiML
 5+9wLdGoNzDdtq4wxt+fz5GI9uHLxF42pKTAdCbyblDN8fsFJbt5DIPT0L4vYN/M8KQ/
 zgdKyaOj2Ii3Zi3dSJzLwejkPdbIIXs1zo0K4GRcGuALruwzi6JvzGnQzdmrQidokolk
 NWcw==
X-Gm-Message-State: AOAM531yRs4AUrJHRXZ3NMvwLJZpNJehu7q+MdqXwMS7Ds9l3/s37tS2
 cUY2ZnJzrNH15GY1lnfPwI2sZg==
X-Google-Smtp-Source: ABdhPJxpfmvCO62Ep74+FJwPwcjMduX20+rNGPK4IHyQ483pvoWtB3q7e2dQZx9nswCONyk9SqbASg==
X-Received: by 2002:a17:90a:a510:b0:1bc:5887:d957 with SMTP id
 a16-20020a17090aa51000b001bc5887d957mr6275288pjq.38.1645568370715; 
 Tue, 22 Feb 2022 14:19:30 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id i4sm17738219pfq.105.2022.02.22.14.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:19:29 -0800 (PST)
Message-ID: <fde31f12-9d4b-6e67-8b9c-45d64c12c5f4@linaro.org>
Date: Tue, 22 Feb 2022 12:19:26 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 22/47] target/ppc: implement vsraq
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-23-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-23-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
> v4:
>   -  New in v4.
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 17 +++++++++++++----
>   2 files changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

