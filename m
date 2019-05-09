Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45EC18F9E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 19:51:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOnCf-0001d8-1b
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 13:51:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hOnBZ-0001Fx-Gq
	for qemu-devel@nongnu.org; Thu, 09 May 2019 13:50:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hOnBY-0004mL-4L
	for qemu-devel@nongnu.org; Thu, 09 May 2019 13:50:25 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:39109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hOnBX-0004lt-Sx
	for qemu-devel@nongnu.org; Thu, 09 May 2019 13:50:24 -0400
Received: by mail-lf1-x141.google.com with SMTP id f1so2187624lfl.6
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 10:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ywqW2S+Cq/1Vd9U8GqsrLA/Px73U9g7w9nGwiLXRCYY=;
	b=mknmuTS8FHx7572vL5ZpA+3hGNfUyT42h3prZeLnMFSotARIXX4Fd6oQjxaDhJBKZG
	AUQ56SxsDUU8WdGAxnbWO1oywmuaDSKYMtvioFBIkL7SMk4e54k3eCVPasQhZbEgT+14
	3SVDYLPO0JkNS9WvkmfIHmiMAEg0VL2P6SDyFZxGR0tLBcJWV38H7AKBivaWXaAM0Ch3
	pkhkJAGqSzE6G6SIzN5fEpMG6hhAXeNxUr0/ODuHchpLghI+MXnIZHhmyOE03C1jruFx
	txgbgLneLwoSPSOD9Whu3q4ZVnfvKIqJf517cX/Jcs1W3s8M0zEkXDh0ILKZLB6J0XMX
	6pFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ywqW2S+Cq/1Vd9U8GqsrLA/Px73U9g7w9nGwiLXRCYY=;
	b=QuMmAXAr6qH732MCne3Oypvwe5Bn8tLvChueV2ZXoBS90CltIehVWNHv/TpyFj0GdN
	TpxqbNdizayD/o+ikwLF5vnSRjuvK1kgFAiQjG/rQnJd0FD3hP/BSxkLt5d9RqJTpaPD
	8wpXAOwcb7c/o/fO/GkjSgVnPofzNP+1oEN9yGIFN1nopFYvwJ880dbmySv1nfgpseND
	MV7LC5AXrGGR46RGtvq1uE/jkRK5uW8CoTshR9jPFl311r+dhgADG9Tse86drWRE6Ia+
	R2wSpZNl7Ciu/CW7U1fA2s02qhT8qpsbdPmFaqO+L4HnDanaYZACUCD1/sFKg6vs8UyT
	BdDg==
X-Gm-Message-State: APjAAAXkLb8hqaoMAGADaXTtLR5PkAhZbsasi2m/u7O6baUzltviniyq
	s2jItHywfWUANBRwBRv0EZ2wrY1Pmq/GzKDOVmg=
X-Google-Smtp-Source: APXvYqydRltj/AqjiTsBpsY8QTlZ2bm9sQSuNzYtgN2JkvINpY5HYMEejzhVsRwVtsBvIMj0d7bGR2xxy3Mj7Sir9is=
X-Received: by 2002:a05:6512:309:: with SMTP id
	t9mr3185794lfp.103.1557424222151; 
	Thu, 09 May 2019 10:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190508000641.19090-1-richard.henderson@linaro.org>
	<20190508000641.19090-2-richard.henderson@linaro.org>
In-Reply-To: <20190508000641.19090-2-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 9 May 2019 10:48:15 -0700
Message-ID: <CAKmqyKMYak+1Fz7t46mzv7XvNJZqJ9FBAYQ9uaa918+AewaPyQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-devel] [PATCH v3 01/39] tcg: Fold CPUTLBWindow into
 CPUTLBDesc
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 7, 2019 at 5:10 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/exec/cpu-defs.h | 17 ++++-------------
>  accel/tcg/cputlb.c      | 24 ++++++++++++------------
>  2 files changed, 16 insertions(+), 25 deletions(-)
>
> diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
> index 8f2a848bf5..52d150aaf1 100644
> --- a/include/exec/cpu-defs.h
> +++ b/include/exec/cpu-defs.h
> @@ -127,18 +127,6 @@ typedef struct CPUIOTLBEntry {
>      MemTxAttrs attrs;
>  } CPUIOTLBEntry;
>
> -/**
> - * struct CPUTLBWindow
> - * @begin_ns: host time (in ns) at the beginning of the time window
> - * @max_entries: maximum number of entries observed in the window
> - *
> - * See also: tlb_mmu_resize_locked()
> - */
> -typedef struct CPUTLBWindow {
> -    int64_t begin_ns;
> -    size_t max_entries;
> -} CPUTLBWindow;
> -
>  typedef struct CPUTLBDesc {
>      /*
>       * Describe a region covering all of the large pages allocated
> @@ -148,9 +136,12 @@ typedef struct CPUTLBDesc {
>       */
>      target_ulong large_page_addr;
>      target_ulong large_page_mask;
> +    /* host time (in ns) at the beginning of the time window */
> +    int64_t window_begin_ns;
> +    /* maximum number of entries observed in the window */
> +    size_t window_max_entries;
>      /* The next index to use in the tlb victim table.  */
>      size_t vindex;
> -    CPUTLBWindow window;
>      size_t n_used_entries;
>  } CPUTLBDesc;
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index f2f618217d..6c7593235c 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -79,11 +79,11 @@ static inline size_t sizeof_tlb(CPUArchState *env, ui=
ntptr_t mmu_idx)
>      return env->tlb_mask[mmu_idx] + (1 << CPU_TLB_ENTRY_BITS);
>  }
>
> -static void tlb_window_reset(CPUTLBWindow *window, int64_t ns,
> +static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
>                               size_t max_entries)
>  {
> -    window->begin_ns =3D ns;
> -    window->max_entries =3D max_entries;
> +    desc->window_begin_ns =3D ns;
> +    desc->window_max_entries =3D max_entries;
>  }
>
>  static void tlb_dyn_init(CPUArchState *env)
> @@ -94,7 +94,7 @@ static void tlb_dyn_init(CPUArchState *env)
>          CPUTLBDesc *desc =3D &env->tlb_d[i];
>          size_t n_entries =3D 1 << CPU_TLB_DYN_DEFAULT_BITS;
>
> -        tlb_window_reset(&desc->window, get_clock_realtime(), 0);
> +        tlb_window_reset(desc, get_clock_realtime(), 0);
>          desc->n_used_entries =3D 0;
>          env->tlb_mask[i] =3D (n_entries - 1) << CPU_TLB_ENTRY_BITS;
>          env->tlb_table[i] =3D g_new(CPUTLBEntry, n_entries);
> @@ -151,18 +151,18 @@ static void tlb_mmu_resize_locked(CPUArchState *env=
, int mmu_idx)
>      int64_t now =3D get_clock_realtime();
>      int64_t window_len_ms =3D 100;
>      int64_t window_len_ns =3D window_len_ms * 1000 * 1000;
> -    bool window_expired =3D now > desc->window.begin_ns + window_len_ns;
> +    bool window_expired =3D now > desc->window_begin_ns + window_len_ns;
>
> -    if (desc->n_used_entries > desc->window.max_entries) {
> -        desc->window.max_entries =3D desc->n_used_entries;
> +    if (desc->n_used_entries > desc->window_max_entries) {
> +        desc->window_max_entries =3D desc->n_used_entries;
>      }
> -    rate =3D desc->window.max_entries * 100 / old_size;
> +    rate =3D desc->window_max_entries * 100 / old_size;
>
>      if (rate > 70) {
>          new_size =3D MIN(old_size << 1, 1 << CPU_TLB_DYN_MAX_BITS);
>      } else if (rate < 30 && window_expired) {
> -        size_t ceil =3D pow2ceil(desc->window.max_entries);
> -        size_t expected_rate =3D desc->window.max_entries * 100 / ceil;
> +        size_t ceil =3D pow2ceil(desc->window_max_entries);
> +        size_t expected_rate =3D desc->window_max_entries * 100 / ceil;
>
>          /*
>           * Avoid undersizing when the max number of entries seen is just=
 below
> @@ -182,7 +182,7 @@ static void tlb_mmu_resize_locked(CPUArchState *env, =
int mmu_idx)
>
>      if (new_size =3D=3D old_size) {
>          if (window_expired) {
> -            tlb_window_reset(&desc->window, now, desc->n_used_entries);
> +            tlb_window_reset(desc, now, desc->n_used_entries);
>          }
>          return;
>      }
> @@ -190,7 +190,7 @@ static void tlb_mmu_resize_locked(CPUArchState *env, =
int mmu_idx)
>      g_free(env->tlb_table[mmu_idx]);
>      g_free(env->iotlb[mmu_idx]);
>
> -    tlb_window_reset(&desc->window, now, 0);
> +    tlb_window_reset(desc, now, 0);
>      /* desc->n_used_entries is cleared by the caller */
>      env->tlb_mask[mmu_idx] =3D (new_size - 1) << CPU_TLB_ENTRY_BITS;
>      env->tlb_table[mmu_idx] =3D g_try_new(CPUTLBEntry, new_size);
> --
> 2.17.1
>
>

