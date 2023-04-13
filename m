Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E636E107B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 16:58:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmyNz-0005QD-JW; Thu, 13 Apr 2023 10:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pmyNv-0005ON-Hx
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 10:57:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pmyNq-0002ez-6d
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 10:57:15 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso13347948wmr.0
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 07:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1681397828; x=1683989828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GW9D1lKn5/kgK70/A2yEXguO+hNqXOqtrium6F/jjYQ=;
 b=CQurd0m/PfnDUEAmvRtvD1qo8bgqLxZXP/8/oPu9bYfdTrFDBpJsMFBOuwMD0P9V7C
 lFxuqAkXZ0/xXtpS6LRVgNdQ64srxuiiPBRF5vQWBF0Q3SeIbGV+jo/wnMRuT+A4HcVI
 kdu8gqPfhlRxwPzOAuFTSJWWIPHxWHBEadsq+RXE9Z31cvl8o6NhxiJm/UHjAGFZylBY
 WhLcyvHeBAqCkBZWwcoz3nLJTShW8M6zRCzJSgHBR78jRxGVWMkbgUuqaHSBFpvTZA+C
 6VJfFnyx6w/IPs92QiMY6ue6tgiYHDDhccZaUvnnBqKwbq3DMCgeqJOC0UKrBxt2IxMD
 IDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681397828; x=1683989828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GW9D1lKn5/kgK70/A2yEXguO+hNqXOqtrium6F/jjYQ=;
 b=JK5O8eP3nznELA3bLHzvyHFEntK4yX52lvhk8CrVUwKsYL8XaNl9YwUrg2p96Q3JdT
 VI+e3eyFNq0C9TBxiFIz7CIaNqOrfJFSW3uyB/XAn/eePAeh/s9tVZjtyQ++Tk0+mt5Y
 Cnm3I1tuRiGoeIG9yIl0KNybfNyWSI14krPq4sUg0wD6yYbW6PzcNM/FLgzIi64GV2cM
 CX28SXmnRN3q4CFSMVBYXSEcpZAhoyE5tg+a4dyw4wIJxHFjkXHLEiQt7bpQit1LoCK7
 guUrb8cATIdwgEkmgNbABvwwzMIOqJp3QVLsbA6KdUGjBPIU90i4/Bxlmxs5aJ7jp55a
 UeeQ==
X-Gm-Message-State: AAQBX9fK9gIHoVWxxP8Oe5prPO/R8dGZXqCgNWMxkfeo4673m/xhGNeN
 L5OOnXLDgZ4qbBnMJh2UN6iGb3lheJG54G0/CjRDzg==
X-Google-Smtp-Source: AKy350bf57ECmEJiZSkvPssmUh0J9ETgSu2HOv4qLumsbvpLJqzUm9mj6P57Vwe+nQwLN+Rkj1gnYpNwjtQmVUUHHuE=
X-Received: by 2002:a7b:c395:0:b0:3f0:3ce6:9b08 with SMTP id
 s21-20020a7bc395000000b003f03ce69b08mr639904wmj.8.1681397828145; Thu, 13 Apr
 2023 07:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080026.3266574-1-christoph.muellner@vrull.eu>
 <b02cc37d-8a51-fed3-5a93-4d9f3873b5ae@linaro.org>
 <CAEg0e7jvqcH42rR_TXZHzQjw_5+Cr-NyhuB_pUQUkLNDngxprA@mail.gmail.com>
 <07f6b2a9-1f07-40f8-13f7-1fd15652e11c@linaro.org>
In-Reply-To: <07f6b2a9-1f07-40f8-13f7-1fd15652e11c@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Thu, 13 Apr 2023 16:56:54 +0200
Message-ID: <CAEg0e7hqwqoZ6tSLEt66H=Gmxp-mgn-fckUD19J_mS8dN4D7Pg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add support for the Zfa extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jeff Law <jeffreyalaw@gmail.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x32a.google.com
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

On Fri, Mar 31, 2023 at 11:39=E2=80=AFPM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/31/23 11:22, Christoph M=C3=BCllner wrote:
> > On Mon, Mar 27, 2023 at 7:18=E2=80=AFPM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 3/27/23 01:00, Christoph Muellner wrote:
> >>> +uint64_t helper_fminm_s(CPURISCVState *env, uint64_t rs1, uint64_t r=
s2)
> >>> +{
> >>> +    float32 frs1 =3D check_nanbox_s(env, rs1);
> >>> +    float32 frs2 =3D check_nanbox_s(env, rs2);
> >>> +
> >>> +    if (float32_is_any_nan(frs1) || float32_is_any_nan(frs2)) {
> >>> +        return float32_default_nan(&env->fp_status);
> >>> +    }
> >>> +
> >>> +    return nanbox_s(env, float32_minimum_number(frs1, frs2, &env->fp=
_status));
> >>> +}
> >>
> >> Better to set and clear fp_status->default_nan_mode around the operati=
on.
> >
> > I don't see how this can help:
> > * default_nan_mode defines if the default_nan is generated or if the
> > operand's NaN should be used
> > * RISC-V has default_nan_mode always set to true (operations should
> > return the a canonical NaN and not propagate NaN values)
> > * That also does not help to eliminate the is_any_nan() tests, because
> > float*_minimum_number() and float*_minnum() return the non-NaN number
> > if (only) one operand is NaN
> >
> > Am I missing something?
>
> Oh goodness, I did mis-read this.
>
> But if you need a nan when an input is a nan, then float32_min instead of
> float32_minimum_number (which goes out of its way to select the non-nan r=
esult) is the
> correct function to use.

Understood and fixed.
Thanks!

>
>
> r~

