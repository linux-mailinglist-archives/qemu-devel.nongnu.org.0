Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D402B35E6
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 16:53:54 +0100 (CET)
Received: from localhost ([::1]:43874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keKLg-0006mk-Mk
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 10:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKKZ-0006FS-92
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 10:52:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKKW-0002Ux-8y
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 10:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605455558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVN7Mv/Rx8J/Azgxujs3ocdpZnUdGQCr9xB6kkkzTk0=;
 b=RICK8urIkdm9BzOabN2yvUf1pYX/d6QjbgOu3OpLkbCplTGUp3OEyZqhM0Yq5LsOc84iD+
 Kqq69uOWmPbG8pwy/FmqqJ2gie4tm4CLF7mItxVOrPi5y/z2LOXBPGEeVsTWfxM819okMA
 MfjlXApd/KVG6MPYBshhOrHdMrOGhnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-Kwi2MCUmM0u7H3WtjF4UJQ-1; Sun, 15 Nov 2020 10:52:36 -0500
X-MC-Unique: Kwi2MCUmM0u7H3WtjF4UJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 503431084C82;
 Sun, 15 Nov 2020 15:52:35 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30FBB60BFA;
 Sun, 15 Nov 2020 15:52:33 +0000 (UTC)
Subject: Re: [PATCH 30/30] nomaintainer: Fix Lesser GPL version number
To: Chetan Pant <chetan4windows@gmail.com>, qemu-trivial@nongnu.org
References: <20201014134248.14146-1-chetan4windows@gmail.com>
 <20201023124424.20177-1-chetan4windows@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6ead487a-1238-0960-0935-f8b618d8176b@redhat.com>
Date: Sun, 15 Nov 2020 16:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201023124424.20177-1-chetan4windows@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 08:01:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/10/2020 14.44, Chetan Pant wrote:
> There is no "version 2" of the "Lesser" General Public License.
> It is either "GPL version 2.0" or "Lesser GPL version 2.1".
> This patch replaces all occurrences of "Lesser GPL version 2" with
> "Lesser GPL version 2.1" in comment section.
> 
> This patch contains all the files, whose maintainer I could not get
> from ‘get_maintainer.pl’ script.
> 
> Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
> ---
>  block/crypto.c                             | 2 +-
>  block/crypto.h                             | 2 +-
>  disas/lm32.c                               | 2 +-
>  exec-vary.c                                | 2 +-
>  exec.c                                     | 2 +-
>  hw/acpi/core.c                             | 2 +-
>  hw/acpi/hmat.c                             | 2 +-
>  hw/acpi/hmat.h                             | 2 +-
>  hw/acpi/ich9.c                             | 2 +-
>  hw/acpi/pcihp.c                            | 2 +-
>  hw/acpi/piix4.c                            | 2 +-
>  hw/audio/milkymist-ac97.c                  | 2 +-
>  hw/char/lm32_juart.c                       | 2 +-
>  hw/char/lm32_uart.c                        | 2 +-
>  hw/char/milkymist-uart.c                   | 2 +-
>  hw/core/bus.c                              | 2 +-
>  hw/core/platform-bus.c                     | 2 +-
>  hw/core/qdev.c                             | 2 +-
>  hw/core/sysbus.c                           | 2 +-
>  hw/display/bcm2835_fb.c                    | 2 +-
>  hw/display/milkymist-tmu2.c                | 2 +-
>  hw/display/milkymist-vgafb.c               | 2 +-
>  hw/display/milkymist-vgafb_template.h      | 2 +-
>  hw/gpio/mpc8xxx.c                          | 2 +-
>  hw/i2c/pm_smbus.c                          | 2 +-
>  hw/ide/ahci.c                              | 2 +-
>  hw/ide/ahci_internal.h                     | 2 +-
>  hw/ide/ich.c                               | 2 +-
>  hw/ide/qdev.c                              | 2 +-
>  hw/input/milkymist-softusb.c               | 2 +-
>  hw/intc/apic.c                             | 2 +-
>  hw/intc/apic_common.c                      | 2 +-
>  hw/intc/ioapic.c                           | 2 +-
>  hw/intc/ioapic_common.c                    | 2 +-
>  hw/intc/lm32_pic.c                         | 2 +-
>  hw/isa/apm.c                               | 2 +-
>  hw/isa/isa-bus.c                           | 2 +-
>  hw/lm32/lm32_boards.c                      | 2 +-
>  hw/lm32/lm32_hwsetup.h                     | 2 +-
>  hw/lm32/milkymist.c                        | 2 +-
>  hw/mem/nvdimm.c                            | 2 +-
>  hw/mem/pc-dimm.c                           | 2 +-
>  hw/misc/applesmc.c                         | 2 +-
>  hw/misc/milkymist-hpdmc.c                  | 2 +-
>  hw/misc/milkymist-pfpu.c                   | 2 +-
>  hw/net/e1000.c                             | 2 +-
>  hw/net/milkymist-minimac2.c                | 2 +-
>  hw/pci-bridge/i82801b11.c                  | 2 +-
>  hw/pci-host/designware.c                   | 2 +-
>  hw/ppc/spapr_iommu.c                       | 2 +-
>  hw/ppc/spapr_vio.c                         | 2 +-
>  hw/scsi/megasas.c                          | 2 +-
>  hw/scsi/mptconfig.c                        | 2 +-
>  hw/scsi/mptendian.c                        | 2 +-
>  hw/scsi/mptsas.c                           | 2 +-
>  hw/sd/milkymist-memcard.c                  | 2 +-
>  hw/timer/hpet.c                            | 2 +-
>  hw/timer/lm32_timer.c                      | 2 +-
>  hw/timer/milkymist-sysctl.c                | 2 +-
>  hw/xen/xen_pvdev.c                         | 2 +-
>  include/exec/ioport.h                      | 2 +-
>  include/exec/memory_ldst.h.inc             | 2 +-
>  include/exec/memory_ldst_cached.h.inc      | 2 +-
>  include/exec/memory_ldst_phys.h.inc        | 2 +-
>  include/exec/tb-context.h                  | 2 +-
>  include/exec/user/thunk.h                  | 2 +-
>  include/hw/acpi/acpi.h                     | 2 +-
>  include/hw/acpi/ich9.h                     | 2 +-
>  include/hw/acpi/pcihp.h                    | 2 +-
>  include/hw/display/milkymist_tmu2.h        | 2 +-
>  include/hw/i386/apic_internal.h            | 2 +-
>  include/hw/i386/ioapic.h                   | 2 +-
>  include/hw/i386/ioapic_internal.h          | 2 +-
>  include/hw/ide/ahci.h                      | 2 +-
>  include/hw/loader-fit.h                    | 2 +-
>  include/hw/pci-host/designware.h           | 2 +-
>  include/hw/pci-host/spapr.h                | 2 +-
>  include/hw/platform-bus.h                  | 2 +-
>  include/hw/ppc/spapr_vio.h                 | 2 +-
>  include/qemu/base64.h                      | 2 +-
>  include/qemu/buffer.h                      | 2 +-
>  include/qemu/filemonitor.h                 | 2 +-
>  memory_ldst.c.inc                          | 2 +-
>  qdev-monitor.c                             | 2 +-

exec.c and qdev-monitor.c have recently been moved around, but that can be
easily fixed when picking up the patch.

Reviewed-by: Thomas Huth <thuth@redhat.com>


