Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA8506D89
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 15:34:31 +0200 (CEST)
Received: from localhost ([::1]:36202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngnzy-00050t-4k
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 09:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1ngnz1-0004IG-7L
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 09:33:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1ngnyx-0002uG-VV
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 09:33:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650375205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Q1ZKb2vhm6xzFB6dH4S0BphbsICw4w11AsX7JXEyf0=;
 b=F/qpDkwWYl95Jj79cY3FrZ6G/vy75MaDSsnEcKM0J18vqIx6GbCAxAdOap9gP332gLIbXC
 RiTbWOeosVBwBcBXJqSMNdXYpmmmb8CElG46k/hqxdKjINqkE3V2U33F6t9qkkviJX2wos
 urC+bBMcmzG1HwPqjbyo8PVj58yL3tU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-ZMIdkErAO2yUJ32DJEJPxQ-1; Tue, 19 Apr 2022 09:33:22 -0400
X-MC-Unique: ZMIdkErAO2yUJ32DJEJPxQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8A683804500;
 Tue, 19 Apr 2022 13:33:21 +0000 (UTC)
Received: from [10.22.8.117] (unknown [10.22.8.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75D777C28;
 Tue, 19 Apr 2022 13:33:21 +0000 (UTC)
Message-ID: <ac2bc657-947b-e528-791b-101447e074d8@redhat.com>
Date: Tue, 19 Apr 2022 09:33:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: adding 'official' way to dump SEV VMSA
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>
References: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
 <462cbf77-432a-c09c-6ec9-91556dc0f887@linux.ibm.com>
 <YlfakQfkZFOpKWeU@work-vm>
From: Cole Robinson <crobinso@redhat.com>
In-Reply-To: <YlfakQfkZFOpKWeU@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Singh, Brijesh" <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/22 4:25 AM, Dr. David Alan Gilbert wrote:
> * Dov Murik (dovmurik@linux.ibm.com) wrote:
>> Hi Cole,
>>
>> On 13/04/2022 16:36, Cole Robinson wrote:
>>> Hi all,
>>>
>>> SEV-ES and SEV-SNP attestation require a copy of the initial VMSA to
>>> validate the launch measurement. For developers dipping their toe into
>>> SEV-* work, the easiest way to get sample VMSA data for their machine is
>>> to grab it from a running VM.
>>>
>>> There's two techniques I've seen for that: patch some printing into
>>> kernel __sev_launch_update_vmsa, or use systemtap like danpb's script
>>> here: https://gitlab.com/berrange/libvirt/-/blob/lgtm/scripts/sev-vmsa.stp
>>>
>>> Seems like this could be friendlier though. I'd like to work on this if
>>> others agree.
>>>
>>> Some ideas I've seen mentioned in passing:
>>>
>>> - debugfs entry in /sys/kernel/debug/kvm/.../vcpuX/
>>> - new KVM ioctl
>>> - something with tracepoints
>>> - some kind of dump in dmesg that doesn't require a patch
>>>
>>> Thoughts?
>>
>>
>> Brijesh suggested to me to construct the VMSA without getting any info from
>> the host (except number of vcpus), because the initial state of the vcpus
>> is standard and known if you use QEMU and OVMF (but that's open for discussion).
>>
>> I took his approach (thanks Brijesh!) and now it's how we calculate expected
>> SNP measurements in sev-snp-measure [1].  The relevant part for VMSA construction
>> is in [2].
>>
>> I plan to add SEV-ES and SEV measurements calculation to this 
>> library/program as well.
> 
> Everyone seems to be writing one; you, Dan etc!
> 

Yeah, I should have mentioned Dan's demo tool here:
https://gitlab.com/berrange/libvirt/-/blob/lgtm/tools/virt-dom-sev-vmsa-tool.py

Tyler Fanelli is looking at adding that functionality to sevctl too FWIW

> I think I agree the right way is to build it programmatically rather
> than taking a copy from the kernel;  it's fairly simple, although the
> scripts get increasingly hairy as you deal with more and more VMM's and
> firmwares.
> 

Agreed. A nice way to dump VMSA from the kernel will be useful for
debugging, or extending these scripts to support different VMMs.

> I think I'd like to see a new ioctl to read the initial VMSA, primarily
> as a way of debugging so you can see what VMSA you have when something
> goes wrong.
> 

debugfs seems simpler for the dev user (accessing a file per CPU vs code
to call ioctl), but beyond that I don't have any insight. Is there a
reason you think ioctl and not debugfs?

Thanks,
Cole


