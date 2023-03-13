Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17FA6B7BC0
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:18:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbjwL-0004QD-AF; Mon, 13 Mar 2023 11:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbjwB-0004PF-6H
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:18:11 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbjw9-0001IN-IU
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:18:10 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d8so7106125pgm.3
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678720684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/FxbcIBMjcx3ILsGfqyiSecPE4Nz/JkkWnxGE3Y/Py4=;
 b=qvAg/fWUFeEj+bEwEK4c6yCpsQ7NtphUoaxaT75guRa5BTsZW6rlFVygw6H7taXyg5
 K5zMmyDRKsOMzG7gY8jNouIn4pEcRHaSWLPRGPXLvEq1RYBySPOLVyACVtn+2PRlmQA3
 b5Gwv9rdtzHeUOa3/+cQDHKHxvaTE7NIUgXb011Br6ozbNoGLzPinab5dhLPRq0zb03X
 PLiFlmgqV6fuQZ119fazTsICoSFb/j74QiYTLFM0uaRmr7K3Mt5EF+2Jnk5Ih5bxi8Tb
 6oaYcKfZSCUymeQqgp37YZPVciU0XxKSPHUvVjPHOkOIRJgQtbd/9sY+GFvqeDc3bDD5
 HoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678720684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/FxbcIBMjcx3ILsGfqyiSecPE4Nz/JkkWnxGE3Y/Py4=;
 b=FZlH1tYkHhdcchdFf+2Dhqy5uONONQTzjGCS1lbzdLboBglMa+xKIQa54QvzyxpNQF
 U4nonH2ClEQgkp3NCSMooYeXc10GlzLPD2ZUWsMt0xosqmq9RW5vtV7GI5WvLNl9AqM+
 WjzQse6Tp9FzQd2fYwNQo/EUndQB1cCin8wuBHJDoDSdCMSb6THZaz7ctZWmKxq1PVvL
 2HkGW2CYsD+U07rs6iNGbkH4GjlkxOgvRUg7ZGtgUZvPp1CEnRy3LpGzEdblFpHP0CVG
 26eR+2v3sRxWydv/7VY+8GRAdktcAKTZR/R0Bp/f2tH2pPKri6UP8pHz9y+nisnAjqW0
 gSCQ==
X-Gm-Message-State: AO0yUKVX5em0qnDFymECEGp9zfCSSQjaGY/FIrYZ8pAy2emsU4bhJOzn
 lys9L85jqwbvvx7otWhgdAys7jjyE2ikPt3ReVX+ow==
X-Google-Smtp-Source: AK7set8Xbe6RRCEEwrkGQH6qr9HbHGUl4O2DCq0mtp9ME47gZ6UQFaH2RvshvawWIFWppWdy+P+FTJCADoeJ6JxX6YU=
X-Received: by 2002:a63:7e11:0:b0:503:913f:77b9 with SMTP id
 z17-20020a637e11000000b00503913f77b9mr11725676pgc.6.1678720684203; Mon, 13
 Mar 2023 08:18:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
In-Reply-To: <20230313033936.585669-1-chenbaozi@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2023 15:17:52 +0000
Message-ID: <CAFEAcA9zQeop9NTJb6W-fSZ+rdODRvE19914syS9sDApEiHpfw@mail.gmail.com>
Subject: Re: [PATCH v4] target/arm: Add Neoverse-N1 registers
To: Chen Baozi <chenbaozi@phytium.com.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 13 Mar 2023 at 03:39, Chen Baozi <chenbaozi@phytium.com.cn> wrote:
>
> Add implementation defined registers for neoverse-n1 which
> would be accessed by TF-A. Since there is no DSU in Qemu,
> CPUCFR_EL1.SCU bit is set to 1 to avoid DSU registers definition.
>
> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
> ---
>  target/arm/cpu64.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

