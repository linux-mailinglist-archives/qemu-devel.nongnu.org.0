Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C4A6F06DD
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:47:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1xa-00043L-Mz; Thu, 27 Apr 2023 09:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1ps1xO-00041v-KZ; Thu, 27 Apr 2023 09:46:47 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1ps1xK-0008IW-FJ; Thu, 27 Apr 2023 09:46:44 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-b9a824c3a95so723047276.1; 
 Thu, 27 Apr 2023 06:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682603201; x=1685195201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eyetcH04Kjj3EpFQV/Xeqk0cNieHTgIFEfEwhkgNxJA=;
 b=d8efuIQ8UWDbnuXZVz4/39Lg7fJxdcKYbmFJEQWlhpWqsP+NClPYcAuNXEy9NBcex6
 ClJ15OmsHQMnIEMnFeZvoz2rBcgZ4iRpfZzReyetXILG3bvLZPdRFKh/mpN3u9PVPWZ7
 aPle8J0hMW52Hwq9nPRWBrtZmD2KGzByx33Q0ykaBYm7f4cAjSHExzuSvl9/vsDwimQn
 ufZKWZwehXhbjOOQoYahpnjX38MrVacBd2qhhvFHLn+U33krvl0KXGIUILtsXRH3mr/J
 4z4nTxnwiTmTEV/I9D5D4/AbXKta44XhngHzRg1zovGBCVO9zKR5nL/HamSGX5ght+tj
 plTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682603201; x=1685195201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eyetcH04Kjj3EpFQV/Xeqk0cNieHTgIFEfEwhkgNxJA=;
 b=PGvvMzLCKyE8pIZRqwIDdC0u2ciB8+txrjvKkSYgZ6p5LBfgQhC+//IqhKs9yr3apo
 FCoBgwEoKNiIe54eovWm6c6qZmpIZgjALeuV4p/nA37wG4GYcQKhwIWY7TMKDBUlASyL
 pgIxsVlzI6SWGGwDTIgy3FLRP5KoHcK/1eJIa+DM1VWqfaBM971g5ovDSvtByMpBBFyg
 C8Kw7MJoOhdjpmJJlfovPJB8XGNNAhdf0ym7Or5bxqSc+AJVQneMQihZDF+JNjDyV6bo
 QGuF6A0YwEn1W70ub/HSzsdhe1/dY4s+bGYLDYCD2A2UGPbf19HXEiGNytPxLHc8q654
 ph7A==
X-Gm-Message-State: AC+VfDy3ZQm89rL2ow5wnjVe0eK6by4MPSXi7gs4wa8oq37Wfo6EFeu1
 jU182Qvua5WaLo+Vs1CEjfn04lhSKwOUKKeMuMY=
X-Google-Smtp-Source: ACHHUZ6t2EFi01QNq0ZLlo82W8SXZzOGQjWloc6zAXMBDFw7uZQd5RwhvhBVRoWVPFeN39D0g3H5hEFVdEVfKrpOFxU=
X-Received: by 2002:a81:8787:0:b0:54f:ba25:61c5 with SMTP id
 x129-20020a818787000000b0054fba2561c5mr1263081ywf.0.1682603200608; Thu, 27
 Apr 2023 06:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230424094309.197969-1-alexander.ivanov@virtuozzo.com>
 <20230424094309.197969-4-alexander.ivanov@virtuozzo.com>
In-Reply-To: <20230424094309.197969-4-alexander.ivanov@virtuozzo.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Thu, 27 Apr 2023 16:46:04 +0300
Message-ID: <CAL77WPBykju=hEwxkiKvVkNgbGeVxuJc2tuBssTkN0rTupjJiQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] parallels: Add checking and repairing duplicate
 offsets in BAT
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, den@virtuozzo.com, 
 stefanha@redhat.com, vsementsov@yandex-team.ru, kwolf@redhat.com, 
 hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yb1-xb29.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Sorry for the noise again , but I have another note

On Mon, Apr 24, 2023 at 12:44=E2=80=AFPM Alexander Ivanov
<alexander.ivanov@virtuozzo.com> wrote:
>
> Cluster offsets must be unique among all the BAT entries. Find duplicate
> offsets in the BAT and fix it by copying the content of the relevant
> cluster to a newly allocated cluster and set the new cluster offset to th=
e
> duplicated entry.
>
> Add host_cluster_index() helper to deduplicate the code.
>
> Move parallels_fix_leak() call to parallels_co_check() to fix both types
> of leak: real corruption and a leak produced by allocate_clusters()
> during deduplication.
>
> Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
> ---
>  block/parallels.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 129 insertions(+), 5 deletions(-)
>
> diff --git a/block/parallels.c b/block/parallels.c
> index ec89ed894b..3b992e8173 100644
> --- a/block/parallels.c
> +++ b/block/parallels.c
> @@ -136,6 +136,12 @@ static int cluster_remainder(BDRVParallelsState *s, =
int64_t sector_num,
>      return MIN(nb_sectors, ret);
>  }
>
> +static uint32_t host_cluster_index(BDRVParallelsState *s, int64_t off)
> +{
> +    off -=3D s->header->data_off << BDRV_SECTOR_BITS;
> +    return off / s->cluster_size;
> +}
> +
>  static int64_t block_status(BDRVParallelsState *s, int64_t sector_num,
>                              int nb_sectors, int *pnum)
>  {
> @@ -533,7 +539,6 @@ parallels_check_leak(BlockDriverState *bs, BdrvCheckR=
esult *res,
>  {
>      BDRVParallelsState *s =3D bs->opaque;
>      int64_t count, leak_size;
> -    int ret;
>
>      leak_size =3D parallels_get_leak_size(bs, res);
>      if (leak_size < 0) {
> @@ -550,16 +555,123 @@ parallels_check_leak(BlockDriverState *bs, BdrvChe=
ckResult *res,
>              fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR", leak_size);
>
>      if (fix & BDRV_FIX_LEAKS) {
> -        ret =3D parallels_fix_leak(bs, res);
> -        if (ret < 0) {
> -            return ret;
> -        }
>          res->leaks_fixed +=3D count;
>      }
>
>      return 0;
>  }
>
> +static int parallels_check_duplicate(BlockDriverState *bs,
> +                                     BdrvCheckResult *res,
> +                                     BdrvCheckMode *fix)
> +{
> +    BDRVParallelsState *s =3D bs->opaque;
> +    QEMUIOVector qiov;
> +    int64_t off, sector;
> +    unsigned long *bitmap;
> +    uint32_t i, bitmap_size, cluster_index;
> +    int n, ret =3D 0;
> +    uint64_t *buf =3D NULL;
> +
> +    /*
> +     * Create a bitmap of used clusters.
> +     * If a bit is set, there is a BAT entry pointing to this cluster.
> +     * Loop through the BAT entries, check bits relevant to an entry off=
set.
> +     * If bit is set, this entry is duplicated. Otherwise set the bit.
> +     *
> +     * We shouldn't worry about newly allocated clusters outside the ima=
ge
> +     * because they are created higher then any existing cluster pointed=
 by
> +     * a BAT entry.
> +     */
> +    bitmap_size =3D host_cluster_index(s, res->image_end_offset);
> +    bitmap =3D bitmap_new(bitmap_size);
> +
> +    buf =3D qemu_memalign(4096, s->cluster_size);
> +    qemu_iovec_init(&qiov, 0);
> +    qemu_iovec_add(&qiov, buf, s->cluster_size);
> +
> +    for (i =3D 0; i < s->bat_size; i++) {
> +        off =3D bat2sect(s, i) << BDRV_SECTOR_BITS;
> +        if (off =3D=3D 0) {
> +            continue;
> +        }
> +
> +        cluster_index =3D host_cluster_index(s, off);
> +        if (test_bit(cluster_index, bitmap)) {
> +            /* this cluster duplicates another one */
> +            fprintf(stderr,
> +                    "%s duplicate offset in BAT entry %u\n",
> +                    *fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
> +
> +            res->corruptions++;
> +
> +            if (*fix & BDRV_FIX_ERRORS) {
> +                /*
> +                 * Reset the entry and allocate a new cluster
> +                 * for the relevant guest offset. In this way we let
> +                 * the lower layer to place the new cluster properly.
> +                 * Copy the original cluster to the allocated one.
> +                 */
> +                parallels_set_bat_entry(s, i, 0);
> +
> +                ret =3D bdrv_co_pread(bs->file, off, s->cluster_size, bu=
f, 0);
> +                if (ret < 0) {
> +                    res->check_errors++;
> +                    goto out;
> +                }
> +
> +                sector =3D (i * s->cluster_size) >> BDRV_SECTOR_BITS;
> +                sector =3D allocate_clusters(bs, sector, s->tracks, &n);
> +                if (sector < 0) {
> +                    res->check_errors++;
> +                    ret =3D sector;
> +                    goto out;
> +                }

I can not understand how index in a BAT table related to s->cluster_size.
Probably there should be "cluster_index" used?
Anyway, looks like both cause uint32 truncation as result of
({i,cluster_index} * s->cluster_size)

Regards,
Mike.

