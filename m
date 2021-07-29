Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 696FD3D9EEF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:44:39 +0200 (CEST)
Received: from localhost ([::1]:44148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90ic-0001ZL-GA
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90gx-0000N7-Ou
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:42:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90gw-0005iw-AF
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:42:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id c16so5644070wrp.13
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Yv+1POtE/FdGHkBX3oO9oUyqh/tZ2wE/BGGAtSY4rw=;
 b=d0k1Yamp1UIk1nNaZ7wSZU9z24DxgAE3/TM3+KyOUCUBvQF1ozKnm08gLxjQPFIx7T
 XUgyy3NJpzophLQKH1yVnkJB8n7DZAcS0kJBH0tk74NZweBXzQenDoQ6YclE8rg6123n
 IG19im6AMq/24Vo6ncINMLPhH8n1K4Vw6LSjdEazaVl3yx/Tp4w+bAb7h00BTeR6g3s5
 gYgqMu9raIn4MnpUAdSThEUCscTPep1iL6O3vU9Jdzf3Ra27UyRLDsV1rQxbfVQvlcc+
 nHXJ1/jboZLy+ZhHjfqomPyvgM9BWiPkRcnHZAM5Iw0GuskAfZtgAESfGGabX/jemdLi
 PRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Yv+1POtE/FdGHkBX3oO9oUyqh/tZ2wE/BGGAtSY4rw=;
 b=GQRNlWo8rYt9OBwiOXFe/c1X9k2f+gLGhvggQMO56X/P2Mou4Wxx4iy+aKu9n3ZgO1
 oD7QpL9vly8R0TgRarSTaF/1R/NxMnG7b4n/G6S5Y1q/UH6XbrBX3Ut6R58G7wNzZ9sy
 hgIs0rAKE3NZ8Dp/DCp3kf9ONbi7w/u7JKmopDDBr/DYC4P9vt5Ut2YUzUtHiAg4yt3y
 QtmjG4YungjdflkE7fN7/UnABxXksQ5K9Xz/jby7/Ew3/vawR4A9cmB8H/Lpl3/83nq2
 jaleP5+QOPakEh52/bkFNH5swgnc0tXXK4nupK+PIKRlSUVN81bDZbopX2M7+ueJ1Cie
 nYXw==
X-Gm-Message-State: AOAM531LxoxtxeL+kWlCnANUgVG4b3s/f7uBJnbEhnG2V2AnuCO+lR9P
 NvY5+1QJIG5AH+yRVkUJS1YgAUtss9N3hw==
X-Google-Smtp-Source: ABdhPJzefeZ+rPE46F6FclRJy6GRPmfGqLxa6OUikUbXZxTu63ip4Y0T7ZNh92s4N8wb+Ah3KyiLUQ==
X-Received: by 2002:a5d:6485:: with SMTP id o5mr3229125wri.184.1627544572718; 
 Thu, 29 Jul 2021 00:42:52 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id h25sm923769wmp.33.2021.07.29.00.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:42:52 -0700 (PDT)
Subject: Re: [PATCH for-6.2 39/43] tcg: Move helper_*_mmu decls to
 tcg/tcg-ldst.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-40-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c121ba9a-bd0c-3d1d-cd04-141e40017651@amsat.org>
Date: Thu, 29 Jul 2021 09:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 7/29/21 2:46 AM, Richard Henderson wrote:
> These functions have been replaced by cpu_*_mmu as the
> most proper interface to use from target code.
> 
> Hide these declarations from code that should not use them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-ldst.h | 74 ++++++++++++++++++++++++++++++++++++++++++
>  include/tcg/tcg.h      | 71 ----------------------------------------
>  accel/tcg/cputlb.c     |  1 +
>  tcg/tcg.c              |  1 +
>  tcg/tci.c              |  1 +
>  5 files changed, 77 insertions(+), 71 deletions(-)
>  create mode 100644 include/tcg/tcg-ldst.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

