Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E756968FF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:14:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRxwl-0006GU-Gf; Tue, 14 Feb 2023 11:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxwi-0006Fw-Gl
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:14:20 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pRxwg-0005jB-H6
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:14:20 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f23-20020a05600c491700b003dff4480a17so1129479wmp.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5XicBIyiYJMhmJqHOkvgf96a6motxVEqXqjmwL9hY9o=;
 b=cTrdu1FERlXdmJ2NHfse2ztniDmYojnLgWwFj57/M7k57FcdwnT5XLCr8au317POIj
 MNmaDU/wRUPppnMsGoL4fLWgTsqac2qnlGXdmVAw6UNSOjjnZwGtg9JLk/hAJZ+l6x1K
 VwuNSGoYM+5A0ILokdhxsP8LdXdPWs+Pps6K03WxoJ/1FLOyydKiLfMoFwLpbRDmQopK
 gGVbzqB0/ivZhbLEjBUt++BMjKvGCznn8ilFgvJIYL64mLGQpGO2vlm9xRvctvaE6GfA
 0rmYxcwyTf2xf15mlZoab+YGfAHFQb54km9P6j+lfxySSdtnRLDnmkPca3kXbQ9Mu26+
 2caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XicBIyiYJMhmJqHOkvgf96a6motxVEqXqjmwL9hY9o=;
 b=ngCuzcDw7WjcA/Xkndzb7rYoP3fYr7Ljh5oDBex0Yo7BTxHx3hepjvlvggE8jTILn9
 8NtBAO9OOPSZxhtG8lQS8K7RgI4e1wYmlK0tBvaXxPX4UuN3jgVHtkLUdvjJiOFXrJdD
 oew3GCZXWrtvhbCMaTSwr+oXKsWghcfkGpItvxk5OQnXJPAJyNRYlqw7S7OBgfq7fTr1
 iidUgE3Yj2kpbUbf7K3e3HsyUx1xEC2IzD18WqUp1PeILbRDEn/25/nTRIxhG2/e4bX4
 bSFzmu5uZlYp2jfOtgKmFkHjb5hYTIdURBAqcHbQzWHCXSGlSfbgjONy4QxV0MvFi9n4
 8XCw==
X-Gm-Message-State: AO0yUKVM3K1On0BUTWSDcb8Yf9tWMM1nermtL7k+AALG9RfsNE+SoM8+
 8466RGkqRT+LECNEd6p8/w0=
X-Google-Smtp-Source: AK7set9/3xMbhFEu3P4VcJa1YwAzLvB/NR0cFhiWUlVdzKd0mM3ON4jeXcToms3ESUaTp/pIGB9G4g==
X-Received: by 2002:a05:600c:996:b0:3dc:5abb:2f50 with SMTP id
 w22-20020a05600c099600b003dc5abb2f50mr2479672wmp.19.1676391256807; 
 Tue, 14 Feb 2023 08:14:16 -0800 (PST)
Received: from [10.95.154.108] (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b003e0015c8618sm21124712wmb.6.2023.02.14.08.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 08:14:16 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <0e7501e1-15b2-f309-1160-4561f43096a0@xen.org>
Date: Tue, 14 Feb 2023 16:14:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 57/59] hw/xen: Support MSI mapping to PIRQ
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230201143148.1744093-1-dwmw2@infradead.org>
 <20230201143148.1744093-58-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230201143148.1744093-58-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01/02/2023 14:31, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The way that Xen handles MSI PIRQs is kind of awful.
> 
> There is a special MSI message which targets a PIRQ. The vector in the
> low bits of data must be zero. The low 8 bits of the PIRQ# are in the
> destination ID field, the extended destination ID field is unused, and
> instead the high bits of the PIRQ# are in the high 32 bits of the address.
> 
> Using the high bits of the address means that we can't intercept and
> translate these messages in kvm_send_msi(), because they won't be caught
> by the APIC — addresses like 0x1000fee46000 aren't in the APIC's range.
> 
> So we catch them in pci_msi_trigger() instead, and deliver the event
> channel directly.
> 
> That isn't even the worst part. The worst part is that Xen snoops on
> writes to devices' MSI vectors while they are *masked*. When a MSI
> message is written which looks like it targets a PIRQ, it remembers
> the device and vector for later.
> 
> When the guest makes a hypercall to bind that PIRQ# (snooped from a
> marked MSI vector) to an event channel port, Xen *unmasks* that MSI
> vector on the device. Xen guests using PIRQ delivery of MSI don't
> ever actually unmask the MSI for themselves.
> 
> Now that this is working we can finally enable XENFEAT_hvm_pirqs and
> let the guest use it all.
> 
> Tested with passthrough igb and emulated e1000e + AHCI.
> 
>             CPU0       CPU1
>    0:         65          0   IO-APIC   2-edge      timer
>    1:          0         14  xen-pirq   1-ioapic-edge  i8042
>    4:          0        846  xen-pirq   4-ioapic-edge  ttyS0
>    8:          1          0  xen-pirq   8-ioapic-edge  rtc0
>    9:          0          0  xen-pirq   9-ioapic-level  acpi
>   12:        257          0  xen-pirq  12-ioapic-edge  i8042
>   24:       9600          0  xen-percpu    -virq      timer0
>   25:       2758          0  xen-percpu    -ipi       resched0
>   26:          0          0  xen-percpu    -ipi       callfunc0
>   27:          0          0  xen-percpu    -virq      debug0
>   28:       1526          0  xen-percpu    -ipi       callfuncsingle0
>   29:          0          0  xen-percpu    -ipi       spinlock0
>   30:          0       8608  xen-percpu    -virq      timer1
>   31:          0        874  xen-percpu    -ipi       resched1
>   32:          0          0  xen-percpu    -ipi       callfunc1
>   33:          0          0  xen-percpu    -virq      debug1
>   34:          0       1617  xen-percpu    -ipi       callfuncsingle1
>   35:          0          0  xen-percpu    -ipi       spinlock1
>   36:          8          0   xen-dyn    -event     xenbus
>   37:          0       6046  xen-pirq    -msi       ahci[0000:00:03.0]
>   38:          1          0  xen-pirq    -msi-x     ens4
>   39:          0         73  xen-pirq    -msi-x     ens4-rx-0
>   40:         14          0  xen-pirq    -msi-x     ens4-rx-1
>   41:          0         32  xen-pirq    -msi-x     ens4-tx-0
>   42:         47          0  xen-pirq    -msi-x     ens4-tx-1
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/meson.build    |   7 +
>   hw/i386/kvm/trace-events   |   1 +
>   hw/i386/kvm/xen-stubs.c    |  27 ++++
>   hw/i386/kvm/xen_evtchn.c   | 261 ++++++++++++++++++++++++++++++++++++-
>   hw/i386/kvm/xen_evtchn.h   |   8 ++
>   hw/pci/msi.c               |  11 ++
>   hw/pci/msix.c              |   7 +
>   hw/pci/pci.c               |  17 +++
>   include/hw/pci/msi.h       |   1 +
>   target/i386/kvm/kvm.c      |  19 ++-
>   target/i386/kvm/kvm_i386.h |   2 +
>   target/i386/kvm/xen-emu.c  |   3 +-
>   12 files changed, 354 insertions(+), 10 deletions(-)
>   create mode 100644 hw/i386/kvm/xen-stubs.c

Reviewed-by: Paul Durrant <paul@xen.org>


