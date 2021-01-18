Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C5E2FA199
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 14:31:46 +0100 (CET)
Received: from localhost ([::1]:43148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1UdD-0007B2-11
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 08:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1UUG-0004zK-EG; Mon, 18 Jan 2021 08:22:29 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1UUD-0007Yh-BA; Mon, 18 Jan 2021 08:22:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 39EB55806EF;
 Mon, 18 Jan 2021 08:22:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 08:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=87No7PPWOJGy8DlGzWVCmPPkZBM
 Wh9l4uTAzWvz6sT4=; b=iYqONkxNfsfnMqXKs9gIDeiuY/6hmUkShnLu2CGd9+3
 DLZlWeAHuJbBDvLtBa3XqsQdd4lOLqqnZbiWSMadPKHCNrc6dU1JwFDL17+YnI18
 e9X9t18l/sac/zTVuAEBGPvdcQRu5NSCsqgfm8nX32r2FoJhtM0MqVuY7ujkdeFz
 l8AHA5CoOuFCubZp9FryNp2czPRAWr7J8quaOmFl2whLleeqAoiTiGUYMGHR0JTR
 4cTzIe8gNivN5cMzxuxmT1zntULWahhMojJAMJ9Q1B+Yb5jMgVtCw7xQ85EHQVmb
 smrZzXlL5L87FYOqqJxgbB1ZMAvtMgPa21Svffj3IfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=87No7P
 PWOJGy8DlGzWVCmPPkZBMWh9l4uTAzWvz6sT4=; b=CcD1091E59xBdHhjR7AIAj
 u1DcdQPwuC/Yg7V7XR+K1iO9Vk/tCBPUk6JOH89/1VAzLYVvmKSGD2DQMNOsindm
 Imnl01157L5OZp58tUqHAQOGMCN+ELqM8myapfWjOdi0tJEPs8w65PWR0+l73qTP
 fjioLLzUYI9gGE4n+7BGwVaD3afuBhpq1W9XJS9pZa5EYapopIn4yH2iw3UaBDdH
 xVwRKYtl8buHyBb595hBIVlWQA+qXok8spAdO3y5LD2RVCj/cVLrZbUf5A+eJ6z0
 uWjfjWBRyBRTkolYJf95DdfrriO5uUdPFqPICgNYJ6yFxY5RwY6myWHachMzG9OQ
 ==
X-ME-Sender: <xms:josFYEL0YVquf38GXanptbVbDXfCL2SkypBifPPo6_3pwUaXB0RdkA>
 <xme:josFYEJo9i2_zZSkMYzmdMO0n5d6jrcdZR4ztFHXm_dOlvpPJl471YDyMTo-ecuvj
 L27ueVENMvYonuY3PA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:j4sFYEsIzkO0ifx7L67o795s29kMviJckE6pXaiPzgsZJdimanarJw>
 <xmx:j4sFYBZWNO7AX-36ALABxGNiIUTLpBcXtktXzCeOGrCBooIviHxu0g>
 <xmx:j4sFYLYvLB4itPzuZlCUWOIBoS80YgsR6CSZmtfXWpVw-4Ohh2et_A>
 <xmx:kIsFYJOZC-3i6gS-g-V1mO-7V0fZ7bFgpAWBybKhKQ8el7U4-mvn9A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F85E24005D;
 Mon, 18 Jan 2021 08:22:21 -0500 (EST)
Date: Mon, 18 Jan 2021 14:22:19 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH v2 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <YAWLi/ynEMfyQ66T@apples.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-11-its@irrelevant.dk>
 <20210118125859.GH18718@localhost.localdomain>
 <YAWHSaXmpo64xmmp@apples.localdomain>
 <20210118130946.GJ18718@localhost.localdomain>
 <YAWI2sFftUEspcT+@apples.localdomain>
 <20210118131205.GK18718@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OpRCC7qYMtAY6BkT"
Content-Disposition: inline
In-Reply-To: <20210118131205.GK18718@localhost.localdomain>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--OpRCC7qYMtAY6BkT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 18 22:12, Minwoo Im wrote:
> On 21-01-18 14:10:50, Klaus Jensen wrote:
> > On Jan 18 22:09, Minwoo Im wrote:
> > > > > Yes, CMB in v1.4 is not backward-compatible, but is it okay to mo=
ve onto
> > > > > the CMB v1.4 from v1.3 without supporting the v1.3 usage on this =
device
> > > > > model?
> > > >=20
> > > > Next patch moves to v1.4. I wanted to split it because the "bump" p=
atch
> > > > also adds a couple of other v1.4 requires fields. But I understand =
that
> > > > this is slightly wrong.
> > >=20
> > > Sorry, I meant I'd like to have CMB for v1.3 support along with the v=
1.4
> > > support in this device model separately.  Maybe I missed the linux-nv=
me
> > > mailing list for CMB v1.4, but is there no plan to keep supportin CMB
> > > v1.3 in NVMe driver?
> >=20
> > I posted a patch on linux-nvme for v1.4 support in the kernel. It will
> > support both the v1.3 and v1.4 behavior :)
>=20
> Then, can we maintain CMB v1.3 also in QEMU also along with v1.4 ? :)

My first version of this patch actually included compatibility support
for v1.3 ("legacy cmb"), but Keith suggested we just drop that and keep
this device compliant.

What we could do is allow the spec version to be chosen with a
parameter?

--OpRCC7qYMtAY6BkT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAFi4kACgkQTeGvMW1P
Denv8gf/dg67SbBzyv5xsHcFrbJLNGicf378pr3r+h8W/Wnw1GpnC2M4YwPap5I8
y0VVji+sdBCCV7c2BRqUZplQFfZ/6onFhIUUvd/wGGRXqWWbcnxhLQHH3gqxYnip
/b6KVqMnwJZ9+2RcTBNg9eEipkhdss428c6wRLycg75VRC608SAdPFWyZ1fhrGgU
ml/Xc9b63Md9YIPWXes+ZHWEORAz5s9nNCvdkr56jRR6cZQpmWXJrxgL6ZvlBbD5
rQ56sNskP8qR6CmJ/dHbAS9TFUEDyyfAIiheeyENh3+mIypukP/zQodkyxqSO9G5
ss6jr6jw7jj2QqQcp2WJB852NOu3Pw==
=BS3N
-----END PGP SIGNATURE-----

--OpRCC7qYMtAY6BkT--

