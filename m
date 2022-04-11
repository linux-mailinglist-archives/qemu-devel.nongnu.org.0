Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33AF4FC068
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:23:46 +0200 (CEST)
Received: from localhost ([::1]:55924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvtJ-0006Sx-Po
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndvo4-0000Zz-Ag
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:18:20 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:37727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndvo2-00046l-E6
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:18:19 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ebebe631ccso84733617b3.4
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zsEUsxZ4wsufP9A7XWHIFun9zYCdDQyb6jAxE8PIX2I=;
 b=n17SL76OdYqWY/RwJkuChxIVxJ74wNUX6c3tCr6qyjbeDH+vsPwp1cu2+E5hU3EgG0
 fE1wfI/ynAPNYwc3sn3q+YAJ8C0hHX6Su7A2tO+d+p0gY+cRdjGy5w+PlafdDVq68KKX
 WdjLJzXIcce6Qpv4axZYoELwEOhLYteo53y2jkn0+9GqCHXaENmlvQbCQmsLo6qUTb/S
 Lb3t6GSeNdbQblmBgRqbnVfSPXBwzTjxAgPpUjYXjNsFv0g+yibDIdTb2ind/qasoRhT
 ZfNqMDjXLRu3BQ1ToOgVEOTEDPp04yN9Hi47EPl8qCYl+tS/dZKvHZJSAtpYMsio6TTn
 Qatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zsEUsxZ4wsufP9A7XWHIFun9zYCdDQyb6jAxE8PIX2I=;
 b=UFUDo/asK5bFVbD+MSnRYxkTDl4fFlWxxGWov6NinrwmyyUkwRiYlHQdiSPOg7vzeH
 uAf4KXomYyOtCjBloXt9SpiLoWA5aNIWDw/PSJy1JQkt0a3zOzZYnarRzgKkdt1qdmcW
 oL2hf/GojN4TyVH9PagaZ7pp7UfFzVT1BOsVc3tyh8wTQZSAy1ZXHSF+OF5IWcclxErV
 jtNqtFA8VH8+DSpOpPLqTotqxgkLg07pnm9HjYqIAmI+1KV2vwYTDhBGr8isa6i8/L4X
 tZL65V1oZRnPn14HESwWhi4jU19MMHKDvR1xFRMC484UbYrSD8x0a+fhCFsLDTHJARbk
 eqqg==
X-Gm-Message-State: AOAM532WJvqOyYo7gSiut4nRTAt0y/Xtkq/Abq3RkFWBild3grq3xar+
 c6ibt+iHwPWXPVh4jNgql5dg64/I/O24SJ98LMgf3Z6eUgU=
X-Google-Smtp-Source: ABdhPJySGi67ku4HGbxfnu1x9rxjhXVu6kC5xGpzeh6ByScOoujB+hq0QctnHeLJnxnXb9mL14OmPbhIIHY1j9b2IK8=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr17038989ywc.64.1649690295936; Mon, 11
 Apr 2022 08:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220411145609.3932882-1-alex.bennee@linaro.org>
In-Reply-To: <20220411145609.3932882-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 16:18:04 +0100
Message-ID: <CAFEAcA-j2jkdoy09aogzgFVPXYH2Mn7yHXJCZyoZ=DETMMZMVg@mail.gmail.com>
Subject: Re: [RFC PATCH] target/i386: avoid copying junk to extended ZMMReg
 fields
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Apr 2022 at 15:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> When change b7711471f5 was made to alias XMMReg to ZMMReg for the
> purposes of easing the handling of AVX512 registers we unwittingly
> broke the SSE helpers which construct a temporary value on the stack
> before copying them out. To avoid this lets encode REG_WIDTH based on
> shift and convert the pointer indirection with an explicit memcpy.
>
> An incomplete sampling of the affected instructions seems to indicate
> the default behaviour for legacy SSE is "the upper bits (MAXVL-1:128)
> of the corresponding YMM register destination are unmodified."
>
> Fixes: b7711471f5 ("target-i386: make xmm_regs 512-bit wide")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/420
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/i386/ops_sse.h | 71 ++++++++++++++++++++++++-------------------
>  1 file changed, 40 insertions(+), 31 deletions(-)
>
> diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
> index 6f1fc174b3..adfb498a71 100644
> --- a/target/i386/ops_sse.h
> +++ b/target/i386/ops_sse.h
> @@ -28,6 +28,7 @@
>  #define L(n) MMX_L(n)
>  #define Q(n) MMX_Q(n)
>  #define SUFFIX _mmx
> +#define REG_WIDTH 8
>  #else
>  #define Reg ZMMReg
>  #define XMM_ONLY(...) __VA_ARGS__
> @@ -36,6 +37,7 @@
>  #define L(n) ZMM_L(n)
>  #define Q(n) ZMM_Q(n)
>  #define SUFFIX _xmm
> +#define REG_WIDTH 16
>  #endif
>
>  void glue(helper_psrlw, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
> @@ -516,7 +518,7 @@ void glue(helper_pshufw, SUFFIX)(Reg *d, Reg *s, int =
order)
>      r.W(1) =3D s->W((order >> 2) & 3);
>      r.W(2) =3D s->W((order >> 4) & 3);
>      r.W(3) =3D s->W((order >> 6) & 3);
> -    *d =3D r;
> +    memcpy(d, &r, REG_WIDTH);
>  }

Looking a bit more closely, this won't work on big-endian
hosts, because there we want to copy across the last 16
bytes of the struct, not the first 16. So I think we need
some more macro magic:

/*
 * Copy the relevant parts of a Reg value around. For the
 * SHIFT =3D=3D 1 case these helpers operate only on the lower
 * 16 bytes of a 64 byte ZMMReg, so we must copy only those
 * so the guest-visible destination register has the top
 * bytes left untouched. For the SHIFT =3D=3D 0 case we are
 * working with an MMXReg struct which is the correct size.
 * Note that we can't memcpy() here because that will do
 * the wrong thing on big-endian hosts.
 */
#if SHIFT =3D=3D 0
#define COPY_REG(DEST, SRC) (DEST) =3D (SRC)
#else
#define COPY_REG(DEST, SRC) do { \
    (DEST).Q(0) =3D (SRC).Q(0);    \
    (DEST).Q(1) =3D (SRC).Q(1);    \
  } while (0)
#endif

and then use COPY_REG(*d, r);

(adjust syntax to taste, not compile tested).

We could probably try to write endian-specific flavours of
memcpy() invocation, but "do two 64-bit word copies" is what
the compiler would hopefully turn the memcpy into anyway :-)

thanks
-- PMM

