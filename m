Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB188791
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 03:56:03 +0200 (CEST)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwGbz-0001ar-4h
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 21:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48877)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwGbU-000190-9R
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 21:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwGbT-0002Vd-7g
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 21:55:32 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:37440)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwGbT-0002VH-0K; Fri, 09 Aug 2019 21:55:31 -0400
Received: by mail-lj1-x243.google.com with SMTP id z28so39464471ljn.4;
 Fri, 09 Aug 2019 18:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dTTSTn93r8pdh3TbJRxXc/6d1wGwv9Pp87/9fjZQd+o=;
 b=FKsQ9zDKMzJMVmaSeMdeOoD90a0jmUGO5GKObsv0o1tD+PVSe1nvr9YIxMX2J9kXIS
 tjb0iQ9mM1r9cGYdUkEuijYZJnLZWaIRZgBiV1Q5bfSZ8H/ZkhYB+t4vcTJW8BLUtV0w
 qgAz08QFonMpYUXn90f4Pst9k9x402k2yidEX71gVP14NW+K0yazITZaLoYuxMWo9LIv
 YW+I5PAoCv/zDtFdV+dfTKHlf0aCu8RwouV0z2feqKpdeBaOqZ3xIrCEfm4XoXGKvVWj
 52NccA4AXN2otGqv1LdgkZLypNZ1rE+ZzDwrQrqMeDOFQik3f8CtyPh8UZmWJLeQ1Tb5
 +DHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dTTSTn93r8pdh3TbJRxXc/6d1wGwv9Pp87/9fjZQd+o=;
 b=gXeZId6S9H4m2w7NkkBsNhO9k1s38tfAEK4vTB/OQrEXXhYIQxLPpHgG4ksCq+2WkO
 eO6olMyrhFOskd/neBjsfMdvEvChOuDjdI1ZvPDPGclOIB5H1leVXQjeOK/D9Dbtt0Y1
 pWupIOLobTgRdTeNYAA8je17e2kW8ZtRD7P8H2PuwSQRI8YIt7ZNzE3zoC55HiJU9fl6
 ZOoR6JAmVLZMw9oqvDeHWHKpqC8/Ml1BbG24x27eNRebew7U77dij0i276J8gAkm6WkV
 aX5SNpYBd2AjUbT6M4DM+9DsDvYToSK68O5PF+P87wXRDw1a/5NTFTztNRnHuxEmhKKg
 +T3g==
X-Gm-Message-State: APjAAAX4UN85WlYbWWCYV3JPAtD37XO+8hogBMbCtJHujL9tuNtNICRT
 AyBEl73BhnudDh8bsMUr1IWQSYguInUnqntAfCc=
X-Google-Smtp-Source: APXvYqwVTzm6vmrMarIWPyY+QjW2s9JwvazROSRl6LMBlaoekJwY/jKy0bhniyGuAiZDkZPP7sP+6K/ChA6fuBmBwEA=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr12899275lja.85.1565402129903; 
 Fri, 09 Aug 2019 18:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190808164117.23348-1-alex.bennee@linaro.org>
 <20190808164117.23348-7-alex.bennee@linaro.org>
In-Reply-To: <20190808164117.23348-7-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Aug 2019 18:55:03 -0700
Message-ID: <CAKmqyKNfhp1PWuxof1wCeVt6PAhqOgABQwYBtMQL8i_pDua4oA@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-devel] [PATCH v1 6/7] target/riscv: rationalise softfloat
 includes
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 8, 2019 at 9:43 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> We should avoid including the whole of softfloat headers in cpu.h and
> explicitly include it only where we will be calling softfloat
> functions. We can use the -types.h and -helpers.h in cpu.h for the few
> bits that are global.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu.h        | 2 +-
>  target/riscv/fpu_helper.c | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f8d07bd20ad..6d52f97d7c3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -27,6 +27,7 @@
>  #include "qemu/error-report.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
> +#include "fpu/softfloat-helpers.h"
>
>  /* RISC-V CPU definitions */
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0adb307f329..240b31e2ebb 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -22,7 +22,7 @@
>
>  #include "qom/cpu.h"
>  #include "exec/cpu-defs.h"
> -#include "fpu/softfloat.h"
> +#include "fpu/softfloat-types.h"
>
>  #define TCG_GUEST_DEFAULT_MO 0
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index b4f818a6465..0b79562a690 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -21,6 +21,7 @@
>  #include "qemu/host-utils.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
> +#include "fpu/softfloat.h"
>
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env)
>  {
> --
> 2.20.1
>
>

