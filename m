Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6F544312C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:02:06 +0100 (CET)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvIa-00036W-IF
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhurb-0005VU-02; Tue, 02 Nov 2021 10:34:11 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:60007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mhurZ-0007E8-3w; Tue, 02 Nov 2021 10:34:10 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id A68842B012E5;
 Tue,  2 Nov 2021 10:34:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 02 Nov 2021 10:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=RigQeV4bjx08MCd9U7ZvKtXu4cy
 4OKp5vNGdaZMLZRo=; b=gj4SGCc21wpAaI3EI3QBAGXsvqH2PCUQ60HYEOkQ1tW
 m6+RcwhItGNvjYn28xqhJcjR6l6HkBsJpe85TFFrhnj7gKsp5Q3wLPvCKP+/zk6c
 DSnMPa1uVhMWCFV0veA4NM5XCAiF+a82beaEIO8pJtE7Den8bCIgS1bUTPgyw4gH
 jHx18uzEpCKq3weAimOTWW1DrzPHf7ALzi1CiSCb7yrMABzyK6Kakpzbg9kiMeuC
 CbLToksDRFM04CtOwZs+U6LjXjWlHIuQ0MGOE3IvIux6LUJluSRJU3NlQLn/ktVz
 SD/D9eM2wm+XCnkemELGunwNnvcXegWdIE0PmvbsxBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RigQeV
 4bjx08MCd9U7ZvKtXu4cy4OKp5vNGdaZMLZRo=; b=IcjEPHCsYCFbPfKrOqCrvH
 3M3PwnASHCxRAjkEyUWrb/m4JGc4IOLst+k9gATDxE30+W3Sql6xazy/dND2/nwH
 reZ59i18CTJlV4LQUqZSUPIgn596smIx6Ubcqekw03eC5rabfoCNl+PA3CxbG3dE
 cElMstcHiCZhV+lDXFtImImrMTp/hheu9YOHljqVaHlsRvpPsjILmXpI8AZBJvpy
 ys7Qh5P+fztcNzL9QAg5Ho2P+53iZFtqdUUHvUTxkpHK/nW7XfGYqYW/zCyiZdGW
 +Uip9BrnQZYqyCYBzOffR1/FDSjeNhYtanPlOxQz8OAFuKyChVgnBnxapjhabrGQ
 ==
X-ME-Sender: <xms:XUyBYWLvp193Mgw0SfgO3HwHtunf8pFAuFarbWfGddhIY6adUPqykA>
 <xme:XUyBYeIU4Y2kHKNmqWiw3UtYE0PfYNevmo0Zw_CLjLgI2f_KlcHzJ14KCoSML6laO
 DKwowwREqTSWBsu9iI>
X-ME-Received: <xmr:XUyBYWtIUdUSyErdh_gvsHs43iC2x-scYO84G7y-AWXE7eXV6bwC0U0VKKxEChjkK46sW9NnkwnBZ_CrwhxhjIQbsXRywuPRZSbeYcHh_U9H9xKvmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddtgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XUyBYbZjM6zgS7HXHWngN6s_0LzxYSMF50P4aKrPuUYeN5RrEmE0lA>
 <xmx:XUyBYda8gnlE1oqcdgNITF-UhNJKe0a_SgUxZyhKP3I-UyhJk6FTuQ>
 <xmx:XUyBYXBHgVwRTSg5PUaumH52QZ71yFQ01x69t7NcjknDzYeaCgeHXQ>
 <xmx:XkyBYfndYKsx2QaAc1eOCQco5Gl8lKK59QJSM3xJ2V19uTZT4b18HVCseHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Nov 2021 10:34:03 -0400 (EDT)
Date: Tue, 2 Nov 2021 15:34:02 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH 06/15] hw/nvme: Add support for Primary Controller
 Capabilities
Message-ID: <YYFMWnmsaMx++NLE@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-7-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VZ119HrEPvuXZfjz"
Content-Disposition: inline
In-Reply-To: <20211007162406.1920374-7-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VZ119HrEPvuXZfjz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct  7 18:23, Lukasz Maniak wrote:
> Implementation of Primary Controller Capabilities data
> structure (Identify command with CNS value of 14h).
>=20
> Currently, the command returns only ID of a primary controller.
> Handling of remaining fields are added in subsequent patches
> implementing virtualization enhancements.
>=20

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--VZ119HrEPvuXZfjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGBTFgACgkQTeGvMW1P
DenQfQgAmKuyVpGMW0/4J5dNfgvqxCX7prv9sYjlPur6O72STajQ4JKgbiVMc5K5
1juaeqbLd3gSXef23yjcAbKVd6CPj5ACcBOM+RoP/5ik60oWofdwKbVwCTpVkXnF
h3qM5KFs2+4MmeayQXUsnHf8nDb2E5MluWXij1KwtF5VJfEI/+f/ox7bhsUDYfsP
DXkVhh/hbmLEmPH3CLhDpqeVusccnB2WmUEt0Z5xo134gwDB0JcVzAYNkGf2xsiN
O+Ajh1vmTOtksfdujG8ccw0/kXE5vKnyfHyFy4hOPm6OE9gQ+h5GklqsVsL4NF7a
jLQywspQDIKJNW2+6eFef15SEujjiQ==
=U3Nn
-----END PGP SIGNATURE-----

--VZ119HrEPvuXZfjz--

