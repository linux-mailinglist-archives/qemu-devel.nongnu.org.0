Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6322F0EFF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:25:25 +0100 (CET)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kytS0-0001Sl-7U
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kytO5-0000tc-BN; Mon, 11 Jan 2021 04:21:21 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kytO2-00053O-KS; Mon, 11 Jan 2021 04:21:21 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2D0B5271D;
 Mon, 11 Jan 2021 04:21:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 04:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=6MocgUdhbNqs3xUZHc5dclQeHs0
 eueg9sGz+hKU/06A=; b=Wbc74H6GjI63L6xwskDTRcXHkPsb3AWx6JBdMafapEg
 gMXH2PBXFIeGc54BYDx9vJ5ZyHdUSNRbLrN8UsxOdnUc6XqN6AX5oP61Bcw85Pgm
 +y8jb54SxVQ46Ee2Sm/KEWjUxhnTX0oSL1BRXWsj/15ojoGJkZ85uml1AqiMVsAK
 JH1a3vTqGqPxVUCaJbMek+Alwzcm8lRnBn2KfUTVbJm8vtUPvxUbi++jqQfHZuJI
 5Rf2mDPTbHM8yBryvIGOE8oJfsy5gfjPg0sb5jFrPoC5cOJDLRhZXIA1KtE+q/i9
 d9kmin4aSY4F+vUajNOjth8DDEDQhT/wxPzRhZg/h/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6MocgU
 dhbNqs3xUZHc5dclQeHs0eueg9sGz+hKU/06A=; b=nI1XAQwOVYarZpBLpXTbku
 QjD3qmHIBeaq1tN/R3CYZJKmWFI4glKivKS+CdzvoV/AybjixkonhzwpQsUOSkNm
 soMuSMuUEStBIt6tAvzJnn/bPoqfPJ8SEjgnAuBDTQqo9+cR9ZCs/PAFgbTO0y7T
 4CFkZG1hj7nLrep13ENm9X5bTtJhVju99/NMYLkk0g+bD9vhZK35ZKsyvw/UpQuM
 F/a8szugJQJNO2sunS4LKyyZx1FVjex09P1/ihSjPF3Gov/e7gyQYkt09DL1SDh8
 S+sz4tT6PziZVhA/Tmo9zQ9miajewOdL5s+yT2Ke3uke/DEd+Q6BNgbYwYasE6SQ
 ==
X-ME-Sender: <xms:iBj8XyEnP7f-oHHrDWTaqpVtuQ2CRbHzMTwX3UWNGM8wdoTMfFnBYw>
 <xme:iBj8XzVrbbvWtnmpygwJW2jByfTyUanmcWLdPsUzt3gNELiflNCG9LmJWmnYWc7lM
 c_eth32h4FVqxdSWFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgtddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:iBj8X8KbJN7Eu32HHiXsn8ZGzVwzG8FapSaMbICXxc6SrYIT0YlwSA>
 <xmx:iBj8X8EJQpHuSQy0ZUworujpNz05Sm_0tnsWH4TP_VKgeDtgy5VWkQ>
 <xmx:iBj8X4VREcY8cQDJxMn3uf5NusXEGDJFlkQXMzcfYheaV0TAN1xvgg>
 <xmx:iRj8X2zfAZ7Hh_oq-NDB0poeYhwr_DxtMwxyqr5xflhhCRtHfTCBXQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 499CA1080067;
 Mon, 11 Jan 2021 04:21:11 -0500 (EST)
Date: Mon, 11 Jan 2021 10:21:08 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/block/nvme: add smart_critical_warning property
Message-ID: <X/wYhMjr03odt+eq@apples.localdomain>
References: <20210111075003.151764-1-pizhenwei@bytedance.com>
 <3ebda26a-2734-242b-c553-2092ba7f4b35@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AIvcd1/RNOwBZOyI"
Content-Disposition: inline
In-Reply-To: <3ebda26a-2734-242b-c553-2092ba7f4b35@redhat.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kbusch@kernel.org, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, zhenwei pi <pizhenwei@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--AIvcd1/RNOwBZOyI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 11 10:14, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/11/21 8:50 AM, zhenwei pi wrote:
> > There is a very low probability that hitting physical NVMe disk
> > hardware critical warning case, it's hard to write & test a monitor
> > agent service.
> >=20
> > For debugging purposes, add a new 'smart_critical_warning' property
> > to emulate this situation.
> >=20
> > Test with this patch:
> > 1, append 'smart_critical_warning=3D16' for nvme parameters.
> > 2, run smartctl in guest
> >  #smartctl -H -l error /dev/nvme0n1
> >=20
> >   =3D=3D=3D START OF SMART DATA SECTION =3D=3D=3D
> >   SMART overall-health self-assessment test result: FAILED!
> >   - volatile memory backup device has failed
> >=20
> > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > ---
> >  hw/block/nvme.c | 4 ++++
> >  hw/block/nvme.h | 1 +
> >  2 files changed, 5 insertions(+)
> >=20
> > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > index 27d2c72716..2f0bcac91c 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -1215,6 +1215,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint=
8_t rae, uint32_t buf_len,
> > =20
> >      trans_len =3D MIN(sizeof(smart) - off, buf_len);
> > =20
> > +    smart.critical_warning =3D n->params.smart_critical_warning;
> > +
> >      smart.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units_=
read,
> >                                                          1000));
> >      smart.data_units_written[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.uni=
ts_written,
> > @@ -2824,6 +2826,8 @@ static Property nvme_props[] =3D {
> >      DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queu=
ed, 64),
> >      DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
> >      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, fa=
lse),
> > +    DEFINE_PROP_UINT8("smart_critical_warning", NvmeCtrl,
> > +                      params.smart_critical_warning, 0),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> > =20
> > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > index e080a2318a..76684f5ac0 100644
> > --- a/hw/block/nvme.h
> > +++ b/hw/block/nvme.h
> > @@ -16,6 +16,7 @@ typedef struct NvmeParams {
> >      uint32_t aer_max_queued;
> >      uint8_t  mdts;
> >      bool     use_intel_id;
> > +    uint8_t  smart_critical_warning;
> >  } NvmeParams;
> > =20
> >  typedef struct NvmeAsyncEvent {
> >=20
>=20
> This is an easy way to achieve your goal.
>=20
> However a better way is to add a QMP command to
> change NvmeCtrl->temperature.
>=20
> See for example tmp105_initfn() in hw/misc/tmp105.c
> and qmp_tmp105_set_temperature() in tests/qtest/tmp105-test.c.
>=20

Nice.

+1 for this approach.

--AIvcd1/RNOwBZOyI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/8GIEACgkQTeGvMW1P
Dek1oAf/X8jpmqwQnMgbf6tEb5K/yCu+J5ZSP7yMOz/+VBuR72TXiYpAl2bEy2N5
x0TJL8rlAm0MNOOUpTFu+niaTUZHOikowNLT3h5TmphS4K2XKTUo/aEK9wtbTxif
VviJLbIc7MJxgOryPQlfK0qGgw6LRXIGP3tZeUz96vSI6lNyIxZfEwHY5JIXvWB6
pzCO8lV5HnM0R33R7xYwkVPPXXg7Dls2ulPRzX0xcI8NxnEbbVL5cqGTqERtAdAo
eaBH237N5rF8WNpGdqQLKLWpNkilUW8184J1mDQ0DfgMwke1f5M9MHC8VS2C7Sne
CVtXAt+FxFApWx5Yck3ipVjtboT2FA==
=vsTh
-----END PGP SIGNATURE-----

--AIvcd1/RNOwBZOyI--

