Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F4457134
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:53:36 +0100 (CET)
Received: from localhost ([::1]:36070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5Gh-00056e-5g
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:53:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo59B-0002i9-5U
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:49 -0500
Received: from [2a00:1450:4864:20::52a] (port=34644
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo597-0003aV-Ou
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:48 -0500
Received: by mail-ed1-x52a.google.com with SMTP id x15so43743308edv.1
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVu/KlfSjin8bS+0R2IT+zvUaoBK48OnJEf++UCzYjk=;
 b=Puk8/Az5M5Qd9QlrujgFmB7unAVnIMonQeDMPhFoc2R8SABlJW9WDHXh3Lb7iamUlX
 zEh3vQVK8QZsreBXaaZhJszVzkytSLRd9YFXpezdKKVQ93RAuhxzKXzWHtqx/JEISnQS
 cFKv6snTRc5jc21T12Mb2LPrpmTN05NJJE1Yd1GRBLXF8piMgJOW+Xl8pdxrsH54SxaG
 EG1yrRQexL0MLmjPENIS6I4ZsnQkFz/6JaNeMTIsY7/NwgMS7okV+boSdw4gl5+hB29E
 4lmJva6oWkuW8jxBR8Caem3ebTRLf4hulo6NNrJmyJez57XPn0TPItTJpxWhnkBR+UYA
 n9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UVu/KlfSjin8bS+0R2IT+zvUaoBK48OnJEf++UCzYjk=;
 b=u9ZYKRf82ZugkiRuyrPgjfa1bewN5E2Tjzr+t8NcWKiNFq31Qgwca/QAEjOO++ZNi0
 ZCyK7ZEjGhggmPeb1ETJu0uLomnZgPDTeYmER/uade6szg7FBR9gPih2rHHGDvzXopn7
 mhNsTSuhfOdvXl5HDuRBdk3OCRjXXc4hUhFl7e4PQCubHGp7NBXGBgy6UM8XCWxI1weT
 aL9EueAHeCd0SiOQSOEpN2M3bCFFw/RaCE9Wj+C8WaD+CfvU3wI9sencOUDxJMwS1QvA
 Y3wYR5ohRbBqyXniTNpwipMHHlAt7TG7JWYoX1xGpps8NeISGHesBZhO551Zgbk5CxYv
 Y7Hg==
X-Gm-Message-State: AOAM530z0r6ACmNdcfgfiuDT5wwrn6UpNchJDoG5DSuUe2gZW1c4Px2w
 Irh5WE49/t6i7O8xVFKa7VqLKQnibTw=
X-Google-Smtp-Source: ABdhPJzn+3YC9NqLQj3+7t4oCo64+CbecqIragFWb0UXDzdSfrDhakJmOdR+hJC9H3UojIbJszaS+w==
X-Received: by 2002:a17:907:961a:: with SMTP id
 gb26mr8298000ejc.71.1637333144254; 
 Fri, 19 Nov 2021 06:45:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z25sm26934ejd.80.2021.11.19.06.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:45:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] docs: Spell QEMU all caps
Date: Fri, 19 Nov 2021 15:45:37 +0100
Message-Id: <20211119144539.285740-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119144539.285740-1-pbonzini@redhat.com>
References: <20211119144539.285740-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Replace Qemu -> QEMU.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20211118143401.4101497-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/modules.rst                |  2 +-
 docs/devel/multi-thread-tcg.rst       |  2 +-
 docs/devel/style.rst                  |  2 +-
 docs/devel/ui.rst                     |  4 ++--
 docs/interop/nbd.txt                  |  6 +++---
 docs/interop/qcow2.txt                |  8 ++++----
 docs/multiseat.txt                    |  2 +-
 docs/system/device-url-syntax.rst.inc |  2 +-
 docs/system/i386/sgx.rst              | 26 +++++++++++++-------------
 docs/u2f.txt                          |  2 +-
 10 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/docs/devel/modules.rst b/docs/devel/modules.rst
index 066f347b89..8e999c4fa4 100644
--- a/docs/devel/modules.rst
+++ b/docs/devel/modules.rst
@@ -1,5 +1,5 @@
 ============
-Qemu modules
+QEMU modules
 ============
 
 .. kernel-doc:: include/qemu/module.h
diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 5b446ee08b..c9541a7b20 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -228,7 +228,7 @@ Emulated hardware state
 
 Currently thanks to KVM work any access to IO memory is automatically
 protected by the global iothread mutex, also known as the BQL (Big
-Qemu Lock). Any IO region that doesn't use global mutex is expected to
+QEMU Lock). Any IO region that doesn't use global mutex is expected to
 do its own locking.
 
 However IO memory isn't the only way emulated hardware state can be
diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 260e3263fa..e00af62e76 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -686,7 +686,7 @@ Rationale: hex numbers are hard to read in logs when there is no 0x prefix,
 especially when (occasionally) the representation doesn't contain any letters
 and especially in one line with other decimal numbers. Number groups are allowed
 to not use '0x' because for some things notations like %x.%x.%x are used not
-only in Qemu. Also dumping raw data bytes with '0x' is less readable.
+only in QEMU. Also dumping raw data bytes with '0x' is less readable.
 
 '#' printf flag
 ---------------
diff --git a/docs/devel/ui.rst b/docs/devel/ui.rst
index 06c7d622ce..17fb667dec 100644
--- a/docs/devel/ui.rst
+++ b/docs/devel/ui.rst
@@ -1,8 +1,8 @@
 =================
-Qemu UI subsystem
+QEMU UI subsystem
 =================
 
-Qemu Clipboard
+QEMU Clipboard
 --------------
 
 .. kernel-doc:: include/ui/clipboard.h
diff --git a/docs/interop/nbd.txt b/docs/interop/nbd.txt
index 10ce098a29..bdb0f2a41a 100644
--- a/docs/interop/nbd.txt
+++ b/docs/interop/nbd.txt
@@ -1,4 +1,4 @@
-Qemu supports the NBD protocol, and has an internal NBD client (see
+QEMU supports the NBD protocol, and has an internal NBD client (see
 block/nbd.c), an internal NBD server (see blockdev-nbd.c), and an
 external NBD server tool (see qemu-nbd.c). The common code is placed
 in nbd/*.
@@ -7,11 +7,11 @@ The NBD protocol is specified here:
 https://github.com/NetworkBlockDevice/nbd/blob/master/doc/proto.md
 
 The following paragraphs describe some specific properties of NBD
-protocol realization in Qemu.
+protocol realization in QEMU.
 
 = Metadata namespaces =
 
-Qemu supports the "base:allocation" metadata context as defined in the
+QEMU supports the "base:allocation" metadata context as defined in the
 NBD protocol specification, and also defines an additional metadata
 namespace "qemu".
 
diff --git a/docs/interop/qcow2.txt b/docs/interop/qcow2.txt
index 0463f761ef..f7dc304ff6 100644
--- a/docs/interop/qcow2.txt
+++ b/docs/interop/qcow2.txt
@@ -313,7 +313,7 @@ The fields of the bitmaps extension are:
                    The number of bitmaps contained in the image. Must be
                    greater than or equal to 1.
 
-                   Note: Qemu currently only supports up to 65535 bitmaps per
+                   Note: QEMU currently only supports up to 65535 bitmaps per
                    image.
 
           4 -  7:  Reserved, must be zero.
@@ -775,7 +775,7 @@ Structure of a bitmap directory entry:
                       2: extra_data_compatible
                          This flags is meaningful when the extra data is
                          unknown to the software (currently any extra data is
-                         unknown to Qemu).
+                         unknown to QEMU).
                          If it is set, the bitmap may be used as expected, extra
                          data must be left as is.
                          If it is not set, the bitmap must not be used, but
@@ -793,7 +793,7 @@ Structure of a bitmap directory entry:
              17:    granularity_bits
                     Granularity bits. Valid values: 0 - 63.
 
-                    Note: Qemu currently supports only values 9 - 31.
+                    Note: QEMU currently supports only values 9 - 31.
 
                     Granularity is calculated as
                         granularity = 1 << granularity_bits
@@ -804,7 +804,7 @@ Structure of a bitmap directory entry:
         18 - 19:    name_size
                     Size of the bitmap name. Must be non-zero.
 
-                    Note: Qemu currently doesn't support values greater than
+                    Note: QEMU currently doesn't support values greater than
                     1023.
 
         20 - 23:    extra_data_size
diff --git a/docs/multiseat.txt b/docs/multiseat.txt
index 11850c96ff..2b297e979d 100644
--- a/docs/multiseat.txt
+++ b/docs/multiseat.txt
@@ -123,7 +123,7 @@ Background info is here:
 guest side with pci-bridge-seat
 -------------------------------
 
-Qemu version 2.4 and newer has a new pci-bridge-seat device which
+QEMU version 2.4 and newer has a new pci-bridge-seat device which
 can be used instead of pci-bridge.  Just swap the device name in the
 qemu command line above.  The only difference between the two devices
 is the pci id.  We can match the pci id instead of the device path
diff --git a/docs/system/device-url-syntax.rst.inc b/docs/system/device-url-syntax.rst.inc
index d15a021508..7dbc525fa8 100644
--- a/docs/system/device-url-syntax.rst.inc
+++ b/docs/system/device-url-syntax.rst.inc
@@ -15,7 +15,7 @@ These are specified using a special URL syntax.
    'iqn.2008-11.org.linux-kvm[:<name>]' but this can also be set from
    the command line or a configuration file.
 
-   Since version Qemu 2.4 it is possible to specify a iSCSI request
+   Since version QEMU 2.4 it is possible to specify a iSCSI request
    timeout to detect stalled requests and force a reestablishment of the
    session. The timeout is specified in seconds. The default is 0 which
    means no timeout. Libiscsi 1.15.0 or greater is required for this
diff --git a/docs/system/i386/sgx.rst b/docs/system/i386/sgx.rst
index 9aa161af1a..f8fade5ac2 100644
--- a/docs/system/i386/sgx.rst
+++ b/docs/system/i386/sgx.rst
@@ -20,13 +20,13 @@ report the same CPUID info to guest as on host for most of SGX CPUID. With
 reporting the same CPUID guest is able to use full capacity of SGX, and KVM
 doesn't need to emulate those info.
 
-The guest's EPC base and size are determined by Qemu, and KVM needs Qemu to
+The guest's EPC base and size are determined by QEMU, and KVM needs QEMU to
 notify such info to it before it can initialize SGX for guest.
 
 Virtual EPC
 ~~~~~~~~~~~
 
-By default, Qemu does not assign EPC to a VM, i.e. fully enabling SGX in a VM
+By default, QEMU does not assign EPC to a VM, i.e. fully enabling SGX in a VM
 requires explicit allocation of EPC to the VM. Similar to other specialized
 memory types, e.g. hugetlbfs, EPC is exposed as a memory backend.
 
@@ -35,12 +35,12 @@ prior to realizing the vCPUs themselves, which occurs long before generic
 devices are parsed and realized.  This limitation means that EPC does not
 require -maxmem as EPC is not treated as {cold,hot}plugged memory.
 
-Qemu does not artificially restrict the number of EPC sections exposed to a
-guest, e.g. Qemu will happily allow you to create 64 1M EPC sections. Be aware
+QEMU does not artificially restrict the number of EPC sections exposed to a
+guest, e.g. QEMU will happily allow you to create 64 1M EPC sections. Be aware
 that some kernels may not recognize all EPC sections, e.g. the Linux SGX driver
 is hardwired to support only 8 EPC sections.
 
-The following Qemu snippet creates two EPC sections, with 64M pre-allocated
+The following QEMU snippet creates two EPC sections, with 64M pre-allocated
 to the VM and an additional 28M mapped but not allocated::
 
  -object memory-backend-epc,id=mem1,size=64M,prealloc=on \
@@ -54,7 +54,7 @@ to physical EPC. Because physical EPC is protected via range registers,
 the size of the physical EPC must be a power of two (though software sees
 a subset of the full EPC, e.g. 92M or 128M) and the EPC must be naturally
 aligned.  KVM SGX's virtual EPC is purely a software construct and only
-requires the size and location to be page aligned. Qemu enforces the EPC
+requires the size and location to be page aligned. QEMU enforces the EPC
 size is a multiple of 4k and will ensure the base of the EPC is 4k aligned.
 To simplify the implementation, EPC is always located above 4g in the guest
 physical address space.
@@ -62,7 +62,7 @@ physical address space.
 Migration
 ~~~~~~~~~
 
-Qemu/KVM doesn't prevent live migrating SGX VMs, although from hardware's
+QEMU/KVM doesn't prevent live migrating SGX VMs, although from hardware's
 perspective, SGX doesn't support live migration, since both EPC and the SGX
 key hierarchy are bound to the physical platform. However live migration
 can be supported in the sense if guest software stack can support recreating
@@ -76,7 +76,7 @@ CPUID
 ~~~~~
 
 Due to its myriad dependencies, SGX is currently not listed as supported
-in any of Qemu's built-in CPU configuration. To expose SGX (and SGX Launch
+in any of QEMU's built-in CPU configuration. To expose SGX (and SGX Launch
 Control) to a guest, you must either use ``-cpu host`` to pass-through the
 host CPU model, or explicitly enable SGX when using a built-in CPU model,
 e.g. via ``-cpu <model>,+sgx`` or ``-cpu <model>,+sgx,+sgxlc``.
@@ -101,7 +101,7 @@ controlled via -cpu are prefixed with "sgx", e.g.::
   sgx2
   sgxlc
 
-The following Qemu snippet passes through the host CPU but restricts access to
+The following QEMU snippet passes through the host CPU but restricts access to
 the provision and EINIT token keys::
 
  -cpu host,-sgx-provisionkey,-sgx-tokenkey
@@ -112,11 +112,11 @@ in hardware cannot be forced on via '-cpu'.
 Virtualize SGX Launch Control
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-Qemu SGX support for Launch Control (LC) is passive, in the sense that it
-does not actively change the LC configuration.  Qemu SGX provides the user
+QEMU SGX support for Launch Control (LC) is passive, in the sense that it
+does not actively change the LC configuration.  QEMU SGX provides the user
 the ability to set/clear the CPUID flag (and by extension the associated
 IA32_FEATURE_CONTROL MSR bit in fw_cfg) and saves/restores the LE Hash MSRs
-when getting/putting guest state, but Qemu does not add new controls to
+when getting/putting guest state, but QEMU does not add new controls to
 directly modify the LC configuration.  Similar to hardware behavior, locking
 the LC configuration to a non-Intel value is left to guest firmware.  Unlike
 host bios setting for SGX launch control(LC), there is no special bios setting
@@ -126,7 +126,7 @@ creating VM with SGX.
 Feature Control
 ~~~~~~~~~~~~~~~
 
-Qemu SGX updates the ``etc/msr_feature_control`` fw_cfg entry to set the SGX
+QEMU SGX updates the ``etc/msr_feature_control`` fw_cfg entry to set the SGX
 (bit 18) and SGX LC (bit 17) flags based on their respective CPUID support,
 i.e. existing guest firmware will automatically set SGX and SGX LC accordingly,
 assuming said firmware supports fw_cfg.msr_feature_control.
diff --git a/docs/u2f.txt b/docs/u2f.txt
index 8f44994818..7f5813a0b7 100644
--- a/docs/u2f.txt
+++ b/docs/u2f.txt
@@ -21,7 +21,7 @@ The second factor is materialized by a device implementing the U2F
 protocol. In case of a USB U2F security key, it is a USB HID device
 that implements the U2F protocol.
 
-In Qemu, the USB U2F key device offers a dedicated support of U2F, allowing
+In QEMU, the USB U2F key device offers a dedicated support of U2F, allowing
 guest USB FIDO/U2F security keys operating in two possible modes:
 pass-through and emulated.
 
-- 
2.33.1



