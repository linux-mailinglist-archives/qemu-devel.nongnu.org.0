Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D7739DAC6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:10:29 +0200 (CEST)
Received: from localhost ([::1]:33990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqD9I-0008GM-Hv
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqD2A-0008E2-Qr; Mon, 07 Jun 2021 07:03:08 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqD26-0003rr-7c; Mon, 07 Jun 2021 07:03:06 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DA5E65C009C;
 Mon,  7 Jun 2021 07:03:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 07 Jun 2021 07:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=4M3u5/8McvKNmYlUP7IGZ7JLrXE
 PSPIaEUXdrNE3xnU=; b=KH74NA2BUm422nuEa2o9Qo0K769L+fMekJfJkq41KIP
 YzwJCEQnLKxUB0hRHCmpo3zmFjBM8+snL1iPbzvzB6LGPdChf0hgVuKRKoJVuwLq
 RE5MhDhMxyrYIAvlDHIYuL3YkGtqxBjVxa9EEdSZV1zoKpiksoe4jP4QHcSd4F8m
 CBCs0hyFu05zC5LssAn8wE3f8S+PS0V4QwdIoQhqti5D/KCvPB6TqYVaCz+l4Y6v
 maFn3sB8tgzJj56e3jt/YPswZFy1TO9+0LJkjO86PJiNUY19uWSoX9mnKHNkkYPR
 L7Wg/1YYMhl2pJOgHzMCNdoTzuWro+v9Cg3kmUQwqFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4M3u5/
 8McvKNmYlUP7IGZ7JLrXEPSPIaEUXdrNE3xnU=; b=ikp+ESgXPhGlnvF5jbuuys
 uJ7pNj/w4upJh+gbJOvfCBcm8dDdSYvkeaucQwHGf+lN9oo/avXYyI6Zo5XHcU7L
 OtPeLlrnUhFjQu42vYuOaHcJ9X5QHOzyd97tncg2d7faFylqqTFF6e4gIfLPPm56
 zoDr/so/8HgDUCzwRR9+3he2xj7xLjV6yM6BqWPb9cElNP5m2O2ub6dKqPoc0vpM
 wobpQGvhEypogLKDq2GE/bvW1bhPtv8VZSmlKD10JhIY7o4eC6B/d/RQ+7t9Nhrb
 IuDRAGLNHI5KfBJRZ+MlIBZsO9NcBWAnGKK8Q1tkZNtzyP6JOOvBvNUPZO1XbSVQ
 ==
X-ME-Sender: <xms:4vy9YKDFJYjdPAB0WVMHTpB49X_pZlj6VWUleSxUvJnyrnNNAvtHrg>
 <xme:4vy9YEgBGR9TZP0l7bv8_PNya_UHaSp2CncGNb_zwqlaH_bGWcp-GCdVPVJf4JJXo
 qEeqqo3qUABLWOeeRs>
X-ME-Received: <xmr:4vy9YNmTjEpxc-FhkXB-f_-IuFXv9Ur2g2f1VkZWdok0wfMFyABzotb2yDPMyeM2quQKs_0pxr6mrf_O9bJb_7urVr0iFq2uliG7zvo5VESZb4-VxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:4vy9YIxVn8nhZ2GfsSO38hlb0BN24I6dZbyv0Ffiv_3QL1pDhWbsCw>
 <xmx:4vy9YPT4BoFT_zIsY2RPir_lgnQZPmAfyBZ4fsWjdoRcsyvvhdCMjg>
 <xmx:4vy9YDbUec1hwxX9KtsLpVLlRhn4Jdrh5gp8rAv37eMpYUQD7l39sA>
 <xmx:5Py9YKEk3Jz7bIMTusBWouHQd102zpN7y4TyQzdcY0W3L1snSHBnNA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 07:02:57 -0400 (EDT)
Date: Mon, 7 Jun 2021 13:02:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC PATCH 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
Message-ID: <YL3834V88DrbPYeS@apples.localdomain>
References: <20210604065237.873228-1-its@irrelevant.dk>
 <6addc825-917e-e3b3-f2b3-af311beb6b00@virtuozzo.com>
 <YL259FilxX0aqFYb@apples.localdomain>
 <a9104cf3-efed-524b-803f-b49d93fd062f@virtuozzo.com>
 <YL3uMOfMBKGM9KpQ@apples.localdomain>
 <16744314-bf91-9d4e-72b8-64b55891d36a@virtuozzo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fLmgteCK3Cjq7BL7"
Content-Disposition: inline
In-Reply-To: <16744314-bf91-9d4e-72b8-64b55891d36a@virtuozzo.com>
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


--fLmgteCK3Cjq7BL7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  7 13:24, Vladimir Sementsov-Ogievskiy wrote:
>07.06.2021 13:00, Klaus Jensen wrote:
>>On Jun=C2=A0 7 10:11, Vladimir Sementsov-Ogievskiy wrote:
>>>07.06.2021 09:17, Klaus Jensen wrote:
>>>>On Jun=C2=A0 7 08:14, Vladimir Sementsov-Ogievskiy wrote:
>>>>>04.06.2021 09:52, Klaus Jensen wrote:
>>>>>>
>>>>>>I've kept the RFC since I'm still new to using the block layer like
>>>>>>this. I was hoping that Stefan could find some time to look over this=
 -
>>>>>>this is a huge series, so I don't expect non-nvme folks to spend a la=
rge
>>>>>>amount of time on it, but I would really like feedback on my approach=
 in
>>>>>>the reimplementation of flush and format.
>>>>>
>>>>>If I understand your code correctly, you do stat next io operation fro=
m call-back of a previous. It works, and it is similar to haw mirror block-=
job was operating some time ago (still it maintained several in-flight requ=
ests simultaneously, but I'm about using _aio_ functions). Still, now mirro=
r doesn't use _aio_ functions like this.
>>>>>
>>>>>Better approach to call several io functions of block layer one-by-one=
 is creating a coroutine. You may just add a coroutine function, that does =
all your linear logic as you want, without any callbacks like:
>>>>>
>>>>>nvme_co_flush()
>>>>>{
>>>>>=C2=A0 for (...) {
>>>>>=C2=A0=C2=A0=C2=A0=C2=A0 blk_co_flush();
>>>>>=C2=A0 }
>>>>>}
>>>>>
>>>>>(and you'll need qemu_coroutine_create() and qemu_coroutine_enter() to=
 start a coroutine).
>>>>>
>>>>
>>>>So, this is definitely a tempting way to implement this. I must admit t=
hat I did not consider it like this because I thought this was at the wrong=
 level of abstraction (looked to me like this was something that belonged i=
n block/, not hw/). Again, I referred to the Trim implementation in hw/ide =
as the source of inspiration on the sequential AIOCB approach.
>>>
>>>No, I think it's OK from abstraction point of view. Everybody is welcome=
 to use coroutines if it is appropriate and especially for doing sequential=
 IOs :)
>>>Actually, it's just more efficient: the way I propose, you create one co=
routine, which does all your logic as you want, when blk_aio_ functions act=
ually create a coroutine under the hood each time (I don't think that it no=
ticeably affects performance, but logic becomes more straightforward)
>>>
>>>The only problem is that for this way we don't have cancellation API, so=
 you can't use it for cancellation anyway :(
>>>
>>
>>Yeah, I'm not really feeling up for adding that :P
>>
>>>>
>>>>>Still, I'm not sure that moving from simultaneous issuing several IO c=
ommands to sequential is good idea..
>>>>>And this way you of course can't use blk_aio_canel.. This leads to my =
last doubt:
>>>>>
>>>>>One more thing I don't understand after fast look at the series: how c=
ancelation works? It seems to me, that you just call cancel on nested AIOCB=
s, produced by blk_<io_functions>, but no one of them implement cancel.. I =
see only four implementations of .cancel_async callback in the whole Qemu c=
ode: in iscsi, in ide/core.c, in dma-helpers.c and in thread-pool.c.. Seems=
 no one is related to blk_aio_flush() and other blk_* functions you call in=
 the series. Or, what I miss?
>>>>>
>>>>
>>>>Right now, cancellation is only initiated by the device when a submissi=
on queue is deleted. This causes blk_aio_cancel() to be called on each Bloc=
kAIOCB (NvmeRequest.aiocb) for outstanding requests. In most cases this Blo=
ckAIOCB is a DMAAIOCB from softmmu/dma-helpers.c, which implements .cancel_=
async. Prior to this patchset, Flush, DSM, Copy and so on, did not have any=
 BlockAIOCB to cancel since we did not keep references to the ongoing AIOs.
>>>
>>>Hmm. Looking at flush for example, I don't see how DMAAIOCB comes.
>>>
>>>You do
>>>
>>>=C2=A0iocb->aiocb =3D blk_aio_flush(ns->blkconf.blk, nvme_flush_ns_cb, i=
ocb);
>>>
>>>it calls blk_aio_prwv(), it calls blk_aio_get() with blk_aio_em_aiocb_in=
fo, that doesn't implement .cancel_async..
>>>
>>
>>I meant that most I/O in the regular path (read/write) are using the dma =
helpers (since they do DMA). We might use the blk_aio_p{read,write} directl=
y when we read from/write to memory on the device (the controller memory bu=
ffer), but it is not the common case.
>>
>>You are correct that BlkAioEmAIOCB does not implement cancel, but the "wr=
apper" (NvmeFlushAIOCB) *does*. This means that, from the NVMe controller p=
erspective, we can cancel the flush in between (un-cancellable blk_aio_flus=
h-initiated) flushes to multiple namespaces.
>
>Hm. But it will work the same way if you just not implement .cancel_async =
in nvme_flush_aiocb_info.
>

Oh. Crap, I see. I screwed this up in flush.

blk_aio_cancel_async(iocb->aiocb) will be a no-op and ret will never be=20
-ECANCELED. I think I do this correctly in the other reimplementations=20
(explicitly set iocb->ret), but not here in flush.

--fLmgteCK3Cjq7BL7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC9/N0ACgkQTeGvMW1P
Den9dgf/eK6b8kXC9FPvbJI2VQTLumfHyH9/x8SRLNdngyPkzeW2ddT35MJELnxo
nMiTrM32A592RtUxkt0M/kWEKHOC0xokMjuouXMrlOWVtEiPBydgi/soMGS4iju8
+t80wbvbKQTOvQY2XcIU2VBm04SXLTnBqdQLA4Gu0X6UMCpXjyVSYwhsaQnP79y6
gtqavZ1WVgK1eEdzroj98iXNMQknewKovXD3iRoKH18c8/EO1QTQvAzcvzjpqMjq
hfO2v9wmf3Xs8gTz3sGwWJIFNohCs6vAoBD575JMEzaKn0SzMYHiDG+UXUR9+6oZ
CbB370SCPXkdIfeEZtIuiJc5x/1tVw==
=OFuU
-----END PGP SIGNATURE-----

--fLmgteCK3Cjq7BL7--

