Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251073BEC9C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 18:52:57 +0200 (CEST)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1An7-0005SE-8A
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 12:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1AiS-0004au-He; Wed, 07 Jul 2021 12:48:04 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:43483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1AiN-0006ci-1h; Wed, 07 Jul 2021 12:48:04 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4EA09320085B;
 Wed,  7 Jul 2021 12:47:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Jul 2021 12:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=SxIPtme448lHfAio2KJ3eO1Hpo6
 J517JYZT6FbR2cp8=; b=BIDG4EFMrur088cqucAvXbAE4GMM6YYvAFwYKWvD/Zj
 VNiJaN9Kr19k7o2MOlABNHRUxe6hNHy8JF1aQJkilMRauR1NkZeZcJAlsNEQm1/p
 RnnVPkgLdBb1RTH/gmZ9GX6F5Xz5tgjeCK87HbaFcTYv9ibQrnrfhCapNOcz7QUL
 0CaeraC0LtoJtsGMg0eIF9MpLAlgdVvjxKIAZrVKaSGIsqc7dEv9AmTd8Mq9ROcB
 MoXLgy5eBYtxPsTy7RwvbyUvPE02L0ymphlABlvGRmzRNJTcY0+9qCy5Q02l5Egz
 Q3frDdmVY5v8opUQMlm2LnYf2KbVhDebjUWAIzUOXJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SxIPtm
 e448lHfAio2KJ3eO1Hpo6J517JYZT6FbR2cp8=; b=oG+qiKSA5yCiSGHdowxt+i
 KwTm7Dco86jfR+f/30RynhdAC5h8elhkHMlshhoo8f9tzaEsm+Iba00FBCsrsJjX
 iduY9Fxr8vV8vJ2lKP6uoCrUANj1BwqQHR/DQ8iDGOvf3w0kWmmqpaTmk1fLo/Y2
 V5XZ/pNRpsJCa6sgg9D3M61NjAI0WeEVrsaagLpa0uoi4Q8zDIqaHdLfVHJnX/Fc
 wSDVlLSZ1ixdT44yOdezBtFzSAybrWsS4w5KiM9WQFOpG1XlpwZYQmm7QLLsTTGH
 Pklds8waF67wn8RZFaIE4krcFm7jREXJLJ0FdgQKDix8JQqR/aFEaWJlst30Lkjg
 ==
X-ME-Sender: <xms:u9rlYKLT_vLUuXBqzlSv_3pufxyaVgW0kxk1HqzjKzBdAIwxua4XuA>
 <xme:u9rlYCLE8UXHtJcrw3neQO6ixwlmJFmxYp_c3MZO7S-BYV6Y-RO5CI9ztY-BylNeT
 kQbS_b5mhwHgICLsgY>
X-ME-Received: <xmr:u9rlYKtm30AHUWlFVbnSs0LwQKGS2czDPr5vum1ZiArPrmgbNNqWllg20Xg8duc4A5cP2J8pd6grl4F7uXp0EOd2XFNsBiD0v2HkPdyg9a9qKqGY3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:u9rlYPbE44nGvPzaE0tF620n3H3V16oSFNX_7OP7j3Wq1MbIU3LkcA>
 <xmx:u9rlYBal-3un5w1C9iItVXwhsTi1qAcS9htgazjAaKjBGf8NhvfavQ>
 <xmx:u9rlYLCqpaWVABgvFGSJ0ybw73RypAWkJWpcTyxGAWfknCQIya7YYQ>
 <xmx:u9rlYN6avDd754t99ndWfBoubDL-2eYZmAwcwxqFP3TVuIw-SVaaDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 12:47:53 -0400 (EDT)
Date: Wed, 7 Jul 2021 18:47:50 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 4/4] hw/nvme: fix controller hot unplugging
Message-ID: <YOXatgr6weL1zy9s@apples.localdomain>
References: <20210706093358.1036387-1-its@irrelevant.dk>
 <20210706093358.1036387-5-its@irrelevant.dk>
 <f468bbdc-fa33-a7e6-a392-394a736a06be@suse.de>
 <YOV5qZj8pcnH1aAE@apples.localdomain>
 <9fecd4b6-b36f-2101-4139-0666f741cf8e@suse.de>
 <YOXS4QFXOPXLW5//@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pDQapFzZuLEROkd7"
Content-Disposition: inline
In-Reply-To: <YOXS4QFXOPXLW5//@stefanha-x1.localdomain>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pDQapFzZuLEROkd7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  7 17:14, Stefan Hajnoczi wrote:
>On Wed, Jul 07, 2021 at 12:43:56PM +0200, Hannes Reinecke wrote:
>> On 7/7/21 11:53 AM, Klaus Jensen wrote:
>> > On Jul=C2=A0 7 09:49, Hannes Reinecke wrote:
>> > > On 7/6/21 11:33 AM, Klaus Jensen wrote:
>> > > > From: Klaus Jensen <k.jensen@samsung.com>
>> > > >
>> > > > Prior to this patch the nvme-ns devices are always children of the
>> > > > NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
>> > > > unrealized when the parent device is removed. However, when subsys=
tems
>> > > > are involved, this is not what we want since the namespaces may be
>> > > > attached to other controllers as well.
>> > > >
>> > > > This patch adds an additional NvmeBus on the subsystem device. When
>> > > > nvme-ns devices are realized, if the parent controller device is l=
inked
>> > > > to a subsystem, the parent bus is set to the subsystem one instead=
=2E This
>> > > > makes sure that namespaces are kept alive and not unrealized.
>> > > >
>> > > > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> > > > ---
>> > > > =C2=A0hw/nvme/nvme.h=C2=A0=C2=A0 | 18 ++++++++++--------
>> > > > =C2=A0hw/nvme/ctrl.c=C2=A0=C2=A0 |=C2=A0 8 +++++---
>> > > > =C2=A0hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0 | 32 ++++++++++++++++++=
+++++++-------
>> > > > =C2=A0hw/nvme/subsys.c |=C2=A0 4 ++++
>> > > > =C2=A04 files changed, 44 insertions(+), 18 deletions(-)
>> > > >
>> > > > diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>> > > > index c4065467d877..9401e212f9f7 100644
>> > > > --- a/hw/nvme/nvme.h
>> > > > +++ b/hw/nvme/nvme.h
>> > > > @@ -33,12 +33,21 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES >
>> > > > NVME_NSID_BROADCAST - 1);
>> > > > =C2=A0typedef struct NvmeCtrl NvmeCtrl;
>> > > > =C2=A0typedef struct NvmeNamespace NvmeNamespace;
>> > > > +#define TYPE_NVME_BUS "nvme-bus"
>> > > > +OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
>> > > > +
>> > > > +typedef struct NvmeBus {
>> > > > +=C2=A0=C2=A0=C2=A0 BusState parent_bus;
>> > > > +=C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 is_subsys;
>> > > > +} NvmeBus;
>> > > > +
>> > > > =C2=A0#define TYPE_NVME_SUBSYS "nvme-subsys"
>> > > > =C2=A0#define NVME_SUBSYS(obj) \
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_N=
VME_SUBSYS)
>> > > > =C2=A0typedef struct NvmeSubsystem {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 DeviceState parent_obj;
>> > > > +=C2=A0=C2=A0=C2=A0 NvmeBus=C2=A0=C2=A0=C2=A0=C2=A0 bus;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0=C2=A0=C2=A0=C2=A0 subnqn[25=
6];
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 NvmeCtrl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *c=
trls[NVME_MAX_CONTROLLERS];
>> > > > @@ -365,13 +374,6 @@ typedef struct NvmeCQueue {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 QTAILQ_HEAD(, NvmeRequest) req_list;
>> > > > =C2=A0} NvmeCQueue;
>> > > > -#define TYPE_NVME_BUS "nvme-bus"
>> > > > -#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
>> > > > -
>> > > > -typedef struct NvmeBus {
>> > > > -=C2=A0=C2=A0=C2=A0 BusState parent_bus;
>> > > > -} NvmeBus;
>> > > > -
>> > > > =C2=A0#define TYPE_NVME "nvme"
>> > > > =C2=A0#define NVME(obj) \
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OBJECT_CHECK(Nvme=
Ctrl, (obj), TYPE_NVME)
>> > > > @@ -463,7 +465,7 @@ typedef struct NvmeCtrl {
>> > > > =C2=A0static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t n=
sid)
>> > > > =C2=A0{
>> > > > -=C2=A0=C2=A0=C2=A0 if (!nsid || nsid > NVME_MAX_NAMESPACES) {
>> > > > +=C2=A0=C2=A0=C2=A0 if (!n || !nsid || nsid > NVME_MAX_NAMESPACES)=
 {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>> > > > index 90e3ee2b70ee..7c8fca36d9a5 100644
>> > > > --- a/hw/nvme/ctrl.c
>> > > > +++ b/hw/nvme/ctrl.c
>> > > > @@ -6516,11 +6516,13 @@ static void nvme_exit(PCIDevice *pci_dev)
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 1; i <=3D NVME_MAX_NAMESPACES;=
 i++) {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns =3D nvme_ns(n,=
 i);
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ns) {
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 continue;
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ns) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ns->attached--;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > > +=C2=A0=C2=A0=C2=A0 }
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme_ns_cleanup(ns);
>> > > > +=C2=A0=C2=A0=C2=A0 if (n->subsys) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme_subsys_unregister=
_ctrl(n->subsys, n);
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 if (n->subsys) {
>> > > > diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>> > > > index 3c4f5b8c714a..612a2786d75d 100644
>> > > > --- a/hw/nvme/ns.c
>> > > > +++ b/hw/nvme/ns.c
>> > > > @@ -444,13 +444,29 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
>> > > > =C2=A0static void nvme_ns_realize(DeviceState *dev, Error **errp)
>> > > > =C2=A0{
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 NvmeNamespace *ns =3D NVME_NS(dev);
>> > > > -=C2=A0=C2=A0=C2=A0 BusState *s =3D qdev_get_parent_bus(dev);
>> > > > -=C2=A0=C2=A0=C2=A0 NvmeCtrl *n =3D NVME(s->parent);
>> > > > -=C2=A0=C2=A0=C2=A0 NvmeSubsystem *subsys =3D n->subsys;
>> > > > +=C2=A0=C2=A0=C2=A0 BusState *qbus =3D qdev_get_parent_bus(dev);
>> > > > +=C2=A0=C2=A0=C2=A0 NvmeBus *bus =3D NVME_BUS(qbus);
>> > > > +=C2=A0=C2=A0=C2=A0 NvmeCtrl *n =3D NULL;
>> > > > +=C2=A0=C2=A0=C2=A0 NvmeSubsystem *subsys =3D NULL;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t nsid =3D ns->params.nsid;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 int i;
>> > > > -=C2=A0=C2=A0=C2=A0 if (!n->subsys) {
>> > > > +=C2=A0=C2=A0=C2=A0 if (bus->is_subsys) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subsys =3D NVME_SUBSYS=
(qbus->parent);
>> > > > +=C2=A0=C2=A0=C2=A0 } else {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n =3D NVME(qbus->paren=
t);
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subsys =3D n->subsys;
>> > > > +=C2=A0=C2=A0=C2=A0 }
>> > > > +
>> > > > +=C2=A0=C2=A0=C2=A0 if (subsys) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If this namesp=
ace belongs to a subsystem (through a
>> > > > link on the
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * controller dev=
ice), reparent the device.
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!qdev_set_parent_b=
us(dev, &subsys->bus.parent_bus, errp)) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > > +=C2=A0=C2=A0=C2=A0 } else {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ns->params.de=
tached) {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 error_setg(errp, "detached requires that the nvme
>> > > > device is "
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "l=
inked to an nvme-subsys device");
>> > > > @@ -470,7 +486,7 @@ static void nvme_ns_realize(DeviceState
>> > > > *dev, Error **errp)
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 if (!nsid) {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 1; i <=
=3D NVME_MAX_NAMESPACES; i++) {
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (nvme_ns(n, i) || nvme_subsys_ns(subsys, i)) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (nvme_subsys_ns(subsys, i) || nvme_ns(n, i)) {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 }
>> > > > @@ -483,7 +499,7 @@ static void nvme_ns_realize(DeviceState
>> > > > *dev, Error **errp)
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 } else {
>> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nvme_ns(n, nsid) |=
| nvme_subsys_ns(subsys, nsid)) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nvme_subsys_ns(sub=
sys, nsid) || nvme_ns(n, nsid)) {
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 error_setg(errp, "namespace id '%d' already
>> > > > allocated", nsid);
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return;
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > > @@ -509,7 +525,9 @@ static void nvme_ns_realize(DeviceState
>> > > > *dev, Error **errp)
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
>> > > > -=C2=A0=C2=A0=C2=A0 nvme_attach_ns(n, ns);
>> > > > +=C2=A0=C2=A0=C2=A0 if (n) {
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme_attach_ns(n, ns);
>> > > > +=C2=A0=C2=A0=C2=A0 }
>> > > > =C2=A0}
>> > > > =C2=A0static Property nvme_ns_props[] =3D {
>> > > > diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
>> > > > index 92caa604a280..fb7c3a7c55fc 100644
>> > > > --- a/hw/nvme/subsys.c
>> > > > +++ b/hw/nvme/subsys.c
>> > > > @@ -50,6 +50,10 @@ static void nvme_subsys_realize(DeviceState
>> > > > *dev, Error **errp)
>> > > > =C2=A0{
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 NvmeSubsystem *subsys =3D NVME_SUBSYS(dev=
);
>> > > > +=C2=A0=C2=A0=C2=A0 qbus_create_inplace(&subsys->bus, sizeof(NvmeB=
us),
>> > > > TYPE_NVME_BUS, dev,
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dev->id);
>> > > > +=C2=A0=C2=A0=C2=A0 subsys->bus.is_subsys =3D true;
>> > > > +
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0 nvme_subsys_setup(subsys);
>> > > > =C2=A0}
>> > > >
>> > > Why not always create a subsystem, and distinguish between 'shared'
>> > > and 'non-shared' subsystems instead of the ->subsys pointer?
>> > > That way all namespaces can be children of the subsystem, we won't
>> > > need any reparenting, and the whole thing will be more in-line with
>> > > qdev, no?
>> > >
>> >
>> > Hi Hannes,
>> >
>> > Thanks for your reviews and comments!
>> >
>> > So, I have actually considered what you suggest.
>> >
>> > The problem is that the nvme-ns device currently expects to plug into a
>> > bus (an 'nvme-bus') and we cannot really get rid of that 'bus' paramet=
er
>> > without breaking compatibility. I experimented with removing the bus
>> > from the nvme device and instead creating it in the nvme-subsys device.
>> > My idea here was to implicitly always create an nvme-subsys if not
>> > explicitly created by the user, but since nvme-subsys does not plug in=
to
>> > any bus itself, it is not exposed in the qtree and thus not reachable
>> > (i.e., when realizing the nvme-ns device, it will complain that there
>> > are no 'nvme-bus' available to plug into). To make this work, I believe
>> > we'd have to have the nvme-subsys plug into the main system bus (or so=
me
>> > other bus rooted at main-system-bus), and I'd prefer not to do that
>> > since this is already a flawed design and I think it would be more
>> > intrusive than what my patch does.
>> >
>> Sigh.
>> _Again_.
>>
>> I seem to trip over issues for which no patch can possibly be accepted as
>> first the infrastructure has to be reworked.
>>
>> ... there is a reason why I'm avoiding posting patches to qemu-devel :-(
>>
>> > I raised these issues on the mailinglist some time ago[1]. We didn't
>> > really find a good solution, but I think the conclusion is that the
>> > bus/device design of subsystems and namespaces is flawed. That's why I
>> > am working on an "objectification" of the two devices as suggested by
>> > Stefan[2] as a proper fix for this mess.
>> >
>> Actually, I _do_ think that it would be good to have an nvme-subsystem b=
us,
>> providing a list of all namespaces for that subsystem.
>> Creating a controller would then mean that one has to create a controller
>> and a namespace _separately_, as then the namespace would _not_ be a chi=
ld
>> of the controller.
>> But that's arguably a good thing, as the namespaces _do_ have a separate
>> lifetime from controllers.
>> And the lifetime of the subsystem could be completely self-contained; the
>> controller would be looking up subsystems via the subsystem NQN if prese=
nt;
>> I guess we'll need to create ad-hoc subsystems for PCIe.
>> But nothing insurmountable.
>> And certainly nothing which require a large-scale rework of qemu interna=
ls,
>> I would think.
>
>I don't remember the reason to use --object instead of --device. Maybe
>the --device approach is viable and it makes some sense because this is
>a "device" (like a SCSI LUN) that exposed to the guest. It would be
>necessary to have a nvme-subsys device on the system bus to act as the
>bus for nvme-ns devices as Klaus described.
>

A namespace (-device nvme-ns) does not expose anything on its own to the=20
guest. Whatever the namespace provides (basically the association to a=20
-drive) is accessed through the pcie controller (-device nvme).=20
Similarly, the subsystem is just a concept for allowing multiple=20
controllers to access the same namespace. And this is where the model=20
clash because the parent/child relationship doesnt fit. Reversing the=20
relationship (controller is a child of a namespace) also doesnt work=20
since a contrller may have multiple namespace attached. A many-to-many=20
relationship is required which cannot be expresseed with QDEV as far as=20
I understand.

Talk is cheap, but I have a WIP that shims the -device's and moves the=20
core functionality of namespaces and subsystems to -objects. This makes=20
the setup much more flexible and fits QDEV/QOM much better.

--pDQapFzZuLEROkd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDl2rUACgkQTeGvMW1P
DekRzggAkEMh8AsMv6lbbCVEBAmdnIm/dCr3JTIGCqLD5U2JQmz8a6cuFzQZvkx1
Gmxu24s2oDRA0nF21z/tNCywTIfXFfaNEDWgirT82FT+sAoef0DGUu7fhkp41KZu
izyF2Li3683izm3ZVF6CcDGDA4ghD0dpc/nCL+u7huRgyd3FJwR/Mlods4mX5tcx
1wvXNzkO6aVhJJiA22n8Z55vbE5OHq8GCv8jUZ37tM+WVmENIFHWHywCXPH53ygN
mR4SVJRSYq7oEFAgtD5eF52pqUG2AgHdd2DaieODoJrQcp/C316mmOEX/9SOWiGN
v33WD9QUuAYcXXD+jRlvoinGxh/Gtg==
=FFIt
-----END PGP SIGNATURE-----

--pDQapFzZuLEROkd7--

