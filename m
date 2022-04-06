Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A964F5DDD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 14:32:29 +0200 (CEST)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc4pn-0003Qw-KC
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 08:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1nc4nW-0001bp-P1
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 08:30:07 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:12269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1nc4nT-0005EF-2k
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 08:30:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=to:cc:from:subject:message-id:date:mime-version;
 bh=FhtxbETLEUGQqmhtBrPSQ8eTFo+l++6DZ6Ms3RgvVj0=;
 b=Xn2t9gN8N6Nab2ebXjfOK4zVM0hTUom9hsX84UqeybTeQefB5OD/OBki
 RPcUPdykK/FmdjIkU4tP0pvi+Za7ymk0Dgi9Zss56Z7AynhfIWOd9aZIG
 RFasQWdGQkI6uPct7nhwmqf3RICQk8I8+n0qz4XqQF5fbxMSxr+IJr/UC 8=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,239,1643670000"; d="scan'208,217";a="10741472"
Received: from clt-128-93-176-131.vpn.inria.fr (HELO [128.93.176.131])
 ([128.93.176.131]) by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 14:29:57 +0200
To: qemu-devel@nongnu.org
From: Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH] hmat acpi: Don't require initiator value in -numa when hmat=on
Message-ID: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
Date: Wed, 6 Apr 2022 14:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bbyAOoRRTIcckH998DlyvodkMLdpIy85b"
Received-SPF: pass client-ip=192.134.164.104;
 envelope-from=Brice.Goglin@inria.fr; helo=mail3-relais-sop.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Liu Jingqi <jingqi.liu@intel.com>,
 Tao Xu <tao3.xu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bbyAOoRRTIcckH998DlyvodkMLdpIy85b
Content-Type: multipart/mixed; boundary="UXPzPJ3yuSrDT3MoSss6A2Q5kXnchvZGh";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: qemu-devel@nongnu.org
Cc: Liu Jingqi <jingqi.liu@intel.com>, Tao Xu <tao3.xu@intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Message-ID: <44e67628-7d58-600d-2268-dbc7c77a8d27@inria.fr>
Subject: [PATCH] hmat acpi: Don't require initiator value in -numa when
 hmat=on

--UXPzPJ3yuSrDT3MoSss6A2Q5kXnchvZGh
Content-Type: multipart/alternative;
 boundary="------------653D3DE1DC2F048FF2D0059F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------653D3DE1DC2F048FF2D0059F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

From: Brice Goglin <Brice.Goglin@inria.fr>

The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
has a "Processor Proximity Domain Valid" flag that is currently
always set because Qemu -numa requires initiator=3DX when hmat=3Don.

Unsetting this flag allows to create more complex memory topologies
by having multiple best initiators for a single memory target.

This patch allows -numa with initiator=3DX when hmat=3Don by keeping
the default value MAX_NODES in numa_state->nodes[i].initiator.
All places reading numa_state->nodes[i].initiator already check
whether it's different from MAX_NODES before using it. And
hmat_build_table_structs() already unset the Valid flag when needed.

Tested with
qemu-system-x86_64 -accel kvm \
  -machine pc,hmat=3Don \
  -drive if=3Dpflash,format=3Draw,file=3D./OVMF.fd \
  -drive media=3Ddisk,format=3Dqcow2,file=3Defi.qcow2 \
  -smp 4 \
  -m 3G \
  -object memory-backend-ram,size=3D1G,id=3Dram0 \
  -object memory-backend-ram,size=3D1G,id=3Dram1 \
  -object memory-backend-ram,size=3D1G,id=3Dram2 \
  -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
  -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
  -numa node,nodeid=3D2,memdev=3Dram2 \
  -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D10 \
  -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D10485760 \
  -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D20 \
  -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D5242880 \
  -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D30 \
  -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D1048576 \
  -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D20 \
  -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D5242880 \
  -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D10 \
  -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D10485760 \
  -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=3Da=
ccess-latency,latency=3D30 \
  -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=3Da=
ccess-bandwidth,bandwidth=3D1048576 \

This exposes NUMA node2 at same distance from both node0 and node1 as see=
n in lstopo:

Machine (2966MB total) + Package P#0
   NUMANode P#2 (979MB)
   Group0
     NUMANode P#0 (980MB)
     Core P#0 + PU P#0
     Core P#1 + PU P#1
   Group0
     NUMANode P#1 (1007MB)
     Core P#2 + PU P#2
     Core P#3 + PU P#3

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
---
  hw/core/machine.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4..9884ef7ac6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1012,9 +1012,7 @@ static void numa_validate_initiator(NumaState *numa=
_state)
 =20
      for (i =3D 0; i < numa_state->num_nodes; i++) {
          if (numa_info[i].initiator =3D=3D MAX_NODES) {
-            error_report("The initiator of NUMA node %d is missing, use =
"
-                         "'-numa node,initiator' option to declare it", =
i);
-            exit(1);
+            continue;
          }
 =20
          if (!numa_info[numa_info[i].initiator].present) {
--=20
2.30.2



--------------653D3DE1DC2F048FF2D0059F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <pre>From: Brice Goglin <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:Brice.Goglin@inria.fr">&lt;Brice.Goglin@inria.fr&gt;</a>

The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
has a "Processor Proximity Domain Valid" flag that is currently
always set because Qemu -numa requires initiator=3DX when hmat=3Don.

Unsetting this flag allows to create more complex memory topologies
by having multiple best initiators for a single memory target.

This patch allows -numa with initiator=3DX when hmat=3Don by keeping
the default value MAX_NODES in numa_state-&gt;nodes[i].initiator.
All places reading numa_state-&gt;nodes[i].initiator already check
whether it's different from MAX_NODES before using it. And
hmat_build_table_structs() already unset the Valid flag when needed.

Tested with
qemu-system-x86_64 -accel kvm \
 -machine pc,hmat=3Don \
 -drive if=3Dpflash,format=3Draw,file=3D./OVMF.fd \
 -drive media=3Ddisk,format=3Dqcow2,file=3Defi.qcow2 \
 -smp 4 \
 -m 3G \
 -object memory-backend-ram,size=3D1G,id=3Dram0 \
 -object memory-backend-ram,size=3D1G,id=3Dram1 \
 -object memory-backend-ram,size=3D1G,id=3Dram2 \
 -numa node,nodeid=3D0,memdev=3Dram0,cpus=3D0-1 \
 -numa node,nodeid=3D1,memdev=3Dram1,cpus=3D2-3 \
 -numa node,nodeid=3D2,memdev=3Dram2 \
 -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Dac=
cess-latency,latency=3D10 \
 -numa hmat-lb,initiator=3D0,target=3D0,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D10485760 \
 -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dac=
cess-latency,latency=3D20 \
 -numa hmat-lb,initiator=3D0,target=3D1,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D5242880 \
 -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=3Dac=
cess-latency,latency=3D30 \
 -numa hmat-lb,initiator=3D0,target=3D2,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D1048576 \
 -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=3Dac=
cess-latency,latency=3D20 \
 -numa hmat-lb,initiator=3D1,target=3D0,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D5242880 \
 -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=3Dac=
cess-latency,latency=3D10 \
 -numa hmat-lb,initiator=3D1,target=3D1,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D10485760 \
 -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=3Dac=
cess-latency,latency=3D30 \
 -numa hmat-lb,initiator=3D1,target=3D2,hierarchy=3Dmemory,data-type=3Dac=
cess-bandwidth,bandwidth=3D1048576 \

This exposes NUMA node2 at same distance from both node0 and node1 as see=
n in lstopo:

Machine (2966MB total) + Package P#0
  NUMANode P#2 (979MB)
  Group0
    NUMANode P#0 (980MB)
    Core P#0 + PU P#0
    Core P#1 + PU P#1
  Group0
    NUMANode P#1 (1007MB)
    Core P#2 + PU P#2
    Core P#3 + PU P#3

Signed-off-by: Brice Goglin <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:Brice.Goglin@inria.fr">&lt;Brice.Goglin@inria.fr&gt;</a>
---
 hw/core/machine.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index d856485cb4..9884ef7ac6 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1012,9 +1012,7 @@ static void numa_validate_initiator(NumaState *numa=
_state)
=20
     for (i =3D 0; i &lt; numa_state-&gt;num_nodes; i++) {
         if (numa_info[i].initiator =3D=3D MAX_NODES) {
-            error_report("The initiator of NUMA node %d is missing, use =
"
-                         "'-numa node,initiator' option to declare it", =
i);
-            exit(1);
+            continue;
         }
=20
         if (!numa_info[numa_info[i].initiator].present) {
--=20
2.30.2


</pre>
  </body>
</html>

--------------653D3DE1DC2F048FF2D0059F--

--UXPzPJ3yuSrDT3MoSss6A2Q5kXnchvZGh--

--bbyAOoRRTIcckH998DlyvodkMLdpIy85b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmJNh8QFAwAAAAAACgkQRJGQ8yNavTsT
RxAAmTcrYcitRGmsiuIWNriGM/VzrOM54b8FmTT4jyXJL8Ffrz34qZlNW/SqZbsTKC7I8he5fPfQ
0emGEYzM0yfkH3fclfprqYXzvv92KM8oYQPV0tGttdE05TKMWt6NHhJ1jZn2cVz3dcWgca1a/Md/
rpry0eBNB+0zAegY3hxgDEkWLTzmxIaSk5YjJ0yAQHkxMI63wl9azdPE1JFfMg0bRPdA9osCxjI8
5kE8en6fot1thJ2cFPIYBkd4OwKaGu80jTMTj4NthmwhgSUEWyHXXGN23+NLBtOaSReEcBF+wXgI
wLV/KFHGk9Ssz6MO8V9bO6zIxJOMgwKybjHIfjnhzlkOOScuHTZEYbzkhungGvHshq3K7kyo8sQx
4IZqupw6bfPb0XSlqzvBTxDUyL/JsqVX8ctkc0w/7+QfeODR5jR1IZ3LNGVnoHbM88Zi/dMwVJvN
Zyki4nrpHIeWietxyOmX0EOVUQXcQlUXiowFu0fLXRKtarHpo7xwv2ifqFsbGtDj9cZIE2RHvcVV
LDXHWn2/LQA3azjLxaPgDRjPz0l9/RSkqZhU7lBDvObd/b5EgTOr5EtUl2rfT/FUPLAff92GUKeZ
vgQ8GAHazOW1Y7cpzj03D+3eB2f3lzEXDuvpbrg55e9Ubv8RzDenJzRA7Zx50U1xL+JMpcsxs+xN
yC0=
=KmkG
-----END PGP SIGNATURE-----

--bbyAOoRRTIcckH998DlyvodkMLdpIy85b--

