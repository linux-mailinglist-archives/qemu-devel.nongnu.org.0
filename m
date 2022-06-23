Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE5557E5F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 16:59:37 +0200 (CEST)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OIy-0001gA-C0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 10:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OHy-0000aR-Ub
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:58:34 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:25785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Brice.Goglin@inria.fr>)
 id 1o4OHv-00041d-Vf
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to;
 bh=rFehrV1uuwNgS0woElX5AFtvgrof7Vuj/EojShfoHYk=;
 b=X9Ko8Vweg4WNW13b645pKQDkLfmXn1LPJnH+BdV+nbDaZttxHwMXm0Y7
 jkKWbVxznEpGW1iQW1ESvQUMrUIe9KO84FkN3/FhCl92RPkb/RY7AWl7J
 NAyagoQtYJLOh+d5P8PS0QlOYKEux3J0oI2JbDqahh3HOQCZEvrh18e0x Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Brice.Goglin@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.92,216,1650924000"; d="scan'208";a="42600698"
Received: from clt-128-93-179-2.vpn.inria.fr (HELO [128.93.179.2])
 ([128.93.179.2]) by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2022 16:58:29 +0200
Subject: [PATCH 1/4] hmat acpi: Don't require initiator value in -numa
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Message-ID: <7d0c6957-a781-58dc-552b-41afeb8b9c7e@inria.fr>
Date: Thu, 23 Jun 2022 16:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oueb8qXFY2ZOM19f1afFm6FtpAmRYoVDX"
Received-SPF: pass client-ip=192.134.164.83;
 envelope-from=Brice.Goglin@inria.fr; helo=mail2-relais-roc.national.inria.fr
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oueb8qXFY2ZOM19f1afFm6FtpAmRYoVDX
Content-Type: multipart/mixed; boundary="aMIOzyEBfWP86MXjXauz0DKCK7HCLjasb";
 protected-headers="v1"
From: Brice Goglin <Brice.Goglin@inria.fr>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Liu Jingqi <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>
Message-ID: <7d0c6957-a781-58dc-552b-41afeb8b9c7e@inria.fr>
Subject: [PATCH 1/4] hmat acpi: Don't require initiator value in -numa
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>

--aMIOzyEBfWP86MXjXauz0DKCK7HCLjasb
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

The "Memory Proximity Domain Attributes" structure of the ACPI HMAT
has a "Processor Proximity Domain Valid" flag that is currently
always set because Qemu -numa requires an initiator=3DX value
when hmat=3Don. Unsetting this flag allows to create more complex
memory topologies by having multiple best initiators for a single
memory target.

This patch allows -numa without initiator=3DX when hmat=3Don by keeping
the default value MAX_NODES in numa_state->nodes[i].initiator.
All places reading numa_state->nodes[i].initiator already check
whether it's different from MAX_NODES before using it.

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
ccess-bandwidth,bandwidth=3D1048576
which reports NUMA node2 at same distance from both node0 and node1 as se=
en in lstopo:
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

Before this patch, we had to add ",initiator=3DX" to "-numa node,nodeid=3D=
2,memdev=3Dram2".
The lstopo output difference between initiator=3D1 and no initiator is:
@@ -1,10 +1,10 @@
  Machine (2966MB total) + Package P#0
+  NUMANode P#2 (979MB)
    Group0
      NUMANode P#0 (980MB)
      Core P#0 + PU P#0
      Core P#1 + PU P#1
    Group0
      NUMANode P#1 (1007MB)
-    NUMANode P#2 (979MB)
      Core P#2 + PU P#2
      Core P#3 + PU P#3

Corresponding changes in the HMAT MPDA structure:
@@ -49,10 +49,10 @@
  [078h 0120   2]               Structure Type : 0000 [Memory Proximity D=
omain Attributes]
  [07Ah 0122   2]                     Reserved : 0000
  [07Ch 0124   4]                       Length : 00000028
-[080h 0128   2]        Flags (decoded below) : 0001
-            Processor Proximity Domain Valid : 1
+[080h 0128   2]        Flags (decoded below) : 0000
+            Processor Proximity Domain Valid : 0
  [082h 0130   2]                    Reserved1 : 0000
-[084h 0132   4] Attached Initiator Proximity Domain : 00000001
+[084h 0132   4] Attached Initiator Proximity Domain : 00000080
  [088h 0136   4]      Memory Proximity Domain : 00000002
  [08Ch 0140   4]                    Reserved2 : 00000000
  [090h 0144   8]                    Reserved3 : 0000000000000000

Final HMAT SLLB structures:
[0A0h 0160   2]               Structure Type : 0001 [System Locality Late=
ncy and Bandwidth Information]
[0A2h 0162   2]                     Reserved : 0000
[0A4h 0164   4]                       Length : 00000040
[0A8h 0168   1]        Flags (decoded below) : 00
                             Memory Hierarchy : 0
[0A9h 0169   1]                    Data Type : 00
[0AAh 0170   2]                    Reserved1 : 0000
[0ACh 0172   4] Initiator Proximity Domains # : 00000002
[0B0h 0176   4]   Target Proximity Domains # : 00000003
[0B4h 0180   4]                    Reserved2 : 00000000
[0B8h 0184   8]              Entry Base Unit : 0000000000002710
[0C0h 0192   4] Initiator Proximity Domain List : 00000000
[0C4h 0196   4] Initiator Proximity Domain List : 00000001
[0C8h 0200   4] Target Proximity Domain List : 00000000
[0CCh 0204   4] Target Proximity Domain List : 00000001
[0D0h 0208   4] Target Proximity Domain List : 00000002
[0D4h 0212   2]                        Entry : 0001
[0D6h 0214   2]                        Entry : 0002
[0D8h 0216   2]                        Entry : 0003
[0DAh 0218   2]                        Entry : 0002
[0DCh 0220   2]                        Entry : 0001
[0DEh 0222   2]                        Entry : 0003

[0E0h 0224   2]               Structure Type : 0001 [System Locality Late=
ncy and Bandwidth Information]
[0E2h 0226   2]                     Reserved : 0000
[0E4h 0228   4]                       Length : 00000040
[0E8h 0232   1]        Flags (decoded below) : 00
                             Memory Hierarchy : 0
[0E9h 0233   1]                    Data Type : 03
[0EAh 0234   2]                    Reserved1 : 0000
[0ECh 0236   4] Initiator Proximity Domains # : 00000002
[0F0h 0240   4]   Target Proximity Domains # : 00000003
[0F4h 0244   4]                    Reserved2 : 00000000
[0F8h 0248   8]              Entry Base Unit : 0000000000000001
[100h 0256   4] Initiator Proximity Domain List : 00000000
[104h 0260   4] Initiator Proximity Domain List : 00000001
[108h 0264   4] Target Proximity Domain List : 00000000
[10Ch 0268   4] Target Proximity Domain List : 00000001
[110h 0272   4] Target Proximity Domain List : 00000002
[114h 0276   2]                        Entry : 000A
[116h 0278   2]                        Entry : 0005
[118h 0280   2]                        Entry : 0001
[11Ah 0282   2]                        Entry : 0005
[11Ch 0284   2]                        Entry : 000A
[11Eh 0286   2]                        Entry : 0001

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
---
  hw/core/machine.c | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index a673302cce..d4d7e77401 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1173,9 +1173,7 @@ static void numa_validate_initiator(NumaState *numa=
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




--aMIOzyEBfWP86MXjXauz0DKCK7HCLjasb--

--oueb8qXFY2ZOM19f1afFm6FtpAmRYoVDX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEelpOgOQAl7r26tY4RJGQ8yNavTsFAmK0f5QFAwAAAAAACgkQRJGQ8yNavTuI
qRAAqofVqfQlO3bq8iClGG0nSRARfHLhbBuT6m4oF64XBwaXrBNd2Hk5R41jTjvboTUbv7qWCaK4
QqNe+lAqAbQeH8eQi6vvk+9y57ksfFFoT+ZXJiaIRlRSXZ2BuX4DAJqfX3IJaXCrGnI0scvrfLeW
2Oku3j/R+ebIGPNdOgojQqKEdlSOAugEgs13Do/8ZnKBOQc47cIxDw931qMXpWi9S28kUdr6SteF
9rnokkNqWd35fUV2C3+UTSV7gybe75vaZch2DhtoOptcEpXoCIiddwMFgQPWP5KXEFWyPTlA7vro
UNHTZ+t6a2ShdpdI6mMwHlpv7Nt6uln6xGH6xr8OSZwSjt5GBnPZiLb8zgRyH2Uuf4WkrZgx3kog
lk8DsC2RMB/v7x+9w/lFZmUEdQVzMjK7um4jkgAAMYoVxtx7tOUQQu7ufQyCif/ocJzf7cxj+RRj
IX4GhjGPaODwK2Svzdn/XJHF9/eqdxxPR+AFii/eabHncRyhOWWC+hqYjPxE+w2Xuh05qKCgeWYn
jsAh5tRf7oyIto+SacKQEQ4K6m7mbojx9dgFZRtlyEEqe6vf2S8DIdF0fTnZEUF4e44WeVAyL3Yw
FDzcOLzt1A/+Xrhxhzcsb3MCnHvt3AMOjlMPzXL0WBahWrlU9Ih08YiugSYo+pMw18wdRLbKCkWI
UmA=
=Wini
-----END PGP SIGNATURE-----

--oueb8qXFY2ZOM19f1afFm6FtpAmRYoVDX--

