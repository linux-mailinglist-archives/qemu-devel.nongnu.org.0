Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA42F7F1C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:12:30 +0100 (CET)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Qm5-00055n-Dn
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:12:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l0QjR-0003jR-UO
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:09:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1l0QjN-0008C8-Ob
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610723380;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ot8xLx0MeitL0M0uozjs1wPHIx08kjiYmbYPDOggNus=;
 b=XOQCJYDayONNL3OfGj7TGKm2PUzUMzt8XMndb7rf5YmO4cI/G5syANeqKRF99AWA1g3yFb
 +kstlg6fyFu04/NMKdprZ35TL/RK5SZoaC/UVbWxWpa42nVs9Ja2/ljL5HpC6g1/0vsGVT
 5FEkHefOmQaziZze9iZyAC2XZfzvSfs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-h5ChFNpDNnKwGl1qUlgPJA-1; Fri, 15 Jan 2021 10:09:39 -0500
X-MC-Unique: h5ChFNpDNnKwGl1qUlgPJA-1
Received: by mail-wm1-f69.google.com with SMTP id 184so353730wmb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=Ot8xLx0MeitL0M0uozjs1wPHIx08kjiYmbYPDOggNus=;
 b=C7cGdvxPgHHUdCl9vv10ue7GKcd4MVEO+a/bUjsdwKW0yH1N9i8+aDbZIKxVZuklqi
 L94oXhE2jW0GDuVn/M+yY820gRM9kAdxhPcBkCWKByMVSYtzCqMM+jCjuC8nymmhe5Po
 5woKSJqi/YXb5jR3keYu282sZq5mSqX01a1HxPKLtnnxgtvF9sUNDiyWTQp/n7oOW9+u
 6GeUtz3lYzqN4E3+NcoxqvZwLGhsNyE3+ZXVy3IbmFVoqhe8WOrZaC6oq4/JlO5FPzgy
 LX9bd6+ko5DEtcCyXq3AIDlJyxK6Sy19mipZdZHzWrVeVJqc5zbJqJPTG16kLZwaxE/l
 K+aA==
X-Gm-Message-State: AOAM531cQ6TB7Wthul1iXmhzDL08ljcoNxRsHbfSYFGD7/dlpbiIykkH
 35/t1DJ2gHiMAuyKpvxA8rzdiVvi0ViMXPuxYxGn1u7cdloIx4c1TD/WOZLAyyAnYWRM+879Coy
 kK5SMXYtevBvTz3GraMzg5r+Y4z1S0yI=
X-Received: by 2002:a5d:65c4:: with SMTP id e4mr14204515wrw.115.1610723377832; 
 Fri, 15 Jan 2021 07:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyIJe2Pp98mevAQEqqgl4rw8vxIW++7zufAa2g4iHD+bPapbtt+4VVDBNrxgisfstYRDjEDQSrPL+V5x/TAhkE=
X-Received: by 2002:a5d:65c4:: with SMTP id e4mr14204493wrw.115.1610723377632; 
 Fri, 15 Jan 2021 07:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20201227164236.10143-1-pl@kamp.de>
 <20201227164236.10143-7-pl@kamp.de>
 <CA+aFP1DZ2vyw8C0_=yPaYPhYFpQ9W8TszcUOBAtHLNMaATOW9Q@mail.gmail.com>
 <2449ab2d-e9da-6e4e-7de5-8dd23501d27e@kamp.de>
In-Reply-To: <2449ab2d-e9da-6e4e-7de5-8dd23501d27e@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Fri, 15 Jan 2021 10:09:26 -0500
Message-ID: <CA+aFP1BUTuU1PN2CgsqAmboHL8iK-4ZB+KRRe4Z5A02Vsuq23w@mail.gmail.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block <qemu-block@nongnu.org>,
 Christian Theune <ct@flyingcircus.io>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:41 PM Peter Lieven <pl@kamp.de> wrote:
>
> Am 14.01.21 um 20:19 schrieb Jason Dillaman:
> > On Sun, Dec 27, 2020 at 11:42 AM Peter Lieven <pl@kamp.de> wrote:
> >> Signed-off-by: Peter Lieven <pl@kamp.de>
> >> ---
> >>  block/rbd.c | 31 ++++++++++++++++++++++++++++++-
> >>  1 file changed, 30 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/block/rbd.c b/block/rbd.c
> >> index 2d77d0007f..27b4404adf 100644
> >> --- a/block/rbd.c
> >> +++ b/block/rbd.c
> >> @@ -63,7 +63,8 @@ typedef enum {
> >>      RBD_AIO_READ,
> >>      RBD_AIO_WRITE,
> >>      RBD_AIO_DISCARD,
> >> -    RBD_AIO_FLUSH
> >> +    RBD_AIO_FLUSH,
> >> +    RBD_AIO_WRITE_ZEROES
> >>  } RBDAIOCmd;
> >>
> >>  typedef struct BDRVRBDState {
> >> @@ -221,8 +222,12 @@ done:
> >>
> >>  static void qemu_rbd_refresh_limits(BlockDriverState *bs, Error **errp)
> >>  {
> >> +    BDRVRBDState *s = bs->opaque;
> >>      /* XXX Does RBD support AIO on less than 512-byte alignment? */
> >>      bs->bl.request_alignment = 512;
> >> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> >> +    bs->bl.pwrite_zeroes_alignment = s->object_size;
> > The optimal alignment is 512 bytes -- but it can safely work just fine
> > down to 1 byte alignment since it will pad the request with additional
> > writes if needed.
>
>
> Okay and this will likely be faster than having Qemu doing that request split, right?
>
> If we drop the alignment hint Qemu will pass the original request.
>
>
> >
> >> +#endif
> >>  }
> >>
> >>
> >> @@ -695,6 +700,9 @@ static int qemu_rbd_open(BlockDriverState *bs, QDict *options, int flags,
> >>      }
> >>
> >>      s->aio_context = bdrv_get_aio_context(bs);
> >> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> >> +    bs->supported_zero_flags = BDRV_REQ_MAY_UNMAP;
> >> +#endif
> >>
> >>      /* When extending regular files, we get zeros from the OS */
> >>      bs->supported_truncate_flags = BDRV_REQ_ZERO_WRITE;
> >> @@ -808,6 +816,11 @@ static int coroutine_fn qemu_rbd_start_co(BlockDriverState *bs,
> >>      case RBD_AIO_FLUSH:
> >>          r = rbd_aio_flush(s->image, c);
> >>          break;
> >> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> >> +    case RBD_AIO_WRITE_ZEROES:
> >> +        r = rbd_aio_write_zeroes(s->image, offset, bytes, c, 0, 0);
> >> +        break;
> >> +#endif
> >>      default:
> >>          r = -EINVAL;
> >>      }
> >> @@ -880,6 +893,19 @@ static int coroutine_fn qemu_rbd_co_pdiscard(BlockDriverState *bs,
> >>      return qemu_rbd_start_co(bs, offset, count, NULL, 0, RBD_AIO_DISCARD);
> >>  }
> >>
> >> +#ifdef LIBRBD_SUPPORTS_WRITE_ZEROES
> >> +static int
> >> +coroutine_fn qemu_rbd_co_pwrite_zeroes(BlockDriverState *bs, int64_t offset,
> >> +                                      int count, BdrvRequestFlags flags)
> >> +{
> >> +    if (!(flags & BDRV_REQ_MAY_UNMAP)) {
> >> +        return -ENOTSUP;
> >> +    }
> > There is a "RBD_WRITE_ZEROES_FLAG_THICK_PROVISION" flag that you can
> > use to optionally disable unmap.
>
>
> I have seen that. If you want I can support for this, too. But afaik this
>
> is only available since Octopus release?

True -- I didn't backport that support to Nautilus since it was a new
feature vs the bug-fix that the write-zeroes API was introduced to
fix.

>
> Peter
>
>


-- 
Jason


