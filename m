Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB23BE613
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 11:58:39 +0200 (CEST)
Received: from localhost ([::1]:39610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m14KE-0006kj-Mb
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 05:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m14Ff-0004ZP-HP; Wed, 07 Jul 2021 05:53:59 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m14Fc-00053a-UF; Wed, 07 Jul 2021 05:53:54 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E10C55C0049;
 Wed,  7 Jul 2021 05:53:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 07 Jul 2021 05:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6WgqURA0GTQCNdsJWqf2ck7UwLH
 pI2+2Or/j43qWMEA=; b=lzqU/58Jft+JMDammcN9f6LMjKvn20CagMRoV5huupO
 mT5zsZroY9TxjjG+lsVqP53BZccwFow+G0hB4cqaYCCvQVR4tCePWsOtw3wIOuHE
 vvR42BYsUF1jrLKxvEPW17HIqpW3LZ0NzEd5dForudwDWpORQVBvLNVjJQJipmqX
 t6une0wBu0xYCKGwjWf/FHprglDXXdERkhV2ONxZPwbpUppQLb7L9/Vm+v1L0jcS
 3oqoBk9ZuFr1/gbqeJK0xkY5cwGAuRGwV/OmAKwgH1SjbIr3DhnVVAViq8dRvW71
 fIsfFHzNDFm2cPS/burBg4X+42h0IZ9GH2gayZjDJZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6WgqUR
 A0GTQCNdsJWqf2ck7UwLHpI2+2Or/j43qWMEA=; b=Hk/cFdBn2dMuS5wVY3kULF
 wSxFGSpUW6duUjcS6O769I19UdgvYXHPw6Pe5EewrGvrzClYcfTysKUsYfRcEnM1
 u8ifemJf/hF2Yn1DqJLNdOCCbaI3xztkF9Kj30M+xWFyjglNTSbLJAjyUoudSdLl
 GNhnF81eaejvxi/P2l8IZC3fsA6ElcEf/0ylwAEcRYGP1y0mISGg6cQpfU1iStgQ
 28MQ4T+r2foF8CRpfzgydBRNvOf2O4Pt7FwpcjdCb89QeIM4eEQW2yKqj6GaUJwa
 UatHiZkIsVgxF7s8YWjWaaHupkmeeJuLJECnkkhm/UZ72qAu9pQP4m17FssraAVg
 ==
X-ME-Sender: <xms:rHnlYBSoVGA2t4MOXjOwsf2RbgflDFZ0uumX48TcM0c5NUOzilC9iQ>
 <xme:rHnlYKykc6VgfQREryXbb9rmk54jJMtfz0QTBBu_hdxo1_rH3N6TkilKzG2W5xglr
 9Gv8sb2icM_JhOVOhI>
X-ME-Received: <xmr:rHnlYG39H0b5zFvrY1zIoDXoYzUDtkW61gHeA9yrm4kvfYMrtAIpbsopjV6BpLi4DOrKE0vqNcON17j57ABjlitY5O1QTrLW8Y6Tgb30xpP3hJK0ZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepudegfeevgeefudfhueeludfgueefteehuefhueffjeeglefggfdtfeefuddvtdev
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rHnlYJBBrgSgyhYR0sR_pWqeq1RPqvcYi0Te_6DpBkw0aHSw7lG0wQ>
 <xmx:rHnlYKgOHRpcjZHzMuchWhzyVI2Rl0GsG81E4h4Srj6JxOtR3crmuQ>
 <xmx:rHnlYNrJUO0H90o0JWN_PcmtMJGPQxgMgwIwBAL-DFJFKPolHkFWSA>
 <xmx:rXnlYOix__lNWZPsHmtGzrdJWh42g48QeU8GwiIPWUugzC4nbbZfBQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:53:47 -0400 (EDT)
Date: Wed, 7 Jul 2021 11:53:45 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH 4/4] hw/nvme: fix controller hot unplugging
Message-ID: <YOV5qZj8pcnH1aAE@apples.localdomain>
References: <20210706093358.1036387-1-its@irrelevant.dk>
 <20210706093358.1036387-5-its@irrelevant.dk>
 <f468bbdc-fa33-a7e6-a392-394a736a06be@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+asws9mgYzB71p01"
Content-Disposition: inline
In-Reply-To: <f468bbdc-fa33-a7e6-a392-394a736a06be@suse.de>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+asws9mgYzB71p01
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  7 09:49, Hannes Reinecke wrote:
>On 7/6/21 11:33 AM, Klaus Jensen wrote:
>>From: Klaus Jensen <k.jensen@samsung.com>
>>
>>Prior to this patch the nvme-ns devices are always children of the
>>NvmeBus owned by the NvmeCtrl. This causes the namespaces to be
>>unrealized when the parent device is removed. However, when subsystems
>>are involved, this is not what we want since the namespaces may be
>>attached to other controllers as well.
>>
>>This patch adds an additional NvmeBus on the subsystem device. When
>>nvme-ns devices are realized, if the parent controller device is linked
>>to a subsystem, the parent bus is set to the subsystem one instead. This
>>makes sure that namespaces are kept alive and not unrealized.
>>
>>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>---
>>  hw/nvme/nvme.h   | 18 ++++++++++--------
>>  hw/nvme/ctrl.c   |  8 +++++---
>>  hw/nvme/ns.c     | 32 +++++++++++++++++++++++++-------
>>  hw/nvme/subsys.c |  4 ++++
>>  4 files changed, 44 insertions(+), 18 deletions(-)
>>
>>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>index c4065467d877..9401e212f9f7 100644
>>--- a/hw/nvme/nvme.h
>>+++ b/hw/nvme/nvme.h
>>@@ -33,12 +33,21 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BRO=
ADCAST - 1);
>>  typedef struct NvmeCtrl NvmeCtrl;
>>  typedef struct NvmeNamespace NvmeNamespace;
>>+#define TYPE_NVME_BUS "nvme-bus"
>>+OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
>>+
>>+typedef struct NvmeBus {
>>+    BusState parent_bus;
>>+    bool     is_subsys;
>>+} NvmeBus;
>>+
>>  #define TYPE_NVME_SUBSYS "nvme-subsys"
>>  #define NVME_SUBSYS(obj) \
>>      OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
>>  typedef struct NvmeSubsystem {
>>      DeviceState parent_obj;
>>+    NvmeBus     bus;
>>      uint8_t     subnqn[256];
>>      NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
>>@@ -365,13 +374,6 @@ typedef struct NvmeCQueue {
>>      QTAILQ_HEAD(, NvmeRequest) req_list;
>>  } NvmeCQueue;
>>-#define TYPE_NVME_BUS "nvme-bus"
>>-#define NVME_BUS(obj) OBJECT_CHECK(NvmeBus, (obj), TYPE_NVME_BUS)
>>-
>>-typedef struct NvmeBus {
>>-    BusState parent_bus;
>>-} NvmeBus;
>>-
>>  #define TYPE_NVME "nvme"
>>  #define NVME(obj) \
>>          OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
>>@@ -463,7 +465,7 @@ typedef struct NvmeCtrl {
>>  static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
>>  {
>>-    if (!nsid || nsid > NVME_MAX_NAMESPACES) {
>>+    if (!n || !nsid || nsid > NVME_MAX_NAMESPACES) {
>>          return NULL;
>>      }
>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>index 90e3ee2b70ee..7c8fca36d9a5 100644
>>--- a/hw/nvme/ctrl.c
>>+++ b/hw/nvme/ctrl.c
>>@@ -6516,11 +6516,13 @@ static void nvme_exit(PCIDevice *pci_dev)
>>      for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
>>          ns =3D nvme_ns(n, i);
>>-        if (!ns) {
>>-            continue;
>>+        if (ns) {
>>+            ns->attached--;
>>          }
>>+    }
>>-        nvme_ns_cleanup(ns);
>>+    if (n->subsys) {
>>+        nvme_subsys_unregister_ctrl(n->subsys, n);
>>      }
>>      if (n->subsys) {
>>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>index 3c4f5b8c714a..612a2786d75d 100644
>>--- a/hw/nvme/ns.c
>>+++ b/hw/nvme/ns.c
>>@@ -444,13 +444,29 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
>>  static void nvme_ns_realize(DeviceState *dev, Error **errp)
>>  {
>>      NvmeNamespace *ns =3D NVME_NS(dev);
>>-    BusState *s =3D qdev_get_parent_bus(dev);
>>-    NvmeCtrl *n =3D NVME(s->parent);
>>-    NvmeSubsystem *subsys =3D n->subsys;
>>+    BusState *qbus =3D qdev_get_parent_bus(dev);
>>+    NvmeBus *bus =3D NVME_BUS(qbus);
>>+    NvmeCtrl *n =3D NULL;
>>+    NvmeSubsystem *subsys =3D NULL;
>>      uint32_t nsid =3D ns->params.nsid;
>>      int i;
>>-    if (!n->subsys) {
>>+    if (bus->is_subsys) {
>>+        subsys =3D NVME_SUBSYS(qbus->parent);
>>+    } else {
>>+        n =3D NVME(qbus->parent);
>>+        subsys =3D n->subsys;
>>+    }
>>+
>>+    if (subsys) {
>>+        /*
>>+         * If this namespace belongs to a subsystem (through a link on t=
he
>>+         * controller device), reparent the device.
>>+         */
>>+        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
>>+            return;
>>+        }
>>+    } else {
>>          if (ns->params.detached) {
>>              error_setg(errp, "detached requires that the nvme device is=
 "
>>                         "linked to an nvme-subsys device");
>>@@ -470,7 +486,7 @@ static void nvme_ns_realize(DeviceState *dev, Error *=
*errp)
>>      if (!nsid) {
>>          for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
>>-            if (nvme_ns(n, i) || nvme_subsys_ns(subsys, i)) {
>>+            if (nvme_subsys_ns(subsys, i) || nvme_ns(n, i)) {
>>                  continue;
>>              }
>>@@ -483,7 +499,7 @@ static void nvme_ns_realize(DeviceState *dev, Error *=
*errp)
>>              return;
>>          }
>>      } else {
>>-        if (nvme_ns(n, nsid) || nvme_subsys_ns(subsys, nsid)) {
>>+        if (nvme_subsys_ns(subsys, nsid) || nvme_ns(n, nsid)) {
>>              error_setg(errp, "namespace id '%d' already allocated", nsi=
d);
>>              return;
>>          }
>>@@ -509,7 +525,9 @@ static void nvme_ns_realize(DeviceState *dev, Error *=
*errp)
>>          }
>>      }
>>-    nvme_attach_ns(n, ns);
>>+    if (n) {
>>+        nvme_attach_ns(n, ns);
>>+    }
>>  }
>>  static Property nvme_ns_props[] =3D {
>>diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
>>index 92caa604a280..fb7c3a7c55fc 100644
>>--- a/hw/nvme/subsys.c
>>+++ b/hw/nvme/subsys.c
>>@@ -50,6 +50,10 @@ static void nvme_subsys_realize(DeviceState *dev, Erro=
r **errp)
>>  {
>>      NvmeSubsystem *subsys =3D NVME_SUBSYS(dev);
>>+    qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, de=
v,
>>+                        dev->id);
>>+    subsys->bus.is_subsys =3D true;
>>+
>>      nvme_subsys_setup(subsys);
>>  }
>>
>Why not always create a subsystem, and distinguish between 'shared'=20
>and 'non-shared' subsystems instead of the ->subsys pointer?
>That way all namespaces can be children of the subsystem, we won't=20
>need any reparenting, and the whole thing will be more in-line with=20
>qdev, no?
>

Hi Hannes,

Thanks for your reviews and comments!

So, I have actually considered what you suggest.

The problem is that the nvme-ns device currently expects to plug into a=20
bus (an 'nvme-bus') and we cannot really get rid of that 'bus' parameter=20
without breaking compatibility. I experimented with removing the bus=20
=66rom the nvme device and instead creating it in the nvme-subsys device.=
=20
My idea here was to implicitly always create an nvme-subsys if not=20
explicitly created by the user, but since nvme-subsys does not plug into=20
any bus itself, it is not exposed in the qtree and thus not reachable=20
(i.e., when realizing the nvme-ns device, it will complain that there=20
are no 'nvme-bus' available to plug into). To make this work, I believe=20
we'd have to have the nvme-subsys plug into the main system bus (or some=20
other bus rooted at main-system-bus), and I'd prefer not to do that=20
since this is already a flawed design and I think it would be more=20
intrusive than what my patch does.

I raised these issues on the mailinglist some time ago[1]. We didn't=20
really find a good solution, but I think the conclusion is that the=20
bus/device design of subsystems and namespaces is flawed. That's why I=20
am working on an "objectification" of the two devices as suggested by=20
Stefan[2] as a proper fix for this mess.


   [1]: https://lore.kernel.org/qemu-devel/YJrKRsF4%2F38QheKn@apples.locald=
omain/T/#u
   [2]: https://lore.kernel.org/qemu-devel/YKI9zh2AqX35S8wd@stefanha-x1.loc=
aldomain/

--+asws9mgYzB71p01
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDleaUACgkQTeGvMW1P
DelrUggArkwJlqqH2sXeZ07j5OyzKiMZLYdbkq+CqsFn2o3JrJjh88xuEspoAPtA
gLoQsXsdPl2+phTd9qNfNWNcmj12y3ybLIO62OaxdhGju6AZdoGeLg0PqNGVnlaA
qNWy5YAd4RZCWlHLLpBGeNGq0eTOBt9L/hfiirWkPd/kqi1tbKAp8K1F3JbJhq38
cA3yoTHg5NHzmW3lYGYi3PVdALcFltLGzhLtSt8mw/w5sIpuT0Jmmz4CqtBgtP1A
nhlz2iITPiQd8NhmO35BuN2dozRKBr7SLHa6cHSdtQO5HFeTzadV/u+PlSXkgI2b
1+QXlZW7TZ7qVFUsO4YWtcVnNMEjAA==
=VF3Y
-----END PGP SIGNATURE-----

--+asws9mgYzB71p01--

