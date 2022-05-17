Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944652A94A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:32:46 +0200 (CEST)
Received: from localhost ([::1]:53314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr13m-0007IW-AS
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr12F-0006N2-96
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:31:04 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr12D-0004du-0Y
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:31:02 -0400
Received: by mail-pg1-x533.google.com with SMTP id c22so772896pgu.2
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LHMV5E3mn9D56pmR320hW17HyifrhqlTWv1ar+1jRdQ=;
 b=Gw8kRrEqyzaaevHKOdmj++hjo0aGESr45jmmmVPWqB8DH2k6u1EAeFm5meblhsUU+Y
 mvDmFbXuO34cwQVdr4pfIDOEpdcIkm40mXQ5joO4KAz1z0ckLK1sKew4kBkmu/P1LPB0
 iA4U3js6y9R5eFF/ZTYOom56ngOaZZK+4kD9ih1f2zXmRSOOj1oIr20JXVb7VfclqaiL
 6agGb73zBosO7ZrtCcpQ1cygF5m5oiLv0BphuHIvBYEaGZtS1LepBqWR45NlutnuVUlt
 NyJioMohKaGXezh+MlTMMAh9pRPhKRgCuVpYlzIPdmJWA07Fa8Aipf4mUFkK1WdyVvm9
 GDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LHMV5E3mn9D56pmR320hW17HyifrhqlTWv1ar+1jRdQ=;
 b=YWQFHFuULHqyqVDewAbCE2cb9lnXCqsZFUlmUVbZNuAPx5lpdyE3aY9VVjSL314S6m
 7ltmx6qwXnQWBfOTThLfzwG0a+/GaOaHDkMubPDwE7UAiimiZJqXlgpzsM/73hBFY5ro
 c+w/2eGSHXeHN2kc5gE41NMnK6+pNxaAIMghUWIe4hb8omyI/tXRuZ8Uewb0yegGoEho
 pi/AyvPguxE0swv90sHlm95yZhkLo4s5dqfmJOv9dHb5wdEFBDqvsOBEtyGeXTr0ZEKN
 s8Gz1ZWihSPoRIPAZmsOenIWNj1StqlsfytqaA9VTa+Q6qX46nLoYgZwYSohzfuKkGYn
 dFaw==
X-Gm-Message-State: AOAM531zEamRLxGR1E7D7DZ8w1G9U8vjfKa0ibw9YE7cE7R4RoSNYJr4
 js5UEVMnBBqCHchqhjNcDVWI7A==
X-Google-Smtp-Source: ABdhPJxK8XvLoyBkvCxGy+rDNEmaRgih0nb0SMfNx/ESZ7+K6pvoG6h6td7tVizlVXCNTVAXbNfwzQ==
X-Received: by 2002:a63:6aca:0:b0:3ab:a56:126a with SMTP id
 f193-20020a636aca000000b003ab0a56126amr20003133pgc.576.1652808658746; 
 Tue, 17 May 2022 10:30:58 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 h130-20020a628388000000b0050d4d156362sm20173pfe.1.2022.05.17.10.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:30:58 -0700 (PDT)
Message-ID: <1a1d8b6d-e665-a659-4253-005259f5912f@linaro.org>
Date: Tue, 17 May 2022 10:30:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 07/12] target/ppc: declare xvxsigsp helper with call flags
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-8-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-8-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Move xvxsigsp to decodetree, declare helper_xvxsigsp with
> TCG_CALL_NO_RWG, and drop the unused env argument.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             |  2 +-
>   target/ppc/helper.h                 |  2 +-
>   target/ppc/insn32.decode            |  4 ++++
>   target/ppc/translate/vsx-impl.c.inc | 18 +++++++++++++++++-
>   target/ppc/translate/vsx-ops.c.inc  |  1 -
>   5 files changed, 23 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

