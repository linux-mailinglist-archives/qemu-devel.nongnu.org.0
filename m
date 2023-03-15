Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6557A6BBCE2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 20:02:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcWNv-0005IB-Is; Wed, 15 Mar 2023 15:02:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcWNu-0005Hm-3x
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 15:02:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pcWNr-0006bp-Oi
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 15:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678906918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/U8MtoF0jgn02uIE/Dw8NJyvy4UkcDX8OnavR0LJz+4=;
 b=gEXoHYLV5ZJDNnmSSM564DfyJXMQahCzXoEx93oJp+oWvFa/q5KGYRXvJBgEw+2evaGR3q
 VYY82OQZJ7QhXQ+M6KDfH8JdaX8d13vGUrm9oSs/1ULCTcEh7POHPSdFpUlgiMs5kqALco
 UpyG6vynQHx4Zkcy2Ap8p7Ns4ktVkoM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-52tG4brtNqyMW9f1BPh6ew-1; Wed, 15 Mar 2023 15:01:53 -0400
X-MC-Unique: 52tG4brtNqyMW9f1BPh6ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A549293248D;
 Wed, 15 Mar 2023 19:01:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4BED1121314;
 Wed, 15 Mar 2023 19:01:51 +0000 (UTC)
Date: Wed, 15 Mar 2023 14:48:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Hanna Czenczek <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>
Subject: Re: [RFC 1/2] block: Split padded I/O vectors exceeding IOV_MAX
Message-ID: <20230315184822.GE16636@fedora>
References: <20230315121330.29679-1-hreitz@redhat.com>
 <20230315121330.29679-2-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rKinch1UHhuaWSKj"
Content-Disposition: inline
In-Reply-To: <20230315121330.29679-2-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


--rKinch1UHhuaWSKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2023 at 01:13:29PM +0100, Hanna Czenczek wrote:
> When processing vectored guest requests that are not aligned to the
> storage request alignment, we pad them by adding head and/or tail
> buffers for a read-modify-write cycle.
>=20
> The guest can submit I/O vectors up to IOV_MAX (1024) in length, but
> with this padding, the vector can exceed that limit.  As of
> 4c002cef0e9abe7135d7916c51abce47f7fc1ee2 ("util/iov: make
> qemu_iovec_init_extended() honest"), we refuse to pad vectors beyond the
> limit, instead returning an error to the guest.
>=20
> To the guest, this appears as a random I/O error.  We should not return
> an I/O error to the guest when it issued a perfectly valid request.
>=20
> Before 4c002cef0e9abe7135d7916c51abce47f7fc1ee2, we just made the vector
> longer than IOV_MAX, which generally seems to work (because the guest
> assumes a smaller alignment than we really have, file-posix's
> raw_co_prw() will generally see bdrv_qiov_is_aligned() return false, and
> so emulate the request, so that the IOV_MAX does not matter).  However,
> that does not seem exactly great.
>=20
> I see two ways to fix this problem:
> 1. We split such long requests into two requests.
> 2. We join some elements of the vector into new buffers to make it
>    shorter.
>=20
> I am wary of (1), because it seems like it may have unintended side
> effects.
>=20
> (2) on the other hand seems relatively simple to implement, with
> hopefully few side effects, so this patch does that.

Looks like a reasonable solution. I think the code is correct and I
posted ideas for making it easier to understand.

>=20
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2141964
> Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
> ---
>  block/io.c | 139 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>  util/iov.c |   4 --
>  2 files changed, 133 insertions(+), 10 deletions(-)
>=20
> diff --git a/block/io.c b/block/io.c
> index 8974d46941..ee226d23d6 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -1435,6 +1435,12 @@ out:
>   * @merge_reads is true for small requests,
>   * if @buf_len =3D=3D @head + bytes + @tail. In this case it is possible=
 that both
>   * head and tail exist but @buf_len =3D=3D align and @tail_buf =3D=3D @b=
uf.
> + *
> + * @write is true for write requests, false for read requests.
> + *
> + * If padding makes the vector too long (exceeding IOV_MAX), then we nee=
d to
> + * merge existing vector elements into a single one.  @collapse_buf acts=
 as the
> + * bounce buffer in such cases.
>   */
>  typedef struct BdrvRequestPadding {
>      uint8_t *buf;
> @@ -1443,11 +1449,17 @@ typedef struct BdrvRequestPadding {
>      size_t head;
>      size_t tail;
>      bool merge_reads;
> +    bool write;
>      QEMUIOVector local_qiov;
> +
> +    uint8_t *collapse_buf;
> +    size_t collapse_len;
> +    QEMUIOVector collapsed_qiov;
>  } BdrvRequestPadding;
> =20
>  static bool bdrv_init_padding(BlockDriverState *bs,
>                                int64_t offset, int64_t bytes,
> +                              bool write,
>                                BdrvRequestPadding *pad)
>  {
>      int64_t align =3D bs->bl.request_alignment;
> @@ -1479,9 +1491,101 @@ static bool bdrv_init_padding(BlockDriverState *b=
s,
>          pad->tail_buf =3D pad->buf + pad->buf_len - align;
>      }
> =20
> +    pad->write =3D write;
> +
>      return true;
>  }
> =20
> +/*
> + * If padding has made the IOV (`pad->local_qiov`) too long (more than I=
OV_MAX
> + * elements), collapse some elements into a single one so that it adhere=
s to the
> + * IOV_MAX limit again.
> + *
> + * If collapsing, `pad->collapse_buf` will be used as a bounce buffer of=
 length
> + * `pad->collapse_len`.  `pad->collapsed_qiov` will contain the previous=
 entries
> + * (before collapsing), so that bdrv_padding_destroy() can copy the boun=
ce
> + * buffer content back for read requests.

The distinction between "collapse" and "collapsed" is subtle. I didn't
guess it right, I thought collapsed_qiov is a QEMUIOVector for
collapse_buf/collapse_len.

Please choose a name for collapsed_qiov that makes this clearer. Maybe
pre_collapse_qiov (i.e. the local_qiov iovecs that were replaced by
bdrv_padding_collapse)?

> + *
> + * Note that we will not touch the padding head or tail entries here.  W=
e cannot
> + * move them to a bounce buffer, because for RMWs, both head and tail ex=
pect to
> + * be in an aligned buffer with scratch space after (head) or before (ta=
il) to
> + * perform the read into (because the whole buffer must be aligned, but =
head's
> + * and tail's lengths naturally cannot be aligned, because they provide =
padding
> + * for unaligned requests).  A collapsed bounce buffer for multiple IOV =
elements
> + * cannot provide such scratch space.

As someone who hasn't looked at this code for a while, I don't
understand this paragraph. Can you expand on why RMW is problematic
here? If not, don't worry, it's hard to explain iov juggling.

> + *
> + * Therefore, this function collapses the first IOV elements after the
> + * (potential) head element.
> + */
> +static void bdrv_padding_collapse(BdrvRequestPadding *pad, BlockDriverSt=
ate *bs)
> +{
> +    int surplus_count, collapse_count;
> +    struct iovec *collapse_iovs;
> +    QEMUIOVector collapse_qiov;
> +    size_t move_count;
> +
> +    surplus_count =3D pad->local_qiov.niov - IOV_MAX;
> +    /* Not exceeding the limit?  Nothing to collapse. */
> +    if (surplus_count <=3D 0) {
> +        return;
> +    }
> +
> +    /*
> +     * Only head and tail can have lead to the number of entries exceedi=
ng
> +     * IOV_MAX, so we can exceed it by the head and tail at most
> +     */
> +    assert(surplus_count <=3D !!pad->head + !!pad->tail);
> +
> +    /*
> +     * We merge (collapse) `surplus_count` entries into the first entry =
that is
> +     * not padding, i.e. we merge `surplus_count + 1` entries into entry=
 0 if
> +     * there is no head, or entry 1 if there is one.
> +     */
> +    collapse_count =3D surplus_count + 1;
> +    collapse_iovs =3D &pad->local_qiov.iov[pad->head ? 1 : 0];
> +
> +    /* There must be no previously collapsed buffers in `pad` */
> +    assert(pad->collapse_len =3D=3D 0);
> +    for (int i =3D 0; i < collapse_count; i++) {
> +        pad->collapse_len +=3D collapse_iovs[i].iov_len;
> +    }
> +    pad->collapse_buf =3D qemu_blockalign(bs, pad->collapse_len);
> +
> +    /* Save the to-be-collapsed IOV elements in collapsed_qiov */
> +    qemu_iovec_init_external(&collapse_qiov, collapse_iovs, collapse_cou=
nt);
> +    qemu_iovec_init_slice(&pad->collapsed_qiov,

Having collapse_qiov and collapsed_qiov in the same function is
confusing. IIUC collapse_qiov and collapsed_qiov have the same buffers
the same, except that the last iovec in collapse_qiov has its original
length from local_qiov, whereas collapsed_qiov may shrink the last
iovec.

Maybe just naming collapse_qiov "qiov" or "tmp_qiov" would be less
confusing because it avoids making collapse_buf/collapse_len vs
collapsed_qiov more confusing.

> +                          &collapse_qiov, 0, pad->collapse_len);
> +    if (pad->write) {
> +        /* For writes: Copy all to-be-collapsed data into collapse_buf */
> +        qemu_iovec_to_buf(&pad->collapsed_qiov, 0,
> +                          pad->collapse_buf, pad->collapse_len);
> +    }
> +
> +    /* Create the collapsed entry in pad->local_qiov */
> +    collapse_iovs[0] =3D (struct iovec){
> +        .iov_base =3D pad->collapse_buf,
> +        .iov_len =3D pad->collapse_len,
> +    };
> +
> +    /*
> +     * To finalize collapsing, we must shift the rest of pad->local_qiov=
 left by
> +     * `surplus_count`, i.e. we must move all elements after `collapse_i=
ovs` to
> +     * immediately after the collapse target.
> +     *
> +     * Therefore, the memmove() target is `collapse_iovs[1]` and the sou=
rce is
> +     * `collapse_iovs[collapse_count]`.  The number of elements to move =
is the
> +     * number of elements remaining in `pad->local_qiov` after and inclu=
ding
> +     * `collapse_iovs[collapse_count]`.
> +     */
> +    move_count =3D &pad->local_qiov.iov[pad->local_qiov.niov] -
> +        &collapse_iovs[collapse_count];
> +    memmove(&collapse_iovs[1],
> +            &collapse_iovs[collapse_count],
> +            move_count * sizeof(pad->local_qiov.iov[0]));
> +
> +    pad->local_qiov.niov -=3D surplus_count;
> +}
> +
>  static int coroutine_fn GRAPH_RDLOCK
>  bdrv_padding_rmw_read(BdrvChild *child, BdrvTrackedRequest *req,
>                        BdrvRequestPadding *pad, bool zero_middle)
> @@ -1549,6 +1653,18 @@ static void bdrv_padding_destroy(BdrvRequestPaddin=
g *pad)
>          qemu_vfree(pad->buf);
>          qemu_iovec_destroy(&pad->local_qiov);
>      }
> +    if (pad->collapse_buf) {
> +        if (!pad->write) {
> +            /*
> +             * If padding required elements in the vector to be collapse=
d into a
> +             * bounce buffer, copy the bounce buffer content back
> +             */
> +            qemu_iovec_from_buf(&pad->collapsed_qiov, 0,
> +                                pad->collapse_buf, pad->collapse_len);
> +        }
> +        qemu_vfree(pad->collapse_buf);
> +        qemu_iovec_destroy(&pad->collapsed_qiov);
> +    }

This is safe because qemu_iovec_init_slice() took copies of local_qiov
iovecs instead of references, but the code requires less thinking if
collapsed_qiov is destroyed before local_qiov. This change would be nice
if you respin.

>      memset(pad, 0, sizeof(*pad));
>  }
> =20
> @@ -1559,6 +1675,8 @@ static void bdrv_padding_destroy(BdrvRequestPadding=
 *pad)
>   * read of padding, bdrv_padding_rmw_read() should be called separately =
if
>   * needed.
>   *
> + * @write is true for write requests, false for read requests.
> + *
>   * Request parameters (@qiov, &qiov_offset, &offset, &bytes) are in-out:
>   *  - on function start they represent original request
>   *  - on failure or when padding is not needed they are unchanged
> @@ -1567,6 +1685,7 @@ static void bdrv_padding_destroy(BdrvRequestPadding=
 *pad)
>  static int bdrv_pad_request(BlockDriverState *bs,
>                              QEMUIOVector **qiov, size_t *qiov_offset,
>                              int64_t *offset, int64_t *bytes,
> +                            bool write,
>                              BdrvRequestPadding *pad, bool *padded,
>                              BdrvRequestFlags *flags)
>  {
> @@ -1574,7 +1693,7 @@ static int bdrv_pad_request(BlockDriverState *bs,
> =20
>      bdrv_check_qiov_request(*offset, *bytes, *qiov, *qiov_offset, &error=
_abort);
> =20
> -    if (!bdrv_init_padding(bs, *offset, *bytes, pad)) {
> +    if (!bdrv_init_padding(bs, *offset, *bytes, write, pad)) {
>          if (padded) {
>              *padded =3D false;
>          }
> @@ -1589,6 +1708,14 @@ static int bdrv_pad_request(BlockDriverState *bs,
>          bdrv_padding_destroy(pad);
>          return ret;
>      }
> +
> +    /*
> +     * If the IOV is too long after padding, merge (collapse) some entri=
es to
> +     * make it not exceed IOV_MAX
> +     */
> +    bdrv_padding_collapse(pad, bs);
> +    assert(pad->local_qiov.niov <=3D IOV_MAX);
> +
>      *bytes +=3D pad->head + pad->tail;
>      *offset -=3D pad->head;
>      *qiov =3D &pad->local_qiov;
> @@ -1653,8 +1780,8 @@ int coroutine_fn bdrv_co_preadv_part(BdrvChild *chi=
ld,
>          flags |=3D BDRV_REQ_COPY_ON_READ;
>      }
> =20
> -    ret =3D bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &=
pad,
> -                           NULL, &flags);
> +    ret =3D bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, f=
alse,
> +                           &pad, NULL, &flags);
>      if (ret < 0) {
>          goto fail;
>      }
> @@ -1996,7 +2123,7 @@ bdrv_co_do_zero_pwritev(BdrvChild *child, int64_t o=
ffset, int64_t bytes,
>      /* This flag doesn't make sense for padding or zero writes */
>      flags &=3D ~BDRV_REQ_REGISTERED_BUF;
> =20
> -    padding =3D bdrv_init_padding(bs, offset, bytes, &pad);
> +    padding =3D bdrv_init_padding(bs, offset, bytes, true, &pad);
>      if (padding) {
>          assert(!(flags & BDRV_REQ_NO_WAIT));
>          bdrv_make_request_serialising(req, align);
> @@ -2112,8 +2239,8 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *ch=
ild,
>           * bdrv_co_do_zero_pwritev() does aligning by itself, so, we do
>           * alignment only if there is no ZERO flag.
>           */
> -        ret =3D bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &byte=
s, &pad,
> -                               &padded, &flags);
> +        ret =3D bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &byte=
s, true,
> +                               &pad, &padded, &flags);
>          if (ret < 0) {
>              return ret;
>          }
> diff --git a/util/iov.c b/util/iov.c
> index b4be580022..4d0d381949 100644
> --- a/util/iov.c
> +++ b/util/iov.c
> @@ -444,10 +444,6 @@ int qemu_iovec_init_extended(
>      }
> =20
>      total_niov =3D !!head_len + mid_niov + !!tail_len;
> -    if (total_niov > IOV_MAX) {
> -        return -EINVAL;
> -    }

Perhaps an assertion is good here, just to make sure it's detected if a
new caller is added some day. qemu_iovec_init_extended() is a public
API, so something unrelated to block layer padding might use it.

> -
>      if (total_niov =3D=3D 1) {
>          qemu_iovec_init_buf(qiov, NULL, 0);
>          p =3D &qiov->local_iov;
> --=20
> 2.39.1
>=20

--rKinch1UHhuaWSKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmQSEvYACgkQnKSrs4Gr
c8g2Ogf8CsGu4r/thmv62KEpyeWfaOohWuQcyquHhnhjIE4FzCoiNhiZpI2lWLSY
W73nPVBSK73Hp8XtzHd3Wu6imShQSMNU1GXgR2eYwFF4gPH41N6kt6oUCNxMSXzW
HFbpgTm08+YV2zxnD0uIdL7nUSLGbIjbd+Jf0keQMsi0TNmg+SPTotM6RnMbOKtA
pDlvwhosmb1Ov7H9BlsMbL0PKyk3+PbHQryAhd2I3V8nCHccrvvRGaSr1U85BgnG
V6cL4gxqYYtgVL1H65ue+hqBa7VJmxkfAxqgH0bD7MKWr0v1k9m/qZa0DcZBvKsu
RmrQ1JJ/9Rpro9V7zaf2dFk7OIFG/A==
=zQNa
-----END PGP SIGNATURE-----

--rKinch1UHhuaWSKj--


