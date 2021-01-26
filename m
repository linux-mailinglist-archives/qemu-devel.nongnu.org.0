Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8EE3043D5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:28:44 +0100 (CET)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4RCt-0003HG-7G
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4R6M-0008Oi-6X
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:21:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4R6I-000770-2z
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611678112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sjkEg/wo/oYcd5wME62mrexAYIXyreMX6wM/DmqObFE=;
 b=V5SoGf7RSpXQ/ITyxejes7DoES9wvd5K4O1vG+6/05Gx6JxhxHiU7rlt4QTY5dokRw6w2h
 GhnN+ZZTJtVjnkrbre119B7I1YI/n0wajnqv4fCzIfHup6la7ZnXxATf2K5WfEayG3wbEm
 KBESpbV1VTFU9H5idZV3a/PEjk7ubik=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-kepNRBKAMi-TVvFbzS14bA-1; Tue, 26 Jan 2021 11:21:39 -0500
X-MC-Unique: kepNRBKAMi-TVvFbzS14bA-1
Received: by mail-ed1-f70.google.com with SMTP id u19so9130814edr.1
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 08:21:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sjkEg/wo/oYcd5wME62mrexAYIXyreMX6wM/DmqObFE=;
 b=J0cPfDZN1aN7mZZKoClIC7MJ/nLUlyYlY6oHjedtfWQPhC2rNyfU2HAuJ8DdiyeUA8
 KjZG8vcbw6lgzLUMti3Y7jIJu3ZIfvw92y+SrpCK3Cz1gkbMTqCQaB7Gn4Qn9/xjPGdh
 YlSA+Ias02HQ55a07flXxK12TtHPvHtE+QSAmQ7GhXYVQwLu4cUsR7l3Hycwk2rdxkVR
 aL6AM0xy1X1dkHVBebax/Pa+TLakzPsgtLywxxENdsf4vyM6AnlNqA1AQnbJaT8gyjnW
 HoBK+LDja6bETt1h0CJy3bAeH56B3cSX6KasHASESxH5TKMTphAR6QOQozF9LvfKJipM
 VSoA==
X-Gm-Message-State: AOAM5332EWS7O4/ig3PR8/7aKxkl2ai6+J3CFguPCPkq2X31k2fJXBgg
 YxSgYKh7c53zPoe3njaEmDiXilT9wKubOFZKBDen3IFzfeHGcJMZi7Gzxw6xag9TCAkWa3fvIir
 QqdTpzihTdqS9gcU=
X-Received: by 2002:a05:6402:b68:: with SMTP id
 cb8mr5148572edb.346.1611678097912; 
 Tue, 26 Jan 2021 08:21:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPyeaEvKovTY03nnv+TdQ6ynwZAjjJXWuwEFaRjVfzMwLlbQbps08spgaC8lGxM51D4Puh1Q==
X-Received: by 2002:a05:6402:b68:: with SMTP id
 cb8mr5148562edb.346.1611678097754; 
 Tue, 26 Jan 2021 08:21:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r26sm13411455edc.95.2021.01.26.08.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 08:21:36 -0800 (PST)
Subject: Re: [PATCH v4 0/6] Qemu SEV-ES guest support
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <cover.1601060620.git.thomas.lendacky@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <30164d98-3d8c-64bf-500b-f98a7f12d3c3@redhat.com>
Date: Tue, 26 Jan 2021 17:21:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1601060620.git.thomas.lendacky@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/09/20 21:03, Tom Lendacky wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> This patch series provides support for launching an SEV-ES guest.
> 
> Secure Encrypted Virtualization - Encrypted State (SEV-ES) expands on the
> SEV support to protect the guest register state from the hypervisor. See
> "AMD64 Architecture Programmer's Manual Volume 2: System Programming",
> section "15.35 Encrypted State (SEV-ES)" [1].
> 
> In order to allow a hypervisor to perform functions on behalf of a guest,
> there is architectural support for notifying a guest's operating system
> when certain types of VMEXITs are about to occur. This allows the guest to
> selectively share information with the hypervisor to satisfy the requested
> function. The notification is performed using a new exception, the VMM
> Communication exception (#VC). The information is shared through the
> Guest-Hypervisor Communication Block (GHCB) using the VMGEXIT instruction.
> The GHCB format and the protocol for using it is documented in "SEV-ES
> Guest-Hypervisor Communication Block Standardization" [2].
> 
> The main areas of the Qemu code that are updated to support SEV-ES are
> around the SEV guest launch process and AP booting in order to support
> booting multiple vCPUs.
> 
> There are no new command line switches required. Instead, the desire for
> SEV-ES is presented using the SEV policy object. Bit 2 of the SEV policy
> object indicates that SEV-ES is required.
> 
> The SEV launch process is updated in two ways. The first is that a the
> KVM_SEV_ES_INIT ioctl is used to initialize the guest instead of the
> standard KVM_SEV_INIT ioctl. The second is that before the SEV launch
> measurement is calculated, the LAUNCH_UPDATE_VMSA SEV API is invoked for
> each vCPU that Qemu has created. Once the LAUNCH_UPDATE_VMSA API has been
> invoked, no direct changes to the guest register state can be made.
> 
> AP booting poses some interesting challenges. The INIT-SIPI-SIPI sequence
> is typically used to boot the APs. However, the hypervisor is not allowed
> to update the guest registers. For the APs, the reset vector must be known
> in advance. An OVMF method to provide a known reset vector address exists
> by providing an SEV information block, identified by UUID, near the end of
> the firmware [3]. OVMF will program the jump to the actual reset vector in
> this area of memory. Since the memory location is known in advance, an AP
> can be created with the known reset vector address as its starting CS:IP.
> The GHCB document [2] talks about how SMP booting under SEV-ES is
> performed. SEV-ES also requires the use of the in-kernel irqchip support
> in order to minimize the changes required to Qemu to support AP booting.
> 
> [1] https://www.amd.com/system/files/TechDocs/24593.pdf
> [2] https://developer.amd.com/wp-content/resources/56421.pdf
> [3] 30937f2f98c4 ("OvmfPkg: Use the SEV-ES work area for the SEV-ES AP reset vector")
>      https://github.com/tianocore/edk2/commit/30937f2f98c42496f2f143fe8374ae7f7e684847
> 
> ---
> 
> These patches are based on commit:
> d0ed6a69d3 ("Update version for v5.1.0 release")
> 
> (I tried basing on the latest Qemu commit, but I was having build issues
> that level)
> 
> A version of the tree can be found at:
> https://github.com/AMDESE/qemu/tree/sev-es-v12
> 
> Changes since v3:
> - Use the QemuUUID structure for GUID definitions
> - Use SEV-ES policy bit definition from target/i386/sev_i386.h
> - Update SMM support to a per-VM check in order to check SMM capability
>    at the VM level since SEV-ES guests don't currently support SMM
> - Make the CPU resettable check an arch-specific check
> 
> Changes since v2:
> - Add in-kernel irqchip requirement for SEV-ES guests
> 
> Changes since v1:
> - Fixed checkpatch.pl errors/warnings
> 
> Tom Lendacky (6):
>    sev/i386: Add initial support for SEV-ES
>    sev/i386: Require in-kernel irqchip support for SEV-ES guests
>    sev/i386: Allow AP booting under SEV-ES
>    sev/i386: Don't allow a system reset under an SEV-ES guest
>    kvm/i386: Use a per-VM check for SMM capability
>    sev/i386: Enable an SEV-ES guest based on SEV policy
> 
>   accel/kvm/kvm-all.c       |  69 ++++++++++++++++++++++++
>   accel/stubs/kvm-stub.c    |   5 ++
>   hw/i386/pc_sysfw.c        |  10 +++-
>   include/sysemu/cpus.h     |   2 +
>   include/sysemu/hw_accel.h |   5 ++
>   include/sysemu/kvm.h      |  26 +++++++++
>   include/sysemu/sev.h      |   3 ++
>   softmmu/cpus.c            |   5 ++
>   softmmu/vl.c              |   5 +-
>   target/arm/kvm.c          |   5 ++
>   target/i386/cpu.c         |   1 +
>   target/i386/kvm.c         |  10 +++-
>   target/i386/sev-stub.c    |   5 ++
>   target/i386/sev.c         | 109 +++++++++++++++++++++++++++++++++++++-
>   target/i386/sev_i386.h    |   1 +
>   target/mips/kvm.c         |   5 ++
>   target/ppc/kvm.c          |   5 ++
>   target/s390x/kvm.c        |   5 ++
>   18 files changed, 271 insertions(+), 5 deletions(-)
> 

Looks good!  Please fix the nit in patch 4 and rebase, I'll then apply it.

Thanks,

Paolo


