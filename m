Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7E05F6D29
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 19:43:33 +0200 (CEST)
Received: from localhost ([::1]:50420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogUuB-0003T2-Uk
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 13:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ogTxC-0003mM-G1
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ogTww-0002PE-PW
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 12:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665074537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pO+P+v29jkNj3yZE6EqtVX3LtORai6z2qEWVMQ1ur9M=;
 b=EoK0iAg5ec+4ruITDRrJLc7DUjkGY0Mgc1oWU3AdSrMa9Ukzf/KpRLBBzWOZstBAkUTA0l
 Ho5SXtyPyXwtpIgiXRzXduupuol3ML/dkV7q2ahI1i7DgMjOKs5Fr3/vibZvXt79PNpbop
 DrnpaKWcJTSi0EcXrEKTmhMOf8JrGk0=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-QXj9L143MBepfxHv8pZZfg-1; Thu, 06 Oct 2022 12:42:16 -0400
X-MC-Unique: QXj9L143MBepfxHv8pZZfg-1
Received: by mail-io1-f70.google.com with SMTP id
 n23-20020a056602341700b00689fc6dbfd6so1482226ioz.8
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 09:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pO+P+v29jkNj3yZE6EqtVX3LtORai6z2qEWVMQ1ur9M=;
 b=kEyCLJLxzRPlq8S04W6aAVLm/re9jOxyrtecncjVone6Y2Bf3lcm+lBbupEEhn22T6
 FsX6fTFggYDiQDDXPDAJWKwPg2TuXmwBUYtC75lU8Mz233IOazKyZaXV/qG8HRQe3ze+
 w6YSo7sUrieQ6+wif9s+YNtAPoKrfT7SeTYmFsukDbS3ivKpi6WQNDNhfZ1va4jH9Grg
 Bnei5o/8f1eVSoRvWjYR4NaeDV6+ufnmMUDZNFTBXxdqYCuTPVYknEx8rtqgouBaUJlu
 FaIkJVsvOR1KPQV9+WoTFAp1ompYQrR4FVU48qlAiL0Ub9d3dIav/lVVlypDO7SuzTL7
 7bYw==
X-Gm-Message-State: ACrzQf21mGvWvpjnPNt6YaiLH1PTolWTLJqbJrw1rWg8DTdTlLwBF3FJ
 rxL3MbZ73SQV1Z4Duj0UnhkAji2p6NMjmBBnjrELt0vvA6nOnt61WwY0+DLhosCiEkAIy3O/EdE
 Vz6vTlEUcFNsoeI68/ojDeFvNO1tz4PA=
X-Received: by 2002:a05:6e02:144f:b0:2fa:7ede:ece9 with SMTP id
 p15-20020a056e02144f00b002fa7edeece9mr256901ilo.106.1665074535651; 
 Thu, 06 Oct 2022 09:42:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rOhP9tiWUIaxCLecl3KDDafRXHIHt0j8bMpE9ianP5eVwKQzT0+KqCoIRZ68l9cpSkjcq91uMhlFZzJmmID0=
X-Received: by 2002:a05:6e02:144f:b0:2fa:7ede:ece9 with SMTP id
 p15-20020a056e02144f00b002fa7edeece9mr256878ilo.106.1665074535356; Thu, 06
 Oct 2022 09:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-3-stefanha@redhat.com>
In-Reply-To: <20220927193431.22302-3-stefanha@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 6 Oct 2022 17:41:39 +0100
Message-ID: <CAELaAXxC1o+MWj-Ew2CQ1UhtHQmS8weS0jSDk2Y1ObV4pqKQEA@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] blkio: add libblkio block driver
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>, 
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 "Denis V. Lunev" <den@openvz.org>, Xie Changlong <xiechanglong.d@gmail.com>, 
 Eric Blake <eblake@redhat.com>, integration@gluster.org, 
 David Hildenbrand <david@redhat.com>, Wen Congyang <wencongyang2@huawei.com>, 
 Laurent Vivier <lvivier@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Sep 27, 2022 at 8:34 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> +static int blkio_virtio_blk_vhost_user_open(BlockDriverState *bs,
> +        QDict *options, int flags, Error **errp)
> +{
> +    const char *path = qdict_get_try_str(options, "path");
> +    BDRVBlkioState *s = bs->opaque;
> +    int ret;
> +
> +    if (!path) {
> +        error_setg(errp, "missing 'path' option");
> +        return -EINVAL;
> +    }
> +
> +    ret = blkio_set_str(s->blkio, "path", path);
> +    qdict_del(options, "path");
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to set path: %s",
> +                         blkio_get_error_msg());
> +        return ret;
> +    }
> +
> +    if (!(flags & BDRV_O_NOCACHE)) {
> +        error_setg(errp, "cache.direct=off is not supported");
> +        return -EINVAL;
> +    }
> +    return 0;
> +}
> +
> +static int blkio_virtio_blk_vhost_vdpa_open(BlockDriverState *bs,
> +        QDict *options, int flags, Error **errp)
> +{
> +    const char *path = qdict_get_try_str(options, "path");
> +    BDRVBlkioState *s = bs->opaque;
> +    int ret;
> +
> +    if (!path) {
> +        error_setg(errp, "missing 'path' option");
> +        return -EINVAL;
> +    }
> +
> +    ret = blkio_set_str(s->blkio, "path", path);
> +    qdict_del(options, "path");
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "failed to set path: %s",
> +                         blkio_get_error_msg());
> +        return ret;
> +    }
> +
> +    if (!(flags & BDRV_O_NOCACHE)) {
> +        error_setg(errp, "cache.direct=off is not supported");
> +        return -EINVAL;
> +    }
> +    return 0;
> +}

These two functions are (currently) exact duplicates. Should we just
have a single blkio_virtio_blk_open() function?

> +static BlockDriver bdrv_io_uring = {
> +    .format_name                = DRIVER_IO_URING,
> +    .protocol_name              = DRIVER_IO_URING,
> +    .instance_size              = sizeof(BDRVBlkioState),
> +    .bdrv_needs_filename        = true,
> +    .bdrv_file_open             = blkio_file_open,
> +    .bdrv_close                 = blkio_close,
> +    .bdrv_getlength             = blkio_getlength,
> +    .bdrv_get_info              = blkio_get_info,
> +    .bdrv_attach_aio_context    = blkio_attach_aio_context,
> +    .bdrv_detach_aio_context    = blkio_detach_aio_context,
> +    .bdrv_co_pdiscard           = blkio_co_pdiscard,
> +    .bdrv_co_preadv             = blkio_co_preadv,
> +    .bdrv_co_pwritev            = blkio_co_pwritev,
> +    .bdrv_co_flush_to_disk      = blkio_co_flush,
> +    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
> +    .bdrv_io_unplug             = blkio_io_unplug,
> +    .bdrv_refresh_limits        = blkio_refresh_limits,
> +};
> +
> +static BlockDriver bdrv_virtio_blk_vhost_user = {
> +    .format_name                = DRIVER_VIRTIO_BLK_VHOST_USER,
> +    .protocol_name              = DRIVER_VIRTIO_BLK_VHOST_USER,
> +    .instance_size              = sizeof(BDRVBlkioState),
> +    .bdrv_file_open             = blkio_file_open,
> +    .bdrv_close                 = blkio_close,
> +    .bdrv_getlength             = blkio_getlength,
> +    .bdrv_get_info              = blkio_get_info,
> +    .bdrv_attach_aio_context    = blkio_attach_aio_context,
> +    .bdrv_detach_aio_context    = blkio_detach_aio_context,
> +    .bdrv_co_pdiscard           = blkio_co_pdiscard,
> +    .bdrv_co_preadv             = blkio_co_preadv,
> +    .bdrv_co_pwritev            = blkio_co_pwritev,
> +    .bdrv_co_flush_to_disk      = blkio_co_flush,
> +    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
> +    .bdrv_io_unplug             = blkio_io_unplug,
> +    .bdrv_refresh_limits        = blkio_refresh_limits,
> +};
> +
> +static BlockDriver bdrv_virtio_blk_vhost_vdpa = {
> +    .format_name                = DRIVER_VIRTIO_BLK_VHOST_VDPA,
> +    .protocol_name              = DRIVER_VIRTIO_BLK_VHOST_VDPA,
> +    .instance_size              = sizeof(BDRVBlkioState),
> +    .bdrv_file_open             = blkio_file_open,
> +    .bdrv_close                 = blkio_close,
> +    .bdrv_getlength             = blkio_getlength,
> +    .bdrv_get_info              = blkio_get_info,
> +    .bdrv_attach_aio_context    = blkio_attach_aio_context,
> +    .bdrv_detach_aio_context    = blkio_detach_aio_context,
> +    .bdrv_co_pdiscard           = blkio_co_pdiscard,
> +    .bdrv_co_preadv             = blkio_co_preadv,
> +    .bdrv_co_pwritev            = blkio_co_pwritev,
> +    .bdrv_co_flush_to_disk      = blkio_co_flush,
> +    .bdrv_co_pwrite_zeroes      = blkio_co_pwrite_zeroes,
> +    .bdrv_io_unplug             = blkio_io_unplug,
> +    .bdrv_refresh_limits        = blkio_refresh_limits,
> +};

It's difficult to identify the fields that differ between
BlockDrivers. Maybe we could do something like:

    #define DRIVER(name, ...) \
        { \
            .format_name             = name, \
            .protocol_name           = name, \
            .instance_size           = sizeof(BDRVBlkioState), \
            .bdrv_file_open          = blkio_file_open, \
            .bdrv_close              = blkio_close, \
            .bdrv_getlength          = blkio_getlength, \
            .bdrv_get_info           = blkio_get_info, \
            .bdrv_attach_aio_context = blkio_attach_aio_context, \
            .bdrv_detach_aio_context = blkio_detach_aio_context, \
            .bdrv_co_pdiscard        = blkio_co_pdiscard, \
            .bdrv_co_preadv          = blkio_co_preadv, \
            .bdrv_co_pwritev         = blkio_co_pwritev, \
            .bdrv_co_flush_to_disk   = blkio_co_flush, \
            .bdrv_co_pwrite_zeroes   = blkio_co_pwrite_zeroes, \
            .bdrv_io_unplug          = blkio_io_unplug, \
            .bdrv_refresh_limits     = blkio_refresh_limits, \
            __VA_ARGS__
        } \

    static BlockDriver bdrv_io_uring = DRIVER(
        DRIVER_IO_URING,
        .bdrv_needs_filename = true,
    );

    static BlockDriver bdrv_virtio_blk_vhost_user = DRIVER(
        DRIVER_VIRTIO_BLK_VHOST_USER
    );

    static BlockDriver bdrv_virtio_blk_vhost_vdpa = DRIVER(
        DRIVER_VIRTIO_BLK_VHOST_VDPA
    );

Alberto


