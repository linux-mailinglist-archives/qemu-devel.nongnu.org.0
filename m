Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07719568A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 12:46:26 +0100 (CET)
Received: from localhost ([::1]:40670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHnRQ-000782-VZ
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 07:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHnQd-0006jV-3D
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:45:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHnQb-000434-Qz
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:45:34 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:39090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHnQb-0003xr-Jn
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 07:45:33 -0400
Received: by mail-oi1-x243.google.com with SMTP id d63so8489367oig.6
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h7AYW4qNhD6UwPXEOFLzwPhtx6zcmO/DcGpCytE9TMo=;
 b=lag96W9YsP4Js1jIPnIu32iQKU+hN2kccbrx2G0+Nbb+OLbXf6JMDL/Ujax58n4X5N
 EyLwO4AquERsxZLG3bk3JtqKaRBM2W/DcN31N3UVBAEbGjXpezOeJEjWo0tjeP9iuUYK
 YMxnQ94nrdQH+YxGEYEkVtKtXcDaNmqeyytCMAzaMRedltThBLwZolOLLa/wYjkzYAZi
 53mUetQ03xvI32kjRyhrfhmlOqdaL7D06UBJmckXj50qQAhsYUkK2RllgTLCc6hbCjPc
 Jd5cnBSBHq5ppbizw8VfNnX0in97tV0uiXaYEyrWNbCo4GtZEzYqc8MPC8nEWXV9+3Kw
 3+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h7AYW4qNhD6UwPXEOFLzwPhtx6zcmO/DcGpCytE9TMo=;
 b=ntutpE4aIXt5O37821YgjCHg5DmS5D8SNYoyR63Xe3jAz/nET9WOUKxAEPNKihhQP1
 YMhpIFtcodKRm6gseupiRcOLxg5mph3hN/ozCFu1F8O1fbxLbsjG50ssuUnTzDmGWzch
 rNteKA9nlpOMN9oMgSLkpRUPMBz7R7rTKzOrUUOLJ5poBs6pkJ3eQj0BTNBbuA8NN6Ro
 PEjPRPmkm05HN1+X779YnyKZDsCNKEo9VJKRK6sJj15JLgfGLF56kfKq7fMv+9gSsK1o
 k9F66Qb/e/BZGurHXKkgr2OKVm33R5MLkTzV5GXhdS9q201Wmqbt9uPd5IllniijWN4T
 O3cA==
X-Gm-Message-State: ANhLgQ3T6zuG+ua5a/KD125ZZHJHWsgiLgMyIQK5qu7PKN0mI3gYegWq
 LfFfjtLGSntTzApASiFGn1ovI3XBGofqPeHD2mNSJA==
X-Google-Smtp-Source: ADFU+vsKKroxqeHvJO6p0kdSvv5zjTueqin5T5MVS2WiKPWx8lQ0mf2emOryTF/W2SBesUNoFFiWjW6Uo5FgdQGx5zA=
X-Received: by 2002:a05:6808:8cb:: with SMTP id
 k11mr3387910oij.48.1585309531848; 
 Fri, 27 Mar 2020 04:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200327094945.23768-1-alex.bennee@linaro.org>
 <20200327094945.23768-2-alex.bennee@linaro.org>
In-Reply-To: <20200327094945.23768-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2020 11:45:20 +0000
Message-ID: <CAFEAcA_g+qQMYF699LUf2W-aYxWDNEwED=kdA+Eo2w_anW6A2A@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] elf-ops: bail out if we have no function symbols
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Mar 2020 at 09:50, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> It's perfectly possible to have no function symbols in your elf file
> and if we do the undefined behaviour sanitizer rightly complains about
> us passing NULL to qsort. Check nsyms before we go ahead.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  include/hw/elf_ops.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
> index a1411bfcab6..b5d4074d1e3 100644
> --- a/include/hw/elf_ops.h
> +++ b/include/hw/elf_ops.h
> @@ -170,8 +170,13 @@ static int glue(load_symbols, SZ)(struct elfhdr *ehd=
r, int fd, int must_swab,
>          }
>          i++;
>      }
> -    syms =3D g_realloc(syms, nsyms * sizeof(*syms));
>
> +    /* check we have symbols left */
> +    if (nsyms =3D=3D 0) {
> +        goto fail;
> +    }
> +
> +    syms =3D g_realloc(syms, nsyms * sizeof(*syms));
>      qsort(syms, nsyms, sizeof(*syms), glue(symcmp, SZ));
>      for (i =3D 0; i < nsyms - 1; i++) {
>          if (syms[i].st_size =3D=3D 0) {

If "ELF file has no symbols" is valid, it's a bit odd for
load_symbols to report it as a failure by returning -1.
This only works because load_elf (the only caller) just
ignores the return value entirely. OTOH I suppose you
could argue that we can just ignore any oddity in the
attempt to load symbols (eg bogus/malformad symtab section).
If so, we should probably drop the return value from
load_symbols().

thanks
-- PMM

