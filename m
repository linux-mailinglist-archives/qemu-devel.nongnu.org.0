Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B08B57E81F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 22:12:34 +0200 (CEST)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEz0j-0006Ov-NU
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 16:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oEyym-0002Eb-HW
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:10:32 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oEyyk-0000ug-Ar
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 16:10:32 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C18134E63;
 Fri, 22 Jul 2022 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658520627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0x8/ylRv1p9lv9T2xBFdAE234Y5bhuGkyM8Qbgc+ZoE=;
 b=UZ+dv8EmNZDRTXUlwgUnEXiamS89fIhJlN/5xQOr7P8d0XX798CRvxY6ELgu1tzx8jtBK2
 u4RG50P5FYcf7RAK3o6XC3ZYAJO75orx7h1P3XNY6VJDeK9M2D20zl0RahOmNnIdk0dPns
 GJaU5jg+E7EFxxOn1CJd88Zsol2xNtI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658520627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0x8/ylRv1p9lv9T2xBFdAE234Y5bhuGkyM8Qbgc+ZoE=;
 b=jsls95wr8roIAT1mFGZaE6TDr4HTQ/h2oBWisUFbRXV9VMxeei/3jTQ+nBINJnSSmnlPt4
 jefF3++Of2TgmKCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3217013AB3;
 Fri, 22 Jul 2022 20:10:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EmxqCjME22JobgAAMHmgww
 (envelope-from <cfontana@suse.de>); Fri, 22 Jul 2022 20:10:27 +0000
Message-ID: <3d9fc1a9-da25-bb34-a961-27b860c90d44@suse.de>
Date: Fri, 22 Jul 2022 22:10:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC 0/3] add snapshot/restore fuzzing device
Content-Language: en-US
To: Richard Liu <richy.liu.2002@gmail.com>, qemu-devel@nongnu.org
Cc: alxndr@bu.edu, bsd@redhat.com, darren.kenny@oracle.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, nborisov@suse.com,
 Het Gala <het.gala@nutanix.com>
References: <20220722192041.93006-1-richy.liu.2002@gmail.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20220722192041.93006-1-richy.liu.2002@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 7/22/22 21:20, Richard Liu wrote:
> This RFC adds a virtual device for snapshot/restores within QEMU. I am working
> on this as a part of QEMU Google Summer of Code 2022. Fast snapshot/restores
> within QEMU is helpful for code fuzzing.
> 
> I reused the migration code for saving and restoring virtual device and CPU
> state. As for the RAM, I am using a simple COW mmaped file to do restores.
> 
> The loadvm migration function I used for doing restores only worked after I
> called it from a qemu_bh. I'm not sure if I should run the migration code in a
> separate thread (see patch 3), since currently it is running as a part of the
> device code in the vCPU thread.
> 
> This is a rough first revision and feedback on the cpu and device state restores
> is appreciated.

As I understand it, usually the save and restore of VM state in QEMU can best be
managed by libvirt APIs, and for example using the libvirt command line tool virsh:

$ virsh save (or managedsave)

$ virsh restore (or start)

These commands start a QEMU migration using the QMP protocol to a file descriptor,
previously opened by libvirt to contain the state file.

(getfd QMP command):
https://qemu-project.gitlab.io/qemu/interop/qemu-qmp-ref.html#qapidoc-2811

(migrate QMP command):
https://qemu-project.gitlab.io/qemu/interop/qemu-qmp-ref.html#qapidoc-1947

This is unfortunately currently very slow.

Maybe you could help thinking out or with the implementation of the solution?
I tried to push this approach that only involves libvirt, using the existing QEMU multifd migration to a socket:

https://listman.redhat.com/archives/libvir-list/2022-June/232252.html

performance is very good compared with what is possible today, but it won't be upstreamable because it is not deemed optimal, and libvirt wants the code to be in QEMU.

What about helping in thinking out how the QEMU-based solution could look like?

The requirements for now in my view seem to be:

* avoiding the kernel file page trashing for large transfers
  which currently requires in my view changing QEMU to be able to migrate a stream to an fd that is open with O_DIRECT.
  In practice this means somehow making all QEMU migration stream writes block-friendly (adding some buffering?).

* allow concurrent parallel transfers
  to be able to use extra cpu resources to speed up the transfer if such resources are available.

* we should be able to transfer multiple GB/s with modern nvmes for super fast VM state save and restore (few seconds even for a 30GB VM),
  and we should do no worse than the prototype fully implemented in libvirt, otherwise it would not make sense to implement it in QEMU.

What do you think?

Ciao,

Claudio

> 
> To test locally, boot up any linux distro. I used the following C file to
> interact with the PCI snapshot device:
> 
>     #include <stdio.h>
>     #include <stdint.h>
>     #include <fcntl.h>
>     #include <sys/mman.h>
>     #include <unistd.h>
> 
>     int main() {
>         int fd = open("/sys/bus/pci/devices/0000:00:04.0/resource0", O_RDWR | O_SYNC);
>         size_t size = 1024 * 1024;
>         uint32_t* memory = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> 
>         printf("%x\n", memory[0]);
> 
>         int a = 0;
>         memory[0] = 0x101; // save snapshot
>         printf("before: value of a = %d\n", a);
>         a = 1;
>         printf("middle: value of a = %d\n", a);
>         memory[0] = 0x102; // load snapshot
>         printf("after: value of a = %d\n", a);
> 
>         return 0;
>     }
> 
> Richard Liu (3):
>   create skeleton snapshot device and add docs
>   implement ram save/restore
>   use migration code for cpu and device save/restore
> 
>  docs/devel/snapshot.rst |  26 +++++++
>  hw/i386/Kconfig         |   1 +
>  hw/misc/Kconfig         |   3 +
>  hw/misc/meson.build     |   1 +
>  hw/misc/snapshot.c      | 164 ++++++++++++++++++++++++++++++++++++++++
>  migration/savevm.c      |  84 ++++++++++++++++++++
>  migration/savevm.h      |   3 +
>  7 files changed, 282 insertions(+)
>  create mode 100644 docs/devel/snapshot.rst
>  create mode 100644 hw/misc/snapshot.c
> 


