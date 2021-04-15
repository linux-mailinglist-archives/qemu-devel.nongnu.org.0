Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F5361121
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:31:40 +0200 (CEST)
Received: from localhost ([::1]:45110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5q7-0006fK-Gy
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lX5e0-0005Gu-Nt; Thu, 15 Apr 2021 13:19:09 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:39401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lX5dw-0007kD-4C; Thu, 15 Apr 2021 13:19:08 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 951BA1A16;
 Thu, 15 Apr 2021 13:18:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 15 Apr 2021 13:18:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=DohkFW+Icdqd+ECH30OxCQLgaQ8
 kQQyakpR/Mq4hyoI=; b=2dTiXtsTDtC1+upp1VHuxwZV6gZyCa9rb2pSi7IFSQ/
 5UkA9GEI3EnanxT81lpfrZiAvFfTs1Q0zyGOPRAuyVKbyLy05vTudpEfARtL5P/F
 zE99aSUsBekTEb9fyeC35jqSTJ7vIe8NJ+JvkqT6T3Ag+NSG7WAJDz+L7fJcNItQ
 0wR2sw8ybxJQKeIYUNoPTqHA6zIzHfeaFLSVDBF7Z0DcRhbbSQWx5v0BkhwKYuxn
 n9Hw03pi+xOR35XQFloKdR5APqM9666siEePwNcRzd3oddjPLfz04AJWtxRFA7eT
 XliAlOPtHF7soUIYe2BmLGLqzpJ+FFTdL+ygLisNtGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DohkFW
 +Icdqd+ECH30OxCQLgaQ8kQQyakpR/Mq4hyoI=; b=vPqbLZ6DrcIt+krn5c1Atk
 6wVZbczburqgnS3QNEhZf9MzYpFWmaWvnixqCc7jDF7vwpxpiCBHCZBYgqJKAfNB
 YUKGQCG/UUZnYo3EXQhYQvUJZqCrJQsjnejeSEMaT6P7eHPY+hlW0QyJk+xslCdC
 Wb29TK4CUSBl5iQCW8N8Ivpyd6Cf7TdcJgJ4+dw2I2T0UdacwfUtJMhAwoTGPya+
 D402/AEkChYL76DlwsRImaT5oSvhuF88ERpu4nClsp8j3t7koNMztfjmDeMd2UOH
 25ZyOQCQ+fRqPPMNYOnfQ+B7ymVW/7iJlvFejAQvLdcSVtTu8jDSvtTQybN/5d+Q
 ==
X-ME-Sender: <xms:fnV4YFri18FOImPvQnMlT72u3un6P-1eGRJYYTk-jRk8PXfsiN3PBA>
 <xme:fnV4YFdKYA4iKWu-Y9TzDqytpDxHtXCeMviL2WyhqiEs6ByPuCcHWr5PympvtIwh3
 L4E92FMuiEOaqBJpuM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:fnV4YMoGP0nOIaTp8G-69pTkPDiistrD0DVWMQNkJzd5h4TyUAIT-A>
 <xmx:fnV4YOGtvYwujezt1w_Yx4pqkqYYUg22IohS3ho_U2M4ktrU2sAQAg>
 <xmx:fnV4YEtCUkgksXak-V5zHtjK5tSyeiGisF8fFBFwv5_HTTJA1Gk1_Q>
 <xmx:gHV4YL5aOrTYXZAtDdLxNW-twjiLX3Nn9gsfTI9Z_Ajj1pQFBL12LDuBZzc>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 63A9624005B;
 Thu, 15 Apr 2021 13:18:53 -0400 (EDT)
Date: Thu, 15 Apr 2021 19:18:50 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2] hw/block/nvme: align with existing style
Message-ID: <YHh1evjljdZesw5I@apples.localdomain>
References: <CGME20210415120417epcas5p31ddb152cbe94fa5bebe386de5e33f69e@epcas5p3.samsung.com>
 <20210415120048.5484-1-anaidu.gollu@samsung.com>
 <a1ce0889-c80c-2d59-e65a-3eed8bfdd3e9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="btMPu+fDapW2aDgm"
Content-Disposition: inline
In-Reply-To: <a1ce0889-c80c-2d59-e65a-3eed8bfdd3e9@redhat.com>
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
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
 Markus Armbruster <armbru@redhat.com>, stefanha@redhat.com, kbusch@kernel.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--btMPu+fDapW2aDgm
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 15 15:13, Philippe Mathieu-Daud=C3=A9 wrote:
>On 4/15/21 2:00 PM, Gollu Appalanaidu wrote:
>> Make uniform hexadecimal numbers format.
>>
>> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>> ---
>> -v2: Address review comments (Klaus)
>> use lower case hexa format for the code and in comments
>> use the same format as used in Spec. ("FFFFFFFFh")
>
>^ This comment is relevant to the commit message.
>
>Also it would be nice if the subsystem could describe somewhere
>what is its style. Not sure where... The file header is probably
>the simplest place.
>
>Something like:
>
>"While QEMU coding style prefers lowercase hexadecimal in constants,
>the NVMe subsystem use the format from the NVMe specifications in
>the comments: no '0x' prefix, uppercase, 'h' hexadecimal suffix."
>

+1 for that suggestion.

>>  hw/block/nvme-ns.c   |  2 +-
>>  hw/block/nvme.c      | 40 ++++++++++++++++++++--------------------
>>  include/block/nvme.h | 10 +++++-----
>>  3 files changed, 26 insertions(+), 26 deletions(-)
>
>

--btMPu+fDapW2aDgm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB4dXkACgkQTeGvMW1P
DemePAf/WHWTJOcPTpEr/9lhfy7kYSYlsMV8NE7XIBbK4OGkNnfJUTiyHRkNkX6W
CJ7bpbu8/LK8GmQ3oSHO6BGRuQMXmKy1C2jL73zPx/N6gkBHqgpvvIkhmH0uBO6i
mAB6sCGDF2O7A/wGGdDvI0eMYZJ3BCNvAVSFPx22sAM/aG4o9KNz71Z9cjd/NHMI
wAp3m7rPz9yccZuXljQ+EcaLjxZiuDkJbnzWVQoGo5U2UOu5VO/B9szdfCpR8SGb
qyGUBpEuV6HUGKmwewNdGap6cg1rPKJUnr9UyZ43K/XeVgJIrcLR7KdtGKCZhvwt
Ra8GMPgnEVCYL2wCokUq23Do97gAfw==
=KSG/
-----END PGP SIGNATURE-----

--btMPu+fDapW2aDgm--

