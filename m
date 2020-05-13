Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344301D0A12
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 09:46:51 +0200 (CEST)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYm6M-0006iJ-AG
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 03:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jYm5R-0006AO-UA
 for qemu-devel@nongnu.org; Wed, 13 May 2020 03:45:53 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:37310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jYm5Q-0006xZ-Nh
 for qemu-devel@nongnu.org; Wed, 13 May 2020 03:45:53 -0400
Received: by mail-wr1-x442.google.com with SMTP id l17so6005165wrr.4
 for <qemu-devel@nongnu.org>; Wed, 13 May 2020 00:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=81+O2PYnyn4ylymuf/Tw1K3inQmvYap14gljoCeFtKU=;
 b=ScDdYgiaa7+bQ+NAchhbpAmDwLyzr/Z+1ORj8hdA/gEehghF9p6LbPOjK1CbyCfJ2i
 RVmWgmss7FlOVTA6Nldzi9lRCzIhVaTFJn2CvTsWI4tnElv3H+6a0jhEaVfIxMCiLgyx
 nR2Oj6Hs3IVGnJ11Y2TunzUWWsydpNifC6eHQ6IIrF9maQJnoMB8GrUUaQgP94YjfknY
 mG0ZwbUffgBKL3fyQbHC1ESk758Z6VIINSx03YsHwbDS7lbrAPCA7wHdJOHD4po0YNCU
 oDQwHCr2T/xMlAYF0ZN/9sfGNPUT5pIXVqWACUloUE6emxn01j1AkvdFpQVUy608t9CM
 2WRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=81+O2PYnyn4ylymuf/Tw1K3inQmvYap14gljoCeFtKU=;
 b=S4gDABWu5tTgkLgb5ZklFM9quX5XVd258f2nQj2n4eJAj7dBRyw3sJACF2RH5chF18
 TykHH+cOQ9do2NFK2jRl/AlcOe4EgZoKZvRJfdeVh47RspDVpXW/jbEA6NZ3npuA3QYc
 6EYEuGNe3MTGWc3YXAXw3D9RAyZJx+hFXOyVkyIzOshuTiWXe3rS1VIURRARSkSifCHK
 9Zsu8g2osL6R8Vk2Ap/isz949J40R9vaP6EGpRGqRskPYHGqXGEop9VFxWtrq5fmfFLN
 OigsdkByFnG+1SpELMVUm4r61sf2QscxOtCJ1He+UVYLr5zYpSJbJYM1uztD/fB2MXgh
 ZJbw==
X-Gm-Message-State: AGi0PubpuiTVksYwS8s5CJSZyICmqa2qs3WiD6pXEb2/DZsHJHSpF+h/
 2bEgtoj879u6yMvg9acAopfzQtna3LIfxNLP7aI=
X-Google-Smtp-Source: APiQypJLRS0lfsAilabNkj+XfbqqT4Mo3jioosJ9l8ohIYzRK5qRsXG+UxKfW3DaQlKUSOXKR1WhXp9r1j9Keh+6mDI=
X-Received: by 2002:a5d:4b0f:: with SMTP id v15mr19850778wrq.162.1589355951312; 
 Wed, 13 May 2020 00:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <1586337380-25217-1-git-send-email-chenhc@lemote.com>
In-Reply-To: <1586337380-25217-1-git-send-email-chenhc@lemote.com>
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Date: Wed, 13 May 2020 09:45:18 +0200
Message-ID: <CAHiYmc647DO5Y7Cezkv5tXB-PNcA=yyTsLY+Wwrp2va7wq9_dQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] target/mips: Support variable page size
To: Huacai Chen <chenhc@lemote.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Huacai Chen <chenhuacai@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=D1=81=D1=80=D0=B5, 8. =D0=B0=D0=BF=D1=80 2020. =D1=83 11:07 Huacai Chen <c=
henhc@lemote.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=
=D0=BB=D0=B0:
>
> Traditionally, MIPS use 4KB page size, but Loongson prefer 16KB page
> size in system emulator. So, let's define TARGET_PAGE_BITS_VARY and
> TARGET_PAGE_BITS_MIN to support variable page size.
>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  target/mips/cpu-param.h | 5 +++++
>  1 file changed, 5 insertions(+)
>

Reviewed-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>

> diff --git a/target/mips/cpu-param.h b/target/mips/cpu-param.h
> index 308660d..9c4a6ea 100644
> --- a/target/mips/cpu-param.h
> +++ b/target/mips/cpu-param.h
> @@ -23,7 +23,12 @@
>  #  define TARGET_VIRT_ADDR_SPACE_BITS 32
>  #endif
>  #endif
> +#ifdef CONFIG_USER_ONLY
>  #define TARGET_PAGE_BITS 12
> +#else
> +#define TARGET_PAGE_BITS_VARY
> +#define TARGET_PAGE_BITS_MIN 12
> +#endif
>  #define NB_MMU_MODES 4
>
>  #endif
> --
> 2.7.0
>

