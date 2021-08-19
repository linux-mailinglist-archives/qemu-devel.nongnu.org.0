Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EFE3F19E6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:00:33 +0200 (CEST)
Received: from localhost ([::1]:55986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGhep-0002ZT-Oo
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhct-00016S-Fk
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:58:32 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGhcp-0007xy-BX
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 08:58:30 -0400
Received: by mail-ej1-x62c.google.com with SMTP id d11so12712197eja.8
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 05:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sgN6QoWpvl48+eWDoOmLvd4WKRgOvBUvBqF/staf0bQ=;
 b=E6vqQySUEBJtPnFJbLtWdoc8zKtHDRsvNBPEpN6SODltgwUCdRpVDf53fB2nkQBJwO
 98OOpjbPzUOwLJf2MIlTeIWeC1Vf/h3rNarufUKrganALZKZ/ebyrRpy+2UVOAKprG7M
 LQ3p0xxNf1oNha1OowMmaqiMjFwk7HHF/HNgT9StrpOuxygPGSW18a+ink15+oBfsCLg
 P2H+Nczl31B+LRHI6OGJR2WojucDDskSOrHrw2iwZKoMcbXKyAVsYOB23R9EspsUfbC6
 r5JYB4HqDkTL2+niyBZGZXP01p/zeYPS9cnOyWBNm51s6rjT6Ibzvo1p8Jd8zZU/h+J1
 z+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sgN6QoWpvl48+eWDoOmLvd4WKRgOvBUvBqF/staf0bQ=;
 b=Zq8niG8cV8H3rPHGnc45An1J7ENNLyzbaAambNBPtFAI/pWhdCfWoxb1YQlZVAHWeb
 zDBL5znYbCUlmXjh8Wt5RQF83Fb1j49ZZp8X+TrYpDld3YgVLmSAk8Gg4eae2ZleNAbU
 SmCN8nDkxAGGvrit4QiLqiEiZb9RJK5mhsWD3egItiqur1/WE3ulpLZd32jkrtLg9cyy
 +Ig7XUUcPiXowjbSXs81sX1I15lRhrfTkZ6/Crm3vekNLQh3mEPGQ6ArlzX87zq4ATqY
 w3JMHHZ85V4kg1AjlgZ2GQC/n5S6MbTgYFw8XKaC03MjzM87yVaEYDERq44Erfgqp5qu
 N3aw==
X-Gm-Message-State: AOAM530MaHU25V767PZKOr6+EdWQVx4F+k3ES9eZnEAY1kfM2wl0fVEB
 ztLxov8MYHDaFyQFOt5XxjT2ocEoOT/apz55qHevBw==
X-Google-Smtp-Source: ABdhPJyZekOenNOSzrUJfO6MlaJl53QS+hPw6ogAn3ux3cdVyC0coW3NDg3gCuYxo8dUDWZAf1WGM4prigJ6y/0PtcU=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15530917ejy.407.1629377904687; 
 Thu, 19 Aug 2021 05:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210818110656.1993090-1-matheus.ferst@eldorado.org.br>
 <20210818110656.1993090-3-matheus.ferst@eldorado.org.br>
In-Reply-To: <20210818110656.1993090-3-matheus.ferst@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 13:57:38 +0100
Message-ID: <CAFEAcA9pKx5zxmF6iN1hqLr9mMhjEHfrOS=oqeJbySKdZ+aoKQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 v2 2/2] target/ppc: fix vector registers access in
 gdbstub for little-endian
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
> @@ -486,14 +479,9 @@ static int gdb_get_avr_reg(CPUPPCState *env, GByteArray *buf, int n)
>
>      if (n < 32) {
>          ppc_avr_t *avr = cpu_avr_ptr(env, n);
> -        if (!avr_need_swap(env)) {
> -            gdb_get_reg128(buf, avr->u64[0] , avr->u64[1]);
> -        } else {
> -            gdb_get_reg128(buf, avr->u64[1] , avr->u64[0]);
> -        }
> +        gdb_get_reg128(buf, avr->VsrD(0) , avr->VsrD(1));

Stray space before comma.

Otherwise if we first fix up the Int128 field order then:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

