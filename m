Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F533B66E6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:39:13 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuHw-0000oE-1Y
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxuCP-0004O0-1H; Mon, 28 Jun 2021 12:33:29 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:35897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxuCJ-00007L-Hz; Mon, 28 Jun 2021 12:33:28 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9867C5C0163;
 Mon, 28 Jun 2021 12:33:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 28 Jun 2021 12:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=HYzfID6i+of7p5uEW4AqR1acEpA
 mQzNSWY2/eIMTrPY=; b=Dk2u7LlMYA8oPWFEfZpb+4mCJZD7OJQUPPLSZk65HzE
 LQpFXNZm2quH+oyWklB8q+kyGNdPWpHf28TzXBIpxPEsBBwFVriUwu4IemBqc+iB
 Dn9mSIrnUijOXKodteSK3U/jTCvcHEDheu8z49FU8tGCuDv9F5HppWCKM3vPuACZ
 Mi/xYqvawo1wzpglz2/wLlWJ1QCWm90WVHvTNH2g27KNNn//67Cc9MlY1/wmgvuw
 GEyqCdYWfhdzCQmaQysfLaqBb7Hu853JsJhSnLmCZ1lhzdqIUXOiwXDLCms21cq8
 TjQNFPfJIqO43isf5SLc0RxJQk9yrb79yP2LfRADipA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HYzfID
 6i+of7p5uEW4AqR1acEpAmQzNSWY2/eIMTrPY=; b=pJKFnxU9gQey7TqTOMJjHs
 inZov9UKQSZ2xerDz9JIOglHFAE0jT9czJd8IkWp2iVIXEj48WnGOlEFnIc1gaVe
 E4Skm+DbP+mPxPMlJsjGVfjJ3bnsvGtvNWnFxi0Lx5jYH1+fwnTuK9L9gzW4KB+R
 xUHe9fb64j7FRMhmzU51f1uHMZZjc48E8iMVKMW9Pua7KtTX15N1cBB18WuIisIo
 zYrzoyesXGsAeelx4wV4Ux4vTi/BDOT1KYhipErG0L3SVnngGNkSVaiMRrDxERax
 kQ/vMHfcXJpvuf5QqIIqRKBld37ib3SJXtlEIVqGWgotKnsC83HB2860o0gG75Gw
 ==
X-ME-Sender: <xms:z_nZYHKXqSDlm50bYeO8N_nst9Y5YPTCrGAyIYmXpax8j1HGMnT20Q>
 <xme:z_nZYLIDVAfs42yhIp9hylgSpZwzdbN31kDwwAhKqyjRpGKTcD2-4IjuKQ7vo9vPg
 x36QtpOj5Rn1Jo02c8>
X-ME-Received: <xmr:z_nZYPvWj1UqToNVUvx7V8Hk1AUI-_bU6bqUf7IYUezCnQG0Zk4kTxUlXKDx4rY-lzn4GpPpTI4sNiGildYYBiT1i6_Lb1ipAoc6PpHkWy76KW5ZjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:z_nZYAZ3q8dyr6AGzlioHtNGfO8BIMaqtdegGJQRAB2F33bbrXFLag>
 <xmx:z_nZYObVvDpm632nX5xmdNQerQgjlo6LLW45MAdktZD5cjEIarrm-w>
 <xmx:z_nZYEBTgs-oAgqlk7E1_SQHF4Q-4kPzp_5_CUMpuNMgZrVbafGCkQ>
 <xmx:0PnZYEN0nprswOptKEYedjwPBVE1tnAujVnLAIvpLl20YiiMeM7evA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 12:33:16 -0400 (EDT)
Date: Mon, 28 Jun 2021 18:33:13 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 11/11] Partially revert "hw/block/nvme: drain
 namespaces on sq deletion"
Message-ID: <YNn5yWZtK0Xd1FHX@apples.localdomain>
References: <20210617190657.110823-1-its@irrelevant.dk>
 <20210617190657.110823-12-its@irrelevant.dk>
 <20210628160059.GA2822061@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V/FFLJRGJXa9OEZ/"
Content-Disposition: inline
In-Reply-To: <20210628160059.GA2822061@dhcp-10-100-145-180.wdc.com>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--V/FFLJRGJXa9OEZ/
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 28 09:00, Keith Busch wrote:
>On Thu, Jun 17, 2021 at 09:06:57PM +0200, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> This partially reverts commit 98f84f5a4eca5c03e32fff20f246d9b4b96d6422.
>>
>> Since all "multi aio" commands are now reimplemented to properly track
>> the nested aiocbs, we can revert the "hack" that was introduced to make
>> sure all requests we're properly drained upon sq deletion.
>>
>> The revert is partial since we keep the assert that no outstanding
>> requests remain on the submission queue after the explicit cancellation.
>>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>  hw/nvme/ctrl.c | 19 ++-----------------
>>  1 file changed, 2 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> index ec8ddb76cd39..5a1d25265a9d 100644
>> --- a/hw/nvme/ctrl.c
>> +++ b/hw/nvme/ctrl.c
>> @@ -3918,7 +3918,6 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeReque=
st *req)
>>      NvmeSQueue *sq;
>>      NvmeCQueue *cq;
>>      uint16_t qid =3D le16_to_cpu(c->qid);
>> -    uint32_t nsid;
>>
>>      if (unlikely(!qid || nvme_check_sqid(n, qid))) {
>>          trace_pci_nvme_err_invalid_del_sq(qid);
>> @@ -3930,22 +3929,8 @@ static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequ=
est *req)
>>      sq =3D n->sq[qid];
>>      while (!QTAILQ_EMPTY(&sq->out_req_list)) {
>>          r =3D QTAILQ_FIRST(&sq->out_req_list);
>> -        if (r->aiocb) {
>> -            blk_aio_cancel(r->aiocb);
>> -        }
>> -    }
>> -
>> -    /*
>> -     * Drain all namespaces if there are still outstanding requests tha=
t we
>> -     * could not cancel explicitly.
>> -     */
>> -    if (!QTAILQ_EMPTY(&sq->out_req_list)) {
>
>Quick question: was this 'if' ever even possible to hit? The preceding
>'while' loop doesn't break out until the queue is empty, so this should
>have been unreachable.
>

Hi Keith,

Good question ;) But yes. The requirement of that 'if' is the primary=20
motivation for this series. The problem is that some commands (zone=20
reset, copy, aka the commands reimplemented in this series) would not=20
track the AIOCB in r->aiocb, so there would be no way to cancel/wait for=20
them.

See 98f84f5a4eca ("hw/block/nvme: drain namespaces on sq deletion") for=20
a more elaborate description of the issue and the bandaid that the above=20
fix was.

--V/FFLJRGJXa9OEZ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDZ+aUACgkQTeGvMW1P
Del4YQgApgtRdGK5j26VmBfDBGAWWhhHFS6ozrdA9g0CbOGQ4yTtqnzJfAtdpCvw
8JqTwKvLbxqf2b8CgcHTdAd4Qp5B81xeBWzWQ2xkr3wgyOKsIzC4BCgjxUIMVjT8
Pt1ZzIwIxZ3SOptrQbrAHvdY8rmbjyx9R2DQlo0S8pjTdUBjP3LyHT+vRw/w0BdU
8VfwBvwd0bclBDiPIBZOgfbZ/N9NdQul6wo7GEmOYWYd4ESssixCiaQOoRcRQcmu
kTTzmHByyaMOmpuxnyG1ABSwuqwTSSaS2IX+4A8neTuCohLXGteSCkESnbGgSthT
Ato0M7hjNfWU/73B/KKYVX2dDak3ow==
=4z3d
-----END PGP SIGNATURE-----

--V/FFLJRGJXa9OEZ/--

