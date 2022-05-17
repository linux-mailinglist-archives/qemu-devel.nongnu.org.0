Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1EC52AB54
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 20:57:51 +0200 (CEST)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2O4-0000SK-Gi
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 14:57:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2LP-00064f-DI
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:54:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2LN-00006x-Nl
 for qemu-devel@nongnu.org; Tue, 17 May 2022 14:54:55 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i24so17701206pfa.7
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 11:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T0S2Q6wpJtgxtt0amvCBnXtGBgnanX9nsY4dYwCK/vY=;
 b=qbAv5q7W9N2Nus8Nu9Bek8Pxua7eA6jPFKas454et4uomWXC5RmrRFRER3Pz200LmS
 AvILyMxVWZ3rJZe8AxK4uLbviDq8gGRhwUbROfiXPmWLxVDvQYrXyiRDeN+dKOIuFBDd
 Tpt2KMS+wv2cNIlGemuTJvKIf9ippWXmnGUD57fvmCldCABUrnIdi1kZi3tBLRi+3SzO
 irWofvdiSjrtSXh43lK6cjspWxsISdRjUIWesGlKrt37vJni8BZYFyHxjcJI/7FJ3rbJ
 U/W0u/lyyIqUo33e09KClR6YBS0qlpfw3zr4LnUrOVmHC8ichWbFbG6O7K/pzMHAdHKW
 +xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T0S2Q6wpJtgxtt0amvCBnXtGBgnanX9nsY4dYwCK/vY=;
 b=XEp3jb8Y82IW/Xk8XoA/lhFKSm61HMK6EKFdvf688EKp3d6jz3DNEYQwTMgvD9juV4
 gvngOv9sAtegIX+SCoxselBN3PlikwaDWPUYhNkpl/wvaI03KKX7AdlY9PUa+IrxYsPO
 zX+glvbtBisHBuRDFI/bE4E+3XMJvJj0i3hX5YEp1SdNlmPKoWdGK50ZGpWDyQ3gvJhu
 23kUqSNdEGjEDXVkNp0xMUe96OX6MJdsSv0q01aWe3QTScV0gVEdDi3uDIVyk5MWxp6N
 ybeo+mMiC0B2Hq/D8XnijJOouvf2ktRZxraLsdO6E1j+fCLCtLxR65Xyxx7+QZUILY2E
 JAQA==
X-Gm-Message-State: AOAM531TFUkCBlKs8PGf6XF+xgqrYbO28KoJKmipgM/WSHfBk+HTY0RS
 4kZXYcBNFJgrvGw2QVTM0vyjnw==
X-Google-Smtp-Source: ABdhPJwkF47G2uE+lWHeG1q7gLzOdd6vANue5oM6xS8pTWsV6Q+v9zArEzocabtIq/Sl/ZZaDaPo9g==
X-Received: by 2002:a63:6a42:0:b0:3b4:276c:8c3 with SMTP id
 f63-20020a636a42000000b003b4276c08c3mr20482215pgc.337.1652813692416; 
 Tue, 17 May 2022 11:54:52 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 iy1-20020a170903130100b0016160b33319sm5957934plb.246.2022.05.17.11.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 11:54:51 -0700 (PDT)
Message-ID: <511bb73d-0212-9c15-40a9-02cebb0a3381@linaro.org>
Date: Tue, 17 May 2022 11:54:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RESEND 07/10] target/ppc: Add flag for ISA v2.06 BCDA
 instructions
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
 <20220517164744.58131-8-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517164744.58131-8-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

On 5/17/22 09:47, Víctor Colombo wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Adds an insns_flags2 for the BCD assist instructions introduced in
> Power ISA 2.06. These instructions are not listed in the manuals for
> e5500[1] and e6500[2], so the flag is only added for POWER7/8/9/10
> models.
> 
> [1]https://www.nxp.com/files-static/32bit/doc/ref_manual/EREF_RM.pdf
> [2]https://www.nxp.com/docs/en/reference-manual/E6500RM.pdf
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h      | 4 +++-
>   target/ppc/cpu_init.c | 9 +++++----
>   2 files changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

