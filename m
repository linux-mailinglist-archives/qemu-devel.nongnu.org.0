Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D810144B82
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 06:56:44 +0100 (CET)
Received: from localhost ([::1]:37064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu90M-0003aK-Vt
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 00:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59829)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iu8vz-0007Yp-2U
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 00:52:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iu8vx-0004cU-QL
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 00:52:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33585
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iu8vx-0004cJ-MG
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 00:52:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579672329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/cZSw7eZYA9nW+mh3jM5ZF40fdaxfgONBvpYjIhz74s=;
 b=dMtyoXEHm5gXBLNRU8TeG/ZmyyfRGDIfC7l0h082s91ySpIGR6FH+UjuQlefZYb/WpZ45Q
 C2j+KP8BBHIp3iGT9mTtBuqUIz+hdX/aLNsqMwNpYy/yWSWX8mPp4HtKrt0lasWPLvUmSf
 383Z35iU6rDz3mcSaS03nNHTONAZUSc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-0nLVVY3ZPBq9MPe51RtuHQ-1; Wed, 22 Jan 2020 00:52:07 -0500
Received: by mail-wr1-f69.google.com with SMTP id z10so2535397wrt.21
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 21:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mG4C1N5iHUE7eCiLg4lfrsmbX/tB8VxXvzlNPjmYI5U=;
 b=qT6cepfZr+JaIIHFBzDOoC2DCWFC0Fg9NCUrN8Z9MftfNdwvJFaDFaR0mjw67NbfpM
 RCaXamiIYP1vixfX0x5wk9zLi4Dlmu6vYNbfnRYiSNIcIgyKwvPxFpGOnlvYWScoFCtB
 2LzjkQrgwQCpcyyj7s315HvIt5Z8Cgpn0j/luHdBnR8GBGu1AJ+N7G0/uTRAfr/nPv2q
 XQltGjakH2FNJ5NEPlc0hucQvvT8Re6XkgF86DnqxQfWEgcLRDmG931lNz2CtzmEpEpo
 +fdbfrv170iKFm3TcM1eTH/frNP+JSbbl2LxJ39NJTe8UGu8rKXkL4aJTuRgtbFwbbxi
 5Dmg==
X-Gm-Message-State: APjAAAUUGjeHGlIM2xcJAuv31/nOXf0ky0k+1IdahbYb2hRSO8T5ig6d
 C2dLDcpkRfUT2peLCFAUMoFtpUYf5SkKAN4kLbhsdFAFF6LuqCtUhJN/Ioor/EYLyCTVojbbBGV
 xD6HRg8s5mZphzyI=
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr9483248wru.40.1579672325405; 
 Tue, 21 Jan 2020 21:52:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwUX6qhJ9g+CBVqdg5HZ9saccMcQTgF0aEefn1nCA+alG3ee+Tu9cJFJTax4Ebc9vHi7RJoyg==
X-Received: by 2002:a5d:6a0f:: with SMTP id m15mr9483220wru.40.1579672325104; 
 Tue, 21 Jan 2020 21:52:05 -0800 (PST)
Received: from redhat.com (bzq-79-176-0-156.red.bezeqint.net. [79.176.0.156])
 by smtp.gmail.com with ESMTPSA id
 z83sm2549268wmg.2.2020.01.21.21.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 21:52:04 -0800 (PST)
Date: Wed, 22 Jan 2020 00:52:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/17] acpi: cpuhp: introduce 'Command data 2' field
Message-ID: <20200122055115.429945-7-mst@redhat.com>
References: <20200122055115.429945-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200122055115.429945-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: 0nLVVY3ZPBq9MPe51RtuHQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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


