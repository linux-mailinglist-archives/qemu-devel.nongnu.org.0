Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E86C5815C2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:55:39 +0200 (CEST)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLyD-0003ng-KS
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGLvv-0001uy-GC
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:53:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGLvs-0000dD-Gg
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658847191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KUpPEVv0RF7UX5KFlQqxmkISW8kWbzPI1dR67AZE3Aw=;
 b=Tfx2DOHumavZc+WqCEX2uDJ1en01/bbHpT5BmDkKqcofHQqPejsW8RAWinRImqB1niUFsn
 8VLtaIXF00KP3O9W9sz4OHCSEJrRXDegZehU6nyaSDvp+LXdFS4YE/PS9rgEajIlKyUw+L
 MoKo9JuT8QyT7Mq90P3FtCgKeqlpehU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-E3nXGPouOK-rCoZ_rDN6IA-1; Tue, 26 Jul 2022 10:53:10 -0400
X-MC-Unique: E3nXGPouOK-rCoZ_rDN6IA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v29-20020adfa1dd000000b0021ea6375b5aso395680wrv.9
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=KUpPEVv0RF7UX5KFlQqxmkISW8kWbzPI1dR67AZE3Aw=;
 b=Jef1i0tfNJl91EFuUTpjEj0KwSaxETipuMMu1DPzLVvC1LCVMdNhnyltUPkNzxAgFX
 GAMcwCg0xOmGXSTPP3ZUA9bJzNobfrXBY3iZWUjeKwfOAPRbNX5DozHDewY4yV/FfGih
 dnb2wXwpXjcx2O5R/7HBGDGrUJliNP+N3hwNiq+J46aera7L6XEbVMmthLqHElerATH0
 EmMG1aNcRRTHU/cWfHTfIH+yi7DpkJYQDn6OZ/PggMRE/KkLrRicihSqDLi0H4VMzFMw
 NaX3qyi/8hOusxuRtlLuMzknwxEAhXDC86YG6yhSPSYdLQgds47uV1K3zrPdJXvUffAv
 9GGA==
X-Gm-Message-State: AJIora+MLzO2gyjMgUeuK3wg+JFgiKN7kGBaKqSo/RBmXuDOEkyJbTU2
 K2c0sXwnzcVnHJj/Pt+0F8xcyjvsnYMrplUzg3q/BFnsO6lTe7b6pTkiEIw1w7JtpZ1bRNOYARx
 3XBQhSno0h9i4/H8=
X-Received: by 2002:a05:600c:21d4:b0:3a3:150a:7ed2 with SMTP id
 x20-20020a05600c21d400b003a3150a7ed2mr12804796wmj.166.1658847188836; 
 Tue, 26 Jul 2022 07:53:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u7g9iUH7HNzK00ZuOXyfsi3CB0h/MGqyCqbSto5buQAp/xkHcKCzbl8S/V12WnPF5HvqcPcg==
X-Received: by 2002:a05:600c:21d4:b0:3a3:150a:7ed2 with SMTP id
 x20-20020a05600c21d400b003a3150a7ed2mr12804774wmj.166.1658847188579; 
 Tue, 26 Jul 2022 07:53:08 -0700 (PDT)
Received: from redhat.com ([2.55.4.105]) by smtp.gmail.com with ESMTPSA id
 k10-20020a5d428a000000b0021eaf4138aesm1663164wrq.108.2022.07.26.07.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 07:53:07 -0700 (PDT)
Date: Tue, 26 Jul 2022 10:53:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 00/11] QOM'ify PIIX3 southbridge
Message-ID: <20220726105147-mutt-send-email-mst@kernel.org>
References: <20220713081735.112016-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713081735.112016-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 13, 2022 at 10:17:24AM +0200, Bernhard Beschow wrote:
> Similar to PIIX4 this series QOM'ifies internal device creation for PIIX3.
> This reduces the delta between the implementations of PIIX3 and PIIX4 and
> therefore might allow to merge both implementations in the future.
> 
> There were two challenges in this series:
> 
> First, QEMU considers the ACPI and USB functions to be optional in PIIX3.
> When instantiating those with object_initialize_child(), they need to be
> unparented in the realize function to prevent an assertion (see respective
> commit messages).
> 
> Second, the PIC used to be instantiated outside of the southbridge while
> some sub functions require a PIC with populated qemu_irqs. This has been
> solved by introducing a proxy PIC which furthermore allows PIIX3 to be
> agnostic towards the virtualization technology used (KVM, TCG, Xen).

Thanks!
I think it's best to merge this after the 7.1 release.
I'll tag this but if possible pls also ping me after the release
to make sure I don't forget. Thanks!

> Testing done:
> * make check
> * make check-avocado
> * Boot live CD:
>   * qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso
>   * qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso
> 
> Bernhard Beschow (11):
>   hw/i386/pc: QOM'ify DMA creation
>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>     southbridge
>   hw/isa/piix3: QOM'ify USB controller creation
>   hw/isa/piix3: QOM'ify ACPI controller creation
>   hw/i386/pc: QOM'ify RTC creation
>   hw/i386/pc: No need for rtc_state to be an out-parameter
>   hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>   hw/isa/piix3: QOM'ify ISA PIC creation
>   hw/isa/piix3: QOM'ify IDE controller creation
>   hw/isa/piix3: Wire up ACPI interrupt internally
>   hw/isa/piix3: Remove extra ';' outside of functions
> 
>  hw/i386/Kconfig               |  1 -
>  hw/i386/pc.c                  | 17 ++++---
>  hw/i386/pc_piix.c             | 70 ++++++++++++++++-------------
>  hw/i386/pc_q35.c              |  3 +-
>  hw/intc/i8259.c               | 27 +++++++++++
>  hw/isa/Kconfig                |  1 +
>  hw/isa/lpc_ich9.c             | 11 +++++
>  hw/isa/piix3.c                | 84 ++++++++++++++++++++++++++++++++---
>  include/hw/i386/ich9.h        |  2 +
>  include/hw/i386/pc.h          |  2 +-
>  include/hw/intc/i8259.h       | 14 ++++++
>  include/hw/southbridge/piix.h | 16 ++++++-
>  12 files changed, 201 insertions(+), 47 deletions(-)
> 
> -- 
> 2.37.1
> 


