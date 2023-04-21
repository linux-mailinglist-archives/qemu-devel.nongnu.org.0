Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB686EAF48
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:36:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptjJ-0008KP-6F; Fri, 21 Apr 2023 12:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pptjD-0008I5-FG
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:35:20 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pptjB-0001vs-Jn
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:35:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5058181d58dso3228413a12.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682094916; x=1684686916;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M+rZJB4BR8f4VGV6ARLrNeDvBJuGNsvX2XWADjdtv9A=;
 b=JMrLQF24sUfKFSINcYxpUg+75W5bVxl3yiQY57kAUuXvrMiFyKL6XxfFu/5/yyh6TJ
 hKH1rnn/OiRFECC5LMs0RXlRXUm0U6zVVEiGRqgk7tV/xLDPc7IFf7Z2qIBVxJQItyAY
 JprUTCfN8p6JxOFwREyOFpH9QUsN++xY1PUH+YWhiYayx+e7imsZ44eyi90XNYRi6trk
 jApMRyfywwEbUU99qPvU/ZAcu62ZxN2iYxHmyGXPncP6BwHditiq5LRgSdFBZ1uOn2CL
 heqBbLK8LxEvuvwQyeaamCHNR1GVig5SSeVVMdEFKWsE6UDdw/qttNEnN28BdXjaXlPN
 R9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682094916; x=1684686916;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M+rZJB4BR8f4VGV6ARLrNeDvBJuGNsvX2XWADjdtv9A=;
 b=egYZ3mSLVfg1ox+Ir9l4w5KdO6v7EuSOom6S5FksmxB0/vmn/2lWoVdo1a3EtI02TK
 mDkdrPkQX+aZ7NqF+N+/H28YsLs68SE+UnwAHQPbVJS/Gc8TDceUNhwg97llaxc/u2WS
 0JSmyMuUB98hExRlrGsGcTvGzI0L8wQ3LTDUnN2PlT9mgzl9UF+CLaZG+jfjPwA85xRQ
 RA8J5zCRmRw9BKINjfkNB4gMhKztRI8eyRHyzLkwUaMuNUCQiS5OBWuTYvitvOanSAQ4
 r1sbAH1JAbA6pMH+VoGa4z8Psw52folgcQEHvsCZRlZ6fdDvWKfQroOje4U2UNfXBjZd
 zDAQ==
X-Gm-Message-State: AAQBX9cpJKzv3f337IiAfFuhjmR1i8GBol82ld3WXy1Bi6HPPcRi4VH/
 8rvKodbYs+oFUEpmoJwWaUI=
X-Google-Smtp-Source: AKy350b/xgJKoEFQP69MIuQi3JGwn0UUyeUhY+hiy9C4pQjzASYm/Wq4WbTDH2cg1uR94ZhLOkADAg==
X-Received: by 2002:a05:6402:18c:b0:505:47a:7ae8 with SMTP id
 r12-20020a056402018c00b00505047a7ae8mr5197719edv.4.1682094915648; 
 Fri, 21 Apr 2023 09:35:15 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-063-073.77.11.pool.telefonica.de.
 [77.11.63.73]) by smtp.gmail.com with ESMTPSA id
 k2-20020a056402048200b00501c96564b5sm1928829edv.93.2023.04.21.09.35.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:35:15 -0700 (PDT)
Date: Fri, 21 Apr 2023 16:35:10 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <20230421033757-mutt-send-email-mst@kernel.org>
References: <20230403074124.3925-1-shentey@gmail.com>
 <20230421033757-mutt-send-email-mst@kernel.org>
Message-ID: <B3B2C264-CFEF-4A8D-AEBA-194038A6E757@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 21=2E April 2023 07:38:10 UTC schrieb "Michael S=2E Tsirkin" <mst@redha=
t=2Ecom>:
>On Mon, Apr 03, 2023 at 09:41:17AM +0200, Bernhard Beschow wrote:
>> There is currently a dedicated PIIX3 device model for use under Xen=2E =
By reusing
>> existing PCI API during initialization this device model can be elimina=
ted and
>> the plain PIIX3 device model can be used instead=2E
>>=20
>> Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making =
Xen
>> agnostic towards the precise south bridge being used in the PC machine=
=2E The
>> latter might become particularily interesting once PIIX4 becomes usable=
 in the
>> PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>
>xen stuff so I assume that tree?

Anthony?

This series is now fully reviewed=2E Once it lands in master I'd rebase th=
e PIIX consolidation series onto it which is still under discussion=2E

Best regards,
Bernhard

>
>> Testing done:
>> - `make check`
>> - Run `xl create` with the following config:
>>     name =3D "Manjaro"
>>     type =3D 'hvm'
>>     memory =3D 1536
>>     apic =3D 1
>>     usb =3D 1
>>     disk =3D [ "file:manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso,hdc:c=
drom,r" ]
>>     device_model_override =3D "/usr/bin/qemu-system-x86_64"
>>     vga =3D "stdvga"
>>     sdl =3D 1
>> - `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \
>>     -cdrom manjaro-kde-21=2E2=2E6-220416-linux515=2Eiso`
>>=20
>> v4:
>> - Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)
>>=20
>> v3:
>> - Rebase onto master
>>=20
>> v2:
>> - xen_piix3_set_irq() is already generic=2E Just rename it=2E (Chuck)
>>=20
>> Tested-by: Chuck Zmudzinski <brchuckz@aol=2Ecom>
>>=20
>> Bernhard Beschow (7):
>>   include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()
>>   hw/pci/pci=2Ec: Don't leak PCIBus::irq_count[] in pci_bus_irqs()
>>   hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()
>>   hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
>>   hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
>>   hw/isa/piix3: Resolve redundant k->config_write assignments
>>   hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
>>=20
>>  include/hw/southbridge/piix=2Eh |  1 -
>>  include/hw/xen/xen=2Eh          |  2 +-
>>  hw/i386/pc_piix=2Ec             | 36 +++++++++++++++++++--
>>  hw/i386/xen/xen-hvm=2Ec         |  2 +-
>>  hw/isa/piix3=2Ec                | 60 +--------------------------------=
--
>>  hw/pci/pci=2Ec                  |  2 ++
>>  stubs/xen-hw-stub=2Ec           |  2 +-
>>  7 files changed, 39 insertions(+), 66 deletions(-)
>>=20
>> --=20
>> 2=2E40=2E0
>>=20
>

