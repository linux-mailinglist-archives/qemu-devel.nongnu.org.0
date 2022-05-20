Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7332A52EFB7
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 17:52:25 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns4vQ-0003ju-3P
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 11:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4qK-0007G2-3a
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:47:08 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ns4qI-00009x-C0
 for qemu-devel@nongnu.org; Fri, 20 May 2022 11:47:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d22so7673724plr.9
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zuddlacizjL44/ip9Mo3cGFwdB8WItAg67rxsT2j3Fg=;
 b=Zq+CcX82lPTRXpakD2TawQ1a6QccADJVq1rKh8dGZdVKUP1mKf4rglXoAwvXOcM4RF
 Pco0e8fTP/S4QP/6yQM890LD4y/vfuATZzsTTJBXzyxbrh/vIvobL+prmzAv1OzyJb2x
 fAeAMevtDROtz/O5rVCULQDz40PzYGv0NsCIgIicViBRPRKcv3nEOXqJNB5Y608dyhgb
 0zdxb3ixmNlYMu9flBKQQbl8snZFw4do5VXX60d4AN8Aw2vN3UVt9PhE0BMLc20DBaeA
 Yt+y17FYkY33uK69LWRhBeCpSHIqRadDuT6X7N6vXVGh/nlsA44MFVNaEF1/CJE21NoR
 4gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zuddlacizjL44/ip9Mo3cGFwdB8WItAg67rxsT2j3Fg=;
 b=3s7uyA2cQCE/UsH+QnNfB35tBCoNlnPeJt0IATnO6YsFQzhxDRYL7BcPL4XBskjYn1
 0MvbfFvHQ4u+zkcDViNF6wzXHT6tvruHQUCKnsKwf1xTuV/g8CKBviPPNzCJwvOOQjHr
 gmsaRW+C4XfqCea+jvhasSKDnw5vAmEDJcxpSDTQaMWfY3RFGY0a30dzJZddwH7JM3cD
 72evrgs7QO72B50TECwhYg/UJA+YQRuF6/H38gYR+4hqkEqCW3UgC8KJRiuIxy5+7aTx
 lRR0hL6PSnRHihlqKtqU4dNBAbsyx8ERkwcrPaf1frr8cXaQFnbeisN2qajRbZyUJZJz
 ciJQ==
X-Gm-Message-State: AOAM530VIlnU186ePfeqWGdHMlhbg3CjUNHBQMpY7M8MoVKuurA1upXZ
 dhqvqsXA5fAROJPJPm5jNNx5pg==
X-Google-Smtp-Source: ABdhPJy54qGUxDALW3yl579+9oZ2PTOxRtEYdgAUw+qow/Jdq+SV0BpNDSJctu6sozjdlxCzIHC6bA==
X-Received: by 2002:a17:90b:1b0d:b0:1dc:672e:c8c2 with SMTP id
 nu13-20020a17090b1b0d00b001dc672ec8c2mr11847207pjb.96.1653061624792; 
 Fri, 20 May 2022 08:47:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 7-20020a621807000000b005183434ec84sm2045662pfy.145.2022.05.20.08.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:47:04 -0700 (PDT)
Message-ID: <299dec56-ecfd-440e-42f8-df6024561cf7@linaro.org>
Date: Fri, 20 May 2022 08:47:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 5/8] target/ppc: Implemented xvf16ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220520135129.63664-1-lucas.araujo@eldorado.org.br>
 <20220520135129.63664-6-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220520135129.63664-6-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 5/20/22 06:51, Lucas Mateus Castro(alqotel) wrote:
> +                if (acc) {
> +                    aux_acc = at[i].VsrSF(j);
> +                    if (!neg_mul && !neg_acc) {
> +                        r = float32_add(r, aux_acc, excp_ptr);
> +                    } else if (!neg_mul) {
> +                        r = float32_add(r, bfp32_neg(aux_acc), excp_ptr);
> +                    } else if (!neg_acc) {
> +                        r = float32_add(bfp32_neg(r), aux_acc, excp_ptr);
> +                    } else {
> +                        r = float32_add(bfp32_neg(r), bfp32_neg(aux_acc), excp_ptr);
> +                    }

There's no point in the 3 if's when using bfp32_neg.
Just use

   if (neg_mul) {
   }
   if (neg_acc) {
   }
   float32_add(...);

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

