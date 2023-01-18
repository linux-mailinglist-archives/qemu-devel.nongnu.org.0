Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF967167C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 09:48:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI46l-0006Gx-0h; Wed, 18 Jan 2023 03:47:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <42.hyeyoo@gmail.com>)
 id 1pI46V-00069k-Kg
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:47:31 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <42.hyeyoo@gmail.com>)
 id 1pI46T-0003LX-Rd
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 03:47:31 -0500
Received: by mail-pj1-x102e.google.com with SMTP id dw9so33646278pjb.5
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 00:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jMjZMe9xHEz3Zv1t14l5Oa168UYpquHs3BG3KoMbKs0=;
 b=ZQaPrfBosIkSeNkGx32PFFjC78tAcH3MTgquzPaPadEMhlsthUQq+tO8I2oRriTGAb
 MYzvOfUsTGdCQdMTd2FhO5MfCa9vLFu+AcUZeLTXM3RLVWEWADCq4j0uoBeCz97U9noe
 3QG5USV6ifGX+80lA+T1Wh28e1Ip5ta8dfOpXKWHknMqZQaNO6dAxRGUVoafP7nNQG69
 ztEgTComJ3l5HvAux98VQwLOzIyq61i4iqWDXsACgTW4vYeAMc6ZUtVjuexGk69dVTzi
 iNPZvsXsbSR5Yq8sWKJtRQ/ld+rx9/bYMTNAg5seC4dtVf2ISzbsWwcDP07B/h+TTFIf
 HCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMjZMe9xHEz3Zv1t14l5Oa168UYpquHs3BG3KoMbKs0=;
 b=6P4EiQHztIWieABk6m2jDp9s97TevpLeiYOJ2n+HVAXbtaCeGjElUJ3wrYLfASXRkV
 CICJZGk1Gqw5+j9+fHXOzb6YY5OK2uhPpuy9vx7SfPUhlrizPhQmfJy1FoIBx3D/DDIh
 2IvBSNqlA6zJFenoD8MCLtzt7kQdSOHA7ZnSMy/bkFBxwz6aPAdv4qPh/wUZJcT5NIRk
 yH6ckOqwpclg/jmX3SKno9uzA85YLgISjp1eXmwafnaI+g7JwuuS2Bn8U6xksZOYf2GF
 T94EPtVB5PxZ0p0PwdOqVqJ30SgcInQZ4MUKlFvRNf41S59QGsv3O+wP4kSRWWTET1I1
 7U6w==
X-Gm-Message-State: AFqh2kr3TrYT1UC4L+gNWCtZ75zorzhCe0vYVoMDTOLsICgX08z3f0p+
 CL3By2HTJBZwpGcM6UXz0Vk=
X-Google-Smtp-Source: AMrXdXv0oqGU33OIrX92MtEoom8bhemmZAdcxV45GLMJE0U6LGd35fTI8c6s1FnHU501o9Ec3PQp2Q==
X-Received: by 2002:a17:903:2691:b0:192:a174:178f with SMTP id
 jf17-20020a170903269100b00192a174178fmr23969250plb.37.1674031648045; 
 Wed, 18 Jan 2023 00:47:28 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
 by smtp.gmail.com with ESMTPSA id
 ij23-20020a170902ab5700b001948ae7501asm6320460plb.298.2023.01.18.00.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 00:47:27 -0800 (PST)
Date: Wed, 18 Jan 2023 08:47:20 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: reverse-{debugging,continue} not working on v7.2.0, i386 guest
Message-ID: <Y8eyGAr3JUz0J18P@localhost>
References: <Y8eOSedPWlOjriho@localhost>
 <cf7bf2cb-b142-6658-5778-081d5b3b4c2b@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf7bf2cb-b142-6658-5778-081d5b3b4c2b@ispras.ru>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=42.hyeyoo@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 22
X-Spam_score: 2.2
X-Spam_bar: ++
X-Spam_report: (2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Wed, Jan 18, 2023 at 10:12:48AM +0300, Pavel Dovgalyuk wrote:
> As replay works well, the reverse debugging should be ok too.
> But for "going back" it needs a VM snapshot that can be used for reload.
> 
> Snapshots are saved on qcow2 images connected to QEMU.
> Therefore you need to add an empty qcow2 to your command line with the
> following option: -drive file=empty.qcow2,if=none,id=rr

Oh, I guessed it's possible to reverse-debug without snapshot,
and your comments definitely helped! adding empty disk and snapshotting solved it.

But I faced another problem:

(gdb) b __list_del_entry_valid
(gdb) reverse-continue

(it stuck forever)
^C
(gdb) info registers
eax            0xefe19f74          -270426252
ecx            0x0                 0
edx            0xefe19f74          -270426252
ebx            0xf6ff4620          -151042528
esp            0xc02e9a34          0xc02e9a34
ebp            0xc02e9a6c          0xc02e9a6c
esi            0xc4fffb20          -989856992
edi            0xefe19f70          -270426256
eip            0xc1f38400          0xc1f38400 <__list_del_entry_valid>
eflags         0x6                 [ IOPL=0 PF ]
cs             0x60                96
ss             0x68                104
ds             0x7b                123
es             0x7b                123
fs             0xd8                216
gs             0x0                 0
fs_base        0x31cb4000          835403776
gs_base        0x0                 0
k_gs_base      0x0                 0
cr0            0x80050033          [ PG AM WP NE ET MP PE ]
cr2            0xffcb1000          -3469312
cr3            0x534e000           [ PDBR=0 PCID=0 ]
cr4            0x406d0             [ PSE MCE PGE OSFXSR OSXMMEXCPT OSXSAVE ]
cr8            0x1                 1
efer           0x0                 [ ]

it stuck here and it's not 'last breakpoint hit' from the panic
(it's early in boot), and stepi, nexti, continue commands do not work and
there's no forward progress. (eip doesn't change)

Did I miss something or did something wrong?

thank you so much with your help.

--
Best regards,
Hyeonggon

> 
> And you also need to add rrsnapshot to icount for creating the snapshot at
> the start of VM execution:
> -icount shift=auto,rr=record,rrfile=$REPLAY_FILE,rrsnapshot=start
> 
> 
> On 18.01.2023 09:14, Hyeonggon Yoo wrote:
> > Hello QEMU folks.
> > I was struggling to fix a recent heisenbug in the Linux kernel,
> > and fortunately the bug was reproducible with TCG and -smp 1.
> > 
> > I'm using qemu version 7.2.0, and guest architecture is i386.
> > I tried to inspect the bug using record/replay and reverse-debugging
> > feature in the QEMU.
> > 
> > 
> > recorded with:
> > 
> > qemu-system-i386 \
> >          -icount shift=auto,rr=record,rrfile=$REPLAY_FILE \
> >          -kernel arch/x86/boot/bzImage \
> >          -cpu SandyBridge \
> >          -initrd debian-i386.cgz \
> >          -smp 1 \
> >          -m 1024 \
> >          -nographic \
> >          -net none \
> >          -append "page_owner=on console=ttyS0"
> > 
> > and replayed with:
> > 
> > qemu-system-i386 \
> >          -icount shift=auto,rr=replay,rrfile=$REPLAY_FILE \
> >          -kernel arch/x86/boot/bzImage \
> >          -cpu SandyBridge \
> >          -initrd debian-i386.cgz \
> >          -smp 1 \
> >          -m 1024 \
> >          -nographic \
> >          -net none \
> >          -s \
> >          -append "page_owner=on console=ttyS0"
> > 
> > (I'm using a initrd image instead of a disk file.)
> > 
> > The record and replay works well. The bug is reliably reproduced
> > when relaying. but when I try to reverse-continue or reverse-stepi after
> > kernel panic, the gdb only says:
> > 
> > 	"remote failure reply 'E14'"
> > 
> > Is there something I'm missing, or record/replay do not work with
> > QEMU v7.2.0 or i386?
> > 
> > --
> > Best regards,
> > Hyeonggon
> 

