Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32DC6D015A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:35:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpcb-0005tj-09; Thu, 30 Mar 2023 06:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpcZ-0005tH-0f
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:35:07 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1phpcX-0004em-05
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:35:06 -0400
Received: by mail-ed1-x52b.google.com with SMTP id i5so74759693eda.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680172503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=txGkNYhxQY1ZDH5K+oBgkwLGRZKIXUGcCTeHU3obFh4=;
 b=yh/SG0MnVD/W3djOgoXSm+86Gq5ve/GDy1piixrXv4vE4FZ+CxmVSU9sHGbbokEqi4
 lWx401yjTvz7wtIBuwIFd/in0v1y9KWZi6uv9L9vB6fc9c63fPmZga8b5Iktkpk6Rpvj
 Nt7qfU2stMhAEJSgSxmOTve5QKFXMbtTcjyvf8gciGAwUsxMievB++T/YqCwQBoD6mdq
 dl/lgUKbyC6riZFALLTwqLFcLeFl3+TIU4KuW3etkgtv/44YBypfMTZruEr5pVJeh4Sr
 FOhB9t9JyOOLpUapC3hrBSWnem41SQuM5KUYkds5a70Wimis5nk+K9iXbNb53iDZNV4H
 INuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680172503;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=txGkNYhxQY1ZDH5K+oBgkwLGRZKIXUGcCTeHU3obFh4=;
 b=KxFZb3hlUZBFSqPeeP3vdb8hIsb2iPixZCSDxShZs1p97mW67jzM12YubGOiPT7TuW
 vAT+Mr0EHjSnwk251wPK9t7pHOHKmH18Kr8dQ1CyB7aYQ5y/E+CfCnR/Keu6z4WqIjZs
 g4h3GSp3zAb5OAhzDdpkGmAlepFYkFBO8ZXNaLMz3gQXzzEmMXs1JDK4kKUSTMCmCEVW
 eOc6mvLgJu+91lJSIvabXr123yCPyk2xeXj4gEJlieY2AbP5fNXXogufy55AGghXh8z9
 IEkHoNdltJ1l0umM/d/MEpenI1HvvpoBVqjkqTBRx8rmJMguDOnZ3f027OODYxsyrqUh
 nklA==
X-Gm-Message-State: AAQBX9cV+Weru6mieZx389NtEjkWck/kwVp4HoSIXBEeYm8qZ3uT7P29
 PoQvATIMcIzliD2F9K2Yz4Rz1e6FqW27o7Ou/phV2g==
X-Google-Smtp-Source: AKy350YcW+UscaXCnWkgPQjYjek9tuO/w5Oa4NN1PN2qAUu9U3HqpIpL/agBlmwWgLqYN63SC9MG8SyGhl2XX9Ws9XA=
X-Received: by 2002:a17:906:483:b0:92f:41e4:e48b with SMTP id
 f3-20020a170906048300b0092f41e4e48bmr11130910eja.6.1680172502973; Thu, 30 Mar
 2023 03:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230328212516.29592-1-philmd@linaro.org>
 <CAFEAcA_yP9ibO2NOC0pL4SNbPmHtB+TfPm0A06YfC4Mwec5xAQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_yP9ibO2NOC0pL4SNbPmHtB+TfPm0A06YfC4Mwec5xAQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Mar 2023 11:34:52 +0100
Message-ID: <CAFEAcA9w0H+j2EbgFDXACno1OF-dCFcb1OuCNksci9vHqW=RPw@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 v3] target/arm: Fix non-TCG build failure by
 inlining pauth_ptr_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Thu, 30 Mar 2023 at 11:31, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Tue, 28 Mar 2023 at 22:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > aarch64_gdb_get_pauth_reg() -- although disabled since commit
> > 5787d17a42 ("target/arm: Don't advertise aarch64-pauth.xml to
> > gdb") is still compiled in. It calls pauth_ptr_mask() which is
> > located in target/arm/tcg/pauth_helper.c, a TCG specific helper.
> >
> > To avoid a linking error when TCG is not enabled:
> >
> >   Undefined symbols for architecture arm64:
> >     "_pauth_ptr_mask", referenced from:
> >         _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
> >   ld: symbol(s) not found for architecture arm64
> >   clang: error: linker command failed with exit code 1 (use -v to see i=
nvocation)
> >
> > - Inline pauth_ptr_mask() in aarch64_gdb_get_pauth_reg()
> >   (this is the single user),
> > - Rename pauth_ptr_mask_internal() as pauth_ptr_mask() and
> >   inline it in "internals.h",
> >
> > Fixes: e995d5cce4 ("target/arm: Implement gdbstub pauth extension")
> > Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Fabiano Rosas <farosas@suse.de>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> > Supersedes: <20230328133054.6553-1-philmd@linaro.org>
> >
> > Since v2:
> > - Rebased (patch #1 merged)
> > - Addressed rth's comments
> > - Added R-b tags
> > ---
> >  target/arm/internals.h        | 16 +++++++---------
> >  target/arm/gdbstub64.c        |  7 +++++--
> >  target/arm/tcg/pauth_helper.c | 18 +-----------------
> >  3 files changed, 13 insertions(+), 28 deletions(-)
> >
> > diff --git a/target/arm/internals.h b/target/arm/internals.h
> > index 673519a24a..71f4c6d8a2 100644
> > --- a/target/arm/internals.h
> > +++ b/target/arm/internals.h
> > @@ -1389,15 +1389,13 @@ int exception_target_el(CPUARMState *env);
> >  bool arm_singlestep_active(CPUARMState *env);
> >  bool arm_generate_debug_exceptions(CPUARMState *env);
> >
> > -/**
> > - * pauth_ptr_mask:
> > - * @env: cpu context
> > - * @ptr: selects between TTBR0 and TTBR1
> > - * @data: selects between TBI and TBID
> > - *
> > - * Return a mask of the bits of @ptr that contain the authentication c=
ode.
> > - */
> > -uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
> > +static inline uint64_t pauth_ptr_mask(ARMVAParameters param)
> > +{
> > +    int bot_pac_bit =3D 64 - param.tsz;
> > +    int top_pac_bit =3D 64 - 8 * param.tbi;
> > +
> > +    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
> > +}
>
> Any reason for deleting the doc comment ?

Applied to target-arm.next with a doc comment:

/**
 * pauth_ptr_mask:
 * @param: parameters defining the MMU setup
 *
 * Return a mask of the address bits that contain the authentication code,
 * given the MMU config defined by @param.
 */


-- PMM

