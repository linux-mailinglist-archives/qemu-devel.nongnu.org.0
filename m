Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6B06CD6B2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 11:43:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phSJ5-0003PF-Aw; Wed, 29 Mar 2023 05:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1phSJ3-0003P6-PE
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 05:41:25 -0400
Received: from esa12.hc2706-39.iphmx.com ([216.71.137.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1phSJ0-0004Kz-Ee
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 05:41:25 -0400
X-IronPort-RemoteIP: 209.85.160.199
X-IronPort-MID: 268402176
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iAO2o6INC3t4PhWhFE+Rb5clxSXFcZb7ZxGr2PjKsXjdYENS1mYDx
 mQYDGuHa66NNGT8Ktx+PYyxpx5VucTVm9RjQVZorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8kWo4ow/jb8kg3566j4GpwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj69V3A0gwDd1Iwd1mPlMV3
 MIUEhNdYh/W0opawJrjIgVtrsEqLc2uJZ9G/385nGCfAvEhTpTOBa7N4Le03h9q3pEITauYP
 pRBL2M+PXwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTaDkFQrieezWDbTUvjQX+9ukkq7n
 EfXzkDJXiAFPuWa+RPQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMy9O08rR36CNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdJtKdQLTKbPMLeAE=
IronPort-HdrOrdr: A9a23:QC7/PKqrflgZgFNcdHJw7TcaV5rneYIsimQD101hICG9vPbo8P
 xGuM5rqCMc7wxhJE3I+OrwQpVoJEm3yXcb2/hyAV7PZniChILsFvAc0WKA+UyaJ8SdzJ8l6U
 4IScEXY6ySMbE5t7eD3ODRKbYdKbK8gcaVbInlvhNQZDAvQY1bqylCNianPntfeDRmbKBJaq
 Z0JfAqm9NjQxkqhwiAaEXtltKtxuH2qA==
Received: from mail-qt1-f199.google.com ([209.85.160.199])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 05:41:17 -0400
Received: by mail-qt1-f199.google.com with SMTP id
 w13-20020ac857cd000000b003e37d3e6de2so9914528qta.16
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 02:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1680082876;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RYQPMO0vT5/0rFBdx+/7E542GIwptNUOaE6HBkhYvsU=;
 b=Gz5/PDQz2T2OMppRPqLraD12ur1BiTt/Lt7kNw4qfGb+IYLDej6atR0Ayw8q2cLt/y
 oQRjTNyAottFj4TP+greN7gN/sC3xPQ1vMrTRDp6LNN+blTLKOY/3SNzm+enI9UnY07Z
 BN+iEsH2M8B7N9NG0fv2qj00gpAKSkq93J9tb+y8T83S6061BiZoD7zkmOZxLG0nCA6m
 vvgP1EV/AVAizbLm4RKWnXBefbOJ+POBJAkmxSNy7Hs4E53Em5UEXGSw7LLmktDIBLAw
 6Cw+x8klUgTy5b6M1omZ/ypjBcRFaeqYAXkq0e4l5E2yh99OLKLFpqZlZGbdjtQQ2mpk
 S+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680082876;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RYQPMO0vT5/0rFBdx+/7E542GIwptNUOaE6HBkhYvsU=;
 b=CLRtcWVT/fEe/4el8pi6PMUrZwsDDl/ubu+NvL2oJ3xn0YZ4AVaWXpRVRnqs8/s/2x
 AtlaVsOxDNTr164WDWnseCtEPJYFBsmWfslRAM1dPU2L4U5ZCBufiH6pQn+tydrJSv0S
 Bpl5zJ1ZU4WP/aAZJKkSL9zVECGofVAjeDtGz/lcWFFgOoFDg4wIoNB9WvN5JJVHsfcS
 PX8DYSw3KriR1JOL5h+w5M8SEzvsIAIVrw1G94xQ49COXtZPAZy9n6KmkJZykbvAzApD
 msy9l5s5f7nnhaC1VNdid71PVRF61jHq0gwTrBiFRd9sjV91gThqV8Izitc4KZKpsxnN
 TYTg==
X-Gm-Message-State: AO0yUKVyTchYFoQetDJsRApYhUkS88Z/PndXjdQPwcDeR7MJCUZNWENE
 7fsduLTgLUeDLOTfcoy1lIEF6oYfl65ztu0Y4tOgm5S3aWg2K5tU28PlmSIsMBWRVmTbwZsdsYf
 NnfliCLllmlmc1u88vOHQHSYHQBgXnw==
X-Received: by 2002:ac8:5dd1:0:b0:3d4:46c1:327c with SMTP id
 e17-20020ac85dd1000000b003d446c1327cmr23902683qtx.25.1680082875848; 
 Wed, 29 Mar 2023 02:41:15 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Metid/d7F+Wdh7z76A7vKryltc4/z9RzP/biJn6WmhiNziUoStBODZfPA+OLRWzt5FzgQCg==
X-Received: by 2002:ac8:5dd1:0:b0:3d4:46c1:327c with SMTP id
 e17-20020ac85dd1000000b003d446c1327cmr23902666qtx.25.1680082875371; 
 Wed, 29 Mar 2023 02:41:15 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 n191-20020a3740c8000000b007487c780f5esm1630309qka.121.2023.03.29.02.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 02:41:14 -0700 (PDT)
Date: Wed, 29 Mar 2023 05:41:10 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, kraxel@redhat.com,
 "ningqiang (A)" <ningqiang1@huawei.com>, soul chen <soulchen8650@gmail.com>
Subject: Re: [PATCH] usb/dev-wacom: fix OOB write in usb_mouse_poll()
Message-ID: <20230329094110.wq5z2f7r7flbfihz@mozz.bu.edu>
References: <20230213174113.591632-1-mcascell@redhat.com>
 <b04ebfac-c434-8045-1b6f-6201686130b9@linaro.org>
 <CAA8xKjUx5Ze5b+-JZdpfagUMEbBderndUvenLHhyCL92LyebPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8xKjUx5Ze5b+-JZdpfagUMEbBderndUvenLHhyCL92LyebPQ@mail.gmail.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.82; envelope-from=alxndr@bu.edu;
 helo=esa12.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
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

On 230214 1148, Mauro Matteo Cascella wrote:
> Hi Philippe,
> 
> On Mon, Feb 13, 2023 at 7:26 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
> >
> > Hi Mauro,
> >
> > On 13/2/23 18:41, Mauro Matteo Cascella wrote:
> > > The guest can control the size of buf; an OOB write occurs when buf is 1 or 2
> > > bytes long. Only fill in the buffer as long as there is enough space, throw
> > > away any data which doesn't fit.
> >
> > Any reproducer?
> 
> No qtest reproducer, we do have a PoC module to compile & load from
> within the guest. This is ASAN output:

OSS-Fuzz reported something that looks similar. Issue 57504.

Stack-Trace:
==1038012==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address 0x000000000000 (pc 0x55dc41bec541 bp 0x7ffdd50a33b0 sp 0x7ffdd50a3350 T1038012)
==1038012==The signal is caused by a WRITE memory access.
==1038012==Hint: address points to the zero page.
#0 0x55dc41bec541 in usb_mouse_poll /home/alxndr/Development/qemu/build/../hw/usb/dev-wacom.c:255:12
#1 0x55dc41bec013 in usb_wacom_handle_data /home/alxndr/Development/qemu/build/../hw/usb/dev-wacom.c:386:23
#2 0x55dc41b93ae9 in usb_device_handle_data /home/alxndr/Development/qemu/build/../hw/usb/bus.c:180:9
#3 0x55dc41b9a004 in usb_process_one /home/alxndr/Development/qemu/build/../hw/usb/core.c:406:9
#4 0x55dc41b999cf in usb_handle_packet /home/alxndr/Development/qemu/build/../hw/usb/core.c:438:9
#5 0x55dc41bd6645 in xhci_submit /home/alxndr/Development/qemu/build/../hw/usb/hcd-xhci.c:1831:5
#6 0x55dc41bd325b in xhci_fire_transfer /home/alxndr/Development/qemu/build/../hw/usb/hcd-xhci.c:1840:12
#7 0x55dc41bd0ef3 in xhci_kick_epctx /home/alxndr/Development/qemu/build/../hw/usb/hcd-xhci.c:1999:13
#8 0x55dc41bd8635 in xhci_kick_ep /home/alxndr/Development/qemu/build/../hw/usb/hcd-xhci.c:1865:5
#9 0x55dc41bdca04 in xhci_doorbell_write /home/alxndr/Development/qemu/build/../hw/usb/hcd-xhci.c:3171:13
#10 0x55dc41f4c75a in memory_region_write_accessor /home/alxndr/Development/qemu/build/../softmmu/memory.c:493:5
#11 0x55dc41f4c60f in access_with_adjusted_size /home/alxndr/Development/qemu/build/../softmmu/memory.c:555:18
#12 0x55dc41f4c1f8 in memory_region_dispatch_write /home/alxndr/Development/qemu/build/../softmmu/memory.c:1515:16
#13 0x55dc41f63932 in flatview_write_continue /home/alxndr/Development/qemu/build/../softmmu/physmem.c:2826:23
#14 0x55dc41f60577 in flatview_write /home/alxndr/Development/qemu/build/../softmmu/physmem.c:2868:12
#15 0x55dc41f60497 in address_space_write /home/alxndr/Development/qemu/build/../softmmu/physmem.c:2964:18

Here's the QTest Reproducer:

cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
512M -machine q35 -nodefaults -drive \
file=null-co://,if=none,format=raw,id=disk0 -device qemu-xhci,id=xhci \
-device usb-tablet,bus=xhci.0 -device usb-bot -device \
usb-storage,drive=disk0 -chardev null,id=cd0 -chardev null,id=cd1 \
-device usb-braille,chardev=cd0 -device usb-ccid -device usb-ccid \
-device usb-kbd -device usb-mouse -device usb-serial,chardev=cd1 -device\
 usb-tablet -device usb-wacom-tablet -device usb-audio -qtest stdio
outl 0xcf8 0x80000810
outl 0xcfc 0xe0000000
outl 0xcf8 0x80000804
outw 0xcfc 0x06
writel 0xe0000040 0x1
write 0x3d 0x1 0x04
write 0x5d 0x1 0x04
write 0x6d 0x1 0x04
write 0x7d 0x1 0x04
write 0x8d 0x1 0x04
write 0x9d 0x1 0x04
write 0xad 0x1 0x04
write 0xbd 0x1 0x04
write 0xcd 0x1 0x04
write 0xdd 0x1 0x04
write 0xed 0x1 0x04
write 0xfd 0x1 0x04
write 0x10d 0x1 0x04
write 0x11d 0x1 0x04
write 0x12d 0x1 0x04
write 0x13d 0x1 0x04
write 0x14d 0x1 0x04
write 0x15d 0x1 0x04
write 0x16d 0x1 0x04
write 0x17d 0x1 0x04
write 0x18d 0x1 0x04
write 0x19d 0x1 0x04
write 0x1ad 0x1 0x04
write 0x1bd 0x1 0x04
write 0x1cd 0x1 0x04
write 0x1dd 0x1 0x04
write 0x1ed 0x1 0x04
write 0x1fd 0x1 0x04
write 0x20d 0x1 0x04
write 0x21d 0x1 0x04
write 0x22d 0x1 0x04
write 0x23d 0x1 0x04
write 0x24d 0x1 0x04
write 0x25d 0x1 0x04
write 0x26d 0x1 0x04
write 0x27d 0x1 0x04
write 0x28d 0x1 0x04
write 0x29d 0x1 0x04
write 0x2ad 0x1 0x04
write 0x2bd 0x1 0x04
write 0x2cd 0x1 0x04
write 0x2dd 0x1 0x04
write 0x2ed 0x1 0x04
write 0x2fd 0x1 0x04
write 0x30d 0x1 0x04
write 0x31d 0x1 0x04
write 0x32d 0x1 0x04
write 0x33d 0x1 0x04
write 0x34d 0x1 0x04
write 0x35d 0x1 0x04
write 0x36d 0x1 0x04
write 0x37d 0x1 0x04
write 0x38d 0x1 0x04
write 0x39d 0x1 0x04
write 0x3ad 0x1 0x04
write 0x3bd 0x1 0x04
write 0x3cd 0x1 0x04
write 0x3dd 0x1 0x04
write 0x3ed 0x1 0x04
write 0x3fd 0x1 0x04
write 0x40d 0x1 0x04
write 0x41d 0x1 0x04
write 0x42d 0x1 0x04
write 0x43d 0x1 0x04
write 0x44d 0x1 0x04
write 0x45d 0x1 0x04
write 0x46d 0x1 0x04
write 0x47d 0x1 0x04
write 0x48d 0x1 0x04
write 0x49d 0x1 0x04
write 0x4ad 0x1 0x04
write 0x4bd 0x1 0x04
write 0x4cd 0x1 0x04
write 0x4dd 0x1 0x04
write 0x4ed 0x1 0x04
write 0x4fd 0x1 0x04
write 0x50d 0x1 0x04
write 0x51d 0x1 0x04
write 0x52d 0x1 0x04
write 0x53d 0x1 0x04
write 0x54d 0x1 0x04
write 0x55d 0x1 0x04
write 0x56d 0x1 0x04
write 0x57d 0x1 0x04
write 0x58d 0x1 0x04
write 0x59d 0x1 0x04
write 0x5ad 0x1 0x04
write 0x5bd 0x1 0x04
write 0x5cd 0x1 0x04
write 0x5dd 0x1 0x04
write 0x5ed 0x1 0x04
write 0x5fd 0x1 0x04
write 0x60d 0x1 0x04
write 0x61d 0x1 0x04
write 0x62d 0x1 0x04
write 0x63d 0x1 0x04
write 0x64d 0x1 0x04
write 0x65d 0x1 0x04
write 0x66d 0x1 0x04
write 0x67d 0x1 0x04
write 0x68d 0x1 0x04
write 0x69d 0x1 0x04
write 0x6ad 0x1 0x04
write 0x6bd 0x1 0x04
write 0x6cd 0x1 0x04
write 0x6dd 0x1 0x04
write 0x6ed 0x1 0x04
write 0x6fd 0x1 0x04
write 0x70d 0x1 0x04
write 0x71d 0x1 0x04
write 0x72d 0x1 0x04
write 0x73d 0x1 0x04
write 0x74d 0x1 0x04
write 0x75d 0x1 0x04
write 0x76d 0x1 0x04
write 0x77d 0x1 0x04
write 0x78d 0x1 0x04
write 0x79d 0x1 0x04
write 0x7ad 0x1 0x04
write 0x7bd 0x1 0x04
write 0x7cd 0x1 0x04
write 0x7dd 0x1 0x04
write 0x7ed 0x1 0x04
write 0x7fd 0x1 0x04
write 0x80d 0x1 0x04
write 0x81d 0x1 0x04
write 0x82d 0x1 0x04
write 0x83d 0x1 0x04
write 0x84d 0x1 0x04
write 0x85d 0x1 0x04
write 0x86d 0x1 0x04
write 0x87d 0x1 0x04
write 0x88d 0x1 0x04
write 0x89d 0x1 0x04
write 0x8ad 0x1 0x04
write 0x8bd 0x1 0x04
write 0x8cd 0x1 0x04
write 0x8dd 0x1 0x04
write 0x8ed 0x1 0x04
write 0x8fd 0x1 0x04
write 0x90d 0x1 0x04
write 0x91d 0x1 0x04
write 0x92d 0x1 0x04
write 0x93d 0x1 0x04
write 0x94d 0x1 0x04
write 0x95d 0x1 0x04
write 0x96d 0x1 0x04
write 0x97d 0x1 0x04
write 0x98d 0x1 0x04
write 0x99d 0x1 0x04
write 0x9ad 0x1 0x04
write 0x9bd 0x1 0x04
write 0x9cd 0x1 0x04
write 0x9dd 0x1 0x04
write 0x9ed 0x1 0x04
write 0x9fd 0x1 0x04
write 0xa0d 0x1 0x04
write 0xa1d 0x1 0x04
write 0xa2d 0x1 0x04
write 0xa3d 0x1 0x04
write 0xa4d 0x1 0x04
write 0xa5d 0x1 0x04
write 0xa6d 0x1 0x04
write 0xa7d 0x1 0x04
write 0xa8d 0x1 0x04
write 0xa9d 0x1 0x04
write 0xaad 0x1 0x04
write 0xabd 0x1 0x04
write 0xacd 0x1 0x04
write 0xadd 0x1 0x04
write 0xaed 0x1 0x04
write 0xafd 0x1 0x04
write 0xb0d 0x1 0x04
write 0xb1d 0x1 0x04
write 0xb2d 0x1 0x04
write 0xb3d 0x1 0x04
write 0xb4d 0x1 0x04
write 0xb5d 0x1 0x04
write 0xb6d 0x1 0x04
write 0xb7d 0x1 0x04
write 0xb8d 0x1 0x04
write 0xb9d 0x1 0x04
write 0xbad 0x1 0x04
write 0xbbd 0x1 0x04
write 0xbcd 0x1 0x04
write 0xbdd 0x1 0x04
write 0xbed 0x1 0x04
write 0xbfd 0x1 0x04
write 0xc0d 0x1 0x04
write 0xc1d 0x1 0x04
write 0xc2d 0x1 0x04
write 0xc3d 0x1 0x04
write 0xc4d 0x1 0x04
write 0xc5d 0x1 0x04
write 0xc6d 0x1 0x04
write 0xc7d 0x1 0x04
write 0xc8d 0x1 0x04
write 0xc9d 0x1 0x04
write 0xcad 0x1 0x04
write 0xcbd 0x1 0x04
write 0xccd 0x1 0x04
write 0xcdd 0x1 0x04
write 0xced 0x1 0x04
write 0xcfd 0x1 0x04
write 0xd0d 0x1 0x04
write 0xd1d 0x1 0x04
write 0xd2d 0x1 0x04
write 0xd3d 0x1 0x04
write 0xd4d 0x1 0x04
write 0xd5d 0x1 0x04
write 0xd6d 0x1 0x04
write 0xd7d 0x1 0x04
write 0xd8d 0x1 0x04
write 0xd9d 0x1 0x04
write 0xdad 0x1 0x04
write 0xdbd 0x1 0x04
write 0xdcd 0x1 0x04
write 0xddd 0x1 0x04
write 0xded 0x1 0x04
write 0xdfd 0x1 0x04
write 0xe0d 0x1 0x04
write 0xe1d 0x1 0x04
write 0xe2d 0x1 0x04
write 0xe3d 0x1 0x04
write 0xe4d 0x1 0x04
write 0xe5d 0x1 0x04
write 0xe6d 0x1 0x04
write 0xe7d 0x1 0x04
write 0xe8d 0x1 0x04
write 0xe9d 0x1 0x04
write 0xead 0x1 0x04
write 0xebd 0x1 0x04
write 0xecd 0x1 0x04
write 0xedd 0x1 0x04
write 0xeed 0x1 0x04
write 0xefd 0x1 0x04
write 0xf0d 0x1 0x04
write 0xf1d 0x1 0x04
write 0xf2d 0x1 0x04
write 0xf3d 0x1 0x04
write 0xf4d 0x1 0x04
write 0xf5d 0x1 0x04
write 0xf6d 0x1 0x04
write 0xf7d 0x1 0x04
write 0xf8d 0x1 0x04
write 0xf9d 0x1 0x04
write 0xfad 0x1 0x04
write 0xfbd 0x1 0x04
write 0xfcd 0x1 0x04
write 0xfdd 0x1 0x04
write 0xfed 0x1 0x04
write 0xffd 0x1 0x04
write 0x100d 0x1 0x04
write 0x101d 0x1 0x04
writel 0xe0002000 0x0
write 0x102d 0x1 0x24
write 0x103d 0x1 0x10
write 0x104d 0x1 0x24
write 0x105d 0x1 0x10
writel 0xe0002000 0x0
write 0x107d 0x1 0x04
write 0x108d 0x1 0x04
write 0x109d 0x1 0x24
write 0x10ad 0x1 0x10
write 0x2d 0x1 0x04
write 0x10bd 0x1 0x24
write 0x10cd 0x1 0x10
writel 0xe0002000 0x0
write 0x10ed 0x1 0x04
write 0x10fd 0x1 0x04
writel 0xe0002000 0x0
write 0x111d 0x1 0x24
write 0x112d 0x1 0x10
writel 0xe0002000 0x0
write 0x114d 0x1 0x04
write 0x6d04 0x1 0x03
write 0x6d20 0x1 0x18
write 0x6d26 0x1 0x04
write 0x115d 0x1 0x10
write 0x4 0x1 0x05
write 0x64 0x1 0x28
write 0x6a 0x1 0x62
write 0x6d 0x1 0x00
write 0x1161 0x1 0x6d
write 0x116d 0x1 0x2c
write 0x116f 0x1 0x05
write 0x117d 0x1 0x04
write 0x118d 0x1 0x04
write 0x119d 0x1 0x04
write 0x11ad 0x1 0x04
write 0x11bd 0x1 0x30
write 0x11bf 0x1 0x05
writel 0xe0002000 0x0
writel 0xe0002000 0x0
writel 0xe0002000 0x0
clock_step
write 0x62000d 0x1 0x04
write 0xe0002014 0x4 0x02000000
EOF

And in libqtest format:

static void test_fuzz(void)
{
    QTestState *s = qtest_init(
        "-display none , -m 512M -machine q35 -nodefaults -drive "
        "file=null-co://,if=none,format=raw,id=disk0 -device qemu-xhci,id=xhci -device "
        "usb-tablet,bus=xhci.0 -device usb-bot -device usb-storage,drive=disk0 -chardev "
        "null,id=cd0 -chardev null,id=cd1 -device usb-braille,chardev=cd0 -device "
        "usb-ccid -device usb-ccid -device usb-kbd -device usb-mouse -device "
        "usb-serial,chardev=cd1 -device usb-tablet -device usb-wacom-tablet -device "
        "usb-audio");
    qtest_outl(s, 0xcf8, 0x80000810);
    qtest_outl(s, 0xcfc, 0xe0000000);
    qtest_outl(s, 0xcf8, 0x80000804);
    qtest_outw(s, 0xcfc, 0x06);
    qtest_writel(s, 0xe0000040, 0x1);
    qtest_bufwrite(s, 0x3d, "\x04", 0x1);
    qtest_bufwrite(s, 0x5d, "\x04", 0x1);
    qtest_bufwrite(s, 0x6d, "\x04", 0x1);
    qtest_bufwrite(s, 0x7d, "\x04", 0x1);
    qtest_bufwrite(s, 0x8d, "\x04", 0x1);
    qtest_bufwrite(s, 0x9d, "\x04", 0x1);
    qtest_bufwrite(s, 0xad, "\x04", 0x1);
    qtest_bufwrite(s, 0xbd, "\x04", 0x1);
    qtest_bufwrite(s, 0xcd, "\x04", 0x1);
    qtest_bufwrite(s, 0xdd, "\x04", 0x1);
    qtest_bufwrite(s, 0xed, "\x04", 0x1);
    qtest_bufwrite(s, 0xfd, "\x04", 0x1);
    qtest_bufwrite(s, 0x10d, "\x04", 0x1);
    qtest_bufwrite(s, 0x11d, "\x04", 0x1);
    qtest_bufwrite(s, 0x12d, "\x04", 0x1);
    qtest_bufwrite(s, 0x13d, "\x04", 0x1);
    qtest_bufwrite(s, 0x14d, "\x04", 0x1);
    qtest_bufwrite(s, 0x15d, "\x04", 0x1);
    qtest_bufwrite(s, 0x16d, "\x04", 0x1);
    qtest_bufwrite(s, 0x17d, "\x04", 0x1);
    qtest_bufwrite(s, 0x18d, "\x04", 0x1);
    qtest_bufwrite(s, 0x19d, "\x04", 0x1);
    qtest_bufwrite(s, 0x1ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x1bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x1cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x1dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x1ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x1fd, "\x04", 0x1);
    qtest_bufwrite(s, 0x20d, "\x04", 0x1);
    qtest_bufwrite(s, 0x21d, "\x04", 0x1);
    qtest_bufwrite(s, 0x22d, "\x04", 0x1);
    qtest_bufwrite(s, 0x23d, "\x04", 0x1);
    qtest_bufwrite(s, 0x24d, "\x04", 0x1);
    qtest_bufwrite(s, 0x25d, "\x04", 0x1);
    qtest_bufwrite(s, 0x26d, "\x04", 0x1);
    qtest_bufwrite(s, 0x27d, "\x04", 0x1);
    qtest_bufwrite(s, 0x28d, "\x04", 0x1);
    qtest_bufwrite(s, 0x29d, "\x04", 0x1);
    qtest_bufwrite(s, 0x2ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x2bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x2cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x2dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x2ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x2fd, "\x04", 0x1);
    qtest_bufwrite(s, 0x30d, "\x04", 0x1);
    qtest_bufwrite(s, 0x31d, "\x04", 0x1);
    qtest_bufwrite(s, 0x32d, "\x04", 0x1);
    qtest_bufwrite(s, 0x33d, "\x04", 0x1);
    qtest_bufwrite(s, 0x34d, "\x04", 0x1);
    qtest_bufwrite(s, 0x35d, "\x04", 0x1);
    qtest_bufwrite(s, 0x36d, "\x04", 0x1);
    qtest_bufwrite(s, 0x37d, "\x04", 0x1);
    qtest_bufwrite(s, 0x38d, "\x04", 0x1);
    qtest_bufwrite(s, 0x39d, "\x04", 0x1);
    qtest_bufwrite(s, 0x3ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x3bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x3cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x3dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x3ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x3fd, "\x04", 0x1);
    qtest_bufwrite(s, 0x40d, "\x04", 0x1);
    qtest_bufwrite(s, 0x41d, "\x04", 0x1);
    qtest_bufwrite(s, 0x42d, "\x04", 0x1);
    qtest_bufwrite(s, 0x43d, "\x04", 0x1);
    qtest_bufwrite(s, 0x44d, "\x04", 0x1);
    qtest_bufwrite(s, 0x45d, "\x04", 0x1);
    qtest_bufwrite(s, 0x46d, "\x04", 0x1);
    qtest_bufwrite(s, 0x47d, "\x04", 0x1);
    qtest_bufwrite(s, 0x48d, "\x04", 0x1);
    qtest_bufwrite(s, 0x49d, "\x04", 0x1);
    qtest_bufwrite(s, 0x4ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x4bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x4cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x4dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x4ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x4fd, "\x04", 0x1);
    qtest_bufwrite(s, 0x50d, "\x04", 0x1);
    qtest_bufwrite(s, 0x51d, "\x04", 0x1);
    qtest_bufwrite(s, 0x52d, "\x04", 0x1);
    qtest_bufwrite(s, 0x53d, "\x04", 0x1);
    qtest_bufwrite(s, 0x54d, "\x04", 0x1);
    qtest_bufwrite(s, 0x55d, "\x04", 0x1);
    qtest_bufwrite(s, 0x56d, "\x04", 0x1);
    qtest_bufwrite(s, 0x57d, "\x04", 0x1);
    qtest_bufwrite(s, 0x58d, "\x04", 0x1);
    qtest_bufwrite(s, 0x59d, "\x04", 0x1);
    qtest_bufwrite(s, 0x5ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x5bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x5cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x5dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x5ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x5fd, "\x04", 0x1);
    qtest_bufwrite(s, 0x60d, "\x04", 0x1);
    qtest_bufwrite(s, 0x61d, "\x04", 0x1);
    qtest_bufwrite(s, 0x62d, "\x04", 0x1);
    qtest_bufwrite(s, 0x63d, "\x04", 0x1);
    qtest_bufwrite(s, 0x64d, "\x04", 0x1);
    qtest_bufwrite(s, 0x65d, "\x04", 0x1);
    qtest_bufwrite(s, 0x66d, "\x04", 0x1);
    qtest_bufwrite(s, 0x67d, "\x04", 0x1);
    qtest_bufwrite(s, 0x68d, "\x04", 0x1);
    qtest_bufwrite(s, 0x69d, "\x04", 0x1);
    qtest_bufwrite(s, 0x6ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x6bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x6cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x6dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x6ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x6fd, "\x04", 0x1);
    qtest_bufwrite(s, 0x70d, "\x04", 0x1);
    qtest_bufwrite(s, 0x71d, "\x04", 0x1);
    qtest_bufwrite(s, 0x72d, "\x04", 0x1);
    qtest_bufwrite(s, 0x73d, "\x04", 0x1);
    qtest_bufwrite(s, 0x74d, "\x04", 0x1);
    qtest_bufwrite(s, 0x75d, "\x04", 0x1);
    qtest_bufwrite(s, 0x76d, "\x04", 0x1);
    qtest_bufwrite(s, 0x77d, "\x04", 0x1);
    qtest_bufwrite(s, 0x78d, "\x04", 0x1);
    qtest_bufwrite(s, 0x79d, "\x04", 0x1);
    qtest_bufwrite(s, 0x7ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x7bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x7cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x7dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x7ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x7fd, "\x04", 0x1);
    qtest_bufwrite(s, 0x80d, "\x04", 0x1);
    qtest_bufwrite(s, 0x81d, "\x04", 0x1);
    qtest_bufwrite(s, 0x82d, "\x04", 0x1);
    qtest_bufwrite(s, 0x83d, "\x04", 0x1);
    qtest_bufwrite(s, 0x84d, "\x04", 0x1);
    qtest_bufwrite(s, 0x85d, "\x04", 0x1);
    qtest_bufwrite(s, 0x86d, "\x04", 0x1);
    qtest_bufwrite(s, 0x87d, "\x04", 0x1);
    qtest_bufwrite(s, 0x88d, "\x04", 0x1);
    qtest_bufwrite(s, 0x89d, "\x04", 0x1);
    qtest_bufwrite(s, 0x8ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x8bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x8cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x8dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x8ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x8fd, "\x04", 0x1);
    qtest_bufwrite(s, 0x90d, "\x04", 0x1);
    qtest_bufwrite(s, 0x91d, "\x04", 0x1);
    qtest_bufwrite(s, 0x92d, "\x04", 0x1);
    qtest_bufwrite(s, 0x93d, "\x04", 0x1);
    qtest_bufwrite(s, 0x94d, "\x04", 0x1);
    qtest_bufwrite(s, 0x95d, "\x04", 0x1);
    qtest_bufwrite(s, 0x96d, "\x04", 0x1);
    qtest_bufwrite(s, 0x97d, "\x04", 0x1);
    qtest_bufwrite(s, 0x98d, "\x04", 0x1);
    qtest_bufwrite(s, 0x99d, "\x04", 0x1);
    qtest_bufwrite(s, 0x9ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x9bd, "\x04", 0x1);
    qtest_bufwrite(s, 0x9cd, "\x04", 0x1);
    qtest_bufwrite(s, 0x9dd, "\x04", 0x1);
    qtest_bufwrite(s, 0x9ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x9fd, "\x04", 0x1);
    qtest_bufwrite(s, 0xa0d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa1d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa2d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa3d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa4d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa5d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa6d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa7d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa8d, "\x04", 0x1);
    qtest_bufwrite(s, 0xa9d, "\x04", 0x1);
    qtest_bufwrite(s, 0xaad, "\x04", 0x1);
    qtest_bufwrite(s, 0xabd, "\x04", 0x1);
    qtest_bufwrite(s, 0xacd, "\x04", 0x1);
    qtest_bufwrite(s, 0xadd, "\x04", 0x1);
    qtest_bufwrite(s, 0xaed, "\x04", 0x1);
    qtest_bufwrite(s, 0xafd, "\x04", 0x1);
    qtest_bufwrite(s, 0xb0d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb1d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb2d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb3d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb4d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb5d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb6d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb7d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb8d, "\x04", 0x1);
    qtest_bufwrite(s, 0xb9d, "\x04", 0x1);
    qtest_bufwrite(s, 0xbad, "\x04", 0x1);
    qtest_bufwrite(s, 0xbbd, "\x04", 0x1);
    qtest_bufwrite(s, 0xbcd, "\x04", 0x1);
    qtest_bufwrite(s, 0xbdd, "\x04", 0x1);
    qtest_bufwrite(s, 0xbed, "\x04", 0x1);
    qtest_bufwrite(s, 0xbfd, "\x04", 0x1);
    qtest_bufwrite(s, 0xc0d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc1d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc2d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc3d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc4d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc5d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc6d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc7d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc8d, "\x04", 0x1);
    qtest_bufwrite(s, 0xc9d, "\x04", 0x1);
    qtest_bufwrite(s, 0xcad, "\x04", 0x1);
    qtest_bufwrite(s, 0xcbd, "\x04", 0x1);
    qtest_bufwrite(s, 0xccd, "\x04", 0x1);
    qtest_bufwrite(s, 0xcdd, "\x04", 0x1);
    qtest_bufwrite(s, 0xced, "\x04", 0x1);
    qtest_bufwrite(s, 0xcfd, "\x04", 0x1);
    qtest_bufwrite(s, 0xd0d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd1d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd2d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd3d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd4d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd5d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd6d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd7d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd8d, "\x04", 0x1);
    qtest_bufwrite(s, 0xd9d, "\x04", 0x1);
    qtest_bufwrite(s, 0xdad, "\x04", 0x1);
    qtest_bufwrite(s, 0xdbd, "\x04", 0x1);
    qtest_bufwrite(s, 0xdcd, "\x04", 0x1);
    qtest_bufwrite(s, 0xddd, "\x04", 0x1);
    qtest_bufwrite(s, 0xded, "\x04", 0x1);
    qtest_bufwrite(s, 0xdfd, "\x04", 0x1);
    qtest_bufwrite(s, 0xe0d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe1d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe2d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe3d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe4d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe5d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe6d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe7d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe8d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe9d, "\x04", 0x1);
    qtest_bufwrite(s, 0xead, "\x04", 0x1);
    qtest_bufwrite(s, 0xebd, "\x04", 0x1);
    qtest_bufwrite(s, 0xecd, "\x04", 0x1);
    qtest_bufwrite(s, 0xedd, "\x04", 0x1);
    qtest_bufwrite(s, 0xeed, "\x04", 0x1);
    qtest_bufwrite(s, 0xefd, "\x04", 0x1);
    qtest_bufwrite(s, 0xf0d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf1d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf2d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf3d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf4d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf5d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf6d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf7d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf8d, "\x04", 0x1);
    qtest_bufwrite(s, 0xf9d, "\x04", 0x1);
    qtest_bufwrite(s, 0xfad, "\x04", 0x1);
    qtest_bufwrite(s, 0xfbd, "\x04", 0x1);
    qtest_bufwrite(s, 0xfcd, "\x04", 0x1);
    qtest_bufwrite(s, 0xfdd, "\x04", 0x1);
    qtest_bufwrite(s, 0xfed, "\x04", 0x1);
    qtest_bufwrite(s, 0xffd, "\x04", 0x1);
    qtest_bufwrite(s, 0x100d, "\x04", 0x1);
    qtest_bufwrite(s, 0x101d, "\x04", 0x1);
    qtest_writel(s, 0xe0002000, 0x0);
    qtest_bufwrite(s, 0x102d, "\x24", 0x1);
    qtest_bufwrite(s, 0x103d, "\x10", 0x1);
    qtest_bufwrite(s, 0x104d, "\x24", 0x1);
    qtest_bufwrite(s, 0x105d, "\x10", 0x1);
    qtest_writel(s, 0xe0002000, 0x0);
    qtest_bufwrite(s, 0x107d, "\x04", 0x1);
    qtest_bufwrite(s, 0x108d, "\x04", 0x1);
    qtest_bufwrite(s, 0x109d, "\x24", 0x1);
    qtest_bufwrite(s, 0x10ad, "\x10", 0x1);
    qtest_bufwrite(s, 0x2d, "\x04", 0x1);
    qtest_bufwrite(s, 0x10bd, "\x24", 0x1);
    qtest_bufwrite(s, 0x10cd, "\x10", 0x1);
    qtest_writel(s, 0xe0002000, 0x0);
    qtest_bufwrite(s, 0x10ed, "\x04", 0x1);
    qtest_bufwrite(s, 0x10fd, "\x04", 0x1);
    qtest_writel(s, 0xe0002000, 0x0);
    qtest_bufwrite(s, 0x111d, "\x24", 0x1);
    qtest_bufwrite(s, 0x112d, "\x10", 0x1);
    qtest_writel(s, 0xe0002000, 0x0);
    qtest_bufwrite(s, 0x114d, "\x04", 0x1);
    qtest_bufwrite(s, 0x6d04, "\x03", 0x1);
    qtest_bufwrite(s, 0x6d20, "\x18", 0x1);
    qtest_bufwrite(s, 0x6d26, "\x04", 0x1);
    qtest_bufwrite(s, 0x115d, "\x10", 0x1);
    qtest_bufwrite(s, 0x4, "\x05", 0x1);
    qtest_bufwrite(s, 0x64, "\x28", 0x1);
    qtest_bufwrite(s, 0x6a, "\x62", 0x1);
    qtest_bufwrite(s, 0x6d, "\x00", 0x1);
    qtest_bufwrite(s, 0x1161, "\x6d", 0x1);
    qtest_bufwrite(s, 0x116d, "\x2c", 0x1);
    qtest_bufwrite(s, 0x116f, "\x05", 0x1);
    qtest_bufwrite(s, 0x117d, "\x04", 0x1);
    qtest_bufwrite(s, 0x118d, "\x04", 0x1);
    qtest_bufwrite(s, 0x119d, "\x04", 0x1);
    qtest_bufwrite(s, 0x11ad, "\x04", 0x1);
    qtest_bufwrite(s, 0x11bd, "\x30", 0x1);
    qtest_bufwrite(s, 0x11bf, "\x05", 0x1);
    qtest_writel(s, 0xe0002000, 0x0);
    qtest_writel(s, 0xe0002000, 0x0);
    qtest_writel(s, 0xe0002000, 0x0);
    qtest_clock_step_next(s);
    qtest_bufwrite(s, 0x62000d, "\x04", 0x1);
    qtest_bufwrite(s, 0xe0002014, "\x02\x00\x00\x00", 0x4);
    qtest_quit(s);
}

> 
> =================================================================
> ==28803==ERROR: AddressSanitizer: heap-buffer-overflow on address 0
> WRITE of size 1 at 0x602000fccdd1 thread T2
>     #0 0x560f4ebba899 in usb_mouse_poll ../hw/usb/dev-wacom.c:256
>     #1 0x560f4ebbcaf9 in usb_wacom_handle_data ../hw/usb/dev-wacom6
>     #2 0x560f4eaef297 in usb_device_handle_data ../hw/usb/bus.c:180
>     #3 0x560f4eb00bbb in usb_process_one ../hw/usb/core.c:406
>     #4 0x560f4eb01883 in usb_handle_packet ../hw/usb/core.c:438
>     #5 0x560f4eb94e0c in xhci_submit ../hw/usb/hcd-xhci.c:1801
>     #6 0x560f4eb9505f in xhci_fire_transfer ../hw/usb/hcd-xhci.c:10
>     #7 0x560f4eb9773c in xhci_kick_epctx ../hw/usb/hcd-xhci.c:1969
>     #8 0x560f4eb953f2 in xhci_kick_ep ../hw/usb/hcd-xhci.c:1835
>     #9 0x560f4eba416d in xhci_doorbell_write ../hw/usb/hcd-xhci.c:7
>     #10 0x560f4f5343a8 in memory_region_write_accessor ../softmmu/2
>     #11 0x560f4f53483f in access_with_adjusted_size ../softmmu/mem4
>     #12 0x560f4f541e69 in memory_region_dispatch_write ../softmmu/4
>     #13 0x560f4f57afec in flatview_write_continue ../softmmu/physm5
>     #14 0x560f4f57b40f in flatview_write ../softmmu/physmem.c:2867
>     #15 0x560f4f579617 in subpage_write ../softmmu/physmem.c:2501
>     #16 0x560f4f5346dc in memory_region_write_with_attrs_accessor 3
>     #17 0x560f4f53483f in access_with_adjusted_size ../softmmu/mem4
>     #18 0x560f4f542075 in memory_region_dispatch_write ../softmmu/1
>     #19 0x560f4f727735 in io_writex ../accel/tcg/cputlb.c:1429
>     #20 0x560f4f72c19d in store_helper ../accel/tcg/cputlb.c:2379
>     #21 0x560f4f72c5ec in full_le_stl_mmu ../accel/tcg/cputlb.c:247
>     #22 0x560f4f72c62a in helper_le_stl_mmu ../accel/tcg/cputlb.c:3
>     #23 0x7fcf063941a3  (/memfd:tcg-jit (deleted)+0x27541a3)
>     <cut>
> 
> Also forgot to give credits:
> 
> Reported-by: ningqiang1 <ningqiang1@huawei.com>
> Reported-by: SorryMybad of Kunlun Lab <soulchen8650@gmail.com>
> 
> > > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > > ---
> > >   hw/usb/dev-wacom.c | 20 +++++++++++++-------
> > >   1 file changed, 13 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> > > index 7177c17f03..ca9e6aa82f 100644
> > > --- a/hw/usb/dev-wacom.c
> > > +++ b/hw/usb/dev-wacom.c
> > > @@ -252,14 +252,20 @@ static int usb_mouse_poll(USBWacomState *s, uint8_t *buf, int len)
> > >       if (s->buttons_state & MOUSE_EVENT_MBUTTON)
> > >           b |= 0x04;
> > >
> > > -    buf[0] = b;
> > > -    buf[1] = dx;
> > > -    buf[2] = dy;
> > > -    l = 3;
> > > -    if (len >= 4) {
> > > -        buf[3] = dz;
> > > -        l = 4;
> > > +    l = 0;
> > > +    if (len > l) {
> > > +        buf[l++] = b;
> > >       }
> > > +    if (len > l) {
> > > +        buf[l++] = dx;
> > > +    }
> >
> >         else { // the packet is now corrupted... }
> >
> > > +    if (len > l) {
> > > +        buf[l++] = dy;
> > > +    }
> > > +    if (len > l) {
> > > +        buf[l++] = dz;
> > > +    }
> > > +
> > >       return l;
> > >   }
> >
> > Better is to wait for enough data to process:
> >
> > -- >8 --
> > diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> > index 7177c17f03..2fe2a9220e 100644
> > --- a/hw/usb/dev-wacom.c
> > +++ b/hw/usb/dev-wacom.c
> > @@ -244,6 +244,9 @@ static int usb_mouse_poll(USBWacomState *s, uint8_t
> > *buf, int len)
> >       s->dy -= dy;
> >       s->dz -= dz;
> >
> > +    if (len < 3)
> > +        return 0;
> > +
> >       b = 0;
> >       if (s->buttons_state & MOUSE_EVENT_LBUTTON)
> >           b |= 0x01;
> > @@ -274,6 +277,9 @@ static int usb_wacom_poll(USBWacomState *s, uint8_t
> > *buf, int len)
> >           s->mouse_grabbed = 1;
> >       }
> >
> > +    if (len < 7)
> > +        return 0;
> > +
> >       b = 0;
> >       if (s->buttons_state & MOUSE_EVENT_LBUTTON)
> >           b |= 0x01;
> > @@ -282,9 +288,6 @@ static int usb_wacom_poll(USBWacomState *s, uint8_t
> > *buf, int len)
> >       if (s->buttons_state & MOUSE_EVENT_MBUTTON)
> >           b |= 0x20; /* eraser */
> >
> > -    if (len < 7)
> > -        return 0;
> > -
> >       buf[0] = s->mode;
> >       buf[5] = 0x00 | (b & 0xf0);
> >       buf[1] = s->x & 0xff;
> > ---
> >
> 
> I took inspiration from hid_pointer_poll() in hw/input/hid.c which
> fills in the buffer as much as possible in a similar way, but your
> suggestion makes sense to me. Gerd, wdyt?
> 
> Thanks,
> --
> Mauro Matteo Cascella
> Red Hat Product Security
> PGP-Key ID: BB3410B0
> 
> 

