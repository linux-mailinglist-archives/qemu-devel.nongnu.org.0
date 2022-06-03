Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987F53CB73
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 16:19:47 +0200 (CEST)
Received: from localhost ([::1]:60808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx89R-0002wW-Jl
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 10:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx88H-00025w-Pg
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 10:18:33 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nx88G-0001pR-7a
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 10:18:33 -0400
Received: by mail-pf1-x429.google.com with SMTP id z17so7286336pff.7
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IWNgeyZaSSPyB9unYQ+0DY/HhNbNyyWPj5iUZItTOc0=;
 b=zDc2HraMKQH2Zetl7F/sAzxVph+NXRd6tEAgHmWOI+sxAS0ouBQJYvbmh4KwiMQCPB
 Obf85domCPY7v2royr/WTsNF/NmaCMddg54DYGyOjSft3TtRM4AHELLy/qMKKWIOX/KS
 Gl5wYsuv6VGxh8wPq38qXWxQvIIOvUWG+CWCqFThAubheR3vk1iAjMny+ARFXsq6MaCT
 G4TZ04YTZqWsolRO1CdOGApcemvWq1/nk2+2EYG8960XSgbZCMXXnqIJUqQHCCi86ZaJ
 HI+d5mnkrra8ZxJbqB9vydnVLDBDa8KBDtDCYrVcIzFMLQAJDlTZtIOsekKIUwTfe+lN
 2wfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IWNgeyZaSSPyB9unYQ+0DY/HhNbNyyWPj5iUZItTOc0=;
 b=HmngxZTrM0qtZiKFMx9RjnPXoOpcSFCYxMrXO2CK5/ztdSU48P+jLXzL2RIYCOIPmf
 KU58LibOBD5hYt5o6kgzQRLHf8FkwKl3Ce9xgC5vhAiu9h7wKyLlN/n3AyZxyZxosCWl
 ZpNLA0wiaYylExrGVO3NSjSKBoNCOP3yUHBVrPcvT+u6/DyekvggNhM7A59PvQ1ArhlN
 pay9r66VPdxBa2l10HOZb5uKr+gXmtxeJuOlECyEgHBHLSaBcvLqR1fbR3GfX1ClXy+7
 AHVt1fIfOYvYIuuPMad3fWt8U8YEZrrrsM+Iw4zf0ziOCF39ds+HiVHSXH6up0DC5ZnT
 EV7w==
X-Gm-Message-State: AOAM530LbIvZjgTHQ5Grn8mfjFK8ABgU2mH1mHiZu8e3lDRYEGWTbxuu
 kLsoCZ+VqbmKiBK/vXLsGiBjyA==
X-Google-Smtp-Source: ABdhPJwYLU22Y+eNKv/nkEPjX+LxY86rSFg/3lO7ufskW8/X1n3PVNX147s500uWwg17BIAfLyTTLw==
X-Received: by 2002:a63:31d0:0:b0:3fc:5770:e779 with SMTP id
 x199-20020a6331d0000000b003fc5770e779mr9039182pgx.376.1654265910379; 
 Fri, 03 Jun 2022 07:18:30 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3286:cc26:3d5e:3f94?
 ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a170903405400b0016393148c9esm5383067pla.110.2022.06.03.07.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 07:18:29 -0700 (PDT)
Message-ID: <6ced0d40-a6bd-41d0-e233-86ba24c1dcab@linaro.org>
Date: Fri, 3 Jun 2022 07:18:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/ppc: fix vbpermd in big endian hosts
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220601125355.1266165-1-matheus.ferst@eldorado.org.br>
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

On 6/1/22 05:53, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> The extract64 arguments are not endian dependent as they are only used
> for bitwise operations. The current behavior in little-endian hosts is
> correct; since the indexes in VRB are in PowerISA-ordering, we should
> always invert the value before calling extract64. Also, using the VsrD
> macro, we can have a single EXTRACT_BIT definition for big and
> little-endian with the correct behavior.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> Found this bug while refactoring VECTOR_FOR_INORDER_I uses. The
> complete patch series will also use Vsr[DB] instead of VBPERM[DQ]_INDEX,
> but it will need more testing. For now, we're just changing what is
> necessary to fix the instruction.
> ---
>   target/ppc/int_helper.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

