Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019433BC1B7
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:33:13 +0200 (CEST)
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0RWy-0000Zh-2c
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0RVb-00085J-7m
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:31:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0RVZ-0005MD-Cr
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:31:46 -0400
Received: by mail-ed1-x534.google.com with SMTP id t3so24262710edt.12
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/FXuIVKWw01DQ2OG7NyUw75xejB0dDunl7fzQDzoGW8=;
 b=LPC8Ff0Vm/2EEDv8fanSHD2uKlMZjf0J3SQ5LhIKEW4s5yXLDf9bkrCnRLO65j63Z+
 n9rYCSlnIugkRdgseAlh+YDLxCK3XnyeoS3qPhNfnjFD+ExN/owvkjK0zEenN5upYCqz
 5icO7/XjZC7qSKkEmtgWzRrQx8wJfX5qqiXev4u2DKrwGC0k/zR1b9suzft4b6gsTN/L
 alU/Ic3lZSi5eDSJEZoDJvkTKlbdfaTztLbJ8rAtFNG37hQcpvT7BeS8tC1qGkBnwlZo
 c8chWzOFn/G7nxBY2IP8qZcCkEIGM8LLW8DUSShuBTMLi+O8TVOSezz4V1JCtYiepJVu
 4vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/FXuIVKWw01DQ2OG7NyUw75xejB0dDunl7fzQDzoGW8=;
 b=uWk67sG1d1kJ5KIsp8Xk/ZmMnEhOSvHQ6dhXTq3LQK3fErhPXpQlbegcEo8xexie5x
 2wdjBEkN/zGy5zDVqiYhMui11maXPUzqyFVu3R90CGvrYynweS6kknyyqLVcj0eFKRu7
 ENcQ2ki/Yijrjo7+W6dd1gLePXxMDZx45hkSTMzAs3+TFliHNTZDVw27JjuoiqXgtfPj
 IkPSiXnNioyrSLs8oep/0irHo0Lu/KELA0HmSB+IYnMOG2JfpZHLGiOJ2l/+qtBhWOur
 ak6g6XYQGc9s20J1brJs6AJ7SOvSkuVVft2T0GzPaRMf+c8WLyxUzYbTTcGUrtPOhRON
 +Fcg==
X-Gm-Message-State: AOAM5309TbuyZ05humpFYWnqyuvbtclLf5GbzC7a6Nc2f8UpK3dlbKCd
 7M2+iSOT9bpNDlJgSNYl9QhF6d2OgvZJFEOAzI+DQg==
X-Google-Smtp-Source: ABdhPJznrWro+b/hezkNTaeFxWRjcQd8T/huoSt2QEzfBZ84Z603VjclQQ3qlOJ8HbpbrHjUiOvApK2PD7KkyU2Bs90=
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr4566656edf.52.1625502703860; 
 Mon, 05 Jul 2021 09:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
 <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
 <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
 <CAFEAcA_kTthg=Y3152r4+eN=iunZy3vGq9J9vFKTog1rmsHsfA@mail.gmail.com>
 <CAJ+F1C+H7aw+_2+FspPv0nLtfbM=anBrhCaBWVYVhP6o8nqSDg@mail.gmail.com>
 <4b3021c2-ac50-d763-4113-10a200bdc9ac@redhat.com>
 <YOMyh9fu5ZEAlGHN@stefanha-x1.localdomain>
In-Reply-To: <YOMyh9fu5ZEAlGHN@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 17:31:05 +0100
Message-ID: <CAFEAcA9JnYri2TiB-zE1J0w26TQnUzzMe_z2XUD9YxBugJm6tg@mail.gmail.com>
Subject: Re: [PULL 0/2] Libslirp patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Jul 2021 at 17:25, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Mon, Jul 05, 2021 at 12:31:01PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > +Richard/Stefan for "atomic" error.
> ...
> > > [2363/9207] Linking target qemu-system-aarch64
> > > FAILED: qemu-system-aarch64
> > > clang++ @qemu-system-aarch64.rsp
> > > libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> > > `helper_atomic_cmpxchgq_le_mmu':
> > > /tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_template.h:86: undefine=
d
> > > reference to `__atomic_compare_exchange_8'
> > > libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> > > `helper_atomic_xchgq_le_mmu':
> > > /tmp/tmp.VkWONZ62bA/build/../accel/tcg/atomic_template.h:134: undefin=
ed
> > > reference to `__atomic_exchange_8'
> > > libqemu-aarch64-softmmu.fa.p/accel_tcg_cputlb.c.o: In function
> > > `helper_atomic_fetch_addq_le_mmu':
>
> According to docs/devel/atomics.rst:
>
>   These operations are polymorphic; they operate on any type that is as
>   wide as a pointer or smaller.
>
> It looks like the compiler doesn't support 8-bit atomics here?

8 here means "8 bytes", not "8 bits". And indeed on i386 you can't
do 8-byte atomics with simple insns. The compiler's answer to this
is "emit a call to a helper in libatomic, which will emulate an
atomic access by taking some kind of lock". We don't ever want to
fall back to "take a lock" because sometimes our accesses to the
atomic variables are from TCG generated code -- this is why we
don't link against libatomic. The problem is that we have not
correctly detected that this compiler can't do inline atomics
for 64-bit values and avoided using them. But at least we have
made this a compile failure rather than a silently-wrong-code bug :-)

thanks
-- PMM

