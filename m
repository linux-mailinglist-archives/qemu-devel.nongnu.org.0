Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4530D5FC1B0
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 10:15:00 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiWtH-0007zl-2K
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 04:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oiWkz-0003Gn-Pb; Wed, 12 Oct 2022 04:06:27 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oiWko-0000XH-L5; Wed, 12 Oct 2022 04:06:25 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CCB975C00DD;
 Wed, 12 Oct 2022 04:06:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 12 Oct 2022 04:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1665561970; x=1665648370; bh=V6
 BGlPmkoCohFtVlbh0xNbeKR3+7FF5bGWP4k4m0wnc=; b=KAboZhmkPUQwAKasDC
 8PKBauxPtzT7BVA5kBsZGNJrE+biSzW8FVFADKE2eO7NLrkFagkEmSEfMAH2fPrO
 T9fu3Ck1LuQbZN+QV4AUjtChFM3WRVoTUxOwEbvbyJWs+Nh8DlIQUDVlsL53UGtt
 QlCFmFDp5aHa9tXzAd+FkotgfpbncA2c68wxaXiAcfUShRNEh3qWqwUflPPcCi2P
 6T9d144IbHl3/POcdoTLo6x+y/3F2gFKWli/C/J4PcK/rGNxXjbhNbcFfmVKu+8O
 P6BqAWUupgDmlqcFCMbES7JKN5W5W6+jINuYslRoq1X3ytXkNfJ0UUlLJznIFVsd
 eCJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665561970; x=1665648370; bh=V6BGlPmkoCohFtVlbh0xNbeKR3+7
 FF5bGWP4k4m0wnc=; b=F1xvDgnMT4tI1U7MMGJT/bjYqn/tcJuVca+n/TPy4FJJ
 Egb1Jmyxm9ONviBfhRvpbNaR/30oAfIg9YNc7SpfGHbiXGArUINzveuF0sW8xqyZ
 L8kJ1lFZthgsULiMRf3taJpUHXDIVLqmddVQlYFkuYgeCHOMFDK7YJq93nDE5c0P
 B+IAjqyxutBk6Tx6zS9B/DqCFLy1UDfEbJ/rdE29FaHTlQruZzJIqs9Dh4dOqipR
 IXHsREA1cJo3C+uJhF8J0maiS/6FZKW2H/sM5YvPUdwYnpTjajVQGJtVc2tQ9mrg
 GciYmd3Ho17WkFAC+IF5OaxA9kF48QiTkYkXRyC2mQ==
X-ME-Sender: <xms:cnVGY45m470EWUsG9BNYyzAJNAIuiaM7l0kMtpU0_fvo3qKicBK8IQ>
 <xme:cnVGY55a1B6jCXFfM2PxvlIFH7X0Jh2xZMitTWacAb6uF7lBGT715elp5U__w0bgI
 1wPcuDZL_BjAtWI1i8>
X-ME-Received: <xmr:cnVGY3fh3G7FI6zFJhKYOOr84fIFdbhmZvjmTlTH9IWzUzwpqBiYB4V6SZ6Ab8bZT4G1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejjedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteff
 ffejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:cnVGY9JVNPe_t3Ut2bLxwjIkW1MUOacBRVRCfRI19x-Fuq6d-h1LbA>
 <xmx:cnVGY8L6PrxOZAodYss3G-M89T_rQFRRjPmciWice8enApff_UnWkg>
 <xmx:cnVGY-ys2aN8JVNEI91nIs7fG40bGLp4qq2EGXhE9F2PcGg0949DpA>
 <xmx:cnVGY2h-RoZo5nIXgKZTuTwnKUMPCqz1Nt8TByLJQec9SQTKHNXOBw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Oct 2022 04:06:09 -0400 (EDT)
Date: Wed, 12 Oct 2022 10:06:07 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Cc: Daniel Wagner <wagi@monom.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <Y0Z1b8C0zi3Kjw9G@cormorant.local>
References: <20210511073511.32511-1-hare@suse.de>
 <YJp2/AeqfgQ46ZyV@apples.localdomain>
 <5fe71d92-842b-2b86-1d5e-c7a106753d2a@suse.de>
 <YJqImppDvOKSbgh2@apples.localdomain>
 <27cc0341-3a32-4a75-f5fd-9987b1b37799@suse.de>
 <YJqq6rTRTL3mxMK6@apples.localdomain>
 <7f4c0a64-582b-edc7-7362-2da45c137702@suse.de>
 <20221010170100.o326gwco547y3qrz@carbon.lan>
 <deb27a4f-a053-40b8-b46b-5b4dbd4674a5@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9GBHeSZjQC5cEvKB"
Content-Disposition: inline
In-Reply-To: <deb27a4f-a053-40b8-b46b-5b4dbd4674a5@suse.de>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


--9GBHeSZjQC5cEvKB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Okt 12 08:24, Hannes Reinecke wrote:
> On 10/10/22 19:01, Daniel Wagner wrote:
> > On Tue, May 11, 2021 at 06:12:47PM +0200, Hannes Reinecke wrote:
> > > On 5/11/21 6:03 PM, Klaus Jensen wrote:
> > > > On May 11 16:54, Hannes Reinecke wrote:
> > > > > On 5/11/21 3:37 PM, Klaus Jensen wrote:
> > > > > > On May 11 15:12, Hannes Reinecke wrote:
> > > > > > > On 5/11/21 2:22 PM, Klaus Jensen wrote:
> > > > > [ .. ]
> > > > > > > > The hotplug fix looks good - I'll post a series that
> > > > > > > > tries to integrate
> > > > > > > > both.
> > > > > > > >=20
> > > > > > > Ta.
> > > > > > >=20
> > > > > > > The more I think about it, the more I think we should be look=
ing into
> > > > > > > reparenting the namespaces to the subsystem.
> > > > > > > That would have the _immediate_ benefit that 'device_del' and
> > > > > > > 'device_add' becomes symmetric (ie one doesn't have to do a s=
eparate
> > > > > > > 'device_add nvme-ns'), as the nvme namespace is not affected =
by the
> > > > > > > hotplug event.
> > > > > > >=20
> > > > > >=20
> > > > > > I have that working, but I'm struggling with a QEMU API technic=
ality in
> > > > > > that I apparently cannot simply move the NvmeBus creation to the
> > > > > > nvme-subsys device. For some reason the bus is not available fo=
r the
> > > > > > nvme-ns devices. That is, if one does something like this:
> > > > > >=20
> > > > > >  =C2=A0 -device nvme-subsys,...
> > > > > >  =C2=A0 -device nvme-ns,...
> > > > > >=20
> > > > > > Then I get an error that "no 'nvme-bus' bus found for device 'n=
vme'ns".
> > > > > > This is probably just me not grok'ing the qdev well enough, so =
I'll keep
> > > > > > trying to fix that. What works now is to have the regular setup:
> > > > > >=20
> > > > > _Normally_ the 'id' of the parent device spans a bus, so the synt=
ax
> > > > > should be
> > > > >=20
> > > > > -device nvme-subsys,id=3Dsubsys1,...
> > > > > -device nvme-ns,bus=3Dsubsys1,...
> > > >=20
> > > > Yeah, I know, I just oversimplified the example. This *is* how I wa=
nted
> > > > it to work ;)
> > > >=20
> > > > >=20
> > > > > As for the nvme device I would initially expose any namespace fro=
m the
> > > > > subsystem to the controller; the nvme spec has some concept of 'a=
ctive'
> > > > > or 'inactive' namespaces which would allow us to blank out indivi=
dual
> > > > > namespaces on a per-controller basis, but I fear that's not easy =
to
> > > > > model with qdev and the structure above.
> > > > >=20
> > > >=20
> > > > The nvme-ns device already supports the boolean 'detached' paramete=
r to
> > > > support the concept of an inactive namespace.
> > > >=20
> > > Yeah, but that doesn't really work if we move the namespace to the
> > > subsystem; the 'detached' parameter is for the controller<->namespace
> > > relationship.
> > > That's why I meant we have to have some sort of NSID map for the cont=
roller
> > > such that the controller knows with NSID to access.
> > > I guess we can copy the trick with the NSID array, and reverse the op=
eration
> > > we have now wrt subsystem; keep the main NSID array in the subsystem,=
 and
> > > per-controller NSID arrays holding those which can be accessed.
> > >=20
> > > And ignore the commandline for now; figure that one out later.
> > >=20
> [..]
> >=20
> > Sorry to ask but has there been any progress on this topic? Just run
> > into the same issue that adding nvme device during runtime is not
> > showing any namespace.
> >=20
> I _thought_ that the pci hotplug fixes have now been merged with qemu
> upstream. Klaus?
>=20

Yup. It's all upstream.

--9GBHeSZjQC5cEvKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNGdW4ACgkQTeGvMW1P
DelKBgf/c7wWdsdV2sIRhhkmXUXPhkvaRrLQyO0+uE6nDhHEr3Qi3AXREq280whZ
K1mjZbYaeedfs8Ve8T1gNcl9NmeIiqxP+Kqy9nAECL7Iwm/jDPo3Ua/dbXzHHggR
n4zCiim2cliy8I2SpYMSmDmDV7WtKl9VxhYqFVRRouo4A3gZJXIkVEtDLw+iEURW
nSkI0+yKXeH6l7/h/DDDbllvSQ2hP/axznKxNWJBygPqx65K7zFiia8nUsrIljpj
Yqc3UwYLgLs34UUMWzi/pA6XkVAyg3rKSFJqmwSSsE707TEI51/SWdt50+apDAzg
JAta7BOuStjK/FRTMVcROVGJgDY8wg==
=L6nV
-----END PGP SIGNATURE-----

--9GBHeSZjQC5cEvKB--

