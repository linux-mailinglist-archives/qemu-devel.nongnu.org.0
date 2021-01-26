Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3633036FE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 08:03:33 +0100 (CET)
Received: from localhost ([::1]:55030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4INw-00008p-Tm
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 02:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4IIw-0006pG-8F; Tue, 26 Jan 2021 01:58:23 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l4IIt-00047e-NF; Tue, 26 Jan 2021 01:58:21 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 33E295C00F9;
 Tue, 26 Jan 2021 01:58:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Jan 2021 01:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=q6VIPJbUmkSEznJaS6kHJSgiP9x
 IwdiXoM2tDHU9p7o=; b=N0KD3IuX9GEHsW/Qh6frV58nGaCgjaPPNykpqpIrmtD
 HYkvo+njGNvGKhYYbvjr9yHfz9+kjVndGQGvssN0FiBcX9BLbUShl5dVUt7qOv3t
 LF204FbUktb5TI6emdBKHNP2MflH/XwP802S1gv4F7sXP3dY6RHh9lMw1KpMK2yq
 Iy1VkVdBQGUN4JbZRqAGX9VVCqxvNYYgUbZVjRt+hjZ5JBPkHcotj1RFM2TQoSpN
 ITR3TYjsMor8KU6vZlmKf3LehMGMTcmtyJEeQIiRkah4i8HYNWsThhUJ/pozQ+B6
 fuMU8/dlvyvdU/cmESJSCzt0etIWtwSSyxmodwSfLYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=q6VIPJ
 bUmkSEznJaS6kHJSgiP9xIwdiXoM2tDHU9p7o=; b=cNPoHAi0l39iTurJnEYJE4
 wYCSoWwJR4T6yLI4Cvkp715KvKVctKb+Bo03NknnNeeyUN/jHfxdJIVRhvdxRM3+
 32SFOcEy58q4wXjmM5bRqo36qQX3WgCPYyjUCRNrmcdW8Ak8+rAHjJo/BjftLmql
 EuoqmWdkYLmzS/IVxxUWE6LPp4hgmpBnKWdd8+/Vkw8Swl9azxXIuwJfmssuU64q
 c/rWK5r6kNF44HqcGC+aheJvOnRva7Q/SC/h6Xbf1BnlxL2w5dEmFB8o9sK+ztBI
 fC4YuPSfMhpHZIXeR/qQeweBHSuA6eJo4LvtT7pjlYfwtwadbzzjvKGbLXG7rhjA
 ==
X-ME-Sender: <xms:ib0PYP-8f2g7iGY2BcE692EQH3MKC5A9kxntwCSR9pod05f4Qzs3pg>
 <xme:ib0PYLuuOufhzqrVJIvsx1YoG6IjSIBVw1uBUCRQzojnZdFshuHi7EGP_Hbh-UgBY
 11PnDZjz0xUDe89oGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeggdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ib0PYNC_vGIHKcMH5-RQFjmqaa_r-chaY8hNYAEU9tZSwTybvcTo2w>
 <xmx:ib0PYLf3VRf8zJMqkoJiMueo6O5PvEYvkVKk5R0g-Clea5YVImtQxw>
 <xmx:ib0PYEOnIHdrqD9WVq6G89vbT5NRdKqYoVmBvSVxrPHrEKKjwjsoJQ>
 <xmx:ir0PYABg4nZ29ZMAuxd6_C0QIYZLEklPxtnqB3BZpozDXITJdPJgAA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2F12B1080059;
 Tue, 26 Jan 2021 01:58:16 -0500 (EST)
Date: Tue, 26 Jan 2021 07:58:13 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH 1/2] hw/block/nvme: fix zone boundary check for append
Message-ID: <YA+9hUM4648b2oQW@apples.localdomain>
References: <20210119135500.265403-1-its@irrelevant.dk>
 <20210119135500.265403-2-its@irrelevant.dk>
 <16895b0f976dbe50ddde73bf8211a1bf74ba5870.camel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5J/+oUO4KX9xJOgH"
Content-Disposition: inline
In-Reply-To: <16895b0f976dbe50ddde73bf8211a1bf74ba5870.camel@wdc.com>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5J/+oUO4KX9xJOgH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 26 04:55, Dmitry Fomichev wrote:
> On Tue, 2021-01-19 at 14:54 +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > When a zone append is processed the controller checks that validity of
> > the write before assigning the LBA to the append command. This causes
> > the boundary check to be wrong.
> >=20
> > Fix this by checking the write *after* assigning the LBA. Remove the
> > append special case from the nvme_check_zone_write and open code it in
> > nvme_do_write, assigning the slba when basic sanity checks have been
> > performed. Then check the validity of the resulting write like any other
> > write command.
> >=20
>=20
> Klaus,
>=20
> I tested this series and it works fine. I however think that the problem =
that
> Niklas has found can be fixed in the much simpler way by applying the
> following to the existing code -
>=20
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1152,6 +1152,9 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n, =
NvmeNamespace *ns,
>                  trace_pci_nvme_err_append_not_at_start(slba, zone->d.zsl=
ba);
>                  status =3D NVME_INVALID_FIELD;
>              }
> +            if (zone->w_ptr + nlb > nvme_zone_wr_boundary(zone)) {
> +                status =3D NVME_ZONE_BOUNDARY_ERROR;
> +            }
>              if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
>                  trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
>                  status =3D NVME_INVALID_FIELD;
>=20
> I am going to send a few patches that take this approach, please take a l=
ook. In my
> testing, it works just as well :)
>=20
> >=20
> > In the process, also fix a missing endianness conversion for the zone
> > append ALBA.
>=20
> Great catch! This could be placed to a separate patch though...
> A few more comments below.
>=20
>=20
> Reported-by: Niklas Cassel <Niklas.Cassel@wdc.com>
> Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
> =C2=A0hw/block/nvme.c | 46 ++++++++++++++++++++++++----------------------
> =C2=A01 file changed, 24 insertions(+), 22 deletions(-)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 309c26db8ff7..f05dea657b01 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1133,7 +1133,7 @@ static uint16_t nvme_check_zone_state_for_write(Nvm=
eZone *zone)
> =C2=A0
> =C2=A0static uint16_t nvme_check_zone_write(NvmeCtrl *n, NvmeNamespace *n=
s,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0NvmeZone *zone, uint64_t slba,
> -                                      uint32_t nlb, bool append)
> +                                      uint32_t nlb)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint16_t status;
> =C2=A0
> @@ -1147,16 +1147,8 @@ static uint16_t nvme_check_zone_write(NvmeCtrl *n,=
 NvmeNamespace *ns,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0trace_pci_nvme_err_=
zone_write_not_ok(slba, nlb, status);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0assert(nvme_wp_is_v=
alid(zone));
> -        if (append) {
> -            if (unlikely(slba !=3D zone->d.zslba)) {
> -                trace_pci_nvme_err_append_not_at_start(slba, zone->d.zsl=
ba);
> -                status =3D NVME_INVALID_FIELD;
> -            }
> -            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
> -                trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
> -                status =3D NVME_INVALID_FIELD;
> -            }
> -        } else if (unlikely(slba !=3D zone->w_ptr)) {
> +
> +        if (unlikely(slba !=3D zone->w_ptr)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0trace_pci_nvme_err_write_not_at_wp(slba, zone->d.zslba,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0zone->w_p=
tr);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0status =3D NVME_ZONE_INVALID_WRITE;
> @@ -1294,10 +1286,9 @@ static void nvme_finalize_zoned_write(NvmeNamespac=
e *ns, NvmeRequest *req,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0}
> =C2=A0
> -static uint64_t nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
> -                                     uint32_t nlb)
> +static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
> +                                 uint32_t nlb)
> =C2=A0{
> -    uint64_t result =3D zone->w_ptr;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t zs;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0zone->w_ptr +=3D nlb;
> @@ -1313,8 +1304,6 @@ static uint64_t nvme_advance_zone_wp(NvmeNamespace =
*ns, NvmeZone *zone,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0nvme_assign_zone_state(ns, zone, NVME_ZONE_STATE_IMPLICITLY_OPEN);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> -
> -    return result;
> =C2=A0}
>=20
> =C2=A0static inline bool nvme_is_write(NvmeRequest *req)
> @@ -1692,7 +1681,24 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeReq=
uest *req, bool append,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ns->params.zoned) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0zone =3D nvme_get_z=
one_by_slba(ns, slba);
>=20
> -        status =3D nvme_check_zone_write(n, ns, zone, slba, nlb, append);
> +        if (append) {
>=20
> This is what I see as a drawback of this approach.
> You have to move the ZA checks that were previously nicely tucked in
> nvme_check_zone_write() to the spot below and now this validation is done
> in two different places for appends and regular writes. This can be avoid=
ed.
>=20

OK. However this means that other commands that write (Write Zeroes,
Copy) to zones has to go through that special case branch even though it
is a special case of regular writes. This is completely irrelevant for
performance so that's not my point, I just found it cleaner to tuck it
away as a special case in write.

> +            if (unlikely(slba !=3D zone->d.zslba)) {
> +                trace_pci_nvme_err_append_not_at_start(slba, zone->d.zsl=
ba);
> +                status =3D NVME_INVALID_FIELD;
> +                goto invalid;
> +            }
> +
> +            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
> +                trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl);
> +                status =3D NVME_INVALID_FIELD;
> +                goto invalid;
> +            }
> +
> +            slba =3D zone->w_ptr;
> +            res->slba =3D cpu_to_le64(slba);
>=20
> It is a bit premature to set the result here since the nvme_check_zone_wr=
ite() below
> can still fail. As I recall, ALBA is only returned by a successful comman=
d. Again,
> good find about endianness!
>=20

There has always been a branch in finalize that clears it to zero on
error.

My patch also has the effect of not setting ALBA for regular writes. To
change that you are gonna have to add a 'if (append)' special case in
nvme_do_write anyway.

--5J/+oUO4KX9xJOgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAPvYQACgkQTeGvMW1P
DenIIQf+NjSsww6LNWEfosoAvjUerB60fIIMLBDCyR9RyA+/JZXqfTvpv2siJxjR
JPdxjfEYpI2Nq53DUvvBO0EoAkwmp76YD8GI5xBRf34TtX+ruK8bQTVBs+PQRJpW
qQOUY13Q8LASwEVht3OrZg3sW5u39mXLredmnlZvuzvDUICdKUDYTZhPyqOedGKD
Qjh2an91viEPiU/TcyO1KscqE3vDaw+B+UR0hmrdFRX8sUtcdg2LaBaq0pURUPkj
YKGqp8pw1uNiLXp3E1axsAgjCqNYs7KO1hyfcO9Y1/q1haaSBDyj7isfi/9rwPij
VtWgM2iGhIRpiLjRPH3yhFVMCv14TA==
=k0U+
-----END PGP SIGNATURE-----

--5J/+oUO4KX9xJOgH--

