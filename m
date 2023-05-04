Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE666F70F3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:34:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puco3-0006ki-4f; Thu, 04 May 2023 13:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pucaR-0003Xx-9m
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:17:47 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pucaM-0002pI-VE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 13:17:47 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so1530993a12.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 10:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683220660; x=1685812660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Erwkmn1QWtJmCFitJ+opzK7v1RucZrsKO1MzaSjGX2s=;
 b=uIVcIz2eYILTkfhEygnb2LFFUzND6Ko8zMJjkdjf8p7yrJgopLVi2IZIYMG6RnqvCL
 /EecPduq4zjGqLVDv7FsQjo4KVlAwdo281mPzz+E4JbEw+S6igGECLaPD3nGLNtR2yMg
 rjmlRkAJtO2djoPJK3Vpyv0mB9h4Pz4E9bLIyAmDcTFyN82fj17JLDvnW3MvkwORE4qH
 mWRhvxKjxmbQ8VtfqAzg2KzMIeMdwyeMv2Lv4mOgkvMvA2Qi02CtxJsJBcKmuXqfgqBC
 RRm4OFv7Tpk4P295GUkQAuktGPhmOlJz/gpTlDYOtBD7jK5Y2H9TfX6pLT6hUbBt3fHX
 FKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683220660; x=1685812660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Erwkmn1QWtJmCFitJ+opzK7v1RucZrsKO1MzaSjGX2s=;
 b=YEAGzKAhes/NwL8hDYJzeNIEotcVgxMIVbH2of/Euy++lhDtr4SSRcqQbPgwdKkD0C
 58r9wG9+fDUkdCBe8bXBn+Om093+jJ+NIpeTOpyGu4nJN9k9HXUIzvDVFJLRZ7OUm7Uo
 IfNsMjq6EE9eUU7ZpJ7p7dhYujYSfZAz8wZBwl7QcZsioBxd+wNPGv2hOFK9GlPAakhi
 EEj80CkicaJZrRctgYhxkXfQn2ojwHyTDarEPX9Et8vbSO4iJos9nqGkAZ2mWqX1WeBe
 miKf4g9kpeBPNzTMxOWweF6BjH5pbBgyw9tV7LxhNP5v4kKo7t0kNXinBh+sMDlg/tVP
 0fHA==
X-Gm-Message-State: AC+VfDwx9imu2Kn5Hk0NmZZDAUXfLRLRInqG2adrNTPc0pYya75VtTR9
 D9wf+avk3qOhVcbPXIey2DsmAJSZNfPdEh35Xe6dvQ==
X-Google-Smtp-Source: ACHHUZ4PYLD5Zp8P1GGVois+ol+CtZncpTj0iseOci6f+fQJLJG+RDQQLrqnaCfPwJNStwP4RUC1AqpSxBK3w4z11Kk=
X-Received: by 2002:a05:6402:31e6:b0:506:bb0e:bc4e with SMTP id
 dy6-20020a05640231e600b00506bb0ebc4emr2471187edb.39.1683220660185; Thu, 04
 May 2023 10:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 18:17:29 +0100
Message-ID: <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Create ldst_atomicity.c.inc.
>
> Not required for user-only code loads, because we've ensured that
> the page is read-only before beginning to translate code.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---



> +/**
> + * required_atomicity:
> + *
> + * Return the lg2 bytes of atomicity required by @memop for @p.
> + * If the operation must be split into two operations to be
> + * examined separately for atomicity, return -lg2.
> + */
> +static int required_atomicity(CPUArchState *env, uintptr_t p, MemOp memo=
p)
> +{
> +    int atmax =3D memop & MO_ATMAX_MASK;
> +    int size =3D memop & MO_SIZE;
> +    unsigned tmp;
> +
> +    if (atmax =3D=3D MO_ATMAX_SIZE) {
> +        atmax =3D size;
> +    } else {
> +        atmax >>=3D MO_ATMAX_SHIFT;
> +    }
> +
> +    switch (memop & MO_ATOM_MASK) {
> +    case MO_ATOM_IFALIGN:
> +        tmp =3D (1 << atmax) - 1;
> +        if (p & tmp) {
> +            return MO_8;
> +        }
> +        break;
> +    case MO_ATOM_NONE:
> +        return MO_8;
> +    case MO_ATOM_SUBALIGN:
> +        tmp =3D p & -p;
> +        if (tmp !=3D 0 && tmp < atmax) {
> +            atmax =3D tmp;
> +        }
> +        break;

I don't understand the bit manipulation going on here.
AIUI what we're trying to do is say "if e.g. p is only
2-aligned then we only get 2-alignment". But, suppose
p =3D=3D 0x1002. Then (p & -p) is 0x2. But that's MO_32,
not MO_16. Am I missing something ?

(Also, it would be nice to have a comment mentioning
what (p & -p) does, so readers don't have to try to
search for a not very-searchable expression to find out.)

> +    case MO_ATOM_WITHIN16:
> +        tmp =3D p & 15;
> +        if (tmp + (1 << size) <=3D 16) {
> +            atmax =3D size;

OK, so this is "whole operation is within 16 bytes,
whole operation must be atomic"...

> +        } else if (atmax =3D=3D size) {
> +            return MO_8;

...but I don't understand the interaction of WITHIN16
and also specifying an ATMAX value that's not ATMAX_SIZE.

> +        } else if (tmp + (1 << atmax) !=3D 16) {

Why is this doing an exact inequality check?
What if you're asking for a load of 8 bytes at
MO_ATMAX_2 from a pointer that's at an offset of
10 bytes from a 16-byte boundary? Then tmp is 10,
tmp + (1 << atmax) is 12, but we could still do the
loads at atomicity 2. This doesn't seem to me to be
any different from the case it does catch where
the first ATMAX_2-sized unit happens to be the only
thing in this 16-byte block.

The doc comment in patch 1 could probably be beefed
up to better explain the interaction of WITHIN16
and ATMAX_*.

> +            /*
> +             * Paired load/store, where the pairs aren't aligned.
> +             * One of the two must still be handled atomically.
> +             */
> +            atmax =3D -atmax;
> +        }
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    /*
> +     * Here we have the architectural atomicity of the operation.
> +     * However, when executing in a serial context, we need no extra
> +     * host atomicity in order to avoid racing.  This reduction
> +     * avoids looping with cpu_loop_exit_atomic.
> +     */
> +    if (cpu_in_serial_context(env_cpu(env))) {
> +        return MO_8;
> +    }
> +    return atmax;
> +}
> +

> +/**
> + * load_atomic8_or_exit:
> + * @env: cpu context
> + * @ra: host unwind address
> + * @pv: host address
> + *
> + * Atomically load 8 aligned bytes from @pv.
> + * If this is not possible, longjmp out to restart serially.
> + */
> +static uint64_t load_atomic8_or_exit(CPUArchState *env, uintptr_t ra, vo=
id *pv)
> +{
> +    if (HAVE_al8) {
> +        return load_atomic8(pv);
> +    }
> +
> +#ifdef CONFIG_USER_ONLY
> +    /*
> +     * If the page is not writable, then assume the value is immutable
> +     * and requires no locking.  This ignores the case of MAP_SHARED wit=
h
> +     * another process, because the fallback start_exclusive solution
> +     * provides no protection across processes.
> +     */
> +    if (!page_check_range(h2g(pv), 8, PAGE_WRITE)) {
> +        uint64_t *p =3D __builtin_assume_aligned(pv, 8);
> +        return *p;
> +    }

This will also do a non-atomic read for the case where
the guest has mapped the same memory twice at different
addresses, once read-only and once writeable, I think.
In theory in that situation we could use start_exclusive.
But maybe that's a weird corner case we can ignore?

> +#endif
> +
> +    /* Ultimate fallback: re-execute in serial context. */
> +    cpu_loop_exit_atomic(env_cpu(env), ra);
> +}
> +

thanks
-- PMM

