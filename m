Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D06DBC504
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 11:39:52 +0200 (CEST)
Received: from localhost ([::1]:43188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iChIV-0004Lz-86
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 05:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iChBK-0000up-8n
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 05:32:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iChBH-0006tT-C3
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 05:32:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57318)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iChBF-0006sV-BP
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 05:32:21 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E697DC057F31
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 09:32:17 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id n6so341801wrm.20
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 02:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gt4nkXocCUcTz/iKG4/H57HkiQCiCBPpE7cI9pNF/UY=;
 b=C9c+J5c8VyjxbuiiG/NXsqNKf7ObEUJba0xk21drPF0yqK5zGaboJPibEVd2Ly/T2O
 KORWOZPaAvexItrSemjQpp5KdCNgszHOCHluMAheiJOGYbmJDZxIEwhQ8Hecor1naNiA
 Ayvh5nCHyDcK7aI+9AwMl0FCfgU32nB6DtkZ4M50/dxLyYhE6Nq5bqrSXwC6tFbwld5A
 +ZaAbDmMuumnX+IWioe+75NFtltI7iZcCggU1liIZNDxqLXhM3KtdRotVePdf/CRrtqm
 1u3Q5Vr/xKBroIOfhkccDs4tOPjCgJifoTE+ijbdNUTIsmEr+j9e1ZtGeLESeuTgichc
 MB6A==
X-Gm-Message-State: APjAAAX5hPPfy3BqWi77BhfcX+1hNqVisrJ/iNfqhZAhD+lwdpHGjlxK
 psOxPuoTLeaLVIzVGC/w/zbfe3TEN9A2gtEJv8PmRtjAD5iwWEQ67jC8Czd2ly0f2WejU3cEoRz
 91EcjREM0jN+v5k8=
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr2050894wmj.115.1569317536727; 
 Tue, 24 Sep 2019 02:32:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzxlkLiFaH7aBkkyTDpeqEXUmPUj8g9fIoOVe0yipFXeX6PC07o8+q+Z6sQvLP4grvlkxQHxg==
X-Received: by 2002:a7b:cb0e:: with SMTP id u14mr2050867wmj.115.1569317536437; 
 Tue, 24 Sep 2019 02:32:16 -0700 (PDT)
Received: from [192.168.1.115] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id d193sm2150901wmd.0.2019.09.24.02.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2019 02:32:15 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] riscv/virt: Add the PFlash CFI01 device
To: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair23@gmail.com>, Laszlo Ersek <lersek@redhat.com>
References: <cover.1568931866.git.alistair.francis@wdc.com>
 <0a5c141a26fada6d93d06e996a2f24e1b269ec50.1568931866.git.alistair.francis@wdc.com>
 <CAEUhbmVvDKQqQYE-riq=cvSrCe_NMoW_KDsLjh8CVHRUhJvk9A@mail.gmail.com>
 <CAKmqyKOofA3U+8kjMkzQ0sNd1=uwJHq3c9eaLZdoNCb7=e-PAw@mail.gmail.com>
 <CAFEAcA-uFPGf4BiDXH=Om3Df-xXrt7QwjzVF7E3kY4aMWMP4YQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <16bab4bf-b91e-ef0c-2d22-53538f74cfc4@redhat.com>
Date: Tue, 24 Sep 2019 11:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-uFPGf4BiDXH=Om3Df-xXrt7QwjzVF7E3kY4aMWMP4YQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/19 11:46 PM, Peter Maydell wrote:
> On Fri, 20 Sep 2019 at 23:23, Alistair Francis <alistair23@gmail.com> wrote:
>> On Thu, Sep 19, 2019 at 10:15 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>> I don't think we should mirror what is used on ARM virt board to
>>> create 2 flash for sifive_u. For ARM virt, there are 2 flashes because
>>> they need distinguish secure and non-secure. For sifive_u, only one is
>>> enough.
>>
>> I went back and forward about 1 or 2. Two seems more usable as maybe
>> someone wants to include two pflash files? The Xilinx machine also has
>> two so I'm kind of used to 2, but I'm not really fussed.

The Xilinx machine has 2 because it matches the hardware.

> One of the reasons for having 2 on the Arm board (we do this
> even if we're not supporting secure vs non-secure) is that
> then you can use one for a fixed read-only BIOS image (backed
> by a file on the host filesystem shared between all VMs), and
> one backed by a read-write per-VM file providing permanent
> storage for BIOS environment variables. Notably UEFI likes to
> work this way, but the idea applies in theory to other
> boot loader or BIOSes I guess.

IIRC Laszlo's explanation, the only reason it is that way is because the
pflash_cfi01 model still doesn't implement sector locking. At the OVMF
emerged from EDK2, to have a safe ROM vs DATA storage it was decided to
use 2 different flashes.
When I understood when this config layout started, I suggested Laszlo to
use a real ROM to store the OVMF CODE since it is pointless to do
firmware upgrade in virtualized environment, but he said it was too late
to change the design.

If you don't plan to run UEFI "Capsule Update" on your Virt board, I
suggest using memory_region_init_rom() with your firmware CODE, and a
parallel/SPI flash for the data VARStore.

> I would suggest also checking with Markus that your code
> for instantiating the flash devices follows the current
> recommendations so the backing storage can be configured
> via -blockdev. (This is a fairly recent change from June or
> so; current-in-master virt and sbsa boards provide an example
> of doing the right thing, I think.)
> 
> thanks
> -- PMM
> 

