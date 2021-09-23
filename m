Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD72415A02
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 10:24:09 +0200 (CEST)
Received: from localhost ([::1]:48726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTK1Y-0007OK-8X
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 04:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTK02-0005zk-1E
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:22:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mTJzx-0005ql-HV
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 04:22:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632385348;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=c1fQciwuSqQWXkxr9xJgImQzZlEG0Kn9bp3nr1wd1DI=;
 b=Zo/TGUKi1dRuPuvxwDDdu5YALyQ0TjFvQ0Y2mnmDMj6v+Wgm7en1nUaNJwz8oh5ykJQoAa
 nUBrdP/kfjFn2Dt8kA5Kl99pTvNhbgFFCKukPQFXievItkJehfO8BvQnhmil9Bw9m1uRwJ
 IHhM9eYgnzdrTr+C5hG9RxBTevFud0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-mOU39t4OM5mf05L8I7qlmA-1; Thu, 23 Sep 2021 04:22:26 -0400
X-MC-Unique: mOU39t4OM5mf05L8I7qlmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A649BCC624;
 Thu, 23 Sep 2021 08:22:25 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B6C10013C1;
 Thu, 23 Sep 2021 08:22:24 +0000 (UTC)
Date: Thu, 23 Sep 2021 09:22:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] tests: qtest: bios-tables-test depends on the unpacked
 edk2 ROMs
Message-ID: <YUw5Pglv2lcS2Nz6@redhat.com>
References: <20210923081555.3648310-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210923081555.3648310-1-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 23, 2021 at 04:15:55AM -0400, Paolo Bonzini wrote:
> Skip the test if bzip2 is not available, and run it after they are
> uncompressed.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  pc-bios/meson.build     | 3 ++-
>  tests/qtest/meson.build | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index f2b32598af..975565198e 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -10,8 +10,9 @@ if install_edk2_blobs
>      'edk2-x86_64-secure-code.fd',
>    ]
>  
> +  roms = []
>    foreach f : fds
> -    custom_target(f,
> +    roms += custom_target(f,
>                    build_by_default: have_system,
>                    output: f,
>                    input: '@0@.bz2'.format(f),
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index e1f4df3df8..6d8100c9de 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -68,12 +68,12 @@ qtests_i386 = \
>    (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
>    (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>    (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
> +  (install_edk2_blobs ? ['bios-tables-test'] : []) +                                        \
>    qtests_pci +                                                                              \
>    ['fdc-test',
>     'ide-test',
>     'hd-geo-test',
>     'boot-order-test',
> -   'bios-tables-test',
>     'rtc-test',
>     'i440fx-test',
>     'fw_cfg-test',
> @@ -180,7 +180,7 @@ qtests_arm = \
>  
>  # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>  qtests_aarch64 = \
> -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
> +  (cpu != 'arm' and install_edk2_blobs ? ['bios-tables-test'] : []) +                           \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>    ['arm-cpu-features',
> @@ -269,7 +269,7 @@ foreach dir : target_dirs
>    qtest_emulator = emulators['qemu-system-' + target_base]
>    target_qtests = get_variable('qtests_' + target_base, []) + qtests_generic
>  
> -  test_deps = []
> +  test_deps = roms

Shouldn't this be

  if install_edk2_blobs
     test_deps += roms
  endif


>    qtest_env = environment()
>    if have_tools
>      qtest_env.set('QTEST_QEMU_IMG', './qemu-img')

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


