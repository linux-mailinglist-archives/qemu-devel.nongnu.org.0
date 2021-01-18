Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EB82F9BEC
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:39:06 +0100 (CET)
Received: from localhost ([::1]:55724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1R04-0001PW-QG
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1QvZ-0000HE-6A; Mon, 18 Jan 2021 04:34:25 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1QvW-00030Q-SU; Mon, 18 Jan 2021 04:34:24 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 76AB85C0186;
 Mon, 18 Jan 2021 04:34:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 04:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=DiEH6eM9vROcx6ph5ZI7m7f2FC6
 9lFKTZevubs9QzjU=; b=xiK2yTPLh0u31FzWudME1gth3OVP7fLHsW7rE3scIpC
 Sl74qhDPHq1XwZim7YDr6HIEpjOMGi3UO72Wn2qQ7C4XuMj8i/CC6pDp9x9F2a7/
 DvKaXq1wuJH3wTc0+J2V5q+tHNOyGsHbQifzbE4VS4bfNRDeLmdyxOPvMEG4IEVH
 w0G53hyk/7hpV9NNoVsIrU4x7pSxG4MqsnZe7G5k/t3xug1tHJl99+ui6PXpwjRj
 aAYkRBhkQPG/b74v3ks3zE+eMd6ZUwhthke50TJ0scfPmD180SYIL3oj+do5pxm+
 ZX3/oCOGHe9Hq0TtJqjA6hxENz7ftSPoclaQTKrJCKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DiEH6e
 M9vROcx6ph5ZI7m7f2FC69lFKTZevubs9QzjU=; b=lEWS5RkZOCKZMTN0irv26M
 r8H6oagnuG/W6TKw6c4enrslQ0gjqNkvyBmiIkJbZQx4uJLMNZHtzqqdbYOnUiEm
 ryA69eXV6Ov4VMZqALJnpKLxgdBX63aVxk33YK/SDMjlElMpCU8POkYuJ9yUeoKi
 OaCu2jNr6N1ixmco4j22Gha1SUqk1nTGT9DijAh2cpz7F79YvE20dlxbE2ac0K1Z
 ijE0J7hz2oIvh+YuFVHOiRXyPric1FxHDNe4NXM09c52JND2fo8bmotpihOhpmLj
 4shHGfikZSzjhhCfiFkPlk7IblMexoZ2hNOTMyNVlYeuV/Dm7KJzMbji1aK/glKg
 ==
X-ME-Sender: <xms:HFYFYB1nXMFJPnCR980jbCIFI6fx8L_vaKEb-lF6AnLxKSw-q0TdTw>
 <xme:HFYFYIERrtXxO-h3ebZ3VbUHlWLegvpOJTOLnUrHML46C_swMqDL7tL7eogW4Uvrg
 jTdFgwdxmyBihlevR4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HFYFYB6yI1fE90YioEJ1LKbKD_x1Ws3x1aUas0DDQQeeMaKRlxE2hg>
 <xmx:HFYFYO02xahye4pZ0GnpUicen0Xn5MB-BjNR8Mc-KcQoH09GDFM3dg>
 <xmx:HFYFYEEVEXDRXMffyLndv2wv3QnaehjpEDRmixLTOcxvj--VxEG85g>
 <xmx:HVYFYJOEz19MycnLhPAEsidUgdJzoNnjvatqPvZGHTzkNQBHoenn9Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56184108005B;
 Mon, 18 Jan 2021 04:34:19 -0500 (EST)
Date: Mon, 18 Jan 2021 10:34:16 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v4 0/3] support NVMe smart critial warning injection
Message-ID: <YAVWGC4HKFlaKolQ@apples.localdomain>
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iuaYio6o20RFWdv/"
Content-Disposition: inline
In-Reply-To: <20210115032702.466631-1-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--iuaYio6o20RFWdv/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 15 11:26, zhenwei pi wrote:
> v3 -> v4:
> - Drop "Fix overwritten bar.cap". (Already fixed)
>=20
> - Avoid to enqueue the duplicate event.
>=20
> - Several minor changes for coding style & function/variable name.
>=20
> v2 -> v3:
> - Introduce "Persistent Memory Region has become read-only or
>   unreliable"
>=20
> - Fix overwritten bar.cap
>=20
> - Check smart critical warning value from QOM.
>=20
> - Trigger asynchronous event during smart warning injection.
>=20
> v1 -> v2:
> - Suggested by Philippe & Klaus, set/get smart_critical_warning by QMP.
>=20
> v1:
> - Add smart_critical_warning for nvme device which can be set by QEMU
>   command line to emulate hardware error.
>=20
> Zhenwei Pi (3):
>   block/nvme: introduce bit 5 for critical warning
>   hw/block/nvme: add smart_critical_warning property
>   hw/blocl/nvme: trigger async event during injecting smart warning
>=20
>  hw/block/nvme.c      | 91 +++++++++++++++++++++++++++++++++++++++-----
>  hw/block/nvme.h      |  1 +
>  include/block/nvme.h |  3 ++
>  3 files changed, 86 insertions(+), 9 deletions(-)
>=20

This looks pretty good to me.

I think maybe we want to handle the duplicate event stuff more generally
=66rom the AER/AEN code, but this does the job.

Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--iuaYio6o20RFWdv/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAFVhcACgkQTeGvMW1P
DekObwgAxUSptyY5t1X2Gnl4664ndqKOJa0+nj+HwBjqG+PYSJNPdIa7qghxPBi6
RtfuJezuBs5WwR2+gxI4XJz9vALQkwjAM9BmjHETPH0FKEs+IigbLqarCkFJhJgQ
QOQAfmXBKB1ZaR6uAhvi9XsRO6rTLOt9K0R0D0Vc4hZ3NGWfdt/K1bD3EMJO8c4A
inSEauZXsjbeoQ3HvbGK1/T0H1rFjYTQLUKDIVCREAyBIW5XDaZA6VpnJLpBVn40
mCumHOFNE6szgSwbHR62LGPw04en88wHL795Jvo4mFp2BOlpA8HVw0IBfJZsqDJt
Vb54btNTGHgk6Njy1Fda57lbwUzOAw==
=6pT0
-----END PGP SIGNATURE-----

--iuaYio6o20RFWdv/--

