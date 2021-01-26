Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC95303840
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 09:45:54 +0100 (CET)
Received: from localhost ([::1]:40988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Jyz-0004uA-07
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 03:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4JuA-0003ZE-L0; Tue, 26 Jan 2021 03:40:54 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:54759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4Ju8-0004c9-BR; Tue, 26 Jan 2021 03:40:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8EABB58094D;
 Tue, 26 Jan 2021 03:40:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Jan 2021 03:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=PMsbskp7osdjoAEx1RrE2uXCnrM
 ywwykNLMVi0nX6yE=; b=z40VsxLXo9GjBNUxYWYWVuhvntsSWdnypxWJCmaG+oM
 OLi0qhY/NycasEbFKJtHB/G5jBbVDITWLu7MA+WYiPMH5SamNj+O6Ahxu020N5Bg
 0oytvEUmJUit+p74bgl4n63uN5NMakTRyFil6iq3uQ1vOiuQDMlQpFeQ5QGbOlna
 Rik+M3avHgr/SCk/6Y/HP4rrAQLwRB+BpXFmKpbKon+mmo31oz+cAZ3L1TgjB4xh
 SIkyT7b0STt8h4Yo6DDap/yifHNzcK0yxs5MPAPKoNul5o4lAF0isnuG+Tq3a/HK
 RhkT3BnLIvXh+epX/OJl5qVzpRMOpYu3aBcheWyG6FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PMsbsk
 p7osdjoAEx1RrE2uXCnrMywwykNLMVi0nX6yE=; b=V5OcIkYwxBQ2QiQV8omNot
 aJEl8r5o7OkM69qqkcELFwCnDFVapY7PNjAbi9bbREVsxsZS+XikYCeKJNKckflA
 gGVI12cI8OqmwimBqikkRYSlD9gEoWOdn9U2gWknA1FHTsHBrPNcBzOb54NrC2uO
 DiYgp1uzmZRlDPr1H4k0+HWvYJ7UT69C8gUjq8w7E9fx1XRyChkQhx0+T6q7N+S2
 1uj636t1emrE1vGZchllcbZvIaV+WL+Vc20LM+Xcyc0LTkz3WBVQstrtVsNpOMKs
 xeyTmEtkgmYOZS3hNYo21mCeq/M66l6usUR9lhhqxzrjX/yPdyPoKtyNnwZSYrJw
 ==
X-ME-Sender: <xms:j9UPYK8e0hZNbzM1nQLh-KDqg6Eq8A-95fhJEJRWubf2_jD2t98e2A>
 <xme:j9UPYKtmUtJJNeurzT98rv8ChG5rotfDEPCJFS9d83mc9YoFum1G5pOdKiCSkBhQI
 WvgIXiUZPndZMtGqac>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:j9UPYACxV3wRv5XfnxF8CssU--vEDGDLLwKr-xOpLYOAkKPJ-0-5Ng>
 <xmx:j9UPYCfJPyt6dkIUjD12fI7C6lphZpCmRU2nUDo3elHt0sRiJ_yCQA>
 <xmx:j9UPYPNzGTe_RY0zFaoO4HdfQSLrMThBWVvYPQMj1i9yGZb51E9IAQ>
 <xmx:kNUPYIjZVK0Iq04KsZM0Gdpt57G8UTF4VlT_oKJiLI0S5t97KHHOfQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 31761108005F;
 Tue, 26 Jan 2021 03:40:46 -0500 (EST)
Date: Tue, 26 Jan 2021 09:40:44 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH 0/3] Fix zone write validation
Message-ID: <YA/VjPTKjl0Mhq9l@apples.localdomain>
References: <20210126050248.9077-1-dmitry.fomichev@wdc.com>
 <YA/RJhWQMV/6jqTS@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3DFXH55EJH6hxP4D"
Content-Disposition: inline
In-Reply-To: <YA/RJhWQMV/6jqTS@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Niklas Cassel <niklas.cassel@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--3DFXH55EJH6hxP4D
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 09:21, Klaus Jensen wrote:
> On Jan 26 14:02, Dmitry Fomichev wrote:
> > These patches solve a few problems that exist in zoned Write
> > ans Zone Append validation code.
> >=20
> > Dmitry Fomichev (3):
> >   hw/block/nvme: Check for zone boundary during append
> >   hw/block/nvme: Check zone state before checking boundaries
> >   hw/block/nvme: Add trace events for zone boundary violations
> >=20
> >  hw/block/nvme.c       | 35 ++++++++++++++++++++---------------
> >  hw/block/trace-events |  3 +++
> >  2 files changed, 23 insertions(+), 15 deletions(-)
> >=20
>=20
> I don't think there are any obvious benefits to this series over my fix
> and since you didn't identify any functional issues with it, I'm
> thinking we go with that.
>=20
> My fix additionally removes setting ALBA in the CQE for regular writes
> and bundles the endianness fix by changing the related logic in
> do_write.
>=20
> I have a couple of series in queue that also includes zoned writes and
> there is no reason they have to indirectly deal with append. It's just
> cleaner to move this special case closer to where it's used.

Keith,

I think this calls for your +1 tiebreaking special ability.

--3DFXH55EJH6hxP4D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAP1YoACgkQTeGvMW1P
DemikAgAgPUlzF6kEZvwJE6mfeHupSaVf/wKbfLGBP3rPSZqZGPJRHg/XlgiZEw0
E3vIuMGq3OZ3kcV24hLG3jdE18ypKCjJp57M/18jHJgaKjNNXUpCwuRG9PYTkcXE
TRhvFkNVj+Kvv7Hg0gOLxsRlwouILmNXoqRKyZcZ8aShaSAtIO/Usrn6Ydrx23zu
LI3ZgcqKXtWqCKqGQ44I2keMeGsJvnfmHF5APFqepbPEbi1iLa8v77/4WKFXSIwO
uoWX0x/JIKshKxeLQgximZAYLl+ew2V3yHzXXR5VdpugcSEe02dvGUwuE/QErLJu
476zPYq9HEe3bx4kpL0s6z79OVdOLQ==
=vIJj
-----END PGP SIGNATURE-----

--3DFXH55EJH6hxP4D--

