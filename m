Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505DB240AB9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 17:44:53 +0200 (CEST)
Received: from localhost ([::1]:59286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k59ym-0000Ps-D5
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 11:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1k59xe-0007zI-Kv
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 11:43:42 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1k59xc-0000oO-CI
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 11:43:42 -0400
Received: by mail-qk1-x730.google.com with SMTP id b14so8740031qkn.4
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=l+gZJMIUHPcIAwADlv6f4Euq8WeOhW8STveKLJQ0yjE=;
 b=Pturvk0gzan0MmFKYQeAxq9tYzhZslBr7qy5Gt3EOcQ2CtelOC1s3EXWyv7TYFcq/7
 1H4U9QSDIWY3INQqzLoj9zkd+STN3G8Le1XzdYbH/8ow10Az1BxSQQ9JLlQ8dkD9jnrg
 WBX7m2HnKcZf3ScvEJsqbizKPvIo0U2rTL0Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=l+gZJMIUHPcIAwADlv6f4Euq8WeOhW8STveKLJQ0yjE=;
 b=hvksXdX67APQxAa4BXjGkCJAxSU/plfwmmkpNfOQ4bRrlwhb/USRSfaeUJWc8Q5Jyv
 eR0EZr9jOA9rR265ckkCQ8dv0210oiY9Hi8amJlB8c5QwIZtefiPj79ykjIMQecG1dnG
 5G00u5ZessOxsk0C8yYwKnPnGcWvuC2thjIyCy1Yhwpcm9+NDA532A5t6t+xinzUxKdh
 n2Cb5lZoo8BaZluioY79O1DYQ072npXXM3XimiH/+ZVHqgBE7rMdd3I8T3yRRaSYrxjR
 DpCP7pgvO6Iyvypu2pZGbes+s+gP/isQ2SuxrYgcbRUjW7vXddlPYhS/6iDRtHCQMxCB
 OHWw==
X-Gm-Message-State: AOAM533bBdbVHA6XdhMsxEiqTQlnlDDXtzmBBhk4GFPIcGsU6w/zi/K/
 YX+WGnUDEajficc2O4GR4fVDQNmg+0Q=
X-Google-Smtp-Source: ABdhPJyeojddMPngIbWp/Lc6GZ+sqbz6E/h7gMTtuMnUOUDrg2W2CFQCWrGO5JjbeI2Z786+q01zqw==
X-Received: by 2002:ae9:dc45:: with SMTP id q66mr26456388qkf.55.1597074218099; 
 Mon, 10 Aug 2020 08:43:38 -0700 (PDT)
Received: from localhost ([64.18.9.253])
 by smtp.gmail.com with ESMTPSA id z197sm14606031qkb.66.2020.08.10.08.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 08:43:37 -0700 (PDT)
Date: Mon, 10 Aug 2020 11:43:36 -0400
From: Kevin O'Connor <kevin@koconnor.net>
To: seabios@seabios.org, qemu-devel@nongnu.org, coreboot@coreboot.org
Subject: [ANNOUNCE] SeaBIOS 1.14.0
Message-ID: <20200810154336.GA3995464@morn.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=kevin@koconnor.net; helo=mail-qk1-x730.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 1.14.0 version of SeaBIOS has now been released.  For more
information on the release, please see:

http://seabios.org/Releases


New in this release:

* New virtio MMIO support. Support for finding virtio MMIO devices via
  an ACPI DSDT parser. Support for handling a large number of virtio
  devices.
* Improved handling of USB keyboards with non-standard packet size.
* Improved KVM CPU frequency detection.
* Support for PCI mmconfig support on QEMU.
* Several bug fixes and code cleanups.


For information on obtaining SeaBIOS, please see:

http://seabios.org/Download


===== git shortlog -n rel-1.13.0..rel-1.14.0 =====

Gerd Hoffmann (25):
      boot: cache HALT priority
      virtio-scsi: skip initializing non-bootable devices
      nvme: skip initializing non-bootable devices
      timer: add tsctimer_setfreq()
      kvm: detect unconditionally
      kvm: add support for reading tsc frequency via cpuid.
      kvm: add support for reading tsc frequency from kvmclock
      sercon: vbe modeset is int 10h function 4f02 not 4f00
      pci: factor out ioconfig_cmd()
      pci: add mmconfig support
      qemu: factor out qemu_cfg_detect()
      qemu: rework e820 detection
      qemu: check rtc presence before reading cpu count from cmos
      virtio-mmio: device probing and initialization.
      virtio-mmio: add support to vp_*() functions
      virtio-mmio: add support for scsi devices.
      virtio-mmio: add support for block devices.
      virtio-mmio: print device type
      acpi: add xsdt support
      acpi: add dsdt parser
      acpi: skip kbd init if not present
      acpi: find and register virtio-mmio devices
      rewrap Makefile lines.
      pci: fix mmconfig support
      vga: fix cirrus bios

Kevin O'Connor (6):
      usb-hid: Improve max packet size checking
      Revert "ps2port: adjust init routine to fix PS/2 keyboard issues"
      boot: Fixup check for only one item in boot list
      vgabios: Fix preserve memory flag in handle_1000
      ldnoexec: Add script to remove ET_EXEC flag from intermediate build objects
      docs: Note v1.14.0 release

Paul Menzel (5):
      std/tcg: Replace zero-length array with flexible-array member
      boot: Extend `etc/show-boot-menu` to configure skipping boot menu with only one device
      boot: Log, if boot menu is skipped
      cdrom: Demote `scsi_is_ready` return print to debug level
      nvme: Increase `nvme_cmd_readwrite()` message log level from 3 to 5

Matt DeVillier (4):
      hw/usb-hid: Don't abort if setting key repeat rate fails
      Skip boot menu and timeout with only one boot device
      ps2port: adjust init routine to fix PS/2 keyboard issues
      boot: Fix logic for boot menu display

Stefan Berger (3):
      tcgbios: Only write logs for PCRs that are in active PCR banks
      tcgbios: Fix the vendorInfoSize to be of type u8
      tcgbios: Add support for SHA3 type of algorithms

Alexey Kirillov (2):
      boot: Detect strict boot order (HALT record) in function
      virtio: Do not init non-bootable devices

Christian Ehrhardt (1):
      build: use -fcf-protection=none when available

Jason Andryuk (1):
      serialio: Preserve Xen DebugOutputPort

Roman Bolshakov (1):
      timer: Handle decrements of PIT counter

Stefan Reiter (1):
      virtio-scsi: fix boot prio detection by using correct lun

