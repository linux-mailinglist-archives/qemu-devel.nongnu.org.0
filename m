Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1710B3BAE0A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:27:03 +0200 (CEST)
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05tW-0007w4-5m
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m05sa-0007Fa-EF
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:26:04 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m05sY-0001rJ-0I
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:26:04 -0400
Received: by mail-ed1-x52d.google.com with SMTP id x12so20566783eds.5
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UfHe9DNPXNnLg3r6bTZc2HkGk07j+KSTFA08HfKkw4o=;
 b=zPBfo4LLlAItuUvVg+UV0xmt1HgCZxSG1NviO5Og21JMRJlYHHYA2EEFXuC/t97twL
 +m7T+EPaJHFhx8kwlv3i7PXu7lHEeWFC7kiOandyRpVg4VBzqfIRz3avVz4VZB19TbnQ
 KjR5YVlXhR6gzuTfl1bnOBbocRt6+ODbUI21TkG7j64HKmwvMc9yD2yp3D9NQ0Zs+IMN
 uKfY9SnPwTdejEa+9jIN+qq0F5yI53VO31vwCsHQMWnkpcT0PLKaraOdAD6MNjqkVju4
 RHQvXYSopfZ0d/E8ILqKbhQU6c/MO9rPpxv43SbT+8QC9VqIsb5NFSu8GDd2X+tdPQjW
 F51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UfHe9DNPXNnLg3r6bTZc2HkGk07j+KSTFA08HfKkw4o=;
 b=WIsTQvUw0LsbvgNXaXIcQ7ZqAZFz5QqLlNVmnbSfUYjg9DnzHVMXOWY/x7OBFcHfq3
 RaX975wDz0QFdic5JF6choLJbHQN5ceC7vu5xJSjbKYFih7B7cnbNcF9iBOiFgCOgW3R
 QaRFoEzmIs3Sy/QBOHHiMhjiMV36UypXhcdMJ3IpaqgckL6lCQwaPzaiXwEWPEmUDiPq
 G3l8itbQJ3aUsZdkm/ELNs9l9IeMP7m3tF9FRsOBP/rO0wBnHAMEsDcUDM1hYC1i9f+c
 sCp6D5xLLzrzc5EcpapV3b43ReKxjbZ75l/HBZPsvlPZuqn4cMoSxzy/8Y7L4MG8tVkT
 x2mg==
X-Gm-Message-State: AOAM532b0ilxQ/W/kUvs92gMiML7wue/tC1pvhLUQT6Vii5qRtHJFEA2
 4XpA2QfZlZv/d6GqAyatnFco3C2+RcI5miHQ99jZxA==
X-Google-Smtp-Source: ABdhPJxu0JTbHFcO0rt7omie3JynBmwTvq7FfLqkcv2aNFQVZE6M5hJuVczXoq44EZTPxq5aghBdTa13K6khcEjDTxU=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr11440816edz.36.1625419560427; 
 Sun, 04 Jul 2021 10:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210704170736.617895-1-f4bug@amsat.org>
 <20210704170736.617895-4-f4bug@amsat.org>
In-Reply-To: <20210704170736.617895-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Jul 2021 18:25:22 +0100
Message-ID: <CAFEAcA8nqWfOchWL-t5cdf_gshbBqryMvZCtg=6XF0Z4po+O_g@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/mips: Rewrite UHI errno_mips() using GHashTable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Zak <richard.j.zak@gmail.com>,
 Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Jul 2021 at 18:07, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Linking on Haiku OS fails:
>
>   /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/..=
/../../../x86_64-unknown-haiku/bin/ld:
>   error: libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.=
rodata) is too large (0xffff405a bytes)
>   /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/..=
/../../../x86_64-unknown-haiku/bin/ld:
>   final link failed: memory exhausted
>   collect2: error: ld returned 1 exit status
>
> This is because the host_to_mips_errno[] uses errno as index,
> for example:
>
>   static const uint16_t host_to_mips_errno[] =3D {
>       [ENAMETOOLONG] =3D 91,
>       ...
>
> and Haiku defines [*] ENAMETOOLONG as:
>
>    12 /* Error baselines */
>    13 #define B_GENERAL_ERROR_BASE              INT_MIN
>    ..
>    22 #define B_STORAGE_ERROR_BASE              (B_GENERAL_ERROR_BASE + 0=
x6000)
>   ...
>   106 #define B_NAME_TOO_LONG                   (B_STORAGE_ERROR_BASE + 4=
)
>   ...
>   211 #define ENAMETOOLONG                      B_TO_POSIX_ERROR(B_NAME_T=
OO_LONG)
>
> so the array ends up beeing indeed too big.
>
> Since POSIX errno can't be use as indexes on Haiku,
> rewrite errno_mips() using a GHashTable.
>
> [*] https://github.com/haiku/haiku/blob/r1beta3/headers/os/support/Errors=
.h#L130
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/mips/tcg/sysemu/mips-semi.c | 62 ++++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 17 deletions(-)

>  static int errno_mips(int host_errno)
>  {
> -    if (host_errno < 0 || host_errno >=3D ARRAY_SIZE(host_to_mips_errno)=
) {
> -        return EINVAL;
> -    } else if (host_to_mips_errno[host_errno]) {
> -        return host_to_mips_errno[host_errno];
> -    } else {
> -        return host_errno;
> +    gpointer uhi_errno;
> +
> +    if (uhi_errno_hash_table =3D=3D NULL) {
> +        uhi_errno_init();
>      }
> +
> +    if (host_errno =3D=3D 0) {
> +        return 0;
> +    }
> +    if (g_hash_table_lookup_extended(uhi_errno_hash_table,
> +                                     GINT_TO_POINTER(host_errno),
> +                                     NULL, &uhi_errno)) {
> +        return GPOINTER_TO_INT(uhi_errno);
> +    }
> +    return EINVAL; /* Not reachable per the specification */

Per whose specification? This function is passed the errno as set
by various host OS functions like open(), lseek(), read(). POSIX allows
those functions to set errno to any value, so this "we don't know
a guest errno value for that" code is definitely reachable.

thanks
-- PMM

