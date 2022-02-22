Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC8A4C01CB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:07:10 +0100 (CET)
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMaVA-0006fX-GG
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMaSk-00055z-UL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:04:39 -0500
Received: from [2607:f8b0:4864:20::434] (port=41610
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMaSi-0001tI-OG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:04:38 -0500
Received: by mail-pf1-x434.google.com with SMTP id p8so13018492pfh.8
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B/6M98pbPDRLsO+j2BrN+207e2BSiEZLY4Pxcexe1C0=;
 b=C4AWnd1WNZ9PekdWvG7IwUnCDMcv9kUAasF90/5HTcZIZU3UveoKH6qRbC4m7GlL3Q
 Ix8C4u3VtMMrtI0INoelNgHYK5p4Pj8b9rdKxAPfv8fdxBtSkNlAnR8SDvDQ2gKUQWTe
 c8f0jGxnIrHt+0WMZTBvnksasJdAvugexJ8gIKtP+mgiScfipDrPpPTxLVYlccKY0tc9
 qs3XrBNjA+TDvLpuKjF7bjmnel6rOUvtRK3ao9OqxULhFaXy7FdZo4tsIB2mH+2vDoCD
 3InFrXJVD/2cNQ2aH/mtugaKh7taoJtuyh1E22dmfzwOL5o1bZziZboeh1p9a1xVLsnm
 sc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B/6M98pbPDRLsO+j2BrN+207e2BSiEZLY4Pxcexe1C0=;
 b=K3YrOlI5ExWWTbvJxOAKgr2bWMNi7jWz8g8AVQ5Gb0vw1M4ODWSP2ItjT796oCyTQF
 5iCbr9gdyVpqH/GKC1TCfZnp+mRBnOqAORl2Jgm4zqQilgrS74dpH+28SWDXhK3F7bCC
 g6e5AZhTUM4FS4GJ+5V/N9Upk5EHoLHCQY92TAWkeDOma5QTeUTtqd1XolBpDIVjAqw/
 SFpLVyUqcbRoLJBxDPF8aOGuZiQHAyyqfsTfQEo9aAV8lHEykBlZMYDBJIg10/bUEv37
 DgT+C/Jyyadzr8LZBooiBCy4XzzG91e/HsVEKsqH+ix4N86ACjBGZ3CAAVahoGQN4GY7
 4J1g==
X-Gm-Message-State: AOAM530o1lWtdQQVJQOx0Uy0JXTr7PSM8SralEauJjmt7J0NtMwq8OJO
 JazdNmItQD+aiSCAG/dgvjmWSw==
X-Google-Smtp-Source: ABdhPJzS/AaHZcfOcuZ0nlajzWYxfojWpFVZoaXj1hZMTHLOeVpEuLixOrazJ/81/70IvxCAEPsk/w==
X-Received: by 2002:a63:f055:0:b0:362:d557:2ccb with SMTP id
 s21-20020a63f055000000b00362d5572ccbmr20806580pgj.377.1645556674477; 
 Tue, 22 Feb 2022 11:04:34 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id z25sm20095015pgu.39.2022.02.22.11.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 11:04:34 -0800 (PST)
Message-ID: <a958572b-3b83-97ad-7d28-43fecb54f808@linaro.org>
Date: Tue, 22 Feb 2022 09:04:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 10/47] target/ppc: Move Vector Compare Not Equal or
 Zero to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-11-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-11-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
>   target/ppc/helper.h                 |  9 ++--
>   target/ppc/insn32.decode            |  4 ++
>   target/ppc/int_helper.c             | 50 +++++-----------------
>   target/ppc/translate/vmx-impl.c.inc | 66 +++++++++++++++++++++++++++--
>   target/ppc/translate/vmx-ops.c.inc  |  3 --
>   5 files changed, 80 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

