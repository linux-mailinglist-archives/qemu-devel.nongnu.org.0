Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE679144C1C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 07:57:12 +0100 (CET)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu9wt-0004Jb-7h
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 01:57:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iu9q9-0004PT-RN
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:50:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iu9q8-0007tw-4a
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:50:13 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29527
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iu9q8-0007tJ-0p
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 01:50:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579675811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cZSw7eZYA9nW+mh3jM5ZF40fdaxfgONBvpYjIhz74s=;
 b=MgT5Vh2/vdVKdOGbDdAD5FoVn9eioK7BeEozrBSGGTQFWTu3eg/ytRNI4+kDflHUNnn1rV
 aAxq0dy1UVqzxOfgLJgP9FaluQSyf4N9BMHgU+eeaXO75yHUi1xBQQ86v5ft7VmzUm9aNE
 xqfztIxGpgm4WRExqwxkFy681+S7pA8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-Lh2_6RaOO3Wx6ovUnuiYLw-1; Wed, 22 Jan 2020 01:50:09 -0500
Received: by mail-wr1-f71.google.com with SMTP id y7so2614156wrm.3
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 22:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mG4C1N5iHUE7eCiLg4lfrsmbX/tB8VxXvzlNPjmYI5U=;
 b=dSOfJuWx7qQ0H26qE3NBrJlEmNt42FjklYM/T4BUG0di9lGPVNrrr24k1BLHfQTYzV
 xsbhqKjGE0fQCp2nTmD1tKTOoLYlXNmSflAncuOCFWqCZVP3wJbUHEoRH7/LMWk8AJ36
 6akm9HWcSeKLWge+JgX27cL2h7WaZsZP7g6owmEt9IoYFd8it+ruWpq+xysJSkVIlFOv
 Wp5FV2pLOsiYsxLbIRJzGCfi1/TT6IRoTGZDplOvoTND9Fw04YHDpMn1januUkX/hkm0
 FYGUlq+cDMFwZYCDvgsmiE2eLK9vYhl9jQR0s7wfsmIiPzN7H9yuhDKXbuAbRG6SOyJR
 iZ1A==
X-Gm-Message-State: APjAAAVuycPiUILXWZQC3gihB/HL7qaESpLsXDHK3uF27ObeJugFwSIh
 Kb0PoTynV76gjzWNghLxubcLKhbO/65sgXO14kOVitFw4ef7srPgp7VZYbbk/kUrAhRnnWADOXr
 bAtBSIumYngN5xlo=
X-Received: by 2002:a1c:8086:: with SMTP id b128mr1143514wmd.80.1579675808208; 
 Tue, 21 Jan 2020 22:50:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPtNcs+OpU2rYOHlfVnPU+mPkyzbYPd2t1DyTP8iFaYdRVyQHPdnI/DDwxOtGvqtNCdJ2OIw==
X-Received: by 2002:a1c:8086:: with SMTP id b128mr1143501wmd.80.1579675808010; 
 Tue, 21 Jan 2020 22:50:08 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
 by smtp.gmail.com with ESMTPSA id
 t1sm2691642wma.43.2020.01.21.22.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 22:50:07 -0800 (PST)
Date: Wed, 22 Jan 2020 01:50:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 06/17] acpi: cpuhp: introduce 'Command data 2' field
Message-ID: <20200122064907.512501-7-mst@redhat.com>
References: <20200122064907.512501-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200122064907.512501-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: Lh2_6RaOO3Wx6ovUnuiYLw-1
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

No functional change in practice, patch only aims to properly
document (in spec and code) intended usage of the reserved space.

The new field is to be used for 2 purposes:
  - detection of modern CPU hotplug interface using
    CPHP_GET_NEXT_CPU_WITH_EVENT_CMD command.
    procedure will be described in follow up patch:
      "acpi: cpuhp: spec: add typical usecases"
  - for returning upper 32 bits of architecture specific CPU ID,
    for new CPHP_GET_CPU_ID_CMD command added by follow up patch:
      "acpi: cpuhp: add CPHP_GET_CPU_ID_CMD command"

Change is backward compatible with 4.2 and older machines, as field was
unconditionally reserved and always returned 0x0 if modern CPU hotplug
interface was enabled.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <1575896942-331151-8-git-send-email-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
---
 docs/specs/acpi_cpu_hotplug.txt |  5 ++++-
 hw/acpi/cpu.c                   | 11 +++++++++++
 hw/acpi/trace-events            |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/docs/specs/acpi_cpu_hotplug.txt b/docs/specs/acpi_cpu_hotplug.=
txt
index 8fb9ad22e6..9879f9ef7e 100644
--- a/docs/specs/acpi_cpu_hotplug.txt
+++ b/docs/specs/acpi_cpu_hotplug.txt
@@ -44,7 +44,10 @@ keeps the current value.
=20
 read access:
     offset:
-    [0x0-0x3] reserved
+    [0x0-0x3] Command data 2: (DWORD access)
+              if value last stored in 'Command field':
+                0: reads as 0x0
+                other values: reserved
     [0x4] CPU device status fields: (1 byte access)
         bits:
            0: Device is enabled and may be used by guest
diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 87f30a31d7..d475c06953 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -12,6 +12,7 @@
 #define ACPI_CPU_FLAGS_OFFSET_RW 4
 #define ACPI_CPU_CMD_OFFSET_WR 5
 #define ACPI_CPU_CMD_DATA_OFFSET_RW 8
+#define ACPI_CPU_CMD_DATA2_OFFSET_R 0
=20
 enum {
     CPHP_GET_NEXT_CPU_WITH_EVENT_CMD =3D 0,
@@ -79,6 +80,16 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr=
, unsigned size)
         }
         trace_cpuhp_acpi_read_cmd_data(cpu_st->selector, val);
         break;
+    case ACPI_CPU_CMD_DATA2_OFFSET_R:
+        switch (cpu_st->command) {
+        case CPHP_GET_NEXT_CPU_WITH_EVENT_CMD:
+           val =3D 0;
+           break;
+        default:
+           break;
+        }
+        trace_cpuhp_acpi_read_cmd_data2(cpu_st->selector, val);
+        break;
     default:
         break;
     }
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 96b8273297..afbc77de1c 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -23,6 +23,7 @@ cpuhp_acpi_read_flags(uint32_t idx, uint8_t flags) "idx[0=
x%"PRIx32"] flags: 0x%"
 cpuhp_acpi_write_idx(uint32_t idx) "set active cpu idx: 0x%"PRIx32
 cpuhp_acpi_write_cmd(uint32_t idx, uint8_t cmd) "idx[0x%"PRIx32"] cmd: 0x%=
"PRIx8
 cpuhp_acpi_read_cmd_data(uint32_t idx, uint32_t data) "idx[0x%"PRIx32"] da=
ta: 0x%"PRIx32
+cpuhp_acpi_read_cmd_data2(uint32_t idx, uint32_t data) "idx[0x%"PRIx32"] d=
ata: 0x%"PRIx32
 cpuhp_acpi_cpu_has_events(uint32_t idx, bool ins, bool rm) "idx[0x%"PRIx32=
"] inserting: %d, removing: %d"
 cpuhp_acpi_clear_inserting_evt(uint32_t idx) "idx[0x%"PRIx32"]"
 cpuhp_acpi_clear_remove_evt(uint32_t idx) "idx[0x%"PRIx32"]"
--=20
MST


