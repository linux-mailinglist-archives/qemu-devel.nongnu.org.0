Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748123BECC5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:03:33 +0200 (CEST)
Received: from localhost ([::1]:37110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1AxQ-0006pO-32
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1Aqm-0001iO-PF; Wed, 07 Jul 2021 12:56:40 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:59661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1Aqk-0008JX-Ka; Wed, 07 Jul 2021 12:56:40 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 48D09320051E;
 Wed,  7 Jul 2021 12:56:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 07 Jul 2021 12:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=E7dwIwv+wlTC+uhZlxsGlg7dqb7
 wb/SwjEypUWPnd1s=; b=BnZj2pSPEL655o2yAsCgnUjiIldqp4Li2usFMjQl87I
 fIybWjbuTT6etswOZuVsiflN6VF5ns5hFunWllXgdGy2CBXDmW0WUoIqAZzi2kIa
 cPC6ZV3PSVOR9Yq7ePh2+FDekTBPPifqZEQNFkF/gYYOzbMFN9aJL3Y2a++PwByU
 BADBLTFIz8gjGTpEvSKSgt+2zg7HTNnl4Y6em1Yv+ADsVb3zUi1D5+nVFbGuWMJN
 r0Z9pUoN6VVlM+gzg9ILt1SQTFFpC0D8/8WSRhdBMrpuDNthBs5qv/IAZOcf034R
 PtqybnI7M7Lr4PhO9NRbn92P47LYKZTsZz6unETAE6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=E7dwIw
 v+wlTC+uhZlxsGlg7dqb7wb/SwjEypUWPnd1s=; b=hvVtGeSPM9FUrUwp9MsO5F
 lijmMvMIL3vAZDTm1dfkN4lIbPx9vSqLEbuYSPam99dW0lMEVG5VTXb0BcwMbO1/
 fEf0MWH+sqv3IN/c/BbhArFodOHlvESI9ItLGxxyHiwWg9/QtTEU04TEude+8uLB
 ndq1sY3HBzKJ/kMSEUL8XE2LqbtV2oQG3fCyp3jTQ6Yo9sAxIy/f2Aog1imwzWul
 9yrFoJ1J/m7afW3BqV09VTlC5vkcTo7DAq5Q7u3KyxsS6j2Vk49y/+4hKgdMmWtc
 QEfda67rYxZXA9IYskkl0vUTWRMvR1sXC9G0dFixvmHZPCUqK81Zrg5dpz0CYnNA
 ==
X-ME-Sender: <xms:wtzlYK-yUPk7V22nzv_CdqsnvwUN6m9pmbiLsZVVrcCSbveVleI3zQ>
 <xme:wtzlYKtqL2vUYTPXxxEt2jGY256mLWE_nTH1n0if07kb1TZB1uNhIfhzGS1XeecdX
 MkwjBcn02lM8DZzzGc>
X-ME-Received: <xmr:wtzlYABlCtStT4FLDhTCRZKnpy_oRlLVPHnovEagFseLxizHzi8w-FZJUWqPJCcItloIFNOQTZX3jXxfNN9L7Z_3cpPx0upnkHUHvxIqAFgyg5z0sg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:wtzlYCdtDgClAtZDse4-DcoCD2JtAowkC-dknOlV1sJEYCb3go-zNg>
 <xmx:wtzlYPNHbaqOS9gEZAieds6LPGV8OUwKgiWPQdwsarEWnBxyuQELTw>
 <xmx:wtzlYMmQFk6g1HoO-bsh7WUUHQbqJfgB7HVSOPtBm_TodiuZjgKXGA>
 <xmx:wtzlYErED_g7CIRoc5Pf7C17cWdaYLA7t5LwQQDop6EWn4ZMeo9gqA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 12:56:33 -0400 (EDT)
Date: Wed, 7 Jul 2021 18:56:31 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v2 4/4] hw/nvme: fix controller hot unplugging
Message-ID: <YOXcv+f/D/BYM77E@apples.localdomain>
References: <20210707154936.200166-1-its@irrelevant.dk>
 <20210707154936.200166-5-its@irrelevant.dk>
 <375ea826-589f-2a18-ea0b-e3ec672a9916@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pk1GiVYXXMKWd8LN"
Content-Disposition: inline
In-Reply-To: <375ea826-589f-2a18-ea0b-e3ec672a9916@suse.de>
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pk1GiVYXXMKWd8LN
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  7 17:57, Hannes Reinecke wrote:
>On 7/7/21 5:49 PM, Klaus Jensen wrote:
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
>>  hw/nvme/nvme.h   | 15 ++++++++-------
>>  hw/nvme/ctrl.c   | 14 ++++++--------
>>  hw/nvme/ns.c     | 18 ++++++++++++++++++
>>  hw/nvme/subsys.c |  3 +++
>>  4 files changed, 35 insertions(+), 15 deletions(-)
>>
>>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>>index c4065467d877..83ffabade4cf 100644
>>--- a/hw/nvme/nvme.h
>>+++ b/hw/nvme/nvme.h
>>@@ -33,12 +33,20 @@ QEMU_BUILD_BUG_ON(NVME_MAX_NAMESPACES > NVME_NSID_BRO=
ADCAST - 1);
>>  typedef struct NvmeCtrl NvmeCtrl;
>>  typedef struct NvmeNamespace NvmeNamespace;
>>+#define TYPE_NVME_BUS "nvme-bus"
>>+OBJECT_DECLARE_SIMPLE_TYPE(NvmeBus, NVME_BUS)
>>+
>>+typedef struct NvmeBus {
>>+    BusState parent_bus;
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
>>@@ -365,13 +373,6 @@ typedef struct NvmeCQueue {
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
>>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>>index 90e3ee2b70ee..9a3b3a27c293 100644
>>--- a/hw/nvme/ctrl.c
>>+++ b/hw/nvme/ctrl.c
>>@@ -6514,16 +6514,14 @@ static void nvme_exit(PCIDevice *pci_dev)
>>      nvme_ctrl_reset(n);
>>-    for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
>>-        ns =3D nvme_ns(n, i);
>>-        if (!ns) {
>>-            continue;
>>+    if (n->subsys) {
>>+        for (i =3D 1; i <=3D NVME_MAX_NAMESPACES; i++) {
>>+            ns =3D nvme_ns(n, i);
>>+            if (ns) {
>>+                ns->attached--;
>>+            }
>>          }
>>-        nvme_ns_cleanup(ns);
>
>So who is removing the namespaces, then?
>I would have expected some cleanup action from the subsystem, seeing=20
>that we reparent to that ...
>

Since we "move" the namespaces to the subsystem, and since the subsystem=20
is non-hotpluggable, they will (and can) not be removed. In the case=20
that there is no subsystem, nvme_ns_unrealize() will be called for each=20
child namespace on the controller NvmeBus.

>>-    }
>>-
>>-    if (n->subsys) {
>>          nvme_subsys_unregister_ctrl(n->subsys, n);
>>      }
>>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>>index 3c4f5b8c714a..b7cf1494e75b 100644
>>--- a/hw/nvme/ns.c
>>+++ b/hw/nvme/ns.c
>>@@ -441,6 +441,15 @@ void nvme_ns_cleanup(NvmeNamespace *ns)
>>      }
>>  }
>>+static void nvme_ns_unrealize(DeviceState *dev)
>>+{
>>+    NvmeNamespace *ns =3D NVME_NS(dev);
>>+
>>+    nvme_ns_drain(ns);
>>+    nvme_ns_shutdown(ns);
>>+    nvme_ns_cleanup(ns);
>>+}
>>+
>>  static void nvme_ns_realize(DeviceState *dev, Error **errp)
>>  {
>>      NvmeNamespace *ns =3D NVME_NS(dev);
>>@@ -462,6 +471,14 @@ static void nvme_ns_realize(DeviceState *dev, Error =
**errp)
>>                         "linked to an nvme-subsys device");
>>              return;
>>          }
>>+    } else {
>>+        /*
>>+         * If this namespace belongs to a subsystem (through a link on t=
he
>>+         * controller device), reparent the device.
>>+         */
>>+        if (!qdev_set_parent_bus(dev, &subsys->bus.parent_bus, errp)) {
>>+            return;
>>+        }
>
>What happens if that fails?
>Will we abort? Not create the namespace?
>

Good point!

It can actually only fail if the bus implements check_address(), which=20
it does not, so it always succeeds, so it should assert instead.

>>      }
>>      if (nvme_ns_setup(ns, errp)) {
>>@@ -552,6 +569,7 @@ static void nvme_ns_class_init(ObjectClass *oc, void =
*data)
>>      dc->bus_type =3D TYPE_NVME_BUS;
>>      dc->realize =3D nvme_ns_realize;
>>+    dc->unrealize =3D nvme_ns_unrealize;
>>      device_class_set_props(dc, nvme_ns_props);
>>      dc->desc =3D "Virtual NVMe namespace";
>>  }
>>diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
>>index 92caa604a280..93c35950d69d 100644
>>--- a/hw/nvme/subsys.c
>>+++ b/hw/nvme/subsys.c
>>@@ -50,6 +50,9 @@ static void nvme_subsys_realize(DeviceState *dev, Error=
 **errp)
>>  {
>>      NvmeSubsystem *subsys =3D NVME_SUBSYS(dev);
>>+    qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, de=
v,
>>+                        dev->id);
>>+
>>      nvme_subsys_setup(subsys);
>>  }
>>
>Cheers,
>
>Hannes
>--=20
>Dr. Hannes Reinecke                Kernel Storage Architect
>hare@suse.de                              +49 911 74053 688
>SUSE Software Solutions GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg
>HRB 36809 (AG N=C3=BCrnberg), Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6=
rffer

--pk1GiVYXXMKWd8LN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDl3L0ACgkQTeGvMW1P
DekL7wgAjxBpayHd6VbxeWD1tmLBwBFNBs/IGMhtg5IniZObXrWd5KTyZnQPKUpN
duVcPKX+HXvHkucfkhbFn1qHHngNhKcMC7w6Lq20asabB4znVVo/iS7IxBhthUdl
XbmsOn/9sIt997c01XE+VRvCJiUFbtSuxDV3WteKhKy7OWm5+zhSdxpey6fSHv3w
gg5HTSfq4yVYnCefDv2xg9+/w9f77G4pjeRtwa0oEpv4fNBE/vL+3/9FrrwNEAJh
JWiOfAfHARInNJJZdmY4EuJfvo2O5FySs6e1+LsGQv+J3feBal1E2QndJEjDA55f
aPpQ4Xpxo1F0WjLXECxq1L49yJ7MYQ==
=wLG5
-----END PGP SIGNATURE-----

--pk1GiVYXXMKWd8LN--

