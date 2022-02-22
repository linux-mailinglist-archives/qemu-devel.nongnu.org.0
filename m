Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514124C04D5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:45:14 +0100 (CET)
Received: from localhost ([::1]:47820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMduD-0006Gy-ED
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:45:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdpr-0001lD-A0
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:40:43 -0500
Received: from [2607:f8b0:4864:20::102d] (port=33720
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdpp-00025B-65
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:40:43 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 m13-20020a17090aab0d00b001bbe267d4d1so2507074pjq.0
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WsTqteWfCqmi1N1B5XDrdpNNhc4EOTWsI9nO3dA8yws=;
 b=WZUKzXQbPztLMKwqlXzkZo2JZl0dXyItItZRmuX4lnAM8FjVQvAuE6e7uJhas8tRe/
 KpFcwTla4GrsFUauMGunXQEk8PykmB76wwb2u7mjclkrgD2WWg9H+lKG3IpTzbBMVdAX
 5izsLUs9KNymS73nsHB3nEM7IpnE6YgpWqLj3AOo/Fqy+dDXljAPSwOjVFK/NADTdUjD
 wOpzR0ko2iq7e3ufwpBrWKOQjIyGU1GLdvWWuCGWtdOsG7wZV9Fcowz5B+oV/42Smmf3
 pteJRePQ2LGrKfxN+YcnU85FBGr8wvZ6n3nl41TVOBiO34aDdVpr9wb9qmkW2KQiY8Q4
 cxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WsTqteWfCqmi1N1B5XDrdpNNhc4EOTWsI9nO3dA8yws=;
 b=oFzuI7G9Rckprfy4Z7oCxKvZ0UpZI8UYA5joq3O8CpMFCu+kxgMVKRz+NLKR5C6Ado
 /J78VDNZDnZ+Hs8Ibq1No6LYetEX3L4nPpEsg3ctKWv+hd5tLkURMLVZxScUFX02I2h/
 JJaVO2lWUXWKMDhVIvXjvT8lAUCfua4YVjhIURKcajszTlB5mAFN5ADiqinaa6L5FFIK
 bSxzPpLUMmEovC0tJlXNMOAcp3uCzKM1YK3sxDhziQareIS4/9TqLMfl+2f9sH9clXlb
 GUEIatOm7DMXtUsLvYLP+uSg7nOoR0du8lpm9Ex4rPeyoB4Jgvjq9V8qjAioXjjPizQu
 2Axg==
X-Gm-Message-State: AOAM531mVN19x5yXFYaSHdZiHTvZpUOKD7vmzUCi43TzVd7nkax7NDr8
 bM5ixT/g0K88O6q4XLTqGUCCyg==
X-Google-Smtp-Source: ABdhPJx3Dt9dNqRAmj47/bov3/J4wBTUKqIQ5E7EIuzRxp1ASKvXMc9yDesQMT9Sjl65SdigPZD66A==
X-Received: by 2002:a17:90b:3850:b0:1bc:5a7d:4a4b with SMTP id
 nl16-20020a17090b385000b001bc5a7d4a4bmr6246822pjb.26.1645569621610; 
 Tue, 22 Feb 2022 14:40:21 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id m14sm18245534pfc.170.2022.02.22.14.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:40:20 -0800 (PST)
Message-ID: <700418ae-e023-2a7d-46df-908ccd5c100b@linaro.org>
Date: Tue, 22 Feb 2022 12:40:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 28/47] target/ppc: move xxperm/xxpermr to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-29-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-29-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c             | 21 ---------------
>   target/ppc/helper.h                 |  2 --
>   target/ppc/insn32.decode            |  5 ++++
>   target/ppc/translate/vsx-impl.c.inc | 42 +++++++++++++++++++++++++++--
>   target/ppc/translate/vsx-ops.c.inc  |  2 --
>   5 files changed, 45 insertions(+), 27 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

