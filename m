Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ED93F73C0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:53:57 +0200 (CEST)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqXc-0002wb-Or
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1mIqN8-0007qo-Po
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:43:06 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1mIqN6-0001ko-Qh
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:43:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 u11-20020a17090adb4b00b00181668a56d6so4397079pjx.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CjSIkbqdA14J6haB0taRhZ1lrs6Izf0JtjiDYQD1uzs=;
 b=PyN1WpGSxvT7IGJArT96zYhPsjOz9w4rXnm6ovoPDSj1NA7/JU6CR3jscAtSVKtocR
 2CzUoiHA2+LaZM0y/fqvuXyBdJe3oVS/INTfsXABRstbmLaAI0tq9V8726ztWRqPw5Fe
 Dw0EMKcQfuP1mjsr3IahtCIo9SC54Z9VCIoYf16VPVahYAD0KI4bK0zMFuBl4M+A5cTj
 mFIx3iJwqZ5xg+2Z1PpjzToE14LAKtOBy6lEqIXvdpcEKwlw09rwK9JNtI8I5Y2bk2wN
 0mlBgK6RwN/f1UEoRNyp08Rv2k6rG+YkpvB6h4osksdKoFHsR74LA6dTxsx78YPoBASx
 wk/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CjSIkbqdA14J6haB0taRhZ1lrs6Izf0JtjiDYQD1uzs=;
 b=FYBSMZtXGdowz6R+kRVdMFiQetkS9O98fJP0kD4TxRnEx8SYUEfGw9mWov+pZnkFid
 A/WcX/44v8y4FUw3dOpBiC3eC8HJ60voqy9BblcCyu75wIEtCBD9wKNBwOx/8pJPGhjg
 tpNuY6ejonGWn3G8od69FCW2qQfptBwFZYN2xAcVBx06k/mjAS1MUn3/aeKEVb5jPfJL
 GuBQA9+jwGgYiDyu1zTLRiFAxCVADTixp39b52N00zH5UxufUWG9OOStgKdbHMFgaDLz
 67/5r0HfMLMIqV2JkKdOiDQ8cnLXWSqAkOY2YCDi/tXlmM+3pwDChNgBKdSg6YA0rCvX
 02AA==
X-Gm-Message-State: AOAM533n15Vmz78wXao7THlnYfICfhkDVRZnubLLZiiXbbgRwrk7MWwq
 yZNkOGbDjDZJVZaUNxWhT8lPL491eai2Qqt3eh4=
X-Google-Smtp-Source: ABdhPJwBX9uqLTA139P+KNGEbTQEhGbR2YKqFDHrOiJ3Y9+55GeBxMpmReKcwqO5XqveR46Gbz1NlEpcwe1W56lojPk=
X-Received: by 2002:a17:90a:9ef:: with SMTP id
 102mr9772977pjo.223.1629888182661; 
 Wed, 25 Aug 2021 03:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210825095100.20180-1-mark.cave-ayland@ilande.co.uk>
 <74177bc7-384b-60cd-daa7-084d9a3f7c67@amsat.org>
In-Reply-To: <74177bc7-384b-60cd-daa7-084d9a3f7c67@amsat.org>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Wed, 25 Aug 2021 12:42:51 +0200
Message-ID: <CAAM0arMuPnrKwibEfCyGSC2_m5gycAUeyC7aOaeNFGbno9sHgQ@mail.gmail.com>
Subject: Re: [PATCH] sun4m: fix setting CPU id when more than one CPU is
 present
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=a.tarasenko@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 25, 2021 at 12:29 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
>     Fixes: 24f675cd3b ("sparc/sun4m: Use start-powered-off CPUState
> property")
>     Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>     Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index ff8ae73002a..78ca0925d25 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -262,6 +262,7 @@ struct sparc_def_t {
>      uint32_t mmu_cxr_mask;
>      uint32_t mmu_sfsr_mask;
>      uint32_t mmu_trcr_mask;
> +    uint8_t mxcc_cpuid;

Could it be moved a little further to avoid breaking alignment of
uint32 variables?

Regards,
Artyom

>      uint32_t mxcc_version;
>      uint32_t features;
>      uint32_t nwindows;
> @@ -583,7 +584,6 @@ void cpu_raise_exception_ra(CPUSPARCState *, int,
> uintptr_t) QEMU_NORETURN;
>
>  #ifndef NO_CPU_IO_DEFS
>  /* cpu_init.c */
> -void cpu_sparc_set_id(CPUSPARCState *env, unsigned int cpu);
>  void sparc_cpu_list(void);
>  /* mmu_helper.c */
>  bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index 7b4dec17211..8189045fdbf 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -238,8 +238,6 @@ static void leon3_generic_hw_init(MachineState *machi=
ne)
>      cpu =3D SPARC_CPU(cpu_create(machine->cpu_type));
>      env =3D &cpu->env;
>
> -    cpu_sparc_set_id(env, 0);
> -
>      /* Reset data */
>      reset_info        =3D g_malloc0(sizeof(ResetData));
>      reset_info->cpu   =3D cpu;
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index 42e139849ed..5be2e8e73f2 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -803,10 +803,10 @@ static void cpu_devinit(const char *cpu_type,
> unsigned int id,
>      cpu =3D SPARC_CPU(object_new(cpu_type));
>      env =3D &cpu->env;
>
> -    cpu_sparc_set_id(env, id);
>      qemu_register_reset(sun4m_cpu_reset, cpu);
>      object_property_set_bool(OBJECT(cpu), "start-powered-off", id !=3D 0=
,
>                               &error_fatal);
> +    object_property_set_uint(OBJECT(cpu), "cpu-id", id, &error_fatal);
>      qdev_realize_and_unref(DEVICE(cpu), NULL, &error_fatal);
>      *cpu_irqs =3D qemu_allocate_irqs(cpu_set_irq, cpu, MAX_PILS);
>      env->prom_addr =3D prom_addr;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index da6b30ec747..d76929c68c7 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -194,13 +194,6 @@ static void sparc_cpu_parse_features(const char
> *typename, char *features,
>      g_list_free_full(minus_features, g_free);
>  }
>
> -void cpu_sparc_set_id(CPUSPARCState *env, unsigned int cpu)
> -{
> -#if !defined(TARGET_SPARC64)
> -    env->mxccregs[7] =3D ((cpu + 8) & 0xf) << 24;
> -#endif
> -}
> -
>  static const sparc_def_t sparc_defs[] =3D {
>  #ifdef TARGET_SPARC64
>      {
> @@ -754,7 +747,7 @@ static void sparc_cpu_realizefn(DeviceState *dev,
> Error **errp)
>      env->nwindows =3D env->def.nwindows;
>  #if !defined(TARGET_SPARC64)
>      env->mmuregs[0] |=3D env->def.mmu_version;
> -    cpu_sparc_set_id(env, 0);
> +    env->mxccregs[7] =3D ((env->def.mxcc_cpuid + 8) & 0xf) << 24;
>      env->mxccregs[7] |=3D env->def.mxcc_version;
>  #else
>      env->mmu_version =3D env->def.mmu_version;
> @@ -843,6 +836,7 @@ static Property sparc_cpu_properties[] =3D {
>                           qdev_prop_uint64, target_ulong),
>      DEFINE_PROP_UINT32("fpu-version", SPARCCPU, env.def.fpu_version, 0),
>      DEFINE_PROP_UINT32("mmu-version", SPARCCPU, env.def.mmu_version, 0),
> +    DEFINE_PROP_UINT8("cpu-id", SPARCCPU, env.def.mxcc_cpuid, 0),
>      DEFINE_PROP("nwindows", SPARCCPU, env.def.nwindows,
>                  qdev_prop_nwindows, uint32_t),
>      DEFINE_PROP_END_OF_LIST()
> ---
>

