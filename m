Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CFE4C04BF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:38:28 +0100 (CET)
Received: from localhost ([::1]:36204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdnf-0006qH-Vz
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:38:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdmT-0005dS-HB
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:37:13 -0500
Received: from [2607:f8b0:4864:20::62f] (port=45812
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdmR-0001XI-O7
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:37:13 -0500
Received: by mail-pl1-x62f.google.com with SMTP id w20so16950663plq.12
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mmAzYMDwtx7e92GAmTwtwSH2UJOn7jJyoT1I0aIRbcM=;
 b=Q26frQMi3wwIqXW53LGUnU5DqeFGKrvt4N4YO/TORbFin9Y64i0mQBcGo8ez+KTOpo
 5DYDA/hl+8SoeW0iB3zCOSlKGvw95npIMVDlS1kXMIOj3GeMBb6lpIFQgt2tzHDxOY0T
 XLbfeOhQzX8Y02RrJrcRG73dxWd6cDXaWhmjQD9HirZVdjH1keFjmaEQlCihB5CRnPL1
 y4osntA+sw/eFfqk0fsspTFxmoWqQ1SbLRBH+gtanzMICN7hhlVYa/ofSMZEgMTZyHMe
 3xQZy77NeWtEzVp0p/bUaFpwaJUavVltREHehRje8Cl2Wp3fNgMpkEeR0RxzCII+cgmi
 M2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mmAzYMDwtx7e92GAmTwtwSH2UJOn7jJyoT1I0aIRbcM=;
 b=Q4jxdO6tiIjGD37NuGkd1eWl5iUsNak5YyI8Q9Wi+E2m6rMCzYX9yd8i3krzpEX5KB
 SKbWhjjGOAkLhf61oy56gQP/UmV1AGMJQdykB5zm2hBTaxq91HCZQvQwfuwoStCHPtIN
 c21lXHP8GAuv5FlX9ZY80C0pQGR19HbdGkk3/dHUjW1Eld1JUlDMe5FcqC1FAUqzlwkB
 wF1tKApgOny/wgd5FaWVZVwWufW00iugkltO7+lYDhohXU94Hnc9RbtCLYRkz7KzWeS6
 BToYS/M+tjBx4Rsxm9zxmriz6G6PY94fzhhdx1oyBgMyjRjixg/ZfzeXFqd0W9Rzu4V3
 tdHA==
X-Gm-Message-State: AOAM533sWLbq5jYQRKX0E5YdMRPULRo7KqKqTawGmr7qRi89CdCQ8si1
 RQkwcAHsgb3x2DHxlcVkfy7d2A==
X-Google-Smtp-Source: ABdhPJzqRbogUc9z7pbSXoWLJhH2gx70aMVWaTgo9XGqcM+k8gS6oPK7knunVIWubWPIU+07imTqAQ==
X-Received: by 2002:a17:902:e74e:b0:14f:f1c0:aaed with SMTP id
 p14-20020a170902e74e00b0014ff1c0aaedmr1849515plf.19.1645569430240; 
 Tue, 22 Feb 2022 14:37:10 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a740800b001bc691c79fcsm588628pjg.49.2022.02.22.14.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:37:09 -0800 (PST)
Message-ID: <f5e843b7-1ccf-3504-ad76-82d7c12f4119@linaro.org>
Date: Tue, 22 Feb 2022 12:37:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 26/47] target/ppc: Move vsel and vperm/vpermr to
 decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-27-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-27-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
>   target/ppc/helper.h                 |  5 +--
>   target/ppc/insn32.decode            |  5 +++
>   target/ppc/int_helper.c             | 13 +-----
>   target/ppc/translate/vmx-impl.c.inc | 69 ++++++++++++++++++++++-------
>   target/ppc/translate/vmx-ops.c.inc  |  2 -
>   5 files changed, 62 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

