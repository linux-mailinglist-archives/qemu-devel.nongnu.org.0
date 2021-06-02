Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA9397F5C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:15:29 +0200 (CEST)
Received: from localhost ([::1]:52976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHLr-0002Fh-Nd
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loHL1-0001ag-U3
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:14:35 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:36423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loHKy-0003zG-Sm
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:14:35 -0400
Received: by mail-il1-x129.google.com with SMTP id e7so814827ils.3
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 20:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=28ilPKvvvlZUuJOKViUxqOAD/2K0jfbeTdKoqj+aaVI=;
 b=RjI3O1/d+CH9fzpT3iO7ImIf507/1HqF53we9D09kNFOOuulsygEtsI7UY0pqwrK7g
 2C/DbCyZEHt9NIsBwm8btTcZoDaC94OqilFQKlqMCQlRnSNsGAYFWMXoUpBAJU0eqlzF
 77CbL6cI4tU+hJPzfBssklg4oagMSToiK2U0jnwsEOw+/M/t2hP0GM5dS34fvz5hfDgr
 TzUFFCFlYtZQ3PsEWHlTs8jRz1ZeqBzJL+YwZmhFuPrQ6lqS/oeRrWKEGprB12BHQddC
 j/gmedA0OcSAW9fEhuo87zlIbGm9G9qjONblQ242KOTC8/XNcnWpu3jaGNE4QMqo3E5E
 3OyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=28ilPKvvvlZUuJOKViUxqOAD/2K0jfbeTdKoqj+aaVI=;
 b=Utx04DMlQXkHSXIYQxKyfyld7nVxrPMLRtcfyCoZQx0wdNS5k1CDwDplA+3E1ZLE9x
 /gyT6gNmDlqrrds9YfoCLymkpkf/hqfMYG5hzn0CPvLfgJtFBxucre9QqOOv/6yr5FSU
 vGZT2aGu9+HrAyAK1zrVmQ+ZjENlsX7zEmSWr1IE4Wfq3KLuNMvG0Uo9rPjbzffZpWWj
 yw5JiK2W1Bqpm2hmzEwVJ/+SOzOLD/nYKDkUNJ3K36EqvNcAu5thSMptTFo21B4m0aV+
 ySSvnipr6i1LNshajl2h/80B71ygPVJ9vS6//x1vtmlSvvc146ARgXpiUi5ea0CdGSlN
 9NBg==
X-Gm-Message-State: AOAM5338O2mnYsaZ3vV7bSztIYJ28GeNjJo+/rsR0OeMvCVzLd5X/eo7
 yHTnwUe2VmzPHYJnt49//kfxG8u7/1XSJUOj9ORUdiamY1/Jdg==
X-Google-Smtp-Source: ABdhPJyH7Tj/NBIVg9RH9zTxdhQrhm5y3ShRWgaNmkbPIsclb3i8QXw9o8gGdQW571gKcghoI33EJNgtBc+iLgmwgo4=
X-Received: by 2002:a05:6e02:1311:: with SMTP id
 g17mr3369978ilr.191.1622603671148; 
 Tue, 01 Jun 2021 20:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <20210530063712.6832-2-ma.mandourr@gmail.com>
In-Reply-To: <20210530063712.6832-2-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 2 Jun 2021 05:14:19 +0200
Message-ID: <CAD-LL6iVv2DZ0BrsSjMMSpcBJWH-LYZom8vexy9s+uS+A4HEgw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] plugins: Added a new cache modelling plugin
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006e1dcf05c3bfdbbb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006e1dcf05c3bfdbbb
Content-Type: text/plain; charset="UTF-8"

On Sun, May 30, 2021 at 8:37 AM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

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
> @@ -18,6 +18,7 @@ NAMES += hotpages
>  NAMES += howvec
>  NAMES += lockstep
>  NAMES += hwprofile
> +NAMES += cache
>
>  SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> new file mode 100644
> index 0000000000..8c9d1dd538
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
> +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
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
> +static enum qemu_plugin_mem_rw rw = QEMU_PLUGIN_MEM_RW;
> +
> +enum AccessResult {
> +    HIT = 0,
> +    MISS = 1
> +};
> +
> +struct InsnData {
> +    char *disas_str;
> +    uint64_t addr;
> +    uint64_t misses;
> +};
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
> +    g_assert((num & (num - 1)) == 0);
> +    int ret = 0;
> +    while (num /= 2) {
> +        ret++;
> +    }
> +    return ret;
> +}
> +
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
> +
> +static struct Cache *cache_init(int blksize, int assoc, int cachesize)
> +{
> +    struct Cache *cache;
> +    int i;
> +
> +    cache = g_new(struct Cache, 1);
> +    cache->blksize = blksize;
> +    cache->assoc = assoc;
> +    cache->cachesize = cachesize;
> +    cache->num_sets = cachesize / (blksize * assoc);
> +    cache->sets = g_new(struct CacheSet, cache->num_sets);
> +
> +    for (i = 0; i < cache->num_sets; i++) {
> +        cache->sets[i].blocks = g_new0(struct CacheBlock, assoc);
> +    }
> +
> +    cache->blk_mask = blksize - 1;
> +    cache->set_mask = ((cache->num_sets - 1) <<
> (pow_of_two(cache->blksize)));
> +    cache->tag_mask = ~(cache->set_mask | cache->blk_mask);
> +
> +    return cache;
> +}
> +
> +static int get_invalid_block(struct Cache *cache, uint64_t set)
> +{
> +    int i;
> +
> +    for (i = 0; i < cache->assoc; i++) {
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
> +    tag = extract_tag(cache, addr);
> +    set = extract_set(cache, addr);
> +
> +    for (i = 0; i < cache->assoc; i++) {
> +        if (cache->sets[set].blocks[i].tag == tag &&
> +                cache->sets[set].blocks[i].valid) {
> +            return true;
> +        }
> +    }
> +
> +    return false;
> +}
> +
> +static enum AccessResult access_cache(struct Cache *cache, uint64_t addr)
> +{
> +    uint64_t tag, set;
> +    int replaced_blk;
> +
> +    if (in_cache(cache, addr)) {
> +        return HIT;
> +    }
> +
> +    tag = extract_tag(cache, addr);
> +    set = extract_set(cache, addr);
> +
> +    replaced_blk = get_invalid_block(cache, set);
> +
> +    if (replaced_blk == -1) {
> +        replaced_blk = get_replaced_block(cache);
> +    }
> +
> +    cache->sets[set].blocks[replaced_blk].tag = tag;
> +    cache->sets[set].blocks[replaced_blk].valid = true;
> +
> +    return MISS;
> +}
> +
> +struct InsnData *get_or_create(GHashTable *ht, struct InsnData *insn_data,
> +                               uint64_t addr)
> +{
> +    struct InsnData *insn = g_hash_table_lookup(ht,
> GUINT_TO_POINTER(addr));
> +    if (!insn) {
> +        g_hash_table_insert(ht, GUINT_TO_POINTER(addr), (gpointer)
> insn_data);
> +        insn = insn_data;
> +    }
> +
> +    return insn;
> +}
> +
> +static void vcpu_mem_access(unsigned int cpu_index, qemu_plugin_meminfo_t
> info,
> +                            uint64_t vaddr, void *userdata)
> +{
> +    uint64_t insn_addr;
> +    uint64_t effective_addr;
> +    struct qemu_plugin_hwaddr *hwaddr;
> +
> +    g_mutex_lock(&dmtx);
> +    hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
> +    if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
> +        g_mutex_unlock(&dmtx);
> +        return;
> +    }
> +
> +    insn_addr = ((struct InsnData *) userdata)->addr;
> +    effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) :
> vaddr;
> +
> +    if (access_cache(dcache, effective_addr) == MISS) {
> +        struct InsnData *insn = get_or_create(dmiss_ht, userdata,
> insn_addr);
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
> +    addr = ((struct InsnData *) userdata)->addr;
> +
> +    if (access_cache(icache, addr) == MISS) {
> +        struct InsnData *insn = get_or_create(imiss_ht, userdata, addr);
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
> +    n_insns = qemu_plugin_tb_n_insns(tb);
> +    for (i = 0; i < n_insns; i++) {
> +        struct qemu_plugin_insn *insn = qemu_plugin_tb_get_insn(tb, i);
> +        uint64_t effective_addr;
> +
> +        if (sys) {
> +            effective_addr = (uint64_t) qemu_plugin_insn_haddr(insn);
> +        } else {
> +            effective_addr = (uint64_t) qemu_plugin_insn_vaddr(insn);
> +        }
> +
> +        struct InsnData *ddata = g_new(struct InsnData, 1);
> +        struct InsnData *idata = g_new(struct InsnData, 1);
> +
> +        ddata->disas_str = qemu_plugin_insn_disas(insn);
> +        ddata->misses = 0;
> +        ddata->addr = effective_addr;
> +
> +        idata->disas_str = g_strdup(ddata->disas_str);
> +        idata->misses = 0;
> +        idata->addr = effective_addr;
> +
> +        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem_access,
> +                                         QEMU_PLUGIN_CB_NO_REGS,
> +                                         rw, ddata);
> +
> +        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
> +                                               QEMU_PLUGIN_CB_NO_REGS,
> idata);
> +    }
> +}
> +
> +static void print_entry(gpointer data)
> +{
> +    struct InsnData *insn = (struct InsnData *) data;
> +    g_autoptr(GString) xx = g_string_new("");
> +    g_string_append_printf(xx, "0x%" PRIx64 ": %s - misses: %lu\n",
> +            insn->addr, insn->disas_str, insn->misses);
> +    qemu_plugin_outs(xx->str);
> +}
> +
> +static void free_insn(gpointer data)
> +{
> +    struct InsnData *insn = (struct InsnData *) data;
> +    g_free(insn->disas_str);
> +    g_free(insn);
> +}
> +
> +static void free_cache(struct Cache *cache)
> +{
> +    for (int i = 0; i < cache->num_sets; i++) {
> +        g_free(cache->sets[i].blocks);
> +    }
> +
> +    g_free(cache->sets);
> +}
> +
> +static int cmp(gconstpointer a, gconstpointer b)
> +{
> +    struct InsnData *insn_a = (struct InsnData *) a;
> +    struct InsnData *insn_b = (struct InsnData *) b;
> +
> +    return insn_a->misses < insn_b->misses ? 1 : -1;
> +}
> +
> +static void print_stats()
> +{
> +    g_autoptr(GString) rep = g_string_new("");
> +    g_string_append_printf(rep,
> +            "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
> +            dmem_accesses,
> +            dmisses,
> +            ((double)dmisses / dmem_accesses) * 100.0);
> +
> +    g_string_append_printf(rep,
> +            "Instruction accesses: %lu, Misses: %lu\nMiss rate:
> %lf%%\n\n",
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
> +    GList *dmiss_insns = g_hash_table_get_values(dmiss_ht);
> +    GList *imiss_insns = g_hash_table_get_values(imiss_ht);
> +    dmiss_insns = g_list_sort(dmiss_insns, cmp);
> +    imiss_insns = g_list_sort(imiss_insns, cmp);
> +
> +    print_stats();
> +
> +    qemu_plugin_outs("Most data-missing instructions\n");
> +    for (curr = dmiss_insns, i = 0; curr && i < limit; i++, curr =
> curr->next) {
> +        print_entry(curr->data);
> +    }
> +
> +    qemu_plugin_outs("\nMost fetch-missing instructions\n");
> +    for (curr = imiss_insns, i = 0; curr && i < limit; i++, curr =
> curr->next) {
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
> +    limit = 32;
> +    sys = info->system_emulation;
> +
> +    dassoc = 8;
> +    dblksize = 64;
> +    dcachesize = dblksize * dassoc * 32;
> +
> +    iassoc = 8;
> +    iblksize = 64;
> +    icachesize = iblksize * iassoc * 32;
> +
> +    rng = g_rand_new();
> +
> +    for (i = 0; i < argc; i++) {
> +        char *opt = argv[i];
> +        if (g_str_has_prefix(opt, "limit=")) {
> +            limit = g_ascii_strtoull(opt + 6, NULL, 10);
> +        } else {
> +            fprintf(stderr, "option parsing failed: %s\n", opt);
> +            return -1;
> +        }
> +    }
> +
> +    dcache = cache_init(dblksize, dassoc, dcachesize);
> +    icache = cache_init(iblksize, iassoc, icachesize);
> +
> +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> +
> +    dmiss_ht = g_hash_table_new_full(NULL, g_direct_equal, NULL,
> free_insn);
> +    imiss_ht = g_hash_table_new_full(NULL, g_direct_equal, NULL,
> free_insn);
> +
> +    return 0;
> +}
> --
> 2.25.1
>
>
CC'ing Emilio

--0000000000006e1dcf05c3bfdbbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sun, May 30, 2021 at 8:37 AM Mahmoud Mandour &lt;<a href=3D"mailt=
o:ma.mandourr@gmail.com">ma.mandourr@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Added a cache modelling plugi=
n that uses a static configuration used in<br>
many of the commercial microprocessors and uses random eviction policy.<br>
<br>
Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com"=
 target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
---<br>
=C2=A0contrib/plugins/Makefile |=C2=A0 =C2=A01 +<br>
=C2=A0contrib/plugins/cache.c=C2=A0 | 398 +++++++++++++++++++++++++++++++++=
++++++<br>
=C2=A02 files changed, 399 insertions(+)<br>
=C2=A0create mode 100644 contrib/plugins/cache.c<br>
<br>
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile<br>
index b9d7935e5e..2237b47f8b 100644<br>
--- a/contrib/plugins/Makefile<br>
+++ b/contrib/plugins/Makefile<br>
@@ -18,6 +18,7 @@ NAMES +=3D hotpages<br>
=C2=A0NAMES +=3D howvec<br>
=C2=A0NAMES +=3D lockstep<br>
=C2=A0NAMES +=3D hwprofile<br>
+NAMES +=3D cache<br>
<br>
=C2=A0SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))<br>
<br>
diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c<br>
new file mode 100644<br>
index 0000000000..8c9d1dd538<br>
--- /dev/null<br>
+++ b/contrib/plugins/cache.c<br>
@@ -0,0 +1,398 @@<br>
+/*<br>
+ * Copyright (C) 2021, Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@g=
mail.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
+ *<br>
+ * License: GNU GPL, version 2 or later.<br>
+ *=C2=A0 =C2=A0See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#include &lt;inttypes.h&gt;<br>
+#include &lt;assert.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;inttypes.h&gt;<br>
+#include &lt;string.h&gt;<br>
+#include &lt;unistd.h&gt;<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;glib.h&gt;<br>
+<br>
+#include &lt;qemu-plugin.h&gt;<br>
+<br>
+QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;<br>
+<br>
+static GRand *rng;<br>
+static GHashTable *dmiss_ht;<br>
+static GHashTable *imiss_ht;<br>
+<br>
+static GMutex dmtx, imtx;<br>
+<br>
+static int limit;<br>
+static bool sys;<br>
+<br>
+static uint64_t dmem_accesses;<br>
+static uint64_t dmisses;<br>
+<br>
+static uint64_t imem_accesses;<br>
+static uint64_t imisses;<br>
+<br>
+static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;<br>
+<br>
+enum AccessResult {<br>
+=C2=A0 =C2=A0 HIT =3D 0,<br>
+=C2=A0 =C2=A0 MISS =3D 1<br>
+};<br>
+<br>
+struct InsnData {<br>
+=C2=A0 =C2=A0 char *disas_str;<br>
+=C2=A0 =C2=A0 uint64_t addr;<br>
+=C2=A0 =C2=A0 uint64_t misses;<br>
+};<br>
+<br>
+struct CacheBlock {<br>
+=C2=A0 =C2=A0 uint64_t tag;<br>
+=C2=A0 =C2=A0 bool valid;<br>
+};<br>
+<br>
+struct CacheSet {<br>
+=C2=A0 =C2=A0 struct CacheBlock *blocks;<br>
+};<br>
+<br>
+struct Cache {<br>
+=C2=A0 =C2=A0 struct CacheSet *sets;<br>
+=C2=A0 =C2=A0 int num_sets;<br>
+<br>
+=C2=A0 =C2=A0 int cachesize;<br>
+=C2=A0 =C2=A0 int blksize;<br>
+=C2=A0 =C2=A0 int assoc;<br>
+<br>
+=C2=A0 =C2=A0 uint64_t blk_mask;<br>
+=C2=A0 =C2=A0 uint64_t set_mask;<br>
+=C2=A0 =C2=A0 uint64_t tag_mask;<br>
+};<br>
+<br>
+struct Cache *dcache, *icache;<br>
+<br>
+static int pow_of_two(int num)<br>
+{<br>
+=C2=A0 =C2=A0 g_assert((num &amp; (num - 1)) =3D=3D 0);<br>
+=C2=A0 =C2=A0 int ret =3D 0;<br>
+=C2=A0 =C2=A0 while (num /=3D 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret++;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static inline uint64_t extract_tag(struct Cache *cache, uint64_t addr)<br>
+{<br>
+=C2=A0 =C2=A0 return (addr &amp; cache-&gt;tag_mask) &gt;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (pow_of_two(cache-&gt;num_sets) + pow_of_two(c=
ache-&gt;blksize));<br>
+}<br>
+<br>
+static inline uint64_t extract_set(struct Cache *cache, uint64_t addr)<br>
+{<br>
+=C2=A0 =C2=A0 return (addr &amp; cache-&gt;set_mask) &gt;&gt; (pow_of_two(=
cache-&gt;blksize));<br>
+}<br>
+<br>
+static struct Cache *cache_init(int blksize, int assoc, int cachesize)<br>
+{<br>
+=C2=A0 =C2=A0 struct Cache *cache;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 cache =3D g_new(struct Cache, 1);<br>
+=C2=A0 =C2=A0 cache-&gt;blksize =3D blksize;<br>
+=C2=A0 =C2=A0 cache-&gt;assoc =3D assoc;<br>
+=C2=A0 =C2=A0 cache-&gt;cachesize =3D cachesize;<br>
+=C2=A0 =C2=A0 cache-&gt;num_sets =3D cachesize / (blksize * assoc);<br>
+=C2=A0 =C2=A0 cache-&gt;sets =3D g_new(struct CacheSet, cache-&gt;num_sets=
);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[i].blocks =3D g_new0(struct Cac=
heBlock, assoc);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cache-&gt;blk_mask =3D blksize - 1;<br>
+=C2=A0 =C2=A0 cache-&gt;set_mask =3D ((cache-&gt;num_sets - 1) &lt;&lt; (p=
ow_of_two(cache-&gt;blksize)));<br>
+=C2=A0 =C2=A0 cache-&gt;tag_mask =3D ~(cache-&gt;set_mask | cache-&gt;blk_=
mask);<br>
+<br>
+=C2=A0 =C2=A0 return cache;<br>
+}<br>
+<br>
+static int get_invalid_block(struct Cache *cache, uint64_t set)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cache-&gt;sets[set].blocks[i].valid) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* conflict miss */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* compulsary miss */<br>
+=C2=A0 =C2=A0 return -1;<br>
+}<br>
+<br>
+static int get_replaced_block(struct Cache *cache)<br>
+{<br>
+=C2=A0 =C2=A0 return g_rand_int_range(rng, 0, cache-&gt;assoc);<br>
+}<br>
+<br>
+static bool in_cache(struct Cache *cache, uint64_t addr)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 uint64_t tag, set;<br>
+<br>
+=C2=A0 =C2=A0 tag =3D extract_tag(cache, addr);<br>
+=C2=A0 =C2=A0 set =3D extract_set(cache, addr);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;sets[set].blocks[i].tag =3D=3D t=
ag &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[set=
].blocks[i].valid) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+static enum AccessResult access_cache(struct Cache *cache, uint64_t addr)<=
br>
+{<br>
+=C2=A0 =C2=A0 uint64_t tag, set;<br>
+=C2=A0 =C2=A0 int replaced_blk;<br>
+<br>
+=C2=A0 =C2=A0 if (in_cache(cache, addr)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HIT;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 tag =3D extract_tag(cache, addr);<br>
+=C2=A0 =C2=A0 set =3D extract_set(cache, addr);<br>
+<br>
+=C2=A0 =C2=A0 replaced_blk =3D get_invalid_block(cache, set);<br>
+<br>
+=C2=A0 =C2=A0 if (replaced_blk =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 replaced_blk =3D get_replaced_block(cache);<br=
>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cache-&gt;sets[set].blocks[replaced_blk].tag =3D tag;<br>
+=C2=A0 =C2=A0 cache-&gt;sets[set].blocks[replaced_blk].valid =3D true;<br>
+<br>
+=C2=A0 =C2=A0 return MISS;<br>
+}<br>
+<br>
+struct InsnData *get_or_create(GHashTable *ht, struct InsnData *insn_data,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t addr)<br>
+{<br>
+=C2=A0 =C2=A0 struct InsnData *insn =3D g_hash_table_lookup(ht, GUINT_TO_P=
OINTER(addr));<br>
+=C2=A0 =C2=A0 if (!insn) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_insert(ht, GUINT_TO_POINTER(addr)=
, (gpointer) insn_data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 insn =3D insn_data;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return insn;<br>
+}<br>
+<br>
+static void vcpu_mem_access(unsigned int cpu_index, qemu_plugin_meminfo_t =
info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t vaddr, void *userdata)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t insn_addr;<br>
+=C2=A0 =C2=A0 uint64_t effective_addr;<br>
+=C2=A0 =C2=A0 struct qemu_plugin_hwaddr *hwaddr;<br>
+<br>
+=C2=A0 =C2=A0 g_mutex_lock(&amp;dmtx);<br>
+=C2=A0 =C2=A0 hwaddr =3D qemu_plugin_get_hwaddr(info, vaddr);<br>
+=C2=A0 =C2=A0 if (hwaddr &amp;&amp; qemu_plugin_hwaddr_is_io(hwaddr)) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_mutex_unlock(&amp;dmtx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 insn_addr =3D ((struct InsnData *) userdata)-&gt;addr;<br>
+=C2=A0 =C2=A0 effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwa=
ddr) : vaddr;<br>
+<br>
+=C2=A0 =C2=A0 if (access_cache(dcache, effective_addr) =3D=3D MISS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *insn =3D get_or_create(dmiss_=
ht, userdata, insn_addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;misses++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmisses++;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 dmem_accesses++;<br>
+=C2=A0 =C2=A0 g_mutex_unlock(&amp;dmtx);<br>
+}<br>
+<br>
+static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t addr;<br>
+<br>
+=C2=A0 =C2=A0 g_mutex_lock(&amp;imtx);<br>
+=C2=A0 =C2=A0 addr =3D ((struct InsnData *) userdata)-&gt;addr;<br>
+<br>
+=C2=A0 =C2=A0 if (access_cache(icache, addr) =3D=3D MISS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *insn =3D get_or_create(imiss_=
ht, userdata, addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;misses++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imisses++;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 imem_accesses++;<br>
+=C2=A0 =C2=A0 g_mutex_unlock(&amp;imtx);<br>
+}<br>
+<br>
+static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)<=
br>
+{<br>
+=C2=A0 =C2=A0 size_t n_insns;<br>
+=C2=A0 =C2=A0 size_t i;<br>
+<br>
+=C2=A0 =C2=A0 n_insns =3D qemu_plugin_tb_n_insns(tb);<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; n_insns; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct qemu_plugin_insn *insn =3D qemu_plugin_=
tb_get_insn(tb, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t effective_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sys) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 effective_addr =3D (uint64_t) qe=
mu_plugin_insn_haddr(insn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 effective_addr =3D (uint64_t) qe=
mu_plugin_insn_vaddr(insn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *ddata =3D g_new(struct InsnDa=
ta, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *idata =3D g_new(struct InsnDa=
ta, 1);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddata-&gt;disas_str =3D qemu_plugin_insn_disas=
(insn);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddata-&gt;misses =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddata-&gt;addr =3D effective_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 idata-&gt;disas_str =3D g_strdup(ddata-&gt;dis=
as_str);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 idata-&gt;misses =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 idata-&gt;addr =3D effective_addr;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_register_vcpu_mem_cb(insn, vcpu_me=
m_access,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QE=
MU_PLUGIN_CB_NO_REGS,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rw=
, ddata);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_register_vcpu_insn_exec_cb(insn, v=
cpu_insn_exec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0QEMU_PLUGIN_CB_NO_REGS, idata);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void print_entry(gpointer data)<br>
+{<br>
+=C2=A0 =C2=A0 struct InsnData *insn =3D (struct InsnData *) data;<br>
+=C2=A0 =C2=A0 g_autoptr(GString) xx =3D g_string_new(&quot;&quot;);<br>
+=C2=A0 =C2=A0 g_string_append_printf(xx, &quot;0x%&quot; PRIx64 &quot;: %s=
 - misses: %lu\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;addr, insn-&gt;disas_st=
r, insn-&gt;misses);<br>
+=C2=A0 =C2=A0 qemu_plugin_outs(xx-&gt;str);<br>
+}<br>
+<br>
+static void free_insn(gpointer data)<br>
+{<br>
+=C2=A0 =C2=A0 struct InsnData *insn =3D (struct InsnData *) data;<br>
+=C2=A0 =C2=A0 g_free(insn-&gt;disas_str);<br>
+=C2=A0 =C2=A0 g_free(insn);<br>
+}<br>
+<br>
+static void free_cache(struct Cache *cache)<br>
+{<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cache-&gt;sets[i].blocks);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 g_free(cache-&gt;sets);<br>
+}<br>
+<br>
+static int cmp(gconstpointer a, gconstpointer b)<br>
+{<br>
+=C2=A0 =C2=A0 struct InsnData *insn_a =3D (struct InsnData *) a;<br>
+=C2=A0 =C2=A0 struct InsnData *insn_b =3D (struct InsnData *) b;<br>
+<br>
+=C2=A0 =C2=A0 return insn_a-&gt;misses &lt; insn_b-&gt;misses ? 1 : -1;<br=
>
+}<br>
+<br>
+static void print_stats()<br>
+{<br>
+=C2=A0 =C2=A0 g_autoptr(GString) rep =3D g_string_new(&quot;&quot;);<br>
+=C2=A0 =C2=A0 g_string_append_printf(rep,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Data accesses: %lu, Misses=
: %lu\nMiss rate: %lf%%\n\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmem_accesses,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmisses,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((double)dmisses / dmem_accesses=
) * 100.0);<br>
+<br>
+=C2=A0 =C2=A0 g_string_append_printf(rep,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Instruction accesses: %lu,=
 Misses: %lu\nMiss rate: %lf%%\n\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imem_accesses,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imisses,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((double)imisses / imem_accesses=
) * 100.0);<br>
+<br>
+=C2=A0 =C2=A0 qemu_plugin_outs(rep-&gt;str);<br>
+}<br>
+<br>
+static void plugin_exit()<br>
+{<br>
+=C2=A0 =C2=A0 GList *curr;<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 g_mutex_lock(&amp;imtx);<br>
+=C2=A0 =C2=A0 g_mutex_lock(&amp;dmtx);<br>
+=C2=A0 =C2=A0 GList *dmiss_insns =3D g_hash_table_get_values(dmiss_ht);<br=
>
+=C2=A0 =C2=A0 GList *imiss_insns =3D g_hash_table_get_values(imiss_ht);<br=
>
+=C2=A0 =C2=A0 dmiss_insns =3D g_list_sort(dmiss_insns, cmp);<br>
+=C2=A0 =C2=A0 imiss_insns =3D g_list_sort(imiss_insns, cmp);<br>
+<br>
+=C2=A0 =C2=A0 print_stats();<br>
+<br>
+=C2=A0 =C2=A0 qemu_plugin_outs(&quot;Most data-missing instructions\n&quot=
;);<br>
+=C2=A0 =C2=A0 for (curr =3D dmiss_insns, i =3D 0; curr &amp;&amp; i &lt; l=
imit; i++, curr =3D curr-&gt;next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_entry(curr-&gt;data);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_plugin_outs(&quot;\nMost fetch-missing instructions\n&q=
uot;);<br>
+=C2=A0 =C2=A0 for (curr =3D imiss_insns, i =3D 0; curr &amp;&amp; i &lt; l=
imit; i++, curr =3D curr-&gt;next) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_entry(curr-&gt;data);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free_cache(dcache);<br>
+=C2=A0 =C2=A0 free_cache(icache);<br>
+<br>
+=C2=A0 =C2=A0 g_list_free(dmiss_insns);<br>
+=C2=A0 =C2=A0 g_list_free(imiss_insns);<br>
+<br>
+=C2=A0 =C2=A0 g_hash_table_destroy(dmiss_ht);<br>
+=C2=A0 =C2=A0 g_hash_table_destroy(imiss_ht);<br>
+<br>
+=C2=A0 =C2=A0 g_mutex_unlock(&amp;dmtx);<br>
+=C2=A0 =C2=A0 g_mutex_unlock(&amp;imtx);<br>
+}<br>
+<br>
+QEMU_PLUGIN_EXPORT<br>
+int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 int iassoc, iblksize, icachesize;<br>
+=C2=A0 =C2=A0 int dassoc, dblksize, dcachesize;<br>
+<br>
+=C2=A0 =C2=A0 limit =3D 32;<br>
+=C2=A0 =C2=A0 sys =3D info-&gt;system_emulation;<br>
+<br>
+=C2=A0 =C2=A0 dassoc =3D 8;<br>
+=C2=A0 =C2=A0 dblksize =3D 64;<br>
+=C2=A0 =C2=A0 dcachesize =3D dblksize * dassoc * 32;<br>
+<br>
+=C2=A0 =C2=A0 iassoc =3D 8;<br>
+=C2=A0 =C2=A0 iblksize =3D 64;<br>
+=C2=A0 =C2=A0 icachesize =3D iblksize * iassoc * 32;<br>
+<br>
+=C2=A0 =C2=A0 rng =3D g_rand_new();<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; argc; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *opt =3D argv[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_has_prefix(opt, &quot;limit=3D&quot;=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D g_ascii_strtoull(opt +=
 6, NULL, 10);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;option par=
sing failed: %s\n&quot;, opt);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 dcache =3D cache_init(dblksize, dassoc, dcachesize);<br>
+=C2=A0 =C2=A0 icache =3D cache_init(iblksize, iassoc, icachesize);<br>
+<br>
+=C2=A0 =C2=A0 qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);<br=
>
+=C2=A0 =C2=A0 qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);<br>
+<br>
+=C2=A0 =C2=A0 dmiss_ht =3D g_hash_table_new_full(NULL, g_direct_equal, NUL=
L, free_insn);<br>
+=C2=A0 =C2=A0 imiss_ht =3D g_hash_table_new_full(NULL, g_direct_equal, NUL=
L, free_insn);<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
-- <br>
2.25.1<br>
<br></blockquote><div><br></div><div>CC&#39;ing Emilio=C2=A0</div></div></d=
iv>

--0000000000006e1dcf05c3bfdbbb--

