Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF71582886
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 16:25:05 +0200 (CEST)
Received: from localhost ([::1]:43310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhyC-000457-3Z
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 10:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGhn6-0002YV-M4; Wed, 27 Jul 2022 10:13:36 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:39490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oGhn4-0001al-Oj; Wed, 27 Jul 2022 10:13:36 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id r3so30403312ybr.6;
 Wed, 27 Jul 2022 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Jy3ULmb8PQjbButpfETSuOBZI4vGSzySeDchywT+KM=;
 b=EI6YJR/xwcC67dytfOsn9QuVNkMbFZIzm4ayilLPQvDseIBGdhvl/y26NfQSZdDUxY
 GHQ1tini+x+LrOsa7PYXZPacQmUtK9FLqyZDJUVx+sMKogUWIJfEDcYHAQvwOCDY9lkf
 /ngmwE+weqtSjtJVeaIf4u9Vs+TDER8sbgNJOWOTW0h/tAqSsedZ1uVu0UzLNS54oqYx
 k1dcWXIu5I8+tPXiZUgzw+aIzKqU3a8rX/Yw/ZQcNi7TSU2i7w7C9q/AFEEnVCREKf/E
 7gF+boEK1pIo9lIsAQ9wbN9+JTvbw88iWl5YMlQzVE0UnONYWh5Uxmqyn69gQyQ9zUdb
 eVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Jy3ULmb8PQjbButpfETSuOBZI4vGSzySeDchywT+KM=;
 b=i130vCOqyv2qT8nGdTLpC0tw+kKy90Gp6SSnniAfsVhOCWgbwakcfabxVP3wdHxVFa
 /nYJIklf3i8xn53ig9iH3JGoW2HE0DRovMUY6SSG5ZnHaqAdFdzJnJotU/Dlijo5JxQV
 vntWCgGYeoxiXUAezO04K9DZFX+lvkOTMVQKdFYJEebsxoo9YnAL3VM395hhFjedfUre
 dfd68BqXY97/iEMh38PwSNp9QbBKWYC3v0ymMoSwF+Jx5xKKjcTK1WBr5lO22m55Ddv0
 voyhuU/XkMAz7EflxWHoR2/r39C2ak/fTd7rBPyIopKrMmKbOt9dbVJBVbGZpJ0WcbAq
 xMDQ==
X-Gm-Message-State: AJIora/f1sZF6OODkLpvYyQ4WW4IxSEq5jZcNmt0j1w8COJv1JHhaXd6
 cMsfQBnDSV0yjZ90URwB2asuM9TvGjzqo42eqXk=
X-Google-Smtp-Source: AGRyM1sOi1rdyaQI5g2WFX6JO/eKvbYU7tNhTm3ZSJjPL0dTrKrcqBl/DbDL9c7b+6Fqtef2Tvmenxx9iHaVMqwGX3Q=
X-Received: by 2002:a25:e78e:0:b0:671:88ae:bee0 with SMTP id
 e136-20020a25e78e000000b0067188aebee0mr1534114ybh.58.1658931210464; Wed, 27
 Jul 2022 07:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220712021345.8530-1-faithilikerun@gmail.com>
 <20220712021345.8530-3-faithilikerun@gmail.com>
In-Reply-To: <20220712021345.8530-3-faithilikerun@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 27 Jul 2022 10:13:17 -0400
Message-ID: <CAJSP0QXpzgXjNuzdEAQ9hA4JU_gqO2mHAEVfesoZsjG6eDRz=g@mail.gmail.com>
Subject: Re: [RFC v4 2/9] qemu-io: add zoned block device operations.
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Markus Armbruster <armbru@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, qemu block <qemu-block@nongnu.org>, 
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jul 2022 at 22:17, Sam Li <faithilikerun@gmail.com> wrote:
> +int bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                        int64_t *nr_zones,
> +                        BlockZoneDescriptor *zones)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || (!drv->bdrv_co_zone_report)) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    if (drv->bdrv_co_zone_report) {

At this point we know drv->bdrv_co_zone_report is non-NULL because it
has been checked already. The if statement can be dropped.

> +        co.ret = drv->bdrv_co_zone_report(bs, offset, nr_zones, zones);
> +    } else {
> +        co.ret = -ENOTSUP;

This case is already handled by if (... ||
(!drv->bdrv_co_zone_report)) above. The else body can be dropped.

> +        goto out;
> +        qemu_coroutine_yield();
> +    }
> +
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
> +int bdrv_co_zone_mgmt(BlockDriverState *bs, enum zone_op op,

Please follow QEMU coding style and typedef BdrvZoneOp instead of
writing out enum zone_op.

> +        int64_t offset, int64_t len)
> +{
> +    BlockDriver *drv = bs->drv;
> +    CoroutineIOCompletion co = {
> +            .coroutine = qemu_coroutine_self(),
> +    };
> +    IO_CODE();
> +
> +    bdrv_inc_in_flight(bs);
> +    if (!drv || (!drv->bdrv_co_zone_mgmt)) {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +    }
> +
> +    if (drv->bdrv_co_zone_mgmt) {
> +        co.ret = drv->bdrv_co_zone_mgmt(bs, op, offset, len);
> +    } else {
> +        co.ret = -ENOTSUP;
> +        goto out;
> +        qemu_coroutine_yield();
> +    }

Same comments here.

> +
> +out:
> +    bdrv_dec_in_flight(bs);
> +    return co.ret;
> +}
> +
>  void *qemu_blockalign(BlockDriverState *bs, size_t size)
>  {
>      IO_CODE();
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 053a27141a..a0ae140452 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -80,6 +80,13 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
>  /* Ensure contents are flushed to disk.  */
>  int coroutine_fn bdrv_co_flush(BlockDriverState *bs);
>
> +/* Report zone information of zone block device. */
> +int coroutine_fn bdrv_co_zone_report(BlockDriverState *bs, int64_t offset,
> +                                     int64_t *nr_zones,
> +                                     BlockZoneDescriptor *zones);
> +int coroutine_fn bdrv_co_zone_mgmt(BlockDriverState *bs, zone_op op,
> +                                   int64_t offset, int64_t len);
> +
>  int bdrv_co_pdiscard(BdrvChild *child, int64_t offset, int64_t bytes);
>  bool bdrv_can_write_zeroes_with_unmap(BlockDriverState *bs);
>  int bdrv_block_status(BlockDriverState *bs, int64_t offset,
> @@ -289,6 +296,12 @@ bdrv_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>  int generated_co_wrapper
>  bdrv_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos);
>
> +int generated_co_wrapper
> +blk_zone_report(BlockBackend *blk, int64_t offset, int64_t *nr_zones,
> +                BlockZoneDescriptor *zones);
> +int generated_co_wrapper
> +blk_zone_mgmt(BlockBackend *blk, enum zone_op op, int64_t offset, int64_t len);
> +
>  /**
>   * bdrv_parent_drained_begin_single:
>   *
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 2f0d8ac25a..a88fa322d2 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -1706,6 +1706,144 @@ static const cmdinfo_t flush_cmd = {
>      .oneline    = "flush all in-core file state to disk",
>  };
>
> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, nr_zones;
> +
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    nr_zones = cvtnum(argv[optind]);
> +
> +    g_autofree BlockZoneDescriptor *zones = NULL;
> +    zones = g_new(BlockZoneDescriptor, nr_zones);
> +    ret = blk_zone_report(blk, offset, &nr_zones, zones);
> +    if (ret < 0) {
> +        printf("zone report failed: %s\n", strerror(-ret));
> +    } else {
> +        for (int i = 0; i < nr_zones; ++i) {
> +            printf("start: 0x%" PRIx64 ", len 0x%" PRIx64 ", "
> +                   "cap"" 0x%" PRIx64 ",wptr 0x%" PRIx64 ", "
> +                   "zcond:%u, [type: %u]\n",
> +                   zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
> +                   zones[i].cond, zones[i].type);
> +        }
> +    }
> +    return ret;
> +}
> +
> +static const cmdinfo_t zone_report_cmd = {
> +        .name = "zone_report",
> +        .altname = "zp",
> +        .cfunc = zone_report_f,
> +        .argmin = 2,
> +        .argmax = 2,
> +        .args = "offset number",
> +        .oneline = "report zone information",
> +};
> +
> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
> +{
> +    int ret;
> +    int64_t offset, len;
> +    ++optind;
> +    offset = cvtnum(argv[optind]);
> +    ++optind;
> +    len = cvtnum(argv[optind]);
> +    ret = blk_zone_mgmt(blk, zone_open, offset, len);

Please name enum constants in all caps: BDRV_ZONE_OPEN or BDRV_ZO_OPEN.

