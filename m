Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984F61130D9
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 18:32:48 +0100 (CET)
Received: from localhost ([::1]:42838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icYW5-0005Tp-GB
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 12:32:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1icY6A-0005I3-5I
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 12:06:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1icY67-0004n0-Ix
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 12:05:58 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:44246
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1icY67-0004bE-DJ
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 12:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575479154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AmtJFfkmZoVSC0j56rxKfGHOSvgzvHCtD4Ssg0Urk/g=;
 b=fKcYg3cHMhudhbvPhxkwgF+23vkF3rjkW2S3aAlNIp5a1HC0rZvG3NcILP1CSAcnQN5ucJ
 ZpktRbzH2+NKrOBr0EVHIKTknBvdvdr8vZIKWF6YCaO0kTTtqzPNPyf5Id1ULU4azp+q26
 dhBtbNdipELJoncyPOFQ6lQgOG1uVZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-lmhufn2RMsCU4oBblq3VQA-1; Wed, 04 Dec 2019 12:05:53 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 296562F62
 for <qemu-devel@nongnu.org>; Wed,  4 Dec 2019 17:05:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0031F5D6BB;
 Wed,  4 Dec 2019 17:05:50 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.0 4/8] acpi: cpuhp: spec: fix 'Command data' description
Date: Wed,  4 Dec 2019 18:05:43 +0100
Message-Id: <1575479147-6641-5-git-send-email-imammedo@redhat.com>
In-Reply-To: <1575479147-6641-1-git-send-email-imammedo@redhat.com>
References: <1575479147-6641-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: lmhufn2RMsCU4oBblq3VQA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: pbonzini@redhat.com, philmd@redhat.com, lersek@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correct returned value description in case 'Command field' =3D=3D 0x0,
it's in not PXM but CPU selector value with pending event

In addition describe 0 blanket value in case of not supported
'Command field' value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/acpi_cpu_hotplug.txt | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.=
txt
index 4e65286..19c508f 100644
--- a/docs/specs/acpi_cpu_hotplug.txt
+++ b/docs/specs/acpi_cpu_hotplug.txt
@@ -56,9 +56,8 @@ read access:
            3-7: reserved and should be ignored by OSPM
     [0x5-0x7] reserved
     [0x8] Command data: (DWORD access)
-          in case of error or unsupported command reads is 0xFFFFFFFF
-          current 'Command field' value:
-              0: returns PXM value corresponding to device
+          contains 0 unless last stored in 'Command field' value is one of=
:
+              0: contains 'CPU selector' value of a CPU with pending event=
[s]
=20
 write access:
     offset:
@@ -81,9 +80,9 @@ write access:
           value:
             0: selects a CPU device with inserting/removing events and
                following reads from 'Command data' register return
-               selected CPU (CPU selector value). If no CPU with events
-               found, the current CPU selector doesn't change and
-               corresponding insert/remove event flags are not set.
+               selected CPU ('CPU selector' value).
+               If no CPU with events found, the current 'CPU selector' doe=
sn't
+               change and corresponding insert/remove event flags are not =
set.
             1: following writes to 'Command data' register set OST event
                register in QEMU
             2: following writes to 'Command data' register set OST status
--=20
2.7.4


