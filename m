Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162754EA94C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 10:32:26 +0200 (CEST)
Received: from localhost ([::1]:46522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ7H6-0002K7-Ko
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 04:32:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nZ79g-0006kz-C6; Tue, 29 Mar 2022 04:24:44 -0400
Received: from [2607:f8b0:4864:20::102f] (port=42861
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nZ79e-0004im-PP; Tue, 29 Mar 2022 04:24:44 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so2060206pjf.1; 
 Tue, 29 Mar 2022 01:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=FjVeE444Wd+FJKpQsPZ4+5iEa7UGAv9B/GS0RUlAX8E=;
 b=EYMRBqx6jQB+30DstNRHeTPV/ftMT3Pwo/MbXGaicVn+ozbjGbN60LT9db6W0rWEye
 VWCZTvoccqM1ylYEi0g6v9qIDJHkyhWKP0LGlSgCYi3ZZyFH2gOJcIG6/R5jf21uC8+W
 sOmjb73+D3S1ekVF2/WQsK4/nP/CmCeqiPwEMlcH2Am/Apd+RWW8l1bR6IqbMxnN7MLH
 a67z5zbyK6I6lQXF+PbaWfoPO0xZRQeIDr8iHJcSUF4DL8zkWom4wwc9Nf4EdRsoy4Ej
 C/oHL3/e4DDCSvUbuEEzWRNxS0cqflfjP0rFlfNK0HL8zU9YdZKRW7cEbx873zz6/Baa
 NyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FjVeE444Wd+FJKpQsPZ4+5iEa7UGAv9B/GS0RUlAX8E=;
 b=BTYCcgoJJkPRo2K0dcrMqFN7dQlITjx6lrxipCgdv+6wlFPqsC1uOX95K0fzDKwKkB
 ZHLtkeoPXIq55t/eOBu2tUWoRsjwm0VNr5CJtZwjBCcMaKEkYd3tC39uAQgqp+cfLNbI
 zL7gAeRg9/2bqEUwhjk7KeJLE5xaBHKbjUhG2U12FvsBdV0NOKYocVs55ctLWiizaULJ
 niPz0jPiEeNjfCj1R8Gv1QLzsrwhDJpsBMfuWfCnN4NDLHzAgcwKOsJSFdcxMZj8HClq
 s+uMaGeo5TJ3ZIgqrYfF9fyHNB2v1XuxjKknVqRjCklJlykTkfkmGu7S+aiq7aJoXsvn
 Etbw==
X-Gm-Message-State: AOAM533bheJN7UmWBEiP70IwQOZtZpbd5hUix71+285CajQppoF8spGn
 W1dlr/9bwn9TdpQ3TJtFe+Q=
X-Google-Smtp-Source: ABdhPJxEE3087bG/x0gf6NkCHwNwQ1922HHWje2mgqFvYCeM3/6yf1nA0jrnsQDUYuU1cEfTxt2jcg==
X-Received: by 2002:a17:90a:e7ce:b0:1c7:bf82:27c0 with SMTP id
 kb14-20020a17090ae7ce00b001c7bf8227c0mr3335938pjb.88.1648542280425; 
 Tue, 29 Mar 2022 01:24:40 -0700 (PDT)
Received: from localhost (58-6-255-110.tpgi.com.au. [58.6.255.110])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a637f4a000000b00373a2760775sm15049274pgn.2.2022.03.29.01.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 01:24:40 -0700 (PDT)
Date: Tue, 29 Mar 2022 18:24:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/2] spapr: Move hypercall_register_softmmu
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220325221113.255834-1-farosas@linux.ibm.com>
 <20220325221113.255834-2-farosas@linux.ibm.com>
In-Reply-To: <20220325221113.255834-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1648542252.zlzp6n6wax.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Excerpts from Fabiano Rosas's message of March 26, 2022 8:11 am:
> I'm moving this because next patch will add more code under the ifdef
> and it will be cleaner if we keep them together.
>=20
> Also switch the ifdef branches to make it more convenient to add code
> under CONFIG_TCG in the next patch.
=20
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  hw/ppc/spapr_hcall.c | 50 ++++++++++++++++++++++----------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>=20
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index f008290787..08b50590a8 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1473,31 +1473,6 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, targ=
et_ulong opcode,
>      return H_FUNCTION;
>  }
> =20
> -#ifndef CONFIG_TCG
> -static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
> -                            target_ulong opcode, target_ulong *args)
> -{
> -    g_assert_not_reached();
> -}
> -
> -static void hypercall_register_softmmu(void)
> -{
> -    /* hcall-pft */
> -    spapr_register_hypercall(H_ENTER, h_softmmu);
> -    spapr_register_hypercall(H_REMOVE, h_softmmu);
> -    spapr_register_hypercall(H_PROTECT, h_softmmu);
> -    spapr_register_hypercall(H_READ, h_softmmu);
> -
> -    /* hcall-bulk */
> -    spapr_register_hypercall(H_BULK_REMOVE, h_softmmu);
> -}
> -#else
> -static void hypercall_register_softmmu(void)
> -{
> -    /* DO NOTHING */
> -}
> -#endif
> -
>  /* TCG only */
>  #define PRTS_MASK      0x1f
> =20
> @@ -1825,6 +1800,31 @@ out_restore_l1:
>      spapr_cpu->nested_host_state =3D NULL;
>  }
> =20
> +#ifdef CONFIG_TCG
> +static void hypercall_register_softmmu(void)
> +{
> +    /* DO NOTHING */
> +}
> +#else
> +static target_ulong h_softmmu(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                            target_ulong opcode, target_ulong *args)
> +{
> +    g_assert_not_reached();
> +}
> +
> +static void hypercall_register_softmmu(void)
> +{
> +    /* hcall-pft */
> +    spapr_register_hypercall(H_ENTER, h_softmmu);
> +    spapr_register_hypercall(H_REMOVE, h_softmmu);
> +    spapr_register_hypercall(H_PROTECT, h_softmmu);
> +    spapr_register_hypercall(H_READ, h_softmmu);
> +
> +    /* hcall-bulk */
> +    spapr_register_hypercall(H_BULK_REMOVE, h_softmmu);
> +}
> +#endif
> +
>  static void hypercall_register_types(void)
>  {
>      hypercall_register_softmmu();
> --=20
> 2.35.1
>=20
>=20

