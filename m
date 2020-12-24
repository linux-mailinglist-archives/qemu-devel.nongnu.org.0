Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16562E2600
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 11:59:46 +0100 (CET)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksOLR-0004hi-Ic
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 05:59:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ksOKZ-0004Bl-IF; Thu, 24 Dec 2020 05:58:51 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ksOKX-0005JY-Mv; Thu, 24 Dec 2020 05:58:51 -0500
Received: by mail-wr1-x433.google.com with SMTP id q18so1874298wrn.1;
 Thu, 24 Dec 2020 02:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b03rK5131HvN38cmKO8biVK6YrBMQVuzp47LMXCWMck=;
 b=uSoAis9QJymrZT24M+5kW7H6rpr5dTqr87vBdVfhspITw6h38gH3UafP6vGz9koO90
 pNfiSK0fij0Yp7KdMdZU7KwUA8rAcTEjiHEp8tJYov7kO5DmQixv1U5yOrGkYbr3K+Mt
 BC0KMa45qFfqTBr3IsGd0tXmAsPl5Y+DvGCsijSHVKf5KkYmJWl3bRdDQhOsEZyg3d04
 mLPp4+J1bpozAOcJ0+9+ZVl/No5jh3Bpo1LphOd74utrZe1LWaj/wOrKjXwzDZQ2OQI2
 533aOTkgKu0IpUdGiVCy5dvX71OqO7s1ey8Mgx5pehyGRkqy9ZElIVIgJ332UK6BYZk3
 qoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b03rK5131HvN38cmKO8biVK6YrBMQVuzp47LMXCWMck=;
 b=qiRlyY2OJmH1DS2LDecI15Q5r3xPjzeldi8KSfw8goLDANLY7lMMboK5PkxLEmoqWz
 xE9LAUrCXRO5ce6eX/nj1T823+RH1dmxEq5/GgLDSqXz/TJ5JLHEClqKfZnTSKBdsAUm
 S4vzJyu7nrs4AivT6ylnkRZl1dsC/XahGPOq4aZXI+ij5A8uo+5uDtXeZceVglkDExxy
 gclqWi39CjEgtPVrPPqd0Fj1kI6u+OLnU+pxqQJs3XJnWs6LCQKOlFD7nGF55z7k+3LS
 L4yWoPhJyxodCV76Y7EAsCKb/as1ibH/LdQh4wyZ+exoZRUNA/2IbKCFAWHb+Tb814xh
 C4JA==
X-Gm-Message-State: AOAM532GVG4IqcwM/aaRvI7Ir3FQfg70chEBkMBPNII4Tv/X6ChjfXa6
 6EWL6L3qpbVKxZunC03vq2w=
X-Google-Smtp-Source: ABdhPJwcPwV8hBgpqHXRFmPVBDJIqpC4RW6eZsah0rB49/K0yTqkoJCmNimFAmY4Eo0geez9pgpKHw==
X-Received: by 2002:adf:90e3:: with SMTP id i90mr7292919wri.248.1608807527348; 
 Thu, 24 Dec 2020 02:58:47 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id o125sm3063602wmo.30.2020.12.24.02.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Dec 2020 02:58:46 -0800 (PST)
Subject: Re: [PATCH v2 1/2] ppc: Fix build with --without-default-devices
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <aae93661-1e66-f659-2351-270ee483ce6e@amsat.org>
Date: Thu, 24 Dec 2020 11:58:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <160875160729.98237.3219319022197329254.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/20 8:26 PM, Greg Kurz wrote:
> Linking of the qemu-system-ppc64 fails on a POWER9 host when
> --without-default-devices is passed to configure:
> 
> $ ./configure --without-default-devices \
>               --target-list=ppc64-softmmu && make
> 
> ...
> 
> libqemu-ppc64-softmmu.fa.p/hw_ppc_e500.c.o: In function `ppce500_init_mpic_kvm':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/e500.c:777: undefined reference to `kvm_openpic_connect_vcpu'
> libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_irq.c.o: In function `spapr_irq_check':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/ppc/spapr_irq.c:189: undefined reference to `xics_kvm_has_broken_disconnect'
> libqemu-ppc64-softmmu.fa.p/hw_intc_spapr_xive.c.o: In function `spapr_xive_post_load':
> /home/greg/Work/qemu/qemu-ppc/build/../hw/intc/spapr_xive.c:530: undefined reference to `kvmppc_xive_post_load'
> 
> ... and tons of other symbols belonging to the KVM backend of the
> openpic, XICS and XIVE interrupt controllers.
> 
> It turns out that OPENPIC_KVM, XICS_KVM and XIVE_KVM are marked
> to depend on KVM but this has no effect when minikconf runs in
> allnoconfig mode. Such reverse dependencies should rather be
> handled with a 'select' statement, eg.
> 
> config OPENPIC
>     select OPENPIC_KVM if KVM
> 
> or even better by getting rid of the intermediate _KVM config
> and directly checking CONFIG_KVM in the meson.build file:
> 
> specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
> 		if_true: files('openpic_kvm.c'))
> 
> Go for the latter with OPENPIC, XICS and XIVE. While here also move
> XIVE_SPAPR to hw/intc/Kconfig where it belongs.
> 
> This went unnoticed so far because CI doesn't test the build with
> --without-default-devices and KVM enabled on a POWER host.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - check CONFIG_KVM in the meson.build as suggested by Paolo
> ---
>  hw/intc/Kconfig     |   14 +++++---------
>  hw/intc/meson.build |    9 ++++++---
>  hw/ppc/Kconfig      |   15 ---------------
>  3 files changed, 11 insertions(+), 27 deletions(-)
> 
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 468d548ca771..ee60d4bf7857 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -30,23 +30,19 @@ config ARM_GIC_KVM
>      default y
>      depends on ARM_GIC && KVM
>  
> -config OPENPIC_KVM
> -    bool
> -    default y
> -    depends on OPENPIC && KVM
> -
>  config XICS
>      bool
> -    depends on POWERNV || PSERIES
>  
>  config XICS_SPAPR
>      bool
>      select XICS
>  
> -config XICS_KVM
> +config XIVE
>      bool
> -    default y
> -    depends on XICS && KVM
> +
> +config XIVE_SPAPR
> +    bool
> +    select XIVE
>  
>  config ALLWINNER_A10_PIC
>      bool
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 68da782ad2c5..b6c9218908e3 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -39,7 +39,8 @@ specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_lioint
>  specific_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('mips_gic.c'))
>  specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
>  specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
> -specific_ss.add(when: 'CONFIG_OPENPIC_KVM', if_true: files('openpic_kvm.c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
> +		if_true: files('openpic_kvm.c'))
>  specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c'))
>  specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
>  specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
> @@ -50,8 +51,10 @@ specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_intc.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
>  specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> -specific_ss.add(when: 'CONFIG_XICS_KVM', if_true: files('xics_kvm.c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
> +		if_true: files('xics_kvm.c'))
>  specific_ss.add(when: 'CONFIG_XICS_SPAPR', if_true: files('xics_spapr.c'))
>  specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
> -specific_ss.add(when: 'CONFIG_XIVE_KVM', if_true: files('spapr_xive_kvm.c'))
> +specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
> +		if_true: files('spapr_xive_kvm.c'))
>  specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 982d55f5875c..064bd6edd83d 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -129,21 +129,6 @@ config VIRTEX
>      select XILINX_ETHLITE
>      select FDT_PPC
>  
> -config XIVE
> -    bool
> -    depends on POWERNV || PSERIES
> -
> -config XIVE_SPAPR
> -    bool
> -    default y
> -    depends on PSERIES
> -    select XIVE
> -
> -config XIVE_KVM
> -    bool
> -    default y
> -    depends on XIVE_SPAPR && KVM
> -

Is it possible to split this patch in 2: XICS, XIVE (or 3: same + OPENPIC)?

