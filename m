Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538F60D21C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 18:58:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onN5T-0003Vy-V0; Tue, 25 Oct 2022 12:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onN54-0003H8-NG
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:47:11 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onN4z-00032W-Js
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:47:10 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 v13-20020a17090a6b0d00b0021332e5388fso3731052pjj.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CNuJ2RlXXdKib/7X6xNaRh/fRMtm3pu4LVjNHg+p+aU=;
 b=BJ1HK4EOSBKIaZ/scqN0/awPIswa9WDYsrEzBJ/H+zUY5tgJDemjQqFF2TKvUDgRx5
 EX60oglDpbMbnZD+DK8El62Uk1qAc6ydiAG3mirFIGr9GfE/rMcc0EIMOia04lcf+TQt
 +25/Z+QTqfYjSLGDlRl0IZxp9Oot4EeD+vuOoWmpll8OQd7jGVt6SIoqdJQu3p0erpZt
 7ZhXX2oYkcAczYqBZ1K67XOHyKxSM3NVDvx6Sgiry8PSwcaxuxnHxBRdVhno5ATJEdxC
 7E7q7WukjhC4j3dOJsNcwh0S4r1xSyDDG1woIvnW/SerQUpSv4e5XLHdX40z7xadeBtO
 /mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CNuJ2RlXXdKib/7X6xNaRh/fRMtm3pu4LVjNHg+p+aU=;
 b=VbkjAQFVVYIx3Nit5FNsL3i/Qfwq05+fjdxwXWvoa7iC0DilnLuHkfYAY8pBPSo1NR
 eWFj+bJkV6AjcAu84hhnlmv7X1n4vV37/stda1NJXU77iL2OjshGx2EQwiz4TcgyE3of
 IE2HNtMgH8ltjl8wDxDfXS6V2teJewpn5CTTIQhOSED+0CRw7SHSvCqMBuVhzdENzoCT
 +TlDogLTJXCgWG6aqZbjSu2K8Vq5LNv2NHjPEiOhOWkYhQxtPI3krc4NpD2akea08Ikf
 NXh/NYC3BjAWdiqcU8X9cdlvhfpoa114uq9rBNd96kMUCiTFSUbRaYW/3hCeDyyIFv+G
 9SBg==
X-Gm-Message-State: ACrzQf3cxVp7Hjpe1vQ+5d2Tmf/I1C8K3Mtt1wZGORBRKJtkAa/YT1ZZ
 pbJ0Uj/WiwO0h/PE3/clnpLtWXzQITzaYJuzIYfLXg==
X-Google-Smtp-Source: AMsMyM6xQv/AdJm5njuE9lnC9815AM5r2fS9GDLbS+MX8AOYxCfrEs7qudeA0HWhSg2fpBxZG3T30FmgA4RhqteG8ik=
X-Received: by 2002:a17:90b:f06:b0:212:cb07:fb82 with SMTP id
 br6-20020a17090b0f0600b00212cb07fb82mr27669647pjb.221.1666716424090; Tue, 25
 Oct 2022 09:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-10-Jason@zx2c4.com>
In-Reply-To: <20221025004327.568476-10-Jason@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 17:46:52 +0100
Message-ID: <CAFEAcA95Xx6pN8qL4iQG-O_A_tY0ZbtymPfSDfV1Rsro8U75Ug@mail.gmail.com>
Subject: Re: [PATCH v4 09/11] mips/malta: pass RNG seed via env var and
 re-randomize on reboot
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 at 01:44, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> As of the kernel commit linked below, Linux ingests an RNG seed
> passed as part of the environment block by the bootloader or firmware.
> This mechanism works across all different environment block types,
> generically, which pass some block via the second firmware argument. On
> malta, this has been tested to work when passed as an argument from
> U-Boot's linux_env_set.
>
> As is the case on most other architectures (such as boston), when
> booting with `-kernel`, QEMU, acting as the bootloader, should pass the
> RNG seed, so that the machine has good entropy for Linux to consume. So
> this commit implements that quite simply by using the guest random API,
> which is what is used on nearly all other archs too. It also
> reinitializes the seed on reboot, so that it is always fresh.
>
> Link: https://git.kernel.org/torvalds/c/056a68cea01
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/mips/malta.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 0e932988e0..d337de920c 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -26,6 +26,7 @@
>  #include "qemu/units.h"
>  #include "qemu/bitops.h"
>  #include "qemu/datadir.h"
> +#include "qemu/guest-random.h"
>  #include "hw/clock.h"
>  #include "hw/southbridge/piix.h"
>  #include "hw/isa/superio.h"
> @@ -1017,6 +1018,17 @@ static void G_GNUC_PRINTF(3, 4) prom_set(uint32_t =
*prom_buf, int index,
>      va_end(ap);
>  }
>
> +static void reinitialize_rng_seed(void *opaque)
> +{
> +    char *rng_seed_hex =3D opaque;
> +    uint8_t rng_seed[32];
> +
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    for (size_t i =3D 0; i < sizeof(rng_seed); ++i) {
> +        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
> +    }
> +}
> +
>  /* Kernel */
>  static uint64_t load_kernel(void)
>  {
> @@ -1028,6 +1040,8 @@ static uint64_t load_kernel(void)
>      long prom_size;
>      int prom_index =3D 0;
>      uint64_t (*xlate_to_kseg0) (void *opaque, uint64_t addr);
> +    uint8_t rng_seed[32];
> +    char rng_seed_hex[sizeof(rng_seed) * 2 + 1];
>
>  #if TARGET_BIG_ENDIAN
>      big_endian =3D 1;
> @@ -1115,9 +1129,20 @@ static uint64_t load_kernel(void)
>
>      prom_set(prom_buf, prom_index++, "modetty0");
>      prom_set(prom_buf, prom_index++, "38400n8r");
> +
> +    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
> +    for (size_t i =3D 0; i < sizeof(rng_seed); ++i) {
> +        sprintf(rng_seed_hex + i * 2, "%02x", rng_seed[i]);
> +    }
> +    prom_set(prom_buf, prom_index++, "rngseed");
> +    prom_set(prom_buf, prom_index++, "%s", rng_seed_hex);
> +
>      prom_set(prom_buf, prom_index++, NULL);
>
>      rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
> +    qemu_register_reset_nosnapshotload(reinitialize_rng_seed,
> +                        memmem(rom_ptr(ENVP_PADDR, prom_size), prom_size=
,
> +                               rng_seed_hex, sizeof(rng_seed_hex)));


So I didn't take this one patch, partly because I don't think
all our supported build platforms have memmem(), and partly
because when I then looked a bit closer at it it looks like
we're searching through the whole blob for the RNG
seed. We know where it is to start with, so I think it would
be cleaner to have prom_set return table_addr (ie the offset
into the blob of what it just wrote) so we can use it here.
(You could also reverse-engineer it from prom_buf[prom_index - 1]
but returning the offset seems a bit less awkward.)

thanks
-- PMM

