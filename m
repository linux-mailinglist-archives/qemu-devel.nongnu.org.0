Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00265538BF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:18:41 +0200 (CEST)
Received: from localhost ([::1]:51204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hWS-0001w3-OT
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pefoley@google.com>)
 id 1o3hVY-0001H7-DQ
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:17:44 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:46016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pefoley@google.com>)
 id 1o3hVV-0008IJ-AK
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:17:44 -0400
Received: by mail-il1-x136.google.com with SMTP id o13so4550337ilt.12
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 10:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1jJ+56m6KFrlhf3JhCW8bi77om0ivmf/HdUzdw6Xrio=;
 b=CNIaJAgKunAgWAwRLoxaRgeYA37H4y5ejW/AdRsLOmgIP8Js/foQrKTWMFIgXFZgfm
 lhDtgxn0sMwPTqZqHFMjiqK5piGZSa9YJubzDFmBWM5E8H7dz70g3QnicCI9zkZzX1tS
 QEdQM/vBK+SvkGJ6+kCvZcFnLhj9WhxsXc9IgG/Nbomiiyob9JgxocHJcOZ3/LOYycH/
 f9RN8slN+cEkZae/C97uZ9iYF17I6FXtPBzdyRNn+UkzqjVXenYRX3VFnqxf+o6mR+dr
 7Tx0KhtuHX/2XuL/CLs0XXps1QETSRGxUMY+He0+BDiBbkwcphykukt+ZVrYMRq2FjOO
 xwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1jJ+56m6KFrlhf3JhCW8bi77om0ivmf/HdUzdw6Xrio=;
 b=EmvJkXSUqaWxTj7U68BLe1pFoRh91AQY0Zl9zf4KrVI4pcqfKL8BfTVte2bL5Tz9+E
 tRnSXl3mcbFRo8AiDAdziIwOWQVLkKhb+MfICGQfH2T9utQsFh22ZzB7ZJCM4jL753o3
 PzeZY0aEa58/z/dLJWgrULlLZAuviQdWym6+x7DpXH2Us7/u82vgAOCxzXuwFgcjhdW3
 Hp/iUVp7c5e3AlKYWrWXwxvfWs0tqxLFf0ENOP13WQ7AGKEpKL9FzlW5hCAevbHXPD9n
 3qd5saBTrFOObt53Kx/askRgK7TYjc5HcRIwevCqYAULclbu7U1Cgp5BAn/0klKWT9wq
 FAkQ==
X-Gm-Message-State: AJIora+Ond/yg+85o/3PnI7yIhY8Qz00laSnOyK1Nj54gekmOZLHKLRF
 JQaS1dhhZNGlY/ywL/tGyPdVoFONeVBgdYoqhkW4bg==
X-Google-Smtp-Source: AGRyM1tPSWjYKJ4hIgIiizfxzLTS4q441+qAZp1yHIjj2NwBE/A6B33Fw/Iiv5NIzazjImA1CLKlyvgr4N10dudJoiI=
X-Received: by 2002:a05:6e02:174d:b0:2d9:302a:7b70 with SMTP id
 y13-20020a056e02174d00b002d9302a7b70mr1895556ill.22.1655831859155; Tue, 21
 Jun 2022 10:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxhNUkps9_aLKmy=oDKYC8xsUjErrEMAycwJHjUvkWHRA@mail.gmail.com>
 <20220616133057.bq4m5rzc2tjpeqdn@mozz.bu.edu>
 <CAO=notzeN6OrcfjKNVJ9Q6ttbLv6s-zgiW3dGQTbn4eP6WHcsQ@mail.gmail.com>
 <20220616190304.5bqkov2p2c6khbdc@mozz.bu.edu>
 <265dbc1f-9898-7d69-82dd-168852912a48@redhat.com>
 <20220617143709.rugeh5eea6byhuzu@mozz.bu.edu>
 <CAO=notzY9-cECHrMocDtgmcc9-Bqw_9LvszivMojepPZtMRLgg@mail.gmail.com>
In-Reply-To: <CAO=notzY9-cECHrMocDtgmcc9-Bqw_9LvszivMojepPZtMRLgg@mail.gmail.com>
From: Peter Foley <pefoley@google.com>
Date: Tue, 21 Jun 2022 13:17:27 -0400
Message-ID: <CAAAKUPPWDbz=12keyu+1wcv7CkM98pMRgH+Qa2ZBb9-JiFoHUw@mail.gmail.com>
Subject: Re: misaligned-pointer-use libslirp/src/tcp_input.c
To: Patrick Venture <venture@google.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="000000000000c660aa05e1f865cf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::136;
 envelope-from=pefoley@google.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5, USER_IN_DEF_SPF_WL=-7.5,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

--000000000000c660aa05e1f865cf
Content-Type: text/plain; charset="UTF-8"

The upstream fixes in
https://gitlab.freedesktop.org/slirp/libslirp/-/commit/6489ebbc691f5d97221ad154d570a231e30fb369
and
https://gitlab.freedesktop.org/slirp/libslirp/-/commit/cc20d9ac578aec5502dcb26557765d3e9433cb26
resolved the failure we were seeing in our internal test-case.
Thanks!

On Tue, Jun 21, 2022 at 12:47 PM Patrick Venture <venture@google.com> wrote:

>
>
> On Fri, Jun 17, 2022 at 7:37 AM Alexander Bulekov <alxndr@bu.edu> wrote:
>
>> On 220617 1217, Thomas Huth wrote:
>> > On 16/06/2022 21.03, Alexander Bulekov wrote:
>> > > On 220616 0930, Patrick Venture wrote:
>> > > > On Thu, Jun 16, 2022 at 6:31 AM Alexander Bulekov <alxndr@bu.edu>
>> wrote:
>> > > >
>> > > > > Is this an --enable-sanitizers build? The virtual-device fuzzer
>> catches
>> > > > >
>> > > >
>> > > > Yeah - it should be reproducible with a sanitizers build from HEAD
>> -- I can
>> > > > try to get a manual instance going again without automation to try
>> and
>> > > > reproduce it.  We're testing on v7.0.0 which is when we started
>> seeing
>> > > > this, I don't think we saw it in 6.2.0.
>> > >
>> > > Here are a few reproducers (run with --enable-sanitizers):
>> > >
>> > > This one complains about misalignments in ip_header, ipasfrag, qlink,
>> > > ip...
>> > >
>> > > cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest,
>> -m \
>> > > 512M,slots=4,maxmem=0xffff000000000000 -machine q35 -nodefaults
>> -device \
>> > > vmxnet3,netdev=net0 -netdev user,id=net0 -object \
>> > > memory-backend-ram,id=mem1,size=10M -device \
>> > > pc-dimm,id=nv1,memdev=mem1,addr=0xba19ff00000000 -object \
>> > > memory-backend-ram,id=mem2,size=10M -device \
>> > > pc-dimm,id=nv2,memdev=mem2,addr=0xbe53e14abaa00000 -object \
>> > > memory-backend-ram,id=mem3,size=10M -device \
>> > > pc-dimm,id=nv3,memdev=mem3,addr=0xfe0000e9cae00000 -object \
>> > > memory-backend-ram,id=mem4,size=10M -device \
>> > > pc-dimm,id=nv4,memdev=mem4,addr=0xf0f0f0f00000000 -qtest stdio
>> > > outl 0xcf8 0x80000810
>> > > outl 0xcfc 0xe0000000
>> > > outl 0xcf8 0x80000814
>> > > outl 0xcfc 0xe0001000
>> > > outl 0xcf8 0x80000804
>> > > outw 0xcfc 0x06
>> > > write 0x3e 0x1 0x02
>> > > write 0x39 0x1 0x20
>> > > write 0x29 0x1 0x10
>> > > write 0x2c 0x1 0x0f
>> > > write 0x2d 0x1 0x0f
>> > > write 0x2e 0x1 0x0f
>> > > write 0x2f 0x1 0x0f
>> > > write 0xf0f0f0f00001012 0x1 0xfe
>> > > write 0xf0f0f0f00001013 0x1 0xca
>> > > write 0xf0f0f0f00001014 0x1 0xe9
>> > > write 0xf0f0f0f00001017 0x1 0xfe
>> > > write 0xf0f0f0f0000103a 0x1 0x01
>> > > write 0xfe0000e9cafe0009 0x1 0x40
>> > > write 0xfe0000e9cafe0019 0x1 0x40
>> > > write 0x0 0x1 0xe1
>> > > write 0x1 0x1 0xfe
>> > > write 0x2 0x1 0xbe
>> > > write 0x3 0x1 0xba
>> > > writel 0xe0001020 0xcafe0000
>> > > write 0xfe0000e9cafe0029 0x1 0x40
>> > > write 0xfe0000e9cafe0039 0x1 0x40
>> > > write 0xfe0000e9cafe0049 0x1 0x40
>> > > write 0xfe0000e9cafe0059 0x1 0x40
>> > > write 0x1f65190b 0x1 0x08
>> > > write 0x1f65190d 0x1 0x46
>> > > write 0x1f65190e 0x1 0x03
>> > > write 0x1f651915 0x1 0x01
>> > > write 0xfe0000e9cafe0069 0x1 0x40
>> > > write 0xfe0000e9cafe0079 0x1 0x40
>> > > write 0xfe0000e9cafe0089 0x1 0x40
>> > > write 0xfe0000e9cafe0099 0x1 0x40
>> > > write 0xfe0000e9cafe009d 0x1 0x10
>> > > write 0xfe0000e9cafe00a0 0x1 0xff
>> > > write 0xfe0000e9cafe00a1 0x1 0x18
>> > > write 0xfe0000e9cafe00a2 0x1 0x65
>> > > write 0xfe0000e9cafe00a3 0x1 0x1f
>> > > write 0xfe0000e9cafe00a9 0x1 0x40
>> > > write 0xfe0000e9cafe00ad 0x1 0x1c
>> > > write 0xe0000602 0x1 0x00
>> > > EOF
>> > >
>> > > This one complains about misalignments in ip6_header, ip6_hdrctl...
>> > >
>> > > cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest,
>> -m \
>> > > 512M,slots=1,maxmem=0xffff000000000000 -machine q35 -nodefaults
>> -device \
>> > > vmxnet3,netdev=net0 -netdev user,id=net0 -object \
>> > > memory-backend-ram,id=mem1,size=4M -device \
>> > > pc-dimm,id=nv1,memdev=mem1,addr=0x1dd860000000000 -qtest stdio
>> > > outl 0xcf8 0x80000810
>> > > outl 0xcfc 0xe0000000
>> > > outl 0xcf8 0x80000814
>> > > outl 0xcfc 0xe0001000
>> > > outl 0xcf8 0x80000804
>> > > outw 0xcfc 0x06
>> > > write 0x0 0x1 0xe1
>> > > write 0x1 0x1 0xfe
>> > > write 0x2 0x1 0xbe
>> > > write 0x3 0x1 0xba
>> > > write 0x3e 0x1 0x01
>> > > write 0x39 0x1 0x01
>> > > write 0x28 0x1 0x01
>> > > write 0x29 0x1 0x01
>> > > write 0x2d 0x1 0x86
>> > > write 0x2e 0x1 0xdd
>> > > write 0x2f 0x1 0x01
>> > > write 0x1dd860000000112 0x1 0x10
>> > > write 0x1dd86000000013c 0x1 0x02
>> > > writel 0xe0001020 0xcafe0000
>> > > write 0x1009 0x1 0x40
>> > > write 0x100c 0x1 0x86
>> > > write 0x100d 0x1 0xdd
>> > > write 0x1011 0x1 0x10
>> > > write 0x1019 0x1 0x7e
>> > > write 0x101d 0x1 0x10
>> > > write 0x4d56 0x1 0x02
>> > > write 0xe0000603 0x1 0x00
>> > > EOF
>> >
>> > Could you please open bugs on
>> > https://gitlab.freedesktop.org/slirp/libslirp/-/issues so that this
>> > information does not get lost?
>>
>> Done:
>> https://gitlab.freedesktop.org/slirp/libslirp/-/issues/62
>> https://gitlab.freedesktop.org/slirp/libslirp/-/issues/63
>
>
> Thank you!
>
>>
>>
>> -Alex
>>
>> >
>> >  Thomas
>> >
>> > > >
>> > > > > these periodically while fuzzing network-devices. However I don't
>> think
>> > > > > OSS-Fuzz creates reports for them for some reason. I can create
>> qtest
>> > > > > reproducers, if that is useful.
>> > > > > -Alex
>> > > > >
>> > > > > On 220615 0942, Patrick Venture wrote:
>> > > > > > Hey - I wanted to ask if someone else has seen this or has
>> suggestions on
>> > > > > > how to fix it in libslirp / qemu.
>> > > > > >
>> > > > > > libslirp version: 3ad1710a96678fe79066b1469cead4058713a1d9
>> > > > > >
>> > > > > > The blow is line:
>> > > > > >
>> > > > >
>> https://gitlab.freedesktop.org/slirp/libslirp/-/blob/master/src/tcp_input.c#L310
>> > > > > >
>> > > > > > I0614 13:44:44.304087    2040 bytestream.cc:22] QEMU:
>> > > > > > third_party/libslirp/src/tcp_input.c:310:56: runtime error:
>> member access
>> > > > > > within misaligned address 0xffff9a4000f4 for type 'struct
>> qlink', which
>> > > > > > requires 8 byte alignment
>> > > > > > I0614 13:44:44.304156    2040 bytestream.cc:22] QEMU:
>> 0xffff9a4000f4:
>> > > > > note:
>> > > > > > pointer points here
>> > > > > > I0614 13:44:44.304184    2040 bytestream.cc:22] QEMU:   00 00
>> 00 00 00 00
>> > > > > > 00 02  20 02 0a 00 00 01 42 01  0a 00 02 02 42 01 0a 00  00 01
>> 86 dd 60
>> > > > > 02
>> > > > > > dd 79
>> > > > > > I0614 13:44:44.304204    2040 bytestream.cc:22] QEMU:
>>      ^
>> > > > > > I0614 13:44:44.641173    2040 bytestream.cc:22] QEMU:     #0
>> > > > > 0xaaaacbe34bd8
>> > > > > > in tcp_input third_party/libslirp/src/tcp_input.c:310:56
>> > > > > > I0614 13:44:44.641239    2040 bytestream.cc:22] QEMU:     #1
>> > > > > 0xaaaacbe22a94
>> > > > > > in ip6_input third_party/libslirp/src/ip6_input.c:74:9
>> > > > > > I0614 13:44:44.641262    2040 bytestream.cc:22] QEMU:     #2
>> > > > > 0xaaaacbe0bbbc
>> > > > > > in slirp_input third_party/libslirp/src/slirp.c:1169:13
>> > > > > > I0614 13:44:44.641280    2040 bytestream.cc:22] QEMU:     #3
>> > > > > 0xaaaacbd55f6c
>> > > > > > in net_slirp_receive third_party/qemu/net/slirp.c:136:5
>> > > > > > I0614 13:44:44.641296    2040 bytestream.cc:22] QEMU:     #4
>> > > > > 0xaaaacbd4e77c
>> > > > > > in nc_sendv_compat third_party/qemu/net/net.c
>> > > > > > I0614 13:44:44.641323    2040 bytestream.cc:22] QEMU:     #5
>> > > > > 0xaaaacbd4e77c
>> > > > > > in qemu_deliver_packet_iov third_party/qemu/net/net.c:850:15
>> > > > > > I0614 13:44:44.641342    2040 bytestream.cc:22] QEMU:     #6
>> > > > > 0xaaaacbd50bfc
>> > > > > > in qemu_net_queue_deliver_iov
>> third_party/qemu/net/queue.c:179:11
>> > > > > > I0614 13:44:44.641359    2040 bytestream.cc:22] QEMU:     #7
>> > > > > 0xaaaacbd50bfc
>> > > > > > in qemu_net_queue_send_iov third_party/qemu/net/queue.c:246:11
>> > > > > > I0614 13:44:44.641382    2040 bytestream.cc:22] QEMU:     #8
>> > > > > 0xaaaacbd4a88c
>> > > > > > in qemu_sendv_packet_async third_party/qemu/net/net.c:891:12
>> > > > > > I0614 13:44:44.641396    2040 bytestream.cc:22] QEMU:     #9
>> > > > > 0xaaaacacb1de0
>> > > > > > in virtio_net_flush_tx
>> third_party/qemu/hw/net/virtio-net.c:2586:15
>> > > > > > I0614 13:44:44.641416    2040 bytestream.cc:22] QEMU:     #10
>> > > > > > 0xaaaacacb1580 in virtio_net_tx_bh
>> > > > > > third_party/qemu/hw/net/virtio-net.c:2703:11
>> > > > > > I0614 13:44:44.641438    2040 bytestream.cc:22] QEMU:     #11
>> > > > > > 0xaaaacc2bcf64 in aio_bh_call
>> third_party/qemu/util/async.c:142:5
>> > > > > > I0614 13:44:44.641463    2040 bytestream.cc:22] QEMU:     #12
>> > > > > > 0xaaaacc2bcf64 in aio_bh_poll
>> third_party/qemu/util/async.c:170:13
>> > > > > > I0614 13:44:44.641477    2040 bytestream.cc:22] QEMU:     #13
>> > > > > > 0xaaaacc2b8f70 in aio_dispatch
>> third_party/qemu/util/aio-posix.c:420:5
>> > > > > > I0614 13:44:44.641495    2040 bytestream.cc:22] QEMU:     #14
>> > > > > > 0xaaaacc2bf120 in aio_ctx_dispatch
>> third_party/qemu/util/async.c:312:5
>> > > > > > I0614 13:44:44.641510    2040 bytestream.cc:22] QEMU:     #15
>> > > > > > 0xaaaacc3a7690 in g_main_dispatch
>> third_party/glib/glib/gmain.c:3417:27
>> > > > > > I0614 13:44:44.641525    2040 bytestream.cc:22] QEMU:     #16
>> > > > > > 0xaaaacc3a7690 in g_main_context_dispatch
>> > > > > > third_party/glib/glib/gmain.c:4135:7
>> > > > > > I0614 13:44:44.641546    2040 bytestream.cc:22] QEMU:     #17
>> > > > > > 0xaaaacc2de3ec in glib_pollfds_poll
>> > > > > third_party/qemu/util/main-loop.c:232:9
>> > > > > > I0614 13:44:44.641562    2040 bytestream.cc:22] QEMU:     #18
>> > > > > > 0xaaaacc2de3ec in os_host_main_loop_wait
>> > > > > > third_party/qemu/util/main-loop.c:255:5
>> > > > > > I0614 13:44:44.641580    2040 bytestream.cc:22] QEMU:     #19
>> > > > > > 0xaaaacc2de3ec in main_loop_wait
>> third_party/qemu/util/main-loop.c:531:11
>> > > > > > I0614 13:44:44.641598    2040 bytestream.cc:22] QEMU:     #20
>> > > > > > 0xaaaacbd82798 in qemu_main_loop
>> > > > > third_party/qemu/softmmu/runstate.c:727:9
>> > > > > > I0614 13:44:44.641612    2040 bytestream.cc:22] QEMU:     #21
>> > > > > > 0xaaaacadacb5c in main
>> > > > > >
>> > > > > > Patrick
>> > > > >
>> > >
>> >
>>
>

--000000000000c660aa05e1f865cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The upstream fixes in=C2=A0<a href=3D"https://gitlab.freed=
esktop.org/slirp/libslirp/-/commit/6489ebbc691f5d97221ad154d570a231e30fb369=
">https://gitlab.freedesktop.org/slirp/libslirp/-/commit/6489ebbc691f5d9722=
1ad154d570a231e30fb369</a> and=C2=A0<a href=3D"https://gitlab.freedesktop.o=
rg/slirp/libslirp/-/commit/cc20d9ac578aec5502dcb26557765d3e9433cb26">https:=
//gitlab.freedesktop.org/slirp/libslirp/-/commit/cc20d9ac578aec5502dcb26557=
765d3e9433cb26</a> resolved the failure we were seeing in our internal test=
-case.<div>Thanks!</div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Jun 21, 2022 at 12:47 PM Patrick Venture &l=
t;<a href=3D"mailto:venture@google.com">venture@google.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Jun 17, 2022 at 7:37 AM Alexander Bulekov &lt;=
<a href=3D"mailto:alxndr@bu.edu" target=3D"_blank">alxndr@bu.edu</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 220617 1=
217, Thomas Huth wrote:<br>
&gt; On 16/06/2022 21.03, Alexander Bulekov wrote:<br>
&gt; &gt; On 220616 0930, Patrick Venture wrote:<br>
&gt; &gt; &gt; On Thu, Jun 16, 2022 at 6:31 AM Alexander Bulekov &lt;<a hre=
f=3D"mailto:alxndr@bu.edu" target=3D"_blank">alxndr@bu.edu</a>&gt; wrote:<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Is this an --enable-sanitizers build? The virtual-devic=
e fuzzer catches<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Yeah - it should be reproducible with a sanitizers build fro=
m HEAD -- I can<br>
&gt; &gt; &gt; try to get a manual instance going again without automation =
to try and<br>
&gt; &gt; &gt; reproduce it.=C2=A0 We&#39;re testing on v7.0.0 which is whe=
n we started seeing<br>
&gt; &gt; &gt; this, I don&#39;t think we saw it in 6.2.0.<br>
&gt; &gt; <br>
&gt; &gt; Here are a few reproducers (run with --enable-sanitizers):<br>
&gt; &gt; <br>
&gt; &gt; This one complains about misalignments in ip_header, ipasfrag, ql=
ink,<br>
&gt; &gt; ip...<br>
&gt; &gt; <br>
&gt; &gt; cat &lt;&lt; EOF | ./qemu-system-i386 -display none -machine acce=
l=3Dqtest, -m \<br>
&gt; &gt; 512M,slots=3D4,maxmem=3D0xffff000000000000 -machine q35 -nodefaul=
ts -device \<br>
&gt; &gt; vmxnet3,netdev=3Dnet0 -netdev user,id=3Dnet0 -object \<br>
&gt; &gt; memory-backend-ram,id=3Dmem1,size=3D10M -device \<br>
&gt; &gt; pc-dimm,id=3Dnv1,memdev=3Dmem1,addr=3D0xba19ff00000000 -object \<=
br>
&gt; &gt; memory-backend-ram,id=3Dmem2,size=3D10M -device \<br>
&gt; &gt; pc-dimm,id=3Dnv2,memdev=3Dmem2,addr=3D0xbe53e14abaa00000 -object =
\<br>
&gt; &gt; memory-backend-ram,id=3Dmem3,size=3D10M -device \<br>
&gt; &gt; pc-dimm,id=3Dnv3,memdev=3Dmem3,addr=3D0xfe0000e9cae00000 -object =
\<br>
&gt; &gt; memory-backend-ram,id=3Dmem4,size=3D10M -device \<br>
&gt; &gt; pc-dimm,id=3Dnv4,memdev=3Dmem4,addr=3D0xf0f0f0f00000000 -qtest st=
dio<br>
&gt; &gt; outl 0xcf8 0x80000810<br>
&gt; &gt; outl 0xcfc 0xe0000000<br>
&gt; &gt; outl 0xcf8 0x80000814<br>
&gt; &gt; outl 0xcfc 0xe0001000<br>
&gt; &gt; outl 0xcf8 0x80000804<br>
&gt; &gt; outw 0xcfc 0x06<br>
&gt; &gt; write 0x3e 0x1 0x02<br>
&gt; &gt; write 0x39 0x1 0x20<br>
&gt; &gt; write 0x29 0x1 0x10<br>
&gt; &gt; write 0x2c 0x1 0x0f<br>
&gt; &gt; write 0x2d 0x1 0x0f<br>
&gt; &gt; write 0x2e 0x1 0x0f<br>
&gt; &gt; write 0x2f 0x1 0x0f<br>
&gt; &gt; write 0xf0f0f0f00001012 0x1 0xfe<br>
&gt; &gt; write 0xf0f0f0f00001013 0x1 0xca<br>
&gt; &gt; write 0xf0f0f0f00001014 0x1 0xe9<br>
&gt; &gt; write 0xf0f0f0f00001017 0x1 0xfe<br>
&gt; &gt; write 0xf0f0f0f0000103a 0x1 0x01<br>
&gt; &gt; write 0xfe0000e9cafe0009 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe0019 0x1 0x40<br>
&gt; &gt; write 0x0 0x1 0xe1<br>
&gt; &gt; write 0x1 0x1 0xfe<br>
&gt; &gt; write 0x2 0x1 0xbe<br>
&gt; &gt; write 0x3 0x1 0xba<br>
&gt; &gt; writel 0xe0001020 0xcafe0000<br>
&gt; &gt; write 0xfe0000e9cafe0029 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe0039 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe0049 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe0059 0x1 0x40<br>
&gt; &gt; write 0x1f65190b 0x1 0x08<br>
&gt; &gt; write 0x1f65190d 0x1 0x46<br>
&gt; &gt; write 0x1f65190e 0x1 0x03<br>
&gt; &gt; write 0x1f651915 0x1 0x01<br>
&gt; &gt; write 0xfe0000e9cafe0069 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe0079 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe0089 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe0099 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe009d 0x1 0x10<br>
&gt; &gt; write 0xfe0000e9cafe00a0 0x1 0xff<br>
&gt; &gt; write 0xfe0000e9cafe00a1 0x1 0x18<br>
&gt; &gt; write 0xfe0000e9cafe00a2 0x1 0x65<br>
&gt; &gt; write 0xfe0000e9cafe00a3 0x1 0x1f<br>
&gt; &gt; write 0xfe0000e9cafe00a9 0x1 0x40<br>
&gt; &gt; write 0xfe0000e9cafe00ad 0x1 0x1c<br>
&gt; &gt; write 0xe0000602 0x1 0x00<br>
&gt; &gt; EOF<br>
&gt; &gt; <br>
&gt; &gt; This one complains about misalignments in ip6_header, ip6_hdrctl.=
..<br>
&gt; &gt; <br>
&gt; &gt; cat &lt;&lt; EOF | ./qemu-system-i386 -display none -machine acce=
l=3Dqtest, -m \<br>
&gt; &gt; 512M,slots=3D1,maxmem=3D0xffff000000000000 -machine q35 -nodefaul=
ts -device \<br>
&gt; &gt; vmxnet3,netdev=3Dnet0 -netdev user,id=3Dnet0 -object \<br>
&gt; &gt; memory-backend-ram,id=3Dmem1,size=3D4M -device \<br>
&gt; &gt; pc-dimm,id=3Dnv1,memdev=3Dmem1,addr=3D0x1dd860000000000 -qtest st=
dio<br>
&gt; &gt; outl 0xcf8 0x80000810<br>
&gt; &gt; outl 0xcfc 0xe0000000<br>
&gt; &gt; outl 0xcf8 0x80000814<br>
&gt; &gt; outl 0xcfc 0xe0001000<br>
&gt; &gt; outl 0xcf8 0x80000804<br>
&gt; &gt; outw 0xcfc 0x06<br>
&gt; &gt; write 0x0 0x1 0xe1<br>
&gt; &gt; write 0x1 0x1 0xfe<br>
&gt; &gt; write 0x2 0x1 0xbe<br>
&gt; &gt; write 0x3 0x1 0xba<br>
&gt; &gt; write 0x3e 0x1 0x01<br>
&gt; &gt; write 0x39 0x1 0x01<br>
&gt; &gt; write 0x28 0x1 0x01<br>
&gt; &gt; write 0x29 0x1 0x01<br>
&gt; &gt; write 0x2d 0x1 0x86<br>
&gt; &gt; write 0x2e 0x1 0xdd<br>
&gt; &gt; write 0x2f 0x1 0x01<br>
&gt; &gt; write 0x1dd860000000112 0x1 0x10<br>
&gt; &gt; write 0x1dd86000000013c 0x1 0x02<br>
&gt; &gt; writel 0xe0001020 0xcafe0000<br>
&gt; &gt; write 0x1009 0x1 0x40<br>
&gt; &gt; write 0x100c 0x1 0x86<br>
&gt; &gt; write 0x100d 0x1 0xdd<br>
&gt; &gt; write 0x1011 0x1 0x10<br>
&gt; &gt; write 0x1019 0x1 0x7e<br>
&gt; &gt; write 0x101d 0x1 0x10<br>
&gt; &gt; write 0x4d56 0x1 0x02<br>
&gt; &gt; write 0xe0000603 0x1 0x00<br>
&gt; &gt; EOF<br>
&gt; <br>
&gt; Could you please open bugs on<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/issues" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/slirp/libs=
lirp/-/issues</a> so that this<br>
&gt; information does not get lost?<br>
<br>
Done:<br>
<a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/issues/62" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/slirp/libs=
lirp/-/issues/62</a><br>
<a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/issues/63" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/slirp/libs=
lirp/-/issues/63</a></blockquote><div><br></div><div>Thank you!=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
-Alex<br>
<br>
&gt; <br>
&gt;=C2=A0 Thomas<br>
&gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; these periodically while fuzzing network-devices. Howev=
er I don&#39;t think<br>
&gt; &gt; &gt; &gt; OSS-Fuzz creates reports for them for some reason. I ca=
n create qtest<br>
&gt; &gt; &gt; &gt; reproducers, if that is useful.<br>
&gt; &gt; &gt; &gt; -Alex<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On 220615 0942, Patrick Venture wrote:<br>
&gt; &gt; &gt; &gt; &gt; Hey - I wanted to ask if someone else has seen thi=
s or has suggestions on<br>
&gt; &gt; &gt; &gt; &gt; how to fix it in libslirp / qemu.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; libslirp version: 3ad1710a96678fe79066b1469cead405=
8713a1d9<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; The blow is line:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; <a href=3D"https://gitlab.freedesktop.org/slirp/libslir=
p/-/blob/master/src/tcp_input.c#L310" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.freedesktop.org/slirp/libslirp/-/blob/master/src/tcp_input.c=
#L310</a><br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.304087=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:<br>
&gt; &gt; &gt; &gt; &gt; third_party/libslirp/src/tcp_input.c:310:56: runti=
me error: member access<br>
&gt; &gt; &gt; &gt; &gt; within misaligned address 0xffff9a4000f4 for type =
&#39;struct qlink&#39;, which<br>
&gt; &gt; &gt; &gt; &gt; requires 8 byte alignment<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.304156=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU: 0xffff9a4000f4:<br>
&gt; &gt; &gt; &gt; note:<br>
&gt; &gt; &gt; &gt; &gt; pointer points here<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.304184=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A000 00 00 00 00 00<br>
&gt; &gt; &gt; &gt; &gt; 00 02=C2=A0 20 02 0a 00 00 01 42 01=C2=A0 0a 00 02=
 02 42 01 0a 00=C2=A0 00 01 86 dd 60<br>
&gt; &gt; &gt; &gt; 02<br>
&gt; &gt; &gt; &gt; &gt; dd 79<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.304204=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641173=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#0<br>
&gt; &gt; &gt; &gt; 0xaaaacbe34bd8<br>
&gt; &gt; &gt; &gt; &gt; in tcp_input third_party/libslirp/src/tcp_input.c:=
310:56<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641239=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#1<br>
&gt; &gt; &gt; &gt; 0xaaaacbe22a94<br>
&gt; &gt; &gt; &gt; &gt; in ip6_input third_party/libslirp/src/ip6_input.c:=
74:9<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641262=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#2<br>
&gt; &gt; &gt; &gt; 0xaaaacbe0bbbc<br>
&gt; &gt; &gt; &gt; &gt; in slirp_input third_party/libslirp/src/slirp.c:11=
69:13<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641280=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#3<br>
&gt; &gt; &gt; &gt; 0xaaaacbd55f6c<br>
&gt; &gt; &gt; &gt; &gt; in net_slirp_receive third_party/qemu/net/slirp.c:=
136:5<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641296=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#4<br>
&gt; &gt; &gt; &gt; 0xaaaacbd4e77c<br>
&gt; &gt; &gt; &gt; &gt; in nc_sendv_compat third_party/qemu/net/net.c<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641323=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#5<br>
&gt; &gt; &gt; &gt; 0xaaaacbd4e77c<br>
&gt; &gt; &gt; &gt; &gt; in qemu_deliver_packet_iov third_party/qemu/net/ne=
t.c:850:15<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641342=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#6<br>
&gt; &gt; &gt; &gt; 0xaaaacbd50bfc<br>
&gt; &gt; &gt; &gt; &gt; in qemu_net_queue_deliver_iov third_party/qemu/net=
/queue.c:179:11<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641359=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#7<br>
&gt; &gt; &gt; &gt; 0xaaaacbd50bfc<br>
&gt; &gt; &gt; &gt; &gt; in qemu_net_queue_send_iov third_party/qemu/net/qu=
eue.c:246:11<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641382=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#8<br>
&gt; &gt; &gt; &gt; 0xaaaacbd4a88c<br>
&gt; &gt; &gt; &gt; &gt; in qemu_sendv_packet_async third_party/qemu/net/ne=
t.c:891:12<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641396=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#9<br>
&gt; &gt; &gt; &gt; 0xaaaacacb1de0<br>
&gt; &gt; &gt; &gt; &gt; in virtio_net_flush_tx third_party/qemu/hw/net/vir=
tio-net.c:2586:15<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641416=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#10<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacacb1580 in virtio_net_tx_bh<br>
&gt; &gt; &gt; &gt; &gt; third_party/qemu/hw/net/virtio-net.c:2703:11<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641438=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#11<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc2bcf64 in aio_bh_call third_party/qemu/uti=
l/async.c:142:5<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641463=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#12<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc2bcf64 in aio_bh_poll third_party/qemu/uti=
l/async.c:170:13<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641477=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#13<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc2b8f70 in aio_dispatch third_party/qemu/ut=
il/aio-posix.c:420:5<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641495=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#14<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc2bf120 in aio_ctx_dispatch third_party/qem=
u/util/async.c:312:5<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641510=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#15<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc3a7690 in g_main_dispatch third_party/glib=
/glib/gmain.c:3417:27<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641525=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#16<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc3a7690 in g_main_context_dispatch<br>
&gt; &gt; &gt; &gt; &gt; third_party/glib/glib/gmain.c:4135:7<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641546=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#17<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc2de3ec in glib_pollfds_poll<br>
&gt; &gt; &gt; &gt; third_party/qemu/util/main-loop.c:232:9<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641562=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#18<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc2de3ec in os_host_main_loop_wait<br>
&gt; &gt; &gt; &gt; &gt; third_party/qemu/util/main-loop.c:255:5<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641580=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#19<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacc2de3ec in main_loop_wait third_party/qemu/=
util/main-loop.c:531:11<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641598=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#20<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacbd82798 in qemu_main_loop<br>
&gt; &gt; &gt; &gt; third_party/qemu/softmmu/runstate.c:727:9<br>
&gt; &gt; &gt; &gt; &gt; I0614 13:44:44.641612=C2=A0 =C2=A0 2040 bytestream=
.cc:22] QEMU:=C2=A0 =C2=A0 =C2=A0#21<br>
&gt; &gt; &gt; &gt; &gt; 0xaaaacadacb5c in main<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Patrick<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
</blockquote></div></div>
</blockquote></div>

--000000000000c660aa05e1f865cf--

