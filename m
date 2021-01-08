Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180292EF0C3
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 11:36:45 +0100 (CET)
Received: from localhost ([::1]:52948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxp8N-0006ib-Us
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 05:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxp7F-0006Et-CS
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:35:33 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:34260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxp7B-0008Bf-4d
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 05:35:33 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g20so13971393ejb.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 02:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rIkyMw46PHgBF6q3fnsb9totx5EdQT6p6Pt/NidcJGw=;
 b=TgAnAp0olUK3niT2aiPTjGy9oIaTiyXPIST+AkXJxfEHYOhofnGzNggKAu+7RN1HLj
 bxsylWpaFt/xV8gwXrSYMIygVeN1EMdmCtsJerazyA6/eOC1zN8lepzf8nCkQkRuwCgQ
 Jj9mE5ym3ZKhT1kO8YPvMk8F0AIFfyuQbLf87rsXP48DDjRddYN+V6O88sJEbR0zfBiz
 664c0XMdXX8pOsYDagjoPR4ZQYalZGnORAl/Mgs7wnrL3y0OMNvGlsPdjWqQLkzCp2Db
 fHjOiQoObrv08hricV5nd1VSoJe3dCj9c9UztttazxB0EScN8FuHbSqXex5KFG7ipaTx
 JYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rIkyMw46PHgBF6q3fnsb9totx5EdQT6p6Pt/NidcJGw=;
 b=Hr0Wn3ZrONa3E3+ZeunBOXjEbh5q26dG+LDEkvzj4Tgv7A/5nN1T0ZsukM8LFUeqOk
 wc/qA90DqL9p3IcbvhE8Nacdhec63Bz9YLwgImxJ3R9TtUknNstHVo26fB7U513/DTV7
 WgfEVGs/CqTBNA2Jb076GiF+sNpo6JWW+8+DmEQeJhVaNuxJVkSUFyF6ft3CKW0QoWAF
 98IKhLrlF9BxKm2bdBruMH16WZmN/6U4YJOmrqm3l9ZC+fAZlqQ8s+SkrwntxtpdUkTm
 FDXPMsFugAh4GYvkS6l4XMHbVMLSgy/kLGueD1StLtdiXYvTDZVKJ9s92RG3V9eUG4EM
 Z0IA==
X-Gm-Message-State: AOAM5328RTxAHKSu3QadWm3QyJ9m/pLatY9xoerW8vURwOPsQJJCupzl
 R+oEskUEEnPy3d0E7cno85F6/Wdw59WGC36IYA9jcA==
X-Google-Smtp-Source: ABdhPJwNeqDHR8Vw/jQ1m1utg9NjAfhdr0YmkxZXdHVGF/kVuB/ddQZ9+1qyrCgWmdCr4d2lpDNh/bt995E2SfE+o04=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr2307267eja.250.1610102127258; 
 Fri, 08 Jan 2021 02:35:27 -0800 (PST)
MIME-Version: 1.0
References: <20210107222253.20382-1-f4bug@amsat.org>
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 10:35:16 +0000
Message-ID: <CAFEAcA-6SD7304G=tXUYWZMYekZ=+ZXaMc26faTNnHFxw9MWqg@mail.gmail.com>
Subject: Re: [PULL 00/66] MIPS patches for 2021-01-07
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
 kvm-devel <kvm@vger.kernel.org>, Paul Burton <paulburton@kernel.org>,
 Libvirt <libvir-list@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Jan 2021 at 22:25, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The following changes since commit 470dd6bd360782f5137f7e3376af6a44658eb1=
d3:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-060121-=
4' into staging (2021-01-06 22:18:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/mips-20210107
>
> for you to fetch changes up to f97d339d612b86d8d336a11f01719a10893d6707:
>
>   docs/system: Remove deprecated 'fulong2e' machine alias (2021-01-07 22:=
57:49 +0100)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Simplify CPU/ISA definitions
> - Various maintenance code movements in translate.c
> - Convert part of the MSA ASE instructions to decodetree
> - Convert some instructions removed from Release 6 to decodetree
> - Remove deprecated 'fulong2e' machine alias

Hi; this failed to build on some of my hosts:

[1/4674] Generating 'libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc'.
FAILED: libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc
/usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetree.py
../../target/mips/mips64r6.decode --static-deco
de=3Ddecode_mips64r6 -o libqemu-mipsel-softmmu.fa.p/decode-mips64r6.c.inc
Traceback (most recent call last):
  File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
1397, in <module>
    main()
  File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
1308, in main
    parse_file(f, toppat)
  File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
994, in parse_file
    for line in f:
  File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
80: ordinal not in range(128)
[2/4674] Generating 'libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc'.
FAILED: libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc
/usr/bin/python3 /home/petmay01/qemu-for-merges/scripts/decodetree.py
../../target/mips/msa64.decode --static-decode=3D
decode_msa64 -o libqemu-mipsel-softmmu.fa.p/decode-msa64.c.inc
Traceback (most recent call last):
  File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
1397, in <module>
    main()
  File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
1308, in main
    parse_file(f, toppat)
  File "/home/petmay01/qemu-for-merges/scripts/decodetree.py", line
994, in parse_file
    for line in f:
  File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position
93: ordinal not in range(128)

etc.

Looks like decodetree fails to cope with non-ASCII characters in
its input file -- probably this depends on the host locale settings:
I think these hosts run in the 'C' locale.

thanks
-- PMM

