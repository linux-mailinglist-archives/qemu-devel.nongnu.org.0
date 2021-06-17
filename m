Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7813AAB03
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 07:22:54 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltkUP-0007MW-DY
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 01:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltkSg-00063y-DG
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ltkSc-0006VW-2v
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623907259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a61KIomvccHL2RW1G6d64FoYHEj26wWcGdUZgu6Qqnw=;
 b=iV1KdkQ4Y4m7HQrFFVp/yPwu/tjzCZlNovFZDMASe/2MATHGvpVxYn7dD9xFO+2AHmWiz2
 7M/4XwqJ5zvYyPD1XE903TY+9Hxes0NVGvIAhkXYnBnz9tvPTAxRVxiKUM9k5GNjKHLrdh
 7kNZUdp8OPs+MyVvwupl0AhKN2z+7hE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-YAEfjlkcOlSApIQ_yO87UA-1; Thu, 17 Jun 2021 01:20:55 -0400
X-MC-Unique: YAEfjlkcOlSApIQ_yO87UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30923801ADF;
 Thu, 17 Jun 2021 05:20:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5842C19704;
 Thu, 17 Jun 2021 05:20:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D43118000B2; Thu, 17 Jun 2021 07:20:44 +0200 (CEST)
Date: Thu, 17 Jun 2021 07:20:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 22/23] hw/acpi/Kconfig: Add missing Kconfig
 dependencies (build error)
Message-ID: <20210617052044.37m3rayifbx5c35s@sirius.home.kraxel.org>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-23-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210616204328.2611406-23-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
 Markus Armbruster <armbru@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 10:43:27PM +0200, Philippe Mathieu-Daudé wrote:
> The 'microvm' machine misses various dependencies:
> 
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_setup_microvm':
>   hw/i386/acpi-microvm.c:247: undefined reference to `acpi_build_tables_init'
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_build_microvm':
>   hw/i386/acpi-microvm.c:192: undefined reference to `bios_linker_loader_alloc'
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `build_dsdt_microvm':
>   hw/i386/acpi-microvm.c:121: undefined reference to `init_aml_allocator'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:124: undefined reference to `acpi_data_push'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:126: undefined reference to `aml_scope'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:129: undefined reference to `build_ged_aml'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:131: undefined reference to `acpi_dsdt_add_power_button'
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_dsdt_add_virtio':
>   hw/i386/acpi-microvm.c:77: undefined reference to `aml_string'
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `build_dsdt_microvm':
>   hw/i386/acpi-microvm.c:138: undefined reference to `aml_scope'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:149: undefined reference to `build_header'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:152: undefined reference to `free_aml_allocator'
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_build_microvm':
>   hw/i386/acpi-microvm.c:202: undefined reference to `acpi_add_table'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:203: undefined reference to `build_fadt'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:206: undefined reference to `acpi_add_table'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:207: undefined reference to `acpi_build_madt'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:212: undefined reference to `build_xsdt'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:224: undefined reference to `build_rsdp'
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_setup_microvm':
>   hw/i386/acpi-microvm.c:251: undefined reference to `acpi_add_rom_blob'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:253: undefined reference to `acpi_add_rom_blob'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:255: undefined reference to `acpi_add_rom_blob'
>   /usr/bin/ld: hw/i386/acpi-microvm.c:258: undefined reference to `acpi_build_tables_cleanup'
>   /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_dsdt_add_pci':
>   hw/i386/acpi-microvm.c:105: undefined reference to `acpi_dsdt_add_gpex'
>   collect2: error: ld returned 1 exit status
>   ninja: build stopped: subcommand failed.
> 
> Update the ACPI_HW_REDUCED symbol to select ACPI_MEMORY_HOTPLUG /
> ACPI_NVDIMM / ACPI.
> 
> Fixes: 8045df14bcc ("microvm/acpi: add minimal acpi support")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


