Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F7C3F19A2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 14:44:41 +0200 (CEST)
Received: from localhost ([::1]:38554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhPU-0006vn-I2
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 08:44:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhOR-00065w-8m
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:43:35 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhOP-0000Y8-LP
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:43:34 -0400
Received: by mail-ed1-x52a.google.com with SMTP id bo19so8637273edb.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nnDTS7h8L9Kk8GIbRnh0qE44sHSfnZXc/dNUQFfJ0PA=;
 b=vTKQf2CY1legDFKBdA2FMgxc3XtBbmvqusvFfEW093CHBUc/ROxg9BFAf/gWTuVDxJ
 RFUU0G/ITUcMiPBvoIk21xsDycUsU6VkGbaehvar37dJF+RJ3k1eCgXn47adUTPrk1dJ
 N0wBlXK9HElFtwW+KFjVKuu3hXm+jnDychK6Alst4CcXQhuABl/Iivdxu/cA3fgWhhG9
 KOXNCnSKz0lrkFO9jnbEVZCLyJYjAZDAKjwu01Dvn1XnOI54zoDy8DCsIV4b5qYee4ip
 PiIC3QddhMgpXRqG6s2vvkT98C71glRX+OHk1ILnhTflMTXkZim7IIVZ3QsPlw97w6ws
 Kh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nnDTS7h8L9Kk8GIbRnh0qE44sHSfnZXc/dNUQFfJ0PA=;
 b=n1IpOjAMBghsvfnw9o5Y6DzYEyNalOMzSP/pgMbxNWq4Zq3oC8kpbDfMhB8J+FfxD7
 ikOQ9D5+LaqT4LL9g6hSqYijpG83/4JsD/Wy4TmABgfQwhdC/xU6Nkj8GK6Qb+QPicn9
 yDYpN8gfYB2U0zcb8huubQVjoSbK7ZnuRBe4P7nsFLRA/bunffFi6/oYpcQJxpadcrkG
 olBF3EWPK8e5fnusc/Ej4LnHrx3xrNGT+v7ssVqH83wge+410KqoNa0amR7mGwYL7iYE
 DGTmpBIag6ZjBZb0f0EvkALvo47UTlE5Rd48NpOC1gphEc1456KkxrP9umxwt+S26SHk
 ogtA==
X-Gm-Message-State: AOAM533CqPbdgptNrAdmAlnQVYhXOi0E45uM7+lOP5zqJ87CpnmZ6iTt
 ZC5nA6E2M4AI+TNGUH9xIPDScuZqblG86uT8ztxjPg==
X-Google-Smtp-Source: ABdhPJxrr6TK8ySgqER8PgH/4cF0kTw7A8//SYsXzucHYIbV3nmvC3Sm2Hb1nuFSlKye/4Wjl7+JJP+YPUq8ceP5P+c=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr16134684edb.52.1629377012111; 
 Thu, 19 Aug 2021 05:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
 <20210818110656.1993090-3-matheus.ferst@eldorado.org.br>
In-Reply-To: <20210818110656.1993090-3-matheus.ferst@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 13:42:46 +0100
Message-ID: <CAFEAcA89aPw5chrrzaV155Why0vjhN+BUQ7nfhz1_4EgcziBZw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v2 2/2] target/ppc: fix vector registers access in
 gdbstub for little-endian
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 12:11, <matheus.ferst@eldorado.org.br> wrote:
>
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>
> As vector registers are stored in host endianness, we shouldn't swap its
> 64-bit elements in user mode. Add a 16-byte case in
> ppc_maybe_bswap_register to handle the reordering of elements in softmmu
> and remove avr_need_swap which is now unused.
>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  target/ppc/gdbstub.c | 32 +++++++-------------------------
>  1 file changed, 7 insertions(+), 25 deletions(-)
>
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 09ff1328d4..011016edfa 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -101,6 +101,8 @@ void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
>          bswap32s((uint32_t *)mem_buf);
>      } else if (len == 8) {
>          bswap64s((uint64_t *)mem_buf);
> +    } else if (len == 16) {
> +        bswap128s((Int128 *)mem_buf);

This cast looks dubious. Int128 is not necessarily a 128-bit value
in host byte order: if !CONFIG_INT128 then an Int128 is defined as:
struct Int128 {
    uint64_t lo;
    int64_t hi;
};

with the low half always first.

So you can't cast your mem_buf* into an (Int128*) and then treat it
like an Int128, I'm afraid.

This also means that the "Int128 s128" field in the ppc_vsr_t union
seems dubious -- how is that intended to work ?

Maybe we should fix this by making the 'struct Int128' field order
depend on HOST_WORDS_BIGENDIAN...

-- PMM

