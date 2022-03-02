Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CA14C9B1D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 03:21:15 +0100 (CET)
Received: from localhost ([::1]:40950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPEc5-00046a-Os
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 21:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1nPEa6-0003MW-8M
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 21:19:10 -0500
Received: from [2607:f8b0:4864:20::729] (port=33493
 helo=mail-qk1-x729.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1nPEa4-0004I4-He
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 21:19:09 -0500
Received: by mail-qk1-x729.google.com with SMTP id bm39so253806qkb.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 18:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=UJOcCZqG3kaDGHYV36amzYP+1AtThbTywGebMQgNhPU=;
 b=ankiM8aHExCEF6p6n5MJ5sIjlWQ+QwBLdLGm53MZAZwZOHp42F50P9Kuo7wCucLwRg
 RG+qnlAkCuea6hKOxMoBlQknCHdQ7BoZZPJbKfAbGK2Gdl3LEU4QA4uiuEHOTiqoT+Eq
 Ybh29xEkArihsN3wu0QK6V2tm32BL2Iy+X12U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=UJOcCZqG3kaDGHYV36amzYP+1AtThbTywGebMQgNhPU=;
 b=3jyLsrzClQdJuEBcyNF522np4jAzxLqJEEgeG0EUaGrBBN0fEiri5iYYOl7Qd7jfOw
 wzemGaaCWpN8uM4fHig+SaUpwnJ+z0R9CP5NQ/fUrxfz0RzMFhtCA2d6vxvyOtU88IbM
 Sjrw+GaD25gD5z464I5XgNPPG6U+cWaR2rgSyFPUJTzncpFnY5SSLa/Lyqh/IGqzMtFi
 3z6pQwFhzlc8jBuQPdDkFNS4cbsnyQjhHsQ1/snrDTxujazpbBvgXWcaa0aJjyt3Q/lz
 nes2aW0f30Ydl1zD7RCovOY+q2zBPsHIqPSRoTaLVdyM9AlpffxzbcV/2MJ9hbsvfvI4
 TwyQ==
X-Gm-Message-State: AOAM531uKlIPkf4/0ErOz9Ztt9aUng0tdi6obHx1s3z4dqWPU9qVS9wj
 jWpZ9aB5vS1lon3MD90DxUrI3w==
X-Google-Smtp-Source: ABdhPJxmwjSeXz/YyVnrQV99w/p+F/ww5P3QdkqXI2+PNXuTbKs0OEP7eUUCgTornlRZKplbQ37Tew==
X-Received: by 2002:a37:755:0:b0:60d:d47b:aaa1 with SMTP id
 82-20020a370755000000b0060dd47baaa1mr15825662qkh.688.1646187547045; 
 Tue, 01 Mar 2022 18:19:07 -0800 (PST)
Received: from localhost ([64.18.9.200]) by smtp.gmail.com with ESMTPSA id
 23-20020a370a17000000b00479cd6a3e61sm7386523qkk.113.2022.03.01.18.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 18:19:06 -0800 (PST)
Date: Tue, 1 Mar 2022 21:19:06 -0500
From: Kevin O'Connor <kevin@koconnor.net>
To: seabios@seabios.org, qemu-devel@nongnu.org, coreboot@coreboot.org
Subject: [ANNOUNCE] SeaBIOS 1.16.0
Message-ID: <Yh7UGn7Km6CJM2MG@morn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::729
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=kevin@koconnor.net; helo=mail-qk1-x729.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The 1.16.0 version of SeaBIOS has now been released.  For more
information on the release, please see:

https://seabios.org/Releases


New in this release:

* SMBIOS v3.0 support on QEMU
* Several bug fixes and code cleanups.


For information on obtaining SeaBIOS, please see:

https://seabios.org/Download


===== git shortlog -n rel-1.15.0..rel-1.16.0 =====

Eduardo Habkost (19):
      biostables: copy_fseg_table() function
      util.h: Delete unused get_smbios_entry_point() prototype
      smbios: Rename code specific for SMBIOS 2.1 entry points
      smbios: Generic smbios_next() function
      smbios: smbios_get_tables() function
      smbios: Use smbios_get_tables()/smbios_next() at display_uuid()
      smbios: smbios_major_version()/smbios_minor_version() helpers
      tpm: Use smbios_get_tables()
      csm: Don't check SMBios21Addr before calling copy_smbios_21()
      smbios: Make SMBios21Addr variable static
      smbios: Use smbios_next() at smbios_romfile_setup()
      smbios: Extract SMBIOS table building code to separate function
      smbios: Make smbios_build_tables() more generic
      smbios: smbios_21_setup_entry_point() function
      smbios: Make some smbios_build_tables() arguments optional
      smbios: Make smbios_build_tables() ready for 64-bit tables
      smbios: copy_smbios_30() function
      smbios: Support SMBIOS 3.0 entry point at copy_table()
      smbios: Support SMBIOS 3.0 entry point at smbios_romfile_setup()

Kevin O'Connor (13):
      vgasrc: Don't use VAR16 in header files to fix gcc warning
      memmap: Fix gcc out-of-bounds warning
      readserial: Improve Python3 compatibility
      scripts: Remove python23compat.py
      smm: Suppress gcc array-bounds warnings
      nvme: Rework nvme_io_readwrite() to return -1 on error
      nvme: Add nvme_bounce_xfer() helper function
      nvme: Convert nvme_build_prpl() to nvme_prpl_xfer()
      nvme: Pass prp1 and prp2 directly to nvme_io_xfer()
      nvme: Build the page list in the existing dma buffer
      nvme: Only allocate one dma bounce buffer for all nvme drives
      sercon: Fix missing GET_LOW() to access rx_bytes
      docs: Note v1.16.0 release

Andy Pei (3):
      virtio-blk: add feature VIRTIO_BLK_F_SIZE_MAX and VIRTIO_BLK_F_SEG_MAX
      virtio-blk: abstract a function named virtio_blk_op_one_segment to handle r/w request
      virtio-blk: split large IO according to size_max

Igor Mammedov (2):
      pci: reserve resources for pcie-pci-bridge to fix regressed hotplug on q35
      pci: let firmware reserve IO for pcie-pci-bridge

Florian Larysch (1):
      nvme: fix LBA format data structure

Gerd Hoffmann (1):
      svgamodes: add standard 4k modes

Jan Beulich via SeaBIOS (1):
      nvme: avoid use-after-free in nvme_controller_enable()

