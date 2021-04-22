Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6836823E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:14:04 +0200 (CEST)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZa5j-0004tZ-Qj
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lZa1U-0002iF-U1
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lZa1Q-0005h0-VI
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619100574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOHUTZ6D5jPXGBvwsxxQzFTOl9Qdb1c1bxF1loqQRfE=;
 b=aiJguwaueNeUi8+liq/FZASpz5ztRowyRYFJc5jO3YCCcS0d1o/mCV78vzOpIBKFaK05cN
 CQ/iOHRbjRPcVhTA6Y8Q+1hlu7Vzh6lcr40Bbyaf1w7DQ8yIUzGpjXmxgmqio2hvQ/rxrR
 ZDoMYe/eyVw8Lvn8Ko/0UF9llZmEhMg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-F9UvLa11M-ytCFOxrG8pAw-1; Thu, 22 Apr 2021 10:09:30 -0400
X-MC-Unique: F9UvLa11M-ytCFOxrG8pAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A196E84BA6C;
 Thu, 22 Apr 2021 14:09:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-151.ams2.redhat.com
 [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D89B102ADE5;
 Thu, 22 Apr 2021 14:09:14 +0000 (UTC)
Subject: Re: [PATCH] docs: Add SEV-ES documentation to
 amd-memory-encryption.txt
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <c06be7ec96e774bd6e17f14a27330c74266c5650.1619032376.git.thomas.lendacky@amd.com>
 <83253264-764c-85e3-8bb0-0dbd58b9c1dc@amd.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <dd9f9a84-b1e0-3740-6870-7c728f75e2ec@redhat.com>
Date: Thu, 22 Apr 2021 16:09:14 +0200
MIME-Version: 1.0
In-Reply-To: <83253264-764c-85e3-8bb0-0dbd58b9c1dc@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pavel Hrdina <phrdina@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michal Privoznik <mprivozn@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/21/21 21:31, Tom Lendacky wrote:
> On 4/21/21 2:12 PM, Tom Lendacky wrote:
>> From: Tom Lendacky <thomas.lendacky@amd.com>
>>
>> Update the amd-memory-encryption.txt file with information about SEV-ES,
>> including how to launch an SEV-ES guest and some of the differences
>> between SEV and SEV-ES guests in regards to launching and measuring the
>> guest.
>>
> 
> Hmm, it occurs to me that I should also mention some of the launch
> restrictions between SEV and SEV-ES - such as not supporting SMM or reboot
> in SEV-ES because of the requirements to modify the guest register state.
> 
> I'll wait for feedback on this version and send out a v2 with the added
> information.

I have two comments on v1 (and thanks much for posting it):

(1) Please split the typo fixes off to an initial patch. I tried to read
your changes carefully and the typo fixes kept throwing me off.

(2) Since you are already doing great work on this :) , can you tack on
the patch for "docs/interop/firmware.json"?

It would mean just duplicating the @amd-sev enum constant as @amd-sev-es
(documentation paragraph and the actual enum definition).

The new (SEV-ES) content in v1 looks plausible to me, but minimally
Brijesh should review it more closely.

Thanks!
Laszlo

> 
> Thanks,
> Tom
> 
>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>> ---
>>  docs/amd-memory-encryption.txt | 45 ++++++++++++++++++++++++++++------
>>  1 file changed, 37 insertions(+), 8 deletions(-)
>>
>> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
>> index 145896aec7..795b990fab 100644
>> --- a/docs/amd-memory-encryption.txt
>> +++ b/docs/amd-memory-encryption.txt
>> @@ -12,18 +12,28 @@ The key management of this feature is handled by separate processor known as
>>  AMD secure processor (AMD-SP) which is present in AMD SOCs. Firmware running
>>  inside the AMD-SP provide commands to support common VM lifecycle. This
>>  includes commands for launching, snapshotting, migrating and debugging the
>> -encrypted guest. Those SEV command can be issued via KVM_MEMORY_ENCRYPT_OP
>> +encrypted guest. Those SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
>>  ioctls.
>>  
>> +Secure Encrypted Virtualization - Encrypted State (SEV-ES) builds on the SEV
>> +support to additionally protect the guest register state. In order to allow a
>> +hypervisor to perform functions on behalf of a guest, there is architectural
>> +support for notifying a guest's operating system when certain types of VMEXITs
>> +are about to occur. This allows the guest to selectively share information with
>> +the hypervisor to satisfy the requested function.
>> +
>>  Launching
>>  ---------
>>  Boot images (such as bios) must be encrypted before guest can be booted.
>> -MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images :LAUNCH_START,
>> +MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
>>  LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
>>  together generate a fresh memory encryption key for the VM, encrypt the boot
>>  images and provide a measurement than can be used as an attestation of the
>>  successful launch.
>>  
>> +For an SEV-ES guest, the LAUNCH_UPDATE_VMSA command is also used to encrypt the
>> +guest register state, or VM save area (VMSA), for all of the guest vCPUs.
>> +
>>  LAUNCH_START is called first to create a cryptographic launch context within
>>  the firmware. To create this context, guest owner must provides guest policy,
>>  its public Diffie-Hellman key (PDH) and session parameters. These inputs
>> @@ -40,31 +50,42 @@ The guest policy can be provided via the 'policy' property (see below)
>>  # ${QEMU} \
>>     sev-guest,id=sev0,policy=0x1...\
>>  
>> +Setting the "SEV-ES required" policy bit (bit 2) will launch the guest as an
>> +SEV-ES guest (see below)
>> +
>> +# ${QEMU} \
>> +   sev-guest,id=sev0,policy=0x5...\
>> +
>>  Guest owners provided DH certificate and session parameters will be used to
>>  establish a cryptographic session with the guest owner to negotiate keys used
>>  for the attestation.
>>  
>>  The DH certificate and session blob can be provided via 'dh-cert-file' and
>> -'session-file' property (see below
>> +'session-file' property (see below)
>>  
>>  # ${QEMU} \
>>       sev-guest,id=sev0,dh-cert-file=<file1>,session-file=<file2>
>>  
>>  LAUNCH_UPDATE_DATA encrypts the memory region using the cryptographic context
>> -created via LAUNCH_START command. If required, this command can be called
>> +created via the LAUNCH_START command. If required, this command can be called
>>  multiple times to encrypt different memory regions. The command also calculates
>>  the measurement of the memory contents as it encrypts.
>>  
>> -LAUNCH_MEASURE command can be used to retrieve the measurement of encrypted
>> -memory. This measurement is a signature of the memory contents that can be
>> -sent to the guest owner as an attestation that the memory was encrypted
>> +LAUNCH_UPDATE_VMSA encrypts all the vCPU VMSAs for an SEV-ES guest using the
>> +cryptographic context created via the LAUNCH_START command. The command also
>> +calculates the measurement of the VMSAs as it encrypts them.
>> +
>> +LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory and,
>> +for an SEV-ES guest, encrypted VMSAs. This measurement is a signature of the
>> +memory contents and, for an SEV-ES guest, the VMSA contents, that can be sent
>> +to the guest owner as an attestation that the memory and VMSAs were encrypted
>>  correctly by the firmware. The guest owner may wait to provide the guest
>>  confidential information until it can verify the attestation measurement.
>>  Since the guest owner knows the initial contents of the guest at boot, the
>>  attestation measurement can be verified by comparing it to what the guest owner
>>  expects.
>>  
>> -LAUNCH_FINISH command finalizes the guest launch and destroy's the cryptographic
>> +LAUNCH_FINISH command finalizes the guest launch and destroys the cryptographic
>>  context.
>>  
>>  See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
>> @@ -76,6 +97,12 @@ To launch a SEV guest
>>      -machine ...,confidential-guest-support=sev0 \
>>      -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1
>>  
>> +To launch a SEV-ES guest
>> +
>> +# ${QEMU} \
>> +    -machine ...,confidential-guest-support=sev0 \
>> +    -object sev-guest,id=sev0,cbitpos=47,reduced-phys-bits=1,policy=0x5
>> +
>>  Debugging
>>  -----------
>>  Since memory contents of SEV guest is encrypted hence hypervisor access to the
>> @@ -102,8 +129,10 @@ Secure Encrypted Virtualization Key Management:
>>  
>>  KVM Forum slides:
>>  http://www.linux-kvm.org/images/7/74/02x08A-Thomas_Lendacky-AMDs_Virtualizatoin_Memory_Encryption_Technology.pdf
>> +https://www.linux-kvm.org/images/9/94/Extending-Secure-Encrypted-Virtualization-with-SEV-ES-Thomas-Lendacky-AMD.pdf
>>  
>>  AMD64 Architecture Programmer's Manual:
>>     http://support.amd.com/TechDocs/24593.pdf
>>     SME is section 7.10
>>     SEV is section 15.34
>> +   SEV-ES is section 15.35
>>
> 


