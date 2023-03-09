Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE836B2508
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 14:15:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paG6U-0001z0-Db; Thu, 09 Mar 2023 08:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paG6Q-0001qc-1N
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:14:39 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paG6O-0000GI-9d
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 08:14:37 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z11so1449821pfh.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678367675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dNcXr3PW37cO8kCIOCGIWe7+iIL831tB6msNJOsykWc=;
 b=Wk0WltoGiN1uzu+Xs2CI3cF4hL0emLWot2YWKytCOQRUh7M8f4fJAP3kyTFP9CrS71
 O42joKEuhfJBI1L/x8lFE10sAcLqWTzHCTWWuz3DEr/OnIcDvqRac7C7u7Os9cdurVjx
 SW2PXb3xKisV51MzTdd21sjOaGQGniAfoTTs0FzgVQrV9mE3YYKUR0QtFkxQCnHOTxvz
 Jld/XHZtvkDnmOnXSejBnuAOgHGEX1ZkRB9umhta9jGkdwxChrGrTJxgMPxgm3z+fpYP
 SqSiPZAfphdmsQhngdkZpv8PCbl9k3QJ7fByXO0wtRPZXVbtHTrhvyLw/9SVlsBXGp4M
 qY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678367675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dNcXr3PW37cO8kCIOCGIWe7+iIL831tB6msNJOsykWc=;
 b=DFWBH43ZCwVkOdE4DcWc0A5FRp8FRpSegrXdKlz+I9QVpRh/uAyl0EVe7o19jYQOe5
 xGakcBTi15oM2SEh76zTUxANJ/99CYaUGw3hSomGnI/jz03vqf7IUD8DX0g3sSHr8Ffi
 Z9saHGYPoBd4alc8P94VGOTVT8U+kldHoZWF6FTTGWlO2U00TA8AoP6aa3XfMnaGIuFl
 Pze8BL4jR7tfYgHj2OHCgbaCxsco7p4WA0SEkq7TvNs8GrUfB/Z+GoG6wlvJeVGX9mso
 hvm4VT/rqlnV6rXlOtrN0HvxknNV5vJN4aZ2tACMbN8o6OsjKHPv34Pksryo08X3B6oL
 az3g==
X-Gm-Message-State: AO0yUKUeLfBHSoEOb2LeAW+LnbCaPADgB2I3q67CRY9DX3xMPT+tU8CK
 fLEBS9soViR5XF2OvO01bEPADFYosjt5+hgDk3Jf2Q==
X-Google-Smtp-Source: AK7set84mPeHuSj3ejDyZH8a5ni765+z6GMxu9VivFwoOr1ca8RywkYdV26gkh+fjT9C9/P4R+mWSqqLI+OKC8+F3yE=
X-Received: by 2002:a62:8787:0:b0:5aa:72b4:2fe1 with SMTP id
 i129-20020a628787000000b005aa72b42fe1mr9302843pfe.1.1678367674817; Thu, 09
 Mar 2023 05:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Mar 2023 13:14:23 +0000
Message-ID: <CAFEAcA8GHu8Kex6sUsiZwYu5=ya_j4e_A9xkCHxVewXU1xVFtw@mail.gmail.com>
Subject: Re: [PULL 00/67] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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

On Tue, 7 Mar 2023 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230307
>
> for you to fetch changes up to 19458933164e4a74a15618cacc20365b20f04697:
>
>   tcg: Replace tcg_const_i64 in tcg-op.c (2023-03-07 08:23:55 -0800)
>
> ----------------------------------------------------------------
> accel/tcg: Fix NB_MMU_MODES to 16
> Balance of the target/ patchset which eliminates tcg_temp_free
> Portion of the target/ patchset which eliminates tcg_const
>
> ----------------------------------------------------------------
> Anton Johansson via (23):

Looks like you've got some more list-email addresses
that need fixing up in this one.

thanks
-- PMM

