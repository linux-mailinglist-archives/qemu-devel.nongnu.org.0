Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354F553682
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:42:59 +0200 (CEST)
Received: from localhost ([::1]:38762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3g1p-0003wz-Tn
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3fzU-0002MK-26
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3fzN-0000Nf-3c
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655826024;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0fqFim3Gdxvd01j7RpjVJE8315bQyVo3BtTTt06RX5Q=;
 b=IsfS5JqaXIyIgWHQ3P0NHxCdSL7PMTKKNIeUpGp0thZnOnM/v+WUvVbOqcLNfcZEZSHBSQ
 AlwOLChqAAInBw3j92SRYhgH1igv7yfzc/MLEdo5YSlTqDqmGNH/H4HONbJ5HQyyWkXy8s
 f4u8JEhUp5K5vPgnkBuYmRXszV3qfBI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-ZCkPssz6OXOsv0ZlAbWwKg-1; Tue, 21 Jun 2022 11:40:23 -0400
X-MC-Unique: ZCkPssz6OXOsv0ZlAbWwKg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j14-20020adfa54e000000b0021b8c8204easo1993604wrb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0fqFim3Gdxvd01j7RpjVJE8315bQyVo3BtTTt06RX5Q=;
 b=25Qvf+0wSfwSOfZIwO0fnpEqevekwuT8Abil4ufWIxy0U6sNuDv7CWW7m4aIkwx1DU
 Mwy/RtbtvRR7r3DEC7qpkh4HPSOvWP6U6oLy5IDGiKjLUUvEyRuMt55xLRaXu9cjJK5T
 Ash0I4toYXf2kPI9seX+U9sBQBpBhqLkqUwtpCxmPioXTaZMn23efVQ+XJuEb9YdOrq9
 GY0T7RF63KpV/RQ7L+Fs2SK9ob5CwGE/ZqXl7kMbsxo0gEzIjQGmSoiXczptAJkVRnaX
 Sjbd1mD5gFAh6PhGuSS17UQiTddEA9U/sZDe8bmtjUgPUy0WFWmCpjfRUb5Bspde8PwI
 BsCA==
X-Gm-Message-State: AJIora+kyRiEIhngMI4ZPfU9fCtKR05TEPL0d1jTXMQNn7ODVb9g6Y+t
 5Efzg6FDZM1zj4lIYAvf1EQ+20HEjrTQ49cSSrVdBsZF3tB3rfQ8PtC8cbSM+5yN5ksNdD3eXV9
 iiJ3o7G3g8m7gSVI=
X-Received: by 2002:a7b:c843:0:b0:39c:4f04:24e with SMTP id
 c3-20020a7bc843000000b0039c4f04024emr30969619wml.25.1655826021350; 
 Tue, 21 Jun 2022 08:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1trUta5H3UjCThA2x2MSr6fX5s0nLUM2/egDepoqd8lYcIw89muengKxeOysRT1JjA+mksUZg==
X-Received: by 2002:a7b:c843:0:b0:39c:4f04:24e with SMTP id
 c3-20020a7bc843000000b0039c4f04024emr30969595wml.25.1655826021047; 
 Tue, 21 Jun 2022 08:40:21 -0700 (PDT)
Received: from localhost ([31.4.180.61]) by smtp.gmail.com with ESMTPSA id
 d11-20020adffbcb000000b0020fcaba73bcsm16587423wrs.104.2022.06.21.08.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 08:40:20 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 09/21] migration: introduce a QIOChannel impl for
 BlockDriverState VMState
In-Reply-To: <20220620110205.1357829-10-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:53
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-10-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 21 Jun 2022 17:40:19 +0200
Message-ID: <871qvivxcs.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> Introduce a QIOChannelBlock class that exposes the BlockDriverState
> VMState region for I/O.
>
> This is kept in the migration/ directory rather than io/, to avoid
> a mutual dependancy between block/ <-> io/ directories. Also the
> VMState should only be used by the migration code.
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

I will maggically charge this to a:

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

O:-)

> ---
>  migration/channel-block.c | 195 ++++++++++++++++++++++++++++++++++++++
>  migration/channel-block.h |  59 ++++++++++++
>  migration/meson.build     |   1 +
>  3 files changed, 255 insertions(+)
>  create mode 100644 migration/channel-block.c
>  create mode 100644 migration/channel-block.h
>
> diff --git a/migration/channel-block.c b/migration/channel-block.c
> new file mode 100644
> index 0000000000..ad52342c10
> --- /dev/null
> +++ b/migration/channel-block.c
> @@ -0,0 +1,195 @@
> +/*
> + * QEMU I/O channels block driver
> + *
> + * Copyright (c) 2022 Red Hat, Inc.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "migration/channel-block.h"
> +#include "qapi/error.h"
> +#include "block/block.h"
> +#include "trace.h"
> +
> +QIOChannelBlock *
> +qio_channel_block_new(BlockDriverState *bs)
> +{
> +    QIOChannelBlock *ioc;
> +
> +    ioc =3D QIO_CHANNEL_BLOCK(object_new(TYPE_QIO_CHANNEL_BLOCK));
> +
> +    bdrv_ref(bs);
> +    ioc->bs =3D bs;
> +
> +    return ioc;
> +}
> +
> +
> +static void
> +qio_channel_block_finalize(Object *obj)
> +{
> +    QIOChannelBlock *ioc =3D QIO_CHANNEL_BLOCK(obj);
> +
> +    g_clear_pointer(&ioc->bs, bdrv_unref);
> +}
> +
> +
> +static ssize_t
> +qio_channel_block_readv(QIOChannel *ioc,
> +                        const struct iovec *iov,
> +                        size_t niov,
> +                        int **fds,
> +                        size_t *nfds,
> +                        Error **errp)
> +{
> +    QIOChannelBlock *bioc =3D QIO_CHANNEL_BLOCK(ioc);
> +    QEMUIOVector qiov;
> +    int ret;
> +
> +    qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
> +    ret =3D bdrv_readv_vmstate(bioc->bs, &qiov, bioc->offset);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    bioc->offset +=3D qiov.size;
> +    return qiov.size;
> +}
> +
> +
> +static ssize_t
> +qio_channel_block_writev(QIOChannel *ioc,
> +                         const struct iovec *iov,
> +                         size_t niov,
> +                         int *fds,
> +                         size_t nfds,
> +                         int flags,
> +                         Error **errp)
> +{
> +    QIOChannelBlock *bioc =3D QIO_CHANNEL_BLOCK(ioc);
> +    QEMUIOVector qiov;
> +    int ret;
> +
> +    qemu_iovec_init_external(&qiov, (struct iovec *)iov, niov);
> +    ret =3D bdrv_writev_vmstate(bioc->bs, &qiov, bioc->offset);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    bioc->offset +=3D qiov.size;
> +    return qiov.size;
> +}
> +
> +
> +static int
> +qio_channel_block_set_blocking(QIOChannel *ioc,
> +                               bool enabled,
> +                               Error **errp)
> +{
> +    if (!enabled) {
> +        error_setg(errp, "Non-blocking mode not supported for block devi=
ces");
> +        return -1;
> +    }
> +    return 0;
> +}
> +
> +
> +static off_t
> +qio_channel_block_seek(QIOChannel *ioc,
> +                       off_t offset,
> +                       int whence,
> +                       Error **errp)
> +{
> +    QIOChannelBlock *bioc =3D QIO_CHANNEL_BLOCK(ioc);
> +
> +    switch (whence) {
> +    case SEEK_SET:
> +        bioc->offset =3D offset;
> +        break;
> +    case SEEK_CUR:
> +        bioc->offset +=3D whence;
> +        break;
> +    case SEEK_END:
> +        error_setg(errp, "Size of VMstate region is unknown");
> +        return (off_t)-1;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    return bioc->offset;
> +}
> +
> +
> +static int
> +qio_channel_block_close(QIOChannel *ioc,
> +                        Error **errp)
> +{
> +    QIOChannelBlock *bioc =3D QIO_CHANNEL_BLOCK(ioc);
> +    int rv;
> +
> +    if ((rv =3D bdrv_flush(bioc->bs)) < 0) {
> +        error_setg_errno(errp, -rv,
> +                         "Unable to flush VMState");
> +        return -1;
> +    }
> +
> +    g_clear_pointer(&bioc->bs, bdrv_unref);
> +    bioc->offset =3D 0;
> +
> +    return 0;
> +}
> +
> +
> +static void
> +qio_channel_block_set_aio_fd_handler(QIOChannel *ioc,
> +                                     AioContext *ctx,
> +                                     IOHandler *io_read,
> +                                     IOHandler *io_write,
> +                                     void *opaque)
> +{
> +    /* XXX anything we can do here ? */
> +}
> +
> +
> +static void
> +qio_channel_block_class_init(ObjectClass *klass,
> +                             void *class_data G_GNUC_UNUSED)
> +{
> +    QIOChannelClass *ioc_klass =3D QIO_CHANNEL_CLASS(klass);
> +
> +    ioc_klass->io_writev =3D qio_channel_block_writev;
> +    ioc_klass->io_readv =3D qio_channel_block_readv;
> +    ioc_klass->io_set_blocking =3D qio_channel_block_set_blocking;
> +    ioc_klass->io_seek =3D qio_channel_block_seek;
> +    ioc_klass->io_close =3D qio_channel_block_close;
> +    ioc_klass->io_set_aio_fd_handler =3D qio_channel_block_set_aio_fd_ha=
ndler;
> +}
> +
> +static const TypeInfo qio_channel_block_info =3D {
> +    .parent =3D TYPE_QIO_CHANNEL,
> +    .name =3D TYPE_QIO_CHANNEL_BLOCK,
> +    .instance_size =3D sizeof(QIOChannelBlock),
> +    .instance_finalize =3D qio_channel_block_finalize,
> +    .class_init =3D qio_channel_block_class_init,
> +};
> +
> +static void
> +qio_channel_block_register_types(void)
> +{
> +    type_register_static(&qio_channel_block_info);
> +}
> +
> +type_init(qio_channel_block_register_types);
> diff --git a/migration/channel-block.h b/migration/channel-block.h
> new file mode 100644
> index 0000000000..31673824e6
> --- /dev/null
> +++ b/migration/channel-block.h
> @@ -0,0 +1,59 @@
> +/*
> + * QEMU I/O channels block driver
> + *
> + * Copyright (c) 2022 Red Hat, Inc.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + *
> + */
> +
> +#ifndef QIO_CHANNEL_BLOCK_H
> +#define QIO_CHANNEL_BLOCK_H
> +
> +#include "io/channel.h"
> +#include "qom/object.h"
> +
> +#define TYPE_QIO_CHANNEL_BLOCK "qio-channel-block"
> +OBJECT_DECLARE_SIMPLE_TYPE(QIOChannelBlock, QIO_CHANNEL_BLOCK)
> +
> +
> +/**
> + * QIOChannelBlock:
> + *
> + * The QIOChannelBlock object provides a channel implementation
> + * that is able to perform I/O on the BlockDriverState objects
> + * to the VMState region.
> + */
> +
> +struct QIOChannelBlock {
> +    QIOChannel parent;
> +    BlockDriverState *bs;
> +    off_t offset;
> +};
> +
> +
> +/**
> + * qio_channel_block_new:
> + * @bs: the block driver state
> + *
> + * Create a new IO channel object that can perform
> + * I/O on a BlockDriverState object to the VMState
> + * region
> + *
> + * Returns: the new channel object
> + */
> +QIOChannelBlock *
> +qio_channel_block_new(BlockDriverState *bs);
> +
> +#endif /* QIO_CHANNEL_BLOCK_H */
> diff --git a/migration/meson.build b/migration/meson.build
> index 6880b61b10..8d309f5849 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -13,6 +13,7 @@ softmmu_ss.add(migration_files)
>  softmmu_ss.add(files(
>    'block-dirty-bitmap.c',
>    'channel.c',
> +  'channel-block.c',
>    'colo-failover.c',
>    'colo.c',
>    'exec.c',


