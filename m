Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640076E18A1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 02:09:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn6yg-0006lR-UJ; Thu, 13 Apr 2023 20:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pn6yb-0006l5-5l
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:07:44 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mike.maslenkin@gmail.com>)
 id 1pn6yZ-0001ph-IZ
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 20:07:40 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id t16so4375627ybi.13
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 17:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681430858; x=1684022858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iAuwCNqcWbiZppRkev6g1+lElMBn1x2a/mgJTpbxys=;
 b=mksDgxqCnauR2JpwtnWF8195Z57lY3ziiRfWvrngA+u6WvHU7HoB6PZg7p2mlYlBsS
 EtVKI2O8DSmsjvcFR7Gh1n3AwXEtb2KlggfmrTbrRjTAaHKKjGdnUutX0mP3vLKNEzL4
 82GD1psW8tVvtVUIVwm9hRNu2N6DOUrTK+3YJPapE0HDdeEXwbMsQvfFdbZ2JLJp7xyB
 qb3MY/Mgj8FSoqgKzO9/FfYOUZeNFE6TREQtH8tb1/wdrCaK+2j34GqsbuQcoBB5KGV/
 bO85ygTGyOuu9NvuvpYeXuMyqJZAKij5B/jcauebuOR5NbN8DCYhasvWZO0NpQzWBjOW
 HJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681430858; x=1684022858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iAuwCNqcWbiZppRkev6g1+lElMBn1x2a/mgJTpbxys=;
 b=UQC6tMXDzIE8p4RTevF4Eg3/gHNZgyizuCAV8FCxLgUCApaKg5midXtIhuBbnaOey/
 pJx68+B5CE+4mba4jCg8OSNaPlZMYzg+ogKU+61EyHjynsPEevckBLKz793dttH/h+Tx
 qnchFOmRylYkL5f79gS0mml/ye+l8N8V1rsZhA4H/kHWQNQVoZfPZfW4DN2WjBmXBdLG
 aVitKjwBE5UIkFn5dtMMnhpltS0CjJxEr3dOFP6a5uQbdEBGzVNtKvc3b2pflCQAJI5g
 9nVIugprvgw87LnAFTxh4bk16AZQHOFdRn2GAkgisxArnRucSVAVtIDTstDTHjMRu1Ya
 tYng==
X-Gm-Message-State: AAQBX9elXE9dKA1wrmZb7XEHq1ewCIRA+CtRkQ/CpUb2GdTHume+f+Fz
 QrR2AAyACavwrodfj33OEBhg8gwOBaQWjp+jTG4=
X-Google-Smtp-Source: AKy350aAhufM2h+sB6Mkvvgrw02KjJjNg5MmOpcXiZ0rzm1rEjaeAZVg4TEp80lZtObCq8hKSMbf1Dh6qHm9NaX/E4Y=
X-Received: by 2002:a25:748c:0:b0:b8e:f726:d198 with SMTP id
 p134-20020a25748c000000b00b8ef726d198mr2155685ybc.8.1681430858017; Thu, 13
 Apr 2023 17:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-20-mst@redhat.com>
 <ba6a8777-723d-7e6c-bec7-71819cedb66d@proxmox.com>
 <20230330102227.39b44b71@imammedo.users.ipa.redhat.com>
 <0e3f3a98-835f-b26c-649e-a8a35edce660@proxmox.com>
 <20230412141822.03507c56@imammedo.users.ipa.redhat.com>
 <ff5ccf7b-158f-262d-3155-305e2d48dc37@proxmox.com>
 <CAL77WPAgTjtpiW++pqEHLfm7LOP7KEKK6eNdwU5fXSXHm9Pj-w@mail.gmail.com>
 <1f9afc12-b0b2-501d-7bf9-9f6d2f5b9829@proxmox.com>
In-Reply-To: <1f9afc12-b0b2-501d-7bf9-9f6d2f5b9829@proxmox.com>
From: Mike Maslenkin <mike.maslenkin@gmail.com>
Date: Fri, 14 Apr 2023 03:07:01 +0300
Message-ID: <CAL77WPAmRW1taC+k_gqcPmDoR=u1_6ms-bUrgVHYY6D4Tr8hoA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=mike.maslenkin@gmail.com; helo=mail-yb1-xb2f.google.com
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

Hibernate is disabled by default, that is why "shutdown /h" fails.
It can be enabled by 'powercfg.exe /h /size 100; powercfg.exe /h on'

anyway, my hypotheses can be checked easily: just run the VM with
changed RAM size (=C2=B11). This should have to drop hibernate state.

BTW I couldn't reproduce problem as well.

On Thu, Apr 13, 2023 at 3:10=E2=80=AFPM Fiona Ebner <f.ebner@proxmox.com> w=
rote:
>
> Am 13.04.23 um 13:46 schrieb Mike Maslenkin:
> > Sorry for the noise, but just curious, how did you shutdown Windows?
> > Did you use 'shutdown /s' or just press power button?
> > Could it be that Windows was actually hibernated.
> > So, when you try to boot it on the new (old) QEMU version with changed
> > PCI topology, this could make it upset.
> > I observed similar behaviour in case of Windows for ARM, but there was
> > true GSOD afterwards.
> > When windows is starting again its hibernated state dropped and all goe=
s fine.
> >
> > Best Regards,
> > Mike
>
> I think I either pressed the shutdown button in our UI, which sends
> system_powerdown via QMP or via "Shut down" in the Windows start menu.
> Hibernation is surely something I need to consider (next time), so thank
> you for the hint, but if it were that, I'd be surprised at why it got
> stuck even with QEMU 6.2.0 today.
>
> If I try "shutdown /h" explicitly, I get "The request is not
> supported.(50)".
>
> Best Regards,
> Fiona
>

