Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE394BD9A4
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:21:35 +0100 (CET)
Received: from localhost ([::1]:37160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7h8-000878-D9
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1nM7N8-0003kH-6C
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:00:55 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:56689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1nM7N5-0000n0-Fi
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:00:53 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 170C32B001F2;
 Mon, 21 Feb 2022 07:00:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 21 Feb 2022 07:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=m9RDTgxTKqYt+6jxr8Sk+d3eU4/aav
 gnbsXbMAxCHtM=; b=P0cOI47h83ElvtCTj6OEfQb5iedIdDGuGlIv2kbwG4Sq5X
 bP3rwczB+AKxO1qaZjF21lajTD0Ts8dGzlllhwqWOolO0awXHN3RAWWKXWrvayPl
 gmYf5jZzQ2SbO7DQ0/XbOk9348NAjyHa3u6rBTAFSeiwh/yMm/0+GTDw77OaXx15
 vgP13SwS9/w5hlJGYb1yWWxIxzTFUIYxwv7b0i3mUm+FUh2hqp0N1N/EF3rgiJ3+
 qz8mmTJghmRBDq7qTJcqPdXynrdT74PmOrp6cNDuOd/mDxJQ0XCVcZqu0volSz3i
 YgPonsgolwdPJy8+2K2j+1ma3qSvhsV58HljpuRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=m9RDTgxTKqYt+6jxr
 8Sk+d3eU4/aavgnbsXbMAxCHtM=; b=GxIUyMtLpziJ4qPTXdmktdk2a6k2OBxkf
 Mzb/RwQ6Mr73HO1hu0PChtyVSgA4SPnL/Fl+1umA0U8nEPZA/eqToiRZnomBMe93
 lxHOLiH53ZCLz+38wvjPPFLGDuAvHd6LCYR3WpvZeKuuclRtslewF7vMJtPFArKl
 LtuXq2d/KoV5BcZ0pTMg9kSP8SqrrSM8w6/zHmf2IqL2HcooW4Owky90YB0Mp5vi
 C8VHf3+EgLmFDv+7lK66ZtZWPcvgtehIWJlQng6/EFeZp7s00pSh6ai+dZA6KZKo
 mIhO1Chpgy99KdVGx5ONEpC6mIZopYAcWBVAf9hmPZEurre6MTYVA==
X-ME-Sender: <xms:7X4TYhf17PWPlibClTcIuczcYz4LTt88WyIJ49Ahp1LC_wlBktBQyA>
 <xme:7X4TYvMgQcVUp3fgrsutLQeaXujvJJ1SACQ1CsjdaJqm4eBjtx2qpVQVSUatbETDH
 hrGrFj53BH4WIU0duY>
X-ME-Received: <xmr:7X4TYqixuZESF1idD9hkIAc8TeAKNrFIw2dinsr5Ka7PBzFarTSGstEPVMSoPOJ4CKxUQSL75vB-n9vzFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepkedvvdffheejuddtjeefhffggeejudefueevleeiteeihfefvefgjeelheffheek
 necuffhomhgrihhnpeifihhthhhgohhoghhlvgdrtghomhdpohhuthhrvggrtghhhidroh
 hrghdphihouhhtuhgsvgdrtghomhdpqhgvmhhurdhorhhgpdhkvghrnhgvlhdrohhrghen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:7X4TYq8AcZ2nDnqEyOL-n9DmYhc-gy54ShT5KFzuR5dzHr2F5aaCpA>
 <xmx:7X4TYttIUi8IkpSOxAMpux3dMe0945FheR7U9AmWixOF-sNggLXOjQ>
 <xmx:7X4TYpFjSKiUfReephTeQS-xloZueIHPxmVvzj1HgxvcZI75NUX6bA>
 <xmx:7n4TYoltzT8nKAXp55v2H789qGq6w7rLU_itB7xa-LBXZe_EFzWRpBUjFbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 07:00:40 -0500 (EST)
Date: Mon, 21 Feb 2022 13:00:39 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Message-ID: <YhN+5wz3MXVm3vXU@apples>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <YhMtxWcFMjdQTioe@apples>
 <CAJSP0QVNRYTOGDsjCJJLOT=7yo1EB6D9LBwgQ4-CE539HdgHNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xRNUQAcNEbsEnVq1"
Content-Disposition: inline
In-Reply-To: <CAJSP0QVNRYTOGDsjCJJLOT=7yo1EB6D9LBwgQ4-CE539HdgHNQ@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, kvm <kvm@vger.kernel.org>,
 Sergio Lopez <slp@redhat.com>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 John Snow <jsnow@redhat.com>, Alex Agache <aagch@amazon.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Florescu, Andreea" <fandree@amazon.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xRNUQAcNEbsEnVq1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 21 09:51, Stefan Hajnoczi wrote:
> On Mon, 21 Feb 2022 at 06:14, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > On Jan 28 15:47, Stefan Hajnoczi wrote:
> > > Dear QEMU, KVM, and rust-vmm communities,
> > > QEMU will apply for Google Summer of Code 2022
> > > (https://summerofcode.withgoogle.com/) and has been accepted into
> > > Outreachy May-August 2022 (https://www.outreachy.org/). You can now
> > > submit internship project ideas for QEMU, KVM, and rust-vmm!
> > >
> > > If you have experience contributing to QEMU, KVM, or rust-vmm you can
> > > be a mentor. It's a great way to give back and you get to work with
> > > people who are just starting out in open source.
> > >
> > > Please reply to this email by February 21st with your project ideas.
> > >
> > > Good project ideas are suitable for remote work by a competent
> > > programmer who is not yet familiar with the codebase. In
> > > addition, they are:
> > > - Well-defined - the scope is clear
> > > - Self-contained - there are few dependencies
> > > - Uncontroversial - they are acceptable to the community
> > > - Incremental - they produce deliverables along the way
> > >
> > > Feel free to post ideas even if you are unable to mentor the project.
> > > It doesn't hurt to share the idea!
> > >
> > > I will review project ideas and keep you up-to-date on QEMU's
> > > acceptance into GSoC.
> > >
> > > Internship program details:
> > > - Paid, remote work open source internships
> > > - GSoC projects are 175 or 350 hours, Outreachy projects are 30
> > > hrs/week for 12 weeks
> > > - Mentored by volunteers from QEMU, KVM, and rust-vmm
> > > - Mentors typically spend at least 5 hours per week during the coding=
 period
> > >
> > > Changes since last year: GSoC now has 175 or 350 hour project sizes
> > > instead of 12 week full-time projects. GSoC will accept applicants who
> > > are not students, before it was limited to students.
> > >
> > > For more background on QEMU internships, check out this video:
> > > https://www.youtube.com/watch?v=3DxNVCX7YMUL8
> > >
> > > Please let me know if you have any questions!
> > >
> > > Stefan
> > >
> >
> > Hi,
> >
> > I'd like to revive the "NVMe Performance" proposal from Paolo and Stefan
> > from two years ago.
> >
> >   https://wiki.qemu.org/Internships/ProjectIdeas/NVMePerformance
> >
> > I'd like to mentor, but since this is "iothread-heavy", I'd like to be
> > able to draw a bit on Stefan, Paolo if possible.
>=20
> Hi Klaus,
> I can give input but I probably will not have enough time to
> participate as a full co-mentor or review every line of every patch.
>=20

Of course Stefan, I understand - I did not expect you to co-mentor :)

> If you want to go ahead with the project, please let me know and I'll pos=
t it.
>=20

Yes, I'll go ahead as mentor for this.

@Keith, if you want to join in, let us know :)

> One thing I noticed about the project idea is that KVM ioeventfd
> doesn't have the right semantics to emulate the traditional Submission
> Queue Tail Doorbell register. The issue is that ioeventfd does not
> capture the value written by the driver to the MMIO register. eventfd
> is a simple counter so QEMU just sees that the guest has written but
> doesn't know which value. Although ioeventfd has modes for matching
> specific values, I don't think that can be used for NVMe Submission
> Queues because there are too many possible register values and each
> one requires a separate file descriptor. It might request 100s of
> ioeventfds per sq, which won't scale.
>=20
> The good news is that when the Shadow Doorbell Buffer is implemented
> and enabled by the driver, then I think it becomes possible to use
> ioeventfd for the Submission Queue Tail Doorbell.
>=20

Yes, I agree.

> I wanted to mention this so applicants/interns don't go down a dead
> end trying to figure out how to use ioeventfd for the traditional
> Submission Queue Tail Doorbell register.
>=20

Yeah, thats what the Shadow Doorbell mechanic is for.

Suggested updated summary:

QEMU's NVMe emulation uses the traditional trap-and-emulation method to
emulate I/Os, thus the performance suffers due to frequent VM-exits.
Version 1.3 of the NVMe specification defines a new feature to update
doorbell registers using a Shadow Doorbell Buffer. This can be utilized
to enhance performance of emulated controllers by reducing the number of
Submission Queue Tail Doorbell writes.

Further more, it is possible to run emulation in a dedicated thread
called an IOThread. Emulating NVMe in a separate thread allows the vcpu
thread to continue execution and results in better performance.

Finally, it is possible for the emulation code to watch for changes to
the queue memory instead of waiting for doorbell writes. This technique
is called polling and reduces notification latency at the expense of an
another thread consuming CPU to detect queue activity.

The goal of this project is to add implement these optimizations so
QEMU's NVMe emulation performance becomes comparable to virtio-blk
performance.

Tasks include:

    Add Shadow Doorbell Buffer support to reduce doorbell writes
    Add Submission Queue polling
    Add IOThread support so emulation can run in a dedicated thread

Maybe add a link to this previous discussion as well:

https://lore.kernel.org/qemu-devel/1447825624-17011-1-git-send-email-mlin@k=
ernel.org/T/#u


Klaus

--xRNUQAcNEbsEnVq1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmITfuQACgkQTeGvMW1P
DemUogf/dtUu7PkK5dZhBVx9/mQ3eM1oaj76Aeum5ubskV1PPpSb7FvASOUs5k5K
IbjYtm6464VXOcBImKKi3D72FCbmKX/BWLW1DXz7GPJRRVLd/nqlJbxoBAFITpmK
OCANuO5nEfZ6T5Oh8cR5edvkEhknxH3LzppsXabh6e2Fv7581TsP7/SmcLc6Jzgm
G5CDQiYpRxXkslwX2TGlG4qrKGDhT8ycJjd5IiRrBp/KWMWVLUQXdTmqnMio57n9
2GWNP2EfxsEgQTJmnIYBvs6GvkF6t18RO5VZ1i4s4wb4e0uXwcMb2VRgRwuYOR1s
i5XYX2YZ18jzF7YtBYkHzNxto9LABA==
=nTiz
-----END PGP SIGNATURE-----

--xRNUQAcNEbsEnVq1--

