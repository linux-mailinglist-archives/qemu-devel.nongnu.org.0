Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741D6133E4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:47:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opSKH-0000yP-Tf; Mon, 31 Oct 2022 06:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opSKD-0000sn-0Q
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:47:25 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opSKA-00074Y-Pm
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:47:24 -0400
Received: by mail-pl1-x632.google.com with SMTP id c2so10363557plz.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4fQUDxB9gXaG7gk00bzYD84G6S6rxfvEgKeVA81328=;
 b=yhSC6Htiw/afClRKyWhQzGKszWsSCI+LAQjaRThzYgb8BGg38IwziHWm+v+UReCGF0
 NlCuzdZCmnsvKNhxmTaUpI1U0Kj7CkKzYZpDFh1QZZzQgtxGAAY+z/Mx2pCPN0JFcAKe
 gkXADbnLOeerASSW2+ghH5S3tb/BPfl9ng0rKisdJA+R8zFp2EyWWCKg2SMN3fU2btJn
 vXBqvwk8V+c5pSKXCEfop9WS+D2rXqC1jEVvXvrD/bl1240W+UETlYQksMfSfDYToDYQ
 4hXId3uzryGvkfnUgIo1TRFeWv5RSN+vy0x02Ta0xLoui37Ah6R6JLiYxUChQxVr4UXj
 CSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N4fQUDxB9gXaG7gk00bzYD84G6S6rxfvEgKeVA81328=;
 b=eHjrssJZdeq0vkeR7jRcvHNOH1LMobAko0QeO2+03m5keDvbIKML71UaG8LiWqHQN9
 hzb1o8nYAycw8e3OO+Bn99OnnUw0/wse5jpK1u4LfV8eSR9jvhdDwOmCZJFOh8dVWGXt
 Z46Ey7TFvqZjDdwJgtp/acndaXPO0HlL2yJA76MgiRRvp4eusGAmcELsZ/IXXo1MDuOO
 XyDgvOEMFXl4uyqc2pKIGVD9nqgqmXQIgRh03Cs6BcrgGZw9hSrvL/mHwyE8aUZDYvU0
 euqiNKcFU4Q0xtQyP5sypiT1nkQdadR6ToNh8AZ7QkxzYLwls89F3tKuOW5KUp9/ribI
 MZPg==
X-Gm-Message-State: ACrzQf1adiEbOZRx+Hd4jzWiXuIQKxPKKgl0VapauMCXLd4lPy+9lJsY
 8TImM4ZMXWzd6rv/av6Oh84qo2wk2umYMKjp3wpXMw==
X-Google-Smtp-Source: AMsMyM6LIMw+2GcGM5Lwna2ZnH9c+dxRJE5/HwOc+++9YN00Ai5Tr19HOaIEnYHsG3TxWSn+86VnnHhfIcFAujJCsi4=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr14242443pjb.19.1667213240817; Mon, 31
 Oct 2022 03:47:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-2-richard.henderson@linaro.org>
 <CAFEAcA-7q2fat9grNuTVcvzozTiCUBaPSSwqHLe02Dos7zFing@mail.gmail.com>
 <9ff5d8fe-f138-b1fc-3b7d-88fc46235c02@linaro.org>
 <0ed31b6d-e665-db66-ec87-d9a9d6394da5@linaro.org>
In-Reply-To: <0ed31b6d-e665-db66-ec87-d9a9d6394da5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2022 10:47:09 +0000
Message-ID: <CAFEAcA-pHD9zsyh2MTsiPSzE=sgyxNi0id-A0nyxmcAcdc-9og@mail.gmail.com>
Subject: Re: [PATCH 1/3] tcg/sparc: Remove support for sparc32plus
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x632.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 00:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/31/22 04:21, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 30/10/22 16:45, Peter Maydell wrote:
> >>> -#define TCG_TARGET_REG_BITS 64
> >>
> >> Why do we delete this?
> >
> > We get the default definition from include/tcg/tcg.h:
> >
> >    58 /* Default target word size to pointer size.  */
> >    59 #ifndef TCG_TARGET_REG_BITS
> >    60 # if UINTPTR_MAX =3D=3D UINT32_MAX
> >    61 #  define TCG_TARGET_REG_BITS 32
> >    62 # elif UINTPTR_MAX =3D=3D UINT64_MAX
> >    63 #  define TCG_TARGET_REG_BITS 64
>
> Exactly.

Ah, I see. I was confused because a lot of the other tcg
targets seem to by-hand define it, even when they don't
AFAIK have 32-bit-API-on-64-bit-CPU support to consider.

-- PMM

