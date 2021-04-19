Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D245364898
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:55:52 +0200 (CEST)
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXBf-0007iy-KY
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXAI-0007IN-Er
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:54:26 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXAD-0008Bi-6R
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:54:26 -0400
Received: by mail-ej1-x631.google.com with SMTP id w3so54042850ejc.4
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OeBQrZzyHdHbSQKiWYF6tRI+fW9FBcukjlpMbe6G5tM=;
 b=ziVQtxoTG2BBSq1QBrdVngELmoebccpGkYm/dB4JZTDBiYItsPUJ4iqCO6XNQ8vEq3
 FjS1o066nKsL6WkLnb6UW+KpFiwVQY4g+icTb3hlpXqAvaGvPGDDWgV75G28Rb7lzYXj
 SQyJ3Xg6nZNRnMgqRLI9WvPRQe9SzEbPP4xI7Nit0oFUsXKbDyfxEMD9EVS5OEEKzwOW
 nIBx8P8KEp9owa36FnjpNMl1kSyz4D+pWu3MtM9t6GCgq9COgeekz2qULrWws8YAQUUk
 9VKbILdIudwv8K7eFUfvECMptyS9HlxVl/zz1VdXjYmd5a5bsWA3jfLgLNgRocpRed5R
 UagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OeBQrZzyHdHbSQKiWYF6tRI+fW9FBcukjlpMbe6G5tM=;
 b=GXtLaRtuDDawaRXlg7KRwfpO6DsjzwygyHrh2KpE9Z57f12PYu8M7ZBrJICbqTZiEn
 9pZsaLlPXOGnXJBpmquzM0bCTIW+xYtho0iWLjoghsRY6eh0ECDyaK3hzFg2mKWqZEDV
 X+8KDPlvoXD/tdkNcnSYQzWadyB2K8/h+8x/cLOcQeliiZqu5cirNY+UklLyR7E4kBpw
 tWNpainkyaV/dsTmZf8wvwaLLrD5SInNEAo5ap+KobEqloot8Vl4sddXc1NNqBr1+rQJ
 Ny5NZLFSZvSl864DExRunt2DjezZ0A6QLvAem/aHUXntoH9aAkSPEQNt9bP+0k6jK9Ec
 Ol8Q==
X-Gm-Message-State: AOAM5320kuUOv+PEU/G+XqhYmy09whyWLa3iB2SD8P617i9Pjrbcm2U9
 DKOT75g4xqKUtuuhIfSeYbFMtQBzo+dDQm4ZHkV5hA==
X-Google-Smtp-Source: ABdhPJwGE2plvsVj4P2lkhvy6Q7n5j816EPa4EtfIi5zRNRJOs+LJogZe+R6ZtpzkAE5rr/diGWV1/+SclMvcgXwYZk=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr22876684ejc.407.1618851259050; 
 Mon, 19 Apr 2021 09:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210418080345.926981-1-f4bug@amsat.org>
In-Reply-To: <20210418080345.926981-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 17:53:27 +0100
Message-ID: <CAFEAcA-5yjOFpn15-OiBuF4DxyOde=rmZ=ZzypgNtHF1DgeXRw@mail.gmail.com>
Subject: Re: [PATCH-for-6.0] target/mips: Correct the license text
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 18 Apr 2021 at 09:03, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The license is the 'GNU General Public License v2.0 or later',
> not 'and':
>
>   This program is free software; you can redistribute it and/ori
>   modify it under the terms of the GNU General Public License as
>   published by the Free Software Foundation; either version 2 of
>   the License, or (at your option) any later version.
>
> Fix the license comment.
>
> Fixes: 3f7a927847a ("target/mips: LSA/DLSA R6 decodetree helpers")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Commit introduced after 5.2 release, during the 6.0 cycle.
> Harmless and useful for 6.0-rc4 IMHO.
> ---
>  target/mips/rel6_translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/mips/rel6_translate.c b/target/mips/rel6_translate.c
> index 139a7524eea..c5843cbc5e2 100644
> --- a/target/mips/rel6_translate.c
> +++ b/target/mips/rel6_translate.c
> @@ -6,7 +6,7 @@
>   *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
>   *  Copyright (c) 2020 Philippe Mathieu-Daud=C3=A9
>   *
> - * This code is licensed under the GNU GPLv2 and later.
> + * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>   */
>
>  #include "qemu/osdep.h"

I find this file's copyright/license comment a little confusing.
Looking at the actual commits, it seems to be entirely your work,
in which case you can put any (compatible) license you like on it.
But the comment header suggests it includes some code copied from
other files in target/mips and thus copyright by Thiemo and others:
if that's so then it would seem more logical that this file be
under the LGPL as older files like translate.c are.

thanks
-- PMM

