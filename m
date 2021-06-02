Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2904639853D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:27:01 +0200 (CEST)
Received: from localhost ([::1]:34842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loN9Q-0004Ce-87
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loN80-0002rv-DI
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:25:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loN7y-0007vS-2c
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:25:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q5so1571402wrm.1
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SFX1jboeX2AL6VG2wvGntY0azJ5PdP6vYknFrjqDF6A=;
 b=HyBKHal+EC3r3/FxwdokMhMY8U7fhYqypBfpAMMUpW/2gqFQCuH0Ja/gDRTk4RQaMu
 mgP1NNb3yiTXrLoYTF+mUxozgJcayh9qTDMAap9tBMKz6p3vSUB3Z5X8V5lInx70F6GC
 O5ig+ekdb9ALBI3mdI+AW/T1QcEikrAlOhER25iyoudgYwl8kNt0ITBqlGUYmaRGn+8c
 fED2/EQWnVPvfa6nOOB0iPRVsGVW6RVN1iBdHTWRZv9ilUjW7AlTgTq/mYsKsInNsDeU
 DjL4PvQjcNMx3qj3JP08FRyceNYp1P9aNM+kByr0YIHVOsHig8MQK3gftSd3hJmMIiNf
 VpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SFX1jboeX2AL6VG2wvGntY0azJ5PdP6vYknFrjqDF6A=;
 b=W0rxZXHw4Dfuij1upVWlU2/tROFT7LIGVeWKYdi5xGHeA7ZAIC/tdP5dXLw2Q7ynvs
 2Ycwu6gpCD8pS7+bYWkJU5Pm3ILHo70+89oDzeDXWhlgJS9Gyeu9z/+aAYW4IxNxAfr9
 TkBEPb9ROZwkV7hm0RTi9eZG9KX6x1yzCwy5RDyHhQVPFNsQniEZPpEsLGYaUbPAouHE
 bNLephyRjEp73MkHBnNhv5Q8y+C6IiS06/BS4NRzKJm5amcESeH1fL2I0PcGIn5Bv4JC
 /mPBgkFT/9M+FuDYhXh8o5N+ValBUyYCY3iVtJdiGPA9FPr37u9wZH1zax16bNaYy3D0
 2ilQ==
X-Gm-Message-State: AOAM533owKmuYvW4C4DTSMytjNi0Wqz/79JhP56J+ncBxftoQwG40TUn
 bvyjBwRtQXlLgcaxsNCnjCqRCw==
X-Google-Smtp-Source: ABdhPJw+fFLkSjYWJJzr5yOcWO3MP9ZdS53hB37A/24/26KQdO5O/OCTfsXZeYc8hJrvVoLzHLde+Q==
X-Received: by 2002:adf:ce01:: with SMTP id p1mr20203186wrn.63.1622625928285; 
 Wed, 02 Jun 2021 02:25:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b15sm5597219wru.64.2021.06.02.02.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 02:25:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D01781FF7E;
 Wed,  2 Jun 2021 10:25:26 +0100 (BST)
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-5-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v7 04/27] plugins: Drop tcg_flags from struct
 qemu_plugin_dyn_cb
Date: Wed, 02 Jun 2021 10:22:22 +0100
In-reply-to: <20210601150106.12761-5-richard.henderson@linaro.org>
Message-ID: <87h7igbou1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> As noted by qemu-plugins.h, enum qemu_plugin_cb_flags is
> currently unused -- plugins can neither read nor write
> guest registers.

No objection to this - although we hopefully will introduce the ability
to read registers at some point. I saw no indication that the ability to
mark helpers for that is going away, just the mechanism is changing?

>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/plugin-helpers.h |  1 -
>  include/qemu/plugin.h      |  1 -
>  accel/tcg/plugin-gen.c     |  8 ++++----
>  plugins/core.c             | 30 ++++++------------------------
>  4 files changed, 10 insertions(+), 30 deletions(-)
>
> diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
> index 1916ee7920..853bd21677 100644
> --- a/accel/tcg/plugin-helpers.h
> +++ b/accel/tcg/plugin-helpers.h
> @@ -1,5 +1,4 @@
>  #ifdef CONFIG_PLUGIN
> -/* Note: no TCG flags because those are overwritten later */
>  DEF_HELPER_2(plugin_vcpu_udata_cb, void, i32, ptr)
>  DEF_HELPER_4(plugin_vcpu_mem_cb, void, i32, i32, i64, ptr)
>  #endif
> diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
> index c5a79a89f0..0fefbc6084 100644
> --- a/include/qemu/plugin.h
> +++ b/include/qemu/plugin.h
> @@ -79,7 +79,6 @@ enum plugin_dyn_cb_subtype {
>  struct qemu_plugin_dyn_cb {
>      union qemu_plugin_cb_sig f;
>      void *userp;
> -    unsigned tcg_flags;
>      enum plugin_dyn_cb_subtype type;
>      /* @rw applies to mem callbacks only (both regular and inline) */
>      enum qemu_plugin_mem_rw rw;
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index 48bd2f36f0..88e25c6df9 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -384,7 +384,7 @@ static TCGOp *copy_st_ptr(TCGOp **begin_op, TCGOp *op)
>  }
>=20=20
>  static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, void *empty_func,
> -                        void *func, unsigned tcg_flags, int *cb_idx)
> +                        void *func, int *cb_idx)
>  {
>      /* copy all ops until the call */
>      do {
> @@ -411,7 +411,7 @@ static TCGOp *copy_call(TCGOp **begin_op, TCGOp *op, =
void *empty_func,
>          tcg_debug_assert(i < MAX_OPC_PARAM_ARGS);
>      }
>      op->args[*cb_idx] =3D (uintptr_t)func;
> -    op->args[*cb_idx + 1] =3D tcg_flags;
> +    op->args[*cb_idx + 1] =3D (*begin_op)->args[*cb_idx + 1];

This confuses me. We are dropping tcg_flags because we aren't using them
but why are we copying the next args from begin_op? Should we have been
doing that before?

>=20=20
>      return op;
>  }
> @@ -438,7 +438,7 @@ static TCGOp *append_udata_cb(const struct qemu_plugi=
n_dyn_cb *cb,
>=20=20
>      /* call */
>      op =3D copy_call(&begin_op, op, HELPER(plugin_vcpu_udata_cb),
> -                   cb->f.vcpu_udata, cb->tcg_flags, cb_idx);
> +                   cb->f.vcpu_udata, cb_idx);
>=20=20
>      return op;
>  }
> @@ -489,7 +489,7 @@ static TCGOp *append_mem_cb(const struct qemu_plugin_=
dyn_cb *cb,
>      if (type =3D=3D PLUGIN_GEN_CB_MEM) {
>          /* call */
>          op =3D copy_call(&begin_op, op, HELPER(plugin_vcpu_mem_cb),
> -                       cb->f.vcpu_udata, cb->tcg_flags, cb_idx);
> +                       cb->f.vcpu_udata, cb_idx);
>      }
>=20=20
>      return op;
> diff --git a/plugins/core.c b/plugins/core.c
> index 55d188af51..e1bcdb570d 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -295,33 +295,15 @@ void plugin_register_inline_op(GArray **arr,
>      dyn_cb->inline_insn.imm =3D imm;
>  }
>=20=20
> -static inline uint32_t cb_to_tcg_flags(enum qemu_plugin_cb_flags flags)
> -{
> -    uint32_t ret;
> -
> -    switch (flags) {
> -    case QEMU_PLUGIN_CB_RW_REGS:
> -        ret =3D 0;
> -        break;
> -    case QEMU_PLUGIN_CB_R_REGS:
> -        ret =3D TCG_CALL_NO_WG;
> -        break;
> -    case QEMU_PLUGIN_CB_NO_REGS:
> -    default:
> -        ret =3D TCG_CALL_NO_RWG;
> -    }
> -    return ret;
> -}
> -
> -inline void
> -plugin_register_dyn_cb__udata(GArray **arr,
> -                              qemu_plugin_vcpu_udata_cb_t cb,
> -                              enum qemu_plugin_cb_flags flags, void *uda=
ta)
> +void plugin_register_dyn_cb__udata(GArray **arr,
> +                                   qemu_plugin_vcpu_udata_cb_t cb,
> +                                   enum qemu_plugin_cb_flags flags,
> +                                   void *udata)
>  {
>      struct qemu_plugin_dyn_cb *dyn_cb =3D plugin_get_dyn_cb(arr);
>=20=20
>      dyn_cb->userp =3D udata;
> -    dyn_cb->tcg_flags =3D cb_to_tcg_flags(flags);
> +    /* Note flags are discarded as unused. */

"currently unused" would be a slightly more hopeful statement ;-)

>      dyn_cb->f.vcpu_udata =3D cb;
>      dyn_cb->type =3D PLUGIN_CB_REGULAR;
>  }
> @@ -336,7 +318,7 @@ void plugin_register_vcpu_mem_cb(GArray **arr,
>=20=20
>      dyn_cb =3D plugin_get_dyn_cb(arr);
>      dyn_cb->userp =3D udata;
> -    dyn_cb->tcg_flags =3D cb_to_tcg_flags(flags);
> +    /* Note flags are discarded as unused. */
>      dyn_cb->type =3D PLUGIN_CB_REGULAR;
>      dyn_cb->rw =3D rw;
>      dyn_cb->f.generic =3D cb;


--=20
Alex Benn=C3=A9e

