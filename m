Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0721739A2D5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 16:10:08 +0200 (CEST)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loo2w-0003oQ-DQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 10:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1loo1Y-00037e-L6
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:08:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1loo1U-0004Ug-Cy
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 10:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622729314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gD7ZRXWL8pBKgnVoq6jx5eF1Wz23hAGFeudaZKt6kz0=;
 b=JQtt68e9Aq74iDv2yHOGKqxKqGdBx8iUzBeGKri5qVkUxbVnWQ0tNxHqdT4MUDBw1pLNr5
 nJzl2cW4gD0IYv2Xy47gRVzlmeEkdTFcnSfatk3r0+Nbecp77b2JMxnLwIiM0b57hWjJ5O
 yM2onqJq7imovdSkvGRTo5jVDovmzF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-mPXnoI-WO3mapXtuwxiSkw-1; Thu, 03 Jun 2021 10:08:30 -0400
X-MC-Unique: mPXnoI-WO3mapXtuwxiSkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E3B19251B4;
 Thu,  3 Jun 2021 14:08:28 +0000 (UTC)
Received: from work-vm (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3984E2AABE;
 Thu,  3 Jun 2021 14:08:27 +0000 (UTC)
Date: Thu, 3 Jun 2021 15:08:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: The latest Qemu release can't bootup VM with latest guest kernel.
Message-ID: <YLjiWKV3fuJc7WYu@work-vm>
References: <20210520080652.GA16421@yangzhon-Virtual>
 <CAA2ifQy_R3q70D6-E1MmnLLMPsJY5_DwJxopePQJQuMSv6xRxQ@mail.gmail.com>
 <20210524052947.GA7519@yangzhon-Virtual>
MIME-Version: 1.0
In-Reply-To: <20210524052947.GA7519@yangzhon-Virtual>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
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
Cc: Gal Hammer <ghammer@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yang Zhong (yang.zhong@intel.com) wrote:
> On Sun, May 23, 2021 at 03:23:30PM +0300, Gal Hammer wrote:
> > Hi Yang,
> > 
> > On Thu, 20 May 2021 at 11:27, Yang Zhong <yang.zhong@intel.com> wrote:
> > 
> > > Hello all,
> > >
> > > I found the latest Qemu release can't bootup the VM with latest guest
> > > kernel(>5.13).
> > >
> > > The normal v6.0.0 release is good to bootup the latest guest kernel.
> > >
> > > There are two issues were found
> > > 1. Guest kernel panic.
> > > 2. kvm disabled by bios
> > >
> > > The panic log as below:
> > > [    2.250024] BUG: unable to handle page fault for address:
> > > ffffffffac06c55f
> > > [    2.252226] #PF: supervisor write access in kernel mode
> > > [    2.253892] #PF: error_code(0x0003) - permissions violation
> > > [    2.255671] PGD 5940e067 P4D 5940f067 PUD 59410063 PMD 580001e1
> > > [    2.257567] Oops: 0003 [#1] SMP NOPTI
> > > [    2.258738] CPU: 2 PID: 313 Comm: systemd-udevd Not tainted 5.13.0-rc1+
> > > #1
> > > [    2.260899] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
> > > 0.0.0 02/06/2015
> > > [    2.263375] RIP: 0010:__send_ipi_mask+0x1bf/0x240
> > > [    2.264855] Code: c0 48 c7 44 24 18 00 00 00 00 e9 48 ff ff ff 48 89 d0
> > > 4c 09 c8 74 1b 49 63 d7 48 63 74 24 0c b8 0a 00 00 00 4c 89 cb 4c 89 d1
> > > <0f> 01 d9 48 85 c0 78 4a 48 f7 04 24 00 02 00 00 0f 84 80 fe ff ff
> > > [    2.270643] RSP: 0018:ff591a62c0193ab0 EFLAGS: 00010006
> > > [    2.272277] RAX: 000000000000000a RBX: 0000000000000009 RCX:
> > > 0000000000000000
> > > [    2.274482] RDX: 0000000000000000 RSI: 00000000000000fc RDI:
> > > ff13a83dc003c830
> > > [    2.276663] RBP: ff591a62c0193b08 R08: 0000000000000004 R09:
> > > 0000000000000009
> > > [    2.278866] R10: 0000000000000000 R11: 0000000000000000 R12:
> > > 0000000000000000
> > > [    2.281065] R13: ff13a83dc003c830 R14: 0000000000011580 R15:
> > > 0000000000000000
> > > [    2.283272] FS:  00007f23ebd07940(0000) GS:ff13a83e3bd00000(0000)
> > > knlGS:0000000000000000
> > > [    2.285794] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [    2.287574] CR2: ffffffffac06c55f CR3: 0000000106ce2003 CR4:
> > > 0000000000771ee0
> > > [    2.289757] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> > > 0000000000000000
> > > [    2.291972] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
> > > 0000000000000400
> > > [    2.294177] PKRU: 55555554
> > > [    2.295043] Call Trace:
> > > [    2.295820]  kvm_smp_send_call_func_ipi+0xe/0x60
> > > [    2.297220]  smp_call_function_many_cond+0x25d/0x2a0
> > > [    2.298772]  ? flush_tlb_one_kernel+0x20/0x20
> > > [    2.300145]  on_each_cpu_cond_mask+0x1e/0x20
> > > [    2.301514]  flush_tlb_kernel_range+0x8d/0x90
> > > [    2.302799]  __purge_vmap_area_lazy+0xc1/0x6a0
> > > [    2.304097]  ? cpumask_next+0x1f/0x20
> > > [    2.305160]  ? purge_fragmented_blocks_allcpus+0x3d/0x210
> > > [    2.306686]  _vm_unmap_aliases+0xf1/0x120
> > > [    2.307861]  change_page_attr_set_clr+0x95/0x280
> > > [    2.309203]  set_memory_ro+0x26/0x30
> > > [    2.310259]  ? 0xffffffffc00f7000
> > > [    2.311214]  module_enable_ro.part.58+0x62/0xc0
> > > [    2.312417]  do_init_module+0x17a/0x230
> > > [    2.313460]  load_module+0x1a30/0x1b00
> > > [    2.314463]  ? __do_sys_finit_module+0xad/0x110
> > > [    2.315702]  __do_sys_finit_module+0xad/0x110
> > > [    2.316890]  do_syscall_64+0x39/0x80
> > > [    2.317868]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > > [    2.319226] RIP: 0033:0x7f23ea8f32bd
> > >
> > >
> > > I also used the bisect to get the bad commit id:
> > > f5cc5a5c168674f84bf061cdb307c2d25fba5448
> > >
> > > This issue is known issue? or some fixs are ready to fix those issues?
> > > thanks!
> > >
> > 
> > What's your qemu command line?
> > 
> > I'm also having a kernel crash (although I think mine is with a different
> > call stack) when using "-cpu host". The crash doesn't occur when I use
> > "kvm64" cpu type.
> >
> 
>   Hello Gal,
> 
>   Let me list my host and guest environment
>   Host: Icelake, Linux5.13.0-rc1+
>   Guest: Linux5.13.0-rc1+
> 
>   The Qemu command line:
>   ./qemu-system-x86_64 \
>      -machine q35 \
>      -accel kvm \
>      -m 4096 \
>      -smp 4 \
>      -cpu host \
>      -bios /home/vmm/project/images/OVMF-upstream.fd \
>      -drive format=raw,file=/root/project/images/SGX_rhel8_efi.img,index=0,media=disk \
>      -netdev user,id=guest0,hostfwd=tcp::10022-:22 \
>      -device virtio-net-pci,netdev=guest0 \
>      -qmp tcp:127.0.0.1:12345,server,nowait \
>      -monitor telnet:127.0.0.1:55555,server,nowait \
>      -nographic -nodefaults -serial stdio
> 
>   I also tried the 'cpu kvm64' in my side, and there is not any issue.

This is the same one as the one I was chatting to Claudio Fontana about
in the thread 'Windows fails to boot after rebase to QEMU master',
it's the commit 'i386: split cpu accelerators from cpu.c, using
AccelCPUClass'

Dave

>   Regards,
> 
>   Yang
>  
> >     Gal.
> > 
> > 
> > >
> > > Regards,
> > >
> > > Yang
> > >
> > >
> > >
> > >
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


