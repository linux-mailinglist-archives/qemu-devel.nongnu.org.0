Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B156613B2
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 06:29:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEOF8-0003C1-6n; Sun, 08 Jan 2023 00:29:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOF1-0003BO-69
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:29:07 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pEOEy-0007ou-93
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 00:29:05 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s5so7834034edc.12
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 21:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lXzAzZaEY3WpIouD3Ha6kjwuIXRb4aQngk0/bz6gz3k=;
 b=HXuiPTTaFTRLGbWg51n9aYwbKNxNGlerqDk61fpLt06S/ox6LBK3N4S+G+0NTkC8UL
 tPGSV5NqHrW+0b+uhEDM6C7kwQLEZzMfHX6XjJcZhHDGSl+lGFMA/kESoEWfhOSbz4oX
 Bb3gfajWichm/Cv42+X6UZ1joMDojdzPaEEJvhN2OKu6tUt4C1LpjZmUexFhUAon1hbb
 MiHBHUE6VHLBlNB2CPGuPmqmAnuhsn+40CjeBX6twPVPklKTeYqBNQ7Ue3ZBasZNUbP7
 CBu7w/TRLp/ComH3gBrrJm9akHTjFAZptcGe4FD4tawWFXHZbaZVq2cb7Ea60EgTc4cZ
 kA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lXzAzZaEY3WpIouD3Ha6kjwuIXRb4aQngk0/bz6gz3k=;
 b=VjoBHyZIZFVy1+RN7j+gn3Zn17jwW+/VStP2i2H90Ns6NLqO2K7XL/xu+YHlRcEfIa
 PLTOA8S5zRqxWLT+/1S4VX1kzHE2g8F1Tv1IifLMHnt3YiRqns+hy9O3UgKCNnTA/mfQ
 AulVEJA90D/QMK7EmXPjaa1smmNxV4UT56OF3Yy/tBCZ5+/6IdosMLu6TS4j4rrHQyh5
 xqbiOXFxUCZEWTppE/4qOmQJW6q0az0FycdlxDw/mh2H2vhDoXRReNFBCn9WSVmrnTHQ
 /56kbBhu7VCF9OeEofeWUzdP0ezCPHHhQdA+dZUwk2n7JM8GS7B4qsZEapw/jM+Jzvnj
 zUqA==
X-Gm-Message-State: AFqh2kpP2mmkrjRuUroF2t5AR7VFCI/hbvEM2ziqhWQFXITtyqG8SO1h
 5kvNzU/1WZX/LRUZLw4VctMCa+bhMYzd4ZezFmeuJPCs
X-Google-Smtp-Source: AMrXdXuS37ZgMybEY7bRCVSCcRF3Kb7AccPgjvTT/C00J5kNzRZVtmYj4mOBoMzyw9aGTdQx0SHj5xVKu5pQ2TwEeWk=
X-Received: by 2002:a05:6402:6d9:b0:499:7efc:1d78 with SMTP id
 n25-20020a05640206d900b004997efc1d78mr79425edy.81.1673155743020; Sat, 07 Jan
 2023 21:29:03 -0800 (PST)
MIME-Version: 1.0
References: <20230104220449.41337-1-philmd@linaro.org>
 <20230104220449.41337-9-philmd@linaro.org>
In-Reply-To: <20230104220449.41337-9-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 8 Jan 2023 13:28:52 +0800
Message-ID: <CAEUhbmXeX0s13+vF1DGCsoX2gEuPv25jg_AJm53TpJUYckNgaw@mail.gmail.com>
Subject: Re: [PATCH 08/20] hw/xtensa: Use generic DeviceState instead of
 PFlashCFI01
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Thu, Jan 5, 2023 at 6:37 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Nothing here requires access to PFlashCFI01 internal fields:
> use the inherited generic DeviceState.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/xtensa/xtfpga.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

