Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4EC2F2D41
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:56:18 +0100 (CET)
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHLV-0004Lz-2j
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:56:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzH57-0004aN-He; Tue, 12 Jan 2021 05:39:21 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:49461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzH54-0001Lk-Rx; Tue, 12 Jan 2021 05:39:21 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1E5661B1C;
 Tue, 12 Jan 2021 05:39:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 12 Jan 2021 05:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=f7DD6dGG59PZ15vEJEGDhD7RwcG
 oqtvGbZaR33P6ZeU=; b=C8UwD+OT4V7elGQmrRuTR5I/lNIc8Vq0tWz2SaErv+7
 BcY7YgXh2GnpV6gdQufZpl8E43b3f1/wJvIIhvwa48mJiOzbm98BS98magSvGgYg
 Ojq/zv5KaB465xc4/OCCf3WLgmHpYm8hTJ/I0BTz08TQBHOTepm5smul3LRQ5Gxk
 y/ue/YRsUNZ3DtT//ZvubERSiAJhxexYJNHD4dew1B4BARF5oW61an88zezZxrwj
 tkpMyK8fLdlVtnqOtaVz7aGT3MgfBn2GuMH4ZqucL6cp288WMxAAiTs65HwGHYhf
 MDEiuX1F5IwB4M0TX2pShWVpfDw/kIDbFhN2seEpMTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=f7DD6d
 GG59PZ15vEJEGDhD7RwcGoqtvGbZaR33P6ZeU=; b=KKxW6F4KxHMWltme3DRn33
 REv3N2R7LDv7wyFisolyAj7m/HBH7VCOQ7jyi5lV0+CB82tIxZ3PDFGZozOPJAMA
 EPmtAYmyx9jSHdqSmdggMJanxATVaZpU33PSPYRkWA7ckAbVcNU/RmhBXaFPNUl/
 Tt7KqsZZGb/te/ORB9ovktVdxv6hJ5uOe1/xRHJppPIzPNTjEo1wmWREAw+0HCbL
 KtzmlN4HMdiWAS0WEDFWfqOEY3tROd23Jcpqfwm0cqyhgC+9/BQwM/Bvn+sSk3I8
 iEQ7q6VhZn25PkzhtcRRqsk/H1gZl8QcH4yAP7ZomHPQGInOMZAeObahDtH14T3A
 ==
X-ME-Sender: <xms:U3z9X9J4B0dx5cf4yHu1gZ5cayuZiR-uTjkDAUUdN8C8E-ZzwCvXTA>
 <xme:U3z9X5I5SbrW4U39klutfRonMrMcBBX-_dG5q4qv37yPe7YBhC6K5wSHQCfroVgrT
 Nt8kMlVZFZeTiI0p0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehgedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:U3z9X1sH38A5lEF-kBg70U3pUm7nmVjavBcZGQmBbgnZooZxk8ZlWw>
 <xmx:U3z9X-ZPWXasKRHMnXEY_ugVU5qyvYXmKjz6iP4lfcQQpQvt__qA0g>
 <xmx:U3z9X0ZtG_poC7UYePYmhzuIgMDo9DJY1ofpc5yuP4t7N2ZavccL8w>
 <xmx:U3z9Xzyc6vtoGhdV3bqDtEZWvJblzBTLxZXNqEiTRVHSRppP9Z_i6w>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E975024005C;
 Tue, 12 Jan 2021 05:39:13 -0500 (EST)
Date: Tue, 12 Jan 2021 11:39:11 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v2 1/1] hw/block/nvme: add smart_critical_warning property
Message-ID: <X/18T0lAM9zhj/7k@apples.localdomain>
References: <20210112074924.217862-1-pizhenwei@bytedance.com>
 <20210112074924.217862-2-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZIc+pXTxUHyqe9/8"
Content-Disposition: inline
In-Reply-To: <20210112074924.217862-2-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ZIc+pXTxUHyqe9/8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 12 15:49, zhenwei pi wrote:
> There is a very low probability that hitting physical NVMe disk
> hardware critical warning case, it's hard to write & test a monitor
> agent service.
>=20
> For debugging purposes, add a new 'smart_critical_warning' property
> to emulate this situation.
>=20
> The orignal version of this change is implemented by adding a fixed
> property which could be initialized by QEMU command line. Suggested
> by Philippe & Klaus, rework like current version.
>=20
> Test with this patch:
> 1, change smart_critical_warning property for a running VM:
>  #virsh qemu-monitor-command nvme-upstream '{ "execute": "qom-set",
>   "arguments": { "path": "/machine/peripheral-anon/device[0]",
>   "property": "smart_critical_warning", "value":16 } }'
> 2, run smartctl in guest
>  #smartctl -H -l error /dev/nvme0n1
>=20
>   =3D=3D=3D START OF SMART DATA SECTION =3D=3D=3D
>   SMART overall-health self-assessment test result: FAILED!
>   - volatile memory backup device has failed
>=20
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>

I think we also need to check the asynchronous event configuration and
issue an AEN if required like we do when the temperature threshold
changes.

Philippe, what are the locking semantics here? This runs under the big
lock?

> ---
>  hw/block/nvme.c | 28 ++++++++++++++++++++++++++++
>  hw/block/nvme.h |  1 +
>  2 files changed, 29 insertions(+)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 27d2c72716..a98757b6a1 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1214,6 +1214,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_=
t rae, uint32_t buf_len,
>      }
> =20
>      trans_len =3D MIN(sizeof(smart) - off, buf_len);
> +    smart.critical_warning =3D n->smart_critical_warning;
> =20
>      smart.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.units_re=
ad,
>                                                          1000));
> @@ -2827,6 +2828,29 @@ static Property nvme_props[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> +
> +static void nvme_get_smart_warning(Object *obj, Visitor *v, const char *=
name,
> +                                   void *opaque, Error **errp)
> +{
> +    NvmeCtrl *s =3D NVME(obj);
> +    uint8_t value =3D s->smart_critical_warning;
> +
> +    visit_type_uint8(v, name, &value, errp);
> +}
> +
> +static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *=
name,
> +                                   void *opaque, Error **errp)
> +{
> +    NvmeCtrl *s =3D NVME(obj);
> +    uint8_t value;
> +
> +    if (!visit_type_uint8(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    s->smart_critical_warning =3D value;
> +}
> +
>  static const VMStateDescription nvme_vmstate =3D {
>      .name =3D "nvme",
>      .unmigratable =3D 1,
> @@ -2857,6 +2881,10 @@ static void nvme_instance_init(Object *obj)
>                                        "bootindex", "/namespace@1,0",
>                                        DEVICE(obj));
>      }
> +
> +    object_property_add(obj, "smart_critical_warning", "uint8",
> +                        nvme_get_smart_warning,
> +                        nvme_set_smart_warning, NULL, NULL);
>  }
> =20
>  static const TypeInfo nvme_info =3D {
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index e080a2318a..64e3497244 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -139,6 +139,7 @@ typedef struct NvmeCtrl {
>      uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
>      uint64_t    starttime_ms;
>      uint16_t    temperature;
> +    uint8_t     smart_critical_warning;
> =20
>      HostMemoryBackend *pmrdev;
> =20
> --=20
> 2.25.1
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--ZIc+pXTxUHyqe9/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/9fE0ACgkQTeGvMW1P
Dek3fAgAwBa+g5q/pFwz8TYwdI6OtWOc22VQ0BeU5/Gh0o0KEEB9twzHLDSgx44V
gMpyoIgthC2l7oTdYm31RLCCD3RjPRSDNck8FOuUktDDmiF+MQP01lWXz9jaMKNe
92Uft+d2Un+SWNCG8bbXcO9X9WhqS/Z71RiN0Gzg7NJNgCNapFq9wPPhB0KKFEn8
t0tMwYk3j98tl5o6gmqH5xH0GG8K9NGtZWKDKInd0rr3nVSX1BgnmPtez61B6Rlc
Gb03HGOprY+8z6KzKSWGGIo+wjIZk5AQG6T7+iELsK244bgK7xKyszcJVGBAKm25
38h9kEIBNhHKBtuNwi68tx7nulvmDg==
=E1PZ
-----END PGP SIGNATURE-----

--ZIc+pXTxUHyqe9/8--

