Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528765F4D87
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 03:48:59 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oftWr-0005LB-RR
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 21:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27087a391=damien.lemoal@opensource.wdc.com>)
 id 1oftSy-0003OJ-75
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 21:44:56 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:8186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=27087a391=damien.lemoal@opensource.wdc.com>)
 id 1oftSs-0001be-Uu
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 21:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664934290; x=1696470290;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gZo8HDliEr7UU7HNfERTcXmt0DxZOeeVyigfim0rXts=;
 b=GqO5txRfBMCwf3hwDGSWJNb5rAcYSJOovpIsrHBYdlKyIAhvE404CYJX
 dDP0DTOzHQfM7gEorAJwASWut7Nk7oa0LjBUKaiy1ACx+NV8bWBKpWcRO
 Km49rzNhOk8n42ACgtAG5A7118ngv6huUTqemuZLeQ1BkDbxuOGV4FJu0
 UEgIJVakdAljbiWgAkkf40vg1SZRQdLcbMFb5Y0/7P+RReI1Tu8D/RX8Y
 BszOqdECRJvTRbNdGyxHSd+DbTDbCXO2U1VVZzLayxx4q1yM3xwuvg1tB
 tI4o3G1PyPF5DrqktDug2HLE4KLcy3gf7yqcN3/yXtopxkLSc+8ThDu0O g==;
X-IronPort-AV: E=Sophos;i="5.95,159,1661788800"; d="scan'208";a="211354218"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Oct 2022 09:44:39 +0800
IronPort-SDR: iKIZCwTqx4q7IsGSsqXJ6apX1uzKDX4SDBKGx8UG8SXtkg0CkA5ujnMc93Fles4xb5eHIciLp2
 sc9hzfPeqxGMtsxrFPQTnq5SI40QHo0ZIUnHEEO0/05JhjZS02TuoRaTzYAPUA9nFxfy82cg4g
 JsfM4i5vXYbuQS3jzYuVG0bJjGmBXZPlkzg377EsUJa+GHhk9ZbtMaTfOdVPKH7niQiyRPMnjM
 j1zk8S5H7XEKdG2NIxKugRudGmD/WROQ48aZZIXX4bvwzbhhvUb6UHjgbwJxuUMPJBBTYxygz8
 pSh8Y6f5SMayTKlYc4t6Brh7
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 17:58:52 -0700
IronPort-SDR: u9VEB2qKeUTexWV8c7KCLop2wQoGrViE262CTv95IhexbKv7EVKBLq875zlWTBzGLEKH3aGdVn
 M9DntMH5Rz6leNgTNNZnMAjtYILXE0FoXQ/YmSzQXC69c/FrCmShMFASmDgvFThHDlUpsXRY4A
 gEcKcQSHytx8fxSGzLuaacbQYotQjOYVQkTvt/kmXPXDSEqv7B0VWqp0S7oEJ7NG+7IR02bSVv
 j2h+fbSBkc5oqlEjbPbPp1iB5rKG5l7aZ+sG0qbSiZZe7x5CDH8FA/OuS07WzBaQqLPffeFvtz
 kf0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2022 18:44:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mhy6t3MtJz1Rwrq
 for <qemu-devel@nongnu.org>; Tue,  4 Oct 2022 18:44:38 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1664934276; x=1667526277; bh=gZo8HDliEr7UU7HNfERTcXmt0DxZOeeVyig
 fim0rXts=; b=Qwa/IH61YfIcxahQRndzfxEQdRYTJ7fMn6S/ZjigGDIzd7NXgmO
 3+hwHuMx2DWlDyMtgFceN3PQ/4bmcQlWdAZGroMmTGD/2sd4JIbQ9eBQW7bGSi3C
 ZK9z8KyAV6C/5YaO/XLeGkbEiBqWmZp08JkjaUC+QjmqWJyDcc92ujhG2MF1sFyD
 stalvuDBMBKXTXgNOc8zoQ38Ii4mLdzHHKC9YOuOG5LJIZM8Crb2i/YpaW/8OBBb
 3o37K/shiOLDCdkouWDN4nnCTYZA/uYHh8OcDZFBR/JSqsdVqLDo6+CVn+NYfH9G
 cRpe4irQZPw8W2w4Bi+LlyCM+I8ptJ37l2Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Mg6RWrAclSIE for <qemu-devel@nongnu.org>;
 Tue,  4 Oct 2022 18:44:36 -0700 (PDT)
Received: from [10.225.163.106] (unknown [10.225.163.106])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mhy6p501Cz1RvLy;
 Tue,  4 Oct 2022 18:44:34 -0700 (PDT)
Message-ID: <a91dc1d7-1d1f-9137-8ad0-bac01fad3ee7@opensource.wdc.com>
Date: Wed, 5 Oct 2022 10:44:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 1/2] file-posix: add the tracking of the zones wp
Content-Language: en-US
To: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 stefanha@redhat.com, dmitry.fomichev@wdc.com, hare@suse.de,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20220929093134.73974-1-faithilikerun@gmail.com>
 <20220929093134.73974-2-faithilikerun@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220929093134.73974-2-faithilikerun@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=27087a391=damien.lemoal@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.449,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/22 18:31, Sam Li wrote:
> Since Linux doesn't have a user API to issue zone append operations to
> zoned devices from user space, the file-posix driver is modified to add
> zone append emulation using regular writes. To do this, the file-posix
> driver tracks the wp location of all zones of the device. It uses an
> array of uint64_t. The most significant bit of each wp location indicates
> if the zone type is sequential write required.
> 
> The zones wp can be changed due to the following operations issued:
> - zone reset: change the wp to the start offset of that zone
> - zone finish: change to the end location of that zone
> - write to a zone
> - zone append
> 
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  block/file-posix.c               | 138 ++++++++++++++++++++++++++++++-
>  include/block/block-common.h     |  16 ++++
>  include/block/block_int-common.h |   5 ++
>  include/block/raw-aio.h          |   4 +-
>  4 files changed, 159 insertions(+), 4 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 73656d87f2..33e81ac112 100755
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -206,6 +206,8 @@ typedef struct RawPosixAIOData {
>          struct {
>              struct iovec *iov;
>              int niov;
> +            int64_t *append_sector;
> +            BlockZoneWps *wps;
>          } io;
>          struct {
>              uint64_t cmd;
> @@ -1332,6 +1334,59 @@ static int hdev_get_max_segments(int fd, struct stat *st) {
>  #endif
>  }
>  
> +#if defined(CONFIG_BLKZONED)
> +static int report_zone_wp(int64_t offset, int fd, BlockZoneWps *wps,
> +                          unsigned int nrz) {

Maybe rename this to get_zones_wp() ?

> +    struct blk_zone *blkz;
> +    int64_t rep_size;
> +    int64_t sector = offset >> BDRV_SECTOR_BITS;
> +    int ret, n = 0, i = 0;
> +
> +    rep_size = sizeof(struct blk_zone_report) + nrz * sizeof(struct blk_zone);
> +    g_autofree struct blk_zone_report *rep = NULL;

To be cleaner, move this declaration above with the others ?

> +    rep = g_malloc(rep_size);
> +
> +    blkz = (struct blk_zone *)(rep + 1);
> +    while (n < nrz) {
> +        memset(rep, 0, rep_size);
> +        rep->sector = sector;
> +        rep->nr_zones = nrz - n;
> +
> +        do {
> +            ret = ioctl(fd, BLKREPORTZONE, rep);
> +        } while (ret != 0 && errno == EINTR);
> +        if (ret != 0) {
> +            error_report("%d: ioctl BLKREPORTZONE at %" PRId64 " failed %d",
> +                    fd, offset, errno);
> +            return -errno;
> +        }
> +
> +        if (!rep->nr_zones) {
> +            break;
> +        }
> +
> +        for (i = 0; i < rep->nr_zones; i++, n++) {
> +            wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
> +            sector = blkz[i].start + blkz[i].len;
> +
> +            /*
> +             * In the wp tracking, it only cares if the zone type is sequential
> +             * writes required so that the wp can advance to the right location.

Or sequential write preferred (host aware case)

> +             * Instead of the type of zone_type which is an 8-bit unsigned
> +             * integer, use the first most significant bits of the wp location
> +             * to indicate the zone type: 0 for SWR zones and 1 for the
> +             * others.
> +             */
> +            if (!(blkz[i].type & BLK_ZONE_TYPE_SEQWRITE_REQ)) {

This should be:

		if (blkz[i].type != BLK_ZONE_TYPE_CONVENTIONAL) {

Note that the type field is not a bit-field. So you must compare values
instead of doing bit operations.

> +                wps->wp[i] += (uint64_t)1 << 63;

You can simplify this:

		   wps->wp[i] |= 1ULL << 63;

Overall, I would rewrite this like this:

for (i = 0; i < rep->nr_zones; i++, n++) {
    /*
     * The wp tracking cares only about sequential write required
     * and sequential write preferred zones so that the wp can
     * advance to the right location.
     * Use the most significant bit of the wp location
     * to indicate the zone type: 0 for SWR zones and 1 for
     * conventional zones.
     */
    if (blkz[i].type == BLK_ZONE_TYPE_CONVENTIONAL) {
        wps->wp[i] = 1ULL << 63;
    else
        wps->wp[i] = blkz[i].wp << BDRV_SECTOR_BITS;
}
sector = blkz[i - 1].start + blkz[i - 1].len;

Which I think is a lot simpler.

> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +#endif
> +
>  static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
>      BDRVRawState *s = bs->opaque;
> @@ -1415,6 +1470,20 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>              error_report("Invalid device capacity %" PRId64 " bytes ", bs->bl.capacity);
>              return;
>          }
> +
> +        ret = get_sysfs_long_val(&st, "physical_block_size");
> +        if (ret >= 0) {
> +            bs->bl.write_granularity = ret;
> +        }

This change seems unrelated to the wp tracking. Should this be moved to a
different patch ?

> +
> +        bs->bl.wps = g_malloc(sizeof(BlockZoneWps) + sizeof(int64_t) * ret);
> +        qemu_mutex_init(&bs->bl.wps->lock);

Move this initialization after the if block. Doing so, you do not need to
call mutex destroy in case of error.

> +        if (report_zone_wp(0, s->fd, bs->bl.wps, ret) < 0 ) {
> +            error_report("report wps failed");
> +            qemu_mutex_destroy(&bs->bl.wps->lock);
> +            g_free(bs->bl.wps);
> +            return;
> +        }
>      }
>  }
>  
> @@ -1582,7 +1651,7 @@ static ssize_t handle_aiocb_rw_vector(RawPosixAIOData *aiocb)
>      ssize_t len;
>  
>      do {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE)
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))
>              len = qemu_pwritev(aiocb->aio_fildes,
>                                 aiocb->io.iov,
>                                 aiocb->io.niov,
> @@ -1612,7 +1681,7 @@ static ssize_t handle_aiocb_rw_linear(RawPosixAIOData *aiocb, char *buf)
>      ssize_t len;
>  
>      while (offset < aiocb->aio_nbytes) {
> -        if (aiocb->aio_type & QEMU_AIO_WRITE) {
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
>              len = pwrite(aiocb->aio_fildes,
>                           (const char *)buf + offset,
>                           aiocb->aio_nbytes - offset,
> @@ -1705,7 +1774,7 @@ static int handle_aiocb_rw(void *opaque)
>      }
>  
>      nbytes = handle_aiocb_rw_linear(aiocb, buf);
> -    if (!(aiocb->aio_type & QEMU_AIO_WRITE)) {
> +    if (!(aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND))) {
>          char *p = buf;
>          size_t count = aiocb->aio_nbytes, copy;
>          int i;
> @@ -1726,6 +1795,23 @@ static int handle_aiocb_rw(void *opaque)
>  
>  out:
>      if (nbytes == aiocb->aio_nbytes) {
> +#if defined(CONFIG_BLKZONED)
> +        if (aiocb->aio_type & (QEMU_AIO_WRITE | QEMU_AIO_ZONE_APPEND)) {
> +            BlockZoneWps *wps = aiocb->io.wps;

Why adding this pointer to the aiocb struct ? You can get the array from
aiocb->bs->bl.wps, no ?

> +            int index = aiocb->aio_offset / aiocb->bs->bl.zone_size;
> +            if (wps) {
> +               if (BDRV_ZT_IS_SWR(wps->wp[index])) {
> +                    qemu_mutex_lock(&wps->lock);
> +                    wps->wp[index] += aiocb->aio_nbytes;
> +                    qemu_mutex_unlock(&wps->lock);
> +                }
> +
> +                if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
> +                    *aiocb->io.append_sector = wps->wp[index] >> BDRV_SECTOR_BITS;

Bug: the append sector must be the first sector written, not the wp
(sector following the last written sector). So this must be done *before*
advancing the wp.

You need to have wps->lock held here too since you are reading
wps->wp[index]. So the mutex lock/unlock needs to be around the 2 hunks
under "if (wps) {". Also, given that there cannot be any zone append
issued to conventional zones (they will fail), you can simplify:

            if (wps) {
                qemu_mutex_lock(&wps->lock);
                if (BDRV_ZT_IS_SWR(wps->wp[index])) {
                    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
                        *aiocb->io.append_sector =
                           wps->wp[index] >> BDRV_SECTOR_BITS;
                    }
                    wps->wp[index] += aiocb->aio_nbytes;
                }
                qemu_mutex_unlock(&wps->lock);
            }

Now the last problem with this code is sequential write preferred zones.
For these, the write may actually be overwriting sectors that have already
been written, meaning that the wp may not necessarilly need to be
advanced. You can handle that case together with SWR case simply like this:

            if (wps) {
                qemu_mutex_lock(&wps->lock);
                if (BDRV_ZT_IS_SWR(wps->wp[index])) {
                    uint64_t wend_offset =
                         aiocb->aio_offset + aiocb->aio_nbytes;

                    if (aiocb->aio_type & QEMU_AIO_ZONE_APPEND) {
                        *aiocb->io.append_sector =
                           wps->wp[index] >> BDRV_SECTOR_BITS;
                    }

                    /* Advance the wp if needed */
                    if (wend_offset > wps->wp[index])
                        wps->wp[index] = wend_offset;
                }
                qemu_mutex_unlock(&wps->lock);
            }

> +                }
> +            }
> +        }
> +#endif
>          return 0;
>      } else if (nbytes >= 0 && nbytes < aiocb->aio_nbytes) {
>          if (aiocb->aio_type & QEMU_AIO_WRITE) {
> @@ -1737,6 +1823,19 @@ out:
>          }
>      } else {
>          assert(nbytes < 0);
> +#if defined(CONFIG_BLKZONED)
> +        if (aiocb->aio_type == QEMU_AIO_ZONE_APPEND) {

Why do this only for zone append ? Regular write error also need a refresh
of the zone wp.

> +            qemu_mutex_lock(&aiocb->bs->bl.wps->lock);
> +            if (report_zone_wp(0, aiocb->aio_fildes, aiocb->bs->bl.wps,
> +                           aiocb->bs->bl.nr_zones) < 0) {
> +                error_report("report zone wp failed");
> +                qemu_mutex_destroy(&aiocb->bs->bl.wps->lock);
> +                g_free(aiocb->bs->bl.wps);
> +                return -EINVAL;
> +            }
> +            qemu_mutex_unlock(&aiocb->bs->bl.wps->lock);

This really needs to be a helper function, e.g. update_zone_wp() or
something like this. Aslo, why nuke the entire zone array if the refresh
for this zone fails ? You could simply leave it as is. The next write may
again fail and another attempt at refreshing it done.

> +        }
> +#endif
>          return nbytes;
>      }
>  }
> @@ -2027,12 +2126,16 @@ static int handle_aiocb_zone_report(void *opaque) {
>  static int handle_aiocb_zone_mgmt(void *opaque) {
>  #if defined(CONFIG_BLKZONED)
>      RawPosixAIOData *aiocb = opaque;
> +    BlockDriverState *bs = aiocb->bs;
>      int fd = aiocb->aio_fildes;
>      int64_t sector = aiocb->aio_offset / 512;
>      int64_t nr_sectors = aiocb->aio_nbytes / 512;
>      struct blk_zone_range range;
>      int ret;
>  
> +    BlockZoneWps *wps = bs->bl.wps;
> +    int index = aiocb->aio_offset / bs->bl.zone_size;
> +
>      /* Execute the operation */
>      range.sector = sector;
>      range.nr_sectors = nr_sectors;
> @@ -2045,6 +2148,22 @@ static int handle_aiocb_zone_mgmt(void *opaque) {
>                       errno);
>          return -errno;
>      }
> +    
> +    if (aiocb->zone_mgmt.all) {
> +        for (int i = 0; i < bs->bl.nr_zones; ++i) {
> +            qemu_mutex_lock(&wps->lock);
> +            wps->wp[i] = i * bs->bl.zone_size;
> +            qemu_mutex_unlock(&wps->lock);
> +        }
> +    } else if (aiocb->zone_mgmt.zone_op == BLKRESETZONE) {
> +        qemu_mutex_lock(&wps->lock);
> +        wps->wp[index] = aiocb->aio_offset;
> +        qemu_mutex_unlock(&wps->lock);
> +    } else if (aiocb->zone_mgmt.zone_op == BLKFINISHZONE) {
> +        qemu_mutex_lock(&wps->lock);
> +        wps->wp[index] = aiocb->aio_offset + bs->bl.zone_size;

This may be the last zone of the device, which may be smaller. So you need
to check that here. Same for the first case for reset all: you need to
handle the smaller last zone if there is one.

> +        qemu_mutex_unlock(&wps->lock);
> +    }

Instead of the lock/unlock for each case here, take the mutex lock before
the if () and unlock it after it. Less lines :)

Also, if the zone management command fails, you need to do a report zones
and refresh the wps array.

>      return ret;
>  #else
>      return -ENOTSUP;
> @@ -2355,6 +2474,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>          },
>      };
>  
> +    BlockZoneWps *wps = bs->bl.wps;
> +    acb.io.wps = wps;

You do not need the pws variable. Simply do:

       acb.io.wps = bs->bl.wps;

>      assert(qiov->size == bytes);
>      return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
>  }
> @@ -2465,6 +2586,12 @@ static void raw_close(BlockDriverState *bs)
>      BDRVRawState *s = bs->opaque;
>  
>      if (s->fd >= 0) {
> +#if defined(CONFIG_BLKZONED)
> +        if (bs->bl.wps) {
> +            qemu_mutex_destroy(&bs->bl.wps->lock);
> +            g_free(bs->bl.wps);
> +        }
> +#endif
>          qemu_close(s->fd);
>          s->fd = -1;
>      }
> @@ -3299,6 +3426,11 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, BlockZoneOp op,
>          zone_op_name = "BLKRESETZONE";
>          zone_op = BLKRESETZONE;
>          break;
> +    case BLK_ZO_RESET_ALL:
> +        zone_op_name = "BLKRESETZONE";
> +        zone_op = BLKRESETZONE;
> +        is_all = true;
> +        break;

This change seems unrelated to the wp tracking. Different patch ?

>      default:
>          g_assert_not_reached();
>      }
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 8efb6b0c43..43bfc484eb 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -58,6 +58,7 @@ typedef enum BlockZoneOp {
>      BLK_ZO_CLOSE,
>      BLK_ZO_FINISH,
>      BLK_ZO_RESET,
> +    BLK_ZO_RESET_ALL,

same here. Adding reset all support should be a different patch.
>  } BlockZoneOp;
>  
>  typedef enum BlockZoneModel {
> @@ -96,6 +97,14 @@ typedef struct BlockZoneDescriptor {
>      BlockZoneCondition cond;
>  } BlockZoneDescriptor;
>  
> +/*
> + * Track write pointers of a zone in bytes.
> + */
> +typedef struct BlockZoneWps {
> +    QemuMutex lock;
> +    uint64_t wp[];
> +} BlockZoneWps;
> +
>  typedef struct BlockDriverInfo {
>      /* in bytes, 0 if irrelevant */
>      int cluster_size;
> @@ -209,6 +218,13 @@ typedef enum {
>  #define BDRV_SECTOR_BITS   9
>  #define BDRV_SECTOR_SIZE   (1ULL << BDRV_SECTOR_BITS)
>  
> +/*
> + * Get the first most significant bit of WP. If it is zero, then
> + * the zone type is SWR.
> + */
> +#define BDRV_ZT_IS_SWR(WP)    ((WP & 0x8000000000000000) == 0) ? (true) : \
> +                              (false)

Simplify:

#define BDRV_ZT_IS_SWR(wp)	(!((wp) & (1ULL << 63))

But since this must be used for both SWR and SWP zones, I would reverse
this into:

#define BDRV_ZONE_IS_CONV(wp)	((wp) & (1ULL << 63))

Which is a lot simpler.

> +
>  #define BDRV_REQUEST_MAX_SECTORS MIN_CONST(SIZE_MAX >> BDRV_SECTOR_BITS, \
>                                             INT_MAX >> BDRV_SECTOR_BITS)
>  #define BDRV_REQUEST_MAX_BYTES (BDRV_REQUEST_MAX_SECTORS << BDRV_SECTOR_BITS)
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 37dddc603c..59c2d1316d 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -857,6 +857,11 @@ typedef struct BlockLimits {
>  
>      /* device capacity expressed in bytes */
>      int64_t capacity;
> +
> +    /* array of write pointers' location of each zone in the zoned device. */
> +    BlockZoneWps *wps;
> +
> +    int64_t write_granularity;
>  } BlockLimits;
>  
>  typedef struct BdrvOpBlocker BdrvOpBlocker;
> diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> index 3d26929cdd..f13cc1887b 100644
> --- a/include/block/raw-aio.h
> +++ b/include/block/raw-aio.h
> @@ -31,6 +31,7 @@
>  #define QEMU_AIO_TRUNCATE     0x0080
>  #define QEMU_AIO_ZONE_REPORT  0x0100
>  #define QEMU_AIO_ZONE_MGMT    0x0200
> +#define QEMU_AIO_ZONE_APPEND  0x0400
>  #define QEMU_AIO_TYPE_MASK \
>          (QEMU_AIO_READ | \
>           QEMU_AIO_WRITE | \
> @@ -41,7 +42,8 @@
>           QEMU_AIO_COPY_RANGE | \
>           QEMU_AIO_TRUNCATE  | \
>           QEMU_AIO_ZONE_REPORT | \
> -         QEMU_AIO_ZONE_MGMT)
> +         QEMU_AIO_ZONE_MGMT | \
> +         QEMU_AIO_ZONE_APPEND)

This should be introduced in patch 2. This patch should be only about zone
wp tracking with regular writes and zone management ops. The second patch
can implement zone append emulation thanks to this patch. So separate.

>  
>  /* AIO flags */
>  #define QEMU_AIO_MISALIGNED   0x1000

-- 
Damien Le Moal
Western Digital Research


