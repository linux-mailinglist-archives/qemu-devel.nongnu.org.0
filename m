Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B3B39D966
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 12:13:47 +0200 (CEST)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqCGQ-0008Al-4M
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 06:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqC7m-0005fh-VG; Mon, 07 Jun 2021 06:04:50 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqC7k-0008Js-7w; Mon, 07 Jun 2021 06:04:50 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id C68B5189F;
 Mon,  7 Jun 2021 06:04:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 07 Jun 2021 06:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=vHZb9OmwERYob1SGJHpoZvPt+aN
 0WPRGYdoltbmDlXw=; b=KOp6aHsVk9OpO3Pf6KumX+dPJFTgn6gorjSMIMD4V/8
 lpmsdwTklWAyjCgyliSZodZA58SAI65/THP0pWx8jr0NnbiWKlSDVFFNHUh8memZ
 ExtCJZSv/XZyTZLJ3KAFIFywy5hXMM7YYKBgAXW14DgqZLBUF6Rz8d2mUZoJ47Gv
 Yzz4zT/ftfF0vgeFzogaTqu5OvThTMAbVtWGxHdictlFRRmsmps6nTusXpRw4kiu
 TcHX3hHmceX3lOMqyLqXIooO2buFVMbiJI3FlYR70NPdYcD33kyHNQ/Q9CoPpJq4
 fFtyFHlrE6IitrIVk0rLuDYOvlyQ7qZotBhxtTRbXDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vHZb9O
 mwERYob1SGJHpoZvPt+aN0WPRGYdoltbmDlXw=; b=PCZabAhuaigQqI2nLHhaw9
 H89bYoENxRLswIe3d7I0DIvgObu/fJMb0etS3a8w/jCEk9Fxe88L8tZxN+iXJoWC
 jb6Mb7eZEqPM7uRfoS4UPsDIY8fMj2lz99pk9XiGzey684mHvg2nklp+WfRvc/uN
 SEN8kv7cRuPry8UCuFBG5mHvZd1ga8flMgqcEsJGch1YFf8uJaffR2nvrT1bQSmi
 a2fi9giQZ1nRenfMzY9YoMt5KhjhEA6OigN1OjqPLyGWJ23OSl8p51mB8bqzC3eY
 PfU5R8l/QDMbx32Ji3g/gyStZmy7WNdHVKpzaYoLwE6svrc3h8q3aOs6YRog7biA
 ==
X-ME-Sender: <xms:PO-9YEusDvan0JjFErUNiJPE1NtfFobftvQoeEvO-Os9oR7RsIXfPg>
 <xme:PO-9YBfaJBr-6WXjs3wX1stKrN9bo4EQ9GJUxrNollnnIk3COpfSzVvaDqTNOHpiH
 GVM6cehNK5cFgZICpE>
X-ME-Received: <xmr:PO-9YPzdNTRCLRapPBjBdyrfhro3808Lm-fE3HFEDLJdMhBxwpLLEzSo-M2HW5LmMHbVM9etStcUD4f6qZodGETs9LBBE3nPV6M0ZzHzVGRKD-e5XQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:PO-9YHNYkxExEyhE102GPrpTI64uL2cXQJ5nLOKuQzDughnpPWf7bQ>
 <xmx:PO-9YE-_e108wyVSfFBOrnmDRFaPmrUa9Tw3Orr_c-JO9WkB0PzaUA>
 <xmx:PO-9YPUKTFs6-Q3n1Gi7v4ivP8DxVhNl4Zg_mA_J6Nv-9yWkV-eofA>
 <xmx:Pe-9YDb6rKVOaVr1U946n6nl_nwFX6kg05B-EtSz_xH5ODDYNnzNcQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 06:04:43 -0400 (EDT)
Date: Mon, 7 Jun 2021 12:04:42 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Message-ID: <YL3vOlOoOoHodaxz@apples.localdomain>
References: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
 <YLDSfrUIPaZxk6VD@apples.localdomain> <YLUD4BggUinxUBGl@x1-carbon>
 <YLU7aJDjk8L8JMIi@apples.localdomain> <YLXiDGRgboJc6RUu@x1-carbon>
 <YL3suv6IRJfoHl0u@apples.localdomain> <YL3t3RJ8exPXcYJc@x1-carbon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UfFdztKjkz+5NcT/"
Content-Disposition: inline
In-Reply-To: <YL3t3RJ8exPXcYJc@x1-carbon>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "kbusch@kernel.org" <kbusch@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--UfFdztKjkz+5NcT/
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  7 09:58, Niklas Cassel wrote:
>On Mon, Jun 07, 2021 at 11:54:02AM +0200, Klaus Jensen wrote:
>> On Jun  1 07:30, Niklas Cassel wrote:
>> > On Mon, May 31, 2021 at 09:39:20PM +0200, Klaus Jensen wrote:
>> > > On May 31 15:42, Niklas Cassel wrote:
>> > > > On Fri, May 28, 2021 at 01:22:38PM +0200, Klaus Jensen wrote:
>> > > > > On May 28 11:05, Niklas Cassel wrote:
>> > > > > > From: Niklas Cassel <niklas.cassel@wdc.com>
>> > > > > >
>> > > > > > In the Zoned Namespace Command Set Specification, chapter
>> > > > > > 2.5.1 Managing resources
>> > > > > >
>> > > > > > "The controller may transition zones in the ZSIO:Implicitly Op=
ened state
>> > > > > > to the ZSC:Closed state for resource management purposes."
>> > > > > >
>> > > > > > The word may in this sentence means that automatically transit=
ioning
>> > > > > > an implicitly opened zone to closed is completely optional.
>> > > > > >
>> > > > > > Add a new parameter so that the user can control if this autom=
atic
>> > > > > > transitioning should be performed or not.
>> > > > > >
>> > > > > > Being able to control this can help with verifying that e.g. a=
 user-space
>> > > > > > program behaves properly even without this optional ZNS featur=
e.
>> > > > > >
>> > > > > > The default value is set to true, in order to not change the e=
xisting
>> > > > > > behavior.
>> > > > > >
>> > > > > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>> > > > > > ---
>> > > > > > hw/nvme/ctrl.c | 9 ++++++++-
>> > > > > > hw/nvme/ns.c   | 2 ++
>> > > > > > hw/nvme/nvme.h | 1 +
>> > > > > > 3 files changed, 11 insertions(+), 1 deletion(-)
>> > > > > >
>> > > > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> > > > > > index 40a7efcea9..d00f0297a5 100644
>> > > > > > --- a/hw/nvme/ctrl.c
>> > > > > > +++ b/hw/nvme/ctrl.c
>> > > > > > @@ -141,6 +141,11 @@
>> > > > > >  *
>> > > > > >  *     zoned.cross_read=3D<enable RAZB, default: false>
>> > > > > >  *         Setting this property to true enables Read Across Z=
one Boundaries.
>> > > > > > + *
>> > > > > > + *     zoned.auto_transition=3D<enable auto resource manageme=
nt, default: true>
>> > > > > > + *         Indicates if zones in zone state implicitly opened=
 can be
>> > > > > > + *         automatically transitioned to zone state closed fo=
r resource
>> > > > > > + *         management purposes.
>> > > > > >  */
>> > > > > >
>> > > > > > #include "qemu/osdep.h"
>> > > > > > @@ -1699,7 +1704,9 @@ static uint16_t nvme_zrm_open_flags(Nvme=
Namespace *ns, NvmeZone *zone,
>> > > > > >         /* fallthrough */
>> > > > > >
>> > > > > >     case NVME_ZONE_STATE_CLOSED:
>> > > > > > -        nvme_zrm_auto_transition_zone(ns);
>> > > > > > +        if (ns->params.auto_transition_zones) {
>> > > > > > +            nvme_zrm_auto_transition_zone(ns);
>> > > > > > +        }
>> > > > > >         status =3D nvme_aor_check(ns, act, 1);
>> > > > > >         if (status) {
>> > > > > >             return status;
>> > > > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>> > > > > > index 3fec9c6273..31dee43d30 100644
>> > > > > > --- a/hw/nvme/ns.c
>> > > > > > +++ b/hw/nvme/ns.c
>> > > > > > @@ -531,6 +531,8 @@ static Property nvme_ns_props[] =3D {
>> > > > > >                        params.max_open_zones, 0),
>> > > > > >     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
>> > > > > >                        params.zd_extension_size, 0),
>> > > > > > +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeNamespace,
>> > > > > > +                     params.auto_transition_zones, true),
>> > > > > >     DEFINE_PROP_END_OF_LIST(),
>> > > > > > };
>> > > > > >
>> > > > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> > > > > > index 81a35cda14..bd86054db2 100644
>> > > > > > --- a/hw/nvme/nvme.h
>> > > > > > +++ b/hw/nvme/nvme.h
>> > > > > > @@ -100,6 +100,7 @@ typedef struct NvmeNamespaceParams {
>> > > > > >     uint32_t max_active_zones;
>> > > > > >     uint32_t max_open_zones;
>> > > > > >     uint32_t zd_extension_size;
>> > > > > > +    bool     auto_transition_zones;
>> > > > > > } NvmeNamespaceParams;
>> > > > > >
>> > > > > > typedef struct NvmeNamespace {
>> > > > > > --
>> > > > > > 2.31.1
>> > > > > >
>> > > > >
>> > > > > Looks good Niklas!
>> > > > >
>> > > > > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
>> > > >
>> > > > In reality, it is the controller that does the auto transitioning.
>> > > >
>> > > > In theory, one namespace could be attached to two different contro=
llers,
>> > > > and I guess, in that case, it depends on if the controller that we=
 used
>> > > > when doing the write supports auto transitioning or not, that dete=
rmines
>> > > > if a zone will be auto transitioned or not.
>> > > >
>> > > > If we were to change this to be a parameter of the controller inst=
ead
>> > > > of a parameter of the namespace, we would require to refactor a lo=
t of
>> > > > code in the regular write path. As we currently don't have any Nvm=
eRequest
>> > > > object in nvme_zrm_open_flags().
>> > > >
>> > > > Thoughts?
>> > > >
>> > >
>> > > I think you are right. This should be controller-specific behavior. =
I took
>> > > the liberty of moving the parameter; the refactor is minimal.
>> > >
>> > >
>> > > From: Niklas Cassel <niklas.cassel@wdc.com>
>> > >
>> > > In the Zoned Namespace Command Set Specification, chapter
>> > > 2.5.1 Managing resources
>> > >
>> > > "The controller may transition zones in the ZSIO:Implicitly Opened s=
tate
>> > > to the ZSC:Closed state for resource management purposes."
>> > >
>> > > The word may in this sentence means that automatically transitioning
>> > > an implicitly opened zone to closed is completely optional.
>> > >
>> > > Add a new parameter so that the user can control if this automatic
>> > > transitioning should be performed or not.
>> > >
>> > > Being able to control this can help with verifying that e.g. a user-=
space
>> > > program behaves properly even without this optional ZNS feature.
>> > >
>> > > The default value is set to true, in order to not change the existing
>> > > behavior.
>> > >
>> > > Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>> > > [k.jensen: moved parameter to controller]
>> > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> > > ---
>> > >  hw/nvme/nvme.h |  1 +
>> > >  hw/nvme/ctrl.c | 32 ++++++++++++++++++++++----------
>> > >  2 files changed, 23 insertions(+), 10 deletions(-)
>> > >
>> > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> > > index 81a35cda142b..93a7e0e5380e 100644
>> > > --- a/hw/nvme/nvme.h
>> > > +++ b/hw/nvme/nvme.h
>> > > @@ -382,6 +382,7 @@ typedef struct NvmeParams {
>> > >      uint8_t  vsl;
>> > >      bool     use_intel_id;
>> > >      uint8_t  zasl;
>> > > +    bool     auto_transition_zones;
>> > >      bool     legacy_cmb;
>> > >  } NvmeParams;
>> > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> > > index 40a7efcea914..8dd9cb2ccbf3 100644
>> > > --- a/hw/nvme/ctrl.c
>> > > +++ b/hw/nvme/ctrl.c
>> > > @@ -34,6 +34,7 @@
>> > >   *              aerl=3D<N[optional]>,aer_max_queued=3D<N[optional]>=
, \
>> > >   *              mdts=3D<N[optional]>,vsl=3D<N[optional]>, \
>> > >   *              zoned.zasl=3D<N[optional]>, \
>> > > + *              zoned.auto_transition=3D<on|off[optional]>, \
>> > >   *              subsys=3D<subsys_id>
>> > >   *      -device nvme-ns,drive=3D<drive_id>,bus=3D<bus_name>,nsid=3D=
<nsid>,\
>> > >   *              zoned=3D<true|false[optional]>, \
>> > > @@ -100,6 +101,11 @@
>> > >   *   the minimum memory page size (CAP.MPSMIN). The default value i=
s 0 (i.e.
>> > >   *   defaulting to the value of `mdts`).
>> > >   *
>> > > + * - `zoned.auto_transition`
>> > > + *   Indicates if zones in zone state implicitly opened can be auto=
matically
>> > > + *   transitioned to zone state closed for resource management purp=
oses.
>> > > + *   Defaults to 'on'.
>> > > + *
>> > >   * nvme namespace device parameters
>> > >   * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> > >   * - `shared`
>> > > @@ -1686,8 +1692,8 @@ enum {
>> > >      NVME_ZRM_AUTO =3D 1 << 0,
>> > >  };
>> > > -static uint16_t nvme_zrm_open_flags(NvmeNamespace *ns, NvmeZone *zo=
ne,
>> > > -                                    int flags)
>> > > +static uint16_t nvme_zrm_open_flags(NvmeCtrl *n, NvmeNamespace *ns,
>> > > +                                    NvmeZone *zone, int flags)
>> > >  {
>> > >      int act =3D 0;
>> > >      uint16_t status;
>> > > @@ -1699,7 +1705,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamesp=
ace *ns, NvmeZone *zone,
>> > >          /* fallthrough */
>> > >      case NVME_ZONE_STATE_CLOSED:
>> > > -        nvme_zrm_auto_transition_zone(ns);
>> > > +        if (n->params.auto_transition_zones) {
>> > > +            nvme_zrm_auto_transition_zone(ns);
>> > > +        }
>> > >          status =3D nvme_aor_check(ns, act, 1);
>> > >          if (status) {
>> > >              return status;
>> > > @@ -1735,14 +1743,16 @@ static uint16_t nvme_zrm_open_flags(NvmeName=
space *ns, NvmeZone *zone,
>> > >      }
>> > >  }
>> > > -static inline uint16_t nvme_zrm_auto(NvmeNamespace *ns, NvmeZone *z=
one)
>> > > +static inline uint16_t nvme_zrm_auto(NvmeCtrl *n, NvmeNamespace *ns,
>> > > +                                     NvmeZone *zone)
>> > >  {
>> > > -    return nvme_zrm_open_flags(ns, zone, NVME_ZRM_AUTO);
>> > > +    return nvme_zrm_open_flags(n, ns, zone, NVME_ZRM_AUTO);
>> > >  }
>> > > -static inline uint16_t nvme_zrm_open(NvmeNamespace *ns, NvmeZone *z=
one)
>> > > +static inline uint16_t nvme_zrm_open(NvmeCtrl *n, NvmeNamespace *ns,
>> > > +                                     NvmeZone *zone)
>> > >  {
>> > > -    return nvme_zrm_open_flags(ns, zone, 0);
>> > > +    return nvme_zrm_open_flags(n, ns, zone, 0);
>> > >  }
>> > >  static void nvme_advance_zone_wp(NvmeNamespace *ns, NvmeZone *zone,
>> > > @@ -2283,7 +2293,7 @@ static void nvme_copy_in_complete(NvmeRequest =
*req)
>> > >              goto invalid;
>> > >          }
>> > > -        status =3D nvme_zrm_auto(ns, zone);
>> > > +        status =3D nvme_zrm_auto(nvme_ctrl(req), ns, zone);
>> > >          if (status) {
>> > >              goto invalid;
>> > >          }
>> > > @@ -3080,7 +3090,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, Nvm=
eRequest *req, bool append,
>> > >              goto invalid;
>> > >          }
>> > > -        status =3D nvme_zrm_auto(ns, zone);
>> > > +        status =3D nvme_zrm_auto(n, ns, zone);
>> > >          if (status) {
>> > >              goto invalid;
>> > >          }
>> > > @@ -3169,7 +3179,7 @@ enum NvmeZoneProcessingMask {
>> > >  static uint16_t nvme_open_zone(NvmeNamespace *ns, NvmeZone *zone,
>> > >                                 NvmeZoneState state, NvmeRequest *re=
q)
>> > >  {
>> > > -    return nvme_zrm_open(ns, zone);
>> > > +    return nvme_zrm_open(nvme_ctrl(req), ns, zone);
>> > >  }
>> > >  static uint16_t nvme_close_zone(NvmeNamespace *ns, NvmeZone *zone,
>> > > @@ -6259,6 +6269,8 @@ static Property nvme_props[] =3D {
>> > >      DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id,=
 false),
>> > >      DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, fal=
se),
>> > >      DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
>> > > +    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
>> > > +                     params.auto_transition_zones, true),
>> > >      DEFINE_PROP_END_OF_LIST(),
>> > >  };
>> > > --
>> > > 2.31.1
>> > >
>> >
>> > Thanks a lot Klaus! I really appreciate it.
>> >
>> > My initial thought was to add a new flag in the enum where NVME_ZRM_AU=
TO is.
>> > But I think that would just make the code harder to read.
>> > You simply check the parameter directly, which is more obvious to the =
reader,
>> > so I think patch looks good!
>> >
>>
>> Can I add your reviewed-by on this? :)
>
>Yes, of course:
>
>Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
>
>However, in many projects you can't have a Reviewed-by that is the same as
>the author, but perhaps that is not the case in QEMU.
>

Ah doh - of course. I'll put my Sign-off and Reviewed-by on with you as=20
author of course ;) Forgot that I kept you as Author!

Thanks!

--UfFdztKjkz+5NcT/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC97zkACgkQTeGvMW1P
DenOKQgAxGu1xH8wAprgICQPtO/bSSeZl0yUHN2/RelYRJzwgPNOolm7qIuSnK+W
7S3SX4qH+c/LBQ/MOKqvP5wUgIEaxC/NS5eFM0fWy0u/uzexDnlU9yfxk3M7MSg1
PCT2EkAc2rPtHR7E/Vr3gUo5e/mSGvWrG8sEgjwTRBXTACnuLEi8OkBnCsM0oGir
+a7f/NdwrOtPxGNGQ/TUMOBuy5IyTS7i7o33PAyNLP2w3ZXScNWf4+osbxN3SrLR
xjdYG2umjyYuJ7oME/0QGqnUot1Yyxx3+c7/VoyqTtm974DuSyHRCCLuJ+VwfA8c
85Ov6CUMMdOaiHaAWTBLPsqzPHg0YQ==
=r741
-----END PGP SIGNATURE-----

--UfFdztKjkz+5NcT/--

