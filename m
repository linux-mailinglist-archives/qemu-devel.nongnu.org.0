Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776BA5F28FD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 09:10:20 +0200 (CEST)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofFal-0006c1-9j
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 03:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1ofFXp-0004Bf-KT
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 03:07:18 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:39795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1ofFXn-0004na-0J
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 03:07:16 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-356abb37122so64561017b3.6
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adacore.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=f87hFez6sBrcu4TouxT0x54d5mtW/mDiIhMa9fsI03E=;
 b=VJnqh2Bu6Y6bmouqBjMldo2Voua/YelZTbj/0L3uOc4/2G/RCMO8j0LYhMLkO3O3so
 8mWLURUQAqtoZmVGdK6/LlxImGsgTmd2PtEHh+K8fKBeYluckwlomcZoFUy9xcEoaFlw
 CJQTUDQYkCsCiEqLW0S/odeDZNEOjf9P/OUQnvOkd6CLZqqobAMrSUtPTuqW6IdViDin
 hU104FcvFin3wV86+4bk4E0QJdo6C+UqxeNqYwxGu3NUaCZMCDm1ZPOaqHcgEQTZxw5H
 0jwzUAujeVdOhD25soOuF5Nh7Jvcjl94Gp7iGEe1AnHjVemvuGwf039+wU/cEbOmNbdx
 csQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=f87hFez6sBrcu4TouxT0x54d5mtW/mDiIhMa9fsI03E=;
 b=VYohNhRu1x5waD6auctzGA+tacAM6sAJby5K2jOSH0IH9PdQvu7t1cikndl6bTV2Ma
 /Hfv/xFG0pmFWMwbEIXIbQ0oCaUqDMVypxQnR9HHLMBBEZuTRZU4jV5lT9A/O7lND5k8
 7xIa02I1uL5+kCT3OGYDQKorUBgYjiT31GgHL63n0BsKEZEuqUVP9fgWAO2TbwUSE5DP
 yVsaUXOgqavmSXk9XzbTZN/Qvt0YgilPUIP1MqrRo3I9cqYVHHN2uQkrI6F3avAjeTlx
 zKBA++e6hx4fUkwr0rCMb0DHnBnuP2BEiG7Ja/qzzExW94zCFyTx7SgWsc7G7+6hqjc1
 EUGA==
X-Gm-Message-State: ACrzQf2S47XGlXe1Pj4em6BLMS2VfM9gvIU+WZg8AiI4bFGvhyXv36ks
 Dwl9+2VgFoDCCxwEUw0vzmtTw4kbjgFIKF5mTcJfQA==
X-Google-Smtp-Source: AMsMyM5frKgTZe73/HU7EDZ4dEdc3wZkM2vuh5IXMZhrYsS846JXd4IdpGq0WRzbTinb0JJGgAAFujrC8ZbvYDaFh/k=
X-Received: by 2002:a0d:db11:0:b0:355:c221:6164 with SMTP id
 d17-20020a0ddb11000000b00355c2216164mr15364249ywe.248.1664780833361; Mon, 03
 Oct 2022 00:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221003041440.2320-1-jim.shu@sifive.com>
 <20221003041440.2320-3-jim.shu@sifive.com>
In-Reply-To: <20221003041440.2320-3-jim.shu@sifive.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Mon, 3 Oct 2022 09:07:02 +0200
Message-ID: <CAJ307EjG0j8ydXk8_y5j0jsdmhqY3Fm1FqohMAY1J1hpfmvVMw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hw/intc: sifive_plic: change interrupt priority
 register to WARL field
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=chigot@adacore.com; helo=mail-yw1-x1129.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 3, 2022 at 6:14 AM Jim Shu <jim.shu@sifive.com> wrote:
>
> PLIC spec [1] requires interrupt source priority registers are WARL
> field and the number of supported priority is power-of-2 to simplify SW
> discovery.
>
> Existing QEMU RISC-V machine (e.g. shakti_c) don't strictly follow PLIC
> spec, whose number of supported priority is not power-of-2. Just change
> each bit of interrupt priority register to WARL field when the number of
> supported priority is power-of-2.
>
> [1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#=
interrupt-priorities
>
> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/intc/sifive_plic.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index f864efa761..c2dfacf028 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr a=
ddr, uint64_t value,
>      if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
>          uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
>
> -        if (value <=3D plic->num_priorities) {
> +        if (((plic->num_priorities + 1) & plic->num_priorities) =3D=3D 0=
) {
> +            /*
> +             * if "num_priorities + 1" is power-of-2, make each register=
 bit of
> +             * interrupt priority WARL (Write-Any-Read-Legal). Just filt=
er
> +             * out the access to unsupported priority bits.
> +             */
> +            plic->source_priority[irq] =3D value % (plic->num_priorities=
 + 1);
> +            sifive_plic_update(plic);
> +        } else if (value <=3D plic->num_priorities) {
>              plic->source_priority[irq] =3D value;
>              sifive_plic_update(plic);
>          }
> @@ -207,7 +215,16 @@ static void sifive_plic_write(void *opaque, hwaddr a=
ddr, uint64_t value,
>          uint32_t contextid =3D (addr & (plic->context_stride - 1));
>
>          if (contextid =3D=3D 0) {
> -            if (value <=3D plic->num_priorities) {
> +            if (((plic->num_priorities + 1) & plic->num_priorities) =3D=
=3D 0) {
> +                /*
> +                 * if "num_priorities + 1" is power-of-2, each register =
bit of
> +                 * interrupt priority is WARL (Write-Any-Read-Legal). Ju=
st
> +                 * filter out the access to unsupported priority bits.
> +                 */
> +                plic->target_priority[addrid] =3D value %
> +                                                (plic->num_priorities + =
1);
> +                sifive_plic_update(plic);
> +            } else if (value <=3D plic->num_priorities) {
>                  plic->target_priority[addrid] =3D value;
>                  sifive_plic_update(plic);
>              }
> --
> 2.17.1

Reviewed-by: Cl=C3=A9ment Chigot <chigot@adacore.com>

