Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D834660968
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 23:17:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDv0i-0000e3-HZ; Fri, 06 Jan 2023 17:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDv0E-0000U1-QL
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:16:06 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDv0C-0004RW-OX
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 17:15:54 -0500
Received: by mail-pf1-x42c.google.com with SMTP id a184so2082092pfa.9
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 14:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RNjkgH3xLkJ/hNfBZJevVGu89FI9di/j48psFLbQ5yw=;
 b=WW8WcNYjfe1I4qqeylLj32+AAH48z342Mx84eohjYy9pVBsO8DMiep50UaVl6UOl2U
 dkR/yRpimGvooNPoRwsr0u8bI8DkRe3vAL4lx7lvpua6yp6m0oX+s4rVflaWEhnS6tqF
 IycuxNcM5GDTyQ5OsVq7Wrw8X2aBESesPqJhhMdT6l/0QT2UZbrOwODruCWb5NLVqcTD
 AStIcTevqGsugY0Ek6UzUqAe8Yx1jRIYNkRzKf0TmfMCr8g6j7aIUVbAXbDZviNLFDmy
 eonUK62FW4lyAiflqqUikDXah571DR4Phv1v9dJQLLaYnRUeZ+J6Z3lLRhutIUkRBITQ
 vA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RNjkgH3xLkJ/hNfBZJevVGu89FI9di/j48psFLbQ5yw=;
 b=kn1/YqQs6+1bMvbuA77LYO9IIJiPkt3RJw9+F8Ywlwk1hf05fQGXvDsGZLRy5iTI7Q
 vAnpMw5pSAW8PF+GyN9m8IxO9IFl0VKqAOHU9SLk1GXSIWnBxv5gQ8nAOGKiBTUANun/
 CYKHJ0gDFVv5VxgWjIVrOtQjIe9qeIVgycxagIBLgP6wYCuBJR1BwDOThX0FSTig3693
 Zyox8mfw1aUn5W+Lwd9MldeJjZHjP/4Opu/G4i79bKrtTaNehSox5v9yYS+HYHBxtHMa
 ZMKgaVDJwo9spNnvv6shBRtubaTBpzBZNEL8PWOSwebTz/YP/tTkdWrRjnyhyPiy2Ch2
 2oBQ==
X-Gm-Message-State: AFqh2kqsc1cR+MRHGC50ba1WJJZxW8n73+vmJmsNYZyi2B2hBej+nZSe
 Z7MuDBjmpfGv3edFQFfU7sO3UUpd3y19H7dqKzyvYg==
X-Google-Smtp-Source: AMrXdXsiUWwBnX830ce8x4uYmA/0tAEtsfmmaK+e0Etf7jbwd7o/JIR5t/wc3s865wzBQ3H5qp/axXD8d8+DTYodbDM=
X-Received: by 2002:aa7:999c:0:b0:582:74a2:1e4e with SMTP id
 k28-20020aa7999c000000b0058274a21e4emr1508937pfh.26.1673043346315; Fri, 06
 Jan 2023 14:15:46 -0800 (PST)
MIME-Version: 1.0
References: <20230106031720.1204672-1-richard.henderson@linaro.org>
In-Reply-To: <20230106031720.1204672-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 22:15:35 +0000
Message-ID: <CAFEAcA8K4WaWETd4F0K9tk77BDAVVhfFSSGHRiT79xvHQ+8q_Q@mail.gmail.com>
Subject: Re: [PULL v2 00/47] tcg misc queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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

On Fri, 6 Jan 2023 at 03:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes in patch 47, to reduce execution time with --enable-debug.
> Changes in patch 19, to fix an i386 specific register allocation failure.
>
>
> r~
>
>
> The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:
>
>   .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230105
>
> for you to fetch changes up to d4846c33ebe04d2141dcc613b5558d2f1d8077af:
>
>   tests/tcg/multiarch: add vma-pthread.c (2023-01-05 11:41:29 -0800)
>
> ----------------------------------------------------------------
> Fix race conditions in new user-only vma tracking.
> Add tcg backend paired register allocation.
> Cleanup tcg backend function call abi.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

