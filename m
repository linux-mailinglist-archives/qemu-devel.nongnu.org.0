Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625C73214EA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:17:50 +0100 (CET)
Received: from localhost ([::1]:42574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9Dp-00067S-8P
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lE9BF-00052n-B5; Mon, 22 Feb 2021 06:15:09 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:47731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lE9BA-00076x-Ds; Mon, 22 Feb 2021 06:15:09 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.194])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id A61158FDD275;
 Mon, 22 Feb 2021 12:14:58 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 22 Feb
 2021 12:14:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00394750d34-5007-4fb0-a70c-e0b612a9ef7d,
 22411CCD660FC3FC09311B18737C076FF65DC705) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: Editing QEMU POWER Platform wiki page
To: Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@linux.ibm.com>
References: <91874f1e-4b14-5fb1-f1ae-1225938df759@linux.ibm.com>
 <20210222120138.31f313c9@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <46be018b-97a8-c66f-87b8-b6758f79f76b@kaod.org>
Date: Mon, 22 Feb 2021 12:14:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210222120138.31f313c9@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 15b5967d-2eb7-4c53-a90a-77c3b1014fbd
X-Ovh-Tracer-Id: 10534482479924939567
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeikedtkeeuhedvuddtieehueefvefffeffgffgfedvueefledvgfeufedukeeuleenucffohhmrghinhepqhgvmhhurdhorhhgpdhophgvnhgsihhoshdrohhrghdpmhgrghhitgdrfhhrnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 QEMU PPC devel list <qemu-ppc@nongnu.org>, lagarcia@br.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 12:01 PM, Greg Kurz wrote:
> On Thu, 18 Feb 2021 10:16:25 -0300
> Leonardo Augusto Guimarães Garcia <lagarcia@linux.ibm.com> wrote:
> 
>> Hi there,
>>
>> I would like to edit the wiki page at [0] as it contains some outdated 
>> information. Could anyone that has access to the wiki please help me 
>> create a user so that I can edit it?
>>
>> 0. https://wiki.qemu.org/Documentation/Platforms/POWER
>>
> 
> Hi Leo,
> 
> User creation isn't publicly available to avoid spam : only an existing
> user can create a new account. This being said, wiki isn't the preferred
> way to expose documentation since there's no review and things ultimately
> bitrot. Page [0] you want to update is a perfect example of the mess :
> not only it contains irrelevant data but also stuff that is definitely
> wrong (e.g. 'compat' cpu property was deprecated in QEMU 5.0 and will
> be removed in QEMU 6.0).
> 
> Ideally we'd want everything to be in the main QEMU doc and don't
> even need a wiki.
> 
> On the PowerPC front, the most up-to-date docs are in the QEMU tree:
> 
> docs/system/ppc/embedded.rst 
> docs/system/ppc/powermac.rst 
> docs/system/ppc/powernv.rst  
> docs/system/ppc/prep.rst     
> docs/system/ppc/pseries.rst  
> docs/system/target-ppc.rst   
> 
> So I don't know exactly what changes you had in mind, but maybe first
> consider to update the main documentation.

This structure doesn't quite exist yet. See the patch below adding it.

I would like to improve the PowerNV section before sending it.  

Thanks,

C. 


From f64cf0ab37848c44271437ef837ddda66206c4b9 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Mon, 22 Feb 2021 12:12:23 +0100
Subject: [PATCH] docs/system: Extend PPC section
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/ppc/embedded.rst | 10 +++++++
 docs/system/ppc/powermac.rst | 34 +++++++++++++++++++++++
 docs/system/ppc/powernv.rst  | 11 ++++++++
 docs/system/ppc/prep.rst     | 18 ++++++++++++
 docs/system/ppc/pseries.rst  | 12 ++++++++
 docs/system/target-ppc.rst   | 53 ++++++++++--------------------------
 6 files changed, 100 insertions(+), 38 deletions(-)
 create mode 100644 docs/system/ppc/embedded.rst
 create mode 100644 docs/system/ppc/powermac.rst
 create mode 100644 docs/system/ppc/powernv.rst
 create mode 100644 docs/system/ppc/prep.rst
 create mode 100644 docs/system/ppc/pseries.rst

diff --git a/docs/system/ppc/embedded.rst b/docs/system/ppc/embedded.rst
new file mode 100644
index 000000000000..cfffbda24da9
--- /dev/null
+++ b/docs/system/ppc/embedded.rst
@@ -0,0 +1,10 @@
+Embedded family boards
+======================
+
+- ``bamboo``               bamboo
+- ``mpc8544ds``            mpc8544ds
+- ``ppce500``              generic paravirt e500 platform
+- ``ref405ep``             ref405ep
+- ``sam460ex``             aCube Sam460ex
+- ``taihu``                taihu
+- ``virtex-ml507``         Xilinx Virtex ML507 reference design
diff --git a/docs/system/ppc/powermac.rst b/docs/system/ppc/powermac.rst
new file mode 100644
index 000000000000..04334ba2102c
--- /dev/null
+++ b/docs/system/ppc/powermac.rst
@@ -0,0 +1,34 @@
+PowerMac family boards (``g3beige``, ``mac99``)
+==================================================================
+
+Use the executable ``qemu-system-ppc`` to simulate a complete PowerMac
+PowerPC system.
+
+- ``g3beige``              Heathrow based PowerMAC
+- ``mac99``                Mac99 based PowerMAC
+
+Supported devices
+-----------------
+
+QEMU emulates the following PowerMac peripherals:
+
+ *  UniNorth or Grackle PCI Bridge
+ *  PCI VGA compatible card with VESA Bochs Extensions
+ *  2 PMAC IDE interfaces with hard disk and CD-ROM support
+ *  NE2000 PCI adapters
+ *  Non Volatile RAM
+ *  VIA-CUDA with ADB keyboard and mouse.
+
+
+Missing devices
+---------------
+
+ * To be identified
+
+Firmware
+--------
+
+Since version 0.9.1, QEMU uses OpenBIOS https://www.openbios.org/ for
+the g3beige and mac99 PowerMac and the 40p machines. OpenBIOS is a free
+(GPL v2) portable firmware implementation. The goal is to implement a
+100% IEEE 1275-1994 (referred to as Open Firmware) compliant firmware.
diff --git a/docs/system/ppc/powernv.rst b/docs/system/ppc/powernv.rst
new file mode 100644
index 000000000000..28ce09aa4513
--- /dev/null
+++ b/docs/system/ppc/powernv.rst
@@ -0,0 +1,11 @@
+PowerNV family boards (``powernv8``, ``powernv9``)
+==================================================================
+
+Supported devices
+-----------------
+
+Missing devices
+---------------
+
+Firmware
+--------
diff --git a/docs/system/ppc/prep.rst b/docs/system/ppc/prep.rst
new file mode 100644
index 000000000000..bd9eb8eabd2f
--- /dev/null
+++ b/docs/system/ppc/prep.rst
@@ -0,0 +1,18 @@
+Prep machine (``40p``)
+==================================================================
+
+Use the executable ``qemu-system-ppc`` to simulate a complete 40P (PREP)
+
+Supported devices
+-----------------
+
+QEMU emulates the following 40P (PREP) peripherals:
+
+ *  PCI Bridge
+ *  PCI VGA compatible card with VESA Bochs Extensions
+ *  2 IDE interfaces with hard disk and CD-ROM support
+ *  Floppy disk
+ *  PCnet network adapters
+ *  Serial port
+ *  PREP Non Volatile RAM
+ *  PC compatible keyboard and mouse.
diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
new file mode 100644
index 000000000000..932d4dd17d29
--- /dev/null
+++ b/docs/system/ppc/pseries.rst
@@ -0,0 +1,12 @@
+pSeries family boards (``pseries``)
+===================================
+
+Supported devices
+-----------------
+
+Missing devices
+---------------
+
+
+Firmware
+--------
diff --git a/docs/system/target-ppc.rst b/docs/system/target-ppc.rst
index a2f04c533c24..549fb1858b54 100644
--- a/docs/system/target-ppc.rst
+++ b/docs/system/target-ppc.rst
@@ -3,45 +3,22 @@
 PowerPC System emulator
 -----------------------
 
-Use the executable ``qemu-system-ppc`` to simulate a complete 40P (PREP)
-or PowerMac PowerPC system.
+Board-specific documentation
+============================
 
-QEMU emulates the following PowerMac peripherals:
+you can get a complete list by running ``qemu-system-ppc64 --machine
+help``.
 
--  UniNorth or Grackle PCI Bridge
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
 
--  PCI VGA compatible card with VESA Bochs Extensions
+.. toctree::
+   :maxdepth: 1
 
--  2 PMAC IDE interfaces with hard disk and CD-ROM support
-
--  NE2000 PCI adapters
-
--  Non Volatile RAM
-
--  VIA-CUDA with ADB keyboard and mouse.
-
-QEMU emulates the following 40P (PREP) peripherals:
-
--  PCI Bridge
-
--  PCI VGA compatible card with VESA Bochs Extensions
-
--  2 IDE interfaces with hard disk and CD-ROM support
-
--  Floppy disk
-
--  PCnet network adapters
-
--  Serial port
-
--  PREP Non Volatile RAM
-
--  PC compatible keyboard and mouse.
-
-Since version 0.9.1, QEMU uses OpenBIOS https://www.openbios.org/ for
-the g3beige and mac99 PowerMac and the 40p machines. OpenBIOS is a free
-(GPL v2) portable firmware implementation. The goal is to implement a
-100% IEEE 1275-1994 (referred to as Open Firmware) compliant firmware.
-
-More information is available at
-http://perso.magic.fr/l_indien/qemu-ppc/.
+   ppc/embedded
+   ppc/powermac
+   ppc/powernv
+   ppc/prep
+   ppc/pseries
-- 
2.26.2


