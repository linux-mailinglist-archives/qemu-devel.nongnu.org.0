Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435E839D4E0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:22:21 +0200 (CEST)
Received: from localhost ([::1]:37572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8eS-0003ob-5j
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lq8Zr-0002UT-N2; Mon, 07 Jun 2021 02:17:36 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lq8Zo-0000E5-6E; Mon, 07 Jun 2021 02:17:35 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 76A2A5C0105;
 Mon,  7 Jun 2021 02:17:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 07 Jun 2021 02:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=V2ROap6G/1gEmb93eTT49NYbFHi
 Uj5/JSijMqUyKG0Y=; b=eQmfXz/z2F00Wv9bPuTrrYWGEDUvXD5hpVwYcUlk1ps
 GtjU55ut1jNjEpbkoh2BM6+YOBRl32D/oCMu37C0pfU/PynKy9ZR8OyJn2j1K8UA
 KjinV91DslowjSJtChIT7dnz1WUJlBnJF79Ls+VyZ4igGAQ8xkBDcArAid+PvrEp
 j1m4o+eue6a+E5Q1MDw5Vm6WU9yeJv5LALK72CnDjKb3azav88fmGBq+brUxwlUW
 nGY3GNc/Z+tG5CoPmXjEu8A1RjadmzUsLoY6OOMfRz2YlGFOb+PnfdASFQG7i4zn
 p1q2UHKltuuOO3OD2pPBgSeif0JnZuSLOMRCb+IcJoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=V2ROap
 6G/1gEmb93eTT49NYbFHiUj5/JSijMqUyKG0Y=; b=tXolgj51JElnFw/5CeL1I1
 GXwfVzIkRZCFsnca6fdoa/HKF+d9YsNlOJ6a+ACNac3rtEpUsdDCXEufCnv1TWCL
 OeWDLWVVi+MoXkqfWKPxK9z07nGFBOOYDk4LfA9dVd/fhFRH4GLKwip1Y90/iXpP
 pJgzAN+EkMnrtUNVpEZufvU/eTVE1B3xQlLyKbdA38iKFzOZEgoQYWhFXdQF4DuK
 yC4ndlYZygQa/rB8igxHPEXmGILEs0bZIdmUf9+TtzSVL53OmnXNFT+28upfx0Co
 rh8KwbWGvna8EZzCWFD9mSalWFOdDC70Z4oB44MzqydLcbQewnS5s76UG5XnNGOQ
 ==
X-ME-Sender: <xms:97m9YEWVSOVXRkCiVUUC1JZfb5vM9mx6AyME5eoHqFTNYS2Y3fnkRg>
 <xme:97m9YImolY-SbNCDnvMzj8KidtPtmf3cLRtsJEVxwhcND1isGSVoFrOCbDnU5_wT6
 v1LyMY092idPB1rANY>
X-ME-Received: <xmr:97m9YIYw0LuUbVkZaaYbZRpVyY1EoqSNje3zmjzbHbv9D-wbILEsaevHXm5OHhK-zBUrCnl4sM2UJNeQHhs0y_Tj-NtmL6LbrH8x29YiMY21FTuKSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtiedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:97m9YDV5qDciiSN0WSzRdvUBB7QlYpRztRaLb0Ht9CwkdxXXxOiDQQ>
 <xmx:97m9YOn9wP7xwrN2VY2Cpii5exNM1Zv_BH-_B8nBN7guIjdmIT1mtA>
 <xmx:97m9YIcO_n1zYBqkaAcR-MX90Jox2jNP3AGXJuV1y4ecrXgGA6EFYw>
 <xmx:-bm9YI5GpMSCW8zIMbfq1nEl-6Jqpug8fm8xFSk1Jt0xHdA37OvZkA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 02:17:25 -0400 (EDT)
Date: Mon, 7 Jun 2021 08:17:24 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
Message-ID: <YL259FilxX0aqFYb@apples.localdomain>
References: <20210604065237.873228-1-its@irrelevant.dk>
 <6addc825-917e-e3b3-f2b3-af311beb6b00@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1cCdtjzY52UAbVM4"
Content-Disposition: inline
In-Reply-To: <6addc825-917e-e3b3-f2b3-af311beb6b00@virtuozzo.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--1cCdtjzY52UAbVM4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

Thanks for taking the time to look through this!

I'll try to comment on all your observations below.

On Jun  7 08:14, Vladimir Sementsov-Ogievskiy wrote:
>04.06.2021 09:52, Klaus Jensen wrote:
>>From: Klaus Jensen <k.jensen@samsung.com>
>>
>>This series reimplements flush, dsm, copy, zone reset and format nvm to
>>allow cancellation. I posted an RFC back in March ("hw/block/nvme:
>>convert ad-hoc aio tracking to aiocb") and I've applied some feedback
>>from Stefan and reimplemented the remaining commands.
>>
>>The basic idea is to define custom AIOCBs for these commands. The custom
>>AIOCB takes care of issuing all the "nested" AIOs one by one instead of
>>blindly sending them off simultaneously without tracking the returned
>>aiocbs.
>
>I'm not familiar with nvme. But intuitively, isn't it less efficient to=20
>send mutltiple commands one-by-one? Overall, wouldn't it be slower?

No, you are right, it is of course slower overall.

>In block layer we mostly do opposite transition: instead of doing IO=20
>operations one-by-one, run them simultaneously to make a non-empty=20
>queue on a device.. Even on one device. This way overall performance is=20
>increased.
>

Of these commands, Copy is the only one that I would consider optimizing=20
like this. But the most obvious use of the Copy command is host-driven=20
garbage collection in the context of zoned namespaces. And I would not=20
consider that operation to be performance critical in terms of latency.=20
All regular I/O commands are "one aiocb" and doesnt need any of this.=20
And we already "parallelize" this heavily.

>If you need to store nested AIOCBs, you may store them in a list for=20
>example, and cancel in a loop, keeping simultaneous start for all=20
>flushes.. If you send two flushes on two different disks, what's the=20
>reason to wait for first flush finish before issuing the second?
>

Keeping a list of returned aiocbs was my initial approach actually. But=20
when I looked at hw/ide I got the impression that the AIOCB approach was=20
the right one. My first approach involved adding an aiocblist to the=20
core NvmeRequest structure, but I ended up killing that approach because=20
I didnt want to deal with it on the normal I/O path.

But you are absolutely correct that waiting for the first flush to=20
finish is suboptimal.

>>
>>I've kept the RFC since I'm still new to using the block layer like
>>this. I was hoping that Stefan could find some time to look over this -
>>this is a huge series, so I don't expect non-nvme folks to spend a large
>>amount of time on it, but I would really like feedback on my approach in
>>the reimplementation of flush and format.
>
>If I understand your code correctly, you do stat next io operation from=20
>call-back of a previous. It works, and it is similar to haw mirror=20
>block-job was operating some time ago (still it maintained several=20
>in-flight requests simultaneously, but I'm about using _aio_=20
>functions). Still, now mirror doesn't use _aio_ functions like this.
>
>Better approach to call several io functions of block layer one-by-one=20
>is creating a coroutine. You may just add a coroutine function, that=20
>does all your linear logic as you want, without any callbacks like:
>
>nvme_co_flush()
>{
>   for (...) {
>      blk_co_flush();
>   }
>}
>
>(and you'll need qemu_coroutine_create() and qemu_coroutine_enter() to=20
>start a coroutine).
>

So, this is definitely a tempting way to implement this. I must admit=20
that I did not consider it like this because I thought this was at the=20
wrong level of abstraction (looked to me like this was something that=20
belonged in block/, not hw/). Again, I referred to the Trim=20
implementation in hw/ide as the source of inspiration on the sequential=20
AIOCB approach.

>Still, I'm not sure that moving from simultaneous issuing several IO=20
>commands to sequential is good idea..
>And this way you of course can't use blk_aio_canel.. This leads to my last=
 doubt:
>
>One more thing I don't understand after fast look at the series: how=20
>cancelation works? It seems to me, that you just call cancel on nested=20
>AIOCBs, produced by blk_<io_functions>, but no one of them implement=20
>cancel.. I see only four implementations of .cancel_async callback in=20
>the whole Qemu code: in iscsi, in ide/core.c, in dma-helpers.c and in=20
>thread-pool.c.. Seems no one is related to blk_aio_flush() and other=20
>blk_* functions you call in the series. Or, what I miss?
>

Right now, cancellation is only initiated by the device when a=20
submission queue is deleted. This causes blk_aio_cancel() to be called=20
on each BlockAIOCB (NvmeRequest.aiocb) for outstanding requests. In most=20
cases this BlockAIOCB is a DMAAIOCB from softmmu/dma-helpers.c, which=20
implements .cancel_async. Prior to this patchset, Flush, DSM, Copy and=20
so on, did not have any BlockAIOCB to cancel since we did not keep=20
references to the ongoing AIOs.

The blk_aio_cancel() call is synchronous, but it does call=20
bdrv_aio_cancel_async() which calls the .cancel_async callback if=20
implemented. This means that we can now cancel ongoing DSM or Copy=20
commands while they are processing their individual LBA ranges. So while=20
blk_aio_cancel() subsequently waits for the AIO to complete this may=20
cause them to complete earlier than if they had run to full completion=20
(i.e. if they did not implement .cancel_async).

There are two things I'd like to do subsequent to this patch series:

   1. Fix the Abort command to actually do something. Currently the=20
   command is a no-op (which is allowed by the spec), but I'd like it to=20
   actually cancel the command that the host specified.

   2. Make submission queue deletion asynchronous.

The infrastructure provided by this refactor should allow this if I am=20
not mistaken.

Overall, I think this "sequentialization" makes it easier to reason=20
about cancellation, but that might just be me ;)

>
>>Those commands are special in
>>that may issue AIOs to multiple namespaces and thus, to multiple block
>>backends. Since this device does not support iothreads, I've opted for
>>simply always returning the main loop aio context, but I wonder if this
>>is acceptable or not. It might be the case that this should contain an
>>assert of some kind, in case someone starts adding iothread support.
>>
>>Klaus Jensen (11):
>>   hw/nvme: reimplement flush to allow cancellation
>>   hw/nvme: add nvme_block_status_all helper
>>   hw/nvme: reimplement dsm to allow cancellation
>>   hw/nvme: save reftag when generating pi
>>   hw/nvme: remove assert from nvme_get_zone_by_slba
>>   hw/nvme: use prinfo directly in nvme_check_prinfo and nvme_dif_check
>>   hw/nvme: add dw0/1 to the req completion trace event
>>   hw/nvme: reimplement the copy command to allow aio cancellation
>>   hw/nvme: reimplement zone reset to allow cancellation
>>   hw/nvme: reimplement format nvm to allow cancellation
>>   Partially revert "hw/block/nvme: drain namespaces on sq deletion"
>>
>>  hw/nvme/nvme.h       |   10 +-
>>  include/block/nvme.h |    8 +
>>  hw/nvme/ctrl.c       | 1861 ++++++++++++++++++++++++------------------
>>  hw/nvme/dif.c        |   64 +-
>>  hw/nvme/trace-events |   21 +-
>>  5 files changed, 1102 insertions(+), 862 deletions(-)
>>
>
>

--1cCdtjzY52UAbVM4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC9ue8ACgkQTeGvMW1P
DemEOwf/SQ8YXyINOtlwrtQ4t+w/3SbuSl/qPWZTjCMcYUSZ492c8LcyN4WX8kVT
2ax036483ydWMtTC/yoMUGbXs1trnJn7brXZgTmBGjRvA3yEOkA485P0otesdcHm
pXEWtBTIPTsgD2bngOK1ENCVjPItx08LaNufdIgga68zWOZ2OktZsIABOSDSQ5Fx
ktjWBQmm9qmvL+j+jt9v4PdBjTupx9I3r4zg2p9AgExIDLDU84VxkpVBkGBy25L2
dOp/gZ189NYLhNpztDJnNPNuRRcopqJ+b7sHvdt1N2z5rSuHI+2SdpGfOEoPwRLW
yPbQsXD4B+cGJVt4fu62fLlb5aqP0g==
=N7VA
-----END PGP SIGNATURE-----

--1cCdtjzY52UAbVM4--

