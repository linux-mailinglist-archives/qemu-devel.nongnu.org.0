Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8117334F0FF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 20:27:01 +0200 (CEST)
Received: from localhost ([::1]:48596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRJ4u-0002fQ-JN
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 14:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRIzF-0008Lk-9s
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:21:10 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:40678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRIz9-0004x3-0m
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 14:21:09 -0400
Received: by mail-qv1-xf33.google.com with SMTP id c3so7479658qvz.7
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 11:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=asvmRhKTHQMeLc8Eomzr+zaKVavtTtD6Qhtl/m8DP70=;
 b=NYRkHYGMjxQ8Feteo3auQEz9WMJQQPznTqL6UpeJc5ajvSa0AAPvdYwkUHwAMzSP5a
 nu1cdFkuCLMhJyrV293b26gfryr3LETPhRf50dBu+n9SzZ4t5/1tP6hsVZILhICwdCnI
 spguIxXTHaFq7ODjjheXG43BD/j4j+KPSle2HOcKjnpOo2wTnIvzuCwipLKaGbImReFs
 0ch7l/mKUb+2c/8e5OFLulSwVwFrYvv3xIiRAS54i4vOfeFkhi8vIt80DU44riPxH8vG
 rWKGIcs5n3emBn/nlUsiwjqxSt23poeTrl/kW0wbY+iS3N9KbbWQo9DSNNghd+obPQLU
 UWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=asvmRhKTHQMeLc8Eomzr+zaKVavtTtD6Qhtl/m8DP70=;
 b=ZRx3Er3lJ28KLMMbl+kwp7Fhb/uyXqG9jRqqB33FjBEh+8sqdzGrfIFGfZrcldgydX
 D+ZH8MJ4eEDmpvjRDGySVQR31HLU/pw25S+DC8tBEj6JSaI2RseyJwIBoWnVjFnxxQxT
 Sia32g+f9uQOEMph/K/wGUIQTAQlo7K1/OwJfqKEJLQ80QA0PAtxtsEvhvHGaX/j9lFf
 i5ODyUZr+lfYRZjoLXrvI3DeKUFXE4j1ql5Sq1Oh1VAfJ8NNgjsnhhHSz2eIdt6lGWhs
 zSZPiemX9aQs0U60tPwiLMIhh43rLkg//U7jJdw2LqbLW3LiGMkNCUr1FG+MKvwxBtql
 grZw==
X-Gm-Message-State: AOAM532azMzhNmVs4xDAsnXVpzcgkOsEDx6JI+ulwicsLgk/H/dON00i
 /rw1TjB0yzD8f0sZTuEabr/LT+AF8UO1bmYdcG5xog==
X-Google-Smtp-Source: ABdhPJxX5Bf/p3nNqTQjNqX8ug9XUYK3Votd3/5q7e7cYPmjzA4RLXCJBfUqUZNrhZX/+IOW8AF88pEc+Smtb3VEQxE=
X-Received: by 2002:a0c:fec8:: with SMTP id z8mr31642076qvs.59.1617128460704; 
 Tue, 30 Mar 2021 11:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-7-alex.bennee@linaro.org>
 <a71640f7-a864-1214-52d7-e6dab4677dd8@linaro.org>
In-Reply-To: <a71640f7-a864-1214-52d7-e6dab4677dd8@linaro.org>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Tue, 30 Mar 2021 18:20:49 +0000
Message-ID: <CAHDbmO1+q=DxGQcoirmnsSfwp_XKoJvj04oWJBhpGCiEsK=_MQ@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] tests/i386/test-i386: try and correct constrain 16
 bit call (WIP)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=alex.bennee@linaro.org; helo=mail-qv1-xf33.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hmm actually the fedora-i386-cross image is:

  gcc (GCC) 10.2.1 20201125 (Red Hat 10.2.1-9)

with CROSS_CC_GUEST_CFLAGS=3D-m32 so I wonder what the difference is
between that and:

  i686-linux-gnu-gcc -m32

i686-linux-gnu-gcc --version
i686-linux-gnu-gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

They are both pretty new.

On Tue, 30 Mar 2021 at 16:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/29/21 5:03 AM, Alex Benn=C3=A9e wrote:
> > Newer compilers complain about non-matching constraints:
> >
> >    test-i386.c:1393:5: error: asm operand 2 probably doesn=E2=80=99t ma=
tch constraints [-Werror]
> >     1393 |     asm volatile ("lcall %1, %2"
> >          |     ^~~
>
> The problem is that the newer compiler is defaulting to -fpie, so &code16=
_func1
> is not a constant.
>
> Need to add -fno-pie to compile this.  Which of course adds the confusion=
 of
> old compilers that don't support that.  We have CFLAGS_NOPIE in configure=
, but
> that doesn't directly help cross-compile.
>
>
> r~



--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

