Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A346839D94B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 12:08:09 +0200 (CEST)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqCAy-0006OC-J4
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 06:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqC3Z-0003WR-CK; Mon, 07 Jun 2021 06:00:30 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqC3T-0005Xt-1Z; Mon, 07 Jun 2021 06:00:29 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DE7245C0183;
 Mon,  7 Jun 2021 06:00:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Jun 2021 06:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=dVx7TWb8LHtlwwcFFKdHrpDJtR7
 KJS22MQ2o/VtjB7g=; b=F90pwqD4EurDjYkmQB16kObtowqu0ClB+pujdx953VA
 Xk4ZQ/ggMKOzYo3LS5U8whaHQuDLYNf/1/06HVVYNCsC+yXsssU/MaEZDWjrNdCW
 PrdEbmyft7sUKLs4iUlbofWHrvENkJiM943OCnyicdMuTkDmf+CMZoBx4PdMD1KR
 JQUiQxgmRoXjJUDsbLkrI6dLd6mdmeIZHOKQiUp+Si2cwrzUazbx9SBB1f5NEUyY
 Em2R2fb8t5Lap4mBS7B//ud6BhqC2+JA5GBFvqmpv8UYrT8Ie0eHwwJvt3enybTC
 ZdvYVuJ7Hn6i8Vi8cZu0JbxuMCfZGioTQLmcMkQ2m/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dVx7TW
 b8LHtlwwcFFKdHrpDJtR7KJS22MQ2o/VtjB7g=; b=JeJc3DGjPMAxIipNh5xDXB
 WzvXltaN5alT1Ctnp4v69sOBnYlRSNZRe0uLupyAeB8Q6Q1sFF5+vtWQN3HoMn7K
 R9KNBi6cS8WVPqqLvH8q9ftBMfGXCwIRSoEUMM+TVrOZ7W/unWKT1wsjBJY/mIAM
 /v+GJk8l+FAXCTzNNyV6Z3T5ae17/IY4RPGEbOj5SfQVy2gUwK1uYParwAtmnZfw
 2rxHUJlCPmvrZoxRkv+EDaRHMVuWBqkqf8JyeiBAa85E8NsK6/QbsBTmdjkBGy1k
 Mjc/kljXoXqGD6jhJ4sWH25uVZItvSoPQWrs4RFvZLELgbS5yyujk9Bn9pcmJx5Q
 ==
X-ME-Sender: <xms:M-69YCOZTAe_dr7BZErBM8uzhMHeUqKP81ToaOcEFV4VoDBhOHGj0A>
 <xme:M-69YA_CbLsxPf3YIXdw3TCAVcv80feJ7wNAr09leG-ODDQvMiF1JYOLm2RW8D_A3
 bzGAJPvoglpd6p-vlg>
X-ME-Received: <xmr:M-69YJRy3GK-igMR24zrFjpVV6SRHoYsVcxItEdA-N-Pk8OFRlNq3dq5ltcLS9Eif2i5qmcCX2DTid8JqPqbI2XalkfRS2lnEzS57mJGQ8nxzvgR8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:M-69YCstIWSS6Yc6H8uC08wWus3BccKoqoa94ZPYcwXAx-sy0Xxm7w>
 <xmx:M-69YKehnJpFM8WA8oIb4pBVPdhA8XKO9pEbAFSdraDgu_dDW-dy-Q>
 <xmx:M-69YG16x-Z4WI2dUJ7KKBl6lNej84SGp1q_mS4Fu4lq8piuHyPHsA>
 <xmx:Ne69YBwonXWlC87KZaYmpFVgmJ38NuvT2mYLLyUP8cMe1F_E0oNqGQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 06:00:18 -0400 (EDT)
Date: Mon, 7 Jun 2021 12:00:16 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
Message-ID: <YL3uMOfMBKGM9KpQ@apples.localdomain>
References: <20210604065237.873228-1-its@irrelevant.dk>
 <6addc825-917e-e3b3-f2b3-af311beb6b00@virtuozzo.com>
 <YL259FilxX0aqFYb@apples.localdomain>
 <a9104cf3-efed-524b-803f-b49d93fd062f@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jNkIszTEyoLDpk23"
Content-Disposition: inline
In-Reply-To: <a9104cf3-efed-524b-803f-b49d93fd062f@virtuozzo.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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


--jNkIszTEyoLDpk23
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  7 10:11, Vladimir Sementsov-Ogievskiy wrote:
>07.06.2021 09:17, Klaus Jensen wrote:
>>On Jun=C2=A0 7 08:14, Vladimir Sementsov-Ogievskiy wrote:
>>>04.06.2021 09:52, Klaus Jensen wrote:
>>>>
>>>>I've kept the RFC since I'm still new to using the block layer like
>>>>this. I was hoping that Stefan could find some time to look over this -
>>>>this is a huge series, so I don't expect non-nvme folks to spend a large
>>>>amount of time on it, but I would really like feedback on my approach in
>>>>the reimplementation of flush and format.
>>>
>>>If I understand your code correctly, you do stat next io operation=20
>>>from call-back of a previous. It works, and it is similar to haw=20
>>>mirror block-job was operating some time ago (still it maintained=20
>>>several in-flight requests simultaneously, but I'm about using _aio_=20
>>>functions). Still, now mirror doesn't use _aio_ functions like this.
>>>
>>>Better approach to call several io functions of block layer=20
>>>one-by-one is creating a coroutine. You may just add a coroutine=20
>>>function, that does all your linear logic as you want, without any=20
>>>callbacks like:
>>>
>>>nvme_co_flush()
>>>{
>>>=C2=A0 for (...) {
>>>=C2=A0=C2=A0=C2=A0=C2=A0 blk_co_flush();
>>>=C2=A0 }
>>>}
>>>
>>>(and you'll need qemu_coroutine_create() and qemu_coroutine_enter()=20
>>>to start a coroutine).
>>>
>>
>>So, this is definitely a tempting way to implement this. I must admit=20
>>that I did not consider it like this because I thought this was at the=20
>>wrong level of abstraction (looked to me like this was something that=20
>>belonged in block/, not hw/). Again, I referred to the Trim=20
>>implementation in hw/ide as the source of inspiration on the=20
>>sequential AIOCB approach.
>
>No, I think it's OK from abstraction point of view. Everybody is=20
>welcome to use coroutines if it is appropriate and especially for doing=20
>sequential IOs :)
>Actually, it's just more efficient: the way I propose, you create one=20
>coroutine, which does all your logic as you want, when blk_aio_=20
>functions actually create a coroutine under the hood each time (I don't=20
>think that it noticeably affects performance, but logic becomes more=20
>straightforward)
>
>The only problem is that for this way we don't have cancellation API,=20
>so you can't use it for cancellation anyway :(
>

Yeah, I'm not really feeling up for adding that :P

>>
>>>Still, I'm not sure that moving from simultaneous issuing several IO=20
>>>commands to sequential is good idea..
>>>And this way you of course can't use blk_aio_canel.. This leads to my=20
>>>last doubt:
>>>
>>>One more thing I don't understand after fast look at the series: how=20
>>>cancelation works? It seems to me, that you just call cancel on=20
>>>nested AIOCBs, produced by blk_<io_functions>, but no one of them=20
>>>implement cancel.. I see only four implementations of .cancel_async=20
>>>callback in the whole Qemu code: in iscsi, in ide/core.c, in=20
>>>dma-helpers.c and in thread-pool.c.. Seems no one is related to=20
>>>blk_aio_flush() and other blk_* functions you call in the series. Or,=20
>>>what I miss?
>>>
>>
>>Right now, cancellation is only initiated by the device when a=20
>>submission queue is deleted. This causes blk_aio_cancel() to be called=20
>>on each BlockAIOCB (NvmeRequest.aiocb) for outstanding requests. In=20
>>most cases this BlockAIOCB is a DMAAIOCB from softmmu/dma-helpers.c,=20
>>which implements .cancel_async. Prior to this patchset, Flush, DSM,=20
>>Copy and so on, did not have any BlockAIOCB to cancel since we did not=20
>>keep references to the ongoing AIOs.
>
>Hmm. Looking at flush for example, I don't see how DMAAIOCB comes.
>
>You do
>
>  iocb->aiocb =3D blk_aio_flush(ns->blkconf.blk, nvme_flush_ns_cb, iocb);
>
>it calls blk_aio_prwv(), it calls blk_aio_get() with=20
>blk_aio_em_aiocb_info, that doesn't implement .cancel_async..
>

I meant that most I/O in the regular path (read/write) are using the dma=20
helpers (since they do DMA). We might use the blk_aio_p{read,write}=20
directly when we read from/write to memory on the device (the controller=20
memory buffer), but it is not the common case.

You are correct that BlkAioEmAIOCB does not implement cancel, but the=20
"wrapper" (NvmeFlushAIOCB) *does*. This means that, from the NVMe=20
controller perspective, we can cancel the flush in between=20
(un-cancellable blk_aio_flush-initiated) flushes to multiple namespaces.

>>
>>The blk_aio_cancel() call is synchronous, but it does call=20
>>bdrv_aio_cancel_async() which calls the .cancel_async callback if=20
>>implemented. This means that we can now cancel ongoing DSM or Copy=20
>>commands while they are processing their individual LBA ranges. So=20
>>while blk_aio_cancel() subsequently waits for the AIO to complete this=20
>>may cause them to complete earlier than if they had run to full=20
>>completion (i.e. if they did not implement .cancel_async).
>>
>>There are two things I'd like to do subsequent to this patch series:
>>
>> =C2=A0 1. Fix the Abort command to actually do something. Currently the=
=20
>> command is a no-op (which is allowed by the spec), but I'd like it to=20
>> actually cancel the command that the host specified.
>>
>> =C2=A0 2. Make submission queue deletion asynchronous.
>>
>>The infrastructure provided by this refactor should allow this if I am=20
>>not mistaken.
>>
>>Overall, I think this "sequentialization" makes it easier to reason=20
>>about cancellation, but that might just be me ;)
>>
>
>I just don't like sequential logic simulated on top of aio-callback=20
>async API, which in turn is simulated on top of coroutine-driven=20
>sequential API (which is made on top of real async block API=20
>(thread-based or linux-aio based, etc)) :)

Ha! Yes, we are not exactly improving on that layering here ;)

> Still I can't suggest now an alternative that supports cancellation.=20
>But I still think that cancellation doesn't work for blk_aio_flush and=20
>friends either..
>

The aiocb from blk_aio_flush is considered "un-cancellable" I guess (by=20
design from the block layer), but the NVMe command "Flush" is=20
cancellable from the perspective of the NVMe controller. Or at least,=20
that's what I am intending to do here.

--jNkIszTEyoLDpk23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC97i8ACgkQTeGvMW1P
DenSxAgAtVXV9HilcxB5mz0+ZWnIPChsGmx24W9ZxOstyh7DyhWRmfN5rQ+jua4s
12TYQIkgOFwteQpJbejGsHcB3Wy739Ux+9JDzm9vUsycyZkVybFNnzi5l5IGn8M6
DsUdOCoRJGZdTbbXbSwI5Wfi9wz5hO8egQZaAdxhvfjgcJe7Og6XPijW7WJCCUO8
DkrNJVpzVaOC5zhkExKwDTzYEuW5C9XCkvYQIUGOYRztjCdf2wS0ZboBKZ4j+e8f
FTCJ2PHf0Mm0tukGcSIvh2cB5PObvQIGCrC7DWJUCDt1d0st0FRldNZquQQPk0Xa
gPBNd+XyvrPqQNvM95uu5zP8wcKo1g==
=iaTj
-----END PGP SIGNATURE-----

--jNkIszTEyoLDpk23--

