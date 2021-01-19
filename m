Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4142FAFD0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 06:08:05 +0100 (CET)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1jFL-0000AV-Qa
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 00:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1j9G-0006pH-N7; Tue, 19 Jan 2021 00:01:46 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:51623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1j9C-0002yu-FX; Tue, 19 Jan 2021 00:01:46 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E39B55C0163;
 Tue, 19 Jan 2021 00:01:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 00:01:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=btgbSPmioBviaB2KB0r4IwcdqCZ
 FuSkT8WF+/R6WD90=; b=vlZzsI4kEUg1orqRowshRPGNCLvTHBVyRJWX2/QEyBr
 8Nx/kqqc3pl10KYRh69/uiW+Z/C7paJEoUL/6E7F4pU7qx3JvFil4SvjYXsjbhC4
 6s5A4KnfOCVeomsOMaSYOKfXYV7Lj7tueCYCe015XaH5sQ+pPXwcnxaw34GTrqRI
 IQwFIur1euIasuemjadse5VZGNbGIY6KCRoVks69V4Zf0R3Mi7I5MXjXyBHGlsOp
 nJSon7F5Naqb+tMuxhZt3/GSWdSsewsWi3eWcveZN8xEWj6qpqZt/smG31acNkbB
 sLA5HAwEiDodij1VeOzdGxuMbG/lvagJuWjDb9VMrcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=btgbSP
 mioBviaB2KB0r4IwcdqCZFuSkT8WF+/R6WD90=; b=GUbB2/AslsepQ6ZHJctyM7
 I/w2d6OyDOAVTtQ7RLg3UzcVEadcm2KFpk23IhQllrec4XJhfDtpwFaOVE5qtziL
 iZsTVBVPEYBPljC5gXdMb40K8cSLPx9UAasyaK83YOsFgF65HueAG3SsJxPFsFok
 mAMMbt8/KqFcEPbYZlVs0X7l6JNt0wFqDIe6I1bpRho5s4+A4Uu5eu4iMWYC4q9P
 MhPBUA52+8LckJA77fvqxvX1LLZ+41pl3bwbozC9h6NSbQ42CRvP6LnfclupzQ/W
 98MQ2RLqgXJrnyUa2BKGswVht0vFAG77TznM01YqvANQ2P6FreN9O7dl4eU8BBoA
 ==
X-ME-Sender: <xms:s2cGYAXteDZddqFLZc2l5_xyx-qooKyTJJmQz3JMLz87Sp9B0AthcA>
 <xme:s2cGYEjqgBXfJad2BlerYAZHK48mSqXTX1mDE2bgqzdvb0ppXQ70x9R61VpmBJ7QV
 OaJHNr9RZ2EyFPn7Wo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdelgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:s2cGYBRm5QWl5nZNslriIG1j_5CT8SKsYUoV0rWhbp3CuJ8jkDJPkA>
 <xmx:s2cGYHFbfdBNX32X9H3gaNHyYwlc1cMOA6slkeDFhU43LgDuvcYOhQ>
 <xmx:s2cGYJl-sr7eEvRV6b0uYN1njjiGX7mDBJoA11ifhlnc-dnh_DImIQ>
 <xmx:tGcGYGq6XwsF2MkzK3qLgqZ7UV1WfHQDH4NBCH3LcI1MgXChFkCyqg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 539D1108006A;
 Tue, 19 Jan 2021 00:01:38 -0500 (EST)
Date: Tue, 19 Jan 2021 06:01:36 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: Re: [PATCH v4 0/3] support NVMe smart critial warning injection
Message-ID: <YAZnsDaUqennX+1d@apples.localdomain>
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
 <YAVWGC4HKFlaKolQ@apples.localdomain>
 <1797a9bb-f0bf-4377-2fb7-e3dc6fcba733@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Z7QvNO1C+zBpgmIz"
Content-Disposition: inline
In-Reply-To: <1797a9bb-f0bf-4377-2fb7-e3dc6fcba733@bytedance.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, k.jensen@samsung.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Z7QvNO1C+zBpgmIz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19 10:05, zhenwei pi wrote:
> On 1/18/21 5:34 PM, Klaus Jensen wrote:
> > On Jan 15 11:26, zhenwei pi wrote:
> > > v3 -> v4:
> > > - Drop "Fix overwritten bar.cap". (Already fixed)
> > >=20
> > > - Avoid to enqueue the duplicate event.
> > >=20
> > > - Several minor changes for coding style & function/variable name.
> > >=20
> > > v2 -> v3:
> > > - Introduce "Persistent Memory Region has become read-only or
> > >    unreliable"
> > >=20
> > > - Fix overwritten bar.cap
> > >=20
> > > - Check smart critical warning value from QOM.
> > >=20
> > > - Trigger asynchronous event during smart warning injection.
> > >=20
> > > v1 -> v2:
> > > - Suggested by Philippe & Klaus, set/get smart_critical_warning by QM=
P.
> > >=20
> > > v1:
> > > - Add smart_critical_warning for nvme device which can be set by QEMU
> > >    command line to emulate hardware error.
> > >=20
> > > Zhenwei Pi (3):
> > >    block/nvme: introduce bit 5 for critical warning
> > >    hw/block/nvme: add smart_critical_warning property
> > >    hw/blocl/nvme: trigger async event during injecting smart warning
> > >=20
> > >   hw/block/nvme.c      | 91 +++++++++++++++++++++++++++++++++++++++--=
---
> > >   hw/block/nvme.h      |  1 +
> > >   include/block/nvme.h |  3 ++
> > >   3 files changed, 86 insertions(+), 9 deletions(-)
> > >=20
> >=20
> > This looks pretty good to me.
> >=20
> > I think maybe we want to handle the duplicate event stuff more generally
> > from the AER/AEN code, but this does the job.
> >=20
> > Tested-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> >=20
>=20
> What's the next step I should take? Should I push a new version to implem=
ent
> this purpose? From my understanding, before inserting a new event to
> aer_queue, I can parse all the pending aer to find the same event.
>=20
> nvme_enqueue_event()
> {
>     ...
>=20
>     QTAILQ_FOREACH_SAFE(event, &n->aer_queue, entry, next) {
>         if ((event->result.event_type =3D=3D event_type)
>             && (event->result.event_info =3D=3D event_info)
>             && (event->result.log_page =3D=3D log_page))
>             return;
>     }
>=20
>     QTAILQ_INSERT_TAIL(&n->aer_queue, event, entry);
>=20
>=20
>=20
>     n->aer_queued++;
>     ...
> }
>=20

No, I'll pick up your series as is, I'll pick it up for nvme-next later
today if noone complains! :)

--Z7QvNO1C+zBpgmIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAGZ64ACgkQTeGvMW1P
Dempqwf/f2hPuABrDniEdbZiNu8p/FhI1ohbiDoEHkQ42pm/QS3vlynFGTuIP7Nh
RmRTn+PWZVac4CzyuPNqC9e2Ps/1300l3dTvWfFk3Lfd9dKezIa2rfxq400wrYJY
zYLoI+KEsMF5YqIvd6yXhu5+1ajC5mAvcCME6dSQ11/7DqyJyVM2F6SvQc2YxtXk
tX0wjOtsSWyN6yN+edC1NQa59mNyvZdT+wf4Ig4KhaKz9hNl9ErJ1JOfOiKoVoam
hdkDTWXTEYHxbAEJEQ+zP8xHqAOV8we2pk2dGVXSbpegG10SQi8MUN+NzySAEYJy
9OY430jFBhpAZdUijMqoO501IzD6ug==
=J5AW
-----END PGP SIGNATURE-----

--Z7QvNO1C+zBpgmIz--

