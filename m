Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0FB2AF1B4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 14:08:58 +0100 (CET)
Received: from localhost ([::1]:48304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcprt-0001wJ-HI
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 08:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1kcpiL-0002M0-6Y
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:59:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1kcpiJ-0005sc-0c
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:59:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605099541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sd3j/VFNCBJaiqHuXn0nq0n+Pob5rAZtYWVuHmNdfro=;
 b=HZEuOYKTxnmhGxQyQijF3t5SDuTfDKeyaoQ666wXuHJgWXLskkzG82irPpzMAj8iTj8oEx
 WEOcXANPwh0XI2xKZe+Us3d6GaOs5lr/QWNwT+HhUaKtpwB6LJJ79TwxjuDladxU8EE8+d
 gKNH0Qd/F0b+P2oVzMo1g7K7Mlko3Lw=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-gjhRBKf1OxKo9WoOzYc0SQ-1; Wed, 11 Nov 2020 07:58:59 -0500
X-MC-Unique: gjhRBKf1OxKo9WoOzYc0SQ-1
Received: by mail-ot1-f70.google.com with SMTP id e31so944904ote.0
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 04:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sd3j/VFNCBJaiqHuXn0nq0n+Pob5rAZtYWVuHmNdfro=;
 b=fJVW5eMWkvY7YMPIQESH371HIlT5X2ceLvaQAJ3NVir+P38PzQ1F7NEua4lBiNJNgD
 xKbbvuxV55wAvK+bCnVMI1YiXFVSfr/Dan7RX58hxCpNJeeR6yunc+T/l6wvf/IDHQE4
 db9UALh9a7stHBQUoDiDcH9vR3MofrmISrqs0AeEYjXMrpbqCbgD0owc510QuFUj5/Vv
 RmKRGalH/7EDcfPTfM+1Pr5DJMl/0gqwq7kTizwNbqBBbnPlTqYKqZn90wrkujp/4W39
 nANfU6U/dCU0HOTx3ZfAF9LfcnqscPW0aR0Mng71KCOKcmotlZnj+21AuZbPcjZq9bTS
 /3pQ==
X-Gm-Message-State: AOAM531GAEf8L+xKYa15epfcDTuffJM1db4wqbsg9mYH3qklEKDFWwkB
 pO4EmWd3aZ+NDE931I9pGIxyPEk1othB6Uz/7BRgaT8zXDVibMGtfl4qIy5WPeoHuVjHPIMhtxs
 SRl49UurzcgKQEIXUZxjLD52G/fHOOVQ=
X-Received: by 2002:aca:440a:: with SMTP id r10mr2092648oia.110.1605099538590; 
 Wed, 11 Nov 2020 04:58:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjMvI5Jor9PXPsv1/6f0N/hYxjm58eNfZZdNnjMxFC8w6ahNx0XvJFdx4/WEkur11Dm7ZmiMDo/0FsYKv7HL8=
X-Received: by 2002:aca:440a:: with SMTP id r10mr2092640oia.110.1605099538414; 
 Wed, 11 Nov 2020 04:58:58 -0800 (PST)
MIME-Version: 1.0
References: <52d30372-44aa-153b-c69f-57150b6cf6b6@redhat.com>
In-Reply-To: <52d30372-44aa-153b-c69f-57150b6cf6b6@redhat.com>
From: Julia Suvorova <jusual@redhat.com>
Date: Wed, 11 Nov 2020 13:58:46 +0100
Message-ID: <CAMDeoFXmT3gdh5JOh5RopzYBjTTPwrHWZbHp0vwxpBSCSQiDQA@mail.gmail.com>
Subject: Re: hw/i386/q35: Where go LPC irqs?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 7, 2020 at 3:48 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Hi, I am confuse with the LPC/GSI code.
>
> In pc_q35_init() we connect the LPC outputs to
> GSI input:
>
> 116 static void pc_q35_init(MachineState *machine)
> 117 {
> ...
> 240     /* irq lines */
> 241     gsi_state =3D pc_gsi_create(&x86ms->gsi, pcmc->pci_enabled);
> 242
> 243     ich9_lpc =3D ICH9_LPC_DEVICE(lpc);
> 244     lpc_dev =3D DEVICE(lpc);
> 245     for (i =3D 0; i < GSI_NUM_PINS; i++) {
> 246         qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i,
> x86ms->gsi[i]);
> 247     }
> ...
> 268     /* init basic PC hardware */
> 269     pc_basic_device_init(pcms, isa_bus, x86ms->gsi, &rtc_state,
> !mc->no_floppy,
> 270                          0xff0104);
>
> But then we call pc_basic_device_init() which overwrite
> the GSI inputs with HPET outputs:
>
> 1118 void pc_basic_device_init(struct PCMachineState *pcms,
> 1119                           ISABus *isa_bus, qemu_irq *gsi,
> 1120                           ISADevice **rtc_state,
> 1121                           bool create_fdctrl,
> 1122                           uint32_t hpet_irqs)
> 1123 {
> ...
> 1139     /*
> 1140      * Check if an HPET shall be created.
> 1141      *
> 1142      * Without KVM_CAP_PIT_STATE2, we cannot switch off the
> in-kernel PIT
> 1143      * when the HPET wants to take over. Thus we have to disable
> the latter.
> 1144      */
> 1145     if (pcms->hpet_enabled && (!kvm_irqchip_in_kernel() ||
> 1146                                kvm_has_pit_state2())) {
> ...
> 1165         for (i =3D 0; i < GSI_NUM_PINS; i++) {
> 1166             sysbus_connect_irq(SYS_BUS_DEVICE(hpet), i, gsi[i]);
> 1167         }
>
> Are LPC IRQ still delivered?

From what I got, LPC IRQs and HPET IRQs do not usually overlap (IRQ
0,2,8 for HPET, IRQ 3-7,9+ for all ICH9), which means that connecting
them together will not create an issue. I don't know what will happen
if higher IRQ is chosen for HPET, but according to ICH9 spec, it seems
to be aware of HPET interrupts.

> Peter commented here:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg758178.html
>
> "Connecting two qemu_irqs outputs directly
> to the same input is not valid as it produces subtly wrong behaviour
> (for instance if both the IRQ lines are high, and then one goes
> low, the PIC input will see this as a high-to-low transition
> even though the second IRQ line should still be holding it high)."
>
> Are this IRQ OR'ed to the GSI?
>
> Thanks,
>
> Phil.
>
>


