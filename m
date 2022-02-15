Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525AB4B68EE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:13:04 +0100 (CET)
Received: from localhost ([::1]:38838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJupT-0006Hd-Cx
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:13:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJuKG-0002WL-9G
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:40:48 -0500
Received: from [2a00:1450:4864:20::630] (port=35533
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJuKC-0001To-LJ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:40:47 -0500
Received: by mail-ej1-x630.google.com with SMTP id qk11so22553121ejb.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fcKX5JiYkL0y3sajLPsOwLRa4YrrB4rv+uG7kq7l/dY=;
 b=YtDRA9htPkd9FyR3oYRPwC2uCzBEu96n6SicHMlgFd9WDQYDAiYAgMo94oLp9zazpM
 EGQFzR12+hLUXXiHPe9CdlolawGS5NXUvpQlUcYv8O2uF9eQ0Qgy9Pxc6784HYPOY/fd
 B+NjvDXbdYAqhbW34FmmZOOn3wHl4Y4eSoCjZL/cNV8oA/qypUPV3cjTCRRO5Tenc7GI
 YXjF4rx4IrJjduCh8hI6YqfJnbIJk4E1BjyOBQz10mFXeat8wYY9qcLBetK+xt8WNmkh
 g67qmjg3jjserNtfwsF4wW5fhRt6dAg9LocLKE07d9NGRRat5+wrzWyi0D6BRLJuNlTf
 eCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fcKX5JiYkL0y3sajLPsOwLRa4YrrB4rv+uG7kq7l/dY=;
 b=Z0kmOLy8NiVmb/p6YZqGUNmE1knmoyRGl260cdnBOgN3glpiDtzHY0GeBwwDsvby7b
 zoI9WnkzPGxNJffTaYg0SLrCokJBZpuDFdsoZG3U8lWVpVkc43KgKJvsX93wTeV+IjaT
 nLInvlX8mGv7xNpqH8nX41jpRo2nUQvkw3rYH2cnqhtgkH8XY2nG8i6N6K7neVTS8Y93
 sfl04GWzDCGljSYjGiDu4B2wOB/XKr+RTjXGQZo35IL2MjF6QQ3kLqDvi8QykC7dZtnL
 U2odJReU7O7A9dXTyPwC5fqB10vFRpOn2t5PYWt45g2cHYqxDZpGGYJlb5hfWC9Fr7z5
 w8kg==
X-Gm-Message-State: AOAM5338gQ9xl08YHjLoNMzeNqTZCph/881td+g4a81IXMb0sYSQHqpq
 3HH5/HUZq0Sc1y5h/8l0fBE5WfTEKlr8cFTW73KJLA==
X-Google-Smtp-Source: ABdhPJy2mhOrIHhEXeOC/0i5eMalpj7K3MgPXWWwxspGH/Yc4k5+poHEM0SyxBr9yJSQmZmfzf7OfUUVuFtAtr4EQPU=
X-Received: by 2002:a17:906:7314:: with SMTP id
 di20mr2305430ejc.259.1644918042677; 
 Tue, 15 Feb 2022 01:40:42 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
 <b06ab7b0-61f2-5301-70f9-197dfd9527e9@redhat.com>
 <CAARzgwwDFybUsCj8Ym6kpcjNRCVV6vbsY7Lks0wsmrc2+ET03Q@mail.gmail.com>
 <492bd3a4-4a26-afc9-1268-74a9fd7f095a@redhat.com>
In-Reply-To: <492bd3a4-4a26-afc9-1268-74a9fd7f095a@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 15 Feb 2022 15:10:31 +0530
Message-ID: <CAARzgwzd-p-GLOQ-VtBC2_-fd1=fg2rZU7t9XhVA1QSUe1vT0A@mail.gmail.com>
Subject: Re: 9 TiB vm memory creation
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x630.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 2:08 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 15.02.22 09:12, Ani Sinha wrote:
> > On Tue, Feb 15, 2022 at 1:25 PM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 15.02.22 08:00, Ani Sinha wrote:
> >>>
> >>>
> >>> On Mon, 14 Feb 2022, David Hildenbrand wrote:
> >>>
> >>>> On 14.02.22 13:36, Igor Mammedov wrote:
> >>>>> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
> >>>>> Ani Sinha <ani@anisinha.ca> wrote:
> >>>>>
> >>>>>> Hi Igor:
> >>>>>>
> >>>>>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
> >>>>>> system with the following commandline before either the system
> >>>>>> destabilized or the OOM killed killed qemu
> >>>>>>
> >>>>>> -m 2T,maxmem=9T,slots=1 \
> >>>>>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
> >>>>>> -machine memory-backend=mem0 \
> >>>>>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
> >>>>>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
> >>>>>>
> >>>>>> I have attached the debugcon output from 2 TiB vm.
> >>>>>> Is there any other commandline parameters or options I should try?
> >>>>>>
> >>>>>> thanks
> >>>>>> ani
> >>>>>
> >>>>> $ truncate -s 9T 9tb_sparse_disk.img
> >>>>> $ qemu-system-x86_64 -m 9T \
> >>>>>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
> >>>>>   -machine memory-backend=mem0
> >>>>>
> >>>>> works for me till GRUB menu, with sufficient guest kernel
> >>>>> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
> >>>>> guest on it and inspect SMBIOS tables comfortably.
> >>>>>
> >>>>>
> >>>>> With KVM enabled it bails out with:
> >>>>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
> >>>>>
> >>>
> >>> I have seen this in my system but not always. Maybe I should have dug
> >>> deeper as to why i do see this all the time.
> >>>
> >>>>> all of that on a host with 32G of RAM/no swap.
> >>>>>
> >>>
> >>> My system in 16 Gib of main memory, no swap.
> >>>
> >>>>
> >>>> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
> >>>>
> >>>> ~8 TiB (7,999999)
> >>>
> >>> That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
> >>> than 2 Gib * 4K (assuming 4K size pages).
> >>
> >> "pages" don't carry the unit "GiB/TiB", so I was talking about the
> >> actual size with 4k pages (your setup, I assume)
> >
> > yes I got that after reading your email again.
> > The interesting question now is how is redhat QE running 9 TiB vm with kvm?
>
> As already indicated by me regarding s390x only having single large NUMA
> nodes, x86 is usually using multiple NUMA nodes with such large memory.
> And QE seems to be using virtual numa nodes:
>
> Each of the 32 virtual numa nodes receive a:
>
>   -object memory-backend-ram,id=ram-node20,size=309237645312,host-
>    nodes=0-31,policy=bind
>
> which results in a dedicated KVM memslot (just like each DIMM would)
>
>
> 32 * 309237645312 == 9 TiB :)

ah, I should have looked closely at the other commandlines before
shooting off the email. Yes the limitation is per mem-slot and they
have 32 slots one per node.
ok so should we do
kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
from i386 kvm_arch_init()?

