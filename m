Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA7E53D09F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 20:09:11 +0200 (CEST)
Received: from localhost ([::1]:57898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxBjS-0002sV-3a
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 14:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxBgu-0000wT-5U
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:06:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxBgs-0001Aq-IO
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 14:06:31 -0400
Received: by mail-pf1-x429.google.com with SMTP id e11so7713367pfj.5
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dxJ3gGtzf9LzadnWJx1jClJc+IgdBd6kEmpSke5lfqI=;
 b=EyjkKXk2SnJfRC3AHZzWyL9Rs+a8zSivLaCgrKNrkrV/svDuErP5NdcSdMqWpERYyW
 AQJRfTPyyB2fYbz93jFGiOYnTVUnlBlEq41MGYjNq0qoahDInSx7mdXklE+RNt5K/vWn
 VqAjwgKWwVLG/Jqqc1Cxq9azT2PYWBYWh8+885GJppBLZgEwu6wNL2CtkJh+pFLwfqZY
 bcfBraSCqanLdgmj6YujEMTszZopmNimxqIrjFCD2zs8PBCXyGz5u4DhpqGotu0RXjyh
 121AWD+5SuAoljscmnSN0wLr7nOefkZ/GJLpaVWfV7mKowqMpAy2KuN8x1nMffqK82PG
 kCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dxJ3gGtzf9LzadnWJx1jClJc+IgdBd6kEmpSke5lfqI=;
 b=6HYX1CHHPh2zSq8eUztrIdeqmoboZTaB2j2HS9E7ImrnWWFxm4RoUTJouUIRmSv5Q/
 ACFqflTgHU5AAgva4rHxCbAS3WyMjg1073jtReHrzXc1fuJunbYe5XmhI9FUIM2qaCXm
 S+nljJ5AozNADoltG7aLTHCiKFhUQPRPambF8bfB7UJ6xZCWrNZtfvFyYTeaUghN8hCS
 cTvd5Ax7wF5qLO9kAk/4PwcP09mnoxU3X7FEkhHxIO/SiRwnrqQcNHLA78uW6McxFmp5
 Dp7Lmayd1s3a6PrBz42g5j/IHSdyw2uHBWqgCbbko1gZC47/7ZL6DoF+4yDggyGLfxSQ
 eU1g==
X-Gm-Message-State: AOAM532A7CJ/4ry4sMNWS8BBC3K9kdZq5C/WKHxfJCdxEZ2xDri6Hr0l
 b7QqOwoYgJ51jAUzL9b32APYXg==
X-Google-Smtp-Source: ABdhPJw3xUiG0OJe+G9Cnxx/GedAN3vnYzSxgT2kLOhVhSw0SLYo9+sA1S8VkHJ7yiz/i8Wd/J1bKg==
X-Received: by 2002:a65:4902:0:b0:3fc:5a7d:3895 with SMTP id
 p2-20020a654902000000b003fc5a7d3895mr10092758pgs.514.1654279589087; 
 Fri, 03 Jun 2022 11:06:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 cg8-20020a056a00290800b0050dc7628178sm5543637pfb.82.2022.06.03.11.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 11:06:28 -0700 (PDT)
Message-ID: <f48c2bfb-04aa-9d5c-2a86-ff54aa7e9906@linaro.org>
Date: Fri, 3 Jun 2022 11:06:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND v3 3/8] target/ppc: Implemented vector divide
 extended word
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220525134954.85056-1-lucas.araujo@eldorado.org.br>
 <20220525134954.85056-4-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220525134954.85056-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

On 5/25/22 06:49, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vdivesw: Vector Divide Extended Signed Word
> vdiveuw: Vector Divide Extended Unsigned Word
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  3 ++
>   target/ppc/translate/vmx-impl.c.inc | 48 +++++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

