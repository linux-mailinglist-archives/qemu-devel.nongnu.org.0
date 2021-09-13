Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87272409829
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:59:55 +0200 (CEST)
Received: from localhost ([::1]:34752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPoN8-0003TL-Ky
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoKz-0001aU-Dv
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:57:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPoKw-0006nH-QV
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:57:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d21so7779762wra.12
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r2M6FGsJrR+26c64Lg+H3X9rPZooSZdbkyAj8YTr3CA=;
 b=PPRzKVdB/mKhVfPghfVpe7J3liwYoWgyPW7VFb0VxHKKJmL884++athpD18xSRC+i+
 HGw25n60aeSytYBhvoZIwMcNmK/SH+u4am17TQdMleBCnIIC1ta7PfQ4/7bECDAUNwXx
 wpHEwFa5zMOltXZC4pfDJ3x4Q2uANwLDPTTZwBZGgNLtl87gRlSDoPilDk6YDvOexScm
 Jg2KXCyzh0kU4zAA3kJRwK6770vBpd+q2PwZxLMtum45632s5In8OcBC840ExPHyR/qu
 NUQCQGxFa9oy38lk2v5uql0VJnCGHjGyaXzitGjphzqdJPkxSz2KWm/AZoDLeL8lTdLC
 29jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r2M6FGsJrR+26c64Lg+H3X9rPZooSZdbkyAj8YTr3CA=;
 b=8AtPSapWis4KlG1EJ0QmBuiR7ntZAduNYuWGkqSFFOLQ+Tm1xappYAVCbhS6nWB4On
 V6P24T+hDFDdmZxETMtWWnKI8DudBzG5mYPar7t1Dn7MkwKyKEDky9/rkFf7asHdBDMy
 AA6VyDpDnGiwNBQUt7qBaH7qHp3TIFWlIqSNnw3xymnJsJSQCuEyh0QARsBH/h7rsLlL
 QCelKQARg8yR8DHoDYR3pt5X5Q42klhyXOlQ9gersxB3Cw1Zg6AZLaISVX+h5NHGBSGi
 /7W3YvmU+meT4ZCSuxgf7g1j4mBNVZfUxDT1ANZuy7OZjqbUY+1trd1tVFMn/gKZWXd+
 MI2A==
X-Gm-Message-State: AOAM531UXHzkFvW5C8zQUTt4WgTTb+3T0NgpRHpY2aHxxAOVGGwmlE/h
 Xi0+qm8uLHtXAjkO7C9oywNHUcUpBOu/8nq/bIdLc4qYrfcOHw==
X-Google-Smtp-Source: ABdhPJydQUOmkyCzdm6aOFqw5wQQ1yT+WpluxZcNrBdrkHLKlr6mIAYOASxfTPzDB7zRmaEg04Q8Qlm3xiXGb6CcDeQ=
X-Received: by 2002:adf:f185:: with SMTP id h5mr13613625wro.302.1631548657046; 
 Mon, 13 Sep 2021 08:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210913130950.214756-1-marcandre.lureau@redhat.com>
 <CAFEAcA97pX7qHLXkGL23_ygFk2hcJEw2J7CSKDJukdbxpvgKpg@mail.gmail.com>
 <f2a05978-430e-1964-7d1e-c32b4babd0bc@amsat.org>
In-Reply-To: <f2a05978-430e-1964-7d1e-c32b4babd0bc@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 16:56:46 +0100
Message-ID: <CAFEAcA_DwJJU=He9ZMCxOYC001Z+cBxsR1njChnzd1eZCtdO3Q@mail.gmail.com>
Subject: Re: [PATCH v2] docs: add supported host CPU architectures section
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 13 Sept 2021 at 16:22, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/13/21 3:50 PM, Peter Maydell wrote:
> > On Mon, 13 Sept 2021 at 14:10, <marcandre.lureau@redhat.com> wrote:


> > I still wonder if this would be clearer if we listed 'tcg' as
> > an accelerator like all the others, rather than describing it as
> > a kind of special case in the text above the table. After all, you
> > can select it with '-accel tcg' the same as any other.
> >
> > I think the information in the table is correct now.
>
> What is TCI at this point?

It's a different backend to TCG. (Almost always you do not want it.)
It's not a separate accelerator type.

> >> +Other architectures are not actively maintained. They may be removed =
in future
> >> +releases.
>
> What are the other archs which could be removed?

It's not so much that we have explicit code to handle any other host
architectures which we might remove. It's more that we do not specifically
say "we don't know what this host arch is and we don't have a TCG backend
for it, sorry" for unknown host architectures; instead we suggest that
the user might try using TCI.

In future in theory we might:
 * just say "unsupported" there instead (making unknown
   host CPU arch a fatal error, in the same way unknown host OS
   is a fatal error)
 * drop TCI entirely

I think both of those would be controversial (but I'm not against
them myself ;-)).

We could perhaps rephrase the sentence to something like:

  Other host architectures are not supported. It is possible to
  build QEMU on an unsupported host architecture using the configure
  ``--enable-tcg-interpreter`` option to enable the experimental
  TCI support, but note that this is very slow and is not recommended.

If we want to actually deprecate building on non-supported host
architectures we should say that via the usual deprecation process.

-- PMM

