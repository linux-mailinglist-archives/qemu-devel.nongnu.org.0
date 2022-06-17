Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356E54F949
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 16:39:00 +0200 (CEST)
Received: from localhost ([::1]:55768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2D7i-0006RR-TD
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 10:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o2D6I-00053C-2a
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:37:30 -0400
Received: from esa5.hc2706-39.iphmx.com ([216.71.137.63]:29402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o2D6E-0002BC-8K
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 10:37:28 -0400
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 216561642
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:1N9PXqO4H713hj3vrR0xlcFynXyQoLVcMsEvi/4bfWQNrUoj1mAAn
 DFODGrSbquINGv2eN5wa4y+80sA7MeDzoBhTAZtpSBmQkwRlceUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3Nc22YTR7z6l4
 rseneWOYDdJ5BYpagr424rbwP+4lK2v0N+wlgVWicFj5TcypVFMZH4sDfjZw0/Df2VhNrXSq
 9AvbV2O1jixEx8FUrtJm1tgG6EAaue60QOm0xK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgPp9k
 okRk5WKFywJYaqcw9VGDxxFOnQrVUFG0OevzXmXtMWSywjfcCKpzaw/XAc5OooX/usxCmZLn
 RAaAGpVP1bT2qTsmuj9E7g87iggBJCD0Ic3s3Vwyz3DJfw7B53PXs0m4PcChWlt2JkQQay2i
 8wxRhZwbQr+MjlzP1IwDrcPscHwoHfVbGgNwL6Sje9ti4TJ9yRo3b3wddbYZNGObcNSmEmeu
 yTB5WuRP/0BHNmWyD7A63H1w+GWzHO9V4UVG7m1sPVthTV/21AuNfHfbnPjydHRt6J0c4k3x
 5A8ksb2kZUPyQ==
IronPort-HdrOrdr: A9a23:Jxy8MKu/OH03BRha5VLzr2zj7skDctV00zEX/kB9WHVpm62j5q
 aTdZEgvyMc5wxhP03I5urgBEDtewK4yXcN2+Us1NSZMjUO2lHGEGgK1+KLrgEIfReOldK1vZ
 0KT0EUMqyTMbEVt7ef3OF1e+xB/OW6
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Jun 2022 10:37:22 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 j11-20020a37c24b000000b006a6bd97578aso5145414qkm.15
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X7NE0l9GAE3x543QWSeynGzoute8hpjUb+5eTBfnc1w=;
 b=RyOlPSnsR0khMn/rfaOGM/O5QtYjQFiWTKcE/+h+fDexURMspYeNuWi3TjYxHpfnpe
 TCdPuipdhsRTsiAQBjnstFD4Pkca32wEmsXJl1lW/rs/87jwRxjxyWiTiR5kWoE+W2lS
 Y4JE7s/axCyad2S3HTBPeNmZ4EaCWaY1U4LY3E10TRxqAU/3qpSmqXKmZintAbooC0iR
 o1ENPWL9bTl0NJC57u6uTjDQnwPmcOXfX9J/+CG8VGHi7aoEOeWULI7FcWII7MdP3E4J
 uZjVpcZvXdNZia2lsIapUJ9Mwrljyk+cUBAUZIAOEi5GYAGQaC0Y4VholWwF7pPPJkxz
 9SEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X7NE0l9GAE3x543QWSeynGzoute8hpjUb+5eTBfnc1w=;
 b=v2QYrq4WaVH/bu+L5MYNEgQLgFz+DcP1i1t7GRNa2R/pLcULsafxbzhzbK3X1ctYNw
 6HBxYxXDBNxW6fxl/QfOHHe+bgAqNlYP6YEo622mAeDaeYywvLZAR47WnbvFdHCt7paR
 FZPcoYY+lzfFqrlUFCjkh7ao/7QYAh1ODhSdar0BUBrPrkfaQXwdRaHo0CGZ+xgR7Q7G
 yVdbNKv9UBXHDs9gyO0SV8ffxdjHBYdC8bXGK3IJKYqwg/kVzyKL3NCRw4wOGoUD9l0R
 IuX3vUoN6MzGs7Ioj7jMX1WSKA02+8MrdU51xQTJwJ4aw4+ZtTZvMQgrOvJBguVGoI5L
 V0aA==
X-Gm-Message-State: AJIora9g53JiAaQETN7LX4zlSw5YeeOXkh24VSk2uRsjlfXhEzxjTDlU
 77rkl2wP0U93YBs9kiiTn4Cl5qW0jx7JZ1dQkvB2bkEkjnjsWXuMXgwm6xBY5G+OCOKQ4MtM59T
 egihZqjZu1B48IGUjesWf7ekHnJhsQg==
X-Received: by 2002:a05:620a:44ca:b0:6a6:fd36:12a with SMTP id
 y10-20020a05620a44ca00b006a6fd36012amr7342724qkp.664.1655476641574; 
 Fri, 17 Jun 2022 07:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1unIdwjLnbT7F4Dj3zDZGTSisVFvGWqd7Ft5O6fnlCzDshZwjR+/mCR7gZkZEpQZyZOVmY1Yw==
X-Received: by 2002:a05:620a:44ca:b0:6a6:fd36:12a with SMTP id
 y10-20020a05620a44ca00b006a6fd36012amr7342700qkp.664.1655476641273; 
 Fri, 17 Jun 2022 07:37:21 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a05620a294400b006a793bde241sm5193227qkp.63.2022.06.17.07.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 07:37:19 -0700 (PDT)
Date: Fri, 17 Jun 2022 10:37:16 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Cc: Patrick Venture <venture@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: misaligned-pointer-use libslirp/src/tcp_input.c
Message-ID: <20220617143709.rugeh5eea6byhuzu@mozz.bu.edu>
References: <CAO=notxhNUkps9_aLKmy=oDKYC8xsUjErrEMAycwJHjUvkWHRA@mail.gmail.com>
 <20220616133057.bq4m5rzc2tjpeqdn@mozz.bu.edu>
 <CAO=notzeN6OrcfjKNVJ9Q6ttbLv6s-zgiW3dGQTbn4eP6WHcsQ@mail.gmail.com>
 <20220616190304.5bqkov2p2c6khbdc@mozz.bu.edu>
 <265dbc1f-9898-7d69-82dd-168852912a48@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <265dbc1f-9898-7d69-82dd-168852912a48@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.63; envelope-from=alxndr@bu.edu;
 helo=esa5.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_PORT=0.001 autolearn=no autolearn_force=no
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

On 220617 1217, Thomas Huth wrote:
> On 16/06/2022 21.03, Alexander Bulekov wrote:
> > On 220616 0930, Patrick Venture wrote:
> > > On Thu, Jun 16, 2022 at 6:31 AM Alexander Bulekov <alxndr@bu.edu> wrote:
> > > 
> > > > Is this an --enable-sanitizers build? The virtual-device fuzzer catches
> > > > 
> > > 
> > > Yeah - it should be reproducible with a sanitizers build from HEAD -- I can
> > > try to get a manual instance going again without automation to try and
> > > reproduce it.  We're testing on v7.0.0 which is when we started seeing
> > > this, I don't think we saw it in 6.2.0.
> > 
> > Here are a few reproducers (run with --enable-sanitizers):
> > 
> > This one complains about misalignments in ip_header, ipasfrag, qlink,
> > ip...
> > 
> > cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
> > 512M,slots=4,maxmem=0xffff000000000000 -machine q35 -nodefaults -device \
> > vmxnet3,netdev=net0 -netdev user,id=net0 -object \
> > memory-backend-ram,id=mem1,size=10M -device \
> > pc-dimm,id=nv1,memdev=mem1,addr=0xba19ff00000000 -object \
> > memory-backend-ram,id=mem2,size=10M -device \
> > pc-dimm,id=nv2,memdev=mem2,addr=0xbe53e14abaa00000 -object \
> > memory-backend-ram,id=mem3,size=10M -device \
> > pc-dimm,id=nv3,memdev=mem3,addr=0xfe0000e9cae00000 -object \
> > memory-backend-ram,id=mem4,size=10M -device \
> > pc-dimm,id=nv4,memdev=mem4,addr=0xf0f0f0f00000000 -qtest stdio
> > outl 0xcf8 0x80000810
> > outl 0xcfc 0xe0000000
> > outl 0xcf8 0x80000814
> > outl 0xcfc 0xe0001000
> > outl 0xcf8 0x80000804
> > outw 0xcfc 0x06
> > write 0x3e 0x1 0x02
> > write 0x39 0x1 0x20
> > write 0x29 0x1 0x10
> > write 0x2c 0x1 0x0f
> > write 0x2d 0x1 0x0f
> > write 0x2e 0x1 0x0f
> > write 0x2f 0x1 0x0f
> > write 0xf0f0f0f00001012 0x1 0xfe
> > write 0xf0f0f0f00001013 0x1 0xca
> > write 0xf0f0f0f00001014 0x1 0xe9
> > write 0xf0f0f0f00001017 0x1 0xfe
> > write 0xf0f0f0f0000103a 0x1 0x01
> > write 0xfe0000e9cafe0009 0x1 0x40
> > write 0xfe0000e9cafe0019 0x1 0x40
> > write 0x0 0x1 0xe1
> > write 0x1 0x1 0xfe
> > write 0x2 0x1 0xbe
> > write 0x3 0x1 0xba
> > writel 0xe0001020 0xcafe0000
> > write 0xfe0000e9cafe0029 0x1 0x40
> > write 0xfe0000e9cafe0039 0x1 0x40
> > write 0xfe0000e9cafe0049 0x1 0x40
> > write 0xfe0000e9cafe0059 0x1 0x40
> > write 0x1f65190b 0x1 0x08
> > write 0x1f65190d 0x1 0x46
> > write 0x1f65190e 0x1 0x03
> > write 0x1f651915 0x1 0x01
> > write 0xfe0000e9cafe0069 0x1 0x40
> > write 0xfe0000e9cafe0079 0x1 0x40
> > write 0xfe0000e9cafe0089 0x1 0x40
> > write 0xfe0000e9cafe0099 0x1 0x40
> > write 0xfe0000e9cafe009d 0x1 0x10
> > write 0xfe0000e9cafe00a0 0x1 0xff
> > write 0xfe0000e9cafe00a1 0x1 0x18
> > write 0xfe0000e9cafe00a2 0x1 0x65
> > write 0xfe0000e9cafe00a3 0x1 0x1f
> > write 0xfe0000e9cafe00a9 0x1 0x40
> > write 0xfe0000e9cafe00ad 0x1 0x1c
> > write 0xe0000602 0x1 0x00
> > EOF
> > 
> > This one complains about misalignments in ip6_header, ip6_hdrctl...
> > 
> > cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
> > 512M,slots=1,maxmem=0xffff000000000000 -machine q35 -nodefaults -device \
> > vmxnet3,netdev=net0 -netdev user,id=net0 -object \
> > memory-backend-ram,id=mem1,size=4M -device \
> > pc-dimm,id=nv1,memdev=mem1,addr=0x1dd860000000000 -qtest stdio
> > outl 0xcf8 0x80000810
> > outl 0xcfc 0xe0000000
> > outl 0xcf8 0x80000814
> > outl 0xcfc 0xe0001000
> > outl 0xcf8 0x80000804
> > outw 0xcfc 0x06
> > write 0x0 0x1 0xe1
> > write 0x1 0x1 0xfe
> > write 0x2 0x1 0xbe
> > write 0x3 0x1 0xba
> > write 0x3e 0x1 0x01
> > write 0x39 0x1 0x01
> > write 0x28 0x1 0x01
> > write 0x29 0x1 0x01
> > write 0x2d 0x1 0x86
> > write 0x2e 0x1 0xdd
> > write 0x2f 0x1 0x01
> > write 0x1dd860000000112 0x1 0x10
> > write 0x1dd86000000013c 0x1 0x02
> > writel 0xe0001020 0xcafe0000
> > write 0x1009 0x1 0x40
> > write 0x100c 0x1 0x86
> > write 0x100d 0x1 0xdd
> > write 0x1011 0x1 0x10
> > write 0x1019 0x1 0x7e
> > write 0x101d 0x1 0x10
> > write 0x4d56 0x1 0x02
> > write 0xe0000603 0x1 0x00
> > EOF
> 
> Could you please open bugs on
> https://gitlab.freedesktop.org/slirp/libslirp/-/issues so that this
> information does not get lost?

Done:
https://gitlab.freedesktop.org/slirp/libslirp/-/issues/62
https://gitlab.freedesktop.org/slirp/libslirp/-/issues/63

-Alex

> 
>  Thomas
> 
> > > 
> > > > these periodically while fuzzing network-devices. However I don't think
> > > > OSS-Fuzz creates reports for them for some reason. I can create qtest
> > > > reproducers, if that is useful.
> > > > -Alex
> > > > 
> > > > On 220615 0942, Patrick Venture wrote:
> > > > > Hey - I wanted to ask if someone else has seen this or has suggestions on
> > > > > how to fix it in libslirp / qemu.
> > > > > 
> > > > > libslirp version: 3ad1710a96678fe79066b1469cead4058713a1d9
> > > > > 
> > > > > The blow is line:
> > > > > 
> > > > https://gitlab.freedesktop.org/slirp/libslirp/-/blob/master/src/tcp_input.c#L310
> > > > > 
> > > > > I0614 13:44:44.304087    2040 bytestream.cc:22] QEMU:
> > > > > third_party/libslirp/src/tcp_input.c:310:56: runtime error: member access
> > > > > within misaligned address 0xffff9a4000f4 for type 'struct qlink', which
> > > > > requires 8 byte alignment
> > > > > I0614 13:44:44.304156    2040 bytestream.cc:22] QEMU: 0xffff9a4000f4:
> > > > note:
> > > > > pointer points here
> > > > > I0614 13:44:44.304184    2040 bytestream.cc:22] QEMU:   00 00 00 00 00 00
> > > > > 00 02  20 02 0a 00 00 01 42 01  0a 00 02 02 42 01 0a 00  00 01 86 dd 60
> > > > 02
> > > > > dd 79
> > > > > I0614 13:44:44.304204    2040 bytestream.cc:22] QEMU:               ^
> > > > > I0614 13:44:44.641173    2040 bytestream.cc:22] QEMU:     #0
> > > > 0xaaaacbe34bd8
> > > > > in tcp_input third_party/libslirp/src/tcp_input.c:310:56
> > > > > I0614 13:44:44.641239    2040 bytestream.cc:22] QEMU:     #1
> > > > 0xaaaacbe22a94
> > > > > in ip6_input third_party/libslirp/src/ip6_input.c:74:9
> > > > > I0614 13:44:44.641262    2040 bytestream.cc:22] QEMU:     #2
> > > > 0xaaaacbe0bbbc
> > > > > in slirp_input third_party/libslirp/src/slirp.c:1169:13
> > > > > I0614 13:44:44.641280    2040 bytestream.cc:22] QEMU:     #3
> > > > 0xaaaacbd55f6c
> > > > > in net_slirp_receive third_party/qemu/net/slirp.c:136:5
> > > > > I0614 13:44:44.641296    2040 bytestream.cc:22] QEMU:     #4
> > > > 0xaaaacbd4e77c
> > > > > in nc_sendv_compat third_party/qemu/net/net.c
> > > > > I0614 13:44:44.641323    2040 bytestream.cc:22] QEMU:     #5
> > > > 0xaaaacbd4e77c
> > > > > in qemu_deliver_packet_iov third_party/qemu/net/net.c:850:15
> > > > > I0614 13:44:44.641342    2040 bytestream.cc:22] QEMU:     #6
> > > > 0xaaaacbd50bfc
> > > > > in qemu_net_queue_deliver_iov third_party/qemu/net/queue.c:179:11
> > > > > I0614 13:44:44.641359    2040 bytestream.cc:22] QEMU:     #7
> > > > 0xaaaacbd50bfc
> > > > > in qemu_net_queue_send_iov third_party/qemu/net/queue.c:246:11
> > > > > I0614 13:44:44.641382    2040 bytestream.cc:22] QEMU:     #8
> > > > 0xaaaacbd4a88c
> > > > > in qemu_sendv_packet_async third_party/qemu/net/net.c:891:12
> > > > > I0614 13:44:44.641396    2040 bytestream.cc:22] QEMU:     #9
> > > > 0xaaaacacb1de0
> > > > > in virtio_net_flush_tx third_party/qemu/hw/net/virtio-net.c:2586:15
> > > > > I0614 13:44:44.641416    2040 bytestream.cc:22] QEMU:     #10
> > > > > 0xaaaacacb1580 in virtio_net_tx_bh
> > > > > third_party/qemu/hw/net/virtio-net.c:2703:11
> > > > > I0614 13:44:44.641438    2040 bytestream.cc:22] QEMU:     #11
> > > > > 0xaaaacc2bcf64 in aio_bh_call third_party/qemu/util/async.c:142:5
> > > > > I0614 13:44:44.641463    2040 bytestream.cc:22] QEMU:     #12
> > > > > 0xaaaacc2bcf64 in aio_bh_poll third_party/qemu/util/async.c:170:13
> > > > > I0614 13:44:44.641477    2040 bytestream.cc:22] QEMU:     #13
> > > > > 0xaaaacc2b8f70 in aio_dispatch third_party/qemu/util/aio-posix.c:420:5
> > > > > I0614 13:44:44.641495    2040 bytestream.cc:22] QEMU:     #14
> > > > > 0xaaaacc2bf120 in aio_ctx_dispatch third_party/qemu/util/async.c:312:5
> > > > > I0614 13:44:44.641510    2040 bytestream.cc:22] QEMU:     #15
> > > > > 0xaaaacc3a7690 in g_main_dispatch third_party/glib/glib/gmain.c:3417:27
> > > > > I0614 13:44:44.641525    2040 bytestream.cc:22] QEMU:     #16
> > > > > 0xaaaacc3a7690 in g_main_context_dispatch
> > > > > third_party/glib/glib/gmain.c:4135:7
> > > > > I0614 13:44:44.641546    2040 bytestream.cc:22] QEMU:     #17
> > > > > 0xaaaacc2de3ec in glib_pollfds_poll
> > > > third_party/qemu/util/main-loop.c:232:9
> > > > > I0614 13:44:44.641562    2040 bytestream.cc:22] QEMU:     #18
> > > > > 0xaaaacc2de3ec in os_host_main_loop_wait
> > > > > third_party/qemu/util/main-loop.c:255:5
> > > > > I0614 13:44:44.641580    2040 bytestream.cc:22] QEMU:     #19
> > > > > 0xaaaacc2de3ec in main_loop_wait third_party/qemu/util/main-loop.c:531:11
> > > > > I0614 13:44:44.641598    2040 bytestream.cc:22] QEMU:     #20
> > > > > 0xaaaacbd82798 in qemu_main_loop
> > > > third_party/qemu/softmmu/runstate.c:727:9
> > > > > I0614 13:44:44.641612    2040 bytestream.cc:22] QEMU:     #21
> > > > > 0xaaaacadacb5c in main
> > > > > 
> > > > > Patrick
> > > > 
> > 
> 

