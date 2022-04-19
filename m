Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E008507609
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 19:07:16 +0200 (CEST)
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngrJr-0002Eb-FW
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 13:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngrHh-0000jn-Cb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ngrHb-0003ux-1J
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 13:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650387894;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=jyS3S/OuVOGopfcMbZcoACsR9LqN55BST7IaWHrVFtY=;
 b=cRE5LTSsS5N5M9Qza8yRSFv3IxHk1+nhk+46j9xOqD68uFsH4itU1HFAU9/vPtYnqbbLJO
 /sy3bpLJ5xZKCHSL8PuITVhAhoXGkHrvrI6chQUFCiuJktkdRbHOJaCz5D0NHhRxx9dUec
 v4xpQeNMKmlSyjpCnR0ap0Ov0PlrlAQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-TrnO4P0iODOcW83pj5ZhzA-1; Tue, 19 Apr 2022 13:04:52 -0400
X-MC-Unique: TrnO4P0iODOcW83pj5ZhzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F79A802803;
 Tue, 19 Apr 2022 17:04:52 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.155])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1091340CF8FA;
 Tue, 19 Apr 2022 17:04:50 +0000 (UTC)
Date: Tue, 19 Apr 2022 18:04:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cole Robinson <crobinso@redhat.com>
Subject: Re: adding 'official' way to dump SEV VMSA
Message-ID: <Yl7rsJvqiUE+IbuF@redhat.com>
References: <a713533d-c4c5-2237-58d0-57b812a56ba4@redhat.com>
 <462cbf77-432a-c09c-6ec9-91556dc0f887@linux.ibm.com>
 <YlfakQfkZFOpKWeU@work-vm>
 <ac2bc657-947b-e528-791b-101447e074d8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac2bc657-947b-e528-791b-101447e074d8@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Dov Murik <dovmurik@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 09:33:21AM -0400, Cole Robinson wrote:
> On 4/14/22 4:25 AM, Dr. David Alan Gilbert wrote:
> > * Dov Murik (dovmurik@linux.ibm.com) wrote:
> >> I plan to add SEV-ES and SEV measurements calculation to this 
> >> library/program as well.
> > 
> > Everyone seems to be writing one; you, Dan etc!
> > 
> 
> Yeah, I should have mentioned Dan's demo tool here:
> https://gitlab.com/berrange/libvirt/-/blob/lgtm/tools/virt-dom-sev-vmsa-tool.py

FYI a bit of explanation of that tool...

Some complications wrt VMSA contents in no particular order

  - VMSA contents can vary across firmwares due to reset address
  - No current supportable way to extract VMSA from kernel
  - VMSA varies across userspace QEMU vs libkrun
  - VMSA varies across CPU due to include model/family/stepping

The last point in particular is a big pain, becasue it means that there
are going to be a great many valid VMSA blobs.

Thus I put some time into working on the above tool to build VMSA from
first principles. ie populating register defaults based on the AMD tech
specs for x86/sev, along with examination on what KVM/QEMU does to override
the defaults in places.

The tool does three simple things...

Create a generic VMSA for CPU 0 for QEMU:

  $ virt-dom-sev-vmsa-tool.py build --cpu 0 --userspace qemu  cpu0.bin

Update the generic VMSA with firmware and CPU details
  $ virt-dom-sev-vmsa-tool.py update \
       --firmware OVMF.amdsev.fd \
       --model 49 --family 23 --stepping 0  cpu0.bin


Note, I split this as I felt it might be interesting for a cloud provider
to publish a known "generic" VMSA, and then let it be customized per boot
depending on what CPU model/family the VM ran on, and/or what firmware
it was booted with. The 'build' command can directly set the firmware
and cpu model/family though, if all-in-one is sufficient.

Display the VMSA register info, skipping fields which are all zero

  $ virt-dom-sev-vmsa-tool.py show --zeroes skip cpu0.bin
es_attrib           : 0x0093 (10010011 00000000)
es_limit            : 0x0000ffff
cs_selector         : 0xf000
cs_attrib           : 0x009b (10011011 00000000)
cs_limit            : 0x0000ffff
cs_base             : 0x00000000ffff0000
ss_attrib           : 0x0093 (10010011 00000000)
ss_limit            : 0x0000ffff
ds_attrib           : 0x0093 (10010011 00000000)
ds_limit            : 0x0000ffff
fs_attrib           : 0x0093 (10010011 00000000)
fs_limit            : 0x0000ffff
gs_attrib           : 0x0093 (10010011 00000000)
gs_limit            : 0x0000ffff
gdtr_limit          : 0x0000ffff
ldtr_attrib         : 0x0082 (10000010 00000000)
ldtr_limit          : 0x0000ffff
idtr_limit          : 0x0000ffff
tr_attrib           : 0x008b (10001011 00000000)
tr_limit            : 0x0000ffff
efer                : 0x0000000000001000
cr4                 : 0x0000000000000040
cr0                 : 0x0000000000000010
dr7                 : 0x0000000000000400
dr6                 : 0x00000000ffff0ff0
rflags              : 0x0000000000000002
rip                 : 0x000000000000fff0
g_pat               : 0x0007040600070406
rdx                 : 0x0000000000830f10 (00010000 00001111 10000011 00000000 00000000 00000000 00000000 00000000)
xcr0                : 0x0000000000000001


The 'show' command is largely a debugging tool, so you can understand what
unexpectedly changed if you're failing to get a valid match.

If you look at the code, you can see comments on where I found the various
default values. I'm fairly confident about the QEMU source, but I am not
happy with my info sources for libkrun but then I didn't spend much time
exploring its code. Anyway, it can at least spit out a vmsa that matches
what is committed in libkrun's git repo.

I'm not in love with this particular impl of the tool. I wrote it to be
quick & easy, to prove the viability of a 'build from specs' approach
to VMSA. I find this the most satisfactory way out of all the options
we've considered so far. The need for a different VMSA per cpu
family/model/stepping in particular, makes me feel we need a tool like
this, as just publishing known good VMSA is not viable with so many
combinations possible.

> Tyler Fanelli is looking at adding that functionality to sevctl too FWIW

Yes, I think this functionality belongs in sev / sevctl, rather than
my python script, so I'm not intended to submit my python program as
an official solution for anything. It is just there as a historical
curiosity at this point, until sevctl can do the same.

> > I think I'd like to see a new ioctl to read the initial VMSA, primarily
> > as a way of debugging so you can see what VMSA you have when something
> > goes wrong.
> > 
> 
> debugfs seems simpler for the dev user (accessing a file per CPU vs code
> to call ioctl), but beyond that I don't have any insight. Is there a
> reason you think ioctl and not debugfs?

A debugfs entry could be useful for automated data collection tools.
eg sosreport could capture a debugfs file easily for a running VM,
where as using an ioctl will require special code to be written for
sosreport.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


