Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87E58576B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jul 2022 01:45:20 +0200 (CEST)
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHZfT-00023T-Ms
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 19:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHZdD-0007w4-Jx
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:42:59 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHZdB-0000K6-Ti
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 19:42:59 -0400
Received: by mail-pl1-x636.google.com with SMTP id w10so5894914plq.0
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 16:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5+JLebkxU3Nt5iFzyBnCsM4hlMEJKB5pGJPQnLyqRg4=;
 b=ff6JQ1jemBmJgIWkDUnBgIiwqyY1/kn2uPgsv+NECG6y65II/7NWPMtvQbr3QvkMA+
 b0jYR28KRCVpZaaSYn3F4g6iSAwr7MM/WJDENpthUak+T+OZBF6GMYAqP1/Wi6DLd+lN
 fz04SF+xH9dlKNBSNVDtJog4kreWduOfaEQ246+jTrFGHYCeDHvCb7x0EGXaptCVeGIj
 SrfoBw4DqNqBCiYNui98GqgghiYyItMlTqEMa36TKUcr6AfhGkF4WpYPTnPZDmyiDska
 JdxiwM7Ya7pfzdGGyEDqa2++D6Wb+6aSjuBd9Kh35Ijw0g0Fk4KjYmF9p3gqFxIWAvId
 TIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5+JLebkxU3Nt5iFzyBnCsM4hlMEJKB5pGJPQnLyqRg4=;
 b=C1OHA56nDKAQZ0am/+tnEg3T7Age0jmzt9seYMZowy7gXoFqDvsyO16fT/V9ksJ73t
 eW85d2mS4zBMLI0Put/nniZUiPybhyes4+sIKTN49uzQPVX8I5/J7FCiiWvV/wU/CDxT
 TYXzhqDQe/aiYpP4aF8CnSVVKcrpYXLUYGCkajh2aBVEQ0aAMP2C350gCnEPrrQVmswp
 s6103aOaOsyosDXWnm1wZx8sO2N0VIAzUJf2AycXr4f7nrUIfiG1f7GGo5clhuWVKaG3
 YnVWp+/c9ljtSyzHy39SIUYVM0QOwYGsoQ1IMHQ6NEdLDKGRXCMwkbtN7FitSifQlH+b
 lilw==
X-Gm-Message-State: ACgBeo25tXI3x+cxs6yK7zoUjgD5SX9D6x7jlKKy3J20IDVKB9Ene55F
 mY3FESex6cIKXnLMSdMh5TaIsw==
X-Google-Smtp-Source: AA6agR7AnE85m8BfD83SsuBxva1NjH+tm6xRaRJNywf1hS7fbx+qZJtHcfpGcEP2bpWd4dpgbp/GyA==
X-Received: by 2002:a17:902:d501:b0:16d:8fc5:36dc with SMTP id
 b1-20020a170902d50100b0016d8fc536dcmr6201193plg.160.1659138176523; 
 Fri, 29 Jul 2022 16:42:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:a427:660:88d4:8559?
 ([2602:ae:1549:801:a427:660:88d4:8559])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a17090311cd00b0016892555955sm4268707plh.179.2022.07.29.16.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 16:42:55 -0700 (PDT)
Message-ID: <a12ba704-b29c-a521-c664-7838c058ebf5@linaro.org>
Date: Fri, 29 Jul 2022 16:42:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 08/11] target/openrisc: Enable MTTCG
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>
References: <20220729230117.3768312-1-shorne@gmail.com>
 <20220729230117.3768312-9-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220729230117.3768312-9-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 7/29/22 16:01, Stafford Horne wrote:
> This patch enables multithread TCG for OpenRISC.  Since the or1k shared
> syncrhonized timer can be updated from each vCPU via helpers we use a
> mutex to synchronize updates.
> 
> Signed-off-by: Stafford Horne<shorne@gmail.com>
> ---
> Since v2:
>   - Removed cpu_openrisc_timer_has_advanced lock optimization, measuring revealed
>     it did not help much.
> 
>   configs/targets/or1k-softmmu.mak | 1 +
>   target/openrisc/cpu.h            | 2 ++
>   target/openrisc/sys_helper.c     | 7 ++++++-
>   3 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

