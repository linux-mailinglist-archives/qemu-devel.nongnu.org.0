Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8724B63E7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 08:03:14 +0100 (CET)
Received: from localhost ([::1]:49294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJrrl-0002NX-8Y
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 02:03:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJrph-0001Bx-Bq
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:01:05 -0500
Received: from [2607:f8b0:4864:20::102d] (port=34327
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJrpW-0001yg-I4
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 02:01:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 ki18-20020a17090ae91200b001b8be87e9abso1238342pjb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 23:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=wR/AymFXmHWE4zZt/aKLlpncjnna+b5zPTBk5OrmzWY=;
 b=aZoB/H2sO0PES4QFxe4NtpwvzBx6o08CSanY5I3YXHpz4Cb6/FPRzDCLo62A/fKBbv
 7xPcVmDgy7JCMnxlzLgeOzxnfK2VeqoyPDX40EEs5tRFOhTtuXmVDlhPQiCrECBF3PRV
 mhnjNOoxXV8R1A9yIm+V+xCNA6TKdAGQJ/6VdVh5N+EQ/mYv6m49y4ZY9ZYOzaxNoFJz
 E6NPEUxnBQuCJ/bQyQkvFKW01KmJui8Yy8ftTPdK2PfAc2oEpBL8Bx6mGJWAAoViHZCB
 jkt8opke6K5o6R994ZwOh78IXiD92bP4m8xVZnVE5BX0pOF9oqzIYkz64FHuE19JlZ2y
 1jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=wR/AymFXmHWE4zZt/aKLlpncjnna+b5zPTBk5OrmzWY=;
 b=i6TcV/naaqgDdpHqs2v+qQFHnii8KPt60aTEokEVpl6COwYlXegZCruNb1C/LIjwTB
 J7hMHRHHYUV0xs5DW0wEb1uuJI7cIl8FPjX9GaT2ZPD72xBafvQJHi4b2tSuuZdNOZIh
 XBq9JOnFR4MuKXlBArDtEbfQie3hPyxxF6wA5dQIDrPgDWtThseDATlmAW/yf61ydX5c
 ixGtSXlxJfYmTajhxtSkOULLwvJCO/mU49H6ZxxFVr2N0ap5OfZ5vJXuZCe18E30N0ho
 LDJ8R+0CLdlpguw4UB02DG2hddyPJmtVwN5VpPnBalPfcgcw/TbwjR2RMwXOQ+GpE347
 8g9Q==
X-Gm-Message-State: AOAM533adxbcW/tAuhX8fP5shY269admVjXa7OrNi/M79Yj/3WBGGhYc
 nOpY10cgr0lg0aWSMe6AfuF0LQ==
X-Google-Smtp-Source: ABdhPJxbX3vgU1fXv9gxehIQWgMWBrri7hQuwkgnGA8gc7L5NrOPjn71dqArSSYPDzUsvpDaafSA9A==
X-Received: by 2002:a17:902:ce84:: with SMTP id
 f4mr2611761plg.66.1644908436794; 
 Mon, 14 Feb 2022 23:00:36 -0800 (PST)
Received: from anisinha-lenovo ([115.96.197.51])
 by smtp.googlemail.com with ESMTPSA id 17sm38674312pfl.175.2022.02.14.23.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 23:00:36 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 15 Feb 2022 12:30:31 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: David Hildenbrand <david@redhat.com>
Subject: Re: 9 TiB vm memory creation
In-Reply-To: <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102d.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 14 Feb 2022, David Hildenbrand wrote:

> On 14.02.22 13:36, Igor Mammedov wrote:
> > On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
> > Ani Sinha <ani@anisinha.ca> wrote:
> >
> >> Hi Igor:
> >>
> >> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
> >> system with the following commandline before either the system
> >> destabilized or the OOM killed killed qemu
> >>
> >> -m 2T,maxmem=9T,slots=1 \
> >> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
> >> -machine memory-backend=mem0 \
> >> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
> >> -device isa-debugcon,iobase=0x402,chardev=debugcon \
> >>
> >> I have attached the debugcon output from 2 TiB vm.
> >> Is there any other commandline parameters or options I should try?
> >>
> >> thanks
> >> ani
> >
> > $ truncate -s 9T 9tb_sparse_disk.img
> > $ qemu-system-x86_64 -m 9T \
> >   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
> >   -machine memory-backend=mem0
> >
> > works for me till GRUB menu, with sufficient guest kernel
> > persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
> > guest on it and inspect SMBIOS tables comfortably.
> >
> >
> > With KVM enabled it bails out with:
> >    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
> >

I have seen this in my system but not always. Maybe I should have dug
deeper as to why i do see this all the time.

> > all of that on a host with 32G of RAM/no swap.
> >

My system in 16 Gib of main memory, no swap.

>
> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
>
> ~8 TiB (7,999999)

That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
than 2 Gib * 4K (assuming 4K size pages).

So in kvm_main.c in kernel, likely we are hitting this:

	new.npages = mem->memory_size >> PAGE_SHIFT;

        if (new.npages > KVM_MEM_MAX_NR_PAGES)
                return -EINVAL;

>
>
>
> In QEMU, we have
>
> static hwaddr kvm_max_slot_size = ~0;
>
> And only s390x sets
>
> kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
>
> with
>
> #define KVM_SLOT_MAX_BYTES (4UL * TiB)
>


So seems in Igor's system its getting limited by kvm not qemu.

