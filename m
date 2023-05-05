Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA306F82EC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:28:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuXR-0007Np-9y; Fri, 05 May 2023 08:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuXQ-0007MY-7G
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:27:52 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuXL-0002tZ-Ct
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:27:51 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50b37f3e664so2952648a12.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289666; x=1685881666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2F1zis0eSGuvuvC1CHrwppmig0EsQfqxjrY7ags+n+c=;
 b=VWg0emqI7GA8hOcdlTJORLW7q7ml5AUoT8YzS+xp3odTs1/kk330qyHb6UXrNqLNaW
 Hia2NVcVIBi7F2cvkweDALF+LY0nbvHiRXRuJd41VLViA+FR5FP48R3AkD0T9Sw8vQcC
 HrQuj8WwsQPU4ep3vrumByWG+getnTFhodyY94iSTnAxppslQ7o3lg4AmRbyfuxOsuCU
 imp60jRWJxjk9RUqR65Qlcyw2RxHt+auhjDv9FhXnJuigykjQv61L5ql98pWsz/7iEtM
 eMddf9HMHVbpOwmDgqeZ8J4EcNdFG49rEga6I1wY7A1VI3/A2enyVwHuKGwiwj+Xraxu
 TtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289666; x=1685881666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2F1zis0eSGuvuvC1CHrwppmig0EsQfqxjrY7ags+n+c=;
 b=MEmGwzav53yDEOvOCV+MOnhoT5m/PqcK/EZ6JVJa90zOPKD5Hw0NBwDjXubsIrGjkL
 woFNzQx2OjnZVDwxPBPs1QkPs7+j0JnwgJP7qXNKq4qF5qEGXuKEvThKijIrEygmHl2u
 ufJIFXXggqdjdWx10KnOZ0n4CJw3XHVnYrYrqu1JZBl252+/3QIpG82NOV6o7z9SA839
 0MrgEW8bEGNA0WMUKJgd11tusktPAcew4+qiXI1ki/RdOZO4nS3+lUCm93ZaFOPHM7MC
 KQToHGHDN47YragHYzTjSGfmwvN0NLStoWPzqLwFYM/dILoJ6z2a+ImljnpgYkRPQ1kQ
 LeWA==
X-Gm-Message-State: AC+VfDwh+1YL0uB92mfKyOVU4NYDdcVao7ZAc0fGDDCU2p9d9ChqtQZU
 k/P0SsP3dlz/1F70dX8XNysM7iMpugGCgalRvSlkUA==
X-Google-Smtp-Source: ACHHUZ4CPwXHGQHw1YQmV+egFfvAIeQOYJkgJwIPzr9Q4L19mFC/zrzUmYsdJPwEgMGiG9K+BXojCpwSUHabNt4DLfY=
X-Received: by 2002:aa7:da55:0:b0:50b:c780:2581 with SMTP id
 w21-20020aa7da55000000b0050bc7802581mr1184503eds.5.1683289666062; Fri, 05 May
 2023 05:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-36-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:27:35 +0100
Message-ID: <CAFEAcA_Xw_EHn+dbm5-Uc9NnZwb3F_P5sPZz2uG4yVg5UTX+Hg@mail.gmail.com>
Subject: Re: [PATCH v4 35/57] accel/tcg: Remove helper_unaligned_{ld,st}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 3 May 2023 at 08:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are now unused.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

