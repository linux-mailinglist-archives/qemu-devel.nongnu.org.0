Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671F633ED5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 15:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxUBH-000379-UJ; Tue, 22 Nov 2022 09:23:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUBF-0002zM-7l
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:23:21 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUBD-0003uh-O4
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 09:23:20 -0500
Received: by mail-pl1-x631.google.com with SMTP id p12so13785713plq.4
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V4Sw8aSxUN9A5QwjVO0Bw1eHNkGVVrDX+DJy0NatTCA=;
 b=h4JBSVMzURhPQYzyrI7pdrhFNkbFxsjFhZAc3KOUKyRXYW3zfMweTYenJSVnl6XySj
 02pqy4uHNkad1GJY/Qq0prgL1psAWig2rH5/jMM7AXi7XcNNDrR9DUIIkKAPZ8TJVvJG
 tt7xHwwC3wQayQc8y7Nu+h/CJwN3NjQ6x0hIZGV/Rd/2yBqzzubCK/txBrj8zMgOYu6/
 NEPJ0hXtY96DIBn7wcTx64aKPLB+xwu/lQ4cI0OIYo1TdzMZghVd4lMNzTzrSC60HQSs
 tBx3T2g59t5mEFy6vL+OiMoC6rVHUCsb0O1xtjQY/+VmQ8NNMbQvFjS1Nzwaqq/D1JmZ
 gU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V4Sw8aSxUN9A5QwjVO0Bw1eHNkGVVrDX+DJy0NatTCA=;
 b=Un5iPJghU5w8p072gce3KQ2+vLyV7E/yoVDSvqiHeqLKWI7FanCTjjXxOfwCeUz0DR
 41FmklbmWPjuEMmij37amMt+dORXb3FlO7bccCTuB9fdqvd1GoysqK8ZlRxNAekbtoq4
 YwAGevg+z6CG4ELySZ3obZ1bl/nqofQwkiDOaW4fA5NCP73Y+5EQpi7/BxFLkGzgzRGH
 yUGk43BgP//haIiEo4PeXi5XiPLygzMvmN0xRHaIVYBmI7lvMk5qgtjRwwfy1JBpLNkA
 dqXOlVB6i1xRZi+9ZoFb4ImzUGEsct0aXFkhWb2cs6NwdZNsqnbxkn59silQnCGgX7cR
 ZqzA==
X-Gm-Message-State: ANoB5pnQelFWAAV4NXPsPALVw5mcnnkY0xdPLuuvIiOcOxnRqAINvvAj
 wpedPcKMpsV4qpaoToQqDJ/Hoc/GwZ1fAmxvPYrfoSELzug=
X-Google-Smtp-Source: AA0mqf4Zp0kZzRSCfau7r+X2IOco0D4jux2hO7PZpO8RT7TsZnUtqBuIaPrXHip1q+ItnImfLJVdHsANp9Mq910FBYg=
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id
 f4-20020a17090a700400b0021887578f2bmr20720237pjk.221.1669126998448; Tue, 22
 Nov 2022 06:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20221112042555.2622152-1-richard.henderson@linaro.org>
In-Reply-To: <20221112042555.2622152-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:23:07 +0000
Message-ID: <CAFEAcA8yOn39EFtf7eoZJp4rm+1nARQCFj9V9Otmo7HTNqDO0g@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Sat, 12 Nov 2022 at 04:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new common function and avoid rolling our own helper(s).
>
> r~
>
> Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
> ("tcg: Support for Int128 with helpers")
>
>
> Richard Henderson (2):
>   target/arm: Use tcg_gen_atomic_cmpxchg_i128 for STXP
>   target/arm: Use tcg_gen_atomic_cmpxchg_i128 for CASP

You can queue these patches in with whenever the
underlying tcg series goes in if that's easier;
otherwise please ping me when the dependency is
upstream and these patches are ready to go in.

thanks
-- PMM

