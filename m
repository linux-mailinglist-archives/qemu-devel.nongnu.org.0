Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABA56E0D5B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 14:19:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmvvG-0005cb-V5; Thu, 13 Apr 2023 08:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pmvvD-0005cG-VJ
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:19:28 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1pmvv5-0004Xx-Cv
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:19:24 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 632D6416AA;
 Thu, 13 Apr 2023 14:09:59 +0200 (CEST)
Message-ID: <1f9afc12-b0b2-501d-7bf9-9f6d2f5b9829@proxmox.com>
Date: Thu, 13 Apr 2023 14:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 19/54] acpi: pc: isa bridge: use AcpiDevAmlIf interface to
 build ISA device descriptors
Content-Language: en-US
To: Mike Maslenkin <mike.maslenkin@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <20220610075631.367501-1-mst@redhat.com>
 <20220610075631.367501-20-mst@redhat.com>
 <ba6a8777-723d-7e6c-bec7-71819cedb66d@proxmox.com>
 <20230330102227.39b44b71@imammedo.users.ipa.redhat.com>
 <0e3f3a98-835f-b26c-649e-a8a35edce660@proxmox.com>
 <20230412141822.03507c56@imammedo.users.ipa.redhat.com>
 <ff5ccf7b-158f-262d-3155-305e2d48dc37@proxmox.com>
 <CAL77WPAgTjtpiW++pqEHLfm7LOP7KEKK6eNdwU5fXSXHm9Pj-w@mail.gmail.com>
From: Fiona Ebner <f.ebner@proxmox.com>
In-Reply-To: <CAL77WPAgTjtpiW++pqEHLfm7LOP7KEKK6eNdwU5fXSXHm9Pj-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.083,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Am 13.04.23 um 13:46 schrieb Mike Maslenkin:
> Sorry for the noise, but just curious, how did you shutdown Windows?
> Did you use 'shutdown /s' or just press power button?
> Could it be that Windows was actually hibernated.
> So, when you try to boot it on the new (old) QEMU version with changed
> PCI topology, this could make it upset.
> I observed similar behaviour in case of Windows for ARM, but there was
> true GSOD afterwards.
> When windows is starting again its hibernated state dropped and all goes fine.
> 
> Best Regards,
> Mike

I think I either pressed the shutdown button in our UI, which sends
system_powerdown via QMP or via "Shut down" in the Windows start menu.
Hibernation is surely something I need to consider (next time), so thank
you for the hint, but if it were that, I'd be surprised at why it got
stuck even with QEMU 6.2.0 today.

If I try "shutdown /h" explicitly, I get "The request is not
supported.(50)".

Best Regards,
Fiona


