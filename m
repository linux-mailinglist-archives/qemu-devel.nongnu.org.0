Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985746701F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 03:41:18 +0100 (CET)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msyVg-0000vH-Oc
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 21:41:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1msyUd-00009a-M3
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 21:40:11 -0500
Received: from [2607:f8b0:4864:20::734] (port=46923
 helo=mail-qk1-x734.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1msyUV-0000Zf-7v
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 21:40:11 -0500
Received: by mail-qk1-x734.google.com with SMTP id a11so1985513qkh.13
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 18:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=9OCESwY591yYhLzGj3OXfpQG+zr64bua8Ob3rJuDNtI=;
 b=QrqPEERPqBswASQ51IQZAJUyzZGmhU4FfzAKUAG3sV1QJzipK/UiEJh6Kgh6dy2DQZ
 G+g+vjFNTkbOh6tGpHIDb/D73B+hjGLBr5YgoFTjB0LBkujN6RjaFPc41JaicF5JVcwF
 iiLaxVGeadew6Aj7kP7E9whGjlq+4/bed4A3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=9OCESwY591yYhLzGj3OXfpQG+zr64bua8Ob3rJuDNtI=;
 b=3bmhAediBq4m0XlowOabBy5Qrc1+RDwZ8my95v5mFrIHMQcnh+OIgcK+WKZSb/0qB0
 RK6dN0PrFdW2lNsUhBrbEDBongt9xkplAVK/qOvKHsoRZ2581nOO3dueDFvYz3zqhRBn
 bPNdsxBnKjluGHe/rRWNNCXtS08ih2E/tljCwoZe6lzFFL9yN/pURuJKyYreZ8gr9TzW
 NQJACkFYQx99WUP2yY75LwHHCx57ezypCVL+WP92ZeZM/RclAxjW1OuEARxD4tfe9NrT
 Rf8ERTCvnHG+KrKVrmOPNgiQasyIQj8ul/299pKv1tRprN8xPL63JvRxMCyyd8I8Tdmi
 7DBw==
X-Gm-Message-State: AOAM530FV59PUxE55asQ4k6D0HPOybqzYT4wOPIJJPl8wNbRvGI4RY7g
 xeWfCD/1IJfDF67ARkhkW4tYfDx8nMoQJg==
X-Google-Smtp-Source: ABdhPJxJKMij6JgBBvhnHoSjT/wct/JXageuDxG0U2iVME9koPxWzCTncwhyRmanI3kgja7ZQx8EZQ==
X-Received: by 2002:a05:620a:2848:: with SMTP id
 h8mr16172915qkp.87.1638499201218; 
 Thu, 02 Dec 2021 18:40:01 -0800 (PST)
Received: from localhost ([64.18.9.197])
 by smtp.gmail.com with ESMTPSA id bp38sm1231593qkb.66.2021.12.02.18.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 18:40:01 -0800 (PST)
Date: Thu, 2 Dec 2021 21:40:00 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: seabios@seabios.org, qemu-devel@nongnu.org, coreboot@coreboot.org
Subject: [ANNOUNCE] SeaBIOS 1.15.0
Message-ID: <YamDgHhOtwjU+YX8@morn>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::734
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=kevin@koconnor.net; helo=mail-qk1-x734.google.com
X-Spam_score_int: 20
X-Spam_score: 2.0
X-Spam_bar: ++
X-Spam_report: (2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The 1.15.0 version of SeaBIOS has now been released.  For more
information on the release, please see:

http://seabios.org/Releases


New in this release:

* Improved support for USB devices with multiple interfaces.
* Support for USB XHCI devices using direct MMIO access (instead of PCI).
* NVMe improvements.
* Increased "f-segment" RAM allocations for BIOS tables.
* Several bug fixes and code cleanups.


For information on obtaining SeaBIOS, please see:

http://seabios.org/Download


===== git shortlog -n rel-1.14.0..rel-1.15.0 =====

Gerd Hoffmann (9):
      output: add support for uppercase hex numbers
      dsdt: add support for pnp ids as strings
      usb: add boot prio support for mmio host adapters
      usb/xhci: split xhci setup into generic and pci parts
      usb/xhci: add support for mmio host adapters (via acpi).
      usb boot: add xhci mmio example
      nvme: improve namespace allocation
      nvme: drive desc should not include the newline
      Increase BUILD_MIN_BIOSTABLE for large roms

Alexander Graf (4):
      nvme: Record maximum allowed request size
      nvme: Allow to set PRP2
      nvme: Pass large I/O requests as PRP lists
      nvme: Split requests by maximum allowed size

Stefan Berger (4):
      tcgbios: Fix details in log entries
      Add implementations for sha256, sha384, and sha512
      tcgbios: Use The proper sha function for each PCR bank
      tcgbios: Disable platform hierarchy in case of failure

Volker Rümelin (2):
      stacks: call check_irqs() in run_thread()
      stacks: call check_irqs() after switch_next()

Alex Martens via SeaBIOS (1):
      nvme: fix missing newline on sq full print

Daniel P. Berrangé (1):
      smbios: avoid integer overflow when adding SMBIOS type 0 table

David Woodhouse (1):
      nvme: Clean up nvme_cmd_readwrite()

Kevin O'Connor (1):
      docs: Note v1.15.0 release

Matt DeVillier (1):
      usb.c: Fix devices using non-primary interface descriptor

Mike Banon (1):
      Support booting USB drives with a write protect switch enabled

Sergei Trofimovich (1):
      vgasrc: ignore .node.gnu.property (binutils-2.36 support)

Stefan Ott via SeaBIOS (1):
      usb-hid: Increase MAX_KBD_EVENT

weitaowang-oc@zhaoxin.com (1):
      USB:Fix xHCI initail fail by using longer reset and CNR clear timeout value

