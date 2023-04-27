Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E86F0BF7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 20:32:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps6PI-0007Ao-Kr; Thu, 27 Apr 2023 14:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6P2-00076a-KL
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:31:36 -0400
Received: from mout.web.de ([212.227.15.3])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6Ow-0006HT-Vs
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682620285; i=lukasstraub2@web.de;
 bh=/VIdB1nIIxd4PIRwVlYjJNhMAnhOqmugz5SuMUuAVvs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=MX0jG28xAFjR+9T19FAAZW5XA6zAXqPVw3+NaQge93x1NcTrj5EbqK1UtwUio0Z8U
 y6GtsCN89gKlu03WU2tGN0tsYtHUKNY0Hr3lkWKDEI0Ostlz3lU9krafP2tS0KSmXD
 6mYpCfeIjsGWd+8U0iQ+6ywDECiCmvZWEw7KH8fSfdZfD0Od41D51nLylzWThEO2Qy
 7GwPm3WaFiDKddIZ1Nk3fkDeQ8Sfgcj+fCeU+Q0GRbLSzHN3YBqkMViSppCKsWhPbO
 aIps9753wOIOFn+E4uslAGBm1AudNMfTRkolZTLh5qrqZXuiadEphfh5/h4kx+KoR0
 /jW0kVA6WBnKw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBjIG-1pzkpN1C8K-00C6pz; Thu, 27
 Apr 2023 20:31:25 +0200
Date: Thu, 27 Apr 2023 20:31:24 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH 03/19] migration: Rename ram_counters to mig_stats
Message-ID: <20230427183124.77bd476a@gecko.fritz.box>
In-Reply-To: <20230427163449.27473-4-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
 <20230427163449.27473-4-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VQfAbSQNZsjTofnaxGdTkYN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:ybbe6IObSurl99QiE7iIqqG4JZYpq7KT746tkAFXqkzYk0NrMZp
 iyT3PoQHl9wk+8RIyrnDCa/AIxIOshZUhq+hVeugM5J2THi15z/D3beikcgim3f0gd6MvSi
 uTcrqIFVg/TU+GXUp7CFnik4yjHxjFMfm5sVPSOkssHrvbnnOSLYlgYon9XcAC0rJA4Iz5X
 4liVofTKFXoxN+D+iHdsg==
UI-OutboundReport: notjunk:1;M01:P0:0vkJ3fX2tPI=;evLv9EXm3WINfU/plboJr1PiYt1
 K9/85qU9X3suOqU2h8ZkHW41ai6XGiNnLvI4jIqNgWzdIkBZeg6Ts+w5IuOg7bWCBY5d4cH6s
 ZWabpgH5EXVmB5kgZxSXbcKD7+9UF5zpZgH8K6AwdxFJlqE8/MLin/BucAupIYsEdFzqJoTub
 x/2cFSQFQOozSTgI1R9HxpSAvngweQ6Nyu/PeeYHHmLuIOvGNoRadiwiVZmeqBLKpWnDCBXQY
 kr2fipZUCoLi8vkPzLrb6Z5hYlOlt7BXFxrfMDH9C9EfU3IiqoHzUrclJ5yh9T9/kSjskOyUO
 LqpWoIwzgD6xV2WxByDeHEVx7mjCk8NGLVJENe0+f2jK3ULPe29tRfoPgAAGoZSdSs9HkOXxo
 Sl/pd78G18g0gjULce767qe/N/QmQe0Dhz4pjBTD86gxLRIQXUopJfbd8SMjvCQbf0uY/SIOX
 W7Q9uOpCfOemrVSX6Do6jl8Ot526DZ1q0HKHxdpaF8liAqYj6jurolggeQICHx49eU2yt5cI6
 BZvEPxEd6jl3MNi3/zXSv9nk5DQ49T8XGp9uO2jn81w0BNkb56CWi4VldRgvNGJLp0fDRXLmL
 6dAe5PvkpuUlTCT5kfJrI4M4FXeDZEM19E+kNAgavEdpAuYyTvXxF7Cnrzd3wszzMVIyNVeKE
 mCb7wZyRpi9yZm5fr/utZrTH6Y54i08O+4bi7nxnJb/QW0+rJMjsLcRSTknXcNgeObf6d0wHM
 vcl0vYk5Y+OUin9MXD0mBTb+27vvKywlwgPn1Y/GhF2HDidF8C/yx/8fp2gUkHnKv1XqHq4Ok
 vwqyWE4Y6ENlHo6AlrsJEq/YhWNORmtnFL3KDhvlrMuOoql4GRfeQmb3XvGe+BeAj5gUx8aBc
 kwFpb/eF1EMml/x+nmRNsxpYAb6jZJn8JKFAo7qiAZ0LdEdOpn3oUn78Vwl9UvTuwzCoXYV8g
 cPOA3nE2kyAfszkjBuX/zYgDvj8=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/VQfAbSQNZsjTofnaxGdTkYN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 18:34:33 +0200
Juan Quintela <quintela@redhat.com> wrote:

> migration_stats is just too long, and it is going to have more than
> ram counters in the near future.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  migration/migration-stats.c |  2 +-
>  migration/migration-stats.h |  2 +-
>  migration/migration.c       | 32 ++++++++++++-------------
>  migration/multifd.c         |  6 ++---
>  migration/ram.c             | 48 ++++++++++++++++++-------------------
>  migration/savevm.c          |  2 +-
>  6 files changed, 46 insertions(+), 46 deletions(-)
>=20
> diff --git a/migration/migration-stats.c b/migration/migration-stats.c
> index b0eb5ae73c..8c0af9b80a 100644
> --- a/migration/migration-stats.c
> +++ b/migration/migration-stats.c
> @@ -14,4 +14,4 @@
>  #include "qemu/stats64.h"
>  #include "migration-stats.h"
> =20
> -RAMStats ram_counters;
> +RAMStats mig_stats;
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index 2edea0c779..197374b4f6 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -36,6 +36,6 @@ typedef struct {
>      Stat64 transferred;
>  } RAMStats;
> =20
> -extern RAMStats ram_counters;
> +extern RAMStats mig_stats;
> =20
>  #endif
> diff --git a/migration/migration.c b/migration/migration.c
> index 5ecf3dc381..feb5ab7493 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -909,26 +909,26 @@ static void populate_ram_info(MigrationInfo *info, =
MigrationState *s)
>      size_t page_size =3D qemu_target_page_size();
> =20
>      info->ram =3D g_malloc0(sizeof(*info->ram));
> -    info->ram->transferred =3D stat64_get(&ram_counters.transferred);
> +    info->ram->transferred =3D stat64_get(&mig_stats.transferred);
>      info->ram->total =3D ram_bytes_total();
> -    info->ram->duplicate =3D stat64_get(&ram_counters.zero_pages);
> +    info->ram->duplicate =3D stat64_get(&mig_stats.zero_pages);
>      /* legacy value.  It is not used anymore */
>      info->ram->skipped =3D 0;
> -    info->ram->normal =3D stat64_get(&ram_counters.normal_pages);
> +    info->ram->normal =3D stat64_get(&mig_stats.normal_pages);
>      info->ram->normal_bytes =3D info->ram->normal * page_size;
>      info->ram->mbps =3D s->mbps;
>      info->ram->dirty_sync_count =3D
> -        stat64_get(&ram_counters.dirty_sync_count);
> +        stat64_get(&mig_stats.dirty_sync_count);
>      info->ram->dirty_sync_missed_zero_copy =3D
> -        stat64_get(&ram_counters.dirty_sync_missed_zero_copy);
> +        stat64_get(&mig_stats.dirty_sync_missed_zero_copy);
>      info->ram->postcopy_requests =3D
> -        stat64_get(&ram_counters.postcopy_requests);
> +        stat64_get(&mig_stats.postcopy_requests);
>      info->ram->page_size =3D page_size;
> -    info->ram->multifd_bytes =3D stat64_get(&ram_counters.multifd_bytes);
> +    info->ram->multifd_bytes =3D stat64_get(&mig_stats.multifd_bytes);
>      info->ram->pages_per_second =3D s->pages_per_second;
> -    info->ram->precopy_bytes =3D stat64_get(&ram_counters.precopy_bytes);
> -    info->ram->downtime_bytes =3D stat64_get(&ram_counters.downtime_byte=
s);
> -    info->ram->postcopy_bytes =3D stat64_get(&ram_counters.postcopy_byte=
s);
> +    info->ram->precopy_bytes =3D stat64_get(&mig_stats.precopy_bytes);
> +    info->ram->downtime_bytes =3D stat64_get(&mig_stats.downtime_bytes);
> +    info->ram->postcopy_bytes =3D stat64_get(&mig_stats.postcopy_bytes);
> =20
>      if (migrate_xbzrle()) {
>          info->xbzrle_cache =3D g_malloc0(sizeof(*info->xbzrle_cache));
> @@ -960,7 +960,7 @@ static void populate_ram_info(MigrationInfo *info, Mi=
grationState *s)
>      if (s->state !=3D MIGRATION_STATUS_COMPLETED) {
>          info->ram->remaining =3D ram_bytes_remaining();
>          info->ram->dirty_pages_rate =3D
> -           stat64_get(&ram_counters.dirty_pages_rate);
> +           stat64_get(&mig_stats.dirty_pages_rate);
>      }
>  }
> =20
> @@ -1613,10 +1613,10 @@ static bool migrate_prepare(MigrationState *s, bo=
ol blk, bool blk_inc,
> =20
>      migrate_init(s);
>      /*
> -     * set ram_counters compression_counters memory to zero for a
> +     * set mig_stats compression_counters memory to zero for a
>       * new migration
>       */
> -    memset(&ram_counters, 0, sizeof(ram_counters));
> +    memset(&mig_stats, 0, sizeof(mig_stats));
>      memset(&compression_counters, 0, sizeof(compression_counters));
> =20
>      return true;
> @@ -2627,7 +2627,7 @@ static MigThrError migration_detect_error(Migration=
State *s)
>  static uint64_t migration_total_bytes(MigrationState *s)
>  {
>      return qemu_file_total_transferred(s->to_dst_file) +
> -        stat64_get(&ram_counters.multifd_bytes);
> +        stat64_get(&mig_stats.multifd_bytes);
>  }
> =20
>  static void migration_calculate_complete(MigrationState *s)
> @@ -2691,10 +2691,10 @@ static void migration_update_counters(MigrationSt=
ate *s,
>       * if we haven't sent anything, we don't want to
>       * recalculate. 10000 is a small enough number for our purposes
>       */
> -    if (stat64_get(&ram_counters.dirty_pages_rate) &&
> +    if (stat64_get(&mig_stats.dirty_pages_rate) &&
>          transferred > 10000) {
>          s->expected_downtime =3D
> -            stat64_get(&ram_counters.dirty_bytes_last_sync) / bandwidth;
> +            stat64_get(&mig_stats.dirty_bytes_last_sync) / bandwidth;
>      }
> =20
>      qemu_file_reset_rate_limit(s->to_dst_file);
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 347999f84a..4a2e1a47ce 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -434,8 +434,8 @@ static int multifd_send_pages(QEMUFile *f)
>      transferred =3D ((uint64_t) pages->num) * p->page_size + p->packet_l=
en;
>      qemu_file_acct_rate_limit(f, transferred);
>      qemu_mutex_unlock(&p->mutex);
> -    stat64_add(&ram_counters.transferred, transferred);
> -    stat64_add(&ram_counters.multifd_bytes, transferred);
> +    stat64_add(&mig_stats.transferred, transferred);
> +    stat64_add(&mig_stats.multifd_bytes, transferred);
>      qemu_sem_post(&p->sem);
> =20
>      return 1;
> @@ -577,7 +577,7 @@ static int multifd_zero_copy_flush(QIOChannel *c)
>          return -1;
>      }
>      if (ret =3D=3D 1) {
> -        stat64_add(&ram_counters.dirty_sync_missed_zero_copy, 1);
> +        stat64_add(&mig_stats.dirty_sync_missed_zero_copy, 1);
>      }
> =20
>      return ret;
> diff --git a/migration/ram.c b/migration/ram.c
> index a6d5478ef8..c3981f64e4 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -464,13 +464,13 @@ uint64_t ram_bytes_remaining(void)
>  void ram_transferred_add(uint64_t bytes)
>  {
>      if (runstate_is_running()) {
> -        stat64_add(&ram_counters.precopy_bytes, bytes);
> +        stat64_add(&mig_stats.precopy_bytes, bytes);
>      } else if (migration_in_postcopy()) {
> -        stat64_add(&ram_counters.postcopy_bytes, bytes);
> +        stat64_add(&mig_stats.postcopy_bytes, bytes);
>      } else {
> -        stat64_add(&ram_counters.downtime_bytes, bytes);
> +        stat64_add(&mig_stats.downtime_bytes, bytes);
>      }
> -    stat64_add(&ram_counters.transferred, bytes);
> +    stat64_add(&mig_stats.transferred, bytes);
>  }
> =20
>  struct MigrationOps {
> @@ -744,7 +744,7 @@ void mig_throttle_counter_reset(void)
> =20
>      rs->time_last_bitmap_sync =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
>      rs->num_dirty_pages_period =3D 0;
> -    rs->bytes_xfer_prev =3D stat64_get(&ram_counters.transferred);
> +    rs->bytes_xfer_prev =3D stat64_get(&mig_stats.transferred);
>  }
> =20
>  /**
> @@ -764,7 +764,7 @@ static void xbzrle_cache_zero_page(RAMState *rs, ram_=
addr_t current_addr)
>      /* We don't care if this fails to allocate a new cache page
>       * as long as it updated an old one */
>      cache_insert(XBZRLE.cache, current_addr, XBZRLE.zero_target_page,
> -                 stat64_get(&ram_counters.dirty_sync_count));
> +                 stat64_get(&mig_stats.dirty_sync_count));
>  }
> =20
>  #define ENCODING_FLAG_XBZRLE 0x1
> @@ -790,7 +790,7 @@ static int save_xbzrle_page(RAMState *rs, PageSearchS=
tatus *pss,
>      int encoded_len =3D 0, bytes_xbzrle;
>      uint8_t *prev_cached_page;
>      QEMUFile *file =3D pss->pss_channel;
> -    uint64_t generation =3D stat64_get(&ram_counters.dirty_sync_count);
> +    uint64_t generation =3D stat64_get(&mig_stats.dirty_sync_count);
> =20
>      if (!cache_is_cached(XBZRLE.cache, current_addr, generation)) {
>          xbzrle_counters.cache_miss++;
> @@ -1118,8 +1118,8 @@ uint64_t ram_pagesize_summary(void)
> =20
>  uint64_t ram_get_total_transferred_pages(void)
>  {
> -    return stat64_get(&ram_counters.normal_pages) +
> -        stat64_get(&ram_counters.zero_pages) +
> +    return stat64_get(&mig_stats.normal_pages) +
> +        stat64_get(&mig_stats.zero_pages) +
>          compression_counters.pages + xbzrle_counters.pages;
>  }
> =20
> @@ -1129,7 +1129,7 @@ static void migration_update_rates(RAMState *rs, in=
t64_t end_time)
>      double compressed_size;
> =20
>      /* calculate period counters */
> -    stat64_set(&ram_counters.dirty_pages_rate,
> +    stat64_set(&mig_stats.dirty_pages_rate,
>                 rs->num_dirty_pages_period * 1000 /
>                 (end_time - rs->time_last_bitmap_sync));
> =20
> @@ -1180,7 +1180,7 @@ static void migration_trigger_throttle(RAMState *rs)
>  {
>      uint64_t threshold =3D migrate_throttle_trigger_threshold();
>      uint64_t bytes_xfer_period =3D
> -        stat64_get(&ram_counters.transferred) - rs->bytes_xfer_prev;
> +        stat64_get(&mig_stats.transferred) - rs->bytes_xfer_prev;
>      uint64_t bytes_dirty_period =3D rs->num_dirty_pages_period * TARGET_=
PAGE_SIZE;
>      uint64_t bytes_dirty_threshold =3D bytes_xfer_period * threshold / 1=
00;
> =20
> @@ -1209,7 +1209,7 @@ static void migration_bitmap_sync(RAMState *rs)
>      RAMBlock *block;
>      int64_t end_time;
> =20
> -    stat64_add(&ram_counters.dirty_sync_count, 1);
> +    stat64_add(&mig_stats.dirty_sync_count, 1);
> =20
>      if (!rs->time_last_bitmap_sync) {
>          rs->time_last_bitmap_sync =3D qemu_clock_get_ms(QEMU_CLOCK_REALT=
IME);
> @@ -1223,7 +1223,7 @@ static void migration_bitmap_sync(RAMState *rs)
>          RAMBLOCK_FOREACH_NOT_IGNORED(block) {
>              ramblock_sync_dirty_bitmap(rs, block);
>          }
> -        stat64_set(&ram_counters.dirty_bytes_last_sync, ram_bytes_remain=
ing());
> +        stat64_set(&mig_stats.dirty_bytes_last_sync, ram_bytes_remaining=
());
>      }
>      qemu_mutex_unlock(&rs->bitmap_mutex);
> =20
> @@ -1243,10 +1243,10 @@ static void migration_bitmap_sync(RAMState *rs)
>          /* reset period counters */
>          rs->time_last_bitmap_sync =3D end_time;
>          rs->num_dirty_pages_period =3D 0;
> -        rs->bytes_xfer_prev =3D stat64_get(&ram_counters.transferred);
> +        rs->bytes_xfer_prev =3D stat64_get(&mig_stats.transferred);
>      }
>      if (migrate_events()) {
> -        uint64_t generation =3D stat64_get(&ram_counters.dirty_sync_coun=
t);
> +        uint64_t generation =3D stat64_get(&mig_stats.dirty_sync_count);
>          qapi_event_send_migration_pass(generation);
>      }
>  }
> @@ -1320,7 +1320,7 @@ static int save_zero_page(PageSearchStatus *pss, QE=
MUFile *f, RAMBlock *block,
>      int len =3D save_zero_page_to_file(pss, f, block, offset);
> =20
>      if (len) {
> -        stat64_add(&ram_counters.zero_pages, 1);
> +        stat64_add(&mig_stats.zero_pages, 1);
>          ram_transferred_add(len);
>          return 1;
>      }
> @@ -1357,9 +1357,9 @@ static bool control_save_page(PageSearchStatus *pss=
, RAMBlock *block,
>      }
> =20
>      if (bytes_xmit > 0) {
> -        stat64_add(&ram_counters.normal_pages, 1);
> +        stat64_add(&mig_stats.normal_pages, 1);
>      } else if (bytes_xmit =3D=3D 0) {
> -        stat64_add(&ram_counters.zero_pages, 1);
> +        stat64_add(&mig_stats.zero_pages, 1);
>      }
> =20
>      return true;
> @@ -1391,7 +1391,7 @@ static int save_normal_page(PageSearchStatus *pss, =
RAMBlock *block,
>          qemu_put_buffer(file, buf, TARGET_PAGE_SIZE);
>      }
>      ram_transferred_add(TARGET_PAGE_SIZE);
> -    stat64_add(&ram_counters.normal_pages, 1);
> +    stat64_add(&mig_stats.normal_pages, 1);
>      return 1;
>  }
> =20
> @@ -1447,7 +1447,7 @@ static int ram_save_multifd_page(QEMUFile *file, RA=
MBlock *block,
>      if (multifd_queue_page(file, block, offset) < 0) {
>          return -1;
>      }
> -    stat64_add(&ram_counters.normal_pages, 1);
> +    stat64_add(&mig_stats.normal_pages, 1);
> =20
>      return 1;
>  }
> @@ -1486,7 +1486,7 @@ update_compress_thread_counts(const CompressParam *=
param, int bytes_xmit)
>      ram_transferred_add(bytes_xmit);
> =20
>      if (param->zero_page) {
> -        stat64_add(&ram_counters.zero_pages, 1);
> +        stat64_add(&mig_stats.zero_pages, 1);
>          return;
>      }
> =20
> @@ -2179,7 +2179,7 @@ int ram_save_queue_pages(const char *rbname, ram_ad=
dr_t start, ram_addr_t len)
>      RAMBlock *ramblock;
>      RAMState *rs =3D ram_state;
> =20
> -    stat64_add(&ram_counters.postcopy_requests, 1);
> +    stat64_add(&mig_stats.postcopy_requests, 1);
>      RCU_READ_LOCK_GUARD();
> =20
>      if (!rbname) {
> @@ -2634,9 +2634,9 @@ void acct_update_position(QEMUFile *f, size_t size,=
 bool zero)
>      uint64_t pages =3D size / TARGET_PAGE_SIZE;
> =20
>      if (zero) {
> -        stat64_add(&ram_counters.zero_pages, pages);
> +        stat64_add(&mig_stats.zero_pages, pages);
>      } else {
> -        stat64_add(&ram_counters.normal_pages, pages);
> +        stat64_add(&mig_stats.normal_pages, pages);
>          ram_transferred_add(size);
>          qemu_file_credit_transfer(f, size);
>      }
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 8e2efb1a19..a9d0a88e62 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1622,7 +1622,7 @@ static int qemu_savevm_state(QEMUFile *f, Error **e=
rrp)
>      }
> =20
>      migrate_init(ms);
> -    memset(&ram_counters, 0, sizeof(ram_counters));
> +    memset(&mig_stats, 0, sizeof(mig_stats));
>      memset(&compression_counters, 0, sizeof(compression_counters));
>      ms->to_dst_file =3D f;
> =20



--=20


--Sig_/VQfAbSQNZsjTofnaxGdTkYN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRKv3wACgkQNasLKJxd
slhg5RAAszd465mjHnCNEkpntOVs+fS5gI/YnDeDJjSwYrBzvQ2Bo6F85pOVq/UT
f9DWnQF+bExXYSZZJ99GzMyYUyG01rgCZcyzrfrBkWhnGEOxKgYSVq54+kv6laWG
WsLAmhRiayKRtArwf8hnMfEdYSUN96Yzw7kZUUwquN+qZ0dDHG5y26xqsVYh840k
aAp5RdPhOWeaGejOtF+01/q85IfU2Q9XeZ9Z8XUUe5mXCU/JIBKDDAVgZY5Y5h8T
EctJR+icydkqwA+X2Dtcmn8kLTGIytkTWFyDRffljq9gBDgJGKwPDG0YoEHxS0Ll
BlzsnwLrsot0lL/f9MD1RsUJ6lSbDbmc5Owxv1f4AF0P6IzITv0dq4IgWt6igSVS
K5wztj9Lr2+pWqKMIs3QIV9gpscJ2V6kQARkw45RsDfI+Trg789mht8ci5c73GIy
7PkC7JeQ/qvHEakFPpG3zeFAgBTeDjYzv1xzxFjbrbGzTf3UQLZyxrnB4Yqrfk95
iyUDH7fudHFaqf0txt1+ES9hqATdUt1vFYIFKACXVkhfgt2na0uJMhtXEATkCFd3
tNjgxGVmrtIRw8tLglOXq9YKLQEk4svu79aCjGVxefEKs/IrcjUc8oLSZXAWXdDV
YDwN6xuI73ep/KZeRXMpbWIRYobtJ0veHsBkwIEw+0+fyELkFnA=
=av7i
-----END PGP SIGNATURE-----

--Sig_/VQfAbSQNZsjTofnaxGdTkYN--

