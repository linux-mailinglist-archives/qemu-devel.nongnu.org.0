Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADE662979E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:39:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouuHA-0004Q7-UH; Tue, 15 Nov 2022 06:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ouuH6-0004Nt-3k
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:38:46 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marmarek@invisiblethingslab.com>)
 id 1ouuH4-00071i-6W
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:38:43 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 822635C0120;
 Tue, 15 Nov 2022 06:38:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 06:38:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1668512321; x=
 1668598721; bh=Jxo4IkBy5DIaegqe/RAVUhtnEdJPJXh23XEzegecNQs=; b=l
 5QT+DF59k9EAsNiskPsQEF486fgMzxSC7HHmyllCU+VhwfxJ/VRLHQJ3BH+7LST/
 vXmJ0R5moNCc4PCUBkSgDDcFARE08NuzmCOrbp0ljqhPi7JmQwUmvC+DYS3eNicN
 NvQOadz2LdwfmhJ+D/qJphr3OH1kXcUUJk+/ns5qzECsSJr16cKmrvaAL4uagabH
 uekJSpO5Pfebox/y9XLK6mz3aDwl7N/zNHBlukthb2IF8JViNsQXifemNPv5Livu
 feagrwn2L3Y7aEaXeHMft1gFfUOEGLo10Ww0QAlz4DCtJJ2hqNSNRYczvVhMp4x9
 84m0duEcVOoBKVy2XY9wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668512321; x=1668598721; bh=Jxo4IkBy5DIaegqe/RAVUhtnEdJP
 JXh23XEzegecNQs=; b=sl/OykJkqXee2YpcNCgxo6NH1+bjCJIbqkW6Jj57hB1C
 6QMPRsJ3psw+zXdCdFn3x/Tx4ox+Ew6A8hAbPpjNNrgV0AOoPZ22Q5arj3f8jQ9U
 +VZi27xpgEFFt4LZAtk8YYH0sLzjqT+jY0PrAfW8Odl6W6sIXOaxmh/3OUsHf2vW
 jiStlqkEg1c8ZOR9vXJxfobqGFZPvUbeY6OP+MRmnImTTa7uInvqqTMwnI048xkc
 DqVgFyMp66asHbFlo0jDP9Q+EZgPuZeQyi32YKq3P2YW8wdbkIk7+giGguy+a6fL
 yhUwyPrOrCA9mtx7dOGAbulgrXdpZd+1h2NXh+DW1Q==
X-ME-Sender: <xms:QXpzY_EGxQF0AhqQZ-M5akQbCVQOWMLmpeV9hD1MHs6pZCjBbfijSg>
 <xme:QXpzY8WWQnElLB0GEgAfnATjPmnbFbx_k9cKWOfEaLMfdolJpAqB7DeriKBnDpzp1
 I_9wwjtqKe1rw>
X-ME-Received: <xmr:QXpzYxKIy9dDoRFCXIhMsjwTVjuUMIs7eepO28AdlUIJin14AKXNv5DnqAfbnJfWagg-akiyUmUPahB0EdtEuYxDXxtBm-piAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdefudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
 teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
 ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QXpzY9GHZA8PsOe_rspROjh9iFyLtp2lGUY_izfCfST9ckhE2Wq9nQ>
 <xmx:QXpzY1Vew46dJ-_0UiACnJU_PMxRacU-aznWtNHT9weVgPPHCaMdyA>
 <xmx:QXpzY4MkMn12Ogvay_NhlJ76z-e7bRz68vNL_H9vj1Mba9_BvqyhMQ>
 <xmx:QXpzY4R3u9GMz-GvUaAlJ_fiY8J6LIG2gAYbCgNHHKJILSgDAfawgQ>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 06:38:40 -0500 (EST)
Date: Tue, 15 Nov 2022 12:38:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on Xen
Message-ID: <Y3N6PZN0AnldeQdQ@mail-itl>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <dc3472e9-d73e-9540-deb2-b47a527000a2@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fP+2vUV7w+NDnUJ4"
Content-Disposition: inline
In-Reply-To: <dc3472e9-d73e-9540-deb2-b47a527000a2@suse.com>
Received-SPF: none client-ip=66.111.4.26;
 envelope-from=marmarek@invisiblethingslab.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


--fP+2vUV7w+NDnUJ4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Nov 2022 12:38:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen

On Tue, Nov 15, 2022 at 09:14:07AM +0100, Jan Beulich wrote:
> On 14.11.2022 20:20, Marek Marczykowski-G=C3=B3recki wrote:
> > The /dev/mem is used for two purposes:
> >  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
> >  - reading Pending Bit Array (PBA)
> >=20
> > The first one was originally done because when Xen did not send all
> > vector ctrl writes to the device model, so QEMU might have outdated old
> > register value. This has been changed in Xen, so QEMU can now use its
> > cached value of the register instead.
> >=20
> > The Pending Bit Array (PBA) handling is for the case where it lives on
> > the same page as the MSI-X table itself. Xen has been extended to handle
> > this case too (as well as other registers that may live on those pages),
> > so QEMU handling is not necessary anymore.
>=20
> Don't you need to check for new enough Xen for both aspects?

Yes, see my response to Andrew in the thread. I'm open for suggestions
what to check specifically (Xen version directly?).=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fP+2vUV7w+NDnUJ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNzej0ACgkQ24/THMrX
1ywIwQf/UFUun8P7OUjaX2Ec/IHmNYzkkRwq3iQjfLPLZBwaFQQptqOqE4wf6XLq
YaBlINhTIW4WnYziauBQnANTna4e2guNyungBS+ELjXqziZJ0vY/yMtg0/Z0Ajy0
cGg9Rt6swEvK8GBqAo21juYlZcOgtq7LvisGWh2mRb6+xnT1m6Iiq9UurGomHIwk
m8F5Q5dqV7gu3zS4C3AxaqHdttR1YcNmnpa5GrZYWt2MVpJ6LRChAKXRUXhlsqGP
180DHGlF5vVobPqMIOL9SBewp1X+kK0Qy9fN06hG+CAGvreZjBIVLMr7XmoGUQhG
mZ1tumxTGC3+T/b4l3C814kUOSnA/w==
=UW15
-----END PGP SIGNATURE-----

--fP+2vUV7w+NDnUJ4--

