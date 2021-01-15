Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201CD2F7E63
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:39:33 +0100 (CET)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QGC-0003SD-0N
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0Pbx-0006xn-GG; Fri, 15 Jan 2021 08:57:57 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:54845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0Pbt-0001QM-PO; Fri, 15 Jan 2021 08:57:57 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ED8B55C0194;
 Fri, 15 Jan 2021 08:57:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 15 Jan 2021 08:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=QvZ/qkcCxE2s+3AgCgv7lJ9ucZ8
 V3L08g95jdKotvVQ=; b=tKVIlmlEAUqFhPIs+eHx15q1YTbfChL9hDZcS3vh8ve
 hJFR0fOgEapogJ3a0uMQOQM9BfrX8Mwt9Sf5RpbgVoONQuwYU8ViZZDCcVjBP2i9
 brryqNmRrKJICcqgfx61AJtjzqsUacLZrPfSNsYan1Rlui11cuag4fdjCrEnh9mh
 NeZI830xX7qgmjdiK/DEyskRGq4Wx9NRe7PUTpTp4MOKyVbo+u/n40OGXd+twIZn
 2HUnwo6Uu/QqekzxQyCm4i1Oto7/h0m5x/rwvCUO3mxMepuvYpjWxxBbzCmIGlai
 C9GHLnz1Ci2MOJeXm91zsOBZhB+XvjymoubykQdOP5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QvZ/qk
 cCxE2s+3AgCgv7lJ9ucZ8V3L08g95jdKotvVQ=; b=oSpJiV1zvjwf0EA18O794y
 3/7lHowHp7W3JKjmBSnlkdwkwusvCVfL8DsT1oifAhu663mcn1yz07JWW8LADu0U
 1+UKNChLnna0olo1k6ne7mAHAOo3EvKt1p/DzmPBL9WYuHylB8lyA5BBkMlGvQSx
 pzEZgTysXkOZqbgcVPUUSeA+Dv0GkV4LAyJWqav5n6Xc3NBjbJkQDUzvib6f5ibp
 4JlbayyEjCReMRj7kShKhkUlY9KwTd7i3uwNjqHw16TBOBhDIckeH8qC51aGXwD8
 AonJIbETKJU7/e8ugc+Uh00uftEgXJRWZE5Ps6QUcLN2Tat+fIwBSE4epHSwBZ5A
 ==
X-ME-Sender: <xms:W58BYMxQh2LoCwfrbuXjcaAVzqEn_4P5cykUA086CmlUt-Lb4C35JA>
 <xme:W58BYATLOjJaE0IxQ1DKpujkcF_aKR4KPlWbNAiL41lRG8GQ9vL5nSUc8Bi7ysJ6o
 HmpYfR2BPXlEqoDo4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepheeghefgffegkeevfeettedukeehjefftdevvddugfffleelfedvffdtkefggfdu
 necuffhomhgrihhnpedvtdduledqtdekrdhorhhgnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:W58BYOVgfszNi0KQG7QrrF3rd3LPHAT6k7u8rtIUHMhHUc59VwVOYQ>
 <xmx:W58BYKhr3MrPQxXJf4ylZwm8cQxpyoZwjBa0qB95GvtLV58yAaBcyg>
 <xmx:W58BYOCKtpNHpeY8refsq11du569qGitTkGAzU58N1bkidlOnU46mw>
 <xmx:XJ8BYB8LBfXT2buXZ1uz-8dRnwKZq6rFUwWWYqXK4Ez2KbyoQgHuvg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 012E324005C;
 Fri, 15 Jan 2021 08:57:46 -0500 (EST)
Date: Fri, 15 Jan 2021 14:57:45 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH 0/5] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YAGfWe+OMxiBggh3@apples.localdomain>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4WI1UgvgyTyuIUaB"
Content-Disposition: inline
In-Reply-To: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4WI1UgvgyTyuIUaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 15 21:05, Minwoo Im wrote:
> Hello,
>=20
> This series added support for multi-path I/O with multi-controllers and
> namespace sharing.  By supporting these features, we can test Linux
> kernel mpath(multi-path) code with this NVMe device.
>=20
> Patches from the first to third added multi-controller support in a NVM
> subsystem by adding a mpath.ctrl parameter to nvme device.  The rest of
> the patches added namespace sharing support in a NVM subsystem with two
> or more controllers by adding mpath.ns parameter to nvme-ns device.
>=20
> Multi-path enabled in kernel with this series for two controllers with a
> namespace:
>=20
>   root@vm:~/work# nvme list -v
>   NVM Express Subsystems
>=20
>   Subsystem        Subsystem-NQN                                         =
                                           Controllers
>   ---------------- ------------------------------------------------------=
------------------------------------------ ----------------
>   nvme-subsys0     nqn.2019-08.org.qemu:serial                           =
                                           nvme0, nvme1
>=20
>   NVM Express Controllers
>=20
>   Device   SN                   MN                                       =
FR       TxPort Address        Subsystem    Namespaces
>   -------- -------------------- ---------------------------------------- =
-------- ------ -------------- ------------ ----------------
>   nvme0    serial               QEMU NVMe Ctrl                           =
1.0      pcie   0000:01:00.0   nvme-subsys0 nvme0n1
>   nvme1    serial               QEMU NVMe Ctrl                           =
1.0      pcie   0000:02:00.0   nvme-subsys0 nvme0n1
>=20
>   NVM Express Namespaces
>=20
>   Device       NSID     Usage                      Format           Contr=
ollers
>   ------------ -------- -------------------------- ---------------- -----=
-----------
>   nvme0n1      1        268.44  MB / 268.44  MB    512   B +  0 B   nvme0=
, nvme1
>=20
> The reason why I put 'RFC' tag to this series is mostly about the last
> patch "hw/block/nvme: add namespace sharing param for mpath".  It seems
> like QEMU block backing device does not support to be shared among two
> or more -device(s).  It means that we just can't give same drive=3D
> property to multiple nvme-ns devices.  This patch has just let -device
> maps to -drive one-to-one(1:1), but if namespae sharing is detected and
> setup by the host kernel, then a single block device will be selected
> for the NVM subsystem.  I'm not sure this is a good start for this
> feature, so I put the RFC tag here.
>=20
> Please kindly review!
>=20

Hi Minwoo,

First - super awesome that we get this discussion going. I've been
hacking around this a couple of times, but I've never been happy with
the approach.

As you already mentioned, the problem I see with this approach is that
we have separate namespaces attached to separate controllers. So we are
faking it to the max and if I/O starts going through the other
controller we end up on a namespace that is unrelated (different data).
Havoc ensues.

My approach looks a lot like yours, but I hacked around this by adding
extra 'ctrl-0', 'ctrl-1', ..., link-parameters to the namespace device,
replacing the bus. This works well because the namespace then just
registers with multiple controllers. But adding more parameters like
that just isnt nice, so I've been trying to figure out how to allow a
parameter to be specified multiple times, so we could just do more
'ctrl'-parameters.

Alas, since I started thinking about namespace sharing I have been
regretting that I didn't reverse the bus-mechanic for namespace
attachment. It would align better with the theory of operation if it was
the controllers that attached to namespaces, and not the other way
around. So what I would actually really prefer, is that we had multiple
'ns' link parameters on the controller device.

   -device nvme-ns,id=3Da,nsid=3D1,...
   -device nvme-ns,id=3Db,nsid=3D2,...
   -device nvme-ns,id=3Dc,nsid=3D3,...
   -device nvme,cntlid=3D0,serial=3Dfoo,ns=3Da,ns=3Db
   -device nvme,cntlid=3D1,serial=3Dfoo,ns=3Da,ns=3Dc

But I havn't been able to figure out how to kick QOM into doing this.
And I'm definitely not sure this is the way to go. Should we instead
introduce a 'nvme-subsys' device and walk a bus?

I'd really appreciate some input on how we should model this if anyone
has any thoughts. And I think we should consider stuff like detached
namespaces as well. Support for Namespace Management. The whole shabang.

--4WI1UgvgyTyuIUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmABn1cACgkQTeGvMW1P
Del7EAgAn//pq4mYO+nMdzT8afC7nYxuJM1pmKERSxphjv+Pv96+ZHFfnD7xONEA
j7vNTvzhcXcFVUONruDyd90fddLNm5BOmO5+0SlChMbJT9vy+9i11K5UxGyaTNcY
eBZX+jaoZtqpGBSn8eK4L2CCxFd2M/khv18c2H3fRvP1oNtMTWS/SGwLYQwzBBOC
XcGmxnBQIOxS+gM55o8jqeUyJ8NCoLp04tFKDP87h+Z5DAR5qf4JJDyW2FABEp4C
ZJFHPfAUi7rx+1Hrx5qaSj9e6p2C38kQ6qY2scjbVS+3gdbEwkYfDjktWbF50F1E
SmjNxS1gGpKDc2xv9dLV+QCCBmBbjg==
=Rx+d
-----END PGP SIGNATURE-----

--4WI1UgvgyTyuIUaB--

