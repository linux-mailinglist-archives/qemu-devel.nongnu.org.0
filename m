Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0646359EF5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 14:42:06 +0200 (CEST)
Received: from localhost ([::1]:58702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUqSb-0006u5-Jp
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 08:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUqN9-0006JL-MU; Fri, 09 Apr 2021 08:36:27 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUqN7-0000AA-DV; Fri, 09 Apr 2021 08:36:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D135D5C00B5;
 Fri,  9 Apr 2021 08:36:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 09 Apr 2021 08:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=tjQhYmO4ilC64fzjMYI4XkAzaUZ
 RdFW2cOcLH3Gz7NU=; b=aedREFl0KKrwvRDEn4LkoB5YKvq1t8JF7akIcNAuypR
 YzDhjXbbSp2SVgy8ynGUpXgC6Hgrqw/ALptUN3wyBY6P2QpwfLOQt9pg1Ug/xPZj
 qERgr/6nmmvtlvKi8JfDj1DTLLOUcLGLJwMg1Xqqf91tVd8nUAH4pVsEnop0qzvK
 f91pwUnDOBmJqyX2uSIiraK2Ip1eaVCkE+bBx47JqA6f6gyEqhg4ErVydcn+Ahl6
 elEhROnvmEcQSmN5XQL/N7LcsoVsRCi0ahcZCEsEnJ6ZaFFRgfMrEk+h+b2F4opV
 1bu2tgwjIbHHY4XSQx1xGsxRxsalTGzPvc01aMeldgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=tjQhYm
 O4ilC64fzjMYI4XkAzaUZRdFW2cOcLH3Gz7NU=; b=KdN9HnBWd6YS25icadfsoL
 OPXmgWmwzSQ6ctpQ3lkuE4LTcXEh0CozR8zzdonA9xLq6Mi7SJ6T/wh+cp1YedA4
 xF3DV/05eCy1nlBpr0z2juJ6lAApSJ5tmoM8qoMcyHHElW0vkR+n23qkECNF6O4O
 fIRdCFIP3oI1awe/KBdBJQhfr3gSwMTV3g0TsIbKrFfKwBWpgjtBtvB9huiCRUjz
 reMSyEEHPesO4IWvj8vgUz7keoVfE/sfmTf0Xf5ZIZBPs1IbWFS/ezT2AE1URAa7
 pJaNsihQqZoFT4RDB4FNfs2+tXrwJ/qM7McGbKNeVgPUQID7Sa0iXgszRCPNxVbw
 ==
X-ME-Sender: <xms:RkpwYCTO7Z3qB8qURxSyDXThq2kYQKyh1D8nKAKTyLbi8EYdt9sBUA>
 <xme:RkpwYHw5m27icn7IYearJme3kzWOa4nHKyXsgNpKxp9mrmXw-u8612CFbzFXXqiUn
 B2LcbSNzS8bZRZLKkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekuddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecukfhppeektddrudeijedrleekrdduledt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:RkpwYP05bQuBKUtda6EkL1tSQ3pda2QNFiKP_CxgREvE3y9ERDQrZw>
 <xmx:RkpwYOBquh-l60JPpYfHeZxYVah5l7ZlwNGXe0eXY-0lIKtnIH3lQw>
 <xmx:RkpwYLiFKAGqQCFcLNPE7Y7aV68qHuhqzmZ-89cYi7Xg7dg1RACEuQ>
 <xmx:R0pwYLgadsojXwzFECJl8Eal1jA0-1-IIqJJNcm1kI6YuEZTtmHROA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 161C0108005F;
 Fri,  9 Apr 2021 08:36:20 -0400 (EDT)
Date: Fri, 9 Apr 2021 14:36:19 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH] hw/block/nvme: slba equal to nsze is out of bounds if
 nlb is 1-based
Message-ID: <YHBKQwhAR8RcLTTD@apples.localdomain>
References: <CGME20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234@epcas5p3.samsung.com>
 <20210409074402.7342-1-anaidu.gollu@samsung.com>
 <20210409110518.GC2085@localhost>
 <YHBAlXnRdYTU1m1P@apples.localdomain>
 <20210409123115.GG2085@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="itGV5LN1qtsHFAsD"
Content-Disposition: inline
In-Reply-To: <20210409123115.GG2085@localhost>
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--itGV5LN1qtsHFAsD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  9 21:31, Minwoo Im wrote:
>On 21-04-09 13:55:01, Klaus Jensen wrote:
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
>Even if this is not the LBA out of range case which is currently what
>nvme_check_bounds() checking, but I thought the function checks the
>bounds so that we can add one more check inside of that function like:
>(If SLBA is 0-based or not, slba should not be nsze, isn't it ?)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 7244534a89e9..25a7db5ecbd8 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -1415,6 +1415,10 @@ static inline uint16_t nvme_check_bounds(NvmeNamesp=
ace *ns, uint64_t slba,
> {
>     uint64_t nsze =3D le64_to_cpu(ns->id_ns.nsze);
>
>+    if (slba =3D=3D nsze) {
>+        return NVME_INVALID_FIELD | NVME_DNR;
>+    }
>+
>     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
>         return NVME_LBA_RANGE | NVME_DNR;
>     }
>
>Or am I missing something here ;) ?

No, not at all, it's just that this additional check is never needed for=20
any other command than DSM since, as far as I remember, DSM is the only=20
command with the 1s-based NLB value fuckup.

This means that nlb will always be at least 1, so slba + 1 > nsze will=20
be false if slba =3D=3D nsze.

--itGV5LN1qtsHFAsD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBwSkEACgkQTeGvMW1P
DemHrgf+J46f5U+5kIGeagHOYeWc4nu2lX3wwAV/MuH7MHecS+y2c1/AJiNUZnt+
RkWTu1YfwowyvgFPIwc9uWA62UumB280+1SccVM4+i2Jln+G1/eBuD6uYALQJr6e
mwCVMlZ/KNYtuoiS7dGZnzs9uX9ffmeNJGbJ4EIiwCSF7rww0lUNemam8s1aOTwP
2BzSlvhpxcYOmH7cLZYaHP3jwG1hjmYKx1mZvHEeCl/ejAi346QSfwi32HwIDaeV
FIbp2mI6adZjYDjUCPuMyR0qTHosJre3AGboMcC8QFZvOzDDuSmVJhfjslKmy5ck
9eAfEQvaR/jVvcoB+oTKRheDBE7NoQ==
=VG7S
-----END PGP SIGNATURE-----

--itGV5LN1qtsHFAsD--

