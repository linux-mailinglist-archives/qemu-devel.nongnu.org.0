Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332AC6E0CFE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 13:48:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmvPv-0006LZ-PT; Thu, 13 Apr 2023 07:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pmvPs-0006LN-Lc
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:47:05 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pmvPq-0004hu-HX
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 07:47:04 -0400
Received: by mail-yb1-xb29.google.com with SMTP id j10so4798319ybj.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681386419; x=1683978419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tplwGSMSSzwl4pTxc4pu2mSjQt8ZgyivkeWFfpGRis=;
 b=paHLMtqs6IlANdj33rKO6A3CkfcQ03EG7Mt5dvzPylyWuUBhV7XZGsg45r8Q//d6r+
 owFLJ3TsM4FNQw/645c3dJSnYaU88oVMlm3p1iGY5Xgj4z1nEUMLGE16Lzzg74ls8mQ9
 WmKkTPnMARiCf15hMMF8akgKCtdQEVen2lA/vVWiKD45w/D7k/YxvUZ8NJMRbPbR4s4x
 KjVARmnRArglVOiuCtkjLU0ytDtmDnCb9QT9irzSZIep2EZYNlDYmCYa2o2KdnDmZc8i
 afp1/5N2eiy2xOxPaK9mInNHlhz8l/D6H6mWmKrTumgdv05vS58Ep/wzT0JwrzWYHBpq
 /Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681386419; x=1683978419;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tplwGSMSSzwl4pTxc4pu2mSjQt8ZgyivkeWFfpGRis=;
 b=hs2xERCUB7tC4Bx93FDaRqrJ1hFqMemBTbn71C7PmSuLhACJZ/Q/lI47Vsa4PkjkCF
 fDanLKVbUUqiaAl8RyOLVTe3LtQz+o4/zYCR1GJ6ZLn4vcP9Pej0B5uAoQ7YWbv94mGe
 +61yBdHsb+G2EkDxXxF6FOdtUyd8KCNeLvdhDDqHKz8kzh1j9ZGD6UgDyiJbsfl5U0rh
 FhtfiREwM0zROszpECUpHTWeI5BtXbhSILdysGNMXLiwIfoUg+DkJdDebfiE4icBWI79
 e9Z7R0HTYPUxYQhpasxibAcjoqdWoaRcGuwApKRbltAFGrLq6UHfHQnixmf3iFGMsqOU
 O7Hw==
X-Gm-Message-State: AAQBX9cwsWaj4SWoHsGVRgqku39q+am9WIwYcSJa8yXQ3CmXBv3x1oHm
 REEOQzUODv9SPuV44JW6avrnzKye+l7XUrgJbwA=
X-Google-Smtp-Source: AKy350ZQ2cNptfoFeocZ7KYO4+HPgQjLJZ6IEgNeSt/7IMNPEhzpIQ6qDaHxP4/FT3y0JUBYxDH0sQo1trP7AZbkz6M=
X-Received: by 2002:a25:7684:0:b0:b8f:59a2:ffed with SMTP id
 r126-20020a257684000000b00b8f59a2ffedmr1055593ybc.8.1681386419499; Thu, 13
 Apr 2023 04:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-20-mst@redhat.com>
 <ba6a8777-723d-7e6c-bec7-71819cedb66d@proxmox.com>
 <20230330102227.39b44b71@imammedo.users.ipa.redhat.com>
 <0e3f3a98-835f-b26c-649e-a8a35edce660@proxmox.com>
 <20230412141822.03507c56@imammedo.users.ipa.redhat.com>
 <ff5ccf7b-158f-262d-3155-305e2d48dc37@proxmox.com>
In-Reply-To: <ff5ccf7b-158f-262d-3155-305e2d48dc37@proxmox.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Thu, 13 Apr 2023 14:46:23 +0300
Message-ID: <CAL77WPAgTjtpiW++pqEHLfm7LOP7KEKK6eNdwU5fXSXHm9Pj-w@mail.gmail.com>
Subject: Re: [PULL 19/54] acpi: pc: isa bridge: use AcpiDevAmlIf interface to
 build ISA device descriptors
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Sorry for the noise, but just curious, how did you shutdown Windows?
Did you use 'shutdown /s' or just press power button?
Could it be that Windows was actually hibernated.
So, when you try to boot it on the new (old) QEMU version with changed
PCI topology, this could make it upset.
I observed similar behaviour in case of Windows for ARM, but there was
true GSOD afterwards.
When windows is starting again its hibernated state dropped and all goes fi=
ne.

Best Regards,
Mike


On Thu, Apr 13, 2023 at 1:34=E2=80=AFPM Fiona Ebner <f.ebner@proxmox.com> w=
rote:
>
> Am 12.04.23 um 14:18 schrieb Igor Mammedov:
> > On Thu, 30 Mar 2023 13:58:22 +0200
> > Fiona Ebner <f.ebner@proxmox.com> wrote:
> >
> >> Am 30.03.23 um 10:22 schrieb Igor Mammedov:
> >>> On Tue, 28 Mar 2023 14:58:21 +0200
> >>> Fiona Ebner <f.ebner@proxmox.com> wrote:
> >>>
> >>>>
> >>>> Hi,
> >>>> while trying to reproduce another issue, I ended up with a Windows 1=
0
> >>>> guest that would boot with QEMU 7.0, but get stuck after the Windows
> >>>> logo/spinning circles with QEMU 7.1 (also with 8.0.0-rc1). Machine t=
ype
> >>>> is pc-i440fx-6.2[0]. Bisecting led to this commit.
> >>>>
> >>>> It only happens the first time the VM is booted, killing the process=
 and
> >>>> re-trying always worked afterwards. So it's not a big deal and might
> >>>> just be some ACPI-related Windows quirk. But I thought I should ask =
here
> >>>> to be sure.
> >>>>
> >>>> For bisecting, I restored the disk state after each attempt. While
> >>>> getting stuck sometimes took 3-4 attempts, I tested about 10 times u=
ntil
> >>>> I declared a commit good, and re-tested the commit before this one 1=
5
> >>>> times, so I'm pretty sure this is the one where the issue started ap=
pearing.
> >>>>
> >>>> So, anything that could potentially be wrong with the commit or is t=
his
> >>>> most likely just some Windows quirk/bug we can't do much about?
> >>>>
> >>>> If you need more information, please let me know!
> >>>
> >>> Please describe in more detail your setup/steps where it reproduces
> >>> (incl. Windows version/build, used QEMU CLI) so I could try to reprod=
uce it locally.
> >>>
> >>> (in past there were issues with German version that some where
> >>> experience but not reproducible on my side, that resolved with
> >>> upgrading to newer QEMU (if I recall correctly issue was opened
> >>> on QEMU's gitlab tracker))
> >>>
> >>
> >> Windows 10 Education
> >> Version 1809
> >> Build 17763.1
> >>
> >> It's not the German ISO, I used default settings (except location
> >> Austria and German keymap) and I don't think I did anything other than
> >> shutdown after the install was over.
> >>
> >> The command line is below. I did use our patched QEMU builds when I go=
t
> >> into the situation, but I don't think they touch anything ACPI-related
> >> and bisecting was done without our patches on top.
> >>
> >> I tried to reproduce the situation again from scratch today, but wasn'=
t
> >> able to. I do still have the problematic disk (snapshot) where the iss=
ue
> >> occurs as an LVM-Thin volume. If you'd like to have access to that,
> >> please send me a direct mail and we can discuss the details there.
> >
> > I couldn't reproduce the issue on my host either.
> > If you still have access to 'broken' disk image, you can try to enable
> > kernel debug mode in guest and try to attach with debugger to it to see
> > where it is stuck.
> >
> > quick instructions how to do it:
> >  https://gitlab.com/qemu-project/qemu/-/issues/774#note_1270248862
> > or read more extensive MS docs on topic.
> >
>
> Hmm, I guess I won't be able to enable kernel debug mode without losing
> the problematic state of the image. The VM only gets stuck during the
> first boot attempt.
>
> Still, I wanted to give it a shot in the hope I can trigger it again
> when shutting down with QEMU 6.2.0 and booting with QEMU 7.1.0. I made a
> copy of the VM intending to use it as the debug host, but didn't get the
> COM port to show up in the guest with
> -serial unix:/tmp/com1,server,nowait
> I checked in the Device Manager with "Show hidden devices" enabled.
>
> Anyway, when starting the original problematic VM again, it now also got
> stuck (visually, in the same place) with QEMU 6.2.0! But only until I
> rebooted my host, which made it working with QEMU 6.2.0 again. So I'd
> say this commit has nothing to do with the issue after all, just made it
> more likely to trigger for me. And also seems less likely to be a QEMU
> issue now :)
>
> Best Regards,
> Fiona
>
>

