Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F32C233C3AE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:11:41 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqkn-0004t3-0Z
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLqU0-0001yX-9M
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:54:21 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:42570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLqTu-0006fg-18
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:54:19 -0400
Received: by mail-ed1-x530.google.com with SMTP id u4so18151074edv.9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/JAzxYlU0/s+0x2aTfn1b9/Puchn34Oih5n0Vy9Sodw=;
 b=QSEFCAhGHv1QQlS/L6Xkd5kQsxPTCLvYvEhn75pHpLnVLc0W7epEaqalPyLAILUHI0
 0pgsWs4nl4yR+4ukMhPEYsMjgZerFHTAfdUjEKIv/xRAL5veg4G21S22G73pPIMiHFq6
 IytfmQiy6qDJ/aRJiy4Zvd7GksUL3pV8COmts0gYr6+cELJYnwRpcXl+o53SjOivZHNu
 EoNhih8EuGLAfLn9eIH2ClTB6cpHAwM06VqzB/6owGEDV7YPW+8AYsndCUgTU2y9oglg
 ZS4WaxDvQ5B5u1vcP2No0qIyxv8HdVAhDFVi27ZHvbQEi4Qz7crczFGK6mYzyn1+KAI1
 gI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/JAzxYlU0/s+0x2aTfn1b9/Puchn34Oih5n0Vy9Sodw=;
 b=Lpp1n1D/ouvwzvl+g2qT7AX0PlujYYAmvh1fiFvHqvp12MYYZDELWs+ZIxdNexynyQ
 +hgNrOhITsAlqawroEluIPC6UJKAUEIF723YoovjYXvPR/hKXS/z6AbCRX+ni0fR2COy
 6WxXQmpJLPyv1xdR+tqk4lwVjoN3mRBrn4i+wIz4/NHyapBGLKP/RCRkvo8xNpdMGEWh
 at/VcXLn8pI8mV0hxd6ZlTfxovu3ELyIBzVrJxQcOmkjqtrejN25jNVfN5Hy0XTxgUe6
 DJsShNQbpSIaMSW1eik3Zr25pSf4TBw4Gg4tMPDhDl01g6m3sEOVlZ+w7Fjxxh1BM89F
 oQwQ==
X-Gm-Message-State: AOAM530dgUZRnTSw/lXFL76ZxfGMLSDLp4Juc0Q7ARnX+Pzv1x7mTVJ/
 dF2dhc+C2nW+p0tl+JNq7oUkYSV295zP2nFmhJM3eA==
X-Google-Smtp-Source: ABdhPJwGlnL026fC+iaaeYS76XgUtJlduo5HElGehBV8HHe1d+0hiJDZ/AjAmt2ImCPhl03p6zN/A8BUE4qIjtZ2y9g=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr30732663edv.44.1615827251880; 
 Mon, 15 Mar 2021 09:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 16:53:50 +0000
Message-ID: <CAFEAcA9wE+n3kExf1nMCaPDM7a_Zkjd3HY9hr1xm8id+_GQWtA@mail.gmail.com>
Subject: Re: [PULL 0/7] tricore queue
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Mar 2021 at 13:59, Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> The following changes since commit 8e6bc6cdc82d45f203bc9fc4342c0452214c74fe:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-request' into staging (2021-03-12 18:56:56 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20210314
>
> for you to fetch changes up to a21993c7f98862823280d1eb6d3e93cf6267896f:
>
>   target/tricore: Fix OPC2_32_RRPW_EXTR for width=0 (2021-03-14 14:49:01 +0100)
>
> ----------------------------------------------------------------
> - Added triboard with tc27x_soc
> - Cleaned up get_physical_address()
> - Fixed corner case bugs in OPC2_32_RRPW_IMASK and OPC2_32_RRPW_IMASK
>   insns
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

