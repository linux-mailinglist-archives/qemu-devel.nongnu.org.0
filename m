Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F036DAFAA
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:29:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko0i-0004XE-2k; Fri, 07 Apr 2023 11:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pko0f-0004X3-Ej
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:28:17 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pko0d-00005h-NZ
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:28:17 -0400
Received: by mail-ej1-x629.google.com with SMTP id j22so9138890ejv.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680881293; x=1683473293;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y72eIsr9+Guc6UFJEvsBb5ie7J96MpWiJt73EhTX27o=;
 b=V3M9Js7JgejRQJ4jAFUz6V86WxzJlBj1vtseD+yvtlGmwRYcsS+74fOS4Kt09kJbPT
 kUA1ommkbUDCOQ5VxiJ5hF8mbXF8ndKaGG6hPGG8jJsMNkBrEEOLmroGmoTynCn6QYLG
 DXkGSmLjGktfYj516lx1CmN+b3ziDGdFX6lXBzDfYAh65QFdzGiFoqmTIJvSu62FuN+A
 VwtFeaQ/qx92Du3jEkZJf1PukbCU4OcNeLMygeyAEA9OZO5xOOcrE2Bx0I9AK1s78K8r
 g5yfw00CcJmpV0kbA6SFWTEVPJ0G2Pf6B87vd9AcEKtJ4gv1Ddq/sRhV24oxrWYlfN3n
 yfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881293; x=1683473293;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y72eIsr9+Guc6UFJEvsBb5ie7J96MpWiJt73EhTX27o=;
 b=fSy3rtj6MEwVSy8Ho6RTceBUNvB/rq985CAK9HOI1LkomD+GOiTzUfmt4BDlZtQScy
 CMktvTfdIyK9yuXp4jzczZWkfXnE3Ufk4CDeBf2+TVR48LeeVyVJmYrLHPtDVoRuAUEV
 MUKPGrgrf4p1Q8pJ0KbLlvKN/OxoSdRKv9ZxnshBW5UeFvzctJS1OYiWApN5DKRxVcdZ
 Qfy3uSQjbwJRH080s+t5rbTg84Coxt6XrxuFCeG7ouieoiZE+bt1nl9cNsQoLxzqCTKm
 OJOPqCTr4Z0XLzCNw6+iVBquwafr3ni0qxOt5kBPLbrItAeKxPzNmjuumHXV2dAeV3j2
 7yFQ==
X-Gm-Message-State: AAQBX9en9HHpQBaTACjjvNhdhB261V773x7FVZwZqsH/h0r/HLStU+Rj
 e8csN+Kp/IUJUg28c7BvNyOP7H57aTsPtKO6tnoCbQ==
X-Google-Smtp-Source: AKy350ZBOIkvKeWsx5LjwxWkSufeYDCN7mTvgCOl3jeEMY1LhjI9sqA+dHeCJPfZz5V7M4J5lR6Xb07H+2JjRVd7ty0=
X-Received: by 2002:a17:906:2847:b0:920:da8c:f7b0 with SMTP id
 s7-20020a170906284700b00920da8cf7b0mr1274939ejc.6.1680881293287; Fri, 07 Apr
 2023 08:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230407134044.11638-1-pbonzini@redhat.com>
In-Reply-To: <20230407134044.11638-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Apr 2023 16:28:02 +0100
Message-ID: <CAFEAcA-Ymuo7aFafReStB8mTEf3cG7JZh-cN65kZbKLtkg=zdQ@mail.gmail.com>
Subject: Re: [PATCH] docs: explain effect of smp_read_barrier_depends() on
 modern architectures
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 7 Apr 2023 at 14:41, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The documentation for smp_read_barrier_depends() does not mention the architectures
> for which it is an optimization, for example ARM and PPC.  As a result, it is not
> clear to the reader why one would use it.  Relegate Alpha to a footnote together
> with other architectures where it is equivalent to smp_rmb().
>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/devel/atomics.rst | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/docs/devel/atomics.rst b/docs/devel/atomics.rst
> index 2157d3312956..8f6273c9283e 100644
> --- a/docs/devel/atomics.rst
> +++ b/docs/devel/atomics.rst
> @@ -201,10 +201,9 @@ They come in six kinds:
>    retrieves the address to which the second load will be directed),
>    the processor will guarantee that the first LOAD will appear to happen
>    before the second with respect to the other components of the system.
> -  However, this is not always true---for example, it was not true on
> -  Alpha processors.  Whenever this kind of access happens to shared
> -  memory (that is not protected by a lock), a read barrier is needed,
> -  and ``smp_read_barrier_depends()`` can be used instead of ``smp_rmb()``.
> +  Therefore, unlike ``smp_rmb()`` or ``qatomic_load_acquire()``,
> +  ``smp_read_barrier_depends()`` can be just a compiler barrier on
> +  weakly-ordered architectures such as ARM or PPC[#]_.

If you want to be super-picky, the preferred capitalization
these days is "Arm" :-)

>    Note that the first load really has to have a _data_ dependency and not
>    a control dependency.  If the address for the second load is dependent
> @@ -212,6 +211,10 @@ They come in six kinds:
>    than actually loading the address itself, then it's a _control_
>    dependency and a full read barrier or better is required.
>
> +.. [#] The DEC Alpha is an exception, because ``smp_read_barrier_depends()``
> +   needs a processor barrier.  On strongly-ordered architectures such
> +   as x86 or s390, ``smp_rmb()`` and ``qatomic_load_acquire()`` can
> +   also be a compiler barriers.

s/a //;

>
>  Memory barriers and ``qatomic_load_acquire``/``qatomic_store_release`` are
>  mostly used when a data structure has one thread that is always a writer
> --
> 2.39.2

thanks
-- PMM

