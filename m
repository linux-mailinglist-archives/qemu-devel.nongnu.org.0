Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2153CD2FC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 13:08:01 +0200 (CEST)
Received: from localhost ([::1]:49568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5R7w-0002j0-58
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 07:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5R5h-0001Ki-TC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:05:42 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5R5f-0000Fs-MM
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 07:05:41 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso10136011wme.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LVnhxpsDgzcF9hXtaQQUSz94o0ActfIFodZCZf9hpqg=;
 b=Lsk8ApDAtnzjSyto+vnbZi6fZoS8hjUBo5YOK8mje2KzkYSamCttyMsVouaaB7qNNW
 Cosoe/nG87jGwJNAnILHc9xYnGRalAQfMLbTwIGT+HIurtPn7EiIc8Q5Y9SPrOh/X+pO
 7n0dVJlDcuFU27dNI7B+Ooztz5kG0W2mQ7gHRS/Jrbexu7lS4RdOwb2DgQQZxSVsMX50
 TC1BetT5NrqZ2DRIQ9N4U87ANs+Wlta5ncafoZZ+bYCm8XVR0sMWpmLrRZSsB3yHtqjQ
 jhh9VSNG1sugbELlGF90EAMGrDmz3J4gKiSHEMph4IfhBDD97Sh+J5gOWMs8zKqrrFbQ
 68+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LVnhxpsDgzcF9hXtaQQUSz94o0ActfIFodZCZf9hpqg=;
 b=IsBQATZ/xt0B7OoRZpLeSnBPDKb1Rh/OinOezSFK4MSpRaXEvGGdAvHDOLk/CmeidU
 sdWvTm6c29P/eV9NsK126ncQnpjsOnJ6s2UkQnw9ed4SqrNmV/CJBlINXj/ZGLZaJ5xs
 PJzInffBy2rzKwnKgvl8kx+mEZ36OirnnmW+9bUamy/2fAXQzPwdXtJrkJvM2TW/HH2L
 xfceB5UJXOjSul0yS8Nuk1GpQjgDjctxC1ZJUy4mJkwv5MGo59yVmCVtPVQb/aZtwF85
 sryPnTsGmSZNDHl29A8xXQwN+xvp7oDlFPQ/rDdPBsLqtzRnQn7ymUEBPaTqbXQ/CE1A
 BxUA==
X-Gm-Message-State: AOAM53137tvQT7BwFqg5Uf8fzGcN81YOwD5b/Pm6JHQJ9YYXE5vmsWwp
 x5u7S+0+AXZDVjKEUJu78NAJzg==
X-Google-Smtp-Source: ABdhPJwN/enlM0c1UBzN6kWQj0zAGoOlgtYlIlmEKaZIh2irqovgM/kX46I7Ynh1JYigMPUCk3cL4g==
X-Received: by 2002:a1c:ed10:: with SMTP id l16mr31169184wmh.8.1626692738008; 
 Mon, 19 Jul 2021 04:05:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm19700986wru.65.2021.07.19.04.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 04:05:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6629E1FF7E;
 Mon, 19 Jul 2021 12:05:35 +0100 (BST)
References: <20210714172151.8494-1-ma.mandourr@gmail.com>
 <20210714172151.8494-5-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 4/6] plugins/cache: Supported multicore cache modelling
Date: Mon, 19 Jul 2021 11:52:21 +0100
In-reply-to: <20210714172151.8494-5-ma.mandourr@gmail.com>
Message-ID: <87wnpmpnr4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Multicore L1 cache modelling is introduced and is supported for both
> full system emulation and linux-user.
>
> For full-system emulation, L1 icache and dcache are maintained for each
> available core, since this information is exposed to the plugin through
> `qemu_plugin_n_vcpus()`.
>
> For linux-user, a static number of cores is assumed (default 1 core, and
> can be provided as a plugin argument `cores=3DN`). Every memory access
> goes through one of these caches, this approach is taken as it's
> somewhat akin to what happens on real setup, where a program that
> dispatches more threads than the available cores, they'll thrash
> each other
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 156 ++++++++++++++++++++++++++++++----------
>  1 file changed, 117 insertions(+), 39 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index a452aba01c..60f7be208b 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -23,11 +23,6 @@ static GRand *rng;
>  static int limit;
>  static bool sys;
>=20=20
> -static uint64_t dmem_accesses;
> -static uint64_t dmisses;
> -
> -static uint64_t imem_accesses;
> -static uint64_t imisses;
>=20=20
>  enum EvictionPolicy {
>      LRU,
> @@ -90,13 +85,22 @@ typedef struct {
>      uint64_t imisses;
>  } InsnData;
>=20=20
> +typedef struct {
> +    uint64_t dmem_accesses;
> +    uint64_t dmisses;
> +    uint64_t imem_accesses;
> +    uint64_t imisses;
> +} CoreStats;
> +
>  void (*update_hit)(Cache *cache, int set, int blk);
>  void (*update_miss)(Cache *cache, int set, int blk);
>=20=20
>  void (*metadata_init)(Cache *cache);
>  void (*metadata_destroy)(Cache *cache);
>=20=20
> -Cache *dcache, *icache;
> +static int cores;
> +CoreStats *stats;
> +Cache **dcaches, **icaches;
>=20=20
>  static int pow_of_two(int num)
>  {
> @@ -233,10 +237,6 @@ static bool bad_cache_params(int blksize, int assoc,=
 int cachesize)
>=20=20
>  static Cache *cache_init(int blksize, int assoc, int cachesize)
>  {
> -    if (bad_cache_params(blksize, assoc, cachesize)) {
> -        return NULL;
> -    }
> -
>      Cache *cache;
>      int i;
>      uint64_t blk_mask;
> @@ -263,6 +263,24 @@ static Cache *cache_init(int blksize, int assoc, int=
 cachesize)
>      return cache;
>  }
>=20=20
> +static Cache **caches_init(int blksize, int assoc, int cachesize)
> +{
> +    Cache **caches;
> +    int i;
> +
> +    if (bad_cache_params(blksize, assoc, cachesize)) {
> +        return NULL;
> +    }
> +
> +    caches =3D g_new(Cache *, cores);
> +
> +    for (i =3D 0; i < cores; i++) {
> +        caches[i] =3D cache_init(blksize, assoc, cachesize);
> +    }
> +
> +    return caches;
> +}
> +
>  static int get_invalid_block(Cache *cache, uint64_t set)
>  {
>      int i;
> @@ -353,6 +371,7 @@ static void vcpu_mem_access(unsigned int vcpu_index, =
qemu_plugin_meminfo_t info,
>  {
>      uint64_t effective_addr;
>      struct qemu_plugin_hwaddr *hwaddr;
> +    int cache_idx;
>      InsnData *insn;
>=20=20
>      hwaddr =3D qemu_plugin_get_hwaddr(info, vaddr);
> @@ -363,17 +382,24 @@ static void vcpu_mem_access(unsigned int vcpu_index=
, qemu_plugin_meminfo_t info,
>      effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : v=
addr;
>=20=20
>      g_mutex_lock(&mtx);
> -    if (dcache =3D=3D NULL) {
> +    cache_idx =3D vcpu_index % cores;
> +    if (dcaches[cache_idx] =3D=3D NULL) {
>          g_mutex_unlock(&mtx);
>          return;
>      }

I was hoping we could avoid this with some careful atomic/memory barrier
use given dcaches is setup on init. However it's the exit case that gets
us which further increases my desire to fix the exit race in linux-user
and make sure callbacks don't occur in this case.

>=20=20
> -    if (!access_cache(dcache, effective_addr)) {
> +    if (!access_cache(dcaches[cache_idx], effective_addr)) {
>          insn =3D (InsnData *) userdata;
>          insn->dmisses++;
> -        dmisses++;
> +        if (cores > 1) {
> +            stats[cores].dmisses++;
> +        }
> +        stats[cache_idx].dmisses++;
> +    }
> +    if (cores > 1) {
> +        stats[cores].dmem_accesses++;
>      }
> -    dmem_accesses++;
> +    stats[cache_idx].dmem_accesses++;
>      g_mutex_unlock(&mtx);
>  }
>=20=20
> @@ -381,21 +407,29 @@ static void vcpu_insn_exec(unsigned int vcpu_index,=
 void *userdata)
>  {
>      uint64_t insn_addr;
>      InsnData *insn;
> +    uint64_t cache_idx;
>=20=20
>      g_mutex_lock(&mtx);
>      insn_addr =3D ((InsnData *) userdata)->addr;
>=20=20
> -    if (icache =3D=3D NULL) {
> +    cache_idx =3D vcpu_index % cores;
> +    if (icaches[cache_idx] =3D=3D NULL) {
>          g_mutex_unlock(&mtx);
>          return;
>      }
>=20=20
> -    if (!access_cache(icache, insn_addr)) {
> +    if (!access_cache(icaches[cache_idx], insn_addr)) {
>          insn =3D (InsnData *) userdata;
>          insn->imisses++;
> -        imisses++;
> +        if (cores > 1) {
> +            stats[cores].imisses++;
> +        }
> +        stats[cache_idx].imisses++;
>      }
> -    imem_accesses++;
> +    if (cores > 1) {
> +        stats[cores].imem_accesses++;
> +    }

I'd much rather avoid summing the stats during execution than at the end
when we can add things simply.

> +    stats[cache_idx].imem_accesses++;
>      g_mutex_unlock(&mtx);
>  }
>=20=20
> @@ -475,6 +509,22 @@ static void cache_free(Cache *cache)
>      g_free(cache);
>  }
>=20=20
> +/*
> + * caches_free(): free an array of Cache structs.
> + * @caches: caches to free
> + *
> + * Calling cache_free for each cache in @caches, and then NULL-ify them =
so that
> + * we mark them as freed, other async callbacks can check to see whether=
 a cache
> + * is freed already or not by checking against NULL.
> + */
> +static void caches_free(Cache **caches)
> +{
> +    for (int i =3D 0; i < cores; i++) {
> +        cache_free(caches[i]);
> +        caches[i] =3D NULL;
> +    }
> +}
> +
>  static int dcmp(gconstpointer a, gconstpointer b)
>  {
>      InsnData *insn_a =3D (InsnData *) a;
> @@ -493,19 +543,38 @@ static int icmp(gconstpointer a, gconstpointer b)
>=20=20
>  static void log_stats()
>  {
> -    g_autoptr(GString) rep =3D g_string_new("");
> -    g_string_append_printf(rep,
> -        "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
> -        dmem_accesses,
> -        dmisses,
> -        ((double) dmisses / (double) dmem_accesses) * 100.0);
> -
> -    g_string_append_printf(rep,
> -        "Instruction accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
> -        imem_accesses,
> -        imisses,
> -        ((double) imisses / (double) imem_accesses) * 100.0);
> +    int i, iters;
> +    CoreStats cs;
> +    double dmiss_rate, imiss_rate;
> +
> +    g_autoptr(GString) rep =3D g_string_new("core #, data accesses, data=
 misses,"
> +                                          " dmiss rate, insn accesses,"
> +                                          " insn misses, imiss rate\n");
> +
> +    /* Only iterate and print a sum row if cores > 1 */
> +    iters =3D cores =3D=3D 1 ? 1 : cores + 1;
> +    for (i =3D 0; i < iters; i++) {
> +        cs =3D stats[i];
> +        dmiss_rate =3D ((double) cs.dmisses) / (cs.dmem_accesses) * 100.=
0;
> +        imiss_rate =3D ((double) cs.imisses) / (cs.imem_accesses) * 100.=
0;
> +
> +        if (i =3D=3D cores) {
> +            g_string_append_printf(rep, "%-8s", "sum");
> +        } else {
> +            g_string_append_printf(rep, "%-8d", i);
> +        }
> +
> +        g_string_append_printf(rep, "%-14lu %-12lu %9.4lf%%  %-14lu %-12=
lu"
> +                               " %9.4lf%%\n",
> +                               cs.dmem_accesses,
> +                               cs.dmisses,
> +                               cs.dmem_accesses ? dmiss_rate : 0.0,
> +                               cs.imem_accesses,
> +                               cs.imisses,
> +                               cs.imem_accesses ? imiss_rate : 0.0);
> +    }
>=20=20
> +    g_string_append(rep, "\n");
>      qemu_plugin_outs(rep->str);
>  }
>=20=20
> @@ -553,15 +622,14 @@ static void plugin_exit(qemu_plugin_id_t id, void *=
p)
>      log_stats();
>      log_top_insns();
>=20=20
> -    cache_free(dcache);
> -    dcache =3D NULL;
> -
> -    cache_free(icache);
> -    icache =3D NULL;
> +    caches_free(dcaches);
> +    caches_free(icaches);
>=20=20
>      g_hash_table_destroy(miss_ht);
>      miss_ht =3D NULL;
>=20=20
> +    g_free(stats);
> +
>      g_mutex_unlock(&mtx);
>  }
>=20=20
> @@ -608,6 +676,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qe=
mu_info_t *info,
>=20=20
>      policy =3D LRU;
>=20=20
> +    cores =3D sys ? qemu_plugin_n_vcpus() : 1;
> +
>      for (i =3D 0; i < argc; i++) {
>          char *opt =3D argv[i];
>          if (g_str_has_prefix(opt, "iblksize=3D")) {
> @@ -624,6 +694,8 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qe=
mu_info_t *info,
>              dcachesize =3D g_ascii_strtoll(opt + 11, NULL, 10);
>          } else if (g_str_has_prefix(opt, "limit=3D")) {
>              limit =3D g_ascii_strtoll(opt + 6, NULL, 10);
> +        } else if (g_str_has_prefix(opt, "cores=3D")) {
> +            cores =3D g_ascii_strtoll(opt + 6, NULL, 10);
>          } else if (g_str_has_prefix(opt, "evict=3D")) {
>              gchar *p =3D opt + 6;
>              if (g_strcmp0(p, "rand") =3D=3D 0) {
> @@ -644,22 +716,28 @@ int qemu_plugin_install(qemu_plugin_id_t id, const =
qemu_info_t *info,
>=20=20
>      policy_init();
>=20=20
> -    dcache =3D cache_init(dblksize, dassoc, dcachesize);
> -    if (!dcache) {
> +    dcaches =3D caches_init(dblksize, dassoc, dcachesize);
> +    if (!dcaches) {
>          const char *err =3D cache_config_error(dblksize, dassoc, dcaches=
ize);
>          fprintf(stderr, "dcache cannot be constructed from given paramet=
ers\n");
>          fprintf(stderr, "%s\n", err);
>          return -1;
>      }
>=20=20
> -    icache =3D cache_init(iblksize, iassoc, icachesize);
> -    if (!icache) {
> +    icaches =3D caches_init(iblksize, iassoc, icachesize);
> +    if (!icaches) {
>          const char *err =3D cache_config_error(iblksize, iassoc, icaches=
ize);
>          fprintf(stderr, "icache cannot be constructed from given paramet=
ers\n");
>          fprintf(stderr, "%s\n", err);
>          return -1;
>      }
>=20=20
> +    /*
> +     * plus one to save the sum in. If only one core is used then no nee=
d to
> +     * get an auxiliary struct.
> +     */
> +    stats =3D g_new0(CoreStats, cores =3D=3D 1 ? 1 : cores + 1);
> +

See above, lets keep the sum as a post processing step.

>      qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
>      qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);


--=20
Alex Benn=C3=A9e

