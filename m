Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3CE67307C
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 05:42:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIMiz-0006dD-QV; Wed, 18 Jan 2023 23:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <42.hyeyoo@gmail.com>)
 id 1pIMix-0006cf-8T
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 23:40:27 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <42.hyeyoo@gmail.com>)
 id 1pIMiu-0004ah-R0
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 23:40:26 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 gz9-20020a17090b0ec900b002290bda1b07so3240413pjb.1
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 20:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pXPtKKVJt/0d3mnRsa7QMJmQ9tYwOnHYxu29pVXHnfE=;
 b=kLrpEXbJ2sPk6rJ3+czhnXTlD40GlpkZ4dgrPL+hYXcldRxXZcG9J5NKKThJoDIEGU
 XHa+2Zq8ZsZeoKLC2H4KGtgoGKWKBwDcQjoE13lXqBJrNlIy3xBNO09ug6ecdBlB25Vc
 tlBjSSpbjF4GK6jiiSx9oRAg+esI5zrbgjXruwjzTMngAaT+9HAdMQJo3+48TKhf45EW
 8rn570iVUsbQz1G2HvHovWtdg+8ZOsVLRLPE6gBOzIVdguHnEmY1NFM9FCLq6PMDwZb9
 E0qbaHeeRpRqufBSoLCO2edZxYR9biuMTDgvbfIt9AdDytUdW/ZAtNOYQTlcl4s/RCB4
 RvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXPtKKVJt/0d3mnRsa7QMJmQ9tYwOnHYxu29pVXHnfE=;
 b=SlSSjFNYmw6MckwFbW+jKzS+gpA7YbE0shh5wEF2i3/kJKXa7JYnwdJ79e07QnC+hG
 LeQmQAPY+6TuYfCNPoD+xnYF/YKjD3qpsgTVC6H+3PMNJ/P9WJh9OLSpz5OWPK0+AQLx
 ZPaBNgl5tcpoSI//iTrkvHcZC5Mq9RI9rwAnb/6FuJ2BQvzbxDeFS8EY0eimln9TKG9d
 Ivpa18+Ew+TE1UB8ANLNWZqSSkMskRhBC9BaIuIIoW1tgFNY+UJQGQoLtLREOEOV7E+w
 Ae4jYO/mosde1FeJZgy/Z/2ftNh6avRR3dN95kb+0GnBJlpWsV63lMWNWTZ869PPx8rT
 g22w==
X-Gm-Message-State: AFqh2kqednuu777zUC0Qpnu2xZy0SKLgSxih8YP4qrORU3u34HrSGQRV
 HqMEsu16p8BEE8WNAfYZ6/k=
X-Google-Smtp-Source: AMrXdXvMwfp8zl3LVsLcM+y5Q19f099cBjwkyblakoIrTxU1G2S99TRA0TSmCn+WfF4hEA1dqz/6nQ==
X-Received: by 2002:a17:90a:c213:b0:223:2865:73aa with SMTP id
 e19-20020a17090ac21300b00223286573aamr9513618pjt.2.1674103222835; 
 Wed, 18 Jan 2023 20:40:22 -0800 (PST)
Received: from hyeyoo ([114.29.91.56]) by smtp.gmail.com with ESMTPSA id
 bg22-20020a17090b0d9600b00219463262desm2129127pjb.39.2023.01.18.20.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 20:40:22 -0800 (PST)
Date: Thu, 19 Jan 2023 13:40:13 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: reverse-{debugging,continue} not working on v7.2.0, i386 guest
Message-ID: <Y8jJrYfA7kC/4jYk@hyeyoo>
References: <Y8eOSedPWlOjriho@localhost>
 <cf7bf2cb-b142-6658-5778-081d5b3b4c2b@ispras.ru>
 <Y8eyGAr3JUz0J18P@localhost>
 <07fb4654-d019-9279-c386-7694330e5a42@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07fb4654-d019-9279-c386-7694330e5a42@ispras.ru>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=42.hyeyoo@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Jan 18, 2023 at 12:39:16PM +0300, Pavel Dovgalyuk wrote:
> Sometimes replay (or reverse debugging) have problems due to incomplete or
> incorrect virtual device save/load implementation.
> 
> Can you try removing -cpu from your command line?
> 
> Or you can provide the files you load and I'll debug this case.

Ah, sorry to bother. I installed breakpoint _after_ kernel panic,
and installing breakpoint before boot worked fine. Every seems great!

Just a side question, is there a reason QEMU record/replay
does not support -smp N (> 1)? is this feature planed, or should I use
other tools to debug SMP bugs?

> On 18.01.2023 11:47, Hyeonggon Yoo wrote:
> > On Wed, Jan 18, 2023 at 10:12:48AM +0300, Pavel Dovgalyuk wrote:
> > > As replay works well, the reverse debugging should be ok too.
> > > But for "going back" it needs a VM snapshot that can be used for reload.
> > > 
> > > Snapshots are saved on qcow2 images connected to QEMU.
> > > Therefore you need to add an empty qcow2 to your command line with the
> > > following option: -drive file=empty.qcow2,if=none,id=rr
> > 
> > Oh, I guessed it's possible to reverse-debug without snapshot,
> > and your comments definitely helped! adding empty disk and snapshotting solved it.
> > 
> > But I faced another problem:
> > 
> > (gdb) b __list_del_entry_valid
> > (gdb) reverse-continue
> > 
> > (it stuck forever)
> > ^C
> > (gdb) info registers
> > eax            0xefe19f74          -270426252
> > ecx            0x0                 0
> > edx            0xefe19f74          -270426252
> > ebx            0xf6ff4620          -151042528
> > esp            0xc02e9a34          0xc02e9a34
> > ebp            0xc02e9a6c          0xc02e9a6c
> > esi            0xc4fffb20          -989856992
> > edi            0xefe19f70          -270426256
> > eip            0xc1f38400          0xc1f38400 <__list_del_entry_valid>
> > eflags         0x6                 [ IOPL=0 PF ]
> > cs             0x60                96
> > ss             0x68                104
> > ds             0x7b                123
> > es             0x7b                123
> > fs             0xd8                216
> > gs             0x0                 0
> > fs_base        0x31cb4000          835403776
> > gs_base        0x0                 0
> > k_gs_base      0x0                 0
> > cr0            0x80050033          [ PG AM WP NE ET MP PE ]
> > cr2            0xffcb1000          -3469312
> > cr3            0x534e000           [ PDBR=0 PCID=0 ]
> > cr4            0x406d0             [ PSE MCE PGE OSFXSR OSXMMEXCPT OSXSAVE ]
> > cr8            0x1                 1
> > efer           0x0                 [ ]
> > 
> > it stuck here and it's not 'last breakpoint hit' from the panic
> > (it's early in boot), and stepi, nexti, continue commands do not work and
> > there's no forward progress. (eip doesn't change)
> > 
> > Did I miss something or did something wrong?
> > 
> > thank you so much with your help.
> > 
> > --
> > Best regards,
> > Hyeonggon
> > 
> > > 
> > > And you also need to add rrsnapshot to icount for creating the snapshot at
> > > the start of VM execution:
> > > -icount shift=auto,rr=record,rrfile=$REPLAY_FILE,rrsnapshot=start
> > > 
> > > 
> > > On 18.01.2023 09:14, Hyeonggon Yoo wrote:
> > > > Hello QEMU folks.
> > > > I was struggling to fix a recent heisenbug in the Linux kernel,
> > > > and fortunately the bug was reproducible with TCG and -smp 1.
> > > > 
> > > > I'm using qemu version 7.2.0, and guest architecture is i386.
> > > > I tried to inspect the bug using record/replay and reverse-debugging
> > > > feature in the QEMU.
> > > > 
> > > > 
> > > > recorded with:
> > > > 
> > > > qemu-system-i386 \
> > > >           -icount shift=auto,rr=record,rrfile=$REPLAY_FILE \
> > > >           -kernel arch/x86/boot/bzImage \
> > > >           -cpu SandyBridge \
> > > >           -initrd debian-i386.cgz \
> > > >           -smp 1 \
> > > >           -m 1024 \
> > > >           -nographic \
> > > >           -net none \
> > > >           -append "page_owner=on console=ttyS0"
> > > > 
> > > > and replayed with:
> > > > 
> > > > qemu-system-i386 \
> > > >           -icount shift=auto,rr=replay,rrfile=$REPLAY_FILE \
> > > >           -kernel arch/x86/boot/bzImage \
> > > >           -cpu SandyBridge \
> > > >           -initrd debian-i386.cgz \
> > > >           -smp 1 \
> > > >           -m 1024 \
> > > >           -nographic \
> > > >           -net none \
> > > >           -s \
> > > >           -append "page_owner=on console=ttyS0"
> > > > 
> > > > (I'm using a initrd image instead of a disk file.)
> > > > 
> > > > The record and replay works well. The bug is reliably reproduced
> > > > when relaying. but when I try to reverse-continue or reverse-stepi after
> > > > kernel panic, the gdb only says:
> > > > 
> > > > 	"remote failure reply 'E14'"
> > > > 
> > > > Is there something I'm missing, or record/replay do not work with
> > > > QEMU v7.2.0 or i386?
> > > > 
> > > > --
> > > > Best regards,
> > > > Hyeonggon
> > > 
> 

-- 
Thanks,
Hyeonggon

