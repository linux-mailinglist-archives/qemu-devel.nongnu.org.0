Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465F397468
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 15:35:15 +0200 (CEST)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo4Y6-00051z-Kj
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 09:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo4Qu-0000UC-8o
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:27:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo4Qs-0000rF-03
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 09:27:47 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso1579257wmh.4
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 06:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qqPl7hSprCkDni72TejOD++NbSGjLqmg81fvTiE47oQ=;
 b=ZIATjggGbX40xUtiC3mV8VgizOct1b5HzvpZzz2lNYUE7EdtOzsPYPF8Dc2MUhx97/
 l1MXxrIYEWRRvxUd9zIIRFepsnfJjCeuj10sEh97F7QM/qywx0ptsX2lg4Qx3RvYoEf2
 8Dk9e+f6eP8Q8/q31W4f/LjCs9Y91mD994MRU63QBw+8PppVoXc9HmNlixGgM4C0qPY6
 9dPtPkIh8wazOEL2QuMeTAXaPvx7vTXHzdEipJKMEpdUPp5QozdcgPgk7X+vY0NTg7zC
 +bx8aEG0XLEqveShMhoSlvJva0GvtpDPU9XzHOmV8KY6FAx2ZfxXRQp4qF0RngbWOrhF
 mXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qqPl7hSprCkDni72TejOD++NbSGjLqmg81fvTiE47oQ=;
 b=s4ox+wSuduTI0TfV3gNkaj5UIRN7/33krkLnGGCUL3wcxxMjlZlt2OIeVmZN3HRq7u
 dbusUU6rbz5A0KnytvCQnczF8JE05k+dTUD07/vjPYtt6lfHcmUth5if+HwOdnVInpHE
 MWfV+4ECf7teYJCt1/u78++knDJ+a5zeecx31TjzoxSuXRnidsqPH3DedPPfD9U87uUc
 JpkeNlzdo43kyM7LxHCbjx74/5KuUFQMuFoPKFhncO4ouFyWtNijS/VKxBsaOLzHCBo5
 sXhnT/rrp33o9dVS4KZH9yb1l0nKN1OPdmhHaRz+8da0i1LNWh7ML4jwjalZDbcnkQfo
 Uk4w==
X-Gm-Message-State: AOAM530kdVVmm68IkCYfHZS827VZhsWnvVo97nZdytJZ0uGh5uZY0lll
 i560dUc8/HNEB1gjYoZihmhr6w==
X-Google-Smtp-Source: ABdhPJwJWVggSoQM+b04Q91kXNI5fGMTKnYjAVBr52W5P7vsJyM8N5aePxQl3QREu1LBCnwM66Ry0g==
X-Received: by 2002:a1c:a3c3:: with SMTP id
 m186mr15293168wme.154.1622554063735; 
 Tue, 01 Jun 2021 06:27:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm17029544wmq.22.2021.06.01.06.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 06:27:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2090F1FF7E;
 Tue,  1 Jun 2021 14:27:42 +0100 (BST)
References: <20210530063712.6832-1-ma.mandourr@gmail.com>
 <20210530063712.6832-4-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH v2 3/3] plugins: cache: Added FIFO and LRU eviction
 policies.
Date: Tue, 01 Jun 2021 13:43:14 +0100
In-reply-to: <20210530063712.6832-4-ma.mandourr@gmail.com>
Message-ID: <874kehd8a9.fsf@linaro.org>
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

> Now one of the three eviction policies can be chosen as an argument. On
> not specifying an argument, LRU is used by default.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  contrib/plugins/cache.c | 159 ++++++++++++++++++++++++++++++++++++----
>  1 file changed, 146 insertions(+), 13 deletions(-)
>
> diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
> index fa0bf1dd40..1e323494bf 100644
> --- a/contrib/plugins/cache.c
> +++ b/contrib/plugins/cache.c
> @@ -18,6 +18,8 @@
>=20=20
>  QEMU_PLUGIN_EXPORT int qemu_plugin_version =3D QEMU_PLUGIN_VERSION;
>=20=20
> +static bool fifo, lru, rnd;
> +

Ironically this would be a good use for a single variable with an enum,
or alternatively a function pointer which can be set on initialisation.

>  static GRand *rng;
>  static GHashTable *dmiss_ht;
>  static GHashTable *imiss_ht;
> @@ -55,6 +57,8 @@ struct CacheBlock {
>=20=20
>  struct CacheSet {
>      struct CacheBlock *blocks;
> +    uint16_t *priorities;
> +    GQueue *evict_queue;
>  };
>=20=20
>  struct Cache {
> @@ -93,6 +97,84 @@ static inline uint64_t extract_set(struct Cache *cache=
, uint64_t addr)
>      return (addr & cache->set_mask) >> (pow_of_two(cache->blksize));
>  }

I think it would be useful to summarise the LRU behaviour here in a
comment and explain how the priorities are meant to change as the cache
is used.

>=20=20
> +static void lru_priorities_init(struct Cache *cache)
> +{
> +    int i, j;
> +
> +    for (i =3D 0; i < cache->num_sets; i++) {
> +        cache->sets[i].priorities =3D g_new(uint16_t, cache->assoc);
> +        for (j =3D 0; j < cache->assoc; j++) {
> +            cache->sets[i].priorities[j] =3D cache->assoc - j - 1;
> +        }
> +    }
> +}
> +
> +static void lru_update_on_miss(struct Cache *cache,
> +                                      int set_idx,
> +                                      int blk_idx)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < cache->assoc; i++) {
> +        cache->sets[set_idx].priorities[i]++;
> +    }
> +
> +    cache->sets[set_idx].priorities[blk_idx] =3D 0;

So we increment priority for all non-hit blocks and reset it for the
entry just used? This isn't totally clear to follow however see bellow:

> +}
> +
> +static void lru_update_on_hit(struct Cache *cache,
> +                                         int set_idx,
> +                                         int blk_idx)
> +{
> +    uint16_t blk_priority;
> +    int i;
> +
> +    blk_priority =3D cache->sets[set_idx].priorities[blk_idx];
> +    for (i =3D 0; i < cache->assoc; i++) {
> +        if (cache->sets[set_idx].priorities[i] < blk_priority) {
> +            cache->sets[set_idx].priorities[i]++;
> +        }
> +    }
> +    cache->sets[set_idx].priorities[blk_idx] =3D 0;

This seems pretty expensive depending on the number of blocks. Another
approach would be to have a generation number that is incremented on
each access and stored in the appropriate set. Then...

> +}
> +
> +static int lru_get_lru_block(struct Cache *cache, int set_idx)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < cache->assoc; i++) {
> +        if (cache->sets[set_idx].priorities[i] =3D=3D cache->assoc - 1) {
> +            return i;
> +        }
> +    }

when you get to search for a "stale" block you just look for the lowest
generation number. The eviction logic should be being called less than
the update logic right?

> +
> +    g_assert_not_reached();
> +}
> +
> +static void fifo_init(struct Cache *cache)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < cache->num_sets; i++) {
> +        cache->sets[i].evict_queue =3D g_queue_new();
> +    }
> +}
> +
> +static int fifo_get_first_in_block(struct Cache *cache, int set)
> +{
> +    GQueue *q =3D cache->sets[set].evict_queue;
> +    return GPOINTER_TO_INT(g_queue_pop_tail(q));
> +}
> +
> +static void fifo_update_on_miss(struct Cache *cache,
> +                                int set,
> +                                int blk_idx)
> +{
> +    GQueue *q =3D cache->sets[set].evict_queue;
> +    g_queue_push_head(q, GINT_TO_POINTER(blk_idx));
> +}

Again some commentary would be helpful around above the fifo functions.

> +
> +
>  static struct Cache *cache_init(int blksize, int assoc, int cachesize)
>  {
>      struct Cache *cache;
> @@ -113,6 +195,12 @@ static struct Cache *cache_init(int blksize, int ass=
oc, int cachesize)
>      cache->set_mask =3D ((cache->num_sets - 1) << (pow_of_two(cache->blk=
size)));
>      cache->tag_mask =3D ~(cache->set_mask | cache->blk_mask);
>=20=20
> +    if (lru) {
> +        lru_priorities_init(cache);
> +    } else if (fifo) {
> +        fifo_init(cache);
> +    }
> +
>      return cache;
>  }
>=20=20
> @@ -131,12 +219,20 @@ static int get_invalid_block(struct Cache *cache, u=
int64_t set)
>      return -1;
>  }
>=20=20
> -static int get_replaced_block(struct Cache *cache)
> +static int get_replaced_block(struct Cache *cache, int set)
>  {
> -    return g_rand_int_range(rng, 0, cache->assoc);
> +    if (rnd) {
> +        return g_rand_int_range(rng, 0, cache->assoc);
> +    } else if (lru) {
> +        return lru_get_lru_block(cache, set);
> +    } else if (fifo) {
> +        return fifo_get_first_in_block(cache, set);
> +    }
> +
> +    g_assert_not_reached();
>  }
>=20=20
> -static bool in_cache(struct Cache *cache, uint64_t addr)
> +static int in_cache(struct Cache *cache, uint64_t addr)
>  {
>      int i;
>      uint64_t tag, set;
> @@ -147,29 +243,39 @@ static bool in_cache(struct Cache *cache, uint64_t =
addr)
>      for (i =3D 0; i < cache->assoc; i++) {
>          if (cache->sets[set].blocks[i].tag =3D=3D tag &&
>                  cache->sets[set].blocks[i].valid) {
> -            return true;
> +            return i;
>          }
>      }
>=20=20
> -    return false;
> +    return -1;
>  }
>=20=20
>  static enum AccessResult access_cache(struct Cache *cache, uint64_t addr)
>  {
>      uint64_t tag, set;
> -    int replaced_blk;
> -
> -    if (in_cache(cache, addr)) {
> -        return HIT;
> -    }
> +    int hit_blk, replaced_blk;
>=20=20
>      tag =3D extract_tag(cache, addr);
>      set =3D extract_set(cache, addr);
> +    hit_blk =3D in_cache(cache, addr);
> +
> +    if (hit_blk !=3D -1) {
> +        if (lru) {
> +            lru_update_on_hit(cache, set, hit_blk);
> +        }
> +        return HIT;
> +    }
>=20=20
>      replaced_blk =3D get_invalid_block(cache, set);
>=20=20
>      if (replaced_blk =3D=3D -1) {
> -        replaced_blk =3D get_replaced_block(cache);
> +        replaced_blk =3D get_replaced_block(cache, set);
> +    }
> +
> +    if (lru) {
> +        lru_update_on_miss(cache, set, replaced_blk);
> +    } else if (fifo) {
> +        fifo_update_on_miss(cache, set, replaced_blk);
>      }

I wonder if just having a update_hit and update_miss function pointer
would keep things cleaner?

  if (update_hit) {
       update_hit(cache, set, hit, block)
  }

etc...

>=20=20
>      cache->sets[set].blocks[replaced_blk].tag =3D tag;
> @@ -307,6 +413,11 @@ static void free_cache(struct Cache *cache)
>  {
>      for (int i =3D 0; i < cache->num_sets; i++) {
>          g_free(cache->sets[i].blocks);
> +        if (lru) {
> +            g_free(cache->sets[i].priorities);

Hmm I've obviously missed something about how priorities are meant to be su=
ed.

> +        } else if (fifo) {
> +            g_queue_free(cache->sets[i].evict_queue);
> +        }
>      }
>=20=20
>      g_free(cache->sets);
> @@ -403,8 +514,6 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qe=
mu_info_t *info,
>      iblksize =3D 64;
>      icachesize =3D iblksize * iassoc * 32;
>=20=20
> -    rng =3D g_rand_new();
> -
>      for (i =3D 0; i < argc; i++) {
>          char *opt =3D argv[i];
>          if (g_str_has_prefix(opt, "I=3D")) {
> @@ -433,6 +542,22 @@ int qemu_plugin_install(qemu_plugin_id_t id, const q=
emu_info_t *info,
>              if (!tracefile) {
>                  fprintf(stderr, "could not open: %s for writing\n", file=
_name);
>              }
> +        } else if (g_str_has_prefix(opt, "evict=3D")) {
> +            if (lru || rnd || fifo) {
> +                fprintf(stderr, "eviction policy specified more than onc=
e\n");
> +                return -1;
> +            }

This is one argument for the separate bools although generally QEMU
operates on the basis of last argument wins ;-)=20

> +            gchar *policy =3D opt + 6;
> +            if (g_strcmp0(policy, "rand") =3D=3D 0) {
> +                rnd =3D true;
> +            } else if (g_strcmp0(policy, "lru") =3D=3D 0) {
> +                lru =3D true;
> +            } else if (g_strcmp0(policy, "fifo") =3D=3D 0) {
> +                fifo =3D true;
> +            } else {
> +                fprintf(stderr, "invalid eviction policy: %s\n", opt);
> +                return -1;
> +            }
>          } else {
>              fprintf(stderr, "option parsing failed: %s\n", opt);
>              return -1;
> @@ -449,6 +574,14 @@ int qemu_plugin_install(qemu_plugin_id_t id, const q=
emu_info_t *info,
>          return -1;
>      }
>=20=20
> +    if (!rnd && !lru && !fifo) {
> +        lru =3D true;
> +    }
> +
> +    if (rnd) {
> +        rng =3D g_rand_new();
> +    }
> +
>      dcache =3D cache_init(dblksize, dassoc, dcachesize);
>      icache =3D cache_init(iblksize, iassoc, icachesize);


--=20
Alex Benn=C3=A9e

