Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C76806D5294
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 22:36:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjQun-0001Qh-Rz; Mon, 03 Apr 2023 16:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjQul-0001QV-VA
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:36:31 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjQuk-0004v5-55
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:36:31 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso20604269wms.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 13:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680554188;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hNpPseAD6nHZ7v+hgrSa5UPOdQF/BU4JEX0k08mqk2E=;
 b=BzrQf8shkKF3ucc8v0yanJ+Y+GcgPtueiVt7X99aCBS4DeY+XPagZA/aqqJeocKnGQ
 vAm80zoeHOANwvXNddMOL7IBIjwphOJFStdydNflih2ttP8KROWr9FklP2PJqrEH9o2d
 rGPbRwTINAhRpF9n42/WlHkMeEI5FWxRKLf2neETIG2bLlXvVmsqSehsrk8w4iLJddGC
 mGuxAFIV6d3eGN5jxxOL+borlmXOai7qhD0ZogU9fxDMZqYbUKUAImap3hlnON7jQTh6
 DZW1lb3DC88qHwebbilU0AuHzQJ4gYOCqKu5vPU2JqMqVY6Y7UOaKS6kJiuRcQHgol5N
 +MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680554188;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hNpPseAD6nHZ7v+hgrSa5UPOdQF/BU4JEX0k08mqk2E=;
 b=fF40CDPDMIA91jcstW+L8it9vvKcqOdXdbpevz3WzTLc8ASIr38ZmS4JxMoApj7ku3
 0XTCq3R6XQT0JEwG/UUIDmpiRPxBcktbOj9uW9AjDAVwsKtgyB1feCSmQXpTaluRQQkL
 s/tUnirCv75xrt6i7I35/0C32bOUxDLwIawmvthwFQ1E+YeO28qGoEQRInPocmLifewW
 SKtJ9IBbGW1k1uaTS1sdzYbj22V/Vpja8D5WSDAnllFdipvMGoRii+nZBkfosT9nNR+b
 JTUNNDxgxfaAeK5QEhL4Ce9tPMungKk5FJyaBBWGFC5b8J2gIyo3bYI9AK+wMPrlIsas
 zDbw==
X-Gm-Message-State: AAQBX9faVHo7Dhdl8rePiC9ds2Bb6V2tAJFVlc7trNMNrJLeJzma6JA/
 mGhmW8Cfdw4X7m1Dk9y/SUQ=
X-Google-Smtp-Source: AKy350bKz/PYk6lgC93kgyq++7qdvvptIvcgqHIM2SizcDYoNqvyp2ruZaSzDSuJzx2fXfh1j29U3A==
X-Received: by 2002:a1c:f208:0:b0:3eb:4150:a476 with SMTP id
 s8-20020a1cf208000000b003eb4150a476mr497072wmc.0.1680554188103; 
 Mon, 03 Apr 2023 13:36:28 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-055-162-106.78.55.pool.telefonica.de.
 [78.55.162.106]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b003f04057bf1bsm13656303wmb.18.2023.04.03.13.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 13:36:27 -0700 (PDT)
Date: Mon, 03 Apr 2023 20:36:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <eduardo@habkost.net>, 
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/6=5D_hw/isa/piix3=3A_Reuse?=
 =?US-ASCII?Q?_piix3=5Frealize=28=29_in_piix3=5Fxen=5Frealize=28=29?=
In-Reply-To: <CAKf6xpvxf=F52etJ8o3eLQV4JVD5WM57znGoP3ctONRf7uPisA@mail.gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
 <20230312120221.99183-3-shentey@gmail.com>
 <f52c41f7-e662-4afd-8ac9-ce2c0da2b1be@perard>
 <7F45B51F-F1E3-4F04-A46F-4C80509C7195@gmail.com>
 <622b9674-fffd-4634-ac30-d0db3230478e@perard>
 <CAKf6xpvxf=F52etJ8o3eLQV4JVD5WM57znGoP3ctONRf7uPisA@mail.gmail.com>
Message-ID: <3D51F8CC-6909-4777-9C43-5E277650331C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
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



Am 3=2E April 2023 12:27:14 UTC schrieb Jason Andryuk <jandryuk@gmail=2Eco=
m>:
>On Mon, Apr 3, 2023 at 5:33=E2=80=AFAM Anthony PERARD <anthony=2Eperard@c=
itrix=2Ecom> wrote:
>>
>> On Sat, Apr 01, 2023 at 10:36:45PM +0000, Bernhard Beschow wrote:
>> >
>> >
>> > Am 30=2E M=C3=A4rz 2023 13:00:25 UTC schrieb Anthony PERARD <anthony=
=2Eperard@citrix=2Ecom>:
>> > >On Sun, Mar 12, 2023 at 01:02:17PM +0100, Bernhard Beschow wrote:
>> > >> This is a preparational patch for the next one to make the followi=
ng
>> > >> more obvious:
>> > >>
>> > >> First, pci_bus_irqs() is now called twice in case of Xen where the
>> > >> second call overrides the pci_set_irq_fn with the Xen variant=2E
>> > >
>> > >pci_bus_irqs() does allocates pci_bus->irq_count, so the second call=
 in
>> > >piix3_xen_realize() will leak `pci_bus->irq_count`=2E Could you look=
 if
>> > >pci_bus_irqs_cleanup() can be called before the second pci_bus_irqs(=
)
>> > >call, or maybe some other way to avoid the leak?
>> >
>> > Thanks for catching this! I'll post a v4=2E
>> >
>> > I think the most fool-proof way to fix this is to free irq_count just=
 before the assignment=2E pci_bus_irqs_cleanup() would then have to NULL th=
e attribute such that pci_bus_irqs() can be called afterwards=2E
>> >
>> > BTW: I tried running qemu-system-x86_64 with PIIX4 rather than PIIX3 =
as Xen guest with my pc-piix4 branch without success=2E This branch essenti=
ally just provides slightly different PCI IDs for PIIX=2E Does xl or someth=
ing else in Xen check these? If not then this means I'm still missing somet=
hing=2E Under KVM this branch works just fine=2E Any idea?
>>
>> Maybe the ACPI tables provided by libxl needs to be updated=2E
>> Or maybe something in the firmware (SeaBIOS or OVMF/OvmfXen) check the
>> id (I know that the PCI id of the root bus is checked, but I don't know
>> if that's the one that's been changed)=2E
>
>Xen also has hvmloader, which runs before SeaBIOS/OVMF=2E  Looking at
>tools/firmware/hvmloader/pci=2Ec, it has
>        ASSERT((devfn !=3D PCI_ISA_DEVFN) ||
>               ((vendor_id =3D=3D 0x8086) && (device_id =3D=3D 0x7000)));
>
>From QEMU, it looks like 0x7000 is PCI_DEVICE_ID_INTEL_82371SB_0, but
>PIIX4 uses 0x7110 (PCI_DEVICE_ID_INTEL_82371AB_0)=2E  Maybe try removing
>that check?

Sounds promising indeed=2E I'll give it a try!

Regards,
Bernhard

>
>Regards,
>Jason

