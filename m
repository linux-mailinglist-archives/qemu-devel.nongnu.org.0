Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F78E4D98C2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:30:15 +0100 (CET)
Received: from localhost ([::1]:53552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4RS-0005ag-HP
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:30:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU2qI-0004Jc-Bh
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nU2qF-0005ij-GB
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647334062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UpbI8ldnajKt9s0T2EYXPWywkEfbGyvdvHMjNlcxz2Y=;
 b=BfIxPD56GrcIq3jUG29i4NXDiY+GacbpY8CbPwP6r+bZ0AvTKkjiPET2vly7O8tLI3h/XB
 lAVz5WCRPGGeF+sf5C7hcTNwzX34evUBsWA4HOk/aMchUUhAn0+4oEafmvXTc6B5N4fgir
 ACo2UqbVUKAN5BquHtY4OG3NeYpu4io=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-4hWIp49qP2CquSIR_YvmuA-1; Tue, 15 Mar 2022 04:47:38 -0400
X-MC-Unique: 4hWIp49qP2CquSIR_YvmuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAC7D382054A;
 Tue, 15 Mar 2022 08:47:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ABE7111CD4C;
 Tue, 15 Mar 2022 08:47:36 +0000 (UTC)
Date: Tue, 15 Mar 2022 08:47:35 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/6] block: Support passing NULL ops to
 blk_set_dev_ops()
Message-ID: <YjBSp70Ml9p/Z273@stefanha-x1.localdomain>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-2-xieyongji@bytedance.com>
 <Yi959Cf+k8z8gOwm@stefanha-x1.localdomain>
 <CAFn=p-bcvfOa+vNGXqaiJbg2CUEALJoMGVHN9NCQv2GRrf_D_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KQw0IsgmFBbFXRD+"
Content-Disposition: inline
In-Reply-To: <CAFn=p-bcvfOa+vNGXqaiJbg2CUEALJoMGVHN9NCQv2GRrf_D_A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <mreitz@redhat.com>,
 Xie Yongji <xieyongji@bytedance.com>, mlureau@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KQw0IsgmFBbFXRD+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2022 at 03:09:35PM -0400, John Snow wrote:
> On Mon, Mar 14, 2022 at 1:23 PM Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >
> > On Tue, Feb 15, 2022 at 06:59:38PM +0800, Xie Yongji wrote:
> > > This supports passing NULL ops to blk_set_dev_ops()
> > > so that we can remove stale ops in some cases.
> > >
> > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > ---
> > >  block/block-backend.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > index 4ff6b4d785..08dd0a3093 100644
> > > --- a/block/block-backend.c
> > > +++ b/block/block-backend.c
> > > @@ -1015,7 +1015,7 @@ void blk_set_dev_ops(BlockBackend *blk, const B=
lockDevOps *ops,
> > >      blk->dev_opaque =3D opaque;
> > >
> > >      /* Are we currently quiesced? Should we enforce this right now? =
*/
> > > -    if (blk->quiesce_counter && ops->drained_begin) {
> > > +    if (blk->quiesce_counter && ops && ops->drained_begin) {
> > >          ops->drained_begin(opaque);
> > >      }
> > >  }
> >
> > John: You added this code in f4d9cc88ee6. Does blk_set_dev_ops() need to
> > call ->drained_end() when ops is set to NULL?
> >
> > Stefan
>=20
> I'm not sure I trust my memory from five years ago.
>=20
> From what I recall, the problem was that block jobs weren't getting
> drained/paused when the backend was getting quiesced -- we wanted to
> be sure that a blockjob wasn't continuing to run and submit requests
> against a backend we wanted to have on ice during a sensitive
> operation. This conditional stanza here is meant to check if the node
> we're already attached to is *already quiesced* and we missed the
> signal (so-to-speak), so we replay the drained_begin() request right
> there.
>=20
> i.e. there was some case where blockjobs were getting added to an
> already quiesced node, and this code here post-hoc relays that drain
> request to the blockjob. This gets used in
> 600ac6a0ef5c06418446ef2f37407bddcc51b21c to pause/unpause jobs.
> Original thread is here:
> https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg03416.html
>=20
> Now, I'm not sure why you want to set ops to NULL here. If we're in a
> drained section, that sounds like it might be potentially bad because
> we lose track of the operation to end the drained section. If your
> intent is to destroy the thing that we'd need to call drained_end on,
> I guess it doesn't matter -- provided you've cleaned up the target
> object correctly. Just calling drained_end() pre-emptively seems like
> it might be bad, what if it unpauses something you're in the middle of
> trying to delete?
>=20
> I might need slightly more context to know what you're hoping to
> accomplish, but I hope this info helps contextualize this code
> somewhat.

Setting to NULL in this patch is a subset of blk_detach_dev(), which
gets called when a storage controller is hot unplugged.

In this patch series there is no DeviceState because a VDUSE export is
not a device. The VDUSE code calls blk_set_dev_ops() to
register/unregister callbacks (e.g. ->resize_cb()).

The reason I asked about ->drained_end() is for symmetry. If the
device's ->drained_begin() callback changed state or allocated resources
then they may need to be freed/reset. On the other hand, the
blk_set_dev_ops(blk, NULL, NULL) call should be made by the dev_ops
owner so they can clean up without a ->drained_end() call.

Stefan

--KQw0IsgmFBbFXRD+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIwUqcACgkQnKSrs4Gr
c8hdwwgAuhwVh1hywJuVt0cKI8DQFAK1pcOClRAftDGtrZBfGgbKM5cvi+pNMRaK
7tyPAGoZ5oOYxXWToxJQlmNDdahFAzN4cnETVzQXFiF9F+61T2tJBSGAB890z2Ud
H7vgvuO0hOMK41IqhoRlup+IYWblHvQJz4YYYTLgwCUECyU6BJPErFss/4VJAm7J
gtrP6IJCFBDzznldRpuv0wNu7MwBDLItol+qEkoZ37/il74CNCUTWJMxd1mF3hXD
NVhQ+cw7E9XVm76R1rmHMJ3R/bnJDFZCdzyz6aowYGFMrYVV1iSm/VECXD1JdDdB
0iVoJGASAirl8CasDofE6LerCBXi+w==
=+Jcq
-----END PGP SIGNATURE-----

--KQw0IsgmFBbFXRD+--


