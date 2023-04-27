Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2F6F0C35
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 21:00:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps6qf-0000Cp-PE; Thu, 27 Apr 2023 15:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6qX-0000C3-Qd
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 15:00:02 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ps6qW-0003CU-4R
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 15:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1682621995; i=lukasstraub2@web.de;
 bh=rFYrpzZEFhLoA2IhlZJ0pMwgDZcTVchPgQ7SBhjyKjo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=nPZo4RENu2F2FpJloYQ3jqu075GxqCQ5P8d53e/gKVXAcfayjEdrjzRcNX3tZ4b1m
 gJzrdbcamyqPrSMWlmq5hMFrypMh/EHnstewwCyn9nuKnF6dMjwMQ4kSHt8WOTuMQh
 HUCg8qVV7S8XQ+OaA6VvxtOUMsj0wWrmdJ+kvjAjuc4hy7ncsRNIvGXIqllFoDrOV3
 ObPF1cROGfwgcxRQqOBq28nFVfFhVl1KZph+SMqW5pqeP56qLZBZ6M22QwHNwHtDV5
 x7w45euMLd9l+XgkCLz5aqPIJCB7cUGcyHqG/ll2pH71w8oZMQKbABHdPv+NCFHl9k
 Z6e2EEb3o5wug==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.107]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N6sFx-1qLNjQ1z4R-018FKw; Thu, 27
 Apr 2023 20:59:55 +0200
Date: Thu, 27 Apr 2023 20:59:54 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, Leonardo Bras
 <leobras@redhat.com>
Subject: Re: [PATCH 05/19] migration/rdma: Split the zero page case from
 acct_update_position
Message-ID: <20230427185954.62231550@gecko.fritz.box>
In-Reply-To: <20230427163449.27473-6-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
 <20230427163449.27473-6-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.hE5Rqw28Eu7KiY39=slu+b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:9wta2a76uY4eV9kVQGBPYfIp0CIDxgKp693AIOe1rGJMgx9sbPk
 6zQbrRAUO1lNCa3LFtIJSSyDK33RZjAmH0k9ixL2UIHLmlmX5FpzIKShxFxBnCFfjLIxiNA
 VAs1giskhGQJXofuA8HZXuo0Ry59LHBlLeFw9AsL7VEW8fa5rff9P/4Kxq49PiKgCj61pBL
 gl47Z3GEQOMzUA8YrFPJA==
UI-OutboundReport: notjunk:1;M01:P0:1F+HqbheMQg=;H2h4aWnKd0w/HpzPGYteuWORp/k
 e9KdglIi87qmmtBj3IIWUgiJFfU249C6WMqGmk5fJCkiLWpwJ2ls581TYuSZo2JCvl/MEFX7m
 0vNGMo2VwC7QLISr/BpaH7h7zoTXQ2iv8TGhiRBnaWm28mLs0LeKIQlT9xefkP1EYRtH3jVHv
 WSE5Xz+RL3rqH5Zdwj71T4mOHGclod81QDFsZvgvQMjiMMXKBHsMJ8EmfCORXEyPQ5Lzw8IOt
 bktzSbgzHgqOIpqA1g8FF7qqPn2SoEzkMo4eFnxqtIPHsDWSgx5wtxIdM6Pr1FYCs4YbACIrT
 HOCAKBSigGmCd6AxxF4vbZaJ6Dliwc4dnmabz3mvJUhY/9neW2vSFQTlLW90riyTS+fLRMSzH
 gPhdpFdGK+Pc7560jzmYkheMgZAg9QncBXt3m0dLeV15x4ymDT2OYYhrxcrvbz+Fg5uNGV7un
 8nvIkrMy5eGQjNkpg0VJlWg3SOX3mLQu19TRYhuUqWq4BWL5cIYoTvk2yqGNCaVsVDU+LyoEG
 lk3l73o/FdlpAxNC7FamdtWp4QxP+GC9LJM4WG793cq/calJwCicmEwyEBRlqA6HH9KEbWiEs
 QaBQA909A6h1hbKjKLjQe4bq/VSlzlpjhiy1Ga7HDRTd84LDK50wolYtoRY7bOxBBDRmu/ACK
 03d60qcDXCAXfsL1YX6NBQQyKu0pQLaX4vvPSR4t5Ma4EySYz9tq3iwCPilqoVZfr9jKK1fR6
 IY1lGAAdS7R9FbqpbMOvoKVqdKun6+RU7DtlPc/L2mKSuF9X+K546WJT3Iac3dHyLXlNWoWW0
 0fMtGCyj0AkML1nAF/eMYN5kgPeqRgdVPS+V8HdaF7t9PR0aCotsjU6XpPd/MGxyJRA2AvRjC
 MgO4LCNZ4Tz7/smm6Qw6rCAqenFup2t0x1AfOvyNbLJJMbIFXveksSGLDT6uT0HYebopTpxef
 hxCro//FQSWKMJzhhZQjJB2PvcY=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/.hE5Rqw28Eu7KiY39=slu+b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Apr 2023 18:34:35 +0200
Juan Quintela <quintela@redhat.com> wrote:

> Now that we have atomic counters, we can do it on the place that we
> need it, no need to do it inside ram.c.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Lukas Straub <lukasstraub2@web.de>

> ---
>  migration/ram.c  | 12 ++++--------
>  migration/ram.h  |  2 +-
>  migration/rdma.c |  7 +++++--
>  3 files changed, 10 insertions(+), 11 deletions(-)
>=20
> diff --git a/migration/ram.c b/migration/ram.c
> index c3981f64e4..c249a1f468 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -2629,17 +2629,13 @@ static int ram_find_and_save_block(RAMState *rs)
>      return pages;
>  }
> =20
> -void acct_update_position(QEMUFile *f, size_t size, bool zero)
> +void acct_update_position(QEMUFile *f, size_t size)
>  {
>      uint64_t pages =3D size / TARGET_PAGE_SIZE;
> =20
> -    if (zero) {
> -        stat64_add(&mig_stats.zero_pages, pages);
> -    } else {
> -        stat64_add(&mig_stats.normal_pages, pages);
> -        ram_transferred_add(size);
> -        qemu_file_credit_transfer(f, size);
> -    }
> +    stat64_add(&mig_stats.normal_pages, pages);
> +    ram_transferred_add(size);
> +    qemu_file_credit_transfer(f, size);
>  }
> =20
>  static uint64_t ram_bytes_total_with_ignored(void)
> diff --git a/migration/ram.h b/migration/ram.h
> index 8692de6ba0..3804753ca3 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -53,7 +53,7 @@ void mig_throttle_counter_reset(void);
> =20
>  uint64_t ram_pagesize_summary(void);
>  int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_=
t len);
> -void acct_update_position(QEMUFile *f, size_t size, bool zero);
> +void acct_update_position(QEMUFile *f, size_t size);
>  void ram_postcopy_migrated_memory_release(MigrationState *ms);
>  /* For outgoing discard bitmap */
>  void ram_postcopy_send_discard_bitmap(MigrationState *ms);
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 0af5e944f0..7a9b284c3f 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -17,8 +17,10 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
> +#include "exec/target_page.h"
>  #include "rdma.h"
>  #include "migration.h"
> +#include "migration-stats.h"
>  #include "qemu-file.h"
>  #include "ram.h"
>  #include "qemu/error-report.h"
> @@ -2120,7 +2122,8 @@ retry:
>                      return -EIO;
>                  }
> =20
> -                acct_update_position(f, sge.length, true);
> +                stat64_add(&mig_stats.zero_pages,
> +                           sge.length / qemu_target_page_size());
> =20
>                  return 1;
>              }
> @@ -2228,7 +2231,7 @@ retry:
>      }
> =20
>      set_bit(chunk, block->transit_bitmap);
> -    acct_update_position(f, sge.length, false);
> +    acct_update_position(f, sge.length);
>      rdma->total_writes++;
> =20
>      return 0;



--=20


--Sig_/.hE5Rqw28Eu7KiY39=slu+b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRKxioACgkQNasLKJxd
slhfEQ/+Osces7NY3G/MBGyArpHtP7x4ayWZ2IsSCq98MplCkXaYtTXiSSMDgm9+
lIE/c0wuqGIADYIvsTSuWVLgtgW9mu8pRiR15V6KYE9XbbR1+9xkYmlmJajRThd6
W+hdENsCNCWzcQCwwwHCsocMvgOWSQB73u7cTcRth0sIEN2bN5rQDQTtp2JsdtDz
gf+U7uFr/9mHDjiuYnK2l+v7g1AUZZtp0D92YFSTIroL4UThcmKxhdCTsANRETX6
H2LwsID0IgXAxIjfiI350m3f6C3N239jdOWoyNuA5SgLUFhY41WuNBUUDXesR4mO
HE0gyOsBm+AVxTm+zp/Ln7q/TzDILyvbdC12DSc3rWUJuOACWja++/qEG32cG54r
myUZpdK27aJYQsINQbkcwVYrX3OcTrGiJYm994kNYjHPQSPHfZoHXw7tb/p/svSB
Ly3qDYBheCfTtWZ69oskh2rW0bTk3N6W8jknpE146w1ezdgDtpqtP57TMgoY9/0z
5MS756GuxCiLqlsIDV1KmXLkOQD+X61px+Z2JbzpdFp7fka5/MiBSvggP4Bc++Rr
wFCpp8EB6BduWeEGh186V2DKrc9v5yie4o/eL8nPMptUmeu5QOmrS6W/wn5HkidC
x/dCNagAHLwmET6NdQAsX/44TkwSWfwJXghbQMmcly2IjedLBm0=
=WeYc
-----END PGP SIGNATURE-----

--Sig_/.hE5Rqw28Eu7KiY39=slu+b--

