Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299764ABE82
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:22:19 +0100 (CET)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH32A-0005Kj-8h
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:22:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH2xP-00033a-Hf; Mon, 07 Feb 2022 07:17:24 -0500
Received: from [2607:f8b0:4864:20::c29] (port=37798
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH2xL-0000t8-UE; Mon, 07 Feb 2022 07:17:23 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 t75-20020a4a3e4e000000b002e9c0821d78so13400963oot.4; 
 Mon, 07 Feb 2022 04:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1bSrLs1CdkvzwnKCfH3efNpgWBPE7ivaiQFoWK3Y2iA=;
 b=iqhUpqPPRP/wZ0FILS6x6GE1VK84+0XfIWQ2NJW3ZBe9u3WxKnAxFRRQysPZ090al3
 PQVkmzZij029a4h2tSucB7QMt4R/8XT327ifIOOk7b95eeLR9Ui0vXv51tFn/HPEMZ6b
 atNfkDAs195AkhUL/jBR2sfyZ9LtdOW9mUqV0JEMdi8Hezxj4s6q3urT6wbj2rTUygHm
 DwhlKiaiRHF+qLRkN9LY0eACQWG+R3nLUmAd9PwbLfdqdtCee5HvV5ir2inrjPPCzXYY
 8pMbzl68W4GS42IkXXHVtyJmDAiW7tpSuygt0ja5vGSFDp7HQKxkbloeqj4PKh92cMUP
 m2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1bSrLs1CdkvzwnKCfH3efNpgWBPE7ivaiQFoWK3Y2iA=;
 b=OHioucfkwU1LJhGgJ9Bd89yJ0aDli2/Pq5ulcxeC35ejwfVZLF+BsPKvnVWX0123Sc
 /yE1o5s+4EDYXzdFizhXeW7THk/pV+fqHnTo4+mzaNGj/1mnXZVg//GpQpTvcl7PMUCT
 nswUDmJ5AUQNTGaJn84S5Ik5rlEBmYcWYb4phGDWH4KA2z3LLY0D3K7xaS0gfLJFmF5U
 WfAT4X6T0MR8XKjUJfZQ5THVPMauSQv3sW4Bu1MFOJs4iilueK/5fEQgximl86O2MxUJ
 D+icxV132Y2hcXPwEXzxY8GVgzyxEGjdThoGH4AKhMmfZL6SHGVvs50aIMWgRpTIMVdT
 H/Tw==
X-Gm-Message-State: AOAM531VAjbg287iaVirFkjDPZDAFI6QL8Xy1dIqPxSb8cqTIJZCQO2D
 tHBa/4cQvf4MFfg1/T3k7ys=
X-Google-Smtp-Source: ABdhPJxzdaosQqF/fO9V3RsawBL4QwUSkVi2Cn6y4E0clbY8PYlP6PBFnutmUUKAFO9cv3wtkkm8sg==
X-Received: by 2002:a05:6870:3505:: with SMTP id
 k5mr4361758oah.234.1644236199224; 
 Mon, 07 Feb 2022 04:16:39 -0800 (PST)
Received: from [192.168.10.222] ([191.193.0.12])
 by smtp.gmail.com with ESMTPSA id a4sm3695068oaa.42.2022.02.07.04.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 04:16:38 -0800 (PST)
Message-ID: <13bb877b-364f-25b5-6f35-cedea9b532d1@gmail.com>
Date: Mon, 7 Feb 2022 09:16:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] docs: rstfy confidential guest documentation
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20220204161251.241877-1-cohuck@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220204161251.241877-1-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/4/22 13:12, Cornelia Huck wrote:
> Also rstfy the documentation for AMD SEV, and link it.
> 
> The documentation for PEF had been merged into the pseries doc,
> fix the reference.

Yeah, we forgot to fix/remove the existing papr-pef.txt reference after the changes we
made. Thanks for fixing this up and making a new ref for it in the pseries doc.

> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   MAINTAINERS                                   |   2 +-
>   .../confidential-guest-support.rst}           |  15 +--
>   .../i386/amd-memory-encryption.rst}           | 102 ++++++++++--------
>   docs/system/index.rst                         |   1 +
>   docs/system/ppc/pseries.rst                   |   2 +
>   docs/system/target-i386.rst                   |   1 +
>   6 files changed, 67 insertions(+), 56 deletions(-)
>   rename docs/{confidential-guest-support.txt => system/confidential-guest-support.rst} (77%)
>   rename docs/{amd-memory-encryption.txt => system/i386/amd-memory-encryption.rst} (62%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9814580975c5..8944fb561c0b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -408,7 +408,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
>   M: Marcelo Tosatti <mtosatti@redhat.com>
>   L: kvm@vger.kernel.org
>   S: Supported
> -F: docs/amd-memory-encryption.txt
> +F: docs/system/i386/amd-memory-encryption.rst
>   F: docs/system/i386/sgx.rst
>   F: target/i386/kvm/
>   F: target/i386/sev*
> diff --git a/docs/confidential-guest-support.txt b/docs/system/confidential-guest-support.rst
> similarity index 77%
> rename from docs/confidential-guest-support.txt
> rename to docs/system/confidential-guest-support.rst
> index 71d07ba57af8..0c490dbda2b7 100644
> --- a/docs/confidential-guest-support.txt
> +++ b/docs/system/confidential-guest-support.rst
> @@ -19,10 +19,10 @@ Running a Confidential Guest
>   
>   To run a confidential guest you need to add two command line parameters:
>   
> -1. Use "-object" to create a "confidential guest support" object.  The
> +1. Use ``-object`` to create a "confidential guest support" object.  The
>      type and parameters will vary with the specific mechanism to be
>      used
> -2. Set the "confidential-guest-support" machine parameter to the ID of
> +2. Set the ``confidential-guest-support`` machine parameter to the ID of
>      the object from (1).
>   
>   Example (for AMD SEV)::
> @@ -37,13 +37,8 @@ Supported mechanisms
>   
>   Currently supported confidential guest mechanisms are:
>   
> -AMD Secure Encrypted Virtualization (SEV)
> -    docs/amd-memory-encryption.txt
> -
> -POWER Protected Execution Facility (PEF)
> -    docs/papr-pef.txt
> -
> -s390x Protected Virtualization (PV)
> -    docs/system/s390x/protvirt.rst
> +* AMD Secure Encrypted Virtualization (SEV) (see :doc:`i386/amd-memory-encryption`)
> +* POWER Protected Execution Facility (PEF) (see :ref:`power-papr-protected-execution-facility-pef`)
> +* s390x Protected Virtualization (PV) (see :doc:`s390x/protvirt`)
>   
>   Other mechanisms may be supported in future.
> diff --git a/docs/amd-memory-encryption.txt b/docs/system/i386/amd-memory-encryption.rst
> similarity index 62%
> rename from docs/amd-memory-encryption.txt
> rename to docs/system/i386/amd-memory-encryption.rst
> index ffca382b5f5d..215946f813bb 100644
> --- a/docs/amd-memory-encryption.txt
> +++ b/docs/system/i386/amd-memory-encryption.rst
> @@ -1,3 +1,6 @@
> +AMD Secure Encrypted Virtualization (SEV)
> +=========================================
> +
>   Secure Encrypted Virtualization (SEV) is a feature found on AMD processors.
>   
>   SEV is an extension to the AMD-V architecture which supports running encrypted
> @@ -24,17 +27,18 @@ the hypervisor to satisfy the requested function.
>   
>   Launching
>   ---------
> +
>   Boot images (such as bios) must be encrypted before a guest can be booted. The
> -MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
> -LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
> +``MEMORY_ENCRYPT_OP`` ioctl provides commands to encrypt the images: ``LAUNCH_START``,
> +``LAUNCH_UPDATE_DATA``, ``LAUNCH_MEASURE`` and ``LAUNCH_FINISH``. These four commands
>   together generate a fresh memory encryption key for the VM, encrypt the boot
>   images and provide a measurement than can be used as an attestation of a
>   successful launch.
>   
> -For a SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt the
> +For a SEV-ES guest, the ``LAUNCH_UPDATE_VMSA`` command is also used to encrypt the
>   guest register state, or VM save area (VMSA), for all of the guest vCPUs.
>   
> -LAUNCH_START is called first to create a cryptographic launch context within
> +``LAUNCH_START`` is called first to create a cryptographic launch context within
>   the firmware. To create this context, guest owner must provide a guest policy,
>   its public Diffie-Hellman key (PDH) and session parameters. These inputs
>   should be treated as a binary blob and must be passed as-is to the SEV firmware.
> @@ -45,37 +49,37 @@ in bad measurement). The guest policy is a 4-byte data structure containing
>   several flags that restricts what can be done on a running SEV guest.
>   See KM Spec section 3 and 6.2 for more details.
>   
> -The guest policy can be provided via the 'policy' property (see below)

I approve the "(see below)" instances that you ended up removing. It sounded a bit redundant
when used in the end of the sentence.


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>


> +The guest policy can be provided via the ``policy`` property::
>   
> -# ${QEMU} \
> -   sev-guest,id=sev0,policy=0x1...\
> +  # ${QEMU} \
> +     sev-guest,id=sev0,policy=0x1...\
>   
>   Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as a
> -SEV-ES guest (see below)
> +SEV-ES guest::
>   
> -# ${QEMU} \
> -   sev-guest,id=sev0,policy=0x5...\
> +  # ${QEMU} \
> +     sev-guest,id=sev0,policy=0x5...\
>   
>   The guest owner provided DH certificate and session parameters will be used to
>   establish a cryptographic session with the guest owner to negotiate keys used
>   for the attestation.
>   
> -The DH certificate and session blob can be provided via the 'dh-cert-file' and
> -'session-file' properties (see below)
> +The DH certificate and session blob can be provided via the ``dh-cert-file`` and
> +``session-file`` properties::
>   
> -# ${QEMU} \
> -     sev-guest,id=sev0,dh-cert-file=<file1>,session-file=<file2>
> +  # ${QEMU} \
> +       sev-guest,id=sev0,dh-cert-file=<file1>,session-file=<file2>
>   
> -LAUNCH_UPDATE_DATA encrypts the memory region using the cryptographic context
> -created via the LAUNCH_START command. If required, this command can be called
> +``LAUNCH_UPDATE_DATA`` encrypts the memory region using the cryptographic context
> +created via the ``LAUNCH_START`` command. If required, this command can be called
>   multiple times to encrypt different memory regions. The command also calculates
>   the measurement of the memory contents as it encrypts.
>   
> -LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for a SEV-ES guest using the
> -cryptographic context created via the LAUNCH_START command. The command also
> +``LAUNCH_UPDATE_VMSA`` encrypts all the vCPU VMSAs for a SEV-ES guest using the
> +cryptographic context created via the ``LAUNCH_START`` command. The command also
>   calculates the measurement of the VMSAs as it encrypts them.
>   
> -LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory and,
> +``LAUNCH_MEASURE`` can be used to retrieve the measurement of encrypted memory and,
>   for a SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
>   memory contents and, for a SEV-ES guest, the VMSA contents, that can be sent
>   to the guest owner as an attestation that the memory and VMSAs were encrypted
> @@ -85,27 +89,28 @@ Since the guest owner knows the initial contents of the guest at boot, the
>   attestation measurement can be verified by comparing it to what the guest owner
>   expects.
>   
> -LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
> +``LAUNCH_FINISH`` finalizes the guest launch and destroys the cryptographic
>   context.
>   
> -See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
> +See SEV KM API Spec ([SEVKM]_) 'Launching a guest' usage flow (Appendix A) for the
>   complete flow chart.
>   
> -To launch a SEV guest
> +To launch a SEV guest::
>   
> -# ${QEMU} \
> -    -machine ...,confidential-guest-support=sev0 \
> -    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
> +  # ${QEMU} \
> +      -machine ...,confidential-guest-support=sev0 \
> +      -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
>   
> -To launch a SEV-ES guest
> +To launch a SEV-ES guest::
>   
> -# ${QEMU} \
> -    -machine ...,confidential-guest-support=sev0 \
> -    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
> +  # ${QEMU} \
> +      -machine ...,confidential-guest-support=sev0 \
> +      -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
>   
>   An SEV-ES guest has some restrictions as compared to a SEV guest. Because the
>   guest register state is encrypted and cannot be updated by the VMM/hypervisor,
>   a SEV-ES guest:
> +
>    - Does not support SMM - SMM support requires updating the guest register
>      state.
>    - Does not support reboot - a system reset requires updating the guest register
> @@ -114,35 +119,42 @@ a SEV-ES guest:
>      manage booting APs.
>   
>   Debugging
> ------------
> +---------
> +
>   Since the memory contents of a SEV guest are encrypted, hypervisor access to
>   the guest memory will return cipher text. If the guest policy allows debugging,
>   then a hypervisor can use the DEBUG_DECRYPT and DEBUG_ENCRYPT commands to access
>   the guest memory region for debug purposes.  This is not supported in QEMU yet.
>   
>   Snapshot/Restore
> ------------------
> +----------------
> +
>   TODO
>   
>   Live Migration
> -----------------
> +---------------
> +
>   TODO
>   
>   References
> ------------------
> +----------
>   
> -AMD Memory Encryption whitepaper:
> -https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf
> +`AMD Memory Encryption whitepaper
> +<https://developer.amd.com/wordpress/media/2013/12/AMD_Memory_Encryption_Whitepaper_v7-Public.pdf>`_
>   
> -Secure Encrypted Virtualization Key Management:
> -[1] http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf
> +.. [SEVKM] `Secure Encrypted Virtualization Key Management
> +   <http://developer.amd.com/wordpress/media/2017/11/55766_SEV-KM-API_Specification.pdf>`_
>   
>   KVM Forum slides:
> -http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
> -https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf
> -
> -AMD64 Architecture Programmer's Manual:
> -   http://support.amd.com/TechDocs/24593.pdf
> -   SME is section 7.10
> -   SEV is section 15.34
> -   SEV-ES is section 15.35
> +
> +* `AMD’s Virtualization Memory Encryption (2016)
> +  <http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf>`_
> +* `Extending Secure Encrypted Virtualization With SEV-ES (2018)
> +  <https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf>`_
> +
> +`AMD64 Architecture Programmer's Manual:
> +<http://support.amd.com/TechDocs/24593.pdf>`_
> +
> +* SME is section 7.10
> +* SEV is section 15.34
> +* SEV-ES is section 15.35
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index 73bbedbc22d4..23e30e26e5e6 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -34,3 +34,4 @@ or Hypervisor.Framework.
>      targets
>      security
>      multi-process
> +   confidential-guest-support
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index 569237dc0c8b..d9b65ad4e850 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -224,6 +224,8 @@ nested. Combinations not shown in the table are not available.
>   .. [3] Introduced on Power10 machines.
>   
>   
> +.. _power-papr-protected-execution-facility-pef:
> +
>   POWER (PAPR) Protected Execution Facility (PEF)
>   -----------------------------------------------
>   
> diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
> index 4daa53c35d8f..96bf54889a82 100644
> --- a/docs/system/target-i386.rst
> +++ b/docs/system/target-i386.rst
> @@ -28,6 +28,7 @@ Architectural features
>      i386/cpu
>      i386/kvm-pv
>      i386/sgx
> +   i386/amd-memory-encryption
>   
>   .. _pcsys_005freq:
>   

