Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6871CB0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 18:18:51 +0200 (CEST)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpxV4-0003Fr-QS
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 12:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58963)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hpxUp-0002pM-6V
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 12:18:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hpxUn-0003bm-3W
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 12:18:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34895)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hpxUm-0003aw-Ti
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 12:18:33 -0400
Received: by mail-ot1-x343.google.com with SMTP id j19so6170562otq.2
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57ef9FyPZj4pZKn1kIlgm6lpciulEc6SU3F8a13n8DU=;
 b=S8kUWe2X9kL+UDhC8+QEORagUBoEcs+t/Uj4tjXibKZLL490j7zVC2xl4zdzLCRpAB
 IZjcYgq5dQ5WIcRFCoth00CICvr9iYHyPAKapVW24/EacwdmmZzst8dj5zx5U4EdmOgY
 q92fncE8JB5eUFqpzrSf42Bx3Ji8gHU1/IIp7tCPAJJix7BQjjV1PZYbOnX7mC/vHoGj
 88i122Ph49odLnJfS0zhQWaBEmLXrLfGZThDjQgZiAzXY2uSC2aXFnchLVgeZBkGuRMx
 jX1yiMIUAELC2Uua4cUC4yEBAhpYgPHmjFNDOOOAeEgnya12QIgsb/lqdGH6BNw8PHKq
 BhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57ef9FyPZj4pZKn1kIlgm6lpciulEc6SU3F8a13n8DU=;
 b=aIqAlAUSf0RCo9/vsudTbGn/A0XezQ9RuqOfzQ16Vu1lKS5ZHeeuuxsuhMS8/HSCud
 QaQOvXRf/i99kH1fu6Dky1mCBH0PWU3unLTSfBOSA/qgBEUpfhotpCg7rXT92n8iynKM
 KTx5j/V7kkvlAIt2DEHHH19xUUNIRYni8JirfqiZnhSHUkRX5JNjvoSGO+mUR6QCcCra
 FMD9d0TbKuMWYluFmN5bRSZ07nZFzvr68Nk9TIkMArf08Ky0y9nAPnoJjps5nHhRxGpB
 XljPI1DXPVSvcFTgqmjYrCCH5sgH+f6uG3DweEr9KDvKNurF01p4WvbKCd5oB61aEpcs
 kODw==
X-Gm-Message-State: APjAAAXFXVmUw94q4IqgKNs+DCGT0WK7jXdMvhZyhJ42dgw7CJsBqIa9
 1OI9J52Y/+8p/LdlSKYbppy4s8fpz0FBEexyKyE=
X-Google-Smtp-Source: APXvYqxQe8Tg5FtkLeskblTSOi0wpPAHSnJ2ySqVawR+Jaz/rnZlbguk8dfnbpT5jqgtqRRx9/q8k7bu3B42OKRixQA=
X-Received: by 2002:a9d:6e8a:: with SMTP id a10mr33779260otr.295.1563898712062; 
 Tue, 23 Jul 2019 09:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <945056df7ff54ce6b272dce64721d916@tpw09926dag18e.domain1.systemhost.net>
 <1563766040903.29641@bt.com>
In-Reply-To: <1563766040903.29641@bt.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Tue, 23 Jul 2019 18:18:21 +0200
Message-ID: <CAL1e-=g6ifhKMWJPVNCZvYS7jVT7SxQ8hvZ0nYrE0KX0CvavMw@mail.gmail.com>
To: tony.nguyen@bt.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v2 1/2] configure: Define target access
 alignment in configure
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, jcmvbkbc@gmail.com,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, Tony

On Mon, Jul 22, 2019 at 5:27 AM <tony.nguyen@bt.com> wrote:

> Move the define of target access alignment earlier from
> target/foo/cpu.h to configure.
>
>
It would be better if the commit message explained WHY the change is needed
and HOW it is achieved - not WHAT the change is.

Yours,
Aleksandar


> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  configure             | 10 +++++++++-
>  include/exec/poison.h |  1 +
>  include/qom/cpu.h     |  2 +-
>  target/alpha/cpu.h    |  2 --
>  target/hppa/cpu.h     |  1 -
>  target/mips/cpu.h     |  2 --
>  target/sh4/cpu.h      |  2 --
>  target/sparc/cpu.h    |  2 --
>  target/xtensa/cpu.h   |  2 --
>  tcg/tcg.c             |  2 +-
>  tcg/tcg.h             |  8 +++++---
>  11 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/configure b/configure
> index eb635c3..8316a16 100755
> --- a/configure
> +++ b/configure
> @@ -7424,8 +7424,13 @@ for target in $target_list; do
>  target_dir="$target"
>  config_target_mak=$target_dir/config-target.mak
>  target_name=$(echo $target | cut -d '-' -f 1)
> +target_aligned_only="no"
> +case "$target_name" in
> +
> alpha|hppa|mips64el|mips64|mipsel|mips|mipsn32|mipsn32el|sh4|sh4eb|sparc|sparc64|sparc32plus|xtensa|xtensaeb)
> +  target_aligned_only="yes"
> +  ;;
> +esac
>  target_bigendian="no"
> -
>  case "$target_name" in
>
>  armeb|aarch64_be|hppa|lm32|m68k|microblaze|mips|mipsn32|mips64|moxie|or1k|ppc|ppc64|ppc64abi32|s390x|sh4eb|sparc|sparc64|sparc32plus|xtensaeb)
>    target_bigendian=yes
> @@ -7710,6 +7715,9 @@ fi
>  if supported_whpx_target $target; then
>      echo "CONFIG_WHPX=y" >> $config_target_mak
>  fi
> +if test "$target_aligned_only" = "yes" ; then
> +  echo "TARGET_ALIGNED_ONLY=y" >> $config_target_mak
> +fi
>  if test "$target_bigendian" = "yes" ; then
>    echo "TARGET_WORDS_BIGENDIAN=y" >> $config_target_mak
>  fi
> diff --git a/include/exec/poison.h b/include/exec/poison.h
> index b862320..955eb86 100644
> --- a/include/exec/poison.h
> +++ b/include/exec/poison.h
> @@ -35,6 +35,7 @@
>  #pragma GCC poison TARGET_UNICORE32
>  #pragma GCC poison TARGET_XTENSA
>
> +#pragma GCC poison TARGET_ALIGNED_ONLY
>  #pragma GCC poison TARGET_HAS_BFLT
>  #pragma GCC poison TARGET_NAME
>  #pragma GCC poison TARGET_SUPPORTS_MTTCG
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 5ee0046..9b50b73 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -89,7 +89,7 @@ struct TranslationBlock;
>   * @do_unassigned_access: Callback for unassigned access handling.
>   * (this is deprecated: new targets should use do_transaction_failed
> instead)
>   * @do_unaligned_access: Callback for unaligned access handling, if
> - * the target defines #ALIGNED_ONLY.
> + * the target defines #TARGET_ALIGNED_ONLY.
>   * @do_transaction_failed: Callback for handling failed memory
> transactions
>   * (ie bus faults or external aborts; not MMU faults)
>   * @virtio_is_big_endian: Callback to return %true if a CPU which supports
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index b3e8a82..16eb804 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -23,8 +23,6 @@
>  #include "cpu-qom.h"
>  #include "exec/cpu-defs.h"
>
> -#define ALIGNED_ONLY
> -
>  /* Alpha processors have a weak memory model */
>  #define TCG_GUEST_DEFAULT_MO      (0)
>
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index aab251b..2be67c2 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -30,7 +30,6 @@
>     basis.  It's probably easier to fall back to a strong memory model.  */
>  #define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL
>
> -#define ALIGNED_ONLY
>  #define MMU_KERNEL_IDX   0
>  #define MMU_USER_IDX     3
>  #define MMU_PHYS_IDX     4
> diff --git a/target/mips/cpu.h b/target/mips/cpu.h
> index 21c0615..c13cd4e 100644
> --- a/target/mips/cpu.h
> +++ b/target/mips/cpu.h
> @@ -1,8 +1,6 @@
>  #ifndef MIPS_CPU_H
>  #define MIPS_CPU_H
>
> -#define ALIGNED_ONLY
> -
>  #include "cpu-qom.h"
>  #include "exec/cpu-defs.h"
>  #include "fpu/softfloat.h"
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index aee733e..ecaa7a1 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -23,8 +23,6 @@
>  #include "cpu-qom.h"
>  #include "exec/cpu-defs.h"
>
> -#define ALIGNED_ONLY
> -
>  /* CPU Subtypes */
>  #define SH_CPU_SH7750  (1 << 0)
>  #define SH_CPU_SH7750S (1 << 1)
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index 8ed2250..1406f0b 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -5,8 +5,6 @@
>  #include "cpu-qom.h"
>  #include "exec/cpu-defs.h"
>
> -#define ALIGNED_ONLY
> -
>  #if !defined(TARGET_SPARC64)
>  #define TARGET_DPREGS 16
>  #else
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 2c27713..0459243 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -32,8 +32,6 @@
>  #include "exec/cpu-defs.h"
>  #include "xtensa-isa.h"
>
> -#define ALIGNED_ONLY
> -
>  /* Xtensa processors have a weak memory model */
>  #define TCG_GUEST_DEFAULT_MO      (0)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index be2c33c..8d23fb0 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1926,7 +1926,7 @@ static const char * const ldst_name[] =
>  };
>
>  static const char * const alignment_name[(MO_AMASK >> MO_ASHIFT) + 1] = {
> -#ifdef ALIGNED_ONLY
> +#ifdef TARGET_ALIGNED_ONLY
>      [MO_UNALN >> MO_ASHIFT]    = "un+",
>      [MO_ALIGN >> MO_ASHIFT]    = "",
>  #else
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index b411e17..529acb2 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -333,10 +333,12 @@ typedef enum TCGMemOp {
>      MO_TE    = MO_LE,
>  #endif
>
> -    /* MO_UNALN accesses are never checked for alignment.
> +    /*
> +     * MO_UNALN accesses are never checked for alignment.
>       * MO_ALIGN accesses will result in a call to the CPU's
>       * do_unaligned_access hook if the guest address is not aligned.
> -     * The default depends on whether the target CPU defines ALIGNED_ONLY.
> +     * The default depends on whether the target CPU defines
> +     * TARGET_ALIGNED_ONLY.
>       *
>       * Some architectures (e.g. ARMv8) need the address which is aligned
>       * to a size more than the size of the memory access.
> @@ -353,7 +355,7 @@ typedef enum TCGMemOp {
>       */
>      MO_ASHIFT = 4,
>      MO_AMASK = 7 << MO_ASHIFT,
> -#ifdef ALIGNED_ONLY
> +#ifdef TARGET_ALIGNED_ONLY
>      MO_ALIGN = 0,
>      MO_UNALN = MO_AMASK,
>  #else
> --
> 1.8.3.1
>
>
