Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31C25BEF35
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:35:06 +0200 (CEST)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaktW-0003ZT-1T
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oagCs-0002RF-QX
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:34:46 -0400
Received: from mail-ua1-f54.google.com ([209.85.222.54]:36454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oagCr-0002Is-6z
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 12:34:46 -0400
Received: by mail-ua1-f54.google.com with SMTP id u14so1303445ual.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 09:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=K1rHKL41/FN83kN/mtJ8/qLo07/Ge32XZkBALYcMCew=;
 b=jt/mxkXd+ZxoBRsw+qXcP8xrV0gbpFwhDuJl082b9ow5wgXxvxigWIZtIqhKBr/45B
 HnDWKbbIYLUMwi8tXXSbmGTmwpWw92hzlfZE+wopjjXJoqV4nSVXlU5osv4Q2q+3juI8
 SfYCcd4mplv0AZCucolmqZkrAszfrScv67c3eRisGvgO5SvwCDG736Cr1gzZEZRx6Ktk
 HPfvsZo4KHaFLg3uHFpYVgVXwiUEUJ+F6/uYMFphbIzv9chXBwAIXaZK8zoi5jin9SgS
 tgWqP4Kv8gZP4I0svz/ujjrKrxZWFT6pxXqIAIv2Y/u+rvJ101VKCC0frqqKnmcKI9N6
 etBg==
X-Gm-Message-State: ACrzQf2cJiqjXp4lqT3aOsaUKM8fltb2TPG/SHMz/e9WzyzFMi3uIk7G
 3WUnwODymBkqhGSj5BAZL1VCGmyjJMkkpk9AxAI=
X-Google-Smtp-Source: AMsMyM56d4cljRvbk6s457bR1YZ6It8FqsThrNbxGxwjN+5AW0oXNgsxVNNFv8KaATWPzuTR9RMlXXMOocLBH9HwSj8=
X-Received: by 2002:ab0:4a5e:0:b0:3ba:2511:933f with SMTP id
 r30-20020ab04a5e000000b003ba2511933fmr9373461uae.67.1663691684027; Tue, 20
 Sep 2022 09:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220917112515.83905-1-mark.cave-ayland@ilande.co.uk>
 <20220917112515.83905-3-mark.cave-ayland@ilande.co.uk>
 <6aa798e4-73b2-f96b-589c-4ab390cb1ba2@eik.bme.hu>
 <d8e33415-d44b-6e30-057c-c5de5b2f9bb9@amsat.org>
 <1095351c-953f-0d02-a6d6-055c0730e44d@ilande.co.uk>
In-Reply-To: <1095351c-953f-0d02-a6d6-055c0730e44d@ilande.co.uk>
Date: Tue, 20 Sep 2022 18:34:32 +0200
Message-ID: <CAAdtpL4FxKukX8GskBE23Gnycz3ZjdZwZ3ErUn7=c0_H2fY7rA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <laurent@vivier.eu>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.222.54;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ua1-f54.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Tue, Sep 20, 2022 at 6:30 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
> On 17/09/2022 23:27, Philippe Mathieu-Daud=C3=A9 via wrote:
> > On 17/9/22 14:09, BALATON Zoltan wrote:
> >> On Sat, 17 Sep 2022, Mark Cave-Ayland wrote:
> >>> There are already 32 feature bits in use, so change the size of the m=
68k
> >>> CPU features to uint64_t (allong with the associated m68k_feature()
> >>> functions) to allow up to 64 feature bits to be used.
> >>>
> >>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> >>> ---
> >>> target/m68k/cpu.c | 4 ++--
> >>> target/m68k/cpu.h | 6 +++---
> >>> 2 files changed, 5 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> >>> index f681be3a2a..7b4797e2f1 100644
> >>> --- a/target/m68k/cpu.c
> >>> +++ b/target/m68k/cpu.c
> >>> @@ -38,12 +38,12 @@ static bool m68k_cpu_has_work(CPUState *cs)
> >>>
> >>> static void m68k_set_feature(CPUM68KState *env, int feature)
> >>> {
> >>> -    env->features |=3D (1u << feature);
> >>> +    env->features |=3D (1ul << feature);
> >
> >          env->features =3D deposit64(env->features, feature, 1, 1);
> >
> >>> }
> >>>
> >>> static void m68k_unset_feature(CPUM68KState *env, int feature)
> >>> {
> >>> -    env->features &=3D (-1u - (1u << feature));
> >>> +    env->features &=3D (-1ul - (1ul << feature));
> >
> >          env->features =3D deposit64(env->features, feature, 1, 0);
> >
> >> Should these be ull instead of ul?
> >
> > Yes. Not needed if using the <qemu/bitops.h> extract/deposit API.
>
> I must admit I find the deposit64() variants not particularly easy to rea=
d: if we're
> considering alterations rather than changing the constant suffix then I'd=
 much rather
> go for:
>
>      env->features |=3D (1ULL << feature);
>
> and:
>
>      env->features &=3D ~(1ULL << feature);
>
> Laurent, what would be your preference?

OK, no need to change then.

> >>> -static inline int m68k_feature(CPUM68KState *env, int feature)
> >>> +static inline uint64_t m68k_feature(CPUM68KState *env, int feature)
> >
> > Why uint64_t? Can we simplify using a boolean?
>
> I don't really feel strongly either way here. Again I'm happy to go with =
whatever
> Laurent would prefer as maintainer.

Preferably using boolean:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

