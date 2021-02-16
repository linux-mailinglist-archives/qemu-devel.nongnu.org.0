Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1901631C4B9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 01:57:00 +0100 (CET)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBofj-00007U-4p
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 19:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBoed-0007w4-GH; Mon, 15 Feb 2021 19:55:51 -0500
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBoea-00088D-Rx; Mon, 15 Feb 2021 19:55:51 -0500
Received: by mail-yb1-xb35.google.com with SMTP id l8so8867567ybe.12;
 Mon, 15 Feb 2021 16:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIKOo3T5+foNBd5yMZccldrl5a4LyIEl4Yq2/UQ2OKo=;
 b=mcsxPuM2EkRcVDhijjXpixJuU3bZsP0gFYIdJ1i8qwy1i76xxyWKTK9x91Hcrx2pQU
 /YLcmvlAfA09wRz11GrUXFCO0ResjH/v17WcDhFpRXxdMcmrpe89aUeu4y6kW4s4l6wJ
 CTgaH7G3XrU7anLePWxXSCp/gHnHys9adRZ5oNCik1YAz1wbkWaoAJZ4S3SWheWe0j4v
 /yVgE6xEUSGgNIeGXupXdvjgrhSftD9xxwIqINVebZaVmvJQxk3DjUKRH523lnP036Jc
 DLVeIcPjehd1YCfkwxj0cdQ7Zm8r8/OlWX8hSFpbT8Xt1x4acWXV5tBy6RBBUmm+3XA7
 K6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIKOo3T5+foNBd5yMZccldrl5a4LyIEl4Yq2/UQ2OKo=;
 b=Z0znCk0eQMnlfl+gpDv4pLbaPxKLFHe0yYmSpbkikl5RYDH08BUpzs01y29xwrHPR/
 jZ4eXhmC1uNAlEqLD0zn/eCZnh4I06AAoc3GmvWzZ3iR7ygj02gJu6g8r+COApwFpQvM
 eojiudHQw7iL/DenHgKdkkkNPVw2V5hGemHwUDD1ImeKgFBBbcYXoUp1DZ6npYzXqdBm
 0RzBe2N4LtyK6AwgdPPGku78HA2o800jqxNli8xhgnNDQA8zEXyCEtzFrz9YMESKxG4E
 q4k4YhhhoLoIt0cPDyeyWK4/HczryckTNeqMBEGF9RA9D8p/t0kZAnJm5fpPyFMUxd3Q
 DqaA==
X-Gm-Message-State: AOAM530F6qsHdfmObmStD10X4o9VMKIId1Twttvuvrsk51N5lAsUPspI
 u+hyXrTrNdeCGLhUA3lMcj6WbCzKxN5TzAXMH6k=
X-Google-Smtp-Source: ABdhPJx9AL8/PgWAoI+TR2JF7Hm+nmjg3DMb9rw5mvhOyGg7ommibKLR3PSx0LVBVmJvKME02FxuHb5KRgS+Zt05lFI=
X-Received: by 2002:a25:d08d:: with SMTP id
 h135mr26352957ybg.122.1613436947128; 
 Mon, 15 Feb 2021 16:55:47 -0800 (PST)
MIME-Version: 1.0
References: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
 <20210215164646.zqjbsd7mtiwqvyaj@mozz.bu.edu>
In-Reply-To: <20210215164646.zqjbsd7mtiwqvyaj@mozz.bu.edu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 16 Feb 2021 08:55:36 +0800
Message-ID: <CAEUhbmVgP08pO2LqFOcYja2vuOPw7C_py7F9r9dKkbwAt70m7Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/sd: sdhci: Fixes to CVE-2020-17380,
 CVE-2020-25085, CVE-2021-3409
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@163.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

On Tue, Feb 16, 2021 at 12:48 AM Alexander Bulekov <alxndr@bu.edu> wrote:
>
> Hi Bin,
> Thank you for this. I ran through the OSS-Fuzz tests again, and it found
> one thing:

Thanks for testing. Are there instructions to run OSS-Fuzz tests myself?

> Maybe this is already much better than the current state of the code, so
> this one can be fixed in a later patch?

Depend on when Philippe can pick up this sereis, but I can also try to
have a quick look :)

>
> cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest \
> -m 512M -nodefaults -device sdhci-pci,sd-spec-version=3 \
> -device sd-card,drive=mydrive \
> -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
> -nographic -qtest stdio
> outl 0xcf8 0x80001010
> outl 0xcfc 0xe0000000
> outl 0xcf8 0x80001001
> outl 0xcfc 0x06000000
> write 0xe000002c 0x1 0x05
> write 0xe0000005 0x1 0x02
> write 0xe0000007 0x1 0x01
> write 0xe0000028 0x1 0x10
> write 0x0 0x1 0x23
> write 0x2 0x1 0x08
> write 0xe000000c 0x1 0x01
> write 0xe000000e 0x1 0x20
> write 0xe000000f 0x1 0x00
> write 0xe000000c 0x1 0x32
> write 0xe0000004 0x2 0x0200
> write 0xe0000028 0x1 0x00
> write 0xe0000003 0x1 0x40
> EOF
>
>
> ==1730971==ERROR: AddressSanitizer: heap-buffer-overflow on address
> 0x615000031880 at pc 0x55d070f2c6d9 bp 0x7ffdcb63f130 sp 0x7ffdcb63f128
> READ of size 4 at 0x615000031880 thread T0
> #0 0x55d070f2c6d8 in ldl_he_p bswap.h:347:5
> #1 0x55d070f2c6d8 in ldn_he_p bswap.h:546:1
> #2 0x55d070f2c6d8 in flatview_write_continue build/../softmmu/physmem.c:2775:19
> #3 0x55d070f219eb in flatview_write build/../softmmu/physmem.c:2816:14
> #4 0x55d070f219eb in address_space_write build/../softmmu/physmem.c:2908:18
> #5 0x55d07040de4a in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
> #6 0x55d07040de4a in dma_memory_rw include/sysemu/dma.h:127:12
> #7 0x55d07040de4a in dma_memory_write include/sysemu/dma.h:163:12
> #8 0x55d07040de4a in sdhci_sdma_transfer_multi_blocks build/../hw/sd/sdhci.c:619:13
> #9 0x55d07041d15b in sdhci_write build/../hw/sd/sdhci.c:1134:21
> #10 0x55d07123b1ac in memory_region_write_accessor build/../softmmu/memory.c:491:5
> #11 0x55d07123acab in access_with_adjusted_size build/../softmmu/memory.c:552:18
> #12 0x55d07123a4b0 in memory_region_dispatch_write build/../softmmu/memory.c
> #13 0x55d070f2c29b in flatview_write_continue build/../softmmu/physmem.c:2776:23
> #14 0x55d070f219eb in flatview_write build/../softmmu/physmem.c:2816:14
> #15 0x55d070f219eb in address_space_write build/../softmmu/physmem.c:2908:18

Regards,
Bin

