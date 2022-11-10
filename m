Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D162465E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 16:52:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot9pl-0006nF-MW; Thu, 10 Nov 2022 10:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ot9pj-0006mc-72
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 10:51:15 -0500
Received: from esa10.hc2706-39.iphmx.com ([216.71.140.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ot9pf-0007jD-P6
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 10:51:14 -0500
X-IronPort-RemoteIP: 209.85.160.200
X-IronPort-MID: 238577202
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8dKTgaB/LPulyBVW/5fhw5YqxClBgxIJ4kV8jS/XYbTApDJ2hDMHy
 zQYWDuEaPuCN2SjfNsnPo7goEMP78LSxtViTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH2dOCk9SMnvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYctitWia++3k
 YqaT/b3ZRn0hVaYDkpOs/jZ8Uo25Kyp0N8llgdWic5j7Qe2e0Y9Ucp3yZGZdxPQXoRSF+imc
 OfPpJnRErTxpkpF5nuNy94XQ2VTKlLgFVHmZkl+AsBOtiN/Shkaic7XAha9hXB/0F1ll/gpo
 DlEWAfZpQ0BZ8Ugk8xEO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFO2zeRyV2snO7cS2fQrC1MN8
 9YAFzQ0O0Xra+KemNpXS8Fpj8UnadD3ZcYR4Ck4iz7eCvkiTNbIRKCiCd1whm9hwJATW6+AP
 4xDMWIHgBfoOnWjPn8eDII4kP2AjGS5fjFFwL6QjfBsszWMk1YpitABNvLbe+GRbJxNnnynh
 UTa+VXEPzMYHoe2nG/tHnWEw7WncTnAcJsfEaD9+vN0jVm7wGsVBxsLE1yhrpGEZlWWXtteL
 wkN5nNro/JqrAqkSd7yWxD+q3mB1vIBZ+dt/yQBwFnl4sLpD8yxWgDokhYphAQaifIL
IronPort-HdrOrdr: A9a23:9Dub2613qqP6vU33Wo0/8gqjBLAkLtp133Aq2lEZdPU1SL36qy
 nKpp8mPHDP4gr5NEtMpTn4AtjlfZqEz+8T3WBzB9eftWvd1ldARbsKhbcKpQeNJ8SUzI9gPM
 lbHJSX3LXLfD1HZKvBkWuFL+o=
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Nov 2022 10:50:56 -0500
Received: by mail-qt1-f200.google.com with SMTP id
 cd6-20020a05622a418600b003a54cb17ad9so1671324qtb.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 07:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Gv1H+hlBN2rnHt8gN9WGkob+w8oC/e7TY6VK+CAESpo=;
 b=LRYl4vv+yvDj0lMy7DBalvKezCxxqD2UPwmLlIay9GZVvU3mebajl8gENl2vylEv92
 o1YAk7Zo1hCwgQFrXI8bmoDpM2pRin/JvpKEoW521YE8/3ssMpF5j5NmBQ5NSqzWQb3j
 /usDD+kOw3fBYRnyYqbAVEwfBo78UKAfX6PyHCVUVCf9rGZ+PQgjSXD8A8Ih51/yQjS4
 nu+9k6y9ZNPc73Q4OoC+WcJ1C4d0JaK6EpofvVO+sYzSaEPNuDUdyq9BHgUWgWB4Ahjs
 7WzP2AsOTiscNgw5wldMwlB/KLNBrglWKEifIcQuZf5/6f6pqy1eAdx7/xSBsGc7VAs+
 63yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gv1H+hlBN2rnHt8gN9WGkob+w8oC/e7TY6VK+CAESpo=;
 b=euBn5uIKtURQgw/TbKzNlreO/CfQq3ry+kUFfU/JjnHX/GvbeK1l/GzJYwYYyMArvC
 4nJ1dN2GRoy1peDd5aFxiFTJ1+Is/TIp/ZnFmIKqUtOs8WTj2rcbntZZaMmosuyT4nMT
 Ysoo9SOOY/fC0lriRP4X8xdFU4jWdCvGWRX3Lrm4/phvo7f4iPVP+VhfhWuKdvQGkL4d
 gEKkyk3pR3amUicTA69TTpxAqFZHzulUjLalDmHd4B7ZWiUcr7rS7sfoZcMvTaWcneA7
 2X3+f8GG5IqyU55RCpCD9UpeVodF3QDmDD7V8Mcj8ui96hyhCAq031GIhPMm7ppKOZ+q
 uHJA==
X-Gm-Message-State: ACrzQf327tCqUZ2hzFEqjaxkuTz+t6jsQM1/sox0vm3lDKHVtGA3o51a
 QEK1TDHiG7yF4z7VrjIpIZaGgrE0fxabbcNbgdh5Me0FFS5Oh8mMB7Fdglt/ARW/wEOdzHuAaHA
 e+AwcLCDICk1yk/cum10N5+a/v2Z4tw==
X-Received: by 2002:a05:6214:19cb:b0:4bb:6a28:83bc with SMTP id
 j11-20020a05621419cb00b004bb6a2883bcmr60943159qvc.102.1668095455843; 
 Thu, 10 Nov 2022 07:50:55 -0800 (PST)
X-Google-Smtp-Source: AMsMyM46lZUGpXM6XNE5iVU/vx4YDNaPwTEezLqRDV2DJsZSJd5gtWz5bDngq+kImgSnwAlGpWLakA==
X-Received: by 2002:a05:6214:19cb:b0:4bb:6a28:83bc with SMTP id
 j11-20020a05621419cb00b004bb6a2883bcmr60943145qvc.102.1668095455445; 
 Thu, 10 Nov 2022 07:50:55 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a05622a145400b0035cd6a4ba3csm11648248qtx.39.2022.11.10.07.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 07:50:55 -0800 (PST)
Date: Thu, 10 Nov 2022 10:50:24 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: QEMU | Heap-overflow in virtio_net_queue_enable (#1309)
Message-ID: <20221110155024.xeyhacjpup4b67op@mozz.bu.edu>
References: <20221110000943-mutt-send-email-mst@kernel.org>
 <1668063187.9843538-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1668063187.9843538-1-xuanzhuo@linux.alibaba.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.198; envelope-from=alxndr@bu.edu;
 helo=esa10.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 221110 1453, Xuan Zhuo wrote:
> On Thu, 10 Nov 2022 00:11:00 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > Xuan Zhuo pls take a look ASAP.
> >
> > On Thu, Nov 10, 2022 at 03:04:41AM +0000, Alexander Bulekov (@a1xndr) wrote:
> > Alexander Bulekov created an issue: #1309
> >
> > Hello,
> >
> > I bisected this to 7f863302 ("virtio-net: support queue_enable"). CC:
> > @mstredhat @jasowang (could not find Kangjie Xu or Xuan Zhuo gitlab accounts).
> >
> >  Reproducer
> >
> > cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
> > 512M -M q35 -nodefaults -device virtio-net,netdev=net0 -netdev \
> > user,id=net0 -qtest stdio
> > outl 0xcf8 0x80000810
> > outl 0xcfc 0xc000
> > outl 0xcf8 0x80000804
> > outl 0xcfc 0x01
> > outl 0xc00d 0x0200
> > outl 0xcf8 0x80000890
> > outb 0xcfc 0x4
> > outl 0xcf8 0x80000889
> > outl 0xcfc 0x1c000000
> > outl 0xcf8 0x80000893
> > outw 0xcfc 0x100
> > EOF
> 
> 
> Hi, I don't reproduce this problem, need valgrind?

It should work in a build with --enable-sanitizers
-Alex

> 
> 
> Thanks.
> 
> 
> 	sudo sh test.sh
> 	[I 0.000000] OPENED
> 	[R +0.014069] outl 0xcf8 0x80000810
> 	[S +0.014089] OK
> 	OK
> 	[R +0.014100] outl 0xcfc 0xc000
> 	[S +0.014113] OK
> 	OK
> 	[R +0.014117] outl 0xcf8 0x80000804
> 	[S +0.014125] OK
> 	OK
> 	[R +0.014133] outl 0xcfc 0x01
> 	[S +0.014210] OK
> 	OK
> 	[R +0.014215] outl 0xc00d 0x0200
> 	[S +0.014222] OK
> 	OK
> 	[R +0.014226] outl 0xcf8 0x80000890
> 	[S +0.014233] OK
> 	OK
> 	[R +0.014240] outb 0xcfc 0x4
> 	[S +0.014247] OK
> 	OK
> 	[R +0.014252] outl 0xcf8 0x80000889
> 	[S +0.014259] OK
> 	OK
> 	[R +0.014266] outl 0xcfc 0x1c000000
> 	[S +0.014275] OK
> 	OK
> 	[R +0.014279] outl 0xcf8 0x80000893
> 	[S +0.014288] OK
> 	OK
> 	[R +0.014292] outw 0xcfc 0x100
> 	[S +0.014304] OK
> 	OK
> 	[I +0.014319] CLOSED
> 
> 
> 
> 
> 
> 	^Cqemu-system-i386: GLib: g_timer_elapsed: assertion 'timer != NULL' failed
> 	[I +0.000000] CLOSED
> 
> 
> >
> >  Stack-Trace
> >
> > ==3742222==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61400001a9f8 at pc 0x55db851032b1 bp 0x7ffe639914c0 sp 0x7ffe639914b8
> > READ of size 8 at 0x61400001a9f8 thread T0
> >     #0 0x55db851032b0 in virtio_net_queue_enable /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/net/virtio-net.c:572:14
> >     #1 0x55db85361748 in memory_region_write_accessor /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c:493:5
> >     #2 0x55db8536129a in access_with_adjusted_size /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c:555:18
> >     #3 0x55db85360c03 in memory_region_dispatch_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c
> >     #4 0x55db8485e11f in virtio_address_space_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/virtio/virtio-pci.c:592:5
> >     #5 0x55db8485e11f in virtio_write_config /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/virtio/virtio-pci.c:670:13
> >     #6 0x55db844de82a in pci_host_config_write_common /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/pci/pci_host.c:85:5
> >     #7 0x55db85361748 in memory_region_write_accessor /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c:493:5
> >     #8 0x55db8536129a in access_with_adjusted_size /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c:555:18
> >     #9 0x55db85360c03 in memory_region_dispatch_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/memory.c
> >     #10 0x55db853ad390 in flatview_write_continue /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/physmem.c:2825:23
> >     #11 0x55db853a4833 in flatview_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/physmem.c:2867:12
> >     #12 0x55db853a4543 in address_space_write /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/physmem.c:2963:18
> >     #13 0x55db85354567 in cpu_outw /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/ioport.c:70:5
> >     #14 0x55db853b8129 in qtest_process_command /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/qtest.c:480:13
> >     #15 0x55db853b6cb8 in qtest_process_inbuf /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/qtest.c:802:9
> >     #16 0x55db85a3e284 in fd_chr_read /home/alxndr/Development/qemu-demo/qemu/build-asan/../chardev/char-fd.c:72:9
> >     #17 0x7f7f528c8a9e in g_main_context_dispatch (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x53a9e) (BuildId: 1697a734f1bc7448cd8772689a1c439343f062f7)
> >     #18 0x55db85cc1f33 in glib_pollfds_poll /home/alxndr/Development/qemu-demo/qemu/build-asan/../util/main-loop.c:297:9
> >     #19 0x55db85cc1f33 in os_host_main_loop_wait /home/alxndr/Development/qemu-demo/qemu/build-asan/../util/main-loop.c:320:5
> >     #20 0x55db85cc1f33 in main_loop_wait /home/alxndr/Development/qemu-demo/qemu/build-asan/../util/main-loop.c:606:11
> >     #21 0x55db849163a6 in qemu_main_loop /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/runstate.c:739:9
> >     #22 0x55db83d54105 in qemu_default_main /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/main.c:37:14
> >     #23 0x7f7f520c6209 in __libc_start_call_main csu/../sysdeps/nptl/libc_start_call_main.h:58:16
> >     #24 0x7f7f520c62bb in __libc_start_main csu/../csu/libc-start.c:389:3
> >     #25 0x55db83c93ef0 in _start (/home/alxndr/Development/qemu-demo/qemu/build-asan/qemu-system-i386+0x1f9cef0) (BuildId: 574fb9ebea37c72f33a18ee7cda64eaf34590574)
> >
> > 0x61400001a9f8 is located 32 bytes to the right of 408-byte region [0x61400001a840,0x61400001a9d8)
> > allocated by thread T0 here:
> >     #0 0x55db83d16f28 in __interceptor_calloc (/home/alxndr/Development/qemu-demo/qemu/build-asan/qemu-system-i386+0x201ff28) (BuildId: 574fb9ebea37c72f33a18ee7cda64eaf34590574)
> >     #1 0x7f7f528ceb30 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x59b30) (BuildId: 1697a734f1bc7448cd8772689a1c439343f062f7)
> >     #2 0x55db850f8d11 in virtio_net_device_realize /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/net/virtio-net.c:3621:18
> >     #3 0x55db85250321 in virtio_device_realize /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/virtio/virtio.c:4168:9
> >     #4 0x55db85658931 in device_set_realized /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/core/qdev.c:566:13
> >     #5 0x55db85679238 in property_set_bool /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/object.c:2285:5
> >     #6 0x55db8567442c in object_property_set /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/object.c:1420:5
> >     #7 0x55db8568012c in object_property_set_qobject /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/qom-qobject.c:28:10
> >     #8 0x55db844cef9a in pci_qdev_realize /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/pci/pci.c:2218:9
> >     #9 0x55db85658931 in device_set_realized /home/alxndr/Development/qemu-demo/qemu/build-asan/../hw/core/qdev.c:566:13
> >     #10 0x55db85679238 in property_set_bool /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/object.c:2285:5
> >     #11 0x55db8567442c in object_property_set /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/object.c:1420:5
> >     #12 0x55db8568012c in object_property_set_qobject /home/alxndr/Development/qemu-demo/qemu/build-asan/../qom/qom-qobject.c:28:10
> >     #13 0x55db8490f344 in qdev_device_add /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/qdev-monitor.c:733:11
> >     #14 0x55db849172b2 in qemu_create_cli_devices /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/vl.c:2536:5
> >     #15 0x55db849172b2 in qmp_x_exit_preconfig /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/vl.c:2604:5
> >     #16 0x55db8491db5f in qemu_init /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/vl.c:3601:9
> >     #17 0x55db83d54125 in main /home/alxndr/Development/qemu-demo/qemu/build-asan/../softmmu/main.c:47:5
> >
> > OSS-Fuzz Report: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53186
> >
> > libqtest Reproducer: repro.c
> >
> > Thank you
> >
> > —
> > Reply to this email directly or view it on GitLab.
> > You're receiving this email because you have been mentioned on gitlab.com.
> > Unsubscribe from this thread · Manage all notifications · Help
> >
> 

