Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC1D65036A
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:04:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6x1Y-0000lf-0l; Sun, 18 Dec 2022 12:00:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6x1V-0000kk-HT
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:00:25 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6x1Q-0007zT-TG
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:00:24 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so6902152pjd.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ShmrzewzaaxHA7/VTlsjYCBAOT1oBvhFF16Zy9WOYjQ=;
 b=X93IEnMiTKSgmdf+gve9bxi27Qw1wUgNtBn7ajDfSHp4BI8JRWmqqrexFMAdcU66jX
 g24vQOXX6BxdBhezCgz4FDGaQrkbrhZQU/ErOFysJFVWTGlGcB2JJ9oMTxuLoF/fLYzc
 zXbddTEmJtNQGCrKe/kgNEw3EsyQABmC02s8m1jGFaJoTPDuuUDCPwnKGWjA3rb3j72n
 L6YRukXR9kBCsIsO9dsVpQ9nNTWkgHZN+r+Z2oxwQE/8IeLJM6yZxa/7KygsR3q/sQoa
 2QA9gYZYma5lCkwZZf/DzGQTrDO70Mp/7n3YitwNkoxF/INPqFO5F2WW+goL4EZ9o+ie
 RUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ShmrzewzaaxHA7/VTlsjYCBAOT1oBvhFF16Zy9WOYjQ=;
 b=gaIZ274aeY7R1U2Lb2mjdLaLnjrPadFYvNOtCquLdKvKGcXsqOGjr4w7xSP70AgBPk
 dq5aUjPsBUbI8bMXOISX2Sluim/hxSUqV9tAFSEP6RfrSYOP39nz2aTm/u7vNii7BDLN
 P0a/8bz9gughAWpiPEgmpK/EYJpHfS5ZIEJwh/mQ6nfA9Uf769FXiTxmvLR/eIFp2Dzw
 lsgyQoGsK1vmww4rsIsvx0KLxEgWkp2OGPsjShgNVumss2x08sVNyJ8cmZRWg+vYioc3
 CRcOX80364eMsNTOe9e27p14vUxI0BIB7XnjMDqBdLfUNHIqJuJUMl1R/Bv4kuDPUvh9
 0o2g==
X-Gm-Message-State: AFqh2krrTmy5KotNTLxoKz4x5u2AZLzyGOmOCs7fnV9TWjCNPXlBPTeh
 nCOyZ+5WXQv47mIfmjbLmGFYqrLP78iQ+SX1c+b4PA==
X-Google-Smtp-Source: AMrXdXth5qSPMp/AzbYareSf+mDRykonxkGLdm9AEVK+bAnE3v6JrUezDC6VwMISSPKo7b52Ho9Vg3REaWKrt2fUACQ=
X-Received: by 2002:a17:90b:146:b0:219:94b2:2004 with SMTP id
 em6-20020a17090b014600b0021994b22004mr1522402pjb.215.1671382816797; Sun, 18
 Dec 2022 09:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20221215080958.2150028-1-gaosong@loongson.cn>
In-Reply-To: <20221215080958.2150028-1-gaosong@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Dec 2022 17:00:05 +0000
Message-ID: <CAFEAcA9pR0OSdsSZHK1mENO9MELTowCQRX6Fza9NAVptJs62Ug@mail.gmail.com>
Subject: Re: [PULL 0/1] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Thu, 15 Dec 2022 at 08:11, Song Gao <gaosong@loongson.cn> wrote:
>
> The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:
>
>   mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.com/gaosong/qemu.git tags/pull-loongarch-20221215
>
> for you to fetch changes up to 288431a1fb9334d5d57ad7d5854d8475b23e7c42:
>
>   hw/loongarch/virt: Add cfi01 pflash device (2022-12-15 15:46:12 +0800)
>
> ----------------------------------------------------------------
> Add cfi01 pflash device
>
> ----------------------------------------------------------------
> Xiaojuan Yang (1):
>       hw/loongarch/virt: Add cfi01 pflash device


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

