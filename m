Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3CC3655EE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:12:06 +0200 (CEST)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnMT-0000zi-AD
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYnLA-0000Su-1U
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:10:44 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYnL7-0005IC-0M
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:10:43 -0400
Received: by mail-ej1-x636.google.com with SMTP id x12so36628665ejc.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wA8EEGrsRrMf+sxH9EDeOkCNLe9gH279dlYxKENyBXo=;
 b=BQAn0FyRQSWG9uVpXoZgzeSEneF9beKRnpu+lqL+WpCbvx8hw7uz7EJTfN3YOVDWXJ
 sSTKcExZCFHTa1UXitG4ne0410aUkTzstYgDP7WqKq8ZyR2pbCY4ccjKwCiZND+masjx
 83JUFXubdJGFOVB4VpTq1+rnPpj6Uslu56xraSUR+mXxyygcv+XlIR0ycSNhzykBIPAt
 hkJa11hIwBeRzp9LVyMc59Zpp3Uc/p01bK48fIaQu8dfediA87pOi6zkTAl/2rDIEM5H
 3sq7DlhGcmwbhg3m1OCIsRtX9vNDODHSTD0SZjSq5pSJB3JPvJ57GpbfN4yZmZLhei4T
 HGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wA8EEGrsRrMf+sxH9EDeOkCNLe9gH279dlYxKENyBXo=;
 b=jABTHmLGhAT2Ne/9uQC9mzIceb5r07PS7fN62M3pUR2XXd4nZ/pMtDwhe+oaBDb5TE
 5z//08VDAH/hCgmTsY2DnIXbORREk1CSB6uLlXtsDSrG4210eI1ylqvX9mXBWW5J6yEE
 bDAE4hcW0LnRq1NjJP9X8+9b59IBNQDy1F1T+jWUun2YOTTUa24ZiikYrBvuxW29f0K9
 p2s29C+CJ8iqOXF3x2Ndh1wNsFMzhYDjfhb2Uw0kZQYW5qgsACWiekp860NoWd+pz7vP
 G1D9C3MBGbOJJpqSFxgf9SVIC+Pessfkk5qqgAv73ORFY+Nx0w1/n66bS38CBsuxN//a
 E9FA==
X-Gm-Message-State: AOAM532F2n3VlhKodljxGtELhMAWOxyAgjo6RPnc1idE3hBT/827ldiW
 /3zxyb0bTyMPvQzDpPkA4GnExp3iAlsDQaPYWPWdBQ==
X-Google-Smtp-Source: ABdhPJyQ/uZFWXkAD4to2lC9GTVKnHoh6cz5WhGeRQLZYJQMCFYyX9fJsPflyOczIExcn5Y+jy33Mq1aGU65L/XNoVM=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr26790656ejx.85.1618913439199; 
 Tue, 20 Apr 2021 03:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210420100633.1752440-1-f4bug@amsat.org>
In-Reply-To: <20210420100633.1752440-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 11:09:46 +0100
Message-ID: <CAFEAcA82rt5hg3AU6NPJ5ap_XEmJyMueZMdXEn-pXYNunEVQZw@mail.gmail.com>
Subject: Re: [PATCH-for-6.0 v2] target/mips/rel6_translate: Change license to
 GNU LGPL v2.1 (or later)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Apr 2021 at 11:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When adding this file and its new content in commit 3f7a927847a
> ("target/mips: LSA/DLSA R6 decodetree helpers") I did 2 mistakes:
>
> 1: Listed authors who haven't been involved in its development,
> 2: Used an incorrect GNU GPLv2 license text (using 'and' instead
>    of 'or').
>
> Instead of correcting the GNU GPLv2 license text, replace the license
> by the 'GNU LGPL v2.1 or later' one, to be coherent with the other
> translation files in the target/mips/ folder.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Commit introduced after 5.2 release, during the 6.0 cycle.
> Harmless and useful for 6.0-rc4 IMHO.
> ---
>  target/mips/rel6_translate.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
> index 139a7524eea..0354370927d 100644
> --- a/target/mips/rel6_translate.c
> +++ b/target/mips/rel6_translate.c
> @@ -1,12 +1,11 @@
>  /*
> - *  MIPS emulation for QEMU - # Release 6 translation routines
> + *  MIPS emulation for QEMU - Release 6 translation routines
>   *
> - *  Copyright (c) 2004-2005 Jocelyn Mayer
> - *  Copyright (c) 2006 Marius Groeger (FPU operations)
> - *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
>   *  Copyright (c) 2020 Philippe Mathieu-Daud=C3=A9
>   *
> - * This code is licensed under the GNU GPLv2 and later.
> + * SPDX-License-Identifier: LGPL-2.1-or-later
> + *
> + * This code is licensed under the LGPL v2.1 or later.
>   */
>
>  #include "qemu/osdep.h"

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

