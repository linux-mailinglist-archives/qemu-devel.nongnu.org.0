Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF66360D0C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 16:56:40 +0200 (CEST)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3Q7-0007aM-9n
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 10:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX3Oc-0006Yf-Da
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:55:06 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX3Oa-00027t-LY
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:55:06 -0400
Received: by mail-ed1-x531.google.com with SMTP id s15so28449711edd.4
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 07:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hI5cu9jKJw2ZK8vWZAs5PsFJVnhHb2MqXM2tXjO+r5s=;
 b=G7ySAS1CQja8+EXHs3o2i9RDncsUSB4aQ8ow5KMqk5tIFRRUPxUZnfWEqNkyUUFx0O
 tTpnopMzokJsDLDuN5ljtiPfSc9E8lNxnu2Wgu3Hh1WofpkQCIGwBLAcNmoJepAz1N85
 CNENJ1hUgr/v4WKyO/85mRZa7aoXHcB6GNE5ckdwxoFcPszFIOaJfwkT6uHRZh1jE6Ib
 oKnginR0VRVQKdoNqkNngsTDic5uy7+LeplxhA/iVdIeufKaGymxlGZfNrhs7TYvGvAv
 H2Z9xzkwQWEanKpcvOgxQUTBT8VE0nw482pjPaxXNPLGXr2qH57Ty47W2o4qdUPx8lEG
 8LMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hI5cu9jKJw2ZK8vWZAs5PsFJVnhHb2MqXM2tXjO+r5s=;
 b=i2xnYBxkxZN/ukLI+6S/YkfX7OvM1ayY/9z7eZbGKvlJ3GBtdpmbm2MTKfCGWpNVyr
 l1p//1d5UzriOjxdJB4C/LJ2lLtoTHwJD9wANcPmi+yTeoTxKZlYEUI1WpmAuzZWavgh
 qX9PaK9DSpwpbG8xEwFYIh6fMDFQ8741HqPq2D/u9KBREUk41r8tuphk5qk4QTfvRYQN
 NiXYG6L2VaClSuU5ttBtZpV79+wviQ/UuoJP0by3phqJRnkTrlHAU0sCA7YJGoOFGmrb
 HfDOVBydpvlKWFZvowZpbLYygYCh0EPqZe2/0g5s8AQfbvGwKBg2xyyLiqyq25xs5B+/
 e7MA==
X-Gm-Message-State: AOAM5325Uwy9EAHPIl5fyx/ugnPvaUXWPbsAZ97UWAPOUgFjjWsrjtEl
 O6YCYOPip6kxZxJKf8rukdfwqq9yP/LSdczm4cmPvQ==
X-Google-Smtp-Source: ABdhPJwpa7m/PDLtuhaCgeQBK1skScpQ60ExYuPBDowzGewwYRTFbCJRgRLT5m0n1/nlD2dRjeSlwHdbe/UG9KqQacs=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr1386363edd.52.1618498502965; 
 Thu, 15 Apr 2021 07:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
In-Reply-To: <87blaflit2.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 15:54:15 +0100
Message-ID: <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
Subject: Re: [PULL 18/23] accel/tcg: re-factor non-RAM execution code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 15:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> --8<---------------cut here---------------start------------->8---
> accel/tcg: avoid re-translating one-shot instructions
>
> By definition a single instruction is capable of being an IO
> instruction. This avoids a problem of triggering a cpu_io_recompile on
> a non-cached translation which would only do exactly this anyway.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> 1 file changed, 1 insertion(+), 1 deletion(-)
> accel/tcg/translate-all.c | 2 +-
>
> modified   accel/tcg/translate-all.c
> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>
>      if (phys_pc =3D=3D -1) {
>          /* Generate a one-shot TB with 1 insn in it */
> -        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
> +        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>      }
>
>      max_insns =3D cflags & CF_COUNT_MASK;
> --8<---------------cut here---------------end--------------->8---

Yes, this fixes the problem. Do we want to put this in for 6.0? My
feeling is that executing from non-RAM is pretty niche, so maybe
if we need an rc4 anyway, but this isn't important enough to cause an
rc4 itself.

-- PMM

