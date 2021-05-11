Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8E37A6BE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:32:00 +0200 (CEST)
Received: from localhost ([::1]:40570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgRYJ-000444-Kr
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lgRPB-0006AV-Ni; Tue, 11 May 2021 08:22:29 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:60753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lgRP9-0002Br-4h; Tue, 11 May 2021 08:22:29 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 405F25C0121;
 Tue, 11 May 2021 08:22:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 11 May 2021 08:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=pbEvQoZaxW4siyFkEUnsPWeVb2/
 6rH0O0HmdDpYU4V8=; b=bQFZk84/BTxbnGIlPJSK2Tsda+ELGvuZZngpyZlxXQp
 qZaSXPwfZ6aXCvcjTUd9nt/xBUQLFDDmEYGD4BcfGOdA2kQTNk+b6DFgpHfvLN93
 w3WlZPEzYGFPeYB9Xa7rBWryLpCWjkJyhHJ/mEEVk0CLu+c6xJq6DUFOzHgh1gr4
 uwuiK3bXh1ES/fUBEwxZ22rKa+gw84d91EKKZQW3l1tTSOfeOGQXIJte8RIkDAXF
 qUqXTKDJcZLTAdYxe0M1zp7E2WNzFKGdpdPLrKYOPApcS4+89a4u7w1517XnN5wp
 oP6RUgkJ7G6bHLsr39pDsqvUcB5lS99BOHLhUh3vaWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pbEvQo
 ZaxW4siyFkEUnsPWeVb2/6rH0O0HmdDpYU4V8=; b=Pk2q/wigaJoUJWn0GEUu5g
 S9XII4AnxaAdrVt50wXwDgldcBMFrZjZPlgfAPP80JsVY+HstpgvA8YOZy8en4TZ
 js0UqipjgB87b+PEAnO3YM+5zl1lenTkE+knlasogIOt1oEQQl7iVgo4l63zzSo2
 DhOhOY/qBiLr7CKoK5i5Rn5LQ2SA0gz+msBWX6GWLcvuQ2MfU30PHspe4p35Kv9z
 wWNAdN4PYFOLH9AI5fUhEYDsWmDg/VRQIGdNA4H+AhSpU5X/GGHh/k41d7SjIOY+
 6kDnQOUxJyWl7GNHTou0PYxO4TTKw1vuFyxXdCILQNhD+CqVO8Wrn36GE1p9xKQQ
 ==
X-ME-Sender: <xms:_naaYLLr0yn3hVGHJwotZjtkeaQp71qnc8_TaJpzWv7NzLthvQC-1g>
 <xme:_naaYPJiCyHF0xm7bUE4JY1U_FT5PTRa-H-fSvCZckcbkpz3ytd_G9_9bk8U7kYvH
 K23G_TrQV_p9vrIsKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehtddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:_naaYDvlNlck5ERlyci_Xg_UDnunfCokP6VtEpH3g14TDXaoYxy1NA>
 <xmx:_naaYEYImjUAOrBYUL8V4UGUffrAmrIiE3CDpX7_Gtz1ShDZYW3Wow>
 <xmx:_naaYCYu0Mb2E611ACbFoQ5hYteGsXju_Do0h0UFW7PuL55TXw7MzQ>
 <xmx:AHeaYCEc5x4g3lA4fL1aXKCpfuPOC556aYtQclWAh-EgBEf8PHGBKw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 11 May 2021 08:22:21 -0400 (EDT)
Date: Tue, 11 May 2021 14:22:20 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] hw/block/nvme: re-enable NVMe PCI hotplug
Message-ID: <YJp2/AeqfgQ46ZyV@apples.localdomain>
References: <20210511073511.32511-1-hare@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BneCJF7DyaiqJHHD"
Content-Disposition: inline
In-Reply-To: <20210511073511.32511-1-hare@suse.de>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <keith.busch@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--BneCJF7DyaiqJHHD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 11 09:35, Hannes Reinecke wrote:
>Ever since commit e570768566 ("hw/block/nvme: support for shared
>namespace in subsystem") NVMe PCI hotplug is broken, as the PCI
>hotplug infrastructure will only work for the nvme devices (which
>are PCI devices), but not for any attached namespaces.
>So when re-adding the NVMe PCI device via 'device_add' the NVMe
>controller is added, but all namespaces are missing.
>This patch adds device hotplug hooks for NVMe namespaces, such that one
>can call 'device_add nvme-ns' to (re-)attach the namespaces after
>the PCI NVMe device 'device_add nvme' hotplug call.
>

Hi Hannes,

Thanks for this.

The real fix here is that namespaces are properly detached from other=20
controllers that it may be shared on.

But is this really the behavior we want? That nvme-ns devices always=20
"belongs to" (in QEMU qdev terms) an nvme device is an artifact of the=20
Bus/Device architecture and not really how an NVM subsystem should=20
behave. Removing a controller should not cause shared namespaces to=20
disappear from other controllers.

I have a WIP that instead adds an NvmeBus to the nvme-subsys device and=20
reparents the nvme-ns devices to that if the parent controller is linked=20
to a sybsystem. This way, nvme-ns devices wont be unrealized under the=20
feet of other controllers.

The hotplug fix looks good - I'll post a series that tries to integrate=20
both.

>Fixes: e570768566 ("hw/block/nvme: support for shared namespace in subsyst=
em")
>Signed-off-by: Hannes Reinecke <hare@suse.de>
>---
> capstone               |  2 +-
> hw/block/nvme-ns.c     | 31 ++++++++++++++++++++++
> hw/block/nvme-subsys.c | 12 +++++++++
> hw/block/nvme-subsys.h |  1 +
> hw/block/nvme.c        | 60 +++++++++++++++++++++++++++++++-----------
> hw/block/nvme.h        |  1 +
> roms/SLOF              |  2 +-
> roms/openbios          |  2 +-
> roms/u-boot            |  2 +-
> 9 files changed, 93 insertions(+), 20 deletions(-)
>
>diff --git a/capstone b/capstone
>index f8b1b83301..22ead3e0bf 160000
>--- a/capstone
>+++ b/capstone
>@@ -1 +1 @@
>-Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
>+Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>index 7bb618f182..3a7e01f10f 100644
>--- a/hw/block/nvme-ns.c
>+++ b/hw/block/nvme-ns.c
>@@ -526,6 +526,36 @@ static void nvme_ns_realize(DeviceState *dev, Error *=
*errp)
>     nvme_attach_ns(n, ns);
> }
>
>+static void nvme_ns_unrealize(DeviceState *dev)
>+{
>+    NvmeNamespace *ns =3D NVME_NS(dev);
>+    BusState *s =3D qdev_get_parent_bus(dev);
>+    NvmeCtrl *n =3D NVME(s->parent);
>+    NvmeSubsystem *subsys =3D n->subsys;
>+    uint32_t nsid =3D ns->params.nsid;
>+    int i;
>+
>+    nvme_ns_drain(ns);
>+    nvme_ns_shutdown(ns);
>+    nvme_ns_cleanup(ns);
>+
>+    if (subsys) {
>+        subsys->namespaces[nsid] =3D NULL;
>+
>+        if (ns->params.shared) {
>+            for (i =3D 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
>+                NvmeCtrl *ctrl =3D subsys->ctrls[i];
>+
>+                if (ctrl) {
>+                    nvme_detach_ns(ctrl, ns);
>+                }
>+            }
>+            return;
>+        }
>+    }
>+    nvme_detach_ns(n, ns);
>+}
>+
> static Property nvme_ns_props[] =3D {
>     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
>     DEFINE_PROP_BOOL("detached", NvmeNamespace, params.detached, false),
>@@ -563,6 +593,7 @@ static void nvme_ns_class_init(ObjectClass *oc, void *=
data)
>
>     dc->bus_type =3D TYPE_NVME_BUS;
>     dc->realize =3D nvme_ns_realize;
>+    dc->unrealize =3D nvme_ns_unrealize;
>     device_class_set_props(dc, nvme_ns_props);
>     dc->desc =3D "Virtual NVMe namespace";
> }
>diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
>index 9604c19117..1c00508f33 100644
>--- a/hw/block/nvme-subsys.c
>+++ b/hw/block/nvme-subsys.c
>@@ -42,6 +42,18 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
>     return cntlid;
> }
>
>+void nvme_subsys_unregister_ctrl(NvmeCtrl *n)
>+{
>+    NvmeSubsystem *subsys =3D n->subsys;
>+    int cntlid =3D n->cntlid;
>+
>+    if (!n->subsys)
>+        return;
>+    assert(cntlid < ARRAY_SIZE(subsys->ctrls));
>+    subsys->ctrls[cntlid] =3D NULL;
>+    n->cntlid =3D -1;
>+}
>+
> static void nvme_subsys_setup(NvmeSubsystem *subsys)
> {
>     const char *nqn =3D subsys->params.nqn ?
>diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
>index 7d7ef5f7f1..2d8a146c4f 100644
>--- a/hw/block/nvme-subsys.h
>+++ b/hw/block/nvme-subsys.h
>@@ -32,6 +32,7 @@ typedef struct NvmeSubsystem {
> } NvmeSubsystem;
>
> int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
>+void nvme_subsys_unregister_ctrl(NvmeCtrl *n);
>
> static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
>         uint32_t cntlid)
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 5fe082ec34..515678b686 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -4963,26 +4963,12 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, Nv=
meRequest *req)
>             }
>
>             nvme_attach_ns(ctrl, ns);
>-            __nvme_select_ns_iocs(ctrl, ns);
>         } else {
>             if (!nvme_ns(ctrl, nsid)) {
>                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
>             }
>
>-            ctrl->namespaces[nsid - 1] =3D NULL;
>-            ns->attached--;
>-
>-            nvme_update_dmrsl(ctrl);
>-        }
>-
>-        /*
>-         * Add namespace id to the changed namespace id list for event cl=
earing
>-         * via Get Log Page command.
>-         */
>-        if (!test_and_set_bit(nsid, ctrl->changed_nsids)) {
>-            nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
>-                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
>-                               NVME_LOG_CHANGED_NSLIST);
>+            nvme_detach_ns(ctrl, ns);
>         }
>     }
>
>@@ -6166,6 +6152,34 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
>
>     n->dmrsl =3D MIN_NON_ZERO(n->dmrsl,
>                             BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
>+    if (NVME_CC_EN(n->bar.cc)) {
>+        /* Ctrl is live */
>+        __nvme_select_ns_iocs(n, ns);
>+        if (!test_and_set_bit(nsid, n->changed_nsids)) {
>+            nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
>+                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
>+                               NVME_LOG_CHANGED_NSLIST);
>+        }
>+    }
>+}
>+
>+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns)
>+{
>+    uint32_t nsid =3D ns->params.nsid;
>+
>+    if (ns->attached) {
>+        n->namespaces[nsid - 1] =3D NULL;
>+        ns->attached--;
>+    }
>+    nvme_update_dmrsl(n);
>+    if (NVME_CC_EN(n->bar.cc)) {
>+        /* Ctrl is live */
>+        if (!test_and_set_bit(nsid, n->changed_nsids)) {
>+            nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
>+                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
>+                               NVME_LOG_CHANGED_NSLIST);
>+        }
>+    }
> }
>
> static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>@@ -6193,7 +6207,7 @@ static void nvme_realize(PCIDevice *pci_dev, Error *=
*errp)
>         return;
>     }
>     nvme_init_ctrl(n, pci_dev);
>-
>+    qbus_set_bus_hotplug_handler(BUS(&n->bus));
>     /* setup a namespace if the controller drive property was given */
>     if (n->namespace.blkconf.blk) {
>         ns =3D &n->namespace;
>@@ -6224,6 +6238,8 @@ static void nvme_exit(PCIDevice *pci_dev)
>         nvme_ns_cleanup(ns);
>     }
>
>+    nvme_subsys_unregister_ctrl(n);
>+
>     g_free(n->cq);
>     g_free(n->sq);
>     g_free(n->aer_reqs);
>@@ -6348,10 +6364,22 @@ static const TypeInfo nvme_info =3D {
>     },
> };
>
>+static void nvme_bus_class_init(ObjectClass *klass, void *data)
>+{
>+    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(klass);
>+
>+    hc->unplug =3D qdev_simple_device_unplug_cb;
>+}
>+
> static const TypeInfo nvme_bus_info =3D {
>     .name =3D TYPE_NVME_BUS,
>     .parent =3D TYPE_BUS,
>     .instance_size =3D sizeof(NvmeBus),
>+    .class_init =3D nvme_bus_class_init,
>+    .interfaces =3D (InterfaceInfo[]) {
>+        { TYPE_HOTPLUG_HANDLER },
>+        { }
>+    }
> };
>
> static void nvme_register_types(void)
>diff --git a/hw/block/nvme.h b/hw/block/nvme.h
>index 5d05ec368f..4fc06f58a4 100644
>--- a/hw/block/nvme.h
>+++ b/hw/block/nvme.h
>@@ -255,6 +255,7 @@ typedef enum NvmeTxDirection {
> } NvmeTxDirection;
>
> void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
>+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns);
> uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
>                           NvmeTxDirection dir, NvmeRequest *req);
> uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
>diff --git a/roms/SLOF b/roms/SLOF
>index 33a7322de1..e18ddad851 160000
>--- a/roms/SLOF
>+++ b/roms/SLOF
>@@ -1 +1 @@
>-Subproject commit 33a7322de13e9dca4b38851a345a58d37e7a441d
>+Subproject commit e18ddad8516ff2cfe36ec130200318f7251aa78c
>diff --git a/roms/openbios b/roms/openbios
>index 4a0041107b..7f28286f5c 160000
>--- a/roms/openbios
>+++ b/roms/openbios
>@@ -1 +1 @@
>-Subproject commit 4a0041107b8ef77e0e8337bfcb5f8078887261a7
>+Subproject commit 7f28286f5cb1ca682e3ba0a8706d8884f12bc49e
>diff --git a/roms/u-boot b/roms/u-boot
>index b46dd116ce..d3689267f9 160000
>--- a/roms/u-boot
>+++ b/roms/u-boot
>@@ -1 +1 @@
>-Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
>+Subproject commit d3689267f92c5956e09cc7d1baa4700141662bff
>--=20
>2.26.2
>
>

--=20
One of us - No more doubt, silence or taboo about mental illness.

--BneCJF7DyaiqJHHD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCadvcACgkQTeGvMW1P
DentDgf8Ca782lN1GGxWXlcmb1hH3dqvEx/9iVZhA7GUJQwVaqRIUywlmYY8fHNt
NroJY5y6MEvrdu8UAHKzxJdXsSNkCooZhh4IejNJ3LAsNnrwkJ87z5APL7NaaF5F
mvote9GHhAODoqp6wYMfjFaD0F55hd3MdKIgoStOzIAeZTDmLzSmbRKcl/yj7feD
Eb9wIkc5LyoYY/DO8tzF/ceHb6/UB9PxpNnTZ1Z44p87zO/Z7vue2la8YR+3zysM
A+8upJ737UotDdSrVR5bKb9XQjTLxp8NNoLWIX6Yx3yDDma+rT6OsOdvEXQbtF/X
YZ2bCL6k7U3UHoFa2/RQnC/Mq5mlIQ==
=Uwkq
-----END PGP SIGNATURE-----

--BneCJF7DyaiqJHHD--

