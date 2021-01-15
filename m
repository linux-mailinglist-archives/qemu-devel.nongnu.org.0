Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EBD2F7E08
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:22:19 +0100 (CET)
Received: from localhost ([::1]:58370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PzW-0006NU-Bz
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0PeR-0000yK-P8; Fri, 15 Jan 2021 09:00:31 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l0PeO-0002Nt-Iu; Fri, 15 Jan 2021 09:00:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E0505C01C4;
 Fri, 15 Jan 2021 09:00:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 15 Jan 2021 09:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ojr991irad/SQ2jqVhFXW//2p8X
 toEnpBnuWj2/37XM=; b=FePk8bjf8dTA1ilpYd5ZW5r4EmAVFNJUFAkLC7QxGdr
 AUQT7VlPH5pYoSqLkU3v7lnYpPuUXrz/XJr5PZx4OvfVxsacu+nJz7/YMltdBV/b
 e4TlF4QvuiiDO72NaFVWr5Udiqjqm3i4AGEpk6maQX/dSV1gqQNUWn40O7u4I2qH
 tNBKdFZLumLInY9C4DEakZ7nbNwvSsWVndSYNOtEc9cTElM+LaU2tFV5gmbftfJs
 rlPqyEWSDVckptqxg6C/97t+0WrTXJcrjnk9zHFPfWoPIjSH1YuULKYYUbf7WIHf
 6NJ86yeqHeM0Wh3q9CsUzpkIfSlVUoDmmrW+Ou8Ia5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ojr991
 irad/SQ2jqVhFXW//2p8XtoEnpBnuWj2/37XM=; b=JHgq0gzhDi58a1pjzMPLlw
 Erw8UwYQTPOpnp9YWfIP4VvBO6vOSWrDeWYsi6PfMWE0B7KMAqVnzUIJ8Viz4Qv1
 N4oTQlJG9t8tWQvDu4ofs67F3J27yhMQIcguZfTopCqk4gBQO4gHQnD3Fr1AGpMj
 ywcFHmXrG8+EpoTNnkGc88ZGtKZzbBIg3Fi4xeeVijwWhHtlQq9GC4Fr8tQtQUHF
 QAOY+r05BLrQZOZP6CfJluPLoVxO2j/0u5Wpb0Xf6omQXpBVneQCm7wdxZ1PXgto
 ADgktdBup4E0zffkCjJHUZWI1b7/Ay+EpuvoDRjRTlB8DEFWiGalttcuO0kIPu/g
 ==
X-ME-Sender: <xms:958BYCk63u4jU_iZQw2Cd0tfcRXm7R1sWXHWT9WWuK3opUToMa5wRQ>
 <xme:958BYJ21odC4KQJUTKHSoTYi65xedw0QG59ekmX1baVUEEM08kdtYVDhypIRolMPC
 8FcTo4VhK1Hcc81GOs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:958BYAq6Iaid2vuxfiL6HYj9Bn8Jdggri77fvSqq_28rLHcVBcpO7Q>
 <xmx:958BYGmenFWdAmsjf2UcS4pp9Frhj-mTz6VZivsCpiuQknMdhGeTmg>
 <xmx:958BYA2NEX1-SHDbenKBKJh7auFEizylcOSdhr0eLBT_l2rM9wit7g>
 <xmx:-J8BYDQrz09QpR37_OaQMWFafWfUSPeIFB-yitPAMi2f-iWWZ_RPlg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8E8491080057;
 Fri, 15 Jan 2021 09:00:22 -0500 (EST)
Date: Fri, 15 Jan 2021 15:00:20 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH] hw/block/nvme: add zoned I/O commands to nvme_io_opc_str()
Message-ID: <YAGf9NOJwxtufjNx@apples.localdomain>
References: <20210115134845.17618-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DTepGJfl2guxlbAd"
Content-Disposition: inline
In-Reply-To: <20210115134845.17618-1-minwoo.im.dev@gmail.com>
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--DTepGJfl2guxlbAd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 15 22:48, Minwoo Im wrote:
> Currently, Zoned I/O commands are parsed as unknown:
>   pci_nvme_io_cmd cid 768 nsid 1 sqid 4 opc 0x79 opname 'NVME_NVM_CMD_UNK=
NOWN'
>=20
> Parse zoned I/O commands along with other I/O commands to print.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index b7fbcca39d9f..0c1cb6fd2549 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -66,6 +66,9 @@ static inline const char *nvme_io_opc_str(uint8_t opc)
>      case NVME_CMD_READ:             return "NVME_NVM_CMD_READ";
>      case NVME_CMD_WRITE_ZEROES:     return "NVME_NVM_CMD_WRITE_ZEROES";
>      case NVME_CMD_DSM:              return "NVME_NVM_CMD_DSM";
> +    case NVME_CMD_ZONE_MGMT_SEND:   return "NVME_NVM_CMD_ZONE_MGMT_SEND";
> +    case NVME_CMD_ZONE_MGMT_RECV:   return "NVME_NVM_CMD_ZONE_MGMT_RECV";
> +    case NVME_CMD_ZONE_APPEND:      return "NVME_NVM_CMD_ZONE_APPEND";
>      default:                        return "NVME_NVM_CMD_UNKNOWN";
>      }
>  }
> --=20
> 2.17.1
>=20

I have this in a series under review. Compare is also missing ;)

"[PATCH 5/6] hw/block/nvme: add missing string representations for commands"

--DTepGJfl2guxlbAd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmABn/MACgkQTeGvMW1P
DenJzwf+PZwC8zZlllf1zQw6RZ38RI8GvgFISzaDULWa1ybY0OexJkW8TJwj5RaW
ghYXmo2+X35+eSJHTfe883HhQTxeuPjruzwHLWjHdUh49nqIbJ5pRTWSu94a7/sr
iafYwIL9t5yjQyzmwCS7yPkjqAgIhi+d0+waKMDiKguquajUXbyfaOsk/CYEgz9E
l52q8eMCOvWNwtlM7fJgwYR7S/OseahUZxaHU9hiK+fL4O6juhBw7QVrVLf4nG+z
DT7Naqs7J/bydULKuyo3OOI7ZEX0hMKasnHRWsZ2M7947HI6yHJ8VhLh/KeCs+E+
lMXBDYSVEIzhcHWHKOFUkZUZ5D9Z9A==
=2aMq
-----END PGP SIGNATURE-----

--DTepGJfl2guxlbAd--

