Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9584D1422
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:03:25 +0100 (CET)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWgd-000804-AB
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:03:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWdd-0005wi-Jx
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:00:17 -0500
Received: from [2607:f8b0:4864:20::1135] (port=46673
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWdb-0006eQ-V4
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:00:17 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2dc585dbb02so131508967b3.13
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItZHFgvMvFyCQJ8hUXjnd47sRHFaIexm+uyZ0OO3gRs=;
 b=ZrqdVnC+ecMU6DGr7JiE3EggKjJZhLWW/3pbFZeCRvz0r8mRVDKfmTGFiODJepJSYO
 zhEcyYHhmVceQSSnyB/naPuIvrZNKI1i5PbZqUcPsJ/3w0idfQgLLeeWsIDKRzi2r/Pe
 vWh0RF5QUPspwQIQ6fvl3jQFcz2djqnHYe66fKamauqjl/mZ2uicPe5DxSlUqO4kZNB3
 ullUWIErZdm7BQxqz3DhEGP2jeg8gkMHUZa2mX9/IzZs34aCyQGkgnchZbfSvXXBFYwU
 VSkSlskZQO766qj+GonuLaW+qVds9CTMXWSN5rPvkA71jRBJ3SejZNZUDYxQHMSSyYBO
 +2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItZHFgvMvFyCQJ8hUXjnd47sRHFaIexm+uyZ0OO3gRs=;
 b=Piyw2LKhUpN0ojrSy/oOHcR2EwwYBlR/pPlHbO6VO6Qb62bg5mWBWu+tm4RgYa0NNN
 OMjTzapoUvIHZSlLb75yo8uefbH+sLiPeVZ733jYm3TW26TbOaKciaUM+wMW8TcrH6ia
 TiPgzdMLbuAjEJ7IXLwV9qJx3DggY0vg6uqKrG69uOy1YAjS+xWLaoob7Wj9dSlvwVpG
 CJDp4DVL88i9GRmnXgaIs5d/xVshMEIrKsg0ups6OG8TKhtrE3kvB8sU+pRaYMFx0sJA
 hIWADzxGrdTh7FaxBud+FjJ3c20w93XTvvQ11idTiIr7iDsL4vN2/KKjF5I/+rsA/GqU
 3JWg==
X-Gm-Message-State: AOAM5308UFe05UB8Uwzgfnb0/pIQVNabsvqOCa0TecZ/lVYFaAFdOv16
 rBppJOHqAexc/MJe05SGMNpUzDVJNNw3UT1W6GuYfA==
X-Google-Smtp-Source: ABdhPJzbALGmho1Xd83p3IETX3inx8EQLlpcsdq5dYnQgJeT8phA7nXN7LgImModRxLlWlYA8APUfhrpb/qnWfPzeq0=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr11767022ywh.329.1646733613950; Tue, 08
 Mar 2022 02:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-8-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 10:00:03 +0000
Message-ID: <CAFEAcA-8oE1v0Y3Egr1C0Uo4U3HeX0TwY8H8aMb9geruOAYoKA@mail.gmail.com>
Subject: Re: [PATCH v4 07/33] linux-user/nios2: Trim target_pc_regs to sp and
 pc
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
> The only thing this struct is used for is passing startup values
> from elfload.c to the cpu.  We do not need all registers to be
> represented, we do not need the kernel internal stack slots.
>
> The userland argc, argv, and envp values are passed on
> the stack, so only SP and PC need updating.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/target_syscall.h | 25 ++-----------------------
>  linux-user/elfload.c              |  3 +--
>  linux-user/nios2/cpu_loop.c       | 24 +-----------------------
>  3 files changed, 4 insertions(+), 48 deletions(-)

Well, I guess we're not using it for anything else currently,
but if you do this then it's not the target arch's pt_regs
struct any more. And all our other target archs seem to define
the struct to follow the kernel definition even if we don't
happen to use it all.

-- PMM

