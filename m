Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB764D13ED
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:54:07 +0100 (CET)
Received: from localhost ([::1]:56340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWXe-0000xD-K1
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:54:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWV5-0006QC-W0
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:51:29 -0500
Received: from [2607:f8b0:4864:20::112b] (port=37090
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWV3-0005E9-5W
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:51:27 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2dc28791ecbso181185657b3.4
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 01:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=afWwvACuA5HffdYKrP3Qegw4d919undKRyIVdRv4Wjk=;
 b=ntysZt50uJh58Nvm+OILZoXxq+lvcByhuSAUzqLmgeCjbVBRCiyzjPNaKa/O+SDLXv
 qDg7MiyPUAcMVu3Ks22xQTs97rjv2vej+MZBWHhIL7AqtWVgl8bby3qyj7x/egjf8Ewk
 NwkPgPs/MhT2IZJ0d6GENrdiNCBh0Of00bfBPbg7Wfw4aJsBYGNU+UuXbxKDhK4sHwh2
 Nn2bbutsWmniMO6yUkPAx6Era0yBxuZl1dApeAwtFS9xZ8ooGgbkFQaNsgRWwvlA4CJW
 3ao0L9U3o06UnVL8TnwQ5aArBQwQ90uAxSjfTIyLqjopc7siw7HkHCK7OpGgUf/O72zw
 zNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=afWwvACuA5HffdYKrP3Qegw4d919undKRyIVdRv4Wjk=;
 b=HTZx/xLS0TMF6iMlfH8ia+Pn25nIlHZL/eo4aAlAiz50RUI1FERTwinDc4raSOa4JG
 Ne7RufR4bJ76PmDkewcYugXQifI/xwm6rodwGURBqAfXutyjBFcL1BxGeIHG7HO0cCjS
 FbMeLYbxvT5EjUImiCglGNu7FPJ4say5MnbPkMIyt5oCdcU3DGpCALhRsCAQbw9s8kIL
 WXy7yXOYb7dSNS0yGV7vKf3HHCG/ZmR0Ly2eLGJ7MyNoCDBCJhfZVTVCz9hJG8MLWGHf
 1afXLRmGHNT6z/R2YSSGS8eCz38rI0zE8OguE3KuhgM51tTdEOFmFJOS9xMygcMzDDm3
 cT0Q==
X-Gm-Message-State: AOAM532szN+69rVMfWMxboKswsijiPapV4S4cxbz5oA+8+Kl6d69Ardw
 s8slZjT6QuTA6Sz0fXaO2KlAqqE78FSE/w19jRjUCg==
X-Google-Smtp-Source: ABdhPJydTCyhICDsFYmpcEwtpY7LG1duYYKqpBxfYENccCTwP0eOnWpVnTZns+QnMy6zJ9fDePyAnyJ2ABOovGuq9QQ=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr12522154ywf.469.1646733084313; Tue, 08
 Mar 2022 01:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-5-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 09:51:13 +0000
Message-ID: <CAFEAcA9btrPxA-gY0UPeJvVqtd0b5vxSq0RuuA98k8CJq8Km0Q@mail.gmail.com>
Subject: Re: [PATCH v4 04/33] target/nios2: Split PC out of env->regs[]
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> It is cleaner to have a separate name for this variable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/cpu.h          | 10 +++-----
>  linux-user/elfload.c        |  2 +-
>  linux-user/nios2/cpu_loop.c | 17 ++++++-------
>  linux-user/nios2/signal.c   |  6 ++---
>  target/nios2/cpu.c          |  8 +++---
>  target/nios2/helper.c       | 51 +++++++++++++++++--------------------
>  target/nios2/translate.c    | 26 ++++++++++---------
>  7 files changed, 57 insertions(+), 63 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

