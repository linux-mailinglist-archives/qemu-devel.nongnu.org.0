Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAB852DB59
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:32:34 +0200 (CEST)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrk0n-00047S-Hc
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:32:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrjzo-0003SK-9L
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:31:32 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrjzm-0000BI-LN
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:31:31 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so5842126pjh.4
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KPD/APWR8/+C3j7/G8R6QX5Wn7e3Egz6eAjl9MZj9sg=;
 b=QUAnA0Vu5+E/g0kVZGK6EvqM4WULgvDemIS5Cto5ancQ7PE0TPbSlqSWm/llHP31Pe
 quC6iq4OaRdOLKJc1Et3Lur+FfzaiLEio2n40gmCG94fQyuVhWJLBdGhzm+2/lyYPtze
 HD0/DBW3jLbRyWR/vtceC0W8JXFv+WStoL30Kuj1SNlY6zg54JA2j3i7UGPd909ShP71
 LN1aIWVmv8ZcSpXbglIVBXr77ruly1XK1Q/lGiKGMatQgvrTOLXiED8Gc8ugB0Hl4zMr
 UtRCNdGV29qnukAgWVT98h14n0culIVLtqUXhLGKjBY+1MiFXrvby8LRanALAZ3M+Fcg
 laAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KPD/APWR8/+C3j7/G8R6QX5Wn7e3Egz6eAjl9MZj9sg=;
 b=ygW8CBdcLiOpIfD+fjdlQmcqemSpDV1u8y8mKlL+OzhZM6Zs0Fnw1aj7D4tqrSjBL4
 8RMTEOlXuqRpPnoqFKDoPDxNynHCumZMoNz2EvLLaJmxkQT5ijoSCcGc9cO1BpQ8uf7v
 5yxdOc9QQbYNKizQZXW2McbHUt85GaEfRp+cePSEwuKPkcMTiUNvfSHuQ2UVNyCNt1Kd
 TaeiJhmt7DAf8WucLsN+l2EgHpjkS8shTrYV3zFoWacY6b58yiLbzeCwhbp+5dQOoaM/
 Yojr21TtGbJP6GhQwuM1e3OLFlFrMeQbr3xHw3rzykkk9ZKKJPMDy69/OpbWzbTbkXCI
 V6PQ==
X-Gm-Message-State: AOAM530O+hhj+TYBrwTX1iF4YvTKwyBg1LPAcl35szzcf3f2ISGSiLmF
 eOgaCKkji0bSYxdVJdB99MKoeA==
X-Google-Smtp-Source: ABdhPJynyod9hb6oQiWgkPQhC6gZZvtueorv5mxw1aeVMsSdLjZCAfFCFUM7tnT+U30kYhcMM9js0w==
X-Received: by 2002:a17:903:4044:b0:161:823e:6f93 with SMTP id
 n4-20020a170903404400b00161823e6f93mr5746829pla.172.1652981488805; 
 Thu, 19 May 2022 10:31:28 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a17090a0ad600b001cd498dc153sm107169pje.3.2022.05.19.10.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 10:31:28 -0700 (PDT)
Message-ID: <a2be17e0-499a-d8de-bf7c-18c82f502708@linaro.org>
Date: Thu, 19 May 2022 10:31:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] contrib/elf2dmp: add ELF dump header checking
Content-Language: en-US
To: Viktor Prutyanov <viktor.prutyanov@redhat.com>, thuth@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, yan@daynix.com, viktor.prutyanov@phystech.edu
References: <20220519164849.112847-1-viktor.prutyanov@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220519164849.112847-1-viktor.prutyanov@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 5/19/22 09:48, Viktor Prutyanov wrote:
> +    if (ehdr->e_ident[EI_CLASS] != ELFCLASS64 ||
> +            ehdr->e_ident[EI_DATA] != ELFDATA2LSB) {
> +        eprintf("Invalid ELF class or byte order, must be 64-bit LE\n");
> +        return false;
> +    }

You could check EI_VERSION == EV_CURRENT too.
You should check e_machine == EM_X86_64.

> +    if (!ehdr->e_phnum) {
> +        eprintf("Invalid number of ELF program headers\n");
> +        return false;
> +    }

In init_states(), you appear to assume this number is exactly 1.


r~

