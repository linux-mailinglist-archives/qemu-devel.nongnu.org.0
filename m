Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7B329668
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 07:28:47 +0100 (CET)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGyWU-0008Cq-29
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 01:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGyRn-0005j0-Ba; Tue, 02 Mar 2021 01:23:55 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:58967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGyRk-0002OL-DL; Tue, 02 Mar 2021 01:23:55 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CDF35C0150;
 Tue,  2 Mar 2021 01:23:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Mar 2021 01:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=1uID63Lzn5+hbqXzifrB8xeMS0g
 78igj3oi9+MgF7x0=; b=tNSj0k0/66BzoFO3wUQ5Hm6RfA90jeCHqTOrmDL8Q+o
 zIcXrIq6vgaDvYLCxEkfcg8ekyhrGDuIR6mq2JxpVWPOF/tOtKr86/ZwxgnYBSiV
 eQGkYp4AFlivfE/TEbwJWzTqLTOhVcwRqHvlN5a3E6g0QSB/ppoOEKBIxn3Sd8Ss
 +GAJR36qXZa5tgDATRDC/n0pWQEhIA1xmUR/EuDyPTpPq8B5CZBTyra5+aWRPwZx
 jlqGqxGMxXJXoHfGKVQJrqIxdXw34QjXwz383eACwIvsdcdLmo4f01IoPxqZqjQx
 BZk81KqSobmwlQJ3bndO1aRPOROillWHLDaaEf472VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1uID63
 Lzn5+hbqXzifrB8xeMS0g78igj3oi9+MgF7x0=; b=EROJhYmvqbHKOEKVQ6PrWi
 02G6zsVuy6UDH1UVUYkAkuTIFQnAtKE93CF9M/m6f0Ip06YlksShmNVrkho/sDVJ
 eKQ/1DZKwJlaqsI5DWvZgCiFG/6k/VltiLFM01qUT/MKngG8WDdpTjET6CanjGyH
 Y0+Zm95cmkTyPODXYcPxUmEkUeICV9iMguOo+lPpLGMu3Le1MEpqTK0bBpnf2uat
 LDeXIqEfm9dDVQcSY5wRk+Am7M84ylQv9QikzoIXmilgWhAyJMDgMpo4HWPkRJ6e
 MHyaI0TP8muiMkAoS8zJ8WZb2ZzWdl5zxMyb562vrzYXMDgIDtOuvxeAK6MDZ1Eg
 ==
X-ME-Sender: <xms:89k9YM3Aq8ZnfjiYkoZxCg5aTlpbgT58oJWviAr08nyEu3DlXItW0A>
 <xme:89k9YHFhS7F1AzgOCUDDq09k2l-_iqAIld4-Sdkbp--jrcXTtXjJYiY52Won0i5N7
 NXf7FDNpYfyomxkGzc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleelgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:89k9YE5bMABATZ2nHzy3uRtFrsVLcroZic9ssARZm-kyoTFbyq7piQ>
 <xmx:89k9YF1gaptOs-2Of4jR1XPUNlD4h5Eiv3NuzBh7xZyBCP3PpGmiVg>
 <xmx:89k9YPFZ3nb3Wwbt9TimJOoUv2AJofOUNziAhci2SfJJHulGAP_4bw>
 <xmx:9dk9YE7zbrHcA4-sXMhAGtiozupY5nqvfO5JuZr_8ibdCP5QjadiSw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C526C1080057;
 Tue,  2 Mar 2021 01:23:46 -0500 (EST)
Date: Tue, 2 Mar 2021 07:23:44 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/5] hw/block/nvme: misc fixes
Message-ID: <YD3Z8Dh7Ky8yqGPC@apples.localdomain>
References: <20210222184759.65041-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SWzKPbq7JpPKyfIL"
Content-Disposition: inline
In-Reply-To: <20210222184759.65041-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SWzKPbq7JpPKyfIL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 22 19:47, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Small set of misc fixes from Gollu.
>=20
> v2 changes
>=20
>   * Split off the trace event additions from "[PATCH 1/3] hw/block/nvme:
>     nvme_identify fixes" and "[PATCH 2/3] hw/block/nvme: fix potential
>     compilation error" into their own commits (Minwoo, Philippe)
>   * Fix a missing check on the zasl_bs param in the
>     nvme_identify_ctrl_csi refactor (Minwoo)
>=20
> Gollu Appalanaidu (5):
>   hw/block/nvme: remove unnecessary endian conversion
>   hw/block/nvme: add identify trace event
>   hw/block/nvme: fix potential compilation error
>   hw/block/nvme: add trace event for zone read check
>   hw/block/nvme: report non-mdts command size limit for dsm
>=20
>  hw/block/nvme.h       |  1 +
>  include/block/nvme.h  | 11 +++++++++++
>  hw/block/nvme.c       | 45 ++++++++++++++++++++++++++++---------------
>  hw/block/trace-events |  2 ++
>  4 files changed, 43 insertions(+), 16 deletions(-)
>=20

Applied to nvme-next!

--SWzKPbq7JpPKyfIL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA92ewACgkQTeGvMW1P
DelEgQf+MSJf9wX2M2LWE3hMR6lIJqXD3dkSaQYE8g0171g08ujjGJMYHgg2uxW/
lN8c9mzPykoMEGJJdFSXANHgrFoVLhMHFlV6r+/kn0an8fe9dTIK4c+bKCL1JKhC
fxZ0mPT3Nl8gQ4mbV0AY8bj8GRS22Y1HVEPA4PrdYRPdJ1slLagoi7cTTX3AN/8X
/okOX9Jhihp0fbcDm4crDbDKj7xpmOO46XAsGsrQJv4+St8Ff38M4ClP4Bzo/SRn
S9rkMDucXBNPtzUrQBwZRE0u+eiA8syTGTs4QwsgX9YfMoI8TNq75ymPIm/3lJwU
kuY4oH/B3SHW/bDxOR+c+ihviMncvg==
=ur7J
-----END PGP SIGNATURE-----

--SWzKPbq7JpPKyfIL--

