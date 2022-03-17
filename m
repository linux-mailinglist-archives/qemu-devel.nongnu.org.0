Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8FB4DC218
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 09:59:53 +0100 (CET)
Received: from localhost ([::1]:46630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUlz5-0001bC-Oe
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 04:59:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nUlwl-0000Cm-2I
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nUlwi-00024p-GK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647507443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=puMmme6Cy1E859FS1S8t6Q9ySKZnINGqKcStWDkI45M=;
 b=geTl9I7nyvM4EvJstZ9hQFQWyxABbSugm9kNBzwgb3u3JLsohjdho02DLSvfAHSOVA7kvN
 qnzZL2+cb+6foYyoM8SSUy2y3GgTUobP1PyM4WMj+CK9lLoz35hGrZpl+DWh2uXCidKu3L
 YarRKo5UdgtjEUOKtEGlLYXGYJkrr9A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-nuymlP-HNFixxsqsXJ92jg-1; Thu, 17 Mar 2022 04:57:19 -0400
X-MC-Unique: nuymlP-HNFixxsqsXJ92jg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B80F2A59555;
 Thu, 17 Mar 2022 08:57:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A46024050C41;
 Thu, 17 Mar 2022 08:57:17 +0000 (UTC)
Date: Thu, 17 Mar 2022 09:57:16 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 1/6] block: Support passing NULL ops to
 blk_set_dev_ops()
Message-ID: <YjL37JDfUTwKpMrc@redhat.com>
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-2-xieyongji@bytedance.com>
 <Yi959Cf+k8z8gOwm@stefanha-x1.localdomain>
 <CAFn=p-bcvfOa+vNGXqaiJbg2CUEALJoMGVHN9NCQv2GRrf_D_A@mail.gmail.com>
 <YjBSp70Ml9p/Z273@stefanha-x1.localdomain>
 <CAFn=p-bkz0prqzjXuoTkCu3eWg6At0QbkjdzZF0+BjypXHFO=A@mail.gmail.com>
 <YjHVhrovVj0YcbAu@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MVFh0SSMJSal6Y3T"
Content-Disposition: inline
In-Reply-To: <YjHVhrovVj0YcbAu@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Sergio Lopez Pascual <slp@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Michael Tsirkin <mst@redhat.com>, eblake@redhat.com,
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <mreitz@redhat.com>, Xie Yongji <xieyongji@bytedance.com>,
 mlureau@redhat.com, John Snow <jsnow@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MVFh0SSMJSal6Y3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 16.03.2022 um 13:18 hat Stefan Hajnoczi geschrieben:
> On Tue, Mar 15, 2022 at 03:30:22PM -0400, John Snow wrote:
> > On Tue, Mar 15, 2022 at 4:47 AM Stefan Hajnoczi <stefanha@redhat.com> w=
rote:
> > >
> > > On Mon, Mar 14, 2022 at 03:09:35PM -0400, John Snow wrote:
> > > > On Mon, Mar 14, 2022 at 1:23 PM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
> > > > >
> > > > > On Tue, Feb 15, 2022 at 06:59:38PM +0800, Xie Yongji wrote:
> > > > > > This supports passing NULL ops to blk_set_dev_ops()
> > > > > > so that we can remove stale ops in some cases.
> > > > > >
> > > > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > > > ---
> > > > > >  block/block-backend.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/block/block-backend.c b/block/block-backend.c
> > > > > > index 4ff6b4d785..08dd0a3093 100644
> > > > > > --- a/block/block-backend.c
> > > > > > +++ b/block/block-backend.c
> > > > > > @@ -1015,7 +1015,7 @@ void blk_set_dev_ops(BlockBackend *blk, c=
onst BlockDevOps *ops,
> > > > > >      blk->dev_opaque =3D opaque;
> > > > > >
> > > > > >      /* Are we currently quiesced? Should we enforce this right=
 now? */
> > > > > > -    if (blk->quiesce_counter && ops->drained_begin) {
> > > > > > +    if (blk->quiesce_counter && ops && ops->drained_begin) {
> > > > > >          ops->drained_begin(opaque);
> > > > > >      }
> > > > > >  }
> > > > >
> > > > > John: You added this code in f4d9cc88ee6. Does blk_set_dev_ops() =
need to
> > > > > call ->drained_end() when ops is set to NULL?
> > > > >
> > > > > Stefan
> > > >
> > > > I'm not sure I trust my memory from five years ago.
> > > >
> > > > From what I recall, the problem was that block jobs weren't getting
> > > > drained/paused when the backend was getting quiesced -- we wanted to
> > > > be sure that a blockjob wasn't continuing to run and submit requests
> > > > against a backend we wanted to have on ice during a sensitive
> > > > operation. This conditional stanza here is meant to check if the no=
de
> > > > we're already attached to is *already quiesced* and we missed the
> > > > signal (so-to-speak), so we replay the drained_begin() request right
> > > > there.
> > > >
> > > > i.e. there was some case where blockjobs were getting added to an
> > > > already quiesced node, and this code here post-hoc relays that drain
> > > > request to the blockjob. This gets used in
> > > > 600ac6a0ef5c06418446ef2f37407bddcc51b21c to pause/unpause jobs.
> > > > Original thread is here:
> > > > https://lists.gnu.org/archive/html/qemu-devel/2017-03/msg03416.html
> > > >
> > > > Now, I'm not sure why you want to set ops to NULL here. If we're in=
 a
> > > > drained section, that sounds like it might be potentially bad becau=
se
> > > > we lose track of the operation to end the drained section. If your
> > > > intent is to destroy the thing that we'd need to call drained_end o=
n,
> > > > I guess it doesn't matter -- provided you've cleaned up the target
> > > > object correctly. Just calling drained_end() pre-emptively seems li=
ke
> > > > it might be bad, what if it unpauses something you're in the middle=
 of
> > > > trying to delete?
> > > >
> > > > I might need slightly more context to know what you're hoping to
> > > > accomplish, but I hope this info helps contextualize this code
> > > > somewhat.
> > >
> > > Setting to NULL in this patch is a subset of blk_detach_dev(), which
> > > gets called when a storage controller is hot unplugged.
> > >
> > > In this patch series there is no DeviceState because a VDUSE export is
> > > not a device. The VDUSE code calls blk_set_dev_ops() to
> > > register/unregister callbacks (e.g. ->resize_cb()).
> > >
> > > The reason I asked about ->drained_end() is for symmetry. If the
> > > device's ->drained_begin() callback changed state or allocated resour=
ces
> > > then they may need to be freed/reset. On the other hand, the
> > > blk_set_dev_ops(blk, NULL, NULL) call should be made by the dev_ops
> > > owner so they can clean up without a ->drained_end() call.
> >=20
> > OK, got it... Hm, we don't actually use these for BlockJobs anymore.
> > It looks like the only user of these callbacks now is the NBD driver.
> >=20
> > ad90febaf22d95e49fb6821bfb3ebd05b4919417 followed not long after my
> > initial patch and removed my intended user. I tried just removing the
> > fields, but the build chokes on NBD.
> > It looks like these usages are pretty modern, Sergio added them in
> > fd6afc50 (2021-06-02). So, I guess we do actually still use these
> > hooks. (After a period of maybe not using them for 4 years? Wow.)
> >=20
> > I'm not clear on what we *want* to happen here, though. It doesn't
> > sound like NBD is the anticipated use case, so maybe just make the
> > removal fail if the drained section is active and callbacks are
> > defined? That's the safe thing to do, probably.
>=20
> I'm not sure either. CCing Eric. Maybe the answer is to just leave it
> as-is.

NBD never calls blk_set_dev_ops(NULL), so does the specific case matter?

I guess the question is when blk_set_dev_ops(NULL) should be called in
general and what that means for draining. blk_set_dev_ops() is currently
taken as attaching a new user, and if its BlockBackend is drained, the
user needs to be aware of that because it should not send requests until
the node is undrained.

What does blk_set_dev_ops(NULL) mean, though? That the user has gone
away? If so, it doesn't make a difference because it won't send requests
anyway. If it's only about to go away, calling .drained_end() might make
it send requests even though the node is still drained. This would be a
bug.

It looks to me as if it's not necessary to balance .drain_begin/end on
the BlockDevOps level to get some counter back to zero. A user can
safely go away while the node is still drained.

Kevin

--MVFh0SSMJSal6Y3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmIy9+wACgkQfwmycsiP
L9YD/hAAluOFvlX1eXuYb9a04wpXu20ZOUJbpZPUqQRAYIATjExa2qU2EX+a4+bd
dE/i7B86kRUzS30Ap6DHcLJkn7udyhh68ZP55oMBs5XXbAqoQ6J21QyJxjQOrcZq
RbqtDmQONlIwr+AlNIo2qB2L2blbrW1dcvxUPEeGPLU50VtQyzjKvO5gvI8xQVc2
Lt5HvJGJKxwLTxqMdYkNfBcNOVUDrXgEuXW2UuBrKUn7QZ7V7RYNQtkzUYqFnQYw
TAGlt7IMyDD5Fdzj9+DUwJCkcPu6j2xPeEca+pFJ/K9aji7lzI4l2+eYmZDRGato
/PRKvYXrY6labqvJHB2B/VisTrsJOpHm/g6af3BHyxsmrnuYgliDtNdQpwDcxkJz
dR5XoslDuz7+0vAjZiltExwt4JtLfPZ5QC8v0bLxFm4ONuDs5ZLN0XBALarE6LVE
XwQ0Uv1h7egHfu4lF6CT6//3HIG0G0+kMv+JSWIEUjU+2q0tJN5xLLd04vtjyb+N
kO/4HbVZaeGrgcKU15K/vmiySVN7ugDh2ubpIAr9JJWeIAkDQftF3BokLXDfptPq
1ZVKYLYJtWlRdEiS6GBasiOY6/+EEW08+t/g1KdKrUiURJaKPHhvUdYFn5BfKuEk
ufJ8l66XiAvHH64/otTu+WxPttDAyRTKenO6Ma1OSSRd/QLFyFQ=
=SehZ
-----END PGP SIGNATURE-----

--MVFh0SSMJSal6Y3T--


