Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBFA3AA5DB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:02:22 +0200 (CEST)
Received: from localhost ([::1]:55678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcg1-0006Cg-4g
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPn-0003nq-PQ
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPj-0001Vp-QS
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kB/lnjMU7yko7yxzqp5L1QJkdTuRfvKiLBaXoDmFI74=;
 b=fY4BuIpaotiFHq83JGcJcsh1bAw4zVy5eOQpC/zJjJn576CSFiJ7+gdzRQ6TPaMTVy6ejw
 96MaF36E8ye5pki68ugcd2z/j7RTkrBrIdeuxyNqOcXCw7alnSXCzKXwQkIYONHoU6VUTI
 PE2KCw+HrWDj3htL90jZEJ47Pdv3Scs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-fN2cl6ylM0iyItjP-mKRAQ-1; Wed, 16 Jun 2021 16:45:29 -0400
X-MC-Unique: fN2cl6ylM0iyItjP-mKRAQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l2-20020adfe5820000b029011a64161d6aso1878198wrm.6
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kB/lnjMU7yko7yxzqp5L1QJkdTuRfvKiLBaXoDmFI74=;
 b=QmXFlapurCCv+XZtuJI9rX/ppe4uEYThjUtZ3PKMt2mlABGwR7sUulj2/9EjMKjebT
 xZA/2HS+jNGUcYwbLF5ZR1Oul932ng7m7EPLRfVROACSpww0+ilBF8i0TUgSkjS4+8cP
 6txpbQSKreOio+jN8EE6YPj0RMeRzlwB91UV26Mp3wzGP/ejEFN8fqfATGrGSwuFyg6+
 C+Jfk4v8/aYC5JRhIBIoWgCdOmDutW/ewJbIuyOfNqnBEzoo870XapK1fD4ejQwzkskB
 wEzBMJLARRL55/UjPiSccEQbI5tHejXP43CV+ZqwnOcOGtkNMmI5ejD4kXL5OqWolguC
 M9Eg==
X-Gm-Message-State: AOAM533bxw+Kxh7YqgI8F+oZzsWGt1ZrOZjbe1ETUaERkIQXzOdfLNh5
 oUnrleJY1C8n5wWGGbSx6qDYJzqh7tvPPxOaB/j/RH5UvVBafzUw9RHF/f6VEsIFTuqP4vdk+mJ
 P/Yb/fIBVvQ/i7HwiL3mxr0LjLHyQ6ypoqr/wT58tA/7t/TuH1TENaL29Mj0kPLSr
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr1127412wrj.239.1623876325783; 
 Wed, 16 Jun 2021 13:45:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw53BQ1SMsPqvO4fURGSFllRvkC0CXmHJChOxJiIEabG7B6FsV35smhBRFBfOjNPyOy/OCoKw==
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr1127374wrj.239.1623876325579; 
 Wed, 16 Jun 2021 13:45:25 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x18sm3116234wrw.19.2021.06.16.13.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:45:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/23] hw/acpi: Do not restrict ACPI core routines to x86
 architecture
Date: Wed, 16 Jun 2021 22:43:25 +0200
Message-Id: <20210616204328.2611406-21-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ACPI core routines (in core.c) are not really x86-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/acpi/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index dd69577212a..c23c67f4283 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -3,6 +3,7 @@
   'acpi_interface.c',
   'aml-build.c',
   'bios-linker-loader.c',
+  'core.c',
   'utils.c',
 ))
 acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
@@ -14,7 +15,7 @@
 acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
-acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
-- 
2.31.1


