Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F48696776
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:58:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwjr-0001jG-5m; Tue, 14 Feb 2023 09:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pRwjo-0001j6-8Q
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:56:56 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1pRwjm-0006Fm-37
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:56:56 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C68C75C0071;
 Tue, 14 Feb 2023 09:56:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 14 Feb 2023 09:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1676386611; x=1676473011; bh=VV
 BDSfUxx2qtbZ7QRACsX2fQ56YCcjJyEXsiLm26WBY=; b=KCGphgaag5K6lXpgXW
 RBUhKfEAZIEFVs1/+N1EiGKb9/QHFcriTHvSkGbodRu9ENtFRh7KvMolxjwArRXV
 Qrmx3pZApcA2ssHSHrWTreJBui1KFaPF6eEJz738GNTr4sx9Dy8YbW/68ACbPVWU
 6fLCrDDv06BJQGKok/PRFwZadzUEH2LdwNbQj8t1NLvcSn0MbU17R2rik14PAkuA
 l/mJZhYKof15idbBww3G49x3Nt2KMOVnvUfekWACDJEQ3YnTqKgzac45H8M2+sDW
 v5prZcD+s4TByJpuA2r0FpBnaGNL8pg9XlXG+PEdm/Zd6av/ABBea1VFXrUL4oHw
 EN0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1676386611; x=1676473011; bh=VVBDSfUxx2qtbZ7QRACsX2fQ56YC
 cjJyEXsiLm26WBY=; b=fV8hxH56FPdLxtZ8khneoFuYNp4le/yxT5nChX9HDc+K
 KdAkD4eQ3w0Ur8Mw+BeYgdLnkh357+lTjOPZkA87TtIyQ5ITCwusHcXprry+AwGw
 DPwlHZqAS4PJjzqpDiXTi1ZCVqj4x8unjTE1C6nrDBrvyOFc+FLouSaYwqDFrtXR
 BqxJ4275LdYzOMseOe5h+F8n5t/feKstbMD2JEECSjzHntHf94ZHcZjTLM7yxpBh
 Od1bTI8mpBSJiNNkp+VviE3pX4Ew2BWLfo9UbZAJ0mBCPX2UFUM1tpaPS0lD9sVG
 +TKPTshq0Tqe7HguayrjUTIdtcgU0OwDqXGls3e9Qg==
X-ME-Sender: <xms:M6HrY2T5LUdf4hiOXxQmk45DhskfAQJm0zIo9Tz8q2WNLJ2R3VwblA>
 <xme:M6HrY7wjyYRQ8uUWyrX-vDQEp0gDyahbwswEzcujEJdx_GKyPhP2CMF9V59mQpMsT
 MzZ1lT6wOr-F9ITceo>
X-ME-Received: <xmr:M6HrYz13bzCyICC3NMYo8Mt3HDW8XCohRKqdAbNcE79zJ-_ageZDh19MMk_ZUCm7tOmsTUNIriRLXUw6Hi40Z-HI8tqiF90>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeifedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:M6HrYyD_tdvIcOMRA5y2eDRhFXIzSzIQkcI-PEwC8w8UYczKK6wLcw>
 <xmx:M6HrY_gkeD1GfZyOr3j5KNkwYL-l-2wUECsJpUklQd3RcVobzircIQ>
 <xmx:M6HrY-op5cKxCRx2N75YqLY2jBx5nbTIBCEnDWqAKPcR4yBxlNx8bA>
 <xmx:M6HrY0blkdzdAolFfCfIVods3Yij80xkMbqaBCUbYCdz89cWN9IY_A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Feb 2023 09:56:49 -0500 (EST)
Date: Tue, 14 Feb 2023 15:56:47 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Major Saheb <majosaheb@gmail.com>
Cc: Peter Xu <peterx@redhat.com>, k.jensen@samsung.com, philmd@linaro.org,
 armbru@redhat.com, mst@redhat.com, lukasz.gieryk@linux.intel.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Subject: Re: DMAR fault with qemu 7.2 and Ubuntu 22.04 base image
Message-ID: <Y+uhL77aBFVEWsJd@cormorant.local>
References: <CANBBZXMpWOj5fE2YF8XGvWmBtbc=9YKiMCSfUKC7AoP5Ros9QA@mail.gmail.com>
 <Y+q3+eXdYz0qOtDT@x1n>
 <CANBBZXOtEF6Ao+Nxznf6dGOSTMX3F7iJvfOiWWngs79Bjy_YEQ@mail.gmail.com>
 <Y+uHMm1hvP7N6sKD@cormorant.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="03UiJoxATTndTV99"
Content-Disposition: inline
In-Reply-To: <Y+uHMm1hvP7N6sKD@cormorant.local>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--03UiJoxATTndTV99
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 14 14:05, Klaus Jensen wrote:
> On Feb 14 17:34, Major Saheb wrote:
> > Thanks Peter for the reply. I tried to connect gdb to qemu and able to
> > break 'vtd_iova_to_slpte()', I dumped the following with both Ubuntu
> > 20.04 base image container which is the success case and Ubuntu 22.04
> > base image container which is failure case
> > One thing I observed is the NvmeSQueue::dma_addr is correctly set to
> > '0x800000000', however in failure case this value is 0x1196b1000. A
> > closer look indicates more fields in NvmeSQueue might be corrupted,
> > for example we are setting admin queue size as 512 but in failure case
> > it is showing 32.
> >=20
>=20
> Hi Major,
>=20
> It's obviously pretty bad if hw/nvme somehow corrupts the SQ structure,
> but it's difficult to say from this output.
>=20
> Are you configuring shadow doorbells (the db_addr and ei_addr's are
> set in both cases)?
>=20
> > > > Following is the partial qemu command line that I am using
> > > >
> > > > -device intel-iommu,intremap=3Don,caching-mode=3Don,eim=3Don,device=
-iotlb=3Don,aw-bits=3D48
> > > >
>=20
> I'm not sure if caching-mode=3Don and device-iotlb=3Don leads to any issu=
es
> here? As far as I understand, this is mostly used with stuff like vhost.
> I've tested and developed vfio-based drivers against hw/nvme excessively
> and I'm not using anything besides `-device intel-iommu`.
>=20
> Do I undestand correctly that your setup is "just" a Ubuntu 22.04 guest
> with a container and a user-space driver to interact with the nvme
> devices available on the guest? No nested virtualization with vfio
> passthrough?

Assuming you are *not* explicitly configuring shadow doorbells, then I
think you might have a broken driver that does not properly reset the
controller before using it (are you tripping CC.EN?). That could explain
the admin queue size of 32 (default admin queue depth for the Linux nvme
driver) as well as the db/ei_addrs being left over. And behavior wrt.
how the Linux driver disables the device might have changed between the
kernel version used in Ubuntu 20.04 and 22.04.

--03UiJoxATTndTV99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmProS4ACgkQTeGvMW1P
DenYgAf/Sq769CSo9Xs6DmZwiP+c4pmZcUkZkrwZ5UAghfhxWfNDgG8EMZjvv9Ko
rrVuC2dsbOk8FnyB2a9HB2NEA4IFxk58ugEtyb9lojU7KFHfD7pMbozMvm8P1GaM
MW7xdbRzCrJPdKkzNxfaHk2ifLM0eN/bUFq761VUgj26DT2y5VTlVHNa2qceB6O2
N4b0WQInfVlbL/nL9e1ESP6tuLd6Z8M4y+8CR70uuvtt9MNhw/PGpujM4x/ySlmp
VA2YE96TJO5Tk4rsz6NoAVL4gX6FeDFglByPBJyzQWw/ULVDDKFA6YUydtkY/0xM
4hAIwNgP+Bxv3VL1n+XHKz9mgqW9TQ==
=VYo0
-----END PGP SIGNATURE-----

--03UiJoxATTndTV99--

