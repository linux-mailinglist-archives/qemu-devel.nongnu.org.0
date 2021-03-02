Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F5329803
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 10:34:30 +0100 (CET)
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH1QD-0005TF-9R
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 04:34:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH1KO-0002Te-Mq; Tue, 02 Mar 2021 04:28:28 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lH1KL-0005os-FL; Tue, 02 Mar 2021 04:28:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 1277C5C019D;
 Tue,  2 Mar 2021 04:28:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 02 Mar 2021 04:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=4qAF1e0FY0b2tD4b80MJjPljwAI
 hfIwrWezkcHvkglc=; b=GQunt0N0JGrjp4Mjq4+WGguWtpUqgzRnvCjr8KK5rIZ
 P3MAlX0TFFiPmf1bo3NyrFtSb4dBZh8H6QmGTJV1RtK0G7JOKoE1i7Ae8kNsbB3h
 Jp0ih0wqrE+XwFmieTngkUTTYJsG7mmihW1rmiwPmeCnBGsZ0B+nOibb44OhvJ8j
 rhd0W2jmzvMsQkeznTr8IBhPqOKqvjpd57vBlj3Bz9G8EfiCYwEOXovqp9Kcv0vH
 j2hwsclEg6VSk7ik8dqsAYH2CeJ2vNfAx0ub8mkV7K7nAz+DIAnLCGMOzsPHt4Ir
 F5ma6i959NO9TlsyPEO8U4ivZLLpRYLa289jY6Gwgug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4qAF1e
 0FY0b2tD4b80MJjPljwAIhfIwrWezkcHvkglc=; b=C6qZDTiwAWqHrcTWFwwQfp
 gLhjeXczin6j11h/3Gf+DZjis3H3UjlCfxGUdrg2zJgyrDhu9tCXwGnO+2UxYBAo
 lPV6TbC+W8kCZMmIgXHAo3+SQ39W+jMoo/JTN91uMWt1CzZ22oU5iGSRRZevafcI
 STB7lNc/C4PgPnbza2sHbuX/VAE1aD20iZC9dkai1a6DHxl0JrR87imAZk0UQlLn
 1LgYDS9OCG6wMYxaSFVCCHaDQusatGvJe9s4NxoMfsP0wOTmkMUoDixvAelRrE2w
 iZh5m3FYvojhzLQv0QHjsMlq0A9b/hF5ZGzmuGCGuwQRyqslPRw4uc+x16McqZ3g
 ==
X-ME-Sender: <xms:NwU-YOnn22iqp28_qNngwQTZO-erwPfd_bVba5KFUh8B1gYvJ0GJ3w>
 <xme:NwU-YF0wv1iznhz_gPfHNIsR9GsRZxujidBgqePMfu6g-9JW91tJgjVtcENFZR7zv
 Bnd3GCPoeW2s4Tn2no>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NwU-YMp998G0i2pV2uciNbhs5-UlTBUCWHRwNwzncKgbMDdKPjLPjA>
 <xmx:NwU-YCl3f1jD74uuHHnG8h8Mrc2AoxI7gfv7D7JqNtMJF_Osx-yBQg>
 <xmx:NwU-YM1WZNcUeXDduEC3Y7c7ole0FhCVRYCaWPRqI3_WHqA465wqkA>
 <xmx:OAU-YPSixcJZmofr3PU0-bFOrcoAx1Vhoc0xmA40m479c4CsEQjpTQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4FB441080064;
 Tue,  2 Mar 2021 04:28:22 -0500 (EST)
Date: Tue, 2 Mar 2021 10:28:20 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V3 7/8] hw/block/nvme: support changed namespace
 asyncrohous event
Message-ID: <YD4FNK0/yOEnu5J3@apples.localdomain>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
 <20210228161100.54015-8-minwoo.im.dev@gmail.com>
 <YDyB8m//9Mh3whCI@apples.localdomain>
 <20210302092643.GA2136@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fGwQYZ1vuBBaFIy7"
Content-Disposition: inline
In-Reply-To: <20210302092643.GA2136@localhost.localdomain>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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


--fGwQYZ1vuBBaFIy7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  2 18:26, Minwoo Im wrote:
> On 21-03-01 06:56:02, Klaus Jensen wrote:
> > On Mar  1 01:10, Minwoo Im wrote:
> > > If namespace inventory is changed due to some reasons (e.g., namespace
> > > attachment/detachment), controller can send out event notifier to the
> > > host to manage namespaces.
> > >=20
> > > This patch sends out the AEN to the host after either attach or detach
> > > namespaces from controllers.  To support clear of the event from the
> > > controller, this patch also implemented Get Log Page command for Chan=
ged
> > > Namespace List log type.  To return namespace id list through the
> > > command, when namespace inventory is updated, id is added to the
> > > per-controller list (changed_ns_list).
> > >=20
> > > To indicate the support of this async event, this patch set
> > > OAES(Optional Asynchronous Events Supported) in Identify Controller d=
ata
> > > structure.
> > >=20
> > > Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > > ---
> > >  hw/block/nvme.c      | 44 ++++++++++++++++++++++++++++++++++++++++++=
++
> > >  hw/block/nvme.h      |  7 +++++++
> > >  include/block/nvme.h |  7 +++++++
> > >  3 files changed, 58 insertions(+)
> > >=20
> > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > index 68c2e63d9412..fc06f806e58e 100644
> > > --- a/hw/block/nvme.c
> > > +++ b/hw/block/nvme.c
> > > @@ -2980,6 +2980,32 @@ static uint16_t nvme_error_info(NvmeCtrl *n, u=
int8_t rae, uint32_t buf_len,
> > >                      DMA_DIRECTION_FROM_DEVICE, req);
> > >  }
> > > =20
> > > +static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32=
_t buf_len,
> > > +                                    uint64_t off, NvmeRequest *req)
> > > +{
> > > +    uint32_t nslist[1024];
> > > +    uint32_t trans_len;
> > > +    NvmeChangedNs *ns, *next;
> > > +    int i =3D 0;
> > > +
> > > +    memset(nslist, 0x0, sizeof(nslist));
> > > +    trans_len =3D MIN(sizeof(nslist) - off, buf_len);
> > > +
> > > +    QTAILQ_FOREACH_SAFE(ns, &n->changed_ns_list, entry, next) {
> > > +        nslist[i++] =3D ns->nsid;
> > > +
> > > +        QTAILQ_REMOVE(&n->changed_ns_list, ns, entry);
> > > +        g_free(ns);
> > > +    }
> > > +
> > > +    if (!rae) {
> > > +        nvme_clear_events(n, NVME_AER_TYPE_NOTICE);
> > > +    }
> > > +
> > > +    return nvme_dma(n, ((uint8_t *)nslist) + off, trans_len,
> > > +                    DMA_DIRECTION_FROM_DEVICE, req);
> > > +}
> > > +
> > >  static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t =
buf_len,
> > >                                   uint64_t off, NvmeRequest *req)
> > >  {
> > > @@ -3064,6 +3090,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeR=
equest *req)
> > >          return nvme_smart_info(n, rae, len, off, req);
> > >      case NVME_LOG_FW_SLOT_INFO:
> > >          return nvme_fw_log_info(n, len, off, req);
> > > +    case NVME_LOG_CHANGED_NSLIST:
> > > +        return nvme_changed_nslist(n, rae, len, off, req);
> > >      case NVME_LOG_CMD_EFFECTS:
> > >          return nvme_cmd_effects(n, csi, len, off, req);
> > >      default:
> > > @@ -3882,6 +3910,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n,=
 NvmeRequest *req)
> > >      uint16_t *ids =3D &list[1];
> > >      uint16_t ret;
> > >      int i;
> > > +    NvmeChangedNs *changed_nsid;
> > > =20
> > >      trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
> > > =20
> > > @@ -3920,6 +3949,18 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n=
, NvmeRequest *req)
> > > =20
> > >              nvme_ns_detach(ctrl, ns);
> > >          }
> > > +
> > > +        /*
> > > +         * Add namespace id to the changed namespace id list for eve=
nt clearing
> > > +         * via Get Log Page command.
> > > +         */
> > > +        changed_nsid =3D g_new(NvmeChangedNs, 1);
> > > +        changed_nsid->nsid =3D nsid;
> > > +        QTAILQ_INSERT_TAIL(&ctrl->changed_ns_list, changed_nsid, ent=
ry);
> > > +
> > > +        nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
> > > +                           NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
> > > +                           NVME_LOG_CHANGED_NSLIST);
> > >      }
> >=20
> > If one just keeps attaching/detaching we end up with more than 1024
> > entries here and go out of bounds in nvme_changed_nslist.
> >=20
> > How about having the QTAILQ_ENTRY directly on the NvmeNamespace struct
> > and use QTAILQ_IN_USE to check if the namespace is already in the list?
>=20
> QTAILQ_IN_USE might be tough to represent relationship between
> controller and namespace itself.  So, I will work on this with standard
> bitmap rather than the list.  I think bitmap will be easier to represent
> the relationship.

OK, sounds reasonable!

--fGwQYZ1vuBBaFIy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA+BS4ACgkQTeGvMW1P
DemWUQf/f9ZW+ojTztSClrtGZY2fCqlI1ImvjBPhi+FHpDukWTD9wYaKyLEKvVyq
ItsdnwY5KA0SyfXfS1vYG0wQAg248nfdI0Mhp+FMqQ90q+TFr7QElFmhfMn8Lc1S
j85WmjQ7Mzy0a5XM96DhbNCB7wcqHMG6VZ1Z44s7oV388RkbP8KzjDfUX2sTgXIz
Z74sRKkxmzqcE0IaFEYLYheTRTAlYQb3DGwACRafhObWrM3A3y0o35yJpKC0LD3n
tP/FeLuUhiX5sqcqpYWiCZt3pxajjhoTerA67hhjY/G6V260PIx+GkmwkL1W6eRj
TJikFZC0D+X808qIwG8H/VT/vJJajA==
=GhRH
-----END PGP SIGNATURE-----

--fGwQYZ1vuBBaFIy7--

