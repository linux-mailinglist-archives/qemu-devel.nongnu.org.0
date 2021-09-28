Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D5C41B344
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 17:47:33 +0200 (CEST)
Received: from localhost ([::1]:41490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVFKM-0004ki-GZ
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 11:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVFJ8-00042Q-Sm
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:46:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mVFJ6-0006aa-BW
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 11:46:14 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v17so15429432wrv.9
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 08:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=phbMigpI5tSCFWTNOnA2GWAJzEyiZy9PBTLe5I7b2lQ=;
 b=hWOgknKEvQXvqMUE5FUJWj3kLB6uCkumxDZSbPrtsqu9okdJeq5bzfmjyWc+VLoR9V
 XuIp3MYHW00Vizrd1PQx46f6cjYw7VgiksDx4/QrPmOKDHLHEyKgpucvHYOE8oiBlA9F
 pC/B1PrIQSQ6k+nfdqpzVZRk71VXiuVPr4RSkoPr1DHCWEJsKPQoAsuRi7LaQzs11xit
 m3pnYXcKMrUxrM4LW7iTb+iboOeRtuKSX12oXAkXeuas+AkLWf6hfV2pZVC9AcMIF46a
 zUVEDQ1OXlvhuoFkfTNS0yANL5J2dw69Wz2Up6FiyNTiPOARm4hjDbK+Kc0GIw4vCrAJ
 yCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=phbMigpI5tSCFWTNOnA2GWAJzEyiZy9PBTLe5I7b2lQ=;
 b=Dgy2DEBIZyrUdK1musoGfGTyw1fUipUUZt+w4M4NFYlWV3pHfiKOoaPTbQH1R8UG3N
 mnBMmc7KkU5eupAWanx3SYcXvbKKuHGzDmxWA3FCKgldXoBlM8BokifpRtwcWG0x22tV
 G/Lg04kpVym5+Ve/9aUFpQAjGqZE8JgyshxNurGS43IXmBrizLgCQsIxrltCeQMNm+hu
 EBfUKLG8OcXxnVcVPng0H/jH9+dPgtp8qqAyLEDXha+GR9it5jTRo4ZJ02sug4Vy4Yyd
 k2JrLRTwgu35LdbwNwnypC6wEW7f8upJKk8BjgQmcH9pJrWGheCfjklVBCtvGujk0CRN
 4V1Q==
X-Gm-Message-State: AOAM531GgQ0VlTRUIWxhRF99iihJRyaWem6gG2C97BDZVwYQKsPjDkq3
 Ll2UbLp4gcGtDa93e54DKL0hzieNaDsiOgJ9Dxmw/Q==
X-Google-Smtp-Source: ABdhPJzASgp7T7T3yckKWp+aoQUvmUbw/iIdnrDdP97ABHqXRUvjStTkin7YZlLqxO3bwK77MSK4IYHjDAJ+c4n8fm0=
X-Received: by 2002:a05:6000:8f:: with SMTP id
 m15mr918665wrx.174.1632843968871; 
 Tue, 28 Sep 2021 08:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <20210911140016.834071-12-philipp.tomsich@vrull.eu>
 <CAKmqyKM7b9Xz0C7YN7QyARUJSAuDqxWk4VnwHfMB+5tTHGvy4w@mail.gmail.com>
In-Reply-To: <CAKmqyKM7b9Xz0C7YN7QyARUJSAuDqxWk4VnwHfMB+5tTHGvy4w@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Tue, 28 Sep 2021 17:45:58 +0200
Message-ID: <CAAeLtUBk3ffamhKaqYsQkCW79Z6Jd+gMH_jAv_NXAVyDPdHOmw@mail.gmail.com>
Subject: Re: [PATCH v11 11/16] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard,

On Tue, 28 Sept 2021 at 09:07, Alistair Francis <alistair23@gmail.com> wrot=
e:
>
> On Sun, Sep 12, 2021 at 12:07 AM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > The 1.0.0 version of Zbb does not contain gorc/gorci.  Instead, a
> > orc.b instruction (equivalent to the orc.b pseudo-instruction built on
> > gorci from pre-0.93 draft-B) is available, mainly targeting
> > string-processing workloads.
> >
> > This commit adds the new orc.b instruction and removed gorc/gorci.
> >
> > Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> I'm seeing this warning when building with gcc (GCC) 11.2.1
>
> /var/mnt/scratch/alistair/software/qemu/include/tcg/tcg.h:1267:5:
> warning: overflow in conversion from =E2=80=98long long unsigned int=E2=
=80=99 to
> =E2=80=98int32_t=E2=80=99 {aka =E2=80=98int=E2=80=99} changes value from =
=E2=80=9872340172838076673=E2=80=99 to
> =E2=80=9816843009=E2=80=99 [-Woverflow]
>  1267 |     (__builtin_constant_p(VECE)                                  =
  \
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>  1268 |      ? (  (VECE) =3D=3D MO_8  ? 0x0101010101010101ull * (uint8_t)=
(C)   \
>       |      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>  1269 |         : (VECE) =3D=3D MO_16 ? 0x0001000100010001ull * (uint16_t=
)(C)  \
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>  1270 |         : (VECE) =3D=3D MO_32 ? 0x0000000100000001ull * (uint32_t=
)(C)  \
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>  1271 |         : (VECE) =3D=3D MO_64 ? (uint64_t)(C)                    =
      \
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>  1272 |         : (qemu_build_not_reached_always(), 0))                  =
  \
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>  1273 |      : dup_const(VECE, C))
>       |      ~~~~~~~~~~~~~~~~~~~~~
> ../target/riscv/insn_trans/trans_rvb.c.inc:301:34: note: in expansion
> of macro =E2=80=98dup_const=E2=80=99
>   301 |     TCGv  ones =3D tcg_constant_tl(dup_const(MO_8, 0x01));
>       |                                  ^~~~~~~~~
> [78/87] Compiling C object
> libqemu-riscv32-linux-user.fa.p/target_riscv_translate.c.o
> In file included from
> /var/mnt/scratch/alistair/software/qemu/include/tcg/tcg-op.h:28,
>                  from ../target/riscv/translate.c:22:

The dup_const macro is returning an unsigned long long, which probably
should be fixed on the tcg.h-level instead of forcing a cast to target_long
at the call site.

Or should we introduce a dup_const_tl?

Philipp.

