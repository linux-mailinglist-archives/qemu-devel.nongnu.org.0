Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA31804E1
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Mar 2020 18:34:00 +0100 (CET)
Received: from localhost ([::1]:37676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBilU-0004zf-2d
	for lists+qemu-devel@lfdr.de; Tue, 10 Mar 2020 13:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jBikS-0004Ej-8a
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:32:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jBikR-0004c0-3x
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:32:56 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:43905)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jBikQ-0004ZA-W8
 for qemu-devel@nongnu.org; Tue, 10 Mar 2020 13:32:55 -0400
Received: by mail-ua1-x943.google.com with SMTP id o42so4959938uad.10
 for <qemu-devel@nongnu.org>; Tue, 10 Mar 2020 10:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vmmu+IIqYeJxi7AEE0yVRXPb7NqNtPSRejIaED5d620=;
 b=Ryj++ExKrXHPP2o6+OpgPGP7xgdXBPcruD2EdU5lm7Uh5ig3RzF8ZS2qP9826HzHAN
 b6SS6mbITZym+NjqWopf3MAbBFP/31sQx77Wi8vDgUkrfm3Kvx99ualf4MPB4R02g5Ms
 CYs+re0XWr/wPvzix+YhhfOKnGg2aLSAtFwcakSWYzyPm/tIq87Juyyq32GNh5TfdAdY
 tIyVLb3sIEPVkRe/H7ZfRDDU22I2tf7JlYZfrQNEdgiGTUzk738aMKurWa7nkaQGNISX
 jAxVbY9lFFTQvWESCXzrKI53+rcTe+imTndIfB/EYyKNsYmQvEs9OcBmWRnG++B2SvN/
 2g/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmmu+IIqYeJxi7AEE0yVRXPb7NqNtPSRejIaED5d620=;
 b=i1/m2W1LQ1ASiY46RaYTsfVN7Y4B7IJb6HHBNA6oEDfYHyvnpzOqtEfmpprWMgAvkX
 Cxg3GHtwahdGyTTZQDuUEr66jq396Ry6p7udL4LbYy4PKUj2s60dpPwX2gazbVA+wglH
 fqqGYBeCJPpx6p++i0TvxRE7mCkTcKI0cR2Nl1ijecTHSwvkLY8gBzkpb2HmDr+pcElN
 JA7UzpSo8HyhIFSBGdzL48LnY1tdTY+TA1RuNiJVrgG59efI+OdCMSvn9LHInKguE6xp
 YHY4+ZkWVC7juYt+iAzlP/fsgR+svN2Gk/8VnJhZQ3lt9hfiB5GbuubXu3/rzmRrN1Nw
 nrWA==
X-Gm-Message-State: ANhLgQ0jZoZP+lBz5B7cf5rb3Vm+AKMS3HHZ0XzzX/FS6Do05MyXNI37
 XFEPrt5yLmFPg54/kcMVpO8JtlAM6E/+GCp+w10=
X-Google-Smtp-Source: ADFU+vviE6K+ESyC+dgc5XkyrLrIWreMslRuZ/a0yMjVQo4w7L9GNd7F4jlOKVVIva6I7sNZswToJctyaI6wsT75kFc=
X-Received: by 2002:ab0:630b:: with SMTP id a11mr9127713uap.133.1583861573332; 
 Tue, 10 Mar 2020 10:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200310110759.3331020-1-laurent@vivier.eu>
 <20200310110759.3331020-2-laurent@vivier.eu>
In-Reply-To: <20200310110759.3331020-2-laurent@vivier.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 Mar 2020 10:25:05 -0700
Message-ID: <CAKmqyKPb6t_dkwxxaPWr927ccVKxTiTzUu-fNfbU13CC+4FEcQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts: add a script to generate syscall_nr.h
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::943
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
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Jia Liu <proljc@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 10, 2020 at 4:08 AM Laurent Vivier <laurent@vivier.eu> wrote:
>
> This script is needed for targets based on asm-generic syscall numbers generation
>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  scripts/gensyscalls.sh | 94 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100755 scripts/gensyscalls.sh
>
> diff --git a/scripts/gensyscalls.sh b/scripts/gensyscalls.sh
> new file mode 100755
> index 000000000000..3b549a665d0f
> --- /dev/null
> +++ b/scripts/gensyscalls.sh
> @@ -0,0 +1,94 @@
> +#!/bin/sh
> +
> +linux="$1"
> +output="$2"
> +
> +TMP=$(mktemp -d)
> +
> +if [ "$linux" = "" ] ; then
> +    echo "Needs path to linux source tree" 1>&2
> +    exit 1
> +fi
> +
> +if [ "$output" = "" ] ; then
> +    output="$PWD"
> +fi
> +
> +upper()
> +{
> +    echo "$1" | tr "[:lower:]" "[:upper:]" | tr "[:punct:]" "_"
> +}
> +
> +qemu_arch()
> +{
> +    case "$1" in
> +    arm64)
> +        echo "aarch64"
> +        ;;
> +    *)
> +        upper "$1"
> +        ;;
> +    esac
> +}
> +
> +read_includes()
> +{
> +    arch=$1
> +    bits=$2
> +
> +     cpp -P -nostdinc -fdirectives-only \
> +        -D_UAPI_ASM_$(upper ${arch})_BITSPERLONG_H \
> +        -D__BITS_PER_LONG=${bits} \
> +        -I${linux}/arch/${arch}/include/uapi/ \
> +        -I${linux}/include/uapi \
> +        -I${TMP} \
> +        "${linux}/arch/${arch}/include/uapi/asm/unistd.h"
> +}
> +
> +filter_defines()
> +{
> +    grep -e "#define __NR_" -e "#define __NR3264"
> +}
> +
> +rename_defines()
> +{
> +    sed "s/ __NR_/ TARGET_NR_/g;s/(__NR_/(TARGET_NR_/g"
> +}
> +
> +evaluate_values()
> +{
> +    sed "s/#define TARGET_NR_/QEMU TARGET_NR_/" | \
> +    cpp -P -nostdinc | \
> +    sed "s/^QEMU /#define /"
> +}
> +
> +generate_syscall_nr()
> +{
> +    arch=$1
> +    bits=$2
> +    file="$3"
> +    guard="$(upper LINUX_USER_$(qemu_arch $arch)_$(basename "$file"))"
> +
> +    (echo "/*"
> +    echo " * This file contains the system call numbers."
> +    echo " */"
> +    echo "#ifndef ${guard}"
> +    echo "#define ${guard}"
> +    echo
> +    read_includes $arch $bits | filter_defines | rename_defines | \
> +                                evaluate_values | sort -n -k 3
> +    echo
> +    echo "#endif /* ${guard} */"
> +    echo) > "$file"
> +}
> +
> +mkdir "$TMP/asm"
> +> "$TMP/asm/bitsperlong.h"
> +
> +generate_syscall_nr arm64 64 "$output/linux-user/aarch64/syscall_nr.h"
> +generate_syscall_nr nios2 32 "$output/linux-user/nios2/syscall_nr.h"
> +generate_syscall_nr openrisc 32 "$output/linux-user/openrisc/syscall_nr.h"
> +
> +generate_syscall_nr riscv 32 "$output/linux-user/riscv/syscall32_nr.h"
> +generate_syscall_nr riscv 64 "$output/linux-user/riscv/syscall64_nr.h"
> +rm -fr "$TMP"
> --
> 2.24.1
>
>

