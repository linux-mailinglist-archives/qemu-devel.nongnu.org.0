Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D594B6615
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:31:13 +0100 (CET)
Received: from localhost ([::1]:38768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJtEu-0005sM-47
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:31:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJsx8-0001Vx-4W
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:12:50 -0500
Received: from [2a00:1450:4864:20::630] (port=45911
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nJsx5-0003eu-H2
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:12:49 -0500
Received: by mail-ej1-x630.google.com with SMTP id lw4so11682368ejb.12
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ToFKT+yv0G/Kp9EAsgjEx+fUChWt93odJ3rHVDo+pDo=;
 b=5y4Ou4oTwWFjGxGbXkBSR4eil60bVr147Eks+qhlcVuyZmBViDqAs9T2ZxMktwKj1S
 liJcv6YUU9FmYhx83L2KEai60RuP441bMbtcW4q4piVhG6+BNUaSq4RPdA5JG2F0bnKZ
 D5E2ass5zndRRo+p3rtxfXBf2JhDNatREBed0qJjgAgejP+QdoRu7O5AcUsXEwpYSU60
 6GL+JZko8EnLB0mJfebaUei5SRASxjSoLdX/98qHtvN6Mwt4Ro22QEbR6rTbVIhEQJQX
 APnpDYXyCS74AC9HT6hsndXAgJmbCHYFDumv57Zd1qRgo2lgnH99AoCViQeeJx0MCeIF
 6OBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ToFKT+yv0G/Kp9EAsgjEx+fUChWt93odJ3rHVDo+pDo=;
 b=0RGpf1I7EtfFS8SLFiTmqdikzW32Q7YcUbQQihBTb+ukZNRxeQoMh0z8I0WTOBDHps
 ndHPULt4+pALk+No5D4yEKhfV42WjmIc0yX8j5rdBQlF4PrXFACxsnTvEmTrudMS+PTX
 jyB3NnM3d5ud/xexf01pqHFhomUDr7JiUamXIRIK21/ocJscElGFt2lqSZt8b1Lc6cS6
 Nug9AAHpmxO+pGzSodrL/wYr8V2p7msbBJVtuEEoyxt8FlbJg28dB8YzvIA/TweQ4Zy9
 +9LZo3Z8XX5e02Cl+5Nez5IIMoVCIUsF98HNQj6XiEJ7P02FQe3aRFgFvvcLyJZrH9kz
 J0rQ==
X-Gm-Message-State: AOAM532/Z2QGJs/CLTtkVEchYSRc53r5mzn2Bq9ullusgMChkqiV9r9Z
 bywNJLuy4Ql6yOYy8qudrXNtnqYYNoGe8ZOXfduOqA==
X-Google-Smtp-Source: ABdhPJw/74VvQzlQc2lCn0uVnk9vhTwIJZF1gzx/qPuuHD6xo6mLLKMUCZQpdqzhU7cc2gX2hoZMUCgVv5zTMe9pVSU=
X-Received: by 2002:a17:907:9606:: with SMTP id
 gb6mr1945512ejc.51.1644912765919; 
 Tue, 15 Feb 2022 00:12:45 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2202141048390.13781@anisinha-lenovo>
 <20220214133634.248d7de0@redhat.com>
 <b9771171-8d28-b46b-4474-687a8fed0abd@redhat.com>
 <alpine.DEB.2.22.394.2202151221090.13781@anisinha-lenovo>
 <b06ab7b0-61f2-5301-70f9-197dfd9527e9@redhat.com>
In-Reply-To: <b06ab7b0-61f2-5301-70f9-197dfd9527e9@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 15 Feb 2022 13:42:35 +0530
Message-ID: <CAARzgwwDFybUsCj8Ym6kpcjNRCVV6vbsY7Lks0wsmrc2+ET03Q@mail.gmail.com>
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

On Tue, Feb 15, 2022 at 1:25 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 15.02.22 08:00, Ani Sinha wrote:
> >
> >
> > On Mon, 14 Feb 2022, David Hildenbrand wrote:
> >
> >> On 14.02.22 13:36, Igor Mammedov wrote:
> >>> On Mon, 14 Feb 2022 10:54:22 +0530 (IST)
> >>> Ani Sinha <ani@anisinha.ca> wrote:
> >>>
> >>>> Hi Igor:
> >>>>
> >>>> I failed to spawn a 9 Tib VM. The max I could do was a 2 TiB vm on my
> >>>> system with the following commandline before either the system
> >>>> destabilized or the OOM killed killed qemu
> >>>>
> >>>> -m 2T,maxmem=9T,slots=1 \
> >>>> -object memory-backend-file,id=mem0,size=2T,mem-path=/data/temp/memfile,prealloc=off \
> >>>> -machine memory-backend=mem0 \
> >>>> -chardev file,path=/tmp/debugcon2.txt,id=debugcon \
> >>>> -device isa-debugcon,iobase=0x402,chardev=debugcon \
> >>>>
> >>>> I have attached the debugcon output from 2 TiB vm.
> >>>> Is there any other commandline parameters or options I should try?
> >>>>
> >>>> thanks
> >>>> ani
> >>>
> >>> $ truncate -s 9T 9tb_sparse_disk.img
> >>> $ qemu-system-x86_64 -m 9T \
> >>>   -object memory-backend-file,id=mem0,size=9T,mem-path=9tb_sparse_disk.img,prealloc=off,share=on \
> >>>   -machine memory-backend=mem0
> >>>
> >>> works for me till GRUB menu, with sufficient guest kernel
> >>> persuasion (i.e. CLI limit ram size to something reasonable) you can boot linux
> >>> guest on it and inspect SMBIOS tables comfortably.
> >>>
> >>>
> >>> With KVM enabled it bails out with:
> >>>    qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=1, start=0x100000000, size=0x8ff40000000: Invalid argument
> >>>
> >
> > I have seen this in my system but not always. Maybe I should have dug
> > deeper as to why i do see this all the time.
> >
> >>> all of that on a host with 32G of RAM/no swap.
> >>>
> >
> > My system in 16 Gib of main memory, no swap.
> >
> >>
> >> #define KVM_MEM_MAX_NR_PAGES ((1UL << 31) - 1)
> >>
> >> ~8 TiB (7,999999)
> >
> > That's not 8 Tib, thats 2 GiB. But yes, 0x8ff40000000 is certainly greater
> > than 2 Gib * 4K (assuming 4K size pages).
>
> "pages" don't carry the unit "GiB/TiB", so I was talking about the
> actual size with 4k pages (your setup, I assume)

yes I got that after reading your email again.
The interesting question now is how is redhat QE running 9 TiB vm with kvm?

https://bugzilla-attachments.redhat.com/attachment.cgi?id=1795945

