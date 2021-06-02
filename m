Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A92A397FBD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:54:32 +0200 (CEST)
Received: from localhost ([::1]:38390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHxf-0006Vt-Jh
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loHvB-0001aw-Nx
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:51:57 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1loHv7-0001IP-OK
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:51:57 -0400
Received: by mail-io1-xd2b.google.com with SMTP id h7so1040967iok.8
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 20:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vikStWuXjkTBK8Y4mHHgFzRMr0TyVAtKtAI0vlPAS4M=;
 b=EpqtxeQpxE6HhMTXPuTgiZ8J63kNezm3nxnHqBzJ73CHX99NG9ZFMQjtwaIwCbul2v
 pAnzdKk2C2GFSaoK/vkGqDh/YHY7+IKXdzKbCIqMXAUpvrOCnBjRaLKfc6F8/VOSP0Mg
 eRdGDX4lcSi3+mZ03bT5FCkVkMlr/BLVCY1QTFBYTrkJorgVE2wzb+YLO4g4F/bZITNO
 rbm/F5kmBBD5kHCxs3IdiVvp7f7X5jm7ZNW9Snxz1BANNyNUnxX9wjGzytMafm9zPJy1
 cxTNZWV/GjHEMtugzEaf6Hav0Hn5l73T30pbnWdKpvqUt4n6Eejl5zV+I6wSgHcuZ+Gd
 yfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vikStWuXjkTBK8Y4mHHgFzRMr0TyVAtKtAI0vlPAS4M=;
 b=Dg5k/3Jginwqsg4znWjIa6mOU6hd64VEriLDzo2eqvIq7G/h+5FPtkVJYHbu4YcC4s
 /2XFDxfnfasxBUtXshAHb02YcCHGYTiQkWBZ/uKVO/ijiZrRcWnRy3hFKrquEEhkLZBW
 ecCpyxRFpETdTocgeVh+cXOaxDKf/cNTKbpvGofMYXt+pnVRedBaPRs7pQFvxQaS8tl4
 mj9WczVFD0L6aygGxDlL5H4CPGE9DWHRSkrOcns7Ewy/TTkQuXde5KDe4L6HZ0H+euEV
 sQ0msM0vSEU59DG1zMljEEdjxwYTK5BNkgG7L6sXWOeDvBa1oJKmeND1aumoG9V6kW12
 mdSA==
X-Gm-Message-State: AOAM531Jh+qWrxXQS5boyp773G95Wpt9h9vNjI/LpJbftKW+0KX16Hbz
 f+VNSSY+/0k2R/odOPd6unYoChGqKm6Gay7cqOA=
X-Google-Smtp-Source: ABdhPJwQqGCxTQWeYIaeTykTijexY4/XcwQ1DSCX9BGR25e7Vo2zytehIOIt/msMF8mt2G1c70V2fnkxTAJJbxDVgn0=
X-Received: by 2002:a05:6638:d47:: with SMTP id
 d7mr4493736jak.87.1622605912695; 
 Tue, 01 Jun 2021 20:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210529152203.40358-1-ma.mandourr@gmail.com>
 <20210529152203.40358-2-ma.mandourr@gmail.com>
 <87a6o9deiy.fsf@linaro.org>
In-Reply-To: <87a6o9deiy.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 2 Jun 2021 05:51:41 +0200
Message-ID: <CAD-LL6gwi6gk5wSbc6qsbB=9z1s1V5KdJytReP2WojTe_9KzCw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] plugins: Added a new cache modelling plugin
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000009657205c3c06116"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd2b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000009657205c3c06116
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 1, 2021 at 1:12 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > Added a cache modelling plugin that uses a static configuration used in
> > many of the commercial microprocessors and uses random eviction policy.
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> >  contrib/plugins/Makefile |   1 +
> >  contrib/plugins/cache.c  | 398 +++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 399 insertions(+)
> >  create mode 100644 contrib/plugins/cache.c
> >
> > diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> > index b9d7935e5e..2237b47f8b 100644
> > --- a/contrib/plugins/Makefile
> > +++ b/contrib/plugins/Makefile
> > @@ -18,6 +18,7 @@ NAMES +=3D hotpages
> >  NAMES +=3D howvec
> >  NAMES +=3D lockstep
> >  NAMES +=3D hwprofile
> > +NAMES +=3D cache
> >
> >  SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))
> >
> > diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> > new file mode 100644
> > index 0000000000..f8c15ebed2
> > --- /dev/null
> > +++ b/contrib/plugins/cache.c
> > @@ -0,0 +1,398 @@
> > +/*
> > + * Copyright (C) 2021, Mahmoud Mandour <ma.mandourr@gmail.com>
> > + *
> > + * License: GNU GPL, version 2 or later.
> > + *   See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include <inttypes.h>
> > +#include <assert.h>
> > +#include <stdlib.h>
> > +#include <inttypes.h>
> > +#include <string.h>
> > +#include <unistd.h>
> > +#include <stdio.h>
> > +#include <glib.h>
> > +
> > +#include <qemu-plugin.h>
> > +
> > +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
> > +
> > +static GRand *rng;
> > +static GHashTable *dmiss_ht;
> > +static GHashTable *imiss_ht;
> > +
> > +static GMutex dmtx, imtx;
> > +
> > +static int limit;
> > +static bool sys;
> > +
> > +static uint64_t dmem_accesses;
> > +static uint64_t dmisses;
> > +
> > +static uint64_t imem_accesses;
> > +static uint64_t imisses;
> > +
> > +static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;
> > +
> > +enum AccessResult {
> > +    HIT =3D 0,
> > +    MISS =3D 1
> > +};
> > +
> > +struct InsnData {
> > +    char *disas_str;
> > +    uint64_t addr;
> > +    uint64_t misses;
> > +};
>
> A little commentary to the relationship between CacheSet and CacheBlock
> would be useful here for those trying to follow the code. Maybe a little
> ascii art if your up to it?
>
> > +
> > +struct CacheBlock {
> > +    uint64_t tag;
> > +    bool valid;
> > +};
> > +
> > +struct CacheSet {
> > +    struct CacheBlock *blocks;
> > +};
> > +
> > +struct Cache {
> > +    struct CacheSet *sets;
> > +    int num_sets;
> > +
> > +    int cachesize;
> > +    int blksize;
> > +    int assoc;
> > +
> > +    uint64_t blk_mask;
> > +    uint64_t set_mask;
> > +    uint64_t tag_mask;
> > +};
> > +
> > +struct Cache *dcache, *icache;
> > +
> > +static int pow_of_two(int num)
> > +{
> > +    g_assert((num & (num - 1)) =3D=3D 0);
> > +    int ret =3D 0;
> > +    while (num /=3D 2) {
> > +        ret++;
> > +    }
> > +    return ret;
> > +}
>
> You could probably eliminate this by:
>
>   a) pre-calculating masks and shifts at start-up
>   b) expressing cache-size as a power of 2 (are caches ever not?)
>
> Currently it is by far the biggest hit on the CPU:
>
>   46.42%  qemu-aarch64  libcache.so              [.] pow_of_two
>   16.71%  qemu-aarch64  libcache.so              [.] lru_update_on_hit
>   14.12%  qemu-aarch64  libcache.so              [.] in_cache
>    6.73%  qemu-aarch64  libcache.so              [.] extract_tag
>    4.52%  qemu-aarch64  libcache.so              [.] extract_set
>    4.48%  qemu-aarch64  libcache.so              [.] access_cache
>    2.34%  qemu-aarch64  libcache.so              [.] vcpu_insn_exec
>    1.63%  qemu-aarch64  libcache.so              [.] vcpu_mem_access
>    0.72%  qemu-aarch64  libglib-2.0.so.0.5800.3  [.] g_mutex_lock
>
> > +static inline uint64_t extract_tag(struct Cache *cache, uint64_t addr)
> > +{
> > +    return (addr & cache->tag_mask) >>
> > +        (pow_of_two(cache->num_sets) + pow_of_two(cache->blksize));
> > +}
> > +
> > +static inline uint64_t extract_set(struct Cache *cache, uint64_t addr)
> > +{
> > +    return (addr & cache->set_mask) >> (pow_of_two(cache->blksize));
> > +}
>
> It would make sense to enforce pow_of_two for num_sets and blksize on
> initialisation to avoid doing it for every tag. Maybe rename them to
> set_shift and blksize_shift to better indicate their usage.
>
> That's of course problematic, I guess I need to precompute it once
for each cache and not for each tag extraction. However, I  think that I
got this
wrong since I do not even need to shift down the tag. I can extract the tag
as
the high-order bits by only masking for every access and also store that in
the
cache, which works fine. pow_of_two would still propose a  problem since I
need to compute it for extract_set, so I can store that once in the cache,
yes.

Also, can you please tell me what do you use to access plugin profiling
data? To my
knowledge, gprof is not able to work out profiling data for loaded shared
libraries.
I tried sprof but I'm getting an error caused by a seemingly-known bug
since 2009
and not yet solved :D

I guess callgrind works but I think its output is not as clean as the
output you posted.


> > +
> > +static struct Cache *cache_init(int blksize, int assoc, int cachesize)
> > +{
> > +    struct Cache *cache;
> > +    int i;
> > +
> > +    cache =3D g_new(struct Cache, 1);
> > +    cache->blksize =3D blksize;
> > +    cache->assoc =3D assoc;
> > +    cache->cachesize =3D cachesize;
> > +    cache->num_sets =3D cachesize / (blksize * assoc);
> > +    cache->sets =3D g_new(struct CacheSet, cache->num_sets);
> > +
> > +    for (i =3D 0; i < cache->num_sets; i++) {
> > +        cache->sets[i].blocks =3D g_new0(struct CacheBlock, assoc);
> > +    }
> > +
> > +    cache->blk_mask =3D blksize - 1;
> > +    cache->set_mask =3D ((cache->num_sets - 1) <<
> (pow_of_two(cache->blksize)));
> > +    cache->tag_mask =3D ~(cache->set_mask | cache->blk_mask);
> > +
> > +    return cache;
> > +}
> > +
> > +static int get_invalid_block(struct Cache *cache, uint64_t set)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < cache->assoc; i++) {
> > +        if (!cache->sets[set].blocks[i].valid) {
> > +            /* conflict miss */
> > +            return i;
> > +        }
> > +    }
> > +
> > +    /* compulsary miss */
> > +    return -1;
> > +}
> > +
> > +static int get_replaced_block(struct Cache *cache)
> > +{
> > +    return g_rand_int_range(rng, 0, cache->assoc);
> > +}
> > +
> > +static bool in_cache(struct Cache *cache, uint64_t addr)
> > +{
> > +    int i;
> > +    uint64_t tag, set;
> > +
> > +    tag =3D extract_tag(cache, addr);
> > +    set =3D extract_set(cache, addr);
> > +
> > +    for (i =3D 0; i < cache->assoc; i++) {
> > +        if (cache->sets[set].blocks[i].tag =3D=3D tag &&
> > +                cache->sets[set].blocks[i].valid) {
> > +            return true;
> > +        }
> > +    }
> > +
> > +    return false;
> > +}
> > +
> > +static enum AccessResult access_cache(struct Cache *cache, uint64_t
> > addr)
>
> Does the enum really make things easier compared to a straight bool? You
> could just explain things with a comment:
>
>   /**
>    * access_cache() - simulate a cache access
>    * @cache: reference to the cache being used
>    * @addr: address of cached entity
>    *
>    * Returns true if the cache hit, false otherwise and the cache is
>    * updated for next time.
>    */
>   static bool access_cache(struct Cache *cache, uint64_t addr)
>   {
>
> And then have:
>
>   if (!access_cache(icache, addr)) {
>       struct InsnData *insn =3D get_or_create(imiss_ht, userdata, addr);
>       insn->misses++;
>       imisses++;
>   }
>
I applied that, probably better. Thanks.


> > +{
> > +    uint64_t tag, set;
> > +    int replaced_blk;
> > +
> > +    if (in_cache(cache, addr)) {
> > +        return HIT;
> > +    }
> > +
> > +    tag =3D extract_tag(cache, addr);
> > +    set =3D extract_set(cache, addr);
> > +
> > +    replaced_blk =3D get_invalid_block(cache, set);
> > +
> > +    if (replaced_blk =3D=3D -1) {
> > +        replaced_blk =3D get_replaced_block(cache);
> > +    }
> > +
> > +    cache->sets[set].blocks[replaced_blk].tag =3D tag;
> > +    cache->sets[set].blocks[replaced_blk].valid =3D true;
> > +
> > +    return MISS;
> > +}
> > +
> > +struct InsnData *get_or_create(GHashTable *ht, struct InsnData
> *insn_data,
> > +                               uint64_t addr)
> > +{
> > +    struct InsnData *insn =3D g_hash_table_lookup(ht,
> GUINT_TO_POINTER(addr));
> > +    if (!insn) {
> > +        g_hash_table_insert(ht, GUINT_TO_POINTER(addr), (gpointer)
> insn_data);
> > +        insn =3D insn_data;
> > +    }
> > +
> > +    return insn;
> > +}
> > +
> > +static void vcpu_mem_access(unsigned int cpu_index,
> qemu_plugin_meminfo_t info,
> > +                            uint64_t vaddr, void *userdata)
> > +{
> > +    uint64_t insn_addr;
> > +    uint64_t effective_addr;
> > +    struct qemu_plugin_hwaddr *hwaddr;
> > +
> > +    g_mutex_lock(&dmtx);
> > +    hwaddr =3D qemu_plugin_get_hwaddr(info, vaddr);
> > +    if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
> > +        g_free(userdata);
> > +        return;
> > +    }
> > +
> > +    insn_addr =3D ((struct InsnData *) userdata)->addr;
> > +    effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) :
> vaddr;
> > +
> > +    if (access_cache(dcache, effective_addr) =3D=3D MISS) {
> > +        struct InsnData *insn =3D get_or_create(dmiss_ht, userdata,
> insn_addr);
> > +        insn->misses++;
> > +        dmisses++;
> > +    }
> > +    dmem_accesses++;
> > +    g_mutex_unlock(&dmtx);
> > +}
> > +
> > +static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)
> > +{
> > +    uint64_t addr;
> > +
> > +    g_mutex_lock(&imtx);
> > +    addr =3D ((struct InsnData *) userdata)->addr;
> > +
> > +    if (access_cache(icache, addr) =3D=3D MISS) {
> > +        struct InsnData *insn =3D get_or_create(imiss_ht, userdata, ad=
dr);
> > +        insn->misses++;
> > +        imisses++;
> > +    }
> > +    imem_accesses++;
> > +    g_mutex_unlock(&imtx);
> > +}
> > +
> > +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb
> *tb)
> > +{
> > +    size_t n_insns;
> > +    size_t i;
> > +
> > +    n_insns =3D qemu_plugin_tb_n_insns(tb);
> > +    for (i =3D 0; i < n_insns; i++) {
> > +        struct qemu_plugin_insn *insn =3D qemu_plugin_tb_get_insn(tb, =
i);
> > +        uint64_t effective_addr;
> > +
> > +        if (sys) {
> > +            effective_addr =3D (uint64_t) qemu_plugin_insn_haddr(insn)=
;
> > +        } else {
> > +            effective_addr =3D (uint64_t) qemu_plugin_insn_vaddr(insn)=
;
> > +        }
> > +
> > +        struct InsnData *ddata =3D g_new(struct InsnData, 1);
> > +        struct InsnData *idata =3D g_new(struct InsnData, 1);
>
> OK I think I see what you where saying on the sync up earlier. You need
> to take into account any given instruction may get translated multiple
> times so I think for any given instruction you are tracking you want to
> get or create an entry here.
>
> Thanks for explaining that instruction can get translated multiple
times, I did not know that. Applied, thanks.

> > +
> > +        ddata->disas_str =3D qemu_plugin_insn_disas(insn);
> > +        ddata->misses =3D 0;
> > +        ddata->addr =3D effective_addr;
> > +
> > +        idata->disas_str =3D g_strdup(ddata->disas_str);
> > +        idata->misses =3D 0;
> > +        idata->addr =3D effective_addr;
>
> And you might as well combine the InsnData to track both data and icache
> misses in one structure to avoid the duplication of records and strings.
>
> Applied, thanks.


> > +
> > +        qemu_plugin_register_vcpu_mem_cb(insn, vcpu_mem_access,
> > +                                         QEMU_PLUGIN_CB_NO_REGS,
> > +                                         rw, ddata);
> > +
> > +        qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
> > +                                               QEMU_PLUGIN_CB_NO_REGS,
> idata);
> > +    }
> > +}
> > +
> > +static void print_entry(gpointer data)
> > +{
> > +    struct InsnData *insn =3D (struct InsnData *) data;
> > +    g_autoptr(GString) xx =3D g_string_new("");
> > +    g_string_append_printf(xx, "0x%" PRIx64 ": %s - misses: %lu\n",
> > +            insn->addr, insn->disas_str, insn->misses);
>
> As you are likely going to want to post-process this data I would
> suggest a slightly more machine readable format:
>
>   address, misses, instruction
>   0x419298, 2, mov x0, x21
>   0x41aa40, 2, add x0, x0, #0x17
>   0x419640, 2,  add x5, x4, #0x218
>   0x41aa10, 2,  adrp x1, #0x48b000
>   0x4002d0, 2,  adrp x16, #0x48b000
>
> Applied, thanks.


> > +    qemu_plugin_outs(xx->str);
> > +}
> > +
> > +static void free_insn(gpointer data)
> > +{
> > +    struct InsnData *insn =3D (struct InsnData *) data;
> > +    g_free(insn->disas_str);
> > +    g_free(insn);
> > +}
> > +
> > +static void free_cache(struct Cache *cache)
> > +{
> > +    for (int i =3D 0; i < cache->num_sets; i++) {
> > +        g_free(cache->sets[i].blocks);
> > +    }
> > +
> > +    g_free(cache->sets);
> > +}
> > +
> > +static int cmp(gconstpointer a, gconstpointer b)
>
> This will likely need renaming if you ever want to sort by different
> things.
>
Yes, I will have two comparator functions, one for data misses and one
for instruction misses.

>
> > +{
> > +    struct InsnData *insn_a =3D (struct InsnData *) a;
> > +    struct InsnData *insn_b =3D (struct InsnData *) b;
> > +
> > +    return insn_a->misses < insn_b->misses ? 1 : -1;
> > +}
> > +
> > +static void print_stats()
> > +{
> > +    g_autoptr(GString) rep =3D g_string_new("");
> > +    g_string_append_printf(rep,
> > +            "Data accesses: %lu, Misses: %lu\nMiss rate: %lf%%\n\n",
> > +            dmem_accesses,
> > +            dmisses,
> > +            ((double)dmisses / dmem_accesses) * 100.0);
> > +
> > +    g_string_append_printf(rep,
> > +            "Instruction accesses: %lu, Misses: %lu\nMiss rate:
> %lf%%\n\n",
> > +            imem_accesses,
> > +            imisses,
> > +            ((double)imisses / imem_accesses) * 100.0);
> > +
> > +    qemu_plugin_outs(rep->str);
> > +}
> > +
> > +static void plugin_exit()
> > +{
> > +    GList *curr;
> > +    int i;
> > +
> > +    g_mutex_lock(&imtx);
> > +    g_mutex_lock(&dmtx);
> > +    GList *dmiss_insns =3D g_hash_table_get_values(dmiss_ht);
> > +    GList *imiss_insns =3D g_hash_table_get_values(imiss_ht);
> > +    dmiss_insns =3D g_list_sort(dmiss_insns, cmp);
> > +    imiss_insns =3D g_list_sort(imiss_insns, cmp);
> > +
> > +    print_stats();
> > +
> > +    qemu_plugin_outs("Most data-missing instructions\n");
> > +    for (curr =3D dmiss_insns, i =3D 0; curr && i < limit; i++, curr =
=3D
> curr->next) {
> > +        print_entry(curr->data);
> > +    }
> > +
> > +    qemu_plugin_outs("\nMost fetch-missing instructions\n");
> > +    for (curr =3D imiss_insns, i =3D 0; curr && i < limit; i++, curr =
=3D
> curr->next) {
> > +        print_entry(curr->data);
> > +    }
> > +
> > +    free_cache(dcache);
> > +    free_cache(icache);
> > +
> > +    g_list_free(dmiss_insns);
> > +    g_list_free(imiss_insns);
> > +
> > +    g_hash_table_destroy(dmiss_ht);
> > +    g_hash_table_destroy(imiss_ht);
> > +
> > +    g_mutex_unlock(&dmtx);
> > +    g_mutex_unlock(&imtx);
> > +}
> > +
> > +QEMU_PLUGIN_EXPORT
> > +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
> > +                        int argc, char **argv)
> > +{
> > +    int i;
> > +    int iassoc, iblksize, icachesize;
> > +    int dassoc, dblksize, dcachesize;
> > +
> > +    limit =3D 32;
> > +    sys =3D info->system_emulation;
> > +
> > +    dassoc =3D 8;
> > +    dblksize =3D 64;
> > +    dcachesize =3D dblksize * dassoc * 32;
> > +
> > +    iassoc =3D 8;
> > +    iblksize =3D 64;
> > +    icachesize =3D iblksize * iassoc * 32;
> > +
> > +    rng =3D g_rand_new();
> > +
> > +    for (i =3D 0; i < argc; i++) {
> > +        char *opt =3D argv[i];
> > +        if (g_str_has_prefix(opt, "limit=3D")) {
> > +            limit =3D g_ascii_strtoull(opt + 6, NULL, 10);
> > +        } else {
> > +            fprintf(stderr, "option parsing failed: %s\n", opt);
> > +            return -1;
> > +        }
> > +    }
> > +
> > +    dcache =3D cache_init(dblksize, dassoc, dcachesize);
> > +    icache =3D cache_init(iblksize, iassoc, icachesize);
> > +
> > +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> > +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> > +
> > +    dmiss_ht =3D g_hash_table_new_full(NULL, g_direct_equal, NULL,
> free_insn);
> > +    imiss_ht =3D g_hash_table_new_full(NULL, g_direct_equal, NULL,
> free_insn);
> > +
> > +    return 0;
> > +}
>
>
> --
> Alex Benn=C3=A9e
>

--00000000000009657205c3c06116
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 1, 2021 at 1:12 PM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_bla=
nk">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; Added a cache modelling plugin that uses a static configuration used i=
n<br>
&gt; many of the commercial microprocessors and uses random eviction policy=
.<br>
&gt;<br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 contrib/plugins/Makefile |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 contrib/plugins/cache.c=C2=A0 | 398 ++++++++++++++++++++++++++++=
+++++++++++<br>
&gt;=C2=A0 2 files changed, 399 insertions(+)<br>
&gt;=C2=A0 create mode 100644 contrib/plugins/cache.c<br>
&gt;<br>
&gt; diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile<br>
&gt; index b9d7935e5e..2237b47f8b 100644<br>
&gt; --- a/contrib/plugins/Makefile<br>
&gt; +++ b/contrib/plugins/Makefile<br>
&gt; @@ -18,6 +18,7 @@ NAMES +=3D hotpages<br>
&gt;=C2=A0 NAMES +=3D howvec<br>
&gt;=C2=A0 NAMES +=3D lockstep<br>
&gt;=C2=A0 NAMES +=3D hwprofile<br>
&gt; +NAMES +=3D cache<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SONAMES :=3D $(addsuffix .so,$(addprefix lib,$(NAMES)))<br>
&gt;=C2=A0 <br>
&gt; diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f8c15ebed2<br>
&gt; --- /dev/null<br>
&gt; +++ b/contrib/plugins/cache.c<br>
&gt; @@ -0,0 +1,398 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2021, Mahmoud Mandour &lt;<a href=3D"mailto:ma.mando=
urr@gmail.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * License: GNU GPL, version 2 or later.<br>
&gt; + *=C2=A0 =C2=A0See the COPYING file in the top-level directory.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &lt;inttypes.h&gt;<br>
&gt; +#include &lt;assert.h&gt;<br>
&gt; +#include &lt;stdlib.h&gt;<br>
&gt; +#include &lt;inttypes.h&gt;<br>
&gt; +#include &lt;string.h&gt;<br>
&gt; +#include &lt;unistd.h&gt;<br>
&gt; +#include &lt;stdio.h&gt;<br>
&gt; +#include &lt;glib.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;qemu-plugin.h&gt;<br>
&gt; +<br>
&gt; +QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;<b=
r>
&gt; +<br>
&gt; +static GRand *rng;<br>
&gt; +static GHashTable *dmiss_ht;<br>
&gt; +static GHashTable *imiss_ht;<br>
&gt; +<br>
&gt; +static GMutex dmtx, imtx;<br>
&gt; +<br>
&gt; +static int limit;<br>
&gt; +static bool sys;<br>
&gt; +<br>
&gt; +static uint64_t dmem_accesses;<br>
&gt; +static uint64_t dmisses;<br>
&gt; +<br>
&gt; +static uint64_t imem_accesses;<br>
&gt; +static uint64_t imisses;<br>
&gt; +<br>
&gt; +static enum qemu_plugin_mem_rw rw =3D QEMU_PLUGIN_MEM_RW;<br>
&gt; +<br>
&gt; +enum AccessResult {<br>
&gt; +=C2=A0 =C2=A0 HIT =3D 0,<br>
&gt; +=C2=A0 =C2=A0 MISS =3D 1<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct InsnData {<br>
&gt; +=C2=A0 =C2=A0 char *disas_str;<br>
&gt; +=C2=A0 =C2=A0 uint64_t addr;<br>
&gt; +=C2=A0 =C2=A0 uint64_t misses;<br>
&gt; +};<br>
<br>
A little commentary to the relationship between CacheSet and CacheBlock<br>
would be useful here for those trying to follow the code. Maybe a little<br=
>
ascii art if your up to it?<br>
<br>
&gt; +<br>
&gt; +struct CacheBlock {<br>
&gt; +=C2=A0 =C2=A0 uint64_t tag;<br>
&gt; +=C2=A0 =C2=A0 bool valid;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct CacheSet {<br>
&gt; +=C2=A0 =C2=A0 struct CacheBlock *blocks;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct Cache {<br>
&gt; +=C2=A0 =C2=A0 struct CacheSet *sets;<br>
&gt; +=C2=A0 =C2=A0 int num_sets;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 int cachesize;<br>
&gt; +=C2=A0 =C2=A0 int blksize;<br>
&gt; +=C2=A0 =C2=A0 int assoc;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint64_t blk_mask;<br>
&gt; +=C2=A0 =C2=A0 uint64_t set_mask;<br>
&gt; +=C2=A0 =C2=A0 uint64_t tag_mask;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct Cache *dcache, *icache;<br>
&gt; +<br>
&gt; +static int pow_of_two(int num)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_assert((num &amp; (num - 1)) =3D=3D 0);<br>
&gt; +=C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 while (num /=3D 2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret++;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
<br>
You could probably eliminate this by:<br>
<br>
=C2=A0 a) pre-calculating masks and shifts at start-up<br>
=C2=A0 b) expressing cache-size as a power of 2 (are caches ever not?)<br>
<br>
Currently it is by far the biggest hit on the CPU:<br>
<br>
=C2=A0 46.42%=C2=A0 qemu-aarch64=C2=A0 libcache.so=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [.] pow_of_two<br>
=C2=A0 16.71%=C2=A0 qemu-aarch64=C2=A0 libcache.so=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [.] lru_update_on_hit<br>
=C2=A0 14.12%=C2=A0 qemu-aarch64=C2=A0 libcache.so=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [.] in_cache<br>
=C2=A0 =C2=A06.73%=C2=A0 qemu-aarch64=C2=A0 libcache.so=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [.] extract_tag<br>
=C2=A0 =C2=A04.52%=C2=A0 qemu-aarch64=C2=A0 libcache.so=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [.] extract_set<br>
=C2=A0 =C2=A04.48%=C2=A0 qemu-aarch64=C2=A0 libcache.so=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [.] access_cache<br>
=C2=A0 =C2=A02.34%=C2=A0 qemu-aarch64=C2=A0 libcache.so=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [.] vcpu_insn_exec<br>
=C2=A0 =C2=A01.63%=C2=A0 qemu-aarch64=C2=A0 libcache.so=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [.] vcpu_mem_access<br>
=C2=A0 =C2=A00.72%=C2=A0 qemu-aarch64=C2=A0 libglib-2.0.so.0.5800.3=C2=A0 [=
.] g_mutex_lock<br>
<br>
&gt; +static inline uint64_t extract_tag(struct Cache *cache, uint64_t addr=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return (addr &amp; cache-&gt;tag_mask) &gt;&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (pow_of_two(cache-&gt;num_sets) + pow_of_=
two(cache-&gt;blksize));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline uint64_t extract_set(struct Cache *cache, uint64_t addr=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return (addr &amp; cache-&gt;set_mask) &gt;&gt; (pow_of=
_two(cache-&gt;blksize));<br>
&gt; +}<br>
<br>
It would make sense to enforce pow_of_two for num_sets and blksize on<br>
initialisation to avoid doing it for every tag. Maybe rename them to<br>
set_shift and blksize_shift to better indicate their usage.<br>
<br></blockquote><div>That&#39;s of course problematic, I guess I need to p=
recompute it once</div><div>for each cache and not for each tag extraction.=
 However, I=C2=A0 think that I got this</div><div>wrong since I do not even=
 need to shift down the tag. I can extract the tag as</div><div>the high-or=
der bits by only masking for every access and also store that in the</div><=
div>cache, which works fine. pow_of_two would still propose a=C2=A0 problem=
 since I</div><div>need to compute it for extract_set, so I can store that =
once in the cache, yes.</div><div><br></div><div>Also, can you please tell =
me what do you use to access plugin profiling data? To my</div><div>knowled=
ge, gprof is not able to work out profiling data for loaded shared librarie=
s.</div><div>I tried sprof but I&#39;m getting an error caused by a seeming=
ly-known bug since 2009=C2=A0</div><div>and not yet solved :D</div><div><br=
></div><div>I guess callgrind works but I think its output is not as clean =
as the output you posted.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
&gt; +<br>
&gt; +static struct Cache *cache_init(int blksize, int assoc, int cachesize=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct Cache *cache;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cache =3D g_new(struct Cache, 1);<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;blksize =3D blksize;<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;assoc =3D assoc;<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;cachesize =3D cachesize;<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;num_sets =3D cachesize / (blksize * assoc);<b=
r>
&gt; +=C2=A0 =C2=A0 cache-&gt;sets =3D g_new(struct CacheSet, cache-&gt;num=
_sets);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;sets[i].blocks =3D g_new0(struc=
t CacheBlock, assoc);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;blk_mask =3D blksize - 1;<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;set_mask =3D ((cache-&gt;num_sets - 1) &lt;&l=
t; (pow_of_two(cache-&gt;blksize)));<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;tag_mask =3D ~(cache-&gt;set_mask | cache-&gt=
;blk_mask);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return cache;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int get_invalid_block(struct Cache *cache, uint64_t set)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cache-&gt;sets[set].blocks[i].valid)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* conflict miss */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* compulsary miss */<br>
&gt; +=C2=A0 =C2=A0 return -1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int get_replaced_block(struct Cache *cache)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return g_rand_int_range(rng, 0, cache-&gt;assoc);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool in_cache(struct Cache *cache, uint64_t addr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 uint64_t tag, set;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 tag =3D extract_tag(cache, addr);<br>
&gt; +=C2=A0 =C2=A0 set =3D extract_set(cache, addr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; cache-&gt;assoc; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cache-&gt;sets[set].blocks[i].tag =3D=
=3D tag &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cache-&gt;set=
s[set].blocks[i].valid) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return false;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static enum AccessResult access_cache(struct Cache *cache, uint64_t<b=
r>
&gt; addr)<br>
<br>
Does the enum really make things easier compared to a straight bool? You<br=
>
could just explain things with a comment:<br>
<br>
=C2=A0 /**<br>
=C2=A0 =C2=A0* access_cache() - simulate a cache access<br>
=C2=A0 =C2=A0* @cache: reference to the cache being used<br>
=C2=A0 =C2=A0* @addr: address of cached entity<br>
=C2=A0 =C2=A0*<br>
=C2=A0 =C2=A0* Returns true if the cache hit, false otherwise and the cache=
 is<br>
=C2=A0 =C2=A0* updated for next time.<br>
=C2=A0 =C2=A0*/<br>
=C2=A0 static bool access_cache(struct Cache *cache, uint64_t addr)<br>
=C2=A0 {<br>
<br>
And then have:<br>
<br>
=C2=A0 if (!access_cache(icache, addr)) {<br>
=C2=A0 =C2=A0 =C2=A0 struct InsnData *insn =3D get_or_create(imiss_ht, user=
data, addr);<br>
=C2=A0 =C2=A0 =C2=A0 insn-&gt;misses++;<br>
=C2=A0 =C2=A0 =C2=A0 imisses++;<br>
=C2=A0 }<br></blockquote><div>I applied that, probably better. Thanks.</div=
><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t tag, set;<br>
&gt; +=C2=A0 =C2=A0 int replaced_blk;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (in_cache(cache, addr)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return HIT;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 tag =3D extract_tag(cache, addr);<br>
&gt; +=C2=A0 =C2=A0 set =3D extract_set(cache, addr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 replaced_blk =3D get_invalid_block(cache, set);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (replaced_blk =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 replaced_blk =3D get_replaced_block(cache=
);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 cache-&gt;sets[set].blocks[replaced_blk].tag =3D tag;<b=
r>
&gt; +=C2=A0 =C2=A0 cache-&gt;sets[set].blocks[replaced_blk].valid =3D true=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return MISS;<br>
&gt; +}<br>
&gt; +<br>
&gt; +struct InsnData *get_or_create(GHashTable *ht, struct InsnData *insn_=
data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t addr)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct InsnData *insn =3D g_hash_table_lookup(ht, GUINT=
_TO_POINTER(addr));<br>
&gt; +=C2=A0 =C2=A0 if (!insn) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_hash_table_insert(ht, GUINT_TO_POINTER(=
addr), (gpointer) insn_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 insn =3D insn_data;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return insn;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vcpu_mem_access(unsigned int cpu_index, qemu_plugin_memin=
fo_t info,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t vaddr, void *userdata)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t insn_addr;<br>
&gt; +=C2=A0 =C2=A0 uint64_t effective_addr;<br>
&gt; +=C2=A0 =C2=A0 struct qemu_plugin_hwaddr *hwaddr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_mutex_lock(&amp;dmtx);<br>
&gt; +=C2=A0 =C2=A0 hwaddr =3D qemu_plugin_get_hwaddr(info, vaddr);<br>
&gt; +=C2=A0 =C2=A0 if (hwaddr &amp;&amp; qemu_plugin_hwaddr_is_io(hwaddr))=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(userdata);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 insn_addr =3D ((struct InsnData *) userdata)-&gt;addr;<=
br>
&gt; +=C2=A0 =C2=A0 effective_addr =3D hwaddr ? qemu_plugin_hwaddr_phys_add=
r(hwaddr) : vaddr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (access_cache(dcache, effective_addr) =3D=3D MISS) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *insn =3D get_or_create(d=
miss_ht, userdata, insn_addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;misses++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 dmisses++;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 dmem_accesses++;<br>
&gt; +=C2=A0 =C2=A0 g_mutex_unlock(&amp;dmtx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vcpu_insn_exec(unsigned int vcpu_index, void *userdata)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_mutex_lock(&amp;imtx);<br>
&gt; +=C2=A0 =C2=A0 addr =3D ((struct InsnData *) userdata)-&gt;addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (access_cache(icache, addr) =3D=3D MISS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *insn =3D get_or_create(i=
miss_ht, userdata, addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;misses++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 imisses++;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 imem_accesses++;<br>
&gt; +=C2=A0 =C2=A0 g_mutex_unlock(&amp;imtx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb =
*tb)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 size_t n_insns;<br>
&gt; +=C2=A0 =C2=A0 size_t i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 n_insns =3D qemu_plugin_tb_n_insns(tb);<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; n_insns; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct qemu_plugin_insn *insn =3D qemu_pl=
ugin_tb_get_insn(tb, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t effective_addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sys) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 effective_addr =3D (uint64_=
t) qemu_plugin_insn_haddr(insn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 effective_addr =3D (uint64_=
t) qemu_plugin_insn_vaddr(insn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *ddata =3D g_new(struct I=
nsnData, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct InsnData *idata =3D g_new(struct I=
nsnData, 1);<br>
<br>
OK I think I see what you where saying on the sync up earlier. You need<br>
to take into account any given instruction may get translated multiple<br>
times so I think for any given instruction you are tracking you want to<br>
get or create an entry here.<br>
<br></blockquote><div>Thanks for explaining that instruction can get transl=
ated multiple</div><div>times, I did not know that. Applied, thanks.</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddata-&gt;disas_str =3D qemu_plugin_insn_=
disas(insn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddata-&gt;misses =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddata-&gt;addr =3D effective_addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 idata-&gt;disas_str =3D g_strdup(ddata-&g=
t;disas_str);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 idata-&gt;misses =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 idata-&gt;addr =3D effective_addr;<br>
<br>
And you might as well combine the InsnData to track both data and icache<br=
>
misses in one structure to avoid the duplication of records and strings.<br=
>
<br></blockquote><div>Applied, thanks.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_register_vcpu_mem_cb(insn, vc=
pu_mem_access,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0QEMU_PLUGIN_CB_NO_REGS,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0rw, ddata);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_plugin_register_vcpu_insn_exec_cb(in=
sn, vcpu_insn_exec,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0QEMU_PLUGIN_CB_NO_REGS, idata);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void print_entry(gpointer data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct InsnData *insn =3D (struct InsnData *) data;<br>
&gt; +=C2=A0 =C2=A0 g_autoptr(GString) xx =3D g_string_new(&quot;&quot;);<b=
r>
&gt; +=C2=A0 =C2=A0 g_string_append_printf(xx, &quot;0x%&quot; PRIx64 &quot=
;: %s - misses: %lu\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insn-&gt;addr, insn-&gt;dis=
as_str, insn-&gt;misses);<br>
<br>
As you are likely going to want to post-process this data I would<br>
suggest a slightly more machine readable format:<br>
<br>
=C2=A0 address, misses, instruction<br>
=C2=A0 0x419298, 2, mov x0, x21<br>
=C2=A0 0x41aa40, 2, add x0, x0, #0x17<br>
=C2=A0 0x419640, 2,=C2=A0 add x5, x4, #0x218<br>
=C2=A0 0x41aa10, 2,=C2=A0 adrp x1, #0x48b000<br>
=C2=A0 0x4002d0, 2,=C2=A0 adrp x16, #0x48b000<br>
<br></blockquote><div>Applied, thanks.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 qemu_plugin_outs(xx-&gt;str);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void free_insn(gpointer data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct InsnData *insn =3D (struct InsnData *) data;<br>
&gt; +=C2=A0 =C2=A0 g_free(insn-&gt;disas_str);<br>
&gt; +=C2=A0 =C2=A0 g_free(insn);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void free_cache(struct Cache *cache)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 for (int i =3D 0; i &lt; cache-&gt;num_sets; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(cache-&gt;sets[i].blocks);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_free(cache-&gt;sets);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int cmp(gconstpointer a, gconstpointer b)<br>
<br>
This will likely need renaming if you ever want to sort by different<br>
things.<br></blockquote><div>Yes, I will have two comparator functions, one=
 for data misses and one</div><div>for instruction misses.=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct InsnData *insn_a =3D (struct InsnData *) a;<br>
&gt; +=C2=A0 =C2=A0 struct InsnData *insn_b =3D (struct InsnData *) b;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return insn_a-&gt;misses &lt; insn_b-&gt;misses ? 1 : -=
1;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void print_stats()<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 g_autoptr(GString) rep =3D g_string_new(&quot;&quot;);<=
br>
&gt; +=C2=A0 =C2=A0 g_string_append_printf(rep,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Data accesses: %lu, M=
isses: %lu\nMiss rate: %lf%%\n\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmem_accesses,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dmisses,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((double)dmisses / dmem_acc=
esses) * 100.0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_string_append_printf(rep,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Instruction accesses:=
 %lu, Misses: %lu\nMiss rate: %lf%%\n\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imem_accesses,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 imisses,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((double)imisses / imem_acc=
esses) * 100.0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_plugin_outs(rep-&gt;str);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void plugin_exit()<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 GList *curr;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_mutex_lock(&amp;imtx);<br>
&gt; +=C2=A0 =C2=A0 g_mutex_lock(&amp;dmtx);<br>
&gt; +=C2=A0 =C2=A0 GList *dmiss_insns =3D g_hash_table_get_values(dmiss_ht=
);<br>
&gt; +=C2=A0 =C2=A0 GList *imiss_insns =3D g_hash_table_get_values(imiss_ht=
);<br>
&gt; +=C2=A0 =C2=A0 dmiss_insns =3D g_list_sort(dmiss_insns, cmp);<br>
&gt; +=C2=A0 =C2=A0 imiss_insns =3D g_list_sort(imiss_insns, cmp);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 print_stats();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_plugin_outs(&quot;Most data-missing instructions\n=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 for (curr =3D dmiss_insns, i =3D 0; curr &amp;&amp; i &=
lt; limit; i++, curr =3D curr-&gt;next) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_entry(curr-&gt;data);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_plugin_outs(&quot;\nMost fetch-missing instruction=
s\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 for (curr =3D imiss_insns, i =3D 0; curr &amp;&amp; i &=
lt; limit; i++, curr =3D curr-&gt;next) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_entry(curr-&gt;data);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 free_cache(dcache);<br>
&gt; +=C2=A0 =C2=A0 free_cache(icache);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_list_free(dmiss_insns);<br>
&gt; +=C2=A0 =C2=A0 g_list_free(imiss_insns);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_hash_table_destroy(dmiss_ht);<br>
&gt; +=C2=A0 =C2=A0 g_hash_table_destroy(imiss_ht);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_mutex_unlock(&amp;dmtx);<br>
&gt; +=C2=A0 =C2=A0 g_mutex_unlock(&amp;imtx);<br>
&gt; +}<br>
&gt; +<br>
&gt; +QEMU_PLUGIN_EXPORT<br>
&gt; +int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 int argc, char **argv)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +=C2=A0 =C2=A0 int iassoc, iblksize, icachesize;<br>
&gt; +=C2=A0 =C2=A0 int dassoc, dblksize, dcachesize;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 limit =3D 32;<br>
&gt; +=C2=A0 =C2=A0 sys =3D info-&gt;system_emulation;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dassoc =3D 8;<br>
&gt; +=C2=A0 =C2=A0 dblksize =3D 64;<br>
&gt; +=C2=A0 =C2=A0 dcachesize =3D dblksize * dassoc * 32;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 iassoc =3D 8;<br>
&gt; +=C2=A0 =C2=A0 iblksize =3D 64;<br>
&gt; +=C2=A0 =C2=A0 icachesize =3D iblksize * iassoc * 32;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 rng =3D g_rand_new();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; argc; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *opt =3D argv[i];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_str_has_prefix(opt, &quot;limit=3D&=
quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 limit =3D g_ascii_strtoull(=
opt + 6, NULL, 10);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;optio=
n parsing failed: %s\n&quot;, opt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dcache =3D cache_init(dblksize, dassoc, dcachesize);<br=
>
&gt; +=C2=A0 =C2=A0 icache =3D cache_init(iblksize, iassoc, icachesize);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans=
);<br>
&gt; +=C2=A0 =C2=A0 qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dmiss_ht =3D g_hash_table_new_full(NULL, g_direct_equal=
, NULL, free_insn);<br>
&gt; +=C2=A0 =C2=A0 imiss_ht =3D g_hash_table_new_full(NULL, g_direct_equal=
, NULL, free_insn);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div></div>

--00000000000009657205c3c06116--

