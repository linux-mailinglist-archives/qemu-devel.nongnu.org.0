Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6E2399D2E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:52:54 +0200 (CEST)
Received: from localhost ([::1]:38788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loj5x-0004U9-Hw
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1loijg-0008Bf-B1
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1loijc-0004Ej-KB
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622708986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgL9tnn17BVMShRhhtaGa5DSkh8Ab3ZNwAUbCaqtU2M=;
 b=WXQ943k2cEWWAlDp1/dywPyJkvhXv7V28bqhnT1AkXVrTq8q397p/NaVNGF61m433hvZW0
 5OSCYDDelrXMmkTH5Kr8RBu6ljKM7AUdtFuwJEprL3jWGgIDMrWVDjw8gnGPveOYNGJ2XZ
 /cRa08ZWwJFwhMLQxper1UzKkh9D/dM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-zdMza2B-P7K26ip6tgs8eg-1; Thu, 03 Jun 2021 04:29:45 -0400
X-MC-Unique: zdMza2B-P7K26ip6tgs8eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B600801817;
 Thu,  3 Jun 2021 08:29:44 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-70.ams2.redhat.com
 [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6749A77F3C;
 Thu,  3 Jun 2021 08:29:36 +0000 (UTC)
Subject: Re: [PATCH v2 1/3] doc: Fix some mistakes in the SEV documentation
To: Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <a7c5ee6c056d840f46028f4a817c16a9862bdd9e.1619208498.git.thomas.lendacky@amd.com>
 <95a079ae-a6b3-b7f6-5d22-c8114b3da991@amd.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <4b4fee23-96be-740b-87dc-cbee8ef7ea53@redhat.com>
Date: Thu, 3 Jun 2021 10:29:35 +0200
MIME-Version: 1.0
In-Reply-To: <95a079ae-a6b3-b7f6-5d22-c8114b3da991@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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

On 06/02/21 21:19, Tom Lendacky wrote:
> Just a quick ping on this series...

Right, I'm unsure who is supposed to merge this... Do you remember who
usually merges the SEV-related patch series (plural)?

Thanks
Laszlo

> 
> Thanks,
> Tom
> 
> On 4/23/21 3:08 PM, Tom Lendacky wrote:
>> From: Tom Lendacky <thomas.lendacky@amd.com>
>>
>> Fix some spelling and grammar mistakes in the amd-memory-encryption.txt
>> file. No new information added.
>>
>> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>> ---
>>  docs/amd-memory-encryption.txt | 59 +++++++++++++++++-----------------
>>  1 file changed, 29 insertions(+), 30 deletions(-)
>>
>> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
>> index 145896aec7..ed85159ea7 100644
>> --- a/docs/amd-memory-encryption.txt
>> +++ b/docs/amd-memory-encryption.txt
>> @@ -1,38 +1,38 @@
>>  Secure Encrypted Virtualization (SEV) is a feature found on AMD processors.
>>  
>>  SEV is an extension to the AMD-V architecture which supports running encrypted
>> -virtual machine (VMs) under the control of KVM. Encrypted VMs have their pages
>> +virtual machines (VMs) under the control of KVM. Encrypted VMs have their pages
>>  (code and data) secured such that only the guest itself has access to the
>>  unencrypted version. Each encrypted VM is associated with a unique encryption
>> -key; if its data is accessed to a different entity using a different key the
>> +key; if its data is accessed by a different entity using a different key the
>>  encrypted guests data will be incorrectly decrypted, leading to unintelligible
>>  data.
>>  
>> -The key management of this feature is handled by separate processor known as
>> -AMD secure processor (AMD-SP) which is present in AMD SOCs. Firmware running
>> -inside the AMD-SP provide commands to support common VM lifecycle. This
>> +Key management for this feature is handled by a separate processor known as the
>> +AMD secure processor (AMD-SP), which is present in AMD SOCs. Firmware running
>> +inside the AMD-SP provides commands to support a common VM lifecycle. This
>>  includes commands for launching, snapshotting, migrating and debugging the
>> -encrypted guest. Those SEV command can be issued via KVM_MEMORY_ENCRYPT_OP
>> +encrypted guest. These SEV commands can be issued via KVM_MEMORY_ENCRYPT_OP
>>  ioctls.
>>  
>>  Launching
>>  ---------
>> -Boot images (such as bios) must be encrypted before guest can be booted.
>> -MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images :LAUNCH_START,
>> +Boot images (such as bios) must be encrypted before a guest can be booted. The
>> +MEMORY_ENCRYPT_OP ioctl provides commands to encrypt the images: LAUNCH_START,
>>  LAUNCH_UPDATE_DATA, LAUNCH_MEASURE and LAUNCH_FINISH. These four commands
>>  together generate a fresh memory encryption key for the VM, encrypt the boot
>> -images and provide a measurement than can be used as an attestation of the
>> +images and provide a measurement than can be used as an attestation of a
>>  successful launch.
>>  
>>  LAUNCH_START is called first to create a cryptographic launch context within
>> -the firmware. To create this context, guest owner must provides guest policy,
>> +the firmware. To create this context, guest owner must provide a guest policy,
>>  its public Diffie-Hellman key (PDH) and session parameters. These inputs
>> -should be treated as binary blob and must be passed as-is to the SEV firmware.
>> +should be treated as a binary blob and must be passed as-is to the SEV firmware.
>>  
>> -The guest policy is passed as plaintext and hypervisor may able to read it
>> +The guest policy is passed as plaintext. A hypervisor may choose to read it,
>>  but should not modify it (any modification of the policy bits will result
>>  in bad measurement). The guest policy is a 4-byte data structure containing
>> -several flags that restricts what can be done on running SEV guest.
>> +several flags that restricts what can be done on a running SEV guest.
>>  See KM Spec section 3 and 6.2 for more details.
>>  
>>  The guest policy can be provided via the 'policy' property (see below)
>> @@ -40,31 +40,30 @@ The guest policy can be provided via the 'policy' property (see below)
>>  # ${QEMU} \
>>     sev-guest,id=sev0,policy=0x1...\
>>  
>> -Guest owners provided DH certificate and session parameters will be used to
>> +The guest owner provided DH certificate and session parameters will be used to
>>  establish a cryptographic session with the guest owner to negotiate keys used
>>  for the attestation.
>>  
>> -The DH certificate and session blob can be provided via 'dh-cert-file' and
>> -'session-file' property (see below
>> +The DH certificate and session blob can be provided via the 'dh-cert-file' and
>> +'session-file' properties (see below)
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
>> -correctly by the firmware. The guest owner may wait to provide the guest
>> -confidential information until it can verify the attestation measurement.
>> -Since the guest owner knows the initial contents of the guest at boot, the
>> -attestation measurement can be verified by comparing it to what the guest owner
>> -expects.
>> +LAUNCH_MEASURE can be used to retrieve the measurement of encrypted memory.
>> +This measurement is a signature of the memory contents that can be sent to the
>> +guest owner as an attestation that the memory was encrypted correctly by the
>> +firmware. The guest owner may wait to provide the guest confidential information
>> +until it can verify the attestation measurement. Since the guest owner knows the
>> +initial contents of the guest at boot, the attestation measurement can be
>> +verified by comparing it to what the guest owner expects.
>>  
>> -LAUNCH_FINISH command finalizes the guest launch and destroy's the cryptographic
>> +LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
>>  context.
>>  
>>  See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
>> @@ -78,10 +77,10 @@ To launch a SEV guest
>>  
>>  Debugging
>>  -----------
>> -Since memory contents of SEV guest is encrypted hence hypervisor access to the
>> -guest memory will get a cipher text. If guest policy allows debugging, then
>> -hypervisor can use DEBUG_DECRYPT and DEBUG_ENCRYPT commands access the guest
>> -memory region for debug purposes.  This is not supported in QEMU yet.
>> +Since the memory contents of a SEV guest are encrypted, hypervisor access to
>> +the guest memory will return cipher text. If the guest policy allows debugging,
>> +then a hypervisor can use the DEBUG_DECRYPT and DEBUG_ENCRYPT commands to access
>> +the guest memory region for debug purposes.  This is not supported in QEMU yet.
>>  
>>  Snapshot/Restore
>>  -----------------
>>
> 


