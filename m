Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A8F4334BE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:32:36 +0200 (CEST)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnMB-0001Ku-3t
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAA-00009J-Ic
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnA6-0001tW-KB
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DojFyI8EvkqW3utABMlfyrMcp5+zRY2rAvm55Ie1TK0=;
 b=WjN8jMsACM4fp31X+iZhmXVbUTGaubDGRPQd3AFT8HtZCh0ZPnwoUfXzJltGYIJ1fOvNWF
 Mub2r/nySqiDNoAeLVGzxyVW8sZwjodDg5vrsUSYo5HvNYswQp7Tkrb0xsCAAO/cH+LIX3
 aLretRxbLJcZxD3D1MLFIk94g4Y6Wbk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-vHPzoyZRNoqKF9WoWK0Cww-1; Tue, 19 Oct 2021 07:20:04 -0400
X-MC-Unique: vHPzoyZRNoqKF9WoWK0Cww-1
Received: by mail-ed1-f72.google.com with SMTP id
 d3-20020a056402516300b003db863a248eso17239509ede.16
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DojFyI8EvkqW3utABMlfyrMcp5+zRY2rAvm55Ie1TK0=;
 b=KZtQo8GVoOpSZo9o8ZDy+Eoq3a8HlvURvQCQfvjUxknDHb9oLBl18iZQ0K0bnU4Q1j
 HKNVKTlDNU6JdebdpGdj+NYblSaCmJWXS7FLvmMbwbAiyt4NiLyxTFbBi187wvZcQwzp
 2vsikzMh5aAOO4GskpCq+JQvaoRCNnmCru9KcXGooBVOgs+GXdpzoqzYpOR+i229tmh/
 I+Fyy6HA8fhwXzYGgQFSn4hX2d8aNOE6KJFT8y0XqCQtCHGPPqqK+g7vv5uuzjhZivH6
 KKIbJv4gISM7/kpX/QMhvLmY3uce1douwn9gS6cFezb/OoI4dc9nEzSYKgD7ZetEFXet
 CcIg==
X-Gm-Message-State: AOAM533q7Hf1ZAZ6sydXPjA37822qx8wVgH8MwbJCiNb77W8tDg0Us6L
 AVv7eO+YTSu8veil60EmNmqU0xKNS7Rqu1ldyswBcn88HehNicnmVgYq+SrkII9hXQqc/Cr1hUI
 I94JfCZ9VeUcejBfL522/p94xhDdQTAJRl2enquFFOCTFWg+JkjR6frQm3eYO
X-Received: by 2002:a05:6402:1908:: with SMTP id
 e8mr52582552edz.252.1634642403182; 
 Tue, 19 Oct 2021 04:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1P0NCYOn3UayVLO+3C+u3DtArcTuB2+OOqWx7YgTy/Hb7v3oIgZjtOrwXNYDYaRU0l7yVKg==
X-Received: by 2002:a05:6402:1908:: with SMTP id
 e8mr52582522edz.252.1634642402995; 
 Tue, 19 Oct 2021 04:20:02 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id c21sm498824edx.1.2021.10.19.04.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:02 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/29] tests: acpi: add expected blob for DMAR table
Message-ID: <20211019111923.679826-9-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

[000h 0000   4]                    Signature : "DMAR"    [DMA Remapping table]
[004h 0004   4]                 Table Length : 00000078
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : 15
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   1]           Host Address Width : 26
[025h 0037   1]                        Flags : 01
[026h 0038  10]                     Reserved : 00 00 00 00 00 00 00 00 00 00

[030h 0048   2]                Subtable Type : 0000 [Hardware Unit Definition]
[032h 0050   2]                       Length : 0040

[034h 0052   1]                        Flags : 00
[035h 0053   1]                     Reserved : 00
[036h 0054   2]           PCI Segment Number : 0000
[038h 0056   8]        Register Base Address : 00000000FED90000

[040h 0064   1]            Device Scope Type : 03 [IOAPIC Device]
[041h 0065   1]                 Entry Length : 08
[042h 0066   2]                     Reserved : 0000
[044h 0068   1]               Enumeration ID : 00
[045h 0069   1]               PCI Bus Number : FF

[046h 0070   2]                     PCI Path : 00,00

[048h 0072   1]            Device Scope Type : 01 [PCI Endpoint Device]
[049h 0073   1]                 Entry Length : 08
[04Ah 0074   2]                     Reserved : 0000
[04Ch 0076   1]               Enumeration ID : 00
[04Dh 0077   1]               PCI Bus Number : 00

[04Eh 0078   2]                     PCI Path : 00,00

[050h 0080   1]            Device Scope Type : 01 [PCI Endpoint Device]
[051h 0081   1]                 Entry Length : 08
[052h 0082   2]                     Reserved : 0000
[054h 0084   1]               Enumeration ID : 00
[055h 0085   1]               PCI Bus Number : 00

[056h 0086   2]                     PCI Path : 01,00

[058h 0088   1]            Device Scope Type : 01 [PCI Endpoint Device]
[059h 0089   1]                 Entry Length : 08
[05Ah 0090   2]                     Reserved : 0000
[05Ch 0092   1]               Enumeration ID : 00
[05Dh 0093   1]               PCI Bus Number : 00

[05Eh 0094   2]                     PCI Path : 1F,00

[060h 0096   1]            Device Scope Type : 01 [PCI Endpoint Device]
[061h 0097   1]                 Entry Length : 08
[062h 0098   2]                     Reserved : 0000
[064h 0100   1]               Enumeration ID : 00
[065h 0101   1]               PCI Bus Number : 00

[066h 0102   2]                     PCI Path : 1F,02

[068h 0104   1]            Device Scope Type : 01 [PCI Endpoint Device]
[069h 0105   1]                 Entry Length : 08
[06Ah 0106   2]                     Reserved : 0000
[06Ch 0108   1]               Enumeration ID : 00
[06Dh 0109   1]               PCI Bus Number : 00

[06Eh 0110   2]                     PCI Path : 1F,03

[070h 0112   2]                Subtable Type : 0002 [Root Port ATS Capability]
[072h 0114   2]                       Length : 0008

[074h 0116   1]                        Flags : 01
[075h 0117   1]                     Reserved : 00
[076h 0118   2]           PCI Segment Number : 0000

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DMAR.dmar               | Bin 0 -> 120 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index a2843335c8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DMAR.dmar",
diff --git a/tests/data/acpi/q35/DMAR.dmar b/tests/data/acpi/q35/DMAR.dmar
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..0dca6e68ad8a8ca5b981bcfbc745385a63e9f216 100644
GIT binary patch
literal 120
zcmZ?qbquOtU|?Vrb@F%i2v%^42yj*a0!E-1hz+9EKm;5(Kv_5cff&pjK;l18KZphb
W2+atk<zX}vL|mSkiGhOwWE=ohp9%p0

literal 0
HcmV?d00001

-- 
MST


