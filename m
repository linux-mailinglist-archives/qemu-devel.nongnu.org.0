Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1F926F6D7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 09:25:09 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJAlY-0003Xk-4t
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 03:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kJAk8-0002SE-Im
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:23:40 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kJAk6-0003GN-63
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 03:23:40 -0400
Received: by mail-pl1-x631.google.com with SMTP id j7so2517260plk.11
 for <qemu-devel@nongnu.org>; Fri, 18 Sep 2020 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=UDCd78/ULuyBm3JLsRX2QA33JU98NBsfy8nDAJpX+Ic=;
 b=UOL4sYDZa6pgLRtqwO3976MFNoTOiYBiAo4YckQC10In8I2nvEoqPm1vfueYnYNBFD
 nheXDw9Yv4WJLL2IokFLMJIYUWb1ACQJwXzENhgzdtDzeTp4RVCMA1HSSpaEWdq5zzMm
 FbAbf8xwk+3u2HVmGaTA7yU3xJLfeUGKMx38qvqNrtaw2aLyBTbUo/bZNZ2Xv990+88W
 qutzYrGhF4nvWD05+HvpbfgFqiUofwV8mLCFlwQIJk5kRQNYD+iO7Av8EfWYy7Tq3/w5
 v/EJfQRWzFdZiAXqMlolwET8sKW4ci/34HugkjZ+p5oY1OcLfSqp0hanYMP7SoYfNw57
 q6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UDCd78/ULuyBm3JLsRX2QA33JU98NBsfy8nDAJpX+Ic=;
 b=Zl1uMduOI34WjixtW3xHfiWMh8aDfx6ITf8Hvp69zlD2+Sx+DBDwHj+4pl+35AIi8t
 PsdHJ5gfeihfSVBD6/Fd0oKjA5zBTayxG54Mc5Fx6QVv67pxWvUxRelxrIzlZ9e/vJNy
 nrzPGxgcjC80MZXWdwzRZDdzkEqxkIqb9wtrw1YA5mFuMSUjvu1doKVajd4wXKaRls5y
 ZSIRQWZYwgAoXOzZ4TPEb7Mg0qU1mIKkN0XFSRersAjM77it46Q8Z6uEXKIebBay00Ad
 CiZWs2UM3x39WwscWz8JMeHOj2vMZPkF7K5OomPuSO+bU2eDQO1Sv1qXlLG0y9nfP3PS
 KI2A==
X-Gm-Message-State: AOAM532K27cSnO2MH9GxC5TrepIVR3Hl3VjKPwxmQkyZoIuSLDeYf3AZ
 XU44U3APmYh1m0eX0ekzYFlN8vXvjE86mG9U
X-Google-Smtp-Source: ABdhPJydVTtrMtvADX2OZr5jbEJJtb6Gs5op/53zqzHAy5qihoZibBDbyHa1XtTDpO33bFJYPIQhFA==
X-Received: by 2002:a17:902:a405:b029:d1:e598:3ffc with SMTP id
 p5-20020a170902a405b02900d1e5983ffcmr14833457plq.54.1600413815979; 
 Fri, 18 Sep 2020 00:23:35 -0700 (PDT)
Received: from localhost.localdomain ([115.96.124.157])
 by smtp.googlemail.com with ESMTPSA id b18sm2010782pfr.4.2020.09.18.00.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 00:23:35 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 00/13]  i440fx/acpi: addition of feature and bug fixes
Date: Fri, 18 Sep 2020 12:53:12 +0530
Message-Id: <20200918072325.9933-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v9:
added a new patch which adds names of changed acpi blobs in bios-tables-test-accepted-diff.h


Ani Sinha (13):
  tests/acpi: mark addition of table DSDT.roothp for unit testing root
    pci hotplug
  tests/acpi: add new unit test to test hotplug off/on feature on the
    root pci bus
  tests/acpi: add a new ACPI table in order to test root pci hotplug
    on/off
  Fix a gap where acpi_pcihp_find_hotplug_bus() returns a
    non-hotpluggable bus
  i440fx/acpi: do not add hotplug related amls for cold plugged bridges
  tests/acpi: list added acpi table binary file for pci bridge hotplug
    test
  tests/acpi: unit test for 'acpi-pci-hotplug-with-bridge-support'
    bridge flag
  tests/acpi: add newly added acpi DSDT table blob for pci bridge
    hotplug flag
  Add ACPI DSDT tables for q35 that are being updated by the next patch
  piix4: don't reserve hw resources when hotplug is off globally
  tests/acpi: update golden master DSDT binary table blobs for q35
  tests/acpi: unit test exercising global pci hotplug off for i440fx
  tests/acpi: add DSDT.hpbrroot DSDT table blob to test global i440fx
    hotplug

 hw/acpi/pcihp.c                   |  15 +++++++++
 hw/acpi/piix4.c                   |   6 ++--
 hw/i386/acpi-build.c              |  37 ++++++++++++++--------
 tests/data/acpi/pc/DSDT.hpbridge  | Bin 0 -> 4895 bytes
 tests/data/acpi/pc/DSDT.hpbrroot  | Bin 0 -> 2953 bytes
 tests/data/acpi/pc/DSDT.roothp    | Bin 0 -> 5130 bytes
 tests/data/acpi/q35/DSDT          | Bin 7678 -> 7670 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9002 -> 8994 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7695 -> 7688 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8141 -> 8133 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9331 -> 9323 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7753 -> 7745 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9037 -> 9029 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8808 -> 8801 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7684 -> 7676 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8283 -> 8276 bytes
 tests/qtest/bios-tables-test.c    |  49 ++++++++++++++++++++++++++++++
 17 files changed, 92 insertions(+), 15 deletions(-)
 create mode 100644 tests/data/acpi/pc/DSDT.hpbridge
 create mode 100644 tests/data/acpi/pc/DSDT.hpbrroot
 create mode 100644 tests/data/acpi/pc/DSDT.roothp

-- 
2.17.1


