Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284CA359E1E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 13:59:41 +0200 (CEST)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUpnX-0004Ln-Jh
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 07:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUpjG-0003G2-8s; Fri, 09 Apr 2021 07:55:14 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:52571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lUpjE-0002HX-6a; Fri, 09 Apr 2021 07:55:13 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 43CAA16CF;
 Fri,  9 Apr 2021 07:55:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 09 Apr 2021 07:55:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=61Ck27LmV5uwV4i+X3DMjUKu5aQ
 akcEqlGKDto5tzkk=; b=OWHHfXjKvIGKfVni/E3wQ6YK5aeN9xtrmMHkFjKBuPX
 Eod9+eloy1UrExRzJEXfICgj4ujHEFm5JExtsD+6zZt0Y3U1pJao/VRs/dlJibaB
 952FFPL2UPHPoD+gnJ3JjkRcl5tgYaMf0XEZL8TdbH0wKRFsZNtEJdJG0T0PuO0y
 EAJl5OO8eIXSJs/4miL7XLLWgtxHbz13nDxn2xH/qQ9dceE1qLvVw7nxSKvwxiXX
 TnDEtTTC3VRnl+1CPIVeFW41qoZdjzXkTi7pkYR6Jk9iPnEM4S+jzT/JzHiL0mx/
 jA8qDjfqGEyVy3Q5b1BHdzCwLpspf71nVx6UdTEfMFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=61Ck27
 LmV5uwV4i+X3DMjUKu5aQakcEqlGKDto5tzkk=; b=h1DwjIHhH6yZJRTpoIW2k2
 RHHO3+iCQZCtGClkA1WHzKB3nmTAj/Nj6H3hWoKA+kxquGpW4oEIxyfnHWLa7Doj
 U+WyQBy5be6kyQ8ScQ6SmyGz9XWk/jY4awauyr2lcxqPo1I6N17Qqx14hDcvAUUQ
 ej62SN5/onv3tsu5yKYOhioEyJRbypZocvLAby76WLUhD1pxUxQQxwxAU4CDs+sW
 0kQJDMUPs1ciqCbZeUCdR47bl3e//Kjb7gpkEK4LXlAM0ijsc0QdkMqgLomfoa0H
 G0JRCqFjbClaPT0G0OWXYPvZ72fgsigsBdb0bGDBWr0+nt+V4N3Uprh7hrF/yIgw
 ==
X-ME-Sender: <xms:mUBwYH-hyUOQ1xv8MLMNgEGPqGhfCEj7MzB3PEx-Z4pkd7E-9ZxR1Q>
 <xme:mUBwYFtIKINiCy0yDOJ9mocSZKXjC3BNGL8IUClVduHZLe7BeC2T7R36o6xCM5Uyq
 VbhWWz_hoglne3uOu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekuddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjeegudffueeiteekieelkedvueelte
 evjeduieeludfffeejgeffhfduvdduffeknecukfhppeektddrudeijedrleekrdduledt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mUBwYOYRgg8nMausZfKPFvTZTigxXshSc0KSQY3iekP4LJQCWhpkRQ>
 <xmx:mUBwYFo4ows2IMKkJQktoKnxloF3SnDi2p6wzVGlosHQHjC5we6L3Q>
 <xmx:mUBwYD_Hwlm12acdxtNyJIa-lPX5M-tUPfyLGttwEsSYJYJP2MRzfg>
 <xmx:mkBwYECXlIXxTBAjoaroS2Xs8fhe0CG7VKHPRadTYaVfBMj8jihEzA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D4DE5240067;
 Fri,  9 Apr 2021 07:55:03 -0400 (EDT)
Date: Fri, 9 Apr 2021 13:55:01 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH] hw/block/nvme: slba equal to nsze is out of bounds if
 nlb is 1-based
Message-ID: <YHBAlXnRdYTU1m1P@apples.localdomain>
References: <CGME20210409074451epcas5p391e5b072e6245b8fe691d67bb42fb234@epcas5p3.samsung.com>
 <20210409074402.7342-1-anaidu.gollu@samsung.com>
 <20210409110518.GC2085@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JTtEX0YPsHWvI05w"
Content-Disposition: inline
In-Reply-To: <20210409110518.GC2085@localhost>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--JTtEX0YPsHWvI05w
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  9 20:05, Minwoo Im wrote:
>On 21-04-09 13:14:02, Gollu Appalanaidu wrote:
>> NSZE is the total size of the namespace in logical blocks. So the max
>> addressable logical block is NLB minus 1. So your starting logical
>> block is equal to NSZE it is a out of range.
>>
>> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>> ---
>>  hw/block/nvme.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>> index 953ec64729..be9edb1158 100644
>> --- a/hw/block/nvme.c
>> +++ b/hw/block/nvme.c
>> @@ -2527,7 +2527,7 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest =
*req)
>>              uint64_t slba =3D le64_to_cpu(range[i].slba);
>>              uint32_t nlb =3D le32_to_cpu(range[i].nlb);
>>
>> -            if (nvme_check_bounds(ns, slba, nlb)) {
>> +            if (nvme_check_bounds(ns, slba, nlb) || slba =3D=3D ns->id_=
ns.nsze) {
>
>This patch also looks like check the boundary about slba.  Should it be
>also checked inside of nvme_check_bounds() ?

The catch here is that DSM is like the only command where the number of=20
logical blocks is a 1s-based value. Otherwise we always have nlb > 0,=20
which means that nvme_check_bounds() will always "do the right thing".

My main gripe here is that (in my mind), by definition, a "zero length=20
range" does not reference any LBAs at all. So how can it result in LBA=20
Out of Range?

--JTtEX0YPsHWvI05w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBwQJMACgkQTeGvMW1P
DekWtQf8Dp4XH7QHtB3LfWB24sB6PGJeQD0gPFRTX2RRSn8h+bxtORYhzSMQL265
bOmBK5/lE76/rkO/pa2wOLEUM1nRqkf4WL0/CJB2krxd0kvdBrdnmXtSvZ4wIfcA
awI5VB/arGj9D04fEkYK+LN6Pb+epH2jmW2rG0AoMywaBywykGOo52I4+OhFDPEd
uUrbsdtQCY1UEIOmTkUSJlHa23Y1r56zBl1s6lsCUzOkx72kfMeQYbgh59b9k8ML
i+kdb67LW1CG8ScSux8ZNJKzrpH6lqXteFHSzEoOrtxeKMdz+eDYTuaMtAmvGGFj
YcExUOalaQrJjEgYr0jELkrrgABEJg==
=yKs/
-----END PGP SIGNATURE-----

--JTtEX0YPsHWvI05w--

