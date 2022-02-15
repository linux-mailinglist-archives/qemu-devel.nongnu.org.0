Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A794B6845
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 10:56:25 +0100 (CET)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJuZM-00088U-Qm
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 04:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJuSB-0007S0-4F
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:48:59 -0500
Received: from [2a00:1450:4864:20::535] (port=43836
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJuS9-0002cI-GW
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:48:58 -0500
Received: by mail-ed1-x535.google.com with SMTP id y17so29145804edd.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnRhxGYYfE1KOVwREmvYiP9dp/YVvP/CIfZoSMCSUPI=;
 b=XEbs2DlJ3BrIBSC2hS2ypWlKElX8I48x2Kgc4vD4fAQ/sZLbWiXNQSuUyHDRxdezEP
 aeX6satXBpJisIuvqWzSwDx6aHDqtGLm8usDHQ5Ac5A6pkIjM/cXp2gvRY8lRGCZqHov
 aPRkEU8vE9FXarvq9f7PkXPzgCmXeXfjnmjtKO8Dr5c2e6x8NWMwZm4GHULki53jEP4P
 f181J4lhpcJh8uMdqBlLl2Hsd1Ob8EN0wn6zpRAfl1priukoLDs9Nv9RFxhTk3NLiDWW
 a3SXTFViUPCyH7d05GOR6MVHKVfIk5cst6AwEXRUWFf31ynmddn9N/lu7PPKl36ZeFXZ
 M/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnRhxGYYfE1KOVwREmvYiP9dp/YVvP/CIfZoSMCSUPI=;
 b=qg4FDodaMOZHx3ggp3ovRzPK55s7Lr27nuY6WK0RmmCe9bs8Ie4hM/mnmde2lEWPT/
 PJyd6C8BJRS1KXZx73SG82qax1wLXW4LjvT1z+gStoU6jYwcMXPjbjfGklkVfe+nGuQv
 1VjenUdwK2eKJH9tP3b9ox+kdEkGqvwwn1CfX2OgiEEYvDdto2KDbZgdfzRujlwfwm4u
 LIU8u0XcZVn/zntaqnAgU2sFNPUMQDE3X67vVq93Jspd83Ywv8g1TetIRi///vrJctkG
 RoMg+ZjXt3vv9NTuFCaHGggXlNTTZClD+qz4GkD4xWs/uW/gWCFL7v96SDod+TN8fpQu
 yzjg==
X-Gm-Message-State: AOAM531Bi3Pt5mXfRowuXD8OFaRLQsXUWfNQ2WOUHh1Y8OImDctheZoZ
 gh8H6xYeJRcM2CMSB12z6uM1v2l12f+NVyjeT00m/g==
X-Google-Smtp-Source: ABdhPJw1RtTcDKqZ9eIMFAByDaykoc04HD2BIDe7Um6jaYvxqz9Ddkm+GoGRoWAT0zOckWXk8UmWI3ohlTwEW24zymA=
X-Received: by 2002:a05:6402:b09:: with SMTP id
 bm9mr3070069edb.304.1644918536136; 
 Tue, 15 Feb 2022 01:48:56 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
 <b06ab7b0-61f2-5301-70f9-197dfd9527e9@redhat.com>
 <CAARzgwwDFybUsCj8Ym6kpcjNRCVV6vbsY7Lks0wsmrc2+ET03Q@mail.gmail.com>
 <492bd3a4-4a26-afc9-1268-74a9fd7f095a@redhat.com>
 <CAARzgwzd-p-GLOQ-VtBC2_-fd1=fg2rZU7t9XhVA1QSUe1vT0A@mail.gmail.com>
 <86b5c589-c1d2-bd2b-12e4-9bec25d3a9ef@redhat.com>
In-Reply-To: <86b5c589-c1d2-bd2b-12e4-9bec25d3a9ef@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 15 Feb 2022 15:18:45 +0530
Message-ID: <CAARzgwzYvk=pLz3gHX_Q3gTsJzog+S1mmB-ob6N=hY_odqA7Hw@mail.gmail.com>
Subject: Re: 9 TiB vm memory creation
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x535.google.com
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

On Tue, Feb 15, 2022 at 3:14 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 15.02.22 10:40, Ani Sinha wrote:
> > On Tue, Feb 15, 2022 at 2:08 PM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 15.02.22 09:12, Ani Sinha wrote:
> >>> On Tue, Feb 15, 2022 at 1:25 PM David Hildenbrand <david@redhat.com> wrote:
> >>>>
> >>>> On 15.02.22 08:00, Ani Sinha wrote:
> >>>>>
> >>>>>
> >>>>> On Mon, 14 Feb 2022, David Hildenbrand wrote:
> >>>>>
> >>>>>> On 14.02.22 13:36, Igor Mammedov wrote:
> >>>>>>> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
> >>>>>>> Ani Sinha <ani@anisinha.ca> wrote:
> >>>>>>>
> >>>>>>>> Hi Igor:
> >>>>>>>>
> >>>>>>>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
> >>>>>>>> system with the following commandline before either the system
> >>>>>>>> destabilized or the OOM killed killed qemu
> >>>>>>>>
> >>>>>>>> -m 2T,maxmem=9T,slots=1 \
> >>>>>>>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
> >>>>>>>> -machine memory-backend=mem0 \
> >>>>>>>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
> >>>>>>>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
> >>>>>>>>
> >>>>>>>> I have attached the debugcon output from 2 TiB vm.
> >>>>>>>> Is there any other commandline parameters or options I should try?
> >>>>>>>>
> >>>>>>>> thanks
> >>>>>>>> ani
> >>>>>>>
> >>>>>>> $ truncate -s 9T 9tb_sparse_disk.img
> >>>>>>> $ qemu-system-x86_64 -m 9T \
> >>>>>>>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
> >>>>>>>   -machine memory-backend=mem0
> >>>>>>>
> >>>>>>> works for me till GRUB menu, with sufficient guest kernel
> >>>>>>> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
> >>>>>>> guest on it and inspect SMBIOS tables comfortably.
> >>>>>>>
> >>>>>>>
> >>>>>>> With KVM enabled it bails out with:
> >>>>>>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
> >>>>>>>
> >>>>>
> >>>>> I have seen this in my system but not always. Maybe I should have dug
> >>>>> deeper as to why i do see this all the time.
> >>>>>
> >>>>>>> all of that on a host with 32G of RAM/no swap.
> >>>>>>>
> >>>>>
> >>>>> My system in 16 Gib of main memory, no swap.
> >>>>>
> >>>>>>
> >>>>>> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
> >>>>>>
> >>>>>> ~8 TiB (7,999999)
> >>>>>
> >>>>> That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
> >>>>> than 2 Gib * 4K (assuming 4K size pages).
> >>>>
> >>>> "pages" don't carry the unit "GiB/TiB", so I was talking about the
> >>>> actual size with 4k pages (your setup, I assume)
> >>>
> >>> yes I got that after reading your email again.
> >>> The interesting question now is how is redhat QE running 9 TiB vm with kvm?
> >>
> >> As already indicated by me regarding s390x only having single large NUMA
> >> nodes, x86 is usually using multiple NUMA nodes with such large memory.
> >> And QE seems to be using virtual numa nodes:
> >>
> >> Each of the 32 virtual numa nodes receive a:
> >>
> >>   -object memory-backend-ram,id=ram-node20,size=309237645312,host-
> >>    nodes=0-31,policy=bind
> >>
> >> which results in a dedicated KVM memslot (just like each DIMM would)
> >>
> >>
> >> 32 * 309237645312 == 9 TiB :)
> >
> > ah, I should have looked closely at the other commandlines before
> > shooting off the email. Yes the limitation is per mem-slot and they
> > have 32 slots one per node.
> > ok so should we do
> > kvm_set_max_memslot_size(KVM_SLOT_MAX_BYTES);
> > from i386 kvm_arch_init()?
>
>
> As I said, I'm not a friend of these workarounds in user space.

Oh ok, did not realize you were against s390x like workarounds.

