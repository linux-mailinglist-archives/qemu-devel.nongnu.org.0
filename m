Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F4937CA41
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:53:49 +0200 (CEST)
Received: from localhost ([::1]:44312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgs7I-0005c2-Ts
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgs4t-0003uC-W5
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:51:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgs4n-00088N-3u
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:51:15 -0400
Received: by mail-wr1-x434.google.com with SMTP id v12so24300220wrq.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8Gd6VlzfMx9JIrx5W8WKW8DiF/IPUdvaBFDZSHdY2R4=;
 b=AmVnu72WMrAoOvXp2RL8bpjGICFPrJuDDC3wRztzdmsJxRgROxLsBIUWHXRycAtx9/
 ic3DlY+HqHnqOJ4YWU5V3AwgLXvIK5vTHhbJQ33beMsPbcCZFSoyV6IaKFpsjngkpZOA
 LflPbNlZAxgHzHwjLJJkKin1ZpD1E/Hx02fMpr39/vFKkYoZm2dNOwk0AJ5E+kNwJL3U
 hVXXCqm1iHqnep5l/554EBDVFtKmyRaTK1l4jlJpUS5cgIw1b0EHH/6TtR/ZWlCvOuLx
 sPQ2k8WCULNlLtY+mM9fcJNevAa7XgSvWyIAvkre+2THR/aI96HsZaKwYWaJpHY/+QGE
 C6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8Gd6VlzfMx9JIrx5W8WKW8DiF/IPUdvaBFDZSHdY2R4=;
 b=dIyiJ7Dwi8OgERjVnU9YkGh7JYMnEvD8gUM8NVIbKmbSLfzHmqA1lX/H2OvgTEkuJJ
 s9dwP1TpfZQxWvD3BWIyX/D2Mkk87vpe3rHSScpUSPpKmmz4EMpDPBJVlGyiSarTaCi7
 F/+mcU0P7byLSo5v6Ynw2gUnKGXcXwu8IgM+Gk5oK+SUsWNS9t92vYwhRj1yHKuolWk8
 oDlvMhXP9wVNNyh2mm9NnGf2NgLvLzm5FNVNDVcyOUiPrm9BWOnoNCJ8658WSHZ+qnXH
 eW6cR/vkGnPx3glOdUtURr333u2mHugdTmtltqVCwrUql5DCn6K2pVb4WpkExTfXNPk4
 4vpQ==
X-Gm-Message-State: AOAM532gZnyopGsbgp/hWb6QSWZXW/IeufrSAUxSfcTEfCnLvpTRupxR
 D+CsH7dQFNJHXN1uPKd+mLQvUg==
X-Google-Smtp-Source: ABdhPJyWJN1VxGx3wrBA5FZBK7xntjP8NHScpJGUGlaImudQRrl6PlArZgKRJ9Kotvs64g25WPQFSA==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr47933811wrt.14.1620838271244; 
 Wed, 12 May 2021 09:51:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm7465452wmq.45.2021.05.12.09.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 09:51:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 591AC1FF7E;
 Wed, 12 May 2021 17:51:09 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/72] Convert floatx80 and float128 to FloatParts
Date: Wed, 12 May 2021 17:47:17 +0100
In-reply-to: <20210508014802.892561-1-richard.henderson@linaro.org>
Message-ID: <87bl9fgaki.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reorg everything using QEMU_GENERIC and multiple inclusion to
> reduce the amount of code duplication between the formats.
>
> The use of QEMU_GENERIC means that we need to use pointers instead
> of structures, which means that even the smaller float formats
> need rearranging.

I did a basic some basic benchmarks which show no issues (although I
suspect hardfloat is hiding any true cost of the softfloat itself):

#+name: run-float-benchmarks
#+begin_src shell :results output :async
  ./fp-bench add -p single
  ./fp-bench add -p double
  ./fp-bench mul -p single
  ./fp-bench mul -p double
  ./fp-bench muladd -p single
  ./fp-bench muladd -p double
#+end_src

#+RESULTS: run-float-benchmarks-after
: 374.77 MFlops
: 287.58 MFlops
: 371.55 MFlops
: 281.48 MFlops
: 370.76 MFlops
: 287.39 MFlops

#+RESULTS: run-float-benchmarks-before
: 362.40 MFlops
: 278.65 MFlops
: 360.68 MFlops
: 280.92 MFlops
: 360.75 MFlops
: 280.76 MFlops

I guess what would be really telling is if a ext80 benchmark exhibited
any slowdown.

>
> I've carried it through to completion within fpu/, so that we don't
> have (much) of the legacy code remaining.  There is some floatx80
> stuff in target/m68k and target/i386 that's still hanging around.
>
>
> r~
>
>
> Alex Benn=C3=A9e (1):
>   tests/fp: add quad support to the benchmark utility
>
> Richard Henderson (71):
>   qemu/host-utils: Use __builtin_bitreverseN
>   qemu/host-utils: Add wrappers for overflow builtins
>   qemu/host-utils: Add wrappers for carry builtins
>   accel/tcg: Use add/sub overflow routines in tcg-runtime-gvec.c
>   softfloat: Move the binary point to the msb
>   softfloat: Inline float_raise
>   softfloat: Use float_raise in more places
>   softfloat: Tidy a * b + inf return
>   softfloat: Add float_cmask and constants
>   softfloat: Use return_nan in float_to_float
>   softfloat: fix return_nan vs default_nan_mode
>   target/mips: Set set_default_nan_mode with set_snan_bit_is_one
>   softfloat: Do not produce a default_nan from parts_silence_nan
>   softfloat: Rename FloatParts to FloatParts64
>   softfloat: Move type-specific pack/unpack routines
>   softfloat: Use pointers with parts_default_nan
>   softfloat: Use pointers with unpack_raw
>   softfloat: Use pointers with ftype_unpack_raw
>   softfloat: Use pointers with pack_raw
>   softfloat: Use pointers with ftype_pack_raw
>   softfloat: Use pointers with ftype_unpack_canonical
>   softfloat: Use pointers with ftype_round_pack_canonical
>   softfloat: Use pointers with parts_silence_nan
>   softfloat: Rearrange FloatParts64
>   softfloat: Convert float128_silence_nan to parts
>   softfloat: Convert float128_default_nan to parts
>   softfloat: Move return_nan to softfloat-parts.c.inc
>   softfloat: Move pick_nan to softfloat-parts.c.inc
>   softfloat: Move pick_nan_muladd to softfloat-parts.c.inc
>   softfloat: Move sf_canonicalize to softfloat-parts.c.inc
>   softfloat: Move round_canonical to softfloat-parts.c.inc
>   softfloat: Use uadd64_carry, usub64_borrow in softfloat-macros.h
>   softfloat: Move addsub_floats to softfloat-parts.c.inc
>   softfloat: Implement float128_add/sub via parts
>   softfloat: Move mul_floats to softfloat-parts.c.inc
>   softfloat: Move muladd_floats to softfloat-parts.c.inc
>   softfloat: Use mulu64 for mul64To128
>   softfloat: Use add192 in mul128To256
>   softfloat: Tidy mul128By64To192
>   softfloat: Introduce sh[lr]_double primitives
>   softfloat: Move div_floats to softfloat-parts.c.inc
>   softfloat: Split float_to_float
>   softfloat: Convert float-to-float conversions with float128
>   softfloat: Move round_to_int to softfloat-parts.c.inc
>   softfloat: Move rount_to_int_and_pack to softfloat-parts.c.inc
>   softfloat: Move rount_to_uint_and_pack to softfloat-parts.c.inc
>   softfloat: Move int_to_float to softfloat-parts.c.inc
>   softfloat: Move uint_to_float to softfloat-parts.c.inc
>   softfloat: Move minmax_flags to softfloat-parts.c.inc
>   softfloat: Move compare_floats to softfloat-parts.c.inc
>   softfloat: Move scalbn_decomposed to softfloat-parts.c.inc
>   softfloat: Move sqrt_float to softfloat-parts.c.inc
>   softfloat: Split out parts_uncanon_normal
>   softfloat: Reduce FloatFmt
>   softfloat: Introduce Floatx80RoundPrec
>   softfloat: Adjust parts_uncanon_normal for floatx80
>   tests/fp/fp-test: Reverse order of floatx80 precision tests
>   softfloat: Convert floatx80_add/sub to FloatParts
>   softfloat: Convert floatx80_mul to FloatParts
>   softfloat: Convert floatx80_div to FloatParts
>   softfloat: Convert floatx80_sqrt to FloatParts
>   softfloat: Convert floatx80_round to FloatParts
>   softfloat: Convert floatx80_round_to_int to FloatParts
>   softfloat: Convert integer to floatx80 to FloatParts
>   softfloat: Convert floatx80 float conversions to FloatParts
>   softfloat: Convert floatx80 to integer to FloatParts
>   softfloat: Convert floatx80_scalbn to FloatParts
>   softfloat: Convert floatx80 compare to FloatParts
>   softfloat: Convert float32_exp2 to FloatParts
>   softfloat: Move floatN_log2 to softfloat-parts.c.inc
>   softfloat: Convert modrem operations to FloatParts
>
>  include/fpu/softfloat-helpers.h  |    5 +-
>  include/fpu/softfloat-macros.h   |  247 +-
>  include/fpu/softfloat-types.h    |   10 +-
>  include/fpu/softfloat.h          |   11 +-
>  include/qemu/host-utils.h        |  291 ++
>  target/mips/fpu_helper.h         |   10 +-
>  accel/tcg/tcg-runtime-gvec.c     |   36 +-
>  fpu/softfloat.c                  | 7760 ++++++++++--------------------
>  linux-user/arm/nwfpe/fpa11.c     |   41 +-
>  target/i386/tcg/fpu_helper.c     |   79 +-
>  target/m68k/fpu_helper.c         |   50 +-
>  target/m68k/softfloat.c          |   90 +-
>  tests/fp/fp-bench.c              |   88 +-
>  tests/fp/fp-test-log2.c          |  118 +
>  tests/fp/fp-test.c               |   11 +-
>  fpu/softfloat-parts-addsub.c.inc |   62 +
>  fpu/softfloat-parts.c.inc        | 1480 ++++++
>  fpu/softfloat-specialize.c.inc   |  424 +-
>  tests/fp/wrap.c.inc              |   12 +
>  tests/fp/meson.build             |   11 +
>  20 files changed, 4886 insertions(+), 5950 deletions(-)
>  create mode 100644 tests/fp/fp-test-log2.c
>  create mode 100644 fpu/softfloat-parts-addsub.c.inc
>  create mode 100644 fpu/softfloat-parts.c.inc


--=20
Alex Benn=C3=A9e

