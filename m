Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1598A77
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 06:34:37 +0200 (CEST)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0eo0-0000Hg-IJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 00:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50607)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i0en2-0008HN-Sm
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i0en1-00081r-Cx
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:33:36 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46467)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i0en1-00081G-5b
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 00:33:35 -0400
Received: by mail-ot1-x343.google.com with SMTP id z17so4215280otk.13
 for <qemu-devel@nongnu.org>; Wed, 21 Aug 2019 21:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/Hypxkz7VT3mXa9Kz0qVNEQ4ptsUVJ1+RFcaBt+lFwk=;
 b=uG4Iwyqs3sShK6IJCdaUCRQMlkBdCfd59yV6lBtk6wy1fjBX/Wwmuss+X7aH2fTcEP
 Appym/y58bh5/vAXcIba0TVNTegcpUCI2C2q4zQu0K+ky4DfLdPPFSgpHeUKctP19bnr
 7WnO++RF7ilZCLU0w3EkhFjVLqGUP6cwWqORe6QofuvLm8tXxaLy1KBAMIQs2vLb34eP
 8tV4zWoPb7B2BEtC/pEdhybQd/iufoz2Syh5zJInHqsA4gDuy2siuoAZ4vJH7C8Y68SW
 bEfYvUlM8LS56fZ9RCCk5O3af/wAQm2VeOfpZbxEBbY3Ci2D7b/3DqeSp7A6yIYC/l/J
 1Xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/Hypxkz7VT3mXa9Kz0qVNEQ4ptsUVJ1+RFcaBt+lFwk=;
 b=lG/qrNryFDlcN5NqIRDFt9qd5qxNwtJzF8bfLGkYvDmpKIVw7sXKyjhxr3v5uEWeau
 32nWDPkDpoBLGnSTbg36ov6fPGneZO1pfbqlv2JTitKm0noKbCpzOGu32ZNHlw9udYBJ
 2ewQbe4flJ4rqkKCfO2kTQPYCZ0+WypBziTSe0911zrCOVAKEIeHVKb11GXJm9R9ZB+s
 Bnh/+xF4NZyy/j5zAmn+5v80BKMQwN4mFz9Ctic+4bkUC6twXNMljBXoo4ZV67y2zlwH
 utk6FOJByIAQi5HOlF0cIHTydSYSJlDzbZOVbXomzqK3kF1BHr1TWe7Q5y5MTarW5Dc7
 675A==
X-Gm-Message-State: APjAAAU6lqx33wmQHvJToX6OFXuXTK0XmjvVJVrkx7QlGHqHV0wza3c5
 H/5mxg726vX6y6QFxZR6cYFIDGrCXZnfR9V43SE=
X-Google-Smtp-Source: APXvYqzqrfrfssRqrTZjbSDMjFaSrXlA79D390WhQ58HfFPyNDmHZsnOtobJaG8kFUnCdEriKbvtUA0XQrdRwZSsHYs=
X-Received: by 2002:a9d:851:: with SMTP id 75mr30567256oty.341.1566448414295; 
 Wed, 21 Aug 2019 21:33:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Wed, 21 Aug 2019 21:33:33
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Wed, 21 Aug 2019 21:33:33
 -0700 (PDT)
In-Reply-To: <20190821172951.15333-32-jan.bobek@gmail.com>
References: <20190821172951.15333-1-jan.bobek@gmail.com>
 <20190821172951.15333-32-jan.bobek@gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 22 Aug 2019 06:33:33 +0200
Message-ID: <CAL1e-=j8vR1Whdj1RkVEBSi8rat-2r8nZb9F8ue+dfozXzda9Q@mail.gmail.com>
To: Jan Bobek <jan.bobek@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [RFC PATCH v4 31/75] target/i386: introduce code
 generators
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.08.2019. 20.12, "Jan Bobek" <jan.bobek@gmail.com> =D1=98=D0=B5 =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> In this context, "code generators" are functions that receive decoded
> instruction operands and emit TCG ops implementing the correct
> instruction functionality. Introduce the naming macros first, actual
> generator macros will be added later.
>
> Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
> ---

I advice some caution here. Before adopting the coding approach that relies
heavily on preprocessor, you should seriously evaluate
not-always-so-obvious aspects of debugability and readibility of the end
result. In other words, you should provide a clear and objective answer to
this: What is gained and what is lost by using macros?

Thanks,
Aleksandar

>  target/i386/translate.c | 46 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/target/i386/translate.c b/target/i386/translate.c
> index 2e78bed78f..603a5b80a1 100644
> --- a/target/i386/translate.c
> +++ b/target/i386/translate.c
> @@ -5331,6 +5331,52 @@ INSNOP_LDST(xmm, Mhq)
>      tcg_temp_free_i64(r64);
>  }
>
> +/*
> + * Code generators
> + */
> +#define gen_insn(mnem, argc, ...)               \
> +    glue(gen_insn, argc)(mnem, ## __VA_ARGS__)
> +#define gen_insn0(mnem)                         \
> +    gen_ ## mnem ## _0
> +#define gen_insn1(mnem, opT1)                   \
> +    gen_ ## mnem ## _1 ## opT1
> +#define gen_insn2(mnem, opT1, opT2)             \
> +    gen_ ## mnem ## _2 ## opT1 ## opT2
> +#define gen_insn3(mnem, opT1, opT2, opT3)       \
> +    gen_ ## mnem ## _3 ## opT1 ## opT2 ## opT3
> +#define gen_insn4(mnem, opT1, opT2, opT3, opT4)         \
> +    gen_ ## mnem ## _4 ## opT1 ## opT2 ## opT3 ## opT4
> +#define gen_insn5(mnem, opT1, opT2, opT3, opT4, opT5)           \
> +    gen_ ## mnem ## _5 ## opT1 ## opT2 ## opT3 ## opT4 ## opT5
> +
> +#define GEN_INSN0(mnem)                         \
> +    static void gen_insn0(mnem)(                \
> +        CPUX86State *env, DisasContext *s)
> +#define GEN_INSN1(mnem, opT1)                   \
> +    static void gen_insn1(mnem, opT1)(          \
> +        CPUX86State *env, DisasContext *s,      \
> +        insnop_arg_t(opT1) arg1)
> +#define GEN_INSN2(mnem, opT1, opT2)                             \
> +    static void gen_insn2(mnem, opT1, opT2)(                    \
> +        CPUX86State *env, DisasContext *s,                      \
> +        insnop_arg_t(opT1) arg1, insnop_arg_t(opT2) arg2)
> +#define GEN_INSN3(mnem, opT1, opT2, opT3)                       \
> +    static void gen_insn3(mnem, opT1, opT2, opT3)(              \
> +        CPUX86State *env, DisasContext *s,                      \
> +        insnop_arg_t(opT1) arg1, insnop_arg_t(opT2) arg2,       \
> +        insnop_arg_t(opT3) arg3)
> +#define GEN_INSN4(mnem, opT1, opT2, opT3, opT4)                 \
> +    static void gen_insn4(mnem, opT1, opT2, opT3, opT4)(        \
> +        CPUX86State *env, DisasContext *s,                      \
> +        insnop_arg_t(opT1) arg1, insnop_arg_t(opT2) arg2,       \
> +        insnop_arg_t(opT3) arg3, insnop_arg_t(opT4) arg4)
> +#define GEN_INSN5(mnem, opT1, opT2, opT3, opT4, opT5)           \
> +    static void gen_insn5(mnem, opT1, opT2, opT3, opT4, opT5)(  \
> +        CPUX86State *env, DisasContext *s,                      \
> +        insnop_arg_t(opT1) arg1, insnop_arg_t(opT2) arg2,       \
> +        insnop_arg_t(opT3) arg3, insnop_arg_t(opT4) arg4,       \
> +        insnop_arg_t(opT5) arg5)
> +
>  static void gen_sse_ng(CPUX86State *env, DisasContext *s, int b)
>  {
>      enum {
> --
> 2.20.1
>
>
