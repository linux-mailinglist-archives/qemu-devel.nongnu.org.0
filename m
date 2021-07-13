Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 674FD3C725D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 16:38:26 +0200 (CEST)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3JYH-0007Ik-AR
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 10:38:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3JU2-0005DG-Kq; Tue, 13 Jul 2021 10:34:02 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3JTz-0000Io-Oi; Tue, 13 Jul 2021 10:34:01 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 34A0C5C0199;
 Tue, 13 Jul 2021 10:33:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 13 Jul 2021 10:33:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=g9NZGArWpAAJTFdBKTXx6zn4wdP
 hmIh6rXXu/ylojDE=; b=PxLDYo87FUzVH5RALYxOYGNpgmfbmd4DE0bB+NJgcNA
 im5MjTJBufEnFtRigErI9jFk8XpprgZ+CvxQ8rl6OeMPMMnc9o6tDi4nfMDlmK6/
 oMG4rrhS/CLsjjRT3+f8BamzRaqQZgb1JNIt+ZaWDEq6ds4+9YQMoGgNVeat829B
 5ou6jtXDF87IY+6ps90/SUsF2a/eVk71S2OnZ83EKv7NtfPostfTo8kosWA9aHWT
 NLgjrc/dQTw75Gxkik1qfDGy5ZlT/ACYMHRh2+B2heBxEhOrkIJ41fdD5KVR3VgQ
 2vgSZ3yZOLVmxRvgQ2fgIHdqQgTHvJ+K+PycLsb9iMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=g9NZGA
 rWpAAJTFdBKTXx6zn4wdPhmIh6rXXu/ylojDE=; b=fjv2lWdZyyINvLMGlGir6H
 g3ste9msMeSyjTMNFVwZ6mtdPjmTz/7sL0UftualC7ccvPmp+QYVsy28b0ib23Uo
 6+4N9cTg6EJH04DB+TC69Um4JZccHHNXV7ZCYdnDqZLdh4TcDNaEFwtIKLbsrtE6
 EykmKawV/SqiVDWfF9tw+Sc6IQfVcJfet4SaRM4S9IR9E1SG02KbXfv+Z3Aq9RBw
 qZ1soVH9OtbDws/6Ag91La2OtJlufpOJb4Jas/EI65MdgfAQuCuWtIwddyRl2Ai8
 9KAv9oVvw/lGpSKvXVLuUpkYFVFKom2KWyE4zfwzpx3Le2m1Byye1SW5mqQwwjcw
 ==
X-ME-Sender: <xms:VaTtYDp77Kv5XCKlmXvdewekvb8c_05_IC8zOj1YFnL_eRlNgCLfYA>
 <xme:VaTtYNqv1Nd5KIMrw5ZOfccyY0ZHCxiudiCbUEeNmvmyIZa_pYjLyEfWFFEZW6jMG
 KccZIaXG6HfXPXUtvQ>
X-ME-Received: <xmr:VaTtYAMU5RuC-mFCh6GbkT9qtWg8UgjiEv7WP9pEaGBR5XRIXopP4ok1LUIEkiPdWZXLe4MjGwD7FNGGHvmT8_LFZs4cQcoMTLnSEpHxKJMbC0FRSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:VaTtYG6jKwJ6x-hC4b_JlaXw8AOCDl94aZa4rTIBzLz0ksaZqy34lA>
 <xmx:VaTtYC4uFWviTK5uOE1dEgQuB0v0nr1hOpUcmn8XDv0fs_G0cqm7gw>
 <xmx:VaTtYOiZ0JbauxvTWWm3RgxJsHBwMjPKrdhwtFQH3cy1VKl5W_IMOg>
 <xmx:VqTtYEQZy6jnqBdlkKiw-BMjY-OxG9cCJx-82O4JJmpC4yOA9LCbNw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 10:33:56 -0400 (EDT)
Date: Tue, 13 Jul 2021 16:33:53 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/nvme: fix mmio read
Message-ID: <YO2kUQ/BCKxVqsG7@apples.localdomain>
References: <20210713054359.831878-1-its@irrelevant.dk>
 <CAFEAcA8Qo7xfjAHNbZmDiVUkhnL2WRrEWp7U-urxOTBnao8Oyg@mail.gmail.com>
 <YO1ori+GqpbhxARg@apples.localdomain>
 <CAFEAcA-9V9RtOq+QCn-d+HMrxsKxRgpjkOPV0Ta4W5sh6WWo7w@mail.gmail.com>
 <YO1sIGG9CS5lnUj7@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4biwgmrfGFnQxD2H"
Content-Disposition: inline
In-Reply-To: <YO1sIGG9CS5lnUj7@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4biwgmrfGFnQxD2H
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 13 12:34, Klaus Jensen wrote:
> On Jul 13 11:31, Peter Maydell wrote:
> > On Tue, 13 Jul 2021 at 11:19, Klaus Jensen <its@irrelevant.dk> wrote:
> > >
> > > On Jul 13 11:07, Peter Maydell wrote:
> > > > Looking at the surrounding code, I notice that we guard this "read =
size bytes
> > > > from &n->bar + addr" with
> > > >     if (addr < sizeof(n->bar)) {
> > > >
> > > > but that doesn't account for 'size', so if the guest asks to read
> > > > 4 bytes starting at offset sizeof(n->bar)-1 then we'll still read
> > > > 3 bytes beyond the end of the buffer...
> > >
> > > The buffer is at least sizeof(n->bar) + 8 bytes (there are two doorbe=
ll
> > > registers following the controller registers). It is wrong for the ho=
st
> > > to read those, but as per the spec it is undefined behavior.
> >=20
> > I don't know about the doorbell registers, but with this code
> > (or the old memcpy()) you'll access whatever the next thing after
> > "NvmeBar bar" in the NvmeCtrl struct is, which looks like it's the
> > first part of 'struct NvmeParams".
> >=20
>=20
> Sorry, you are of course right. I remembered how the bar was allocated
> incorrectly.

I fixed this properly by holding all bar values in little endian as per
the spec.

I'll clean it up and send it tonight.

--4biwgmrfGFnQxD2H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDtpFAACgkQTeGvMW1P
DelduAgAuGSxSJ6eutjDQv3UbaevU1YgH6ZW8ZUTd4QKf89rUer5Ra9FfOyQJHG1
wgGk0L21PPSsXnOporCB69cgnXDFzAlm34cYpk0S0oIj3SCPuO2FsRSHRmRd/oIL
FLvg566Ew7NdEvPBqzYdDGu+HL3H1bxx3Bf0/c1TfBRCYg+EvsQAYpOkrym6XQhO
SSiUuNVbQGqs7ztlEQUWEmVlrKyVOyhaWa+rUR2Y0S3kv2XMfwQLH/m9O3lLMhQ0
lKXDUAaf3Dt3EstzQwFQr22JARqtpO/Qeq3p5QyRy6ZSyj5NNeQwlR5ykqm9ENFI
ROMZKYzR+sttbKaeZemx0YmLKXBuTA==
=pMlu
-----END PGP SIGNATURE-----

--4biwgmrfGFnQxD2H--

