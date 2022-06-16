Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A649954E9C8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 21:06:15 +0200 (CEST)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1uoo-0000dK-B1
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 15:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o1um3-0007KC-RX
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 15:03:25 -0400
Received: from esa11.hc2706-39.iphmx.com ([216.71.137.81]:18623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o1um1-0005xZ-9l
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 15:03:23 -0400
X-IronPort-RemoteIP: 209.85.222.198
X-IronPort-MID: 206929601
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JSC6eKD7lEATnBVW/77hw5YqxClBgxIJ4kV8jS/XYbTApG4ghTBTy
 TAXXmyBb/vcM2X0ftBwPd7l8EgH7JGHx9c1TANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn29Aw3bBVPivW0
 T/Mi5yHULOa82MsWo4kw/rrRMRH5amaVJsw5zTSVNgS1LPsvyB94KE3fMldG0DFrrx8RYZWc
 QpiIIaRpQs19z91Yj+sfy2SnkciG9Y+NiDX4pZatjTLbrGvaUXe345iXMfwZ3u7hB2vwNJp2
 OR0haWxWAsSBY7rwPQDURtXRnQW0a1uoNcrIFC6uM2XilTFKj7imqQ+Sk4xOoIc96B8BmQmG
 f4wcmhcKEDewbjsmvTiG7kEascLdaEHOKsWvmFmwSvxB+tgTJzeK0nPzYUAgmZq154WRJ4yY
 eIgeyJRYBvMPiRjYFIdVrQjhrrvh3TgJmgwRFW94PBfD3Lo5BV81aWoPNfLd9iiQ8JTkUCF4
 GXc8AzE7goyMdWezX+c8SvpiLaezWX0X4UdELD+/flv6LGO+lEu5NQtfQPTiZGEZoSWAIM3x
 5A8ksb2kZUPyQ==
IronPort-HdrOrdr: A9a23:m/qb4KznXVBH5wBPj+VTKrPxo+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBZpTnyAtj6fZq8z+8/3WB1B9uftWbdyQ+Vxe1ZjLcKhgeQYhEWldQtn5
 uIEZIOb+EYZGIS5amV3OD7KadH/DDtytHKuQ6q9QYJcegcUdAD0+4WMGamO3wzYDMDKYsyFZ
 Ka6MYCjSGnY24rYsOyAWRAd/TfpvXQ/aiWLSIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH53KO+qPu2oyWsmFM7rq4m1ucJ+OEzRPBkufJlaQkETTzYJriJbofy/QzdZtvfrWrC3u
 O85yvIdP4DkU85NlvF3CcFnTOQnQrGokWStWOwkD/tp9f0Syk9DNcEjYVFcgHB405lp91k1r
 lXtljpwaa/oimw7xgVyuK4Iy2CrHDE1kbKUNRj/0B3QM8bcvtcvIYf9ERaHNMJGz/78pkuFK
 1rANvH7PhbfFuGZzSB11MfiOCETzA2BFOLU0ICssua33xfm2141VIRwIgakm0b/JwwRpFY76
 DPM7hulrtJUsgKBJgNTdspUI+yECjAUBjMOGWdLRDuE7wGIWvEr9rt7LA89IiRCek1JVsJ6e
 b8uX9jxBAPkhjVeLKzNbVwg2HwfFk=
Received: from mail-qk1-f198.google.com ([209.85.222.198])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2022 15:03:09 -0400
Received: by mail-qk1-f198.google.com with SMTP id
 de4-20020a05620a370400b006a9711bd9f8so2607813qkb.9
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j4ogsOSFG4OzrScvbxbe7jBVhjhSx+RjAMaVZdX0J/A=;
 b=frNdY4SYBA0mvOP/c3Wrol8QRqZx+LrMCuIarr+uy0NdVFRqYkKJ/yKXSZmcOKVfzj
 cdIg9A3RL/FCDUsM0qOnZY0kn6oNGpjIFxjYPCwi9XhBF1QT/hmuiSgcJz5kXkjhmFeF
 pVd5RwO0Xw7DE6o6Fd5WLpmmtTKdtVs/oplBmfhPTnWfI+7hoUzFCYQlzHsYqHvIzysM
 Dd/WUkbVgWOZvnl12pMroY4iux3mO+YfHEmbH/YAt3rwkUrUnLyhmWLUKP5ieNZRg0qm
 kNdNo8D8n9R2YPuecucMDzRQFtXmJShV5ZlK9H/HNGiwobPWUtNqbcqJrRcV8qx3FZc5
 XjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j4ogsOSFG4OzrScvbxbe7jBVhjhSx+RjAMaVZdX0J/A=;
 b=NLbxFAd7q9PhlfLGFa2tJGyE54CoCVvv24kkeIfhHSk8jyrot3inSTs+qsTcPv+K7Y
 VspXYthy/98gCq8d5lXOiS8b8nkoqYkQAdlAJDhh3Pgc66zVfJF+LtPTCS8GgvwpZGac
 nXpb4w0T/7UWGEH6Sp2UCkA1pY14BZIk1hzWobBZTT9BhdwOt0+NIfFz6NYeZo0FWsbC
 h90YhJH410xW3l7Q0ubJ16yeg5N6URSM7e6jnMuMruxJCyZ8klLFzMJOUi9r87mfBDkT
 P4lyBMk6v4BT044XbL5d9S7PVbkdqTyC4x5lgHhvTPUcCfh6UF4Hn9V1UtSpgy5WrTIC
 MBTQ==
X-Gm-Message-State: AJIora+5kGmirsm5n0hJ8Lx/+op33iItv3U97R99g/+YyBvvR0a+nBBd
 CGx0haxqu+sPdb0aCkqow6iRS4F4qYliUQhUf7l8GGO6ekfjaY4w9FwWTzb6LuVSc9OnYAc9N03
 7iidYFTS3/UWZdX513RUKv/XOV+sC9A==
X-Received: by 2002:a05:622a:1387:b0:306:aafc:fd32 with SMTP id
 o7-20020a05622a138700b00306aafcfd32mr5032292qtk.462.1655406189054; 
 Thu, 16 Jun 2022 12:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVPQObmJEJQ0/+IZY+3bf9utwK7k0GLTzMhcMWx8VpQmJLGfrtA4nH1YIqK+kfscbERUtrAw==
X-Received: by 2002:a05:622a:1387:b0:306:aafc:fd32 with SMTP id
 o7-20020a05622a138700b00306aafcfd32mr5032258qtk.462.1655406188679; 
 Thu, 16 Jun 2022 12:03:08 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a05620a000500b006a74458410csm2583340qki.123.2022.06.16.12.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 12:03:08 -0700 (PDT)
Date: Thu, 16 Jun 2022 15:03:04 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Patrick Venture <venture@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>
Subject: Re: misaligned-pointer-use libslirp/src/tcp_input.c
Message-ID: <20220616190304.5bqkov2p2c6khbdc@mozz.bu.edu>
References: <CAO=notxhNUkps9_aLKmy=oDKYC8xsUjErrEMAycwJHjUvkWHRA@mail.gmail.com>
 <20220616133057.bq4m5rzc2tjpeqdn@mozz.bu.edu>
 <CAO=notzeN6OrcfjKNVJ9Q6ttbLv6s-zgiW3dGQTbn4eP6WHcsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notzeN6OrcfjKNVJ9Q6ttbLv6s-zgiW3dGQTbn4eP6WHcsQ@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.81; envelope-from=alxndr@bu.edu;
 helo=esa11.hc2706-39.iphmx.com
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

On 220616 0930, Patrick Venture wrote:
> On Thu, Jun 16, 2022 at 6:31 AM Alexander Bulekov <alxndr@bu.edu> wrote:
> 
> > Is this an --enable-sanitizers build? The virtual-device fuzzer catches
> >
> 
> Yeah - it should be reproducible with a sanitizers build from HEAD -- I can
> try to get a manual instance going again without automation to try and
> reproduce it.  We're testing on v7.0.0 which is when we started seeing
> this, I don't think we saw it in 6.2.0.

Here are a few reproducers (run with --enable-sanitizers):

This one complains about misalignments in ip_header, ipasfrag, qlink,
ip...

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M,slots=4,maxmem=0xffff000000000000 -machine q35 -nodefaults -device \
vmxnet3,netdev=net0 -netdev user,id=net0 -object \
memory-backend-ram,id=mem1,size=10M -device \
pc-dimm,id=nv1,memdev=mem1,addr=0xba19ff00000000 -object \
memory-backend-ram,id=mem2,size=10M -device \
pc-dimm,id=nv2,memdev=mem2,addr=0xbe53e14abaa00000 -object \
memory-backend-ram,id=mem3,size=10M -device \
pc-dimm,id=nv3,memdev=mem3,addr=0xfe0000e9cae00000 -object \
memory-backend-ram,id=mem4,size=10M -device \
pc-dimm,id=nv4,memdev=mem4,addr=0xf0f0f0f00000000 -qtest stdio
outl 0xcf8 0x80000810
outl 0xcfc 0xe0000000
outl 0xcf8 0x80000814
outl 0xcfc 0xe0001000
outl 0xcf8 0x80000804
outw 0xcfc 0x06
write 0x3e 0x1 0x02
write 0x39 0x1 0x20
write 0x29 0x1 0x10
write 0x2c 0x1 0x0f
write 0x2d 0x1 0x0f
write 0x2e 0x1 0x0f
write 0x2f 0x1 0x0f
write 0xf0f0f0f00001012 0x1 0xfe
write 0xf0f0f0f00001013 0x1 0xca
write 0xf0f0f0f00001014 0x1 0xe9
write 0xf0f0f0f00001017 0x1 0xfe
write 0xf0f0f0f0000103a 0x1 0x01
write 0xfe0000e9cafe0009 0x1 0x40
write 0xfe0000e9cafe0019 0x1 0x40
write 0x0 0x1 0xe1
write 0x1 0x1 0xfe
write 0x2 0x1 0xbe
write 0x3 0x1 0xba
writel 0xe0001020 0xcafe0000
write 0xfe0000e9cafe0029 0x1 0x40
write 0xfe0000e9cafe0039 0x1 0x40
write 0xfe0000e9cafe0049 0x1 0x40
write 0xfe0000e9cafe0059 0x1 0x40
write 0x1f65190b 0x1 0x08
write 0x1f65190d 0x1 0x46
write 0x1f65190e 0x1 0x03
write 0x1f651915 0x1 0x01
write 0xfe0000e9cafe0069 0x1 0x40
write 0xfe0000e9cafe0079 0x1 0x40
write 0xfe0000e9cafe0089 0x1 0x40
write 0xfe0000e9cafe0099 0x1 0x40
write 0xfe0000e9cafe009d 0x1 0x10
write 0xfe0000e9cafe00a0 0x1 0xff
write 0xfe0000e9cafe00a1 0x1 0x18
write 0xfe0000e9cafe00a2 0x1 0x65
write 0xfe0000e9cafe00a3 0x1 0x1f
write 0xfe0000e9cafe00a9 0x1 0x40
write 0xfe0000e9cafe00ad 0x1 0x1c
write 0xe0000602 0x1 0x00
EOF

This one complains about misalignments in ip6_header, ip6_hdrctl...

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M,slots=1,maxmem=0xffff000000000000 -machine q35 -nodefaults -device \
vmxnet3,netdev=net0 -netdev user,id=net0 -object \
memory-backend-ram,id=mem1,size=4M -device \
pc-dimm,id=nv1,memdev=mem1,addr=0x1dd860000000000 -qtest stdio
outl 0xcf8 0x80000810
outl 0xcfc 0xe0000000
outl 0xcf8 0x80000814
outl 0xcfc 0xe0001000
outl 0xcf8 0x80000804
outw 0xcfc 0x06
write 0x0 0x1 0xe1
write 0x1 0x1 0xfe
write 0x2 0x1 0xbe
write 0x3 0x1 0xba
write 0x3e 0x1 0x01
write 0x39 0x1 0x01
write 0x28 0x1 0x01
write 0x29 0x1 0x01
write 0x2d 0x1 0x86
write 0x2e 0x1 0xdd
write 0x2f 0x1 0x01
write 0x1dd860000000112 0x1 0x10
write 0x1dd86000000013c 0x1 0x02
writel 0xe0001020 0xcafe0000
write 0x1009 0x1 0x40
write 0x100c 0x1 0x86
write 0x100d 0x1 0xdd
write 0x1011 0x1 0x10
write 0x1019 0x1 0x7e
write 0x101d 0x1 0x10
write 0x4d56 0x1 0x02
write 0xe0000603 0x1 0x00
EOF

-Alex

> 
> 
> > these periodically while fuzzing network-devices. However I don't think
> > OSS-Fuzz creates reports for them for some reason. I can create qtest
> > reproducers, if that is useful.
> > -Alex
> >
> > On 220615 0942, Patrick Venture wrote:
> > > Hey - I wanted to ask if someone else has seen this or has suggestions on
> > > how to fix it in libslirp / qemu.
> > >
> > > libslirp version: 3ad1710a96678fe79066b1469cead4058713a1d9
> > >
> > > The blow is line:
> > >
> > https://gitlab.freedesktop.org/slirp/libslirp/-/blob/master/src/tcp_input.c#L310
> > >
> > > I0614 13:44:44.304087    2040 bytestream.cc:22] QEMU:
> > > third_party/libslirp/src/tcp_input.c:310:56: runtime error: member access
> > > within misaligned address 0xffff9a4000f4 for type 'struct qlink', which
> > > requires 8 byte alignment
> > > I0614 13:44:44.304156    2040 bytestream.cc:22] QEMU: 0xffff9a4000f4:
> > note:
> > > pointer points here
> > > I0614 13:44:44.304184    2040 bytestream.cc:22] QEMU:   00 00 00 00 00 00
> > > 00 02  20 02 0a 00 00 01 42 01  0a 00 02 02 42 01 0a 00  00 01 86 dd 60
> > 02
> > > dd 79
> > > I0614 13:44:44.304204    2040 bytestream.cc:22] QEMU:               ^
> > > I0614 13:44:44.641173    2040 bytestream.cc:22] QEMU:     #0
> > 0xaaaacbe34bd8
> > > in tcp_input third_party/libslirp/src/tcp_input.c:310:56
> > > I0614 13:44:44.641239    2040 bytestream.cc:22] QEMU:     #1
> > 0xaaaacbe22a94
> > > in ip6_input third_party/libslirp/src/ip6_input.c:74:9
> > > I0614 13:44:44.641262    2040 bytestream.cc:22] QEMU:     #2
> > 0xaaaacbe0bbbc
> > > in slirp_input third_party/libslirp/src/slirp.c:1169:13
> > > I0614 13:44:44.641280    2040 bytestream.cc:22] QEMU:     #3
> > 0xaaaacbd55f6c
> > > in net_slirp_receive third_party/qemu/net/slirp.c:136:5
> > > I0614 13:44:44.641296    2040 bytestream.cc:22] QEMU:     #4
> > 0xaaaacbd4e77c
> > > in nc_sendv_compat third_party/qemu/net/net.c
> > > I0614 13:44:44.641323    2040 bytestream.cc:22] QEMU:     #5
> > 0xaaaacbd4e77c
> > > in qemu_deliver_packet_iov third_party/qemu/net/net.c:850:15
> > > I0614 13:44:44.641342    2040 bytestream.cc:22] QEMU:     #6
> > 0xaaaacbd50bfc
> > > in qemu_net_queue_deliver_iov third_party/qemu/net/queue.c:179:11
> > > I0614 13:44:44.641359    2040 bytestream.cc:22] QEMU:     #7
> > 0xaaaacbd50bfc
> > > in qemu_net_queue_send_iov third_party/qemu/net/queue.c:246:11
> > > I0614 13:44:44.641382    2040 bytestream.cc:22] QEMU:     #8
> > 0xaaaacbd4a88c
> > > in qemu_sendv_packet_async third_party/qemu/net/net.c:891:12
> > > I0614 13:44:44.641396    2040 bytestream.cc:22] QEMU:     #9
> > 0xaaaacacb1de0
> > > in virtio_net_flush_tx third_party/qemu/hw/net/virtio-net.c:2586:15
> > > I0614 13:44:44.641416    2040 bytestream.cc:22] QEMU:     #10
> > > 0xaaaacacb1580 in virtio_net_tx_bh
> > > third_party/qemu/hw/net/virtio-net.c:2703:11
> > > I0614 13:44:44.641438    2040 bytestream.cc:22] QEMU:     #11
> > > 0xaaaacc2bcf64 in aio_bh_call third_party/qemu/util/async.c:142:5
> > > I0614 13:44:44.641463    2040 bytestream.cc:22] QEMU:     #12
> > > 0xaaaacc2bcf64 in aio_bh_poll third_party/qemu/util/async.c:170:13
> > > I0614 13:44:44.641477    2040 bytestream.cc:22] QEMU:     #13
> > > 0xaaaacc2b8f70 in aio_dispatch third_party/qemu/util/aio-posix.c:420:5
> > > I0614 13:44:44.641495    2040 bytestream.cc:22] QEMU:     #14
> > > 0xaaaacc2bf120 in aio_ctx_dispatch third_party/qemu/util/async.c:312:5
> > > I0614 13:44:44.641510    2040 bytestream.cc:22] QEMU:     #15
> > > 0xaaaacc3a7690 in g_main_dispatch third_party/glib/glib/gmain.c:3417:27
> > > I0614 13:44:44.641525    2040 bytestream.cc:22] QEMU:     #16
> > > 0xaaaacc3a7690 in g_main_context_dispatch
> > > third_party/glib/glib/gmain.c:4135:7
> > > I0614 13:44:44.641546    2040 bytestream.cc:22] QEMU:     #17
> > > 0xaaaacc2de3ec in glib_pollfds_poll
> > third_party/qemu/util/main-loop.c:232:9
> > > I0614 13:44:44.641562    2040 bytestream.cc:22] QEMU:     #18
> > > 0xaaaacc2de3ec in os_host_main_loop_wait
> > > third_party/qemu/util/main-loop.c:255:5
> > > I0614 13:44:44.641580    2040 bytestream.cc:22] QEMU:     #19
> > > 0xaaaacc2de3ec in main_loop_wait third_party/qemu/util/main-loop.c:531:11
> > > I0614 13:44:44.641598    2040 bytestream.cc:22] QEMU:     #20
> > > 0xaaaacbd82798 in qemu_main_loop
> > third_party/qemu/softmmu/runstate.c:727:9
> > > I0614 13:44:44.641612    2040 bytestream.cc:22] QEMU:     #21
> > > 0xaaaacadacb5c in main
> > >
> > > Patrick
> >

