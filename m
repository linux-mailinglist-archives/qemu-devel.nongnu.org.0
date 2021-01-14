Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5BC2F6AFB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:33:06 +0100 (CET)
Received: from localhost ([::1]:40246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08Mj-0005Lk-0u
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l08B6-0005Nc-Ii
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:21:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l08B4-0002Oc-Uz
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:21:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610652062;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=JKPDEtYrfAgNmbKAby9ZUlPqyhgAuDRm02b+rMoI2JQ=;
 b=QZTwq3GRMwceLN75Rv6cAnlwDMfetDir7kIbL2Dg88pSLrzIyDvoYdOwSzW3JIWN1Of+ht
 O5zxhqYSlU7AR6TSEJ2JmtHNniaa9Sy5qxT7GbTTilr79V6WIGirhZOycHGOCs1G6nW1mw
 uXkfWKbkd8oU8IU5Trl0cKoEV5lOlB4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-H1xJRH7fPI2fJOVj7gDEaw-1; Thu, 14 Jan 2021 14:19:41 -0500
X-MC-Unique: H1xJRH7fPI2fJOVj7gDEaw-1
Received: by mail-wr1-f71.google.com with SMTP id e12so3038716wrp.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=JKPDEtYrfAgNmbKAby9ZUlPqyhgAuDRm02b+rMoI2JQ=;
 b=EFS+mNE/Alt+idcoq/lmwzTDTMrOW5qKCzOVIZ7qc1ysMLYOPhJkssnyYm02So7jVz
 JGI80vXdKCJhS+l/wzh0LBzBOZyNRCB16uhab8QtB5ymK1Ymw7UH0MMAZPcaDt3V2uUh
 NuoE+FaoCoe/RHrCLS20ufV5zNMlyNjDamby4QOJjwtV8hW0ZIK2CTs3qNHWXDsgMZCS
 DeXI8RQ/iFW8mWOefeJ0CkWcCZMapfC7bw50Rcpdzb9jPiaVDROGj92w6512/3bOh4DU
 2tKgrFe3ZdF9KlQENS/ggRZIxoPPHnu4USeP9yDHBi8MCpw2HS7VeFeQFHhyfBSV5OPC
 zC2w==
X-Gm-Message-State: AOAM532LjZ9RQpvHC5mRVh847iMrRed8p4vq7kqjjADDzdnkBcnUt3DH
 iBKuR4MP0MNx52Zr//tMdU9wZbbWOhHbZKwFKYkMswLrCGa1W1kTd+hfvccWeuFQqcCZIr26Pd3
 S8kWxqdYgNVsTBEFbBlQGsoaIZ+oWE5o=
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr9327941wrm.167.1610651979841; 
 Thu, 14 Jan 2021 11:19:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmyRaKCL4jW1dFWkyl9Z/d1ZpSHZEdo3YyiXm7iV0dGtZ9X6NOeS95B3epoc1Aj9OrNEA2AYPIBImCl2ct+Ps=
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr9327927wrm.167.1610651979579; 
 Thu, 14 Jan 2021 11:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-7-pl@kamp.de>
In-Reply-To: <20201227164236.10143-7-pl@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Thu, 14 Jan 2021 14:19:27 -0500
Message-ID: <CA+aFP1DZ2vyw8C0_=yPaYPhYFpQ9W8TszcUOBAtHLNMaATOW9Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] block/rbd: add write zeroes support
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: dillaman@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>, Christian Theune <ct@flyingcircus.io>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
>
> Signed-off-by: Peter Lieven <pl@kamp.de>
> ---
>  block/rbd.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>
> diff --git a/block/rbd.c b/block/rbd.c
> index 2d77d0007f..27b4404adf 100644
> --- a/block/rbd.c
> +++ b/block/rbd.c
> @@ -63,7 +63,8 @@ typedef enum {
>      RBD_AIO_READ,
>      RBD_AIO_WRITE,
>      RBD_AIO_DISCARD,
> -    RBD_AIO_FLUSH
> +    RBD_AIO_FLUSH,
> +    RBD_AIO_WRITE_ZEROES
>  } RBDAIOCmd;
>
>  typedef struct BDRVRBDState {
> @@ -221,8 +222,12 @@ done:
>
>  static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
>  {
> +    BDRVRBDState *s = bs->opaque;
>      /* XXX Does RBD support AIO on less than 512-byte alignment? */
>      bs->bl.request_alignment = 512;
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    bs->bl.pwrite_zeroes_alignment = s->object_size;

The optimal alignment is 512 bytes -- but it can safely work just fine
down to 1 byte alignment since it will pad the request with additional
writes if needed.

> +#endif
>  }
>
>
> @@ -695,6 +700,9 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
>      }
>
>      s->aio_context = bdrv_get_aio_context(bs);
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;
> +#endif
>
>      /* When extending regular files, we get zeros from the OS */
>      bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
> @@ -808,6 +816,11 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
>      case RBD_AIO_FLUSH:
>          r = rbd_aio_flush(s->image, c);
>          break;
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    case RBD_AIO_WRITE_ZEROES:
> +        r = rbd_aio_write_zeroes(s->image, offset, bytes, c, 0, 0);
> +        break;
> +#endif
>      default:
>          r = -EINVAL;
>      }
> @@ -880,6 +893,19 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
>      return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
>  }
>
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +static int
> +coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
> +                                      int count, BdrvRequestFlags flags)
> +{
> +    if (!(flags & BDRV_REQ_MAY_UNMAP)) {
> +        return -ENOTSUP;
> +    }

There is a "RBD_WRITE_ZEROES_FLAG_THICK_PROVISION" flag that you can
use to optionally disable unmap.


> +    return qemu_rbd_start_co(bs, offset, count, NULL, flags,
> +                             RBD_AIO_WRITE_ZEROES);
> +}
> +#endif
> +
>  static int qemu_rbd_getinfo(BlockDriverState *bs, BlockDriverInfo *bdi)
>  {
>      BDRVRBDState *s = bs->opaque;
> @@ -1108,6 +1134,9 @@ static BlockDriver bdrv_rbd = {
>      .bdrv_co_pwritev        = qemu_rbd_co_pwritev,
>      .bdrv_co_flush_to_disk  = qemu_rbd_co_flush,
>      .bdrv_co_pdiscard       = qemu_rbd_co_pdiscard,
> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> +    .bdrv_co_pwrite_zeroes  = qemu_rbd_co_pwrite_zeroes,
> +#endif
>
>      .bdrv_snapshot_create   = qemu_rbd_snap_create,
>      .bdrv_snapshot_delete   = qemu_rbd_snap_remove,
> --
> 2.17.1
>
>


--
Jason


