Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69BA35A45C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 19:04:43 +0200 (CEST)
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUuYk-0001TO-0y
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 13:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUuSP-0008PS-Hq; Fri, 09 Apr 2021 12:58:11 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUuSK-0002Ca-Rb; Fri, 09 Apr 2021 12:58:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 52BE45C0042;
 Fri,  9 Apr 2021 12:58:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 09 Apr 2021 12:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=o+DiuBzs/gy5TKTxmkurlPsRATv
 sY/m/aJ3kYTvQvtg=; b=S1PJ/b2QOL5Vr0mujCf5Ccc8sgZf7CJ+BPH1kRhCev1
 XMI9y335Nyp16rnpTN+gDr5OoNEQmkFSl/1lWsDJcpOv2N9lmRyRW8k1mmYxmUxC
 xzhc5ldz4OVNU9/uiEQmuh8bF4MkMn1yy4RlG9THGCkHS4rlkuDNwxuRuDBhk9Y4
 UubylQnXQPL/NroECQDAGHT5O1wTVgkyuoJ03osRO+tGS5J1iDkL9+4CPnUt2fKr
 oNw91XS19P2y0DTBn9fh20d2en+u74H3C/Ln/C/FRh3Cge8jNIfZZFT8fnvzBNyN
 qnH+2ex5dycLZHE2y5a2vKALpfQ79SlhaljuXnsnssA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=o+DiuB
 zs/gy5TKTxmkurlPsRATvsY/m/aJ3kYTvQvtg=; b=XEaG/LgwKnN8J72cnRLHxA
 V8FdQu3/JY75z4aM7o6fqNIFGf3oSDoZpn7jyixlQAiTaHZg94PcrWhKEhy4it4i
 36JfuhV2nqAlfVYrk+fUWBLFxFQxzfEwAxbwXclSGhOzWFQOZFunL0FmYoE48o/1
 m3ZQsA/bQXsEuHmkJ8w0Iz2KgBwbxLju23qZCKv6Ow03ppVm92JVSRRqTu9S5fqI
 4iDGfvtIlLZQmAwfItUeUbmBsHL6Mayc3HROJTqbBAakW7owxjSS4YslyRrJm+sf
 ADkZy1acGEI7awdIcn/GTKWo553h1VjV7HkN0Jxnh1SW5kKnmLgxjVKPN1yfpYiw
 ==
X-ME-Sender: <xms:mYdwYHKKJS4wklUqwxc05mNA341PsBIhamw4qxHpxwL_jOrA3s6OKg>
 <xme:mYdwYLJ6bCUEM2UU6sXCZmt8HAtMNzE9ZIQflc2i5jbkukD4FCv4shkygvUm7T47x
 NsLHBmO5Vj4kB0HZq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekuddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mYdwYPuB5NRjJye_wrRAlamZLQxT1C-WmNdJpCLWXKFBTUBDKl7eXQ>
 <xmx:mYdwYAZGWrS7p8KoH4isbbLHhRPEHDBMS7SHmJrxZR8LhOPiuMVU8w>
 <xmx:mYdwYOb4JON-8cXX2XQDchYetYoA9lBgEKJ0XuONWB-kF5SaaILLWA>
 <xmx:m4dwYDNwsinEQudRvRjOOyVF1yMU3QG0ipFGwuZ1av4YgcoAH-izhA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93E37240057;
 Fri,  9 Apr 2021 12:58:00 -0400 (EDT)
Date: Fri, 9 Apr 2021 18:57:58 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/block/nvme: slba equal to nsze is out of bounds if
 nlb is 1-based
Message-ID: <YHCHlqJ6xyIcK+Xy@apples.localdomain>
References: <CGME20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234@epcas5p3.samsung.com>
 <20210409074402.7342-1-anaidu.gollu@samsung.com>
 <20210409110518.GC2085@localhost>
 <YHBAlXnRdYTU1m1P@apples.localdomain>
 <20210409153017.GB32304@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="etSCyK52s9YtdL6I"
Content-Disposition: inline
In-Reply-To: <20210409153017.GB32304@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--etSCyK52s9YtdL6I
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 10 00:30, Keith Busch wrote:
>On Fri, Apr 09, 2021 at 01:55:01PM +0200, Klaus Jensen wrote:
>> On Apr  9 20:05, Minwoo Im wrote:
>> > On 21-04-09 13:14:02, Gollu Appalanaidu wrote:
>> > > NSZE is the total size of the namespace in logical blocks. So the max
>> > > addressable logical block is NLB minus 1. So your starting logical
>> > > block is equal to NSZE it is a out of range.
>> > >
>> > > Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>> > > ---
>> > >  hw/block/nvme.c | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> > > index 953ec64729..be9edb1158 100644
>> > > --- a/hw/block/nvme.c
>> > > +++ b/hw/block/nvme.c
>> > > @@ -2527,7 +2527,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequ=
est *req)
>> > >              uint64_t slba =3D le64_to_cpu(range[i].slba);
>> > >              uint32_t nlb =3D le32_to_cpu(range[i].nlb);
>> > >
>> > > -            if (nvme_check_bounds(ns, slba, nlb)) {
>> > > +            if (nvme_check_bounds(ns, slba, nlb) || slba =3D=3D ns-=
>id_ns.nsze) {
>> >
>> > This patch also looks like check the boundary about slba.  Should it be
>> > also checked inside of nvme_check_bounds() ?
>>
>> The catch here is that DSM is like the only command where the number of
>> logical blocks is a 1s-based value. Otherwise we always have nlb > 0, wh=
ich
>> means that nvme_check_bounds() will always "do the right thing".
>>
>> My main gripe here is that (in my mind), by definition, a "zero length
>> range" does not reference any LBAs at all. So how can it result in LBA O=
ut
>> of Range?
>
>So what's the problem? If the request is to discard 0 blocks starting
>from the last block, then that's valid. Is this patch actually fixing
>anything?
>

If SLBA =3D=3D NSZE we are out of bounds since the last addressable block i=
s=20
NSZE-1. But, I don't consider the current behavior buggy or wrong, the=20
devices correctly handles the zero length range by just not discarding=20
anything anywhere.

The spec is pretty unclear on how invalid ranges in DSM are handled. My=20
interpretation is that the advisory nature of DSM allows it to do best=20
effort, but as Gollu is suggesting here, a device could just as well=20
decide to validate the ranges and return an appropriate status code if=20
it wanted to.

--etSCyK52s9YtdL6I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBwh5MACgkQTeGvMW1P
DemXTwgAr1Je1H48rFoNJjtNoMHjz9xqyqIH57VFuRJULEcCbUDuRZTStKQlhdHt
gGf5fOlQ6e+4huWqmt2YqYDiIeAHkRfAaj7s9m7rKTRcCDE182PgQkh9nsFenlgs
vj8ETDKSDpWhxlunORa5oJegGqo/Z5a7P3r18/lyWt26G6aIITFAZ7PRqb95h7VG
QLMTLYJ15ubONNfPSBuPBtiha5spf7XghOg8Z8zQ+b0BWknn+v5Kg4JvgxT3kGYP
KwxQySqlXy4X/5aUWbevkdVs1IdVPHCFXU3l15RQ6DX/xipuEKZWiUY+HYFLZBio
CgYpsOC/jL1hkF+zyLWIIe8CKgKeyg==
=yyzb
-----END PGP SIGNATURE-----

--etSCyK52s9YtdL6I--

