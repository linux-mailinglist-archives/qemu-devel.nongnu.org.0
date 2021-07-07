Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0758C3BEB3F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:46:57 +0200 (CEST)
Received: from localhost ([::1]:52512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19lH-0007S7-UM
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19fy-0004Oc-Ek; Wed, 07 Jul 2021 11:41:26 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:49281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m19fv-0002Tg-9M; Wed, 07 Jul 2021 11:41:26 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 579293200302;
 Wed,  7 Jul 2021 11:41:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Jul 2021 11:41:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=B2xDA7YiV6usTH0JphThm8HDKYJ
 +Kb10ZVi4SgVg4EE=; b=QvoEj2esxAwK7k3RBDn8jjE/j2ZfT+N3B//iH+zpWXq
 5JBiNBIcm73fvpLpM0VMqArx/Cgg07z/yV/Essv0Oq+5qsdc3N6CiniSqzigAfoy
 LhN3qFDwNW2TQVu7oGMZjkTpxLObbkUmLYYELCBEe7hhgR/6hPgDEVjZ8vvJMaZk
 k8Yqm+DiCweUwzXT+SrupJvhRo0sFoxo/idFp/GNtd2FW7aBCzJ/7D5bVtXzW3kl
 LTbGY3Ntk1NLG09Jgx9ovHMYuPs9dBtReTycn8AwXvcoMcgDKhPmtljJyyCPdtum
 EfnIFECmHMCoWQdkrkGlaVM6UyqPWR2hNN0WT/1kGSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=B2xDA7
 YiV6usTH0JphThm8HDKYJ+Kb10ZVi4SgVg4EE=; b=v9zeGl0yjkwjV0DVNV6rlY
 cQmufPOf2tNsP7TJjVpUvK2umSkliUpcP0M3aUSWLohdOOoGm9H3AP/CX8EL89CC
 f6EA+06Htwa3j7DctKHCf+wfNjXuok7NtVNX0GVUxmqKYTLR8r/DT+VzQ4Ci4guk
 7VGb89+UUMDE+vSIFrNEjByyjm9Js/Dj+caqXTXv3lQr0vjuxt+4oTzuDaFQ5FPS
 D15ZzJA/gA1fgGJ7pIh8bypoveR+8qEb8foua8rfqaS1o2FS9Gbz+asEIV/SBGU1
 KnT4EMlvj+ww45sl6gnSwzJWyYjlEvObX3eriAh4POw4uPbxAjnHMsyvGLBXZ5hQ
 ==
X-ME-Sender: <xms:HsvlYPq7sw6Do0U7bdVIsSzH6aETAn9xFtxqeZnanR6Q1Z7Unarisw>
 <xme:HsvlYJrB1xumAsQ9VJ9RzN1IK1w8a4Kr9OxA4gtTNDZ5teLoNd10DPQ5vip4AFJKb
 nytOuNeziJaeC6bsrk>
X-ME-Received: <xmr:HsvlYMMiJrA5wb3m_PinC81WRJwyLbt1HGgMk-ESXJHDM6zOfVs8mi8PrfdxG8AnVYWnImG_zL9tlJDpj3tl1-C_1Bztx2nz01Ka6ClintYFydn4Zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueeuffeihffggfetheejieevleduhfetfffhheeigfehteejieetvddtgedvhedt
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HsvlYC5rH64nmN5yvGZDMpBS8N74frM4VXHR6kH-fv-fWL7Jg2zbbg>
 <xmx:HsvlYO66V0wGhGgBMzf4E1SefqG5B-XUjRm1MjzP5VEnWU0SOthiKw>
 <xmx:HsvlYKgHm4sFnTqjLqQ7mMzMKopD4Bf06fw8l_CLrsptCsXw-8w40g>
 <xmx:IMvlYFbmfC23fjsnDqTETse4gFaJSo0CHpl2YgqQaSdyCBWEUL2lgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 11:41:17 -0400 (EDT)
Date: Wed, 7 Jul 2021 17:41:15 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 4/4] hw/nvme: fix controller hot unplugging
Message-ID: <YOXLGwNmbccoMhjC@apples.localdomain>
References: <20210706093358.1036387-1-its@irrelevant.dk>
 <20210706093358.1036387-5-its@irrelevant.dk>
 <f468bbdc-fa33-a7e6-a392-394a736a06be@suse.de>
 <YOV5qZj8pcnH1aAE@apples.localdomain>
 <9fecd4b6-b36f-2101-4139-0666f741cf8e@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j/vMYfFZsLjAyQ73"
Content-Disposition: inline
In-Reply-To: <9fecd4b6-b36f-2101-4139-0666f741cf8e@suse.de>
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
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--j/vMYfFZsLjAyQ73
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  7 12:43, Hannes Reinecke wrote:
>On 7/7/21 11:53 AM, Klaus Jensen wrote:
>>On Jul=C2=A0 7 09:49, Hannes Reinecke wrote:
>>>On 7/6/21 11:33 AM, Klaus Jensen wrote:
>>>>From: Klaus Jensen <k.jensen@samsung.com>
>>>>
>>>>Prior to this patch the nvme-ns devices are always children of the
>>>>NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
>>>>unrealized when the parent device is removed. However, when subsystems
>>>>are involved, this is not what we want since the namespaces may be
>>>>attached to other controllers as well.
>>>>
>>>>This patch adds an additional NvmeBus on the subsystem device. When
>>>>nvme-ns devices are realized, if the parent controller device is linked
>>>>to a subsystem, the parent bus is set to the subsystem one instead. This
>>>>makes sure that namespaces are kept alive and not unrealized.
>>>>
>>>>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>>---
>>>>=C2=A0hw/nvme/nvme.h=C2=A0=C2=A0 | 18 ++++++++++--------
>>>>=C2=A0hw/nvme/ctrl.c=C2=A0=C2=A0 |=C2=A0 8 +++++---
>>>>=C2=A0hw/nvme/ns.c=C2=A0=C2=A0=C2=A0=C2=A0 | 32 +++++++++++++++++++++++=
++-------
>>>>=C2=A0hw/nvme/subsys.c |=C2=A0 4 ++++
>>>>=C2=A04 files changed, 44 insertions(+), 18 deletions(-)
>>>>
>>>>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>>>index c4065467d877..9401e212f9f7 100644
>>>>--- a/hw/nvme/nvme.h
>>>>+++ b/hw/nvme/nvme.h
>>>>@@ -33,12 +33,21 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES >=20
>>>>NVME_NSID_BROADCAST - 1);
>>>>=C2=A0typedef struct NvmeCtrl NvmeCtrl;
>>>>=C2=A0typedef struct NvmeNamespace NvmeNamespace;
>>>>+#define TYPE_NVME_BUS "nvme-bus"
>>>>+OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
>>>>+
>>>>+typedef struct NvmeBus {
>>>>+=C2=A0=C2=A0=C2=A0 BusState parent_bus;
>>>>+=C2=A0=C2=A0=C2=A0 bool=C2=A0=C2=A0=C2=A0=C2=A0 is_subsys;
>>>>+} NvmeBus;
>>>>+
>>>>=C2=A0#define TYPE_NVME_SUBSYS "nvme-subsys"
>>>>=C2=A0#define NVME_SUBSYS(obj) \
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_S=
UBSYS)
>>>>=C2=A0typedef struct NvmeSubsystem {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 DeviceState parent_obj;
>>>>+=C2=A0=C2=A0=C2=A0 NvmeBus=C2=A0=C2=A0=C2=A0=C2=A0 bus;
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t=C2=A0=C2=A0=C2=A0=C2=A0 subnqn[256];
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 NvmeCtrl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ctrls[=
NVME_MAX_CONTROLLERS];
>>>>@@ -365,13 +374,6 @@ typedef struct NvmeCQueue {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 QTAILQ_HEAD(, NvmeRequest) req_list;
>>>>=C2=A0} NvmeCQueue;
>>>>-#define TYPE_NVME_BUS "nvme-bus"
>>>>-#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
>>>>-
>>>>-typedef struct NvmeBus {
>>>>-=C2=A0=C2=A0=C2=A0 BusState parent_bus;
>>>>-} NvmeBus;
>>>>-
>>>>=C2=A0#define TYPE_NVME "nvme"
>>>>=C2=A0#define NVME(obj) \
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OBJECT_CHECK(NvmeCtrl,=
 (obj), TYPE_NVME)
>>>>@@ -463,7 +465,7 @@ typedef struct NvmeCtrl {
>>>>=C2=A0static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
>>>>=C2=A0{
>>>>-=C2=A0=C2=A0=C2=A0 if (!nsid || nsid > NVME_MAX_NAMESPACES) {
>>>>+=C2=A0=C2=A0=C2=A0 if (!n || !nsid || nsid > NVME_MAX_NAMESPACES) {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>>>index 90e3ee2b70ee..7c8fca36d9a5 100644
>>>>--- a/hw/nvme/ctrl.c
>>>>+++ b/hw/nvme/ctrl.c
>>>>@@ -6516,11 +6516,13 @@ static void nvme_exit(PCIDevice *pci_dev)
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++)=
 {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns =3D nvme_ns(n, i);
>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ns) {
>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ns) {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ns-=
>attached--;
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>+=C2=A0=C2=A0=C2=A0 }
>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme_ns_cleanup(ns);
>>>>+=C2=A0=C2=A0=C2=A0 if (n->subsys) {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme_subsys_unregister_ctrl=
(n->subsys, n);
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 if (n->subsys) {
>>>>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>>>index 3c4f5b8c714a..612a2786d75d 100644
>>>>--- a/hw/nvme/ns.c
>>>>+++ b/hw/nvme/ns.c
>>>>@@ -444,13 +444,29 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
>>>>=C2=A0static void nvme_ns_realize(DeviceState *dev, Error **errp)
>>>>=C2=A0{
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 NvmeNamespace *ns =3D NVME_NS(dev);
>>>>-=C2=A0=C2=A0=C2=A0 BusState *s =3D qdev_get_parent_bus(dev);
>>>>-=C2=A0=C2=A0=C2=A0 NvmeCtrl *n =3D NVME(s->parent);
>>>>-=C2=A0=C2=A0=C2=A0 NvmeSubsystem *subsys =3D n->subsys;
>>>>+=C2=A0=C2=A0=C2=A0 BusState *qbus =3D qdev_get_parent_bus(dev);
>>>>+=C2=A0=C2=A0=C2=A0 NvmeBus *bus =3D NVME_BUS(qbus);
>>>>+=C2=A0=C2=A0=C2=A0 NvmeCtrl *n =3D NULL;
>>>>+=C2=A0=C2=A0=C2=A0 NvmeSubsystem *subsys =3D NULL;
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 uint32_t nsid =3D ns->params.nsid;
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 int i;
>>>>-=C2=A0=C2=A0=C2=A0 if (!n->subsys) {
>>>>+=C2=A0=C2=A0=C2=A0 if (bus->is_subsys) {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subsys =3D NVME_SUBSYS(qbus=
->parent);
>>>>+=C2=A0=C2=A0=C2=A0 } else {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n =3D NVME(qbus->parent);
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subsys =3D n->subsys;
>>>>+=C2=A0=C2=A0=C2=A0 }
>>>>+
>>>>+=C2=A0=C2=A0=C2=A0 if (subsys) {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * If this namespace b=
elongs to a subsystem (through a=20
>>>>link on the
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * controller device),=
 reparent the device.
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!qdev_set_parent_bus(de=
v, &subsys->bus.parent_bus, errp)) {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn;
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>+=C2=A0=C2=A0=C2=A0 } else {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ns->params.detache=
d) {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 error_setg(errp, "detached requires that the nvme=20
>>>>device is "
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "link=
ed to an nvme-subsys device");
>>>>@@ -470,7 +486,7 @@ static void nvme_ns_realize(DeviceState=20
>>>>*dev, Error **errp)
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 if (!nsid) {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 1; i <=3D N=
VME_MAX_NAMESPACES; i++) {
>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(nvme_ns(n, i) || nvme_subsys_ns(subsys, i)) {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
(nvme_subsys_ns(subsys, i) || nvme_ns(n, i)) {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }
>>>>@@ -483,7 +499,7 @@ static void nvme_ns_realize(DeviceState=20
>>>>*dev, Error **errp)
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>>>-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nvme_ns(n, nsid) || nvm=
e_subsys_ns(subsys, nsid)) {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (nvme_subsys_ns(subsys, =
nsid) || nvme_ns(n, nsid)) {
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 error_setg(errp, "namespace id '%d' already=20
>>>>allocated", nsid);
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>@@ -509,7 +525,9 @@ static void nvme_ns_realize(DeviceState=20
>>>>*dev, Error **errp)
>>>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>-=C2=A0=C2=A0=C2=A0 nvme_attach_ns(n, ns);
>>>>+=C2=A0=C2=A0=C2=A0 if (n) {
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvme_attach_ns(n, ns);
>>>>+=C2=A0=C2=A0=C2=A0 }
>>>>=C2=A0}
>>>>=C2=A0static Property nvme_ns_props[] =3D {
>>>>diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
>>>>index 92caa604a280..fb7c3a7c55fc 100644
>>>>--- a/hw/nvme/subsys.c
>>>>+++ b/hw/nvme/subsys.c
>>>>@@ -50,6 +50,10 @@ static void nvme_subsys_realize(DeviceState=20
>>>>*dev, Error **errp)
>>>>=C2=A0{
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 NvmeSubsystem *subsys =3D NVME_SUBSYS(dev);
>>>>+=C2=A0=C2=A0=C2=A0 qbus_create_inplace(&subsys->bus, sizeof(NvmeBus),=
=20
>>>>TYPE_NVME_BUS, dev,
>>>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->=
id);
>>>>+=C2=A0=C2=A0=C2=A0 subsys->bus.is_subsys =3D true;
>>>>+
>>>>=C2=A0=C2=A0=C2=A0=C2=A0 nvme_subsys_setup(subsys);
>>>>=C2=A0}
>>>>
>>>Why not always create a subsystem, and distinguish between=20
>>>'shared' and 'non-shared' subsystems instead of the ->subsys=20
>>>pointer?
>>>That way all namespaces can be children of the subsystem, we won't=20
>>>need any reparenting, and the whole thing will be more in-line=20
>>>with qdev, no?
>>>
>>
>>Hi Hannes,
>>
>>Thanks for your reviews and comments!
>>
>>So, I have actually considered what you suggest.
>>
>>The problem is that the nvme-ns device currently expects to plug=20
>>into a bus (an 'nvme-bus') and we cannot really get rid of that=20
>>'bus' parameter without breaking compatibility. I experimented with=20
>>removing the bus from the nvme device and instead creating it in the=20
>>nvme-subsys device. My idea here was to implicitly always create an=20
>>nvme-subsys if not explicitly created by the user, but since=20
>>nvme-subsys does not plug into any bus itself, it is not exposed in=20
>>the qtree and thus not reachable (i.e., when realizing the nvme-ns=20
>>device, it will complain that there are no 'nvme-bus' available to=20
>>plug into). To make this work, I believe we'd have to have the=20
>>nvme-subsys plug into the main system bus (or some other bus rooted=20
>>at main-system-bus), and I'd prefer not to do that since this is=20
>>already a flawed design and I think it would be more intrusive than=20
>>what my patch does.
>>
>Sigh.
>_Again_.
>
>I seem to trip over issues for which no patch can possibly be accepted=20
>as first the infrastructure has to be reworked.
>
>... there is a reason why I'm avoiding posting patches to qemu-devel :-(
>

Actually, I'm the one to blame for making nvme-ns a -device and partly=20
for why nvme-subsys is one as well... It's made sense at the time and=20
thats why the infrastructure is biting me in the behind now ;)

>>I raised these issues on the mailinglist some time ago[1]. We didn't=20
>>really find a good solution, but I think the conclusion is that the=20
>>bus/device design of subsystems and namespaces is flawed. That's why=20
>>I am working on an "objectification" of the two devices as suggested=20
>>by Stefan[2] as a proper fix for this mess.
>>
>Actually, I _do_ think that it would be good to have an nvme-subsystem=20
>bus, providinga list of all namespaces for that subsystem.

My goal was to *not* use a qbus I don't think the subsystem should be=20
modelled as a device. The same can be accomplished with -objects and=20
links.

>Creating a controller would then mean that one has to create a=20
>controller and a namespace _separately_, as then the namespace would=20
>_not_ be a child of the controller.
>But that's arguably a good thing, as the namespaces _do_ have a=20
>separate lifetime from controllers.
>And the lifetime of the subsystem could be completely self-contained;=20
>the controller would be looking up subsystems via the subsystem NQN if=20
>present; I guess we'll need to create ad-hoc subsystems for PCIe.
>But nothing insurmountable.
>And certainly nothing which require a large-scale rework of qemu=20
>internals, I would think.
>

Yes, exactly, totally agree.

>But _if_ you work on the rework, please ensure that not only NVMe is=20
>represented here. SCSI multipathing has the same issue currently;=20
>there is a strict host->lun->block->OS device relationship currently=20
>in SCSI, making it impossible to represent a multipathed SCSI device=20
>in qemu.
>The only sneaky way is to allow for a shared OS device (ie specifying=20
>the filename more than once), but that completely sidesteps qemu=20
>internals, too.
>

I'm only very superficially familiar with hw/scsi, but this sounds more=20
like the scsi subsystem also has some similar design problems like=20
hw/nvme, not an inherent issue with QDEV/QOM.

--j/vMYfFZsLjAyQ73
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDlyxkACgkQTeGvMW1P
DekVSQf/QdcpHjqO2DWakAdyQc+S/sqEJnMJ/VB6Q147fujwJcVN1vfaYHs99mFQ
XHwUVMN4CcJsRgmCy7ap7x1RgBM1WV8sZcZ956MIwvJChi60ShOmVpH2CwTBMZhB
DKNvjriYDl9EsZADUDZjZJrlVOPPxvlf3uiN5e7EbDVbkQQyPMqjbStl+b+OaeRB
HKLVB3l3KcbsGzyzpfobYQrPfwGCW03U0QGUGbhSi01yLZKAulHtjIUvxVQcFNmo
c50kzdMfmY3W0nuzYa3ucgrQ2V+UxbmyW6E8NOP/axRmARSNLIkdX5aL3ixyIxkw
1MoYiHY6ENqrSbuckMEVwQ3QD8nRsQ==
=4mYo
-----END PGP SIGNATURE-----

--j/vMYfFZsLjAyQ73--

