Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEC6144C31
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 07:59:40 +0100 (CET)
Received: from localhost ([::1]:37660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu9zG-0007mS-Sj
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 01:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iu9qC-0004SW-Fn
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:50:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iu9qA-0007wE-RK
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:50:16 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36338
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iu9qA-0007w5-Nh
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:50:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579675814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e6oF8ptLJSLl44PBoGi3WUQj8MqGR3g9tIutmWvq7mo=;
 b=fEGwhaLctWEuDKn4B1M24xtJ91kk4qHVqLSV2p4s+iL8i/kwdX5ic49qIxiXCzk/thphiK
 gKtvOeBqmGuJDmspO1xCD7p9/8sRTMrPiIhR9FyH6YZS8RzazfHfV3A2/6FqxcCBsCY8SO
 PgYs+mQUzkDoLzXZn09ueQ4zawrDOLY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-XDHyGJZmOjqWbvS5_SzhTw-1; Wed, 22 Jan 2020 01:50:12 -0500
Received: by mail-wr1-f69.google.com with SMTP id f15so2631492wrr.2
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 22:50:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e+M60MZmw7NUe0xGRZqvTtNyN03f8rI9bLRMhM9s7VE=;
 b=jAJlV8n+7PmAIJH2ydyMdkgW6VhXYLAck6+OZAMKCJVathqzS1V2VNaWP6cuu25vsp
 2KsvhGfRoaw39ThmK8Ama66MJsHiWiAMRMkt8fukM7c2GRmFlq9uGM0QlsJvQVZDjcA5
 AqaO3f7d2HnwWBrKvdrhQAdOpzot6HRz00Jj6uL3CLo/F3FWPV2QzDObzE6SPNrK+nj6
 BoLTYx/F30MmTpl+sP9eILaYXLqmUIIP3PO3du8uUsO742IYiymOVBgskelJYeuDeqcc
 C8u+rhZp1RFI50FTRJPdg3ZomTeIvIfjHNSWyardqf6WaQSea2IIUEbLfi9Q7dZZzSaw
 rVPA==
X-Gm-Message-State: APjAAAXUSJ8NA72dXd5FlA1QexigOiGMjVOQ2pPppBOI3xAKGSFnprT9
 bA1aVDJlRhAvO9lHHakq1Bz0JVLCCS1mXyus5Fr+vJtytcC36MOHORN8bCzBAYnhhRbcVYWgftB
 4Q87QZFs4WUB9uqA=
X-Received: by 2002:adf:ffc7:: with SMTP id x7mr9130024wrs.159.1579675811112; 
 Tue, 21 Jan 2020 22:50:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7XJDjBCLWWRAeQ+KLFtOrkhyXUzjbx+UZ663E8gZRNpkp8HPVJjw/fFhmI/1855IPPbQAuA==
X-Received: by 2002:adf:ffc7:: with SMTP id x7mr9129994wrs.159.1579675810844; 
 Tue, 21 Jan 2020 22:50:10 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
 by smtp.gmail.com with ESMTPSA id
 f1sm2456183wmc.45.2020.01.21.22.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 22:50:10 -0800 (PST)
Date: Wed, 22 Jan 2020 01:50:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 07/17] acpi: cpuhp: spec: add typical usecases
Message-ID: <20200122064907.512501-8-mst@redhat.com>
References: <20200122064907.512501-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200122064907.512501-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: XDHyGJZmOjqWbvS5_SzhTw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Document work-flows for
  * enabling/detecting modern CPU hotplug interface
  * finding a CPU with pending 'insert/remove' event
  * enumerating present and possible CPUs

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1575896942-331151-9-git-send-email-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 docs/specs/acpi_cpu_hotplug.txt | 51 +++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.=
txt
index 9879f9ef7e..cb99cf3c8e 100644
--- a/docs/specs/acpi_cpu_hotplug.txt
+++ b/docs/specs/acpi_cpu_hotplug.txt
@@ -15,14 +15,14 @@ CPU present bitmap for:
   PIIX-PM  (IO port 0xaf00-0xaf1f, 1-byte access)
   One bit per CPU. Bit position reflects corresponding CPU APIC ID. Read-o=
nly.
   The first DWORD in bitmap is used in write mode to switch from legacy
-  to new CPU hotplug interface, write 0 into it to do switch.
+  to modern CPU hotplug interface, write 0 into it to do switch.
 ---------------------------------------------------------------
 QEMU sets corresponding CPU bit on hot-add event and issues SCI
 with GPE.2 event set. CPU present map is read by ACPI BIOS GPE.2 handler
 to notify OS about CPU hot-add events. CPU hot-remove isn't supported.
=20
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-ACPI CPU hotplug interface registers:
+Modern ACPI CPU hotplug interface registers:
 -------------------------------------
 Register block base address:
     ICH9-LPC IO port 0x0cd8
@@ -67,6 +67,7 @@ write access:
     [0x0-0x3] CPU selector: (DWORD access)
               selects active CPU device. All following accesses to other
               registers will read/store data from/to selected CPU.
+              Valid values: [0 .. max_cpus)
     [0x4] CPU device control fields: (1 byte access)
         bits:
             0: reserved, OSPM must clear it before writing to register.
@@ -98,4 +99,48 @@ write access:
               2: stores value into OST status register, triggers
                  ACPI_DEVICE_OST QMP event from QEMU to external applicati=
ons
                  with current values of OST event and status registers.
-            other values: reserved
+              other values: reserved
+
+Typical usecases:
+    - (x86) Detecting and enabling modern CPU hotplug interface.
+      QEMU starts with legacy CPU hotplug interface enabled. Detecting and
+      switching to modern interface is based on the 2 legacy CPU hotplug f=
eatures:
+        1. Writes into CPU bitmap are ignored.
+        2. CPU bitmap always has bit#0 set, corresponding to boot CPU.
+
+      Use following steps to detect and enable modern CPU hotplug interfac=
e:
+        1. Store 0x0 to the 'CPU selector' register,
+           attempting to switch to modern mode
+        2. Store 0x0 to the 'CPU selector' register,
+           to ensure valid selector value
+        3. Store 0x0 to the 'Command field' register,
+        4. Read the 'Command data 2' register.
+           If read value is 0x0, the modern interface is enabled.
+           Otherwise legacy or no CPU hotplug interface available
+
+    - Get a cpu with pending event
+      1. Store 0x0 to the 'CPU selector' register.
+      2. Store 0x0 to the 'Command field' register.
+      3. Read the 'CPU device status fields' register.
+      4. If both bit#1 and bit#2 are clear in the value read, there is no =
CPU
+         with a pending event and selected CPU remains unchanged.
+      5. Otherwise, read the 'Command data' register. The value read is th=
e
+         selector of the CPU with the pending event (which is already
+         selected).
+
+    - Enumerate CPUs present/non present CPUs
+      01. Set the present CPU count to 0.
+      02. Set the iterator to 0.
+      03. Store 0x0 to the 'CPU selector' register, to ensure that it's in
+          a valid state and that access to other registers won't be ignore=
d.
+      04. Store 0x0 to the 'Command field' register to make 'Command data'
+          register return 'CPU selector' value of selected CPU
+      05. Read the 'CPU device status fields' register.
+      06. If bit#0 is set, increment the present CPU count.
+      07. Increment the iterator.
+      08. Store the iterator to the 'CPU selector' register.
+      09. Read the 'Command data' register.
+      10. If the value read is not zero, goto 05.
+      11. Otherwise store 0x0 to the 'CPU selector' register, to put it
+          into a valid state and exit.
+          The iterator at this point equals "max_cpus".
--=20
MST


