Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8533A4BA7
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 02:13:02 +0200 (CEST)
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrrGn-00065D-AS
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 20:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrqs8-0006Nc-H6; Fri, 11 Jun 2021 19:47:32 -0400
Received: from mout.gmx.net ([212.227.15.15]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lrqs6-0006Bw-Bo; Fri, 11 Jun 2021 19:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623455242;
 bh=rQLqPvBxinQQ7gY8t/jGS2z0+EcN0fbFMhSnOnmLkLc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=P8yrqf64kZXd5FgM39RhJWG8RAiTAmAEWVzqpIFI/xd1nPayy/fPhFvPj2hxvV5OI
 fqgez+eeAtKbtFMWhv72kRC2I7ftI7OnUOIDwZVVOw/DwS+J2hzX/wEdL0SZG08Xn1
 ZDcd8FoObFJA2Vt9HWyHH/IvJ1bE7nRtRNT4XyQ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from LT02.fritz.box ([62.143.247.63]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mo6v3-1lX2zR2HhT-00pg8m; Sat, 12
 Jun 2021 01:47:22 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/3] hw/nvme: default for namespace EUI-64
Date: Sat, 12 Jun 2021 01:46:31 +0200
Message-Id: <20210611234631.81314-4-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210611234631.81314-1-xypron.glpk@gmx.de>
References: <20210611234631.81314-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xCmmQqQ4SCV0f4VeAYxd95DoCiP1DKkif+ZljC2UtqfkRENvfAV
 qDlKMxYv/vQ/9LdZrHBC0IuzqpJqeLlS2SDim1BUbnnRRyijXssSVDB2yrTmHAyvZ2K0sr0
 pYlFEPIwGqZjIGS+tvCROHUzAwfV5X65B1Fs00aXy+pY8lAJlJ3a60ZebsC7W/GTf0S/1JK
 4Vhmocc18oV9jTHOMkREQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SfQOjQMYD88=:yEmXqyPUHVyCGWUMBK/3Cb
 HgFXn+3Jsoo4aIKF6PaS+n2f66L2eXupwcfcbYUVXbVyEtAZruwSZkImDUenjFmddhD859dG/
 EBbEbThxS1Rg+tB7OIWsDZIFcbHrMOoSNeQIwQHs3lX98v+y7LPlU93VxCte1OSohExtQ9L1w
 w47EARvZSPH5pDI5FdJR08gZmddMYeG7K8kHJ0dQipCmVzsYfuEgCoVJVLVFkCOdH8dB+AjoY
 kxSpgufM3RVdTfEjZ9mjkxaJALuwbduiO6x3QoHdCMdDLg/Z+elkeSIp+Uuoq2qUXVaMrigAo
 a3UQzWx/v5ls5YxLZSlKqo4EgoJDC3AJO9Z9msAobHEvb2lHYNjhNOnoCLaw3/GCq6ZvpZWUw
 rohg9KPAyyNbFek+vSVPrk8qt0qi6O1IbAN3opo036SVElJmT0uH5ootkRNL9gaSRz/ksCphG
 kkLc7ridRWoZNWFOeliSC9wNMWPmoGDQcNZ1FnLVvbg5a1190hPMQ5m2pwExDodb/7g5Axtrv
 uShmfySMAuCDaIoqqpujDtB/XfALtZ9pT1YYQTxjhZQhCX7MS+PK7t+Wc27iGwTy3fFTXb4+I
 v9mc1WTOEVe03U/N8Mexdpy9csD4HuXkLLI6bg6FQpWAguUUA1x07Oq53b+yJUgTOyY56R2+s
 gVhWvNfuCp+86JiJg09bbpqA/cFvJS9rj8y+TOq3CBpu4XDn8D5Xiz54kUolrv9R0k2+w9aAr
 PO3Q03Ymmfv3CM1zjRKAClbvPqmKIX8eQ0bXfVC2svTNemXMcADizZIgILfIkrvkDA1dDYVc/
 lz5irRYF5RSQvSPt2V5/4PrKSVWqGW9tPEwg2AjF8oID6O/4H/E6XmPpAwqMDqy/5T7r11SKl
 2pMFvhsmrbJ2X94CxkV7RoZANysoDoPTA6WoUOUpNSLPwFiU+9Q+z3Jp3OSOm/Sto7R/hHBdd
 7E8NzgHfWgOZTAT0R9/xOFCl2vo4zOYU2hGQ/vNkQCJpT9lTOgaJZpP2BEFcEhs01pIzRBNjA
 2gcnEvHoc6Y09PzLO6eXHaOruJD9rijoOesbzifjtI47ZUIWJy0vjjR6kxS2tamzrLgy5E9WD
 /G4n2cTCc8bCZjp5BERpCwMR7WczcGHW0tN
Received-SPF: pass client-ip=212.227.15.15; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On machines with version > 6.0 replace a missing EUI-64 by a generated
value.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
=2D--
v2:
	new patch
=2D--
 docs/system/nvme.rst | 2 ++
 hw/core/machine.c    | 1 +
 hw/nvme/ns.c         | 9 +++++++++
 hw/nvme/nvme.h       | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
index b5f8288d7c..33a15c7dbc 100644
=2D-- a/docs/system/nvme.rst
+++ b/docs/system/nvme.rst
@@ -84,6 +84,8 @@ There are a number of parameters available:
 ``eui64``
   Set the EUI-64 of the namespace. This will be reported as a "IEEE Exten=
ded
   Unique Identifier" descriptor in the Namespace Identification Descripto=
r List.
+  Since machine type 6.1 a non-zero default value is used if the paramete=
r
+  is not provided. For earlier machine types the field defaults to 0.

 ``bus``
   If there are more ``nvme`` devices defined, this parameter may be used =
to
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 55b9bc7817..d0e9348888 100644
=2D-- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -39,6 +39,7 @@
 GlobalProperty hw_compat_6_0[] =3D {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
     { "i8042", "extended-state", "false"},
+    { "nvme-ns", "eui64-default", "off"},
 };
 const size_t hw_compat_6_0_len =3D G_N_ELEMENTS(hw_compat_6_0);

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 45e457de6a..4275c3db63 100644
=2D-- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -56,6 +56,7 @@ void nvme_ns_init_format(NvmeNamespace *ns)

 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
+    static uint64_t ns_count;
     NvmeIdNs *id_ns =3D &ns->id_ns;
     uint8_t ds;
     uint16_t ms;
@@ -73,6 +74,12 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp=
)
         id_ns->nmic |=3D NVME_NMIC_NS_SHARED;
     }

+    /* Substitute a missing EUI-64 by an autogenerated one */
+    ++ns_count;
+    if (!ns->params.eui64 && ns->params.eui64_default) {
+        ns->params.eui64 =3D ns_count + NVME_EUI64_DEFAULT;
+    }
+
     /* simple copy */
     id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
     id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
@@ -533,6 +540,8 @@ static Property nvme_ns_props[] =3D {
                        params.max_open_zones, 0),
     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
                        params.zd_extension_size, 0),
+    DEFINE_PROP_BOOL("eui64-default", NvmeNamespace, params.eui64_default=
,
+                     true),
     DEFINE_PROP_END_OF_LIST(),
 };

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index ac90e13d7b..3fb869731d 100644
=2D-- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -26,6 +26,7 @@

 #define NVME_MAX_CONTROLLERS 32
 #define NVME_MAX_NAMESPACES  256
+#define NVME_EUI64_DEFAULT 0x27fed9272381cbd0UL

 typedef struct NvmeCtrl NvmeCtrl;
 typedef struct NvmeNamespace NvmeNamespace;
@@ -84,6 +85,7 @@ typedef struct NvmeNamespaceParams {
     uint32_t nsid;
     QemuUUID uuid;
     uint64_t eui64;
+    bool     eui64_default;

     uint16_t ms;
     uint8_t  mset;
=2D-
2.30.2


