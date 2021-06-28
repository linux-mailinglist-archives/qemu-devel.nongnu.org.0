Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C1F3B6786
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 19:18:44 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuuB-0006Us-O9
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 13:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxukY-0006td-8W; Mon, 28 Jun 2021 13:08:46 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lxukW-0006PS-Jn; Mon, 28 Jun 2021 13:08:46 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DCDDC5C0131;
 Mon, 28 Jun 2021 13:08:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 28 Jun 2021 13:08:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=uR72MShrS3g+DS1HEqabup1ZFvS
 TY18SFbSHkm+wgtw=; b=KZH66Waf+e9ye3uqYdcZaC4hyiibp/hkl6M3acXHZzn
 rCBs/zACKVvtepV05iLa2hWU4i+ErOWer6gYGGXqGUMO4BMLv2cyBf+iPF+W5iHJ
 1SAWPq7ipSiUrR7QfeUcsIKOl++zVKo8rASytnY0bcPyPLz0DOxUhRwhA2lvgLwr
 63AsVuvDdPVQ0SFRI/OWAz/3DSNCtc1lCWxXrTiFyQSuLwRtoHg/mujWJfDzmYYa
 O1jkqWdUmdZwru48hCPSO8A3JpVy9eVJdIXc2Wrt1ZJoCtSyjVnFAb4xEeLNBLDq
 jG586buKOLR/1kVCXYrwSNgZc+0vEkglI9/8ToU5dew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uR72MS
 hrS3g+DS1HEqabup1ZFvSTY18SFbSHkm+wgtw=; b=EssDM/wvUXHz6CzJhlajHQ
 mym2SBdQkTHSOUMCtd24/c+wbStCdTUCuD3/U1YIn7JdJVIa5Uvv9UTKYAn8OVHs
 O3QdmtwUPZaA5ZXeuHNfOT+giIzOroQ2BxGy1eRAa9zGBPn6LrAbK361PUnBCsGC
 XO0Pz7ZK5EWCqPsnwItzhnMfXAsT73cKIXY38mFWpl0Q2dG0tJ8gGaoaufNehA9v
 phdTN/KQ2mibGxOL9+eMd4Vm1I0GoWkFXZrrsTZKVH9eRh/gFolQGokHvQITx2pg
 JVXj22pyFnBpTzO63VNjvOzrjT6SA4lDvlm6XgADRNAX2slMZ/+/RD58aHY9JM4g
 ==
X-ME-Sender: <xms:GgLaYLLC77bt7fzvbWeW92H7d4xMRBfvDtmx98cq_h8vVoRdbibnbQ>
 <xme:GgLaYPLtD23guOYDSECW3jiKPvrvXixXd-u5kmE80e2os4ynhNULJpAKUy-UX2JoQ
 Kq2rbcACcQK74Lxc34>
X-ME-Received: <xmr:GgLaYDsUCO7DG19_t5vl051KubvaG6LfAQ1yU2j-S2wYDuPIGMC8Ox9p8WzErO43C55qAt0OTj3Z9SEFTOEM1HfoUD03Paxh2vPj_Z2UiuMPzxtE7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:GgLaYEYL5bDnT4ZnQVfRSrl4kdx7X6_9LPGEblxV9F9nWXRAqqa-jg>
 <xmx:GgLaYCZ1cm5PmzlyMlUHhxswpdOpVmZ6E0SUnEWGWzUNIdZJxewv5Q>
 <xmx:GgLaYICh6k_KjcN9JfUo6Tzprqn0Gph3R0MnTP_tWM_z5ry9qzIYGw>
 <xmx:GwLaYIOBoALsqppwmMkSvYRSGSK3mHy_BT9Zd-zOh5sYdMPRpn_jIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 13:08:40 -0400 (EDT)
Date: Mon, 28 Jun 2021 19:08:38 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 00/11] hw/nvme: reimplement all multi-aio commands
 with custom aiocbs
Message-ID: <YNoCFm+pUTuxmF7r@apples.localdomain>
References: <20210617190657.110823-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Sd2zDJUE2/+UaXiU"
Content-Disposition: inline
In-Reply-To: <20210617190657.110823-1-its@irrelevant.dk>
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
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Sd2zDJUE2/+UaXiU
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 17 21:06, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>This series reimplements flush, dsm, copy, zone reset and format nvm to
>allow cancellation. I posted an RFC back in March ("hw/block/nvme:
>convert ad-hoc aio tracking to aiocb") and I've applied some feedback
>from Stefan and reimplemented the remaining commands.
>
>The basic idea is to define custom AIOCBs for these commands. The custom
>AIOCB takes care of issuing all the "nested" AIOs one by one instead of
>blindly sending them off simultaneously without tracking the returned
>aiocbs.
>
>v2:
>  - dropped RFC
>  - fixed flush cancel from being unintentially a noop (Vladimir)
>
>Klaus Jensen (11):
>  hw/nvme: reimplement flush to allow cancellation
>  hw/nvme: add nvme_block_status_all helper
>  hw/nvme: reimplement dsm to allow cancellation
>  hw/nvme: save reftag when generating pi
>  hw/nvme: remove assert from nvme_get_zone_by_slba
>  hw/nvme: use prinfo directly in nvme_check_prinfo and nvme_dif_check
>  hw/nvme: add dw0/1 to the req completion trace event
>  hw/nvme: reimplement the copy command to allow aio cancellation
>  hw/nvme: reimplement zone reset to allow cancellation
>  hw/nvme: reimplement format nvm to allow cancellation
>  Partially revert "hw/block/nvme: drain namespaces on sq deletion"
>
> hw/nvme/nvme.h       |   10 +-
> include/block/nvme.h |    8 +
> hw/nvme/ctrl.c       | 1883 ++++++++++++++++++++++++------------------
> hw/nvme/dif.c        |   64 +-
> hw/nvme/trace-events |   21 +-
> 5 files changed, 1124 insertions(+), 862 deletions(-)
>
>--=20
>2.32.0
>

Applied to nvme-next.

--Sd2zDJUE2/+UaXiU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDaAhUACgkQTeGvMW1P
DelDkgf9GHDSznyoOJnMhTbZx0Z6p4Ws+IlnLtJrgTMp+dqp3+Mfqq63UBClq9hl
sg7lnoRcR+GuCvWeM2iOb3vS46i/p3rv8nZT0euDts7pK5vBsnl5sOopgSB3RLE2
712HUD4k5StqBcTSMyIYT2Jao3H0yLIg/N82AcqwcXYVrrwcipWCPR8dGsQzEbYy
Cr7cWvLo5Bjh0W6T8Fy1huV/maZ82mWeUsrORVF/DxuvJoP4bpOWP0X3+pODL2aB
ZfvfoktHNojqcd0cPJCrcOsMpxkt1GaCqG8LrMM9deZ1RHecZdhRzT0KQip9/i7g
VBmGAWsiOTqIIix16w0r4F60ahFPCA==
=IZVK
-----END PGP SIGNATURE-----

--Sd2zDJUE2/+UaXiU--

