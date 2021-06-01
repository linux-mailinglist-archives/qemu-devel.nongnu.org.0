Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F889397232
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 13:14:59 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo2MM-0006u1-4f
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 07:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo2KU-0005WM-1D
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:13:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo2KQ-0000qM-0S
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 07:13:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id m18so7958696wmq.0
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 04:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ubh4RN1f16Dh6ssfdaUS5vs7rW1YdaZ8F7IES6ULrWk=;
 b=s+q+myXkVv1Lw2bMmJ4KlPDu9JeVInW51HIcMKSrti04vuMu6C37ww8obDpfKS6hyz
 3eEXX+2XkBUc5byhQ3qGJ3Eu6m5UCEc8/oOlnltnfpBJKYI8aixl2PdknuqoUFWOaSE0
 RperogX09BTjsPxx6IVi/ewYqYX+BGBE0azMxX6Wh/6xBkcdbh3yq3hmJiiAfGrSNl4p
 xTgAnCD8QYWUWmb4kFUj+0jZZMwnWWXWRvIJE+zMtlweGkNakWf855WgYSxtPHiW69SF
 FDQEr7hA0cltqde9C48U4OVkOd/O53mJFuQSTumgZlm1sLwFxQD2qRd950lqzgZgLQfq
 +mIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ubh4RN1f16Dh6ssfdaUS5vs7rW1YdaZ8F7IES6ULrWk=;
 b=DhPZukY1an/URXgn90PGcYNYM9jOrshBQTHYo4bZ5DpEIFpCiyhKfcqjqW8aGN2Wez
 7SrhUqEqwx1BiNVNDu3NpAJPlNjQdfORXdaV/F+0tPu+RWcl/Gou+UYVo31OjBk0eIdd
 VD8R8jkvL3COX0XuVK5wKYR+GeDJ2Ji/WZykkBEzz+Td3bUdfux749JkimSxcjMrvs8/
 mKpJMI/KgDQZbXI41zneIr/+ZXcVeloZa1Hp9qScM3Kau2k8qvjxS60IAyENAtmIV/UM
 NVVULasZLLrSJgPvBEaXqKejokAisLakl6LQulGAhPQRoHzaOZVMImPanwiXSpN7rOjR
 HDtQ==
X-Gm-Message-State: AOAM530VDUdUoef5ltpoYSitdbZXcyKhQpBH8hEHBakPHrk+KeExpEi8
 aEmzkbV9GO46AYtDO8MgV/XLmg==
X-Google-Smtp-Source: ABdhPJxDgUAM87EgPH7YZfkrPPB8tZvRr+xrHpvz497uvkEyTIzuOGrNnpLNgDrh++c/4edLMkbKiA==
X-Received: by 2002:a7b:c7ca:: with SMTP id z10mr27097713wmk.185.1622545975797; 
 Tue, 01 Jun 2021 04:12:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n13sm3149596wrg.75.2021.06.01.04.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 04:12:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B5BC1FF7E;
 Tue,  1 Jun 2021 12:12:53 +0100 (BST)
References: <20210529152203.40358-1-ma.mandourr@gmail.com>
 <20210529152203.40358-2-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH 1/3] plugins: Added a new cache modelling plugin
Date: Tue, 01 Jun 2021 10:53:08 +0100
In-reply-to: <20210529152203.40358-2-ma.mandourr@gmail.com>
Message-ID: <87a6o9deiy.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Added a cache modelling plugin that uses a static configuration used in
> many of the commercial microprocessors and uses random eviction policy.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/Makefile |   1 +
>  contrib/plugins/cache.c  | 398 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 399 insertions(+)
>  create mode 100644 contrib/plugins/cache.c
>
> diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> index b9d7935e5e..2237b47f8b 100644
> --- a/contrib/plugins/Makefile
> +++ b/contrib/plugins/Makefile
> @@ -18,6 +18,7 @@ NAMES +=3D hotpages
>  NAMES +=3D howvec
>  NAMES +=3D lockstep
>  NAMES +=3D hwprofile
> +NAMES +=3D cache
>=20=20
>  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
>=20=20
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> new file mode 100644
> index 0000000000..f8c15ebed2
> --- /dev/null
> +++ b/contrib/plugins/cache.c
> @@ -0,0 +1,398 @@
> +/*
> + * Copyright (C) 2021, Mahmoud Mandour <ma.mandourr@gmail.com>
> + *
> + * License: GNU GPL, version 2 or later.
> + *   See the COPYING file in the top-level directory.
> + */
> +
> +#include <inttypes.h>
> +#include <assert.h>
> +#include <stdlib.h>
> +#include <inttypes.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <stdio.h>
> +#include <glib.h>
> +
> +#include <qemu-plugin.h>
> +
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> +
> +static GRand *rng;
> +static GHashTable *dmiss_ht;
> +static GHashTable *imiss_ht;
> +
> +static GMutex dmtx, imtx;
> +
> +static int limit;
> +static bool sys;
> +
> +static uint64_t dmem_accesses;
> +static uint64_t dmisses;
> +
> +static uint64_t imem_accesses;
> +static uint64_t imisses;
> +
> +static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;
> +
> +enum AccessResult {
> +    HIT =3D 0,
> +    MISS =3D 1
> +};
> +
> +struct InsnData {
> +    char *disas_str;
> +    uint64_t addr;
> +    uint64_t misses;
> +};

A little commentary to the relationship between CacheSet and CacheBlock
would be useful here for those trying to follow the code. Maybe a little
ascii art if your up to it?

> +
> +struct CacheBlock {
> +    uint64_t tag;
> +    bool valid;
> +};
> +
> +struct CacheSet {
> +    struct CacheBlock *blocks;
> +};
> +
> +struct Cache {
> +    struct CacheSet *sets;
> +    int num_sets;
> +
> +    int cachesize;
> +    int blksize;
> +    int assoc;
> +
> +    uint64_t blk_mask;
> +    uint64_t set_mask;
> +    uint64_t tag_mask;
> +};
> +
> +struct Cache *dcache, *icache;
> +
> +static int pow_of_two(int num)
> +{
> +    g_assert((num & (num - 1)) =3D=3D 0);
> +    int ret =3D 0;
> +    while (num /=3D 2) {
> +        ret++;
> +    }
> +    return ret;
> +}

You could probably eliminate this by:

  a) pre-calculating masks and shifts at start-up
  b) expressing cache-size as a power of 2 (are caches ever not?)

Currently it is by far the biggest hit on the CPU:

  46.42%  qemu-aarch64  libcache.so              [.] pow_of_two
  16.71%  qemu-aarch64  libcache.so              [.] lru_update_on_hit
  14.12%  qemu-aarch64  libcache.so              [.] in_cache
   6.73%  qemu-aarch64  libcache.so              [.] extract_tag
   4.52%  qemu-aarch64  libcache.so              [.] extract_set
   4.48%  qemu-aarch64  libcache.so              [.] access_cache
   2.34%  qemu-aarch64  libcache.so              [.] vcpu_insn_exec
   1.63%  qemu-aarch64  libcache.so              [.] vcpu_mem_access
   0.72%  qemu-aarch64  libglib-2.0.so.0.5800.3  [.] g_mutex_lock

> +static inline uint64_t extract_tag(struct Cache *cache, uint64_t addr)
> +{
> +    return (addr & cache->tag_mask) >>
> +        (pow_of_two(cache->num_sets) + pow_of_two(cache->blksize));
> +}
> +
> +static inline uint64_t extract_set(struct Cache *cache, uint64_t addr)
> +{
> +    return (addr & cache->set_mask) >> (pow_of_two(cache->blksize));
> +}

It would make sense to enforce pow_of_two for num_sets and blksize on
initialisation to avoid doing it for every tag. Maybe rename them to
set_shift and blksize_shift to better indicate their usage.

> +
> +static struct Cache *cache_init(int blksize, int assoc, int cachesize)
> +{
> +    struct Cache *cache;
> +    int i;
> +
> +    cache =3D g_new(struct Cache, 1);
> +    cache->blksize =3D blksize;
> +    cache->assoc =3D assoc;
> +    cache->cachesize =3D cachesize;
> +    cache->num_sets =3D cachesize / (blksize * assoc);
> +    cache->sets =3D g_new(struct CacheSet, cache->num_sets);
> +
> +    for (i =3D 0; i < cache->num_sets; i++) {
> +        cache->sets[i].blocks =3D g_new0(struct CacheBlock, assoc);
> +    }
> +
> +    cache->blk_mask =3D blksize - 1;
> +    cache->set_mask =3D ((cache->num_sets - 1) << (pow_of_two(cache->blk=
size)));
> +    cache->tag_mask =3D ~(cache->set_mask | cache->blk_mask);
> +
> +    return cache;
> +}
> +
> +static int get_invalid_block(struct Cache *cache, uint64_t set)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < cache->assoc; i++) {
> +        if (!cache->sets[set].blocks[i].valid) {
> +            /* conflict miss */
> +            return i;
> +        }
> +    }
> +
> +    /* compulsary miss */
> +    return -1;
> +}
> +
> +static int get_replaced_block(struct Cache *cache)
> +{
> +    return g_rand_int_range(rng, 0, cache->assoc);
> +}
> +
> +static bool in_cache(struct Cache *cache, uint64_t addr)
> +{
> +    int i;
> +    uint64_t tag, set;
> +
> +    tag =3D extract_tag(cache, addr);
> +    set =3D extract_set(cache, addr);
> +
> +    for (i =3D 0; i < cache->assoc; i++) {
> +        if (cache->sets[set].blocks[i].tag =3D=3D tag &&
> +                cache->sets[set].blocks[i].valid) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static enum AccessResult access_cache(struct Cache *cache, uint64_t
> addr)

Does the enum really make things easier compared to a straight bool? You
could just explain things with a comment:

  /**
   * access_cache() - simulate a cache access
   * @cache: reference to the cache being used
   * @addr: address of cached entity
   *
   * Returns true if the cache hit, false otherwise and the cache is
   * updated for next time.
   */
  static bool access_cache(struct Cache *cache, uint64_t addr)
  {

And then have:

  if (!access_cache(icache, addr)) {
      struct InsnData *insn =3D get_or_create(imiss_ht, userdata, addr);
      insn->misses++;
      imisses++;
  }


> +{
> +    uint64_t tag, set;
> +    int replaced_blk;
> +
> +    if (in_cache(cache, addr)) {
> +        return HIT;
> +    }
> +
> +    tag =3D extract_tag(cache, addr);
> +    set =3D extract_set(cache, addr);
> +
> +    replaced_blk =3D get_invalid_block(cache, set);
> +
> +    if (replaced_blk =3D=3D -1) {
> +        replaced_blk =3D get_replaced_block(cache);
> +    }
> +
> +    cache->sets[set].blocks[replaced_blk].tag =3D tag;
> +    cache->sets[set].blocks[replaced_blk].valid =3D true;
> +
> +    return MISS;
> +}
> +
> +struct InsnData *get_or_create(GHashTable *ht, struct InsnData *insn_dat=
a,
> +                               uint64_t addr)
> +{
> +    struct InsnData *insn =3D g_hash_table_lookup(ht, GUINT_TO_POINTER(a=
ddr));
> +    if (!insn) {
> +        g_hash_table_insert(ht, GUINT_TO_POINTER(addr), (gpointer) insn_=
data);
> +        insn =3D insn_data;
> +    }
> +
> +    return insn;
> +}
> +
> +static void vcpu_mem_access(unsigned int cpu_index, qemu_plugin_meminfo_=
t info,
> +                            uint64_t vaddr, void *userdata)
> +{
> +    uint64_t insn_addr;
> +    uint64_t effective_addr;
> +    struct qemu_plugin_hwaddr *hwaddr;
> +
> +    g_mutex_lock(&dmtx);
> +    hwaddr =3D qemu_plugin_get_hwaddr(info, vaddr);
> +    if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
> +        g_free(userdata);
> +        return;
> +    }
> +
> +    insn_addr =3D ((struct InsnData *) userdata)->addr;
> +    effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : v=
addr;
> +
> +    if (access_cache(dcache, effective_addr) =3D=3D MISS) {
> +        struct InsnData *insn =3D get_or_create(dmiss_ht, userdata, insn=
_addr);
> +        insn->misses++;
> +        dmisses++;
> +    }
> +    dmem_accesses++;
> +    g_mutex_unlock(&dmtx);
> +}
> +
> +static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
> +{
> +    uint64_t addr;
> +
> +    g_mutex_lock(&imtx);
> +    addr =3D ((struct InsnData *) userdata)->addr;
> +
> +    if (access_cache(icache, addr) =3D=3D MISS) {
> +        struct InsnData *insn =3D get_or_create(imiss_ht, userdata, addr=
);
> +        insn->misses++;
> +        imisses++;
> +    }
> +    imem_accesses++;
> +    g_mutex_unlock(&imtx);
> +}
> +
> +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
> +{
> +    size_t n_insns;
> +    size_t i;
> +
> +    n_insns =3D qemu_plugin_tb_n_insns(tb);
> +    for (i =3D 0; i < n_insns; i++) {
> +        struct qemu_plugin_insn *insn =3D qemu_plugin_tb_get_insn(tb, i);
> +        uint64_t effective_addr;
> +
> +        if (sys) {
> +            effective_addr =3D (uint64_t) qemu_plugin_insn_haddr(insn);
> +        } else {
> +            effective_addr =3D (uint64_t) qemu_plugin_insn_vaddr(insn);
> +        }
> +
> +        struct InsnData *ddata =3D g_new(struct InsnData, 1);
> +        struct InsnData *idata =3D g_new(struct InsnData, 1);

OK I think I see what you where saying on the sync up earlier. You need
to take into account any given instruction may get translated multiple
times so I think for any given instruction you are tracking you want to
get or create an entry here.

> +
> +        ddata->disas_str =3D qemu_plugin_insn_disas(insn);
> +        ddata->misses =3D 0;
> +        ddata->addr =3D effective_addr;
> +
> +        idata->disas_str =3D g_strdup(ddata->disas_str);
> +        idata->misses =3D 0;
> +        idata->addr =3D effective_addr;

And you might as well combine the InsnData to track both data and icache
misses in one structure to avoid the duplication of records and strings.

> +
> +        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem_access,
> +                                         QEMU_PLUGIN_CB_NO_REGS,
> +                                         rw, ddata);
> +
> +        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
> +                                               QEMU_PLUGIN_CB_NO_REGS, i=
data);
> +    }
> +}
> +
> +static void print_entry(gpointer data)
> +{
> +    struct InsnData *insn =3D (struct InsnData *) data;
> +    g_autoptr(GString) xx =3D g_string_new("");
> +    g_string_append_printf(xx, "0x%" PRIx64 ": %s - misses: %lu\n",
> +            insn->addr, insn->disas_str, insn->misses);

As you are likely going to want to post-process this data I would
suggest a slightly more machine readable format:

  address, misses, instruction
  0x419298, 2, mov x0, x21
  0x41aa40, 2, add x0, x0, #0x17
  0x419640, 2,  add x5, x4, #0x218
  0x41aa10, 2,  adrp x1, #0x48b000
  0x4002d0, 2,  adrp x16, #0x48b000

> +    qemu_plugin_outs(xx->str);
> +}
> +
> +static void free_insn(gpointer data)
> +{
> +    struct InsnData *insn =3D (struct InsnData *) data;
> +    g_free(insn->disas_str);
> +    g_free(insn);
> +}
> +
> +static void free_cache(struct Cache *cache)
> +{
> +    for (int i =3D 0; i < cache->num_sets; i++) {
> +        g_free(cache->sets[i].blocks);
> +    }
> +
> +    g_free(cache->sets);
> +}
> +
> +static int cmp(gconstpointer a, gconstpointer b)

This will likely need renaming if you ever want to sort by different
things.

> +{
> +    struct InsnData *insn_a =3D (struct InsnData *) a;
> +    struct InsnData *insn_b =3D (struct InsnData *) b;
> +
> +    return insn_a->misses < insn_b->misses ? 1 : -1;
> +}
> +
> +static void print_stats()
> +{
> +    g_autoptr(GString) rep =3D g_string_new("");
> +    g_string_append_printf(rep,
> +            "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
> +            dmem_accesses,
> +            dmisses,
> +            ((double)dmisses / dmem_accesses) * 100.0);
> +
> +    g_string_append_printf(rep,
> +            "Instruction accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\=
n",
> +            imem_accesses,
> +            imisses,
> +            ((double)imisses / imem_accesses) * 100.0);
> +
> +    qemu_plugin_outs(rep->str);
> +}
> +
> +static void plugin_exit()
> +{
> +    GList *curr;
> +    int i;
> +
> +    g_mutex_lock(&imtx);
> +    g_mutex_lock(&dmtx);
> +    GList *dmiss_insns =3D g_hash_table_get_values(dmiss_ht);
> +    GList *imiss_insns =3D g_hash_table_get_values(imiss_ht);
> +    dmiss_insns =3D g_list_sort(dmiss_insns, cmp);
> +    imiss_insns =3D g_list_sort(imiss_insns, cmp);
> +
> +    print_stats();
> +
> +    qemu_plugin_outs("Most data-missing instructions\n");
> +    for (curr =3D dmiss_insns, i =3D 0; curr && i < limit; i++, curr =3D=
 curr->next) {
> +        print_entry(curr->data);
> +    }
> +
> +    qemu_plugin_outs("\nMost fetch-missing instructions\n");
> +    for (curr =3D imiss_insns, i =3D 0; curr && i < limit; i++, curr =3D=
 curr->next) {
> +        print_entry(curr->data);
> +    }
> +
> +    free_cache(dcache);
> +    free_cache(icache);
> +
> +    g_list_free(dmiss_insns);
> +    g_list_free(imiss_insns);
> +
> +    g_hash_table_destroy(dmiss_ht);
> +    g_hash_table_destroy(imiss_ht);
> +
> +    g_mutex_unlock(&dmtx);
> +    g_mutex_unlock(&imtx);
> +}
> +
> +QEMU_PLUGIN_EXPORT
> +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
> +                        int argc, char **argv)
> +{
> +    int i;
> +    int iassoc, iblksize, icachesize;
> +    int dassoc, dblksize, dcachesize;
> +
> +    limit =3D 32;
> +    sys =3D info->system_emulation;
> +
> +    dassoc =3D 8;
> +    dblksize =3D 64;
> +    dcachesize =3D dblksize * dassoc * 32;
> +
> +    iassoc =3D 8;
> +    iblksize =3D 64;
> +    icachesize =3D iblksize * iassoc * 32;
> +
> +    rng =3D g_rand_new();
> +
> +    for (i =3D 0; i < argc; i++) {
> +        char *opt =3D argv[i];
> +        if (g_str_has_prefix(opt, "limit=3D")) {
> +            limit =3D g_ascii_strtoull(opt + 6, NULL, 10);
> +        } else {
> +            fprintf(stderr, "option parsing failed: %s\n", opt);
> +            return -1;
> +        }
> +    }
> +
> +    dcache =3D cache_init(dblksize, dassoc, dcachesize);
> +    icache =3D cache_init(iblksize, iassoc, icachesize);
> +
> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> +
> +    dmiss_ht =3D g_hash_table_new_full(NULL, g_direct_equal, NULL, free_=
insn);
> +    imiss_ht =3D g_hash_table_new_full(NULL, g_direct_equal, NULL, free_=
insn);
> +
> +    return 0;
> +}


--=20
Alex Benn=C3=A9e

