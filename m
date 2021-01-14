Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0D2F5C95
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 09:42:58 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzyDZ-0000FS-QN
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 03:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzy19-0007B9-74; Thu, 14 Jan 2021 03:30:07 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:42463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kzy15-0007yG-Mv; Thu, 14 Jan 2021 03:30:06 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 305CE14C6;
 Thu, 14 Jan 2021 03:30:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 14 Jan 2021 03:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oMKM9oC9BHEIFPXLSREVgh0C7ri
 IhOzLqdHl3qZCvJ8=; b=lhJDZ+ldvf932vJYkzUmUjHC9aW9VW11Iv4apOMVYfw
 nNyqp6UXf/V1lkm0Fu74GoMdOWHmpO67A1mY1zhJi+efaZpNHIKylTIC6rAwr2ea
 dW+cqy7KS/f2WWi5JhhksNTpCs95XLKuZdfoCZeDxOHvtPJADLMLnJaI9SYOu4Sf
 sqHOsTFp3Ck7D1hYO7Ki4NLpT9F0swwb1Pf8V7T9VSSM/xipxASXe313aCuzb3AF
 /s07Uc/dkY3Otb+42DePewlPTJm9VLFwOyQmZQJ+mBCGK4mGBbI90APk84V0MCvp
 zDpN0UzYSnFvJ2669f8RBAOxQd2TeQtEl4/OjVfS9Xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oMKM9o
 C9BHEIFPXLSREVgh0C7riIhOzLqdHl3qZCvJ8=; b=gH5zGrDv/x22k55t1K4Sf4
 wUiqPf/pIa3wtsK3jYftautvpTodzaWxdbC4gkkhiuZJIjk6+M7ix6izmEgOUgHA
 MR3DaatIv1D//zaQxXkqVhZ+vetnRQCJDwwskxy7ZlykenJHOQhDSwlLyhu+Q5ul
 gb+gjpJ01VCFVrwDirbamY/GviMVOhS4VtYCbetUdJyQLQ4T0cBFo4TOlCG67FCB
 0/m/BrE5hBEyqI+UzbKawjtv7sB7XwiPU1RMVgIGYwyRbVYTMsTjelvb4JMLCpC7
 jBf4Zxo5Jpzau9R5Fcgjw/G5HHFjwhBmxpsT3CghEREUS4yCPW5n3C4u7Fs2Uj+w
 ==
X-ME-Sender: <xms:CAEAYK6ME5ByrU9RgZkFgWjj2DSXFUUHoQDN7d6nWKoY8BD_pznBow>
 <xme:CAEAYD5WFcVNy6vXAXyEfbl2rqfgDn74LO8sRTqHug3SDBSsjRf9XkZCFKCaTSPIU
 Qr1D0fTC5KhpH4j-LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdduvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:CAEAYJfEGVIBU-_yeAAOfTmNhdeeKyIn3avYWSopR0aORKLOAlbDwg>
 <xmx:CAEAYHLKr43EOkpmceAttSfpzluACGFwL3h4lcMxth1QmpLe6eNsjQ>
 <xmx:CAEAYOJiF_2Ats8iUprS-j-x-UvEFMPeocgNuZHtL-HO_VuRiZqt4g>
 <xmx:CAEAYAjRqSVkIQ4tE3AWw10UEzDfwuWSUH_jmlWBDWXRdwjQeuxnJQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2901C24005C;
 Thu, 14 Jan 2021 03:29:59 -0500 (EST)
Date: Thu, 14 Jan 2021 09:29:57 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [PATCH v3 3/4] hw/block/nvme: add smart_critical_warning property
Message-ID: <YAABBZzCY3bebgDB@apples.localdomain>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
 <20210114072251.334304-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0cwo47Fhivbsw3sL"
Content-Disposition: inline
In-Reply-To: <20210114072251.334304-4-pizhenwei@bytedance.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0cwo47Fhivbsw3sL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 14 15:22, zhenwei pi wrote:
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
> ---
>  hw/block/nvme.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  hw/block/nvme.h |  1 +
>  2 files changed, 41 insertions(+)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index f361103bb4..ce9a9c9023 100644
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
> @@ -2826,6 +2827,41 @@ static Property nvme_props[] =3D {
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
> +    uint8_t value, cap =3D 0;
> +    uint64_t pmr_cap =3D CAP_PMR_MASK;
> +
> +    if (!visit_type_uint8(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    cap =3D NVME_SMART_SPARE | NVME_SMART_TEMPERATURE | NVME_SMART_RELIA=
BILITY
> +          | NVME_SMART_MEDIA_READ_ONLY | NVME_SMART_FAILED_VOLATILE_MEDI=
A;
> +    if (s->bar.cap & (pmr_cap << CAP_PMR_SHIFT)) {
> +        cap |=3D NVME_SMART_PMR_UNRELIABLE;
> +    }

Looks like an NVME_CAP_PMRS(cap) macro is missing in
include/block/nvme.h. I have added it in another PMR series under
review, but you can add it here as well instead of manually doing the
shift and check.

> +
> +    if ((value & cap) !=3D value) {
> +        error_setg(errp, "unsupported smart critical warning value");
> +        return;
> +    }
> +
> +    s->smart_critical_warning =3D value;
> +}
> +
>  static const VMStateDescription nvme_vmstate =3D {
>      .name =3D "nvme",
>      .unmigratable =3D 1,
> @@ -2856,6 +2892,10 @@ static void nvme_instance_init(Object *obj)
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

--0cwo47Fhivbsw3sL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAAAQMACgkQTeGvMW1P
DelKtAf/TIES0Xl1q105GUCTLL7veTA+LaJDF/TdVEo2JxfIkczW3zfugEyohL5t
mO6bkLYLZYNwkRWWnTMdWpNbeY5hIGickqVlrJqz8S5tgAD6rWTWQQpTdAar3+0l
KMye/vQrfuj9K7qy4dxAwT6RCYPqTEfTacrL9KjUgNdqqnqiwVR0wPxxdIytX00V
ztUydPAjVIhcDLrL2ikriorHPoENxj8HQ1yjcOJs+psH37Pfvq9jEwJKJFMO/vXv
tRL90vxbs+HOcO7kCjmyFNPqT9gm0GWFxyerPHl8XYil3UAbkY+Zs/r1WdlujmTA
8U6S5NqHpXc6Z69Kkhu6gOd/ak9Hyg==
=FhMx
-----END PGP SIGNATURE-----

--0cwo47Fhivbsw3sL--

