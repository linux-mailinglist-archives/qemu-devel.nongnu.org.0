Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D5A5207C8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 00:33:06 +0200 (CEST)
Received: from localhost ([::1]:43042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noBw7-0000Ii-Od
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 18:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1noBuC-0006qP-GA; Mon, 09 May 2022 18:31:04 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:43467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1noBuA-000128-Cm; Mon, 09 May 2022 18:31:04 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-ee1e7362caso12238775fac.10; 
 Mon, 09 May 2022 15:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jUai09mwYj3SoTJSp6iX6pXkYrTxu3K3m4Kphyj5F8M=;
 b=RYKZklPeqFL094exg8Z5CzT18W/rTmaJK1mWVjCVMJDSVJf5YAkX8vI1Q/QclUpgvz
 ogaCLVMtEZ+9NBkKPk/uSJhPPPtAi3L7uW+YJHCymZnPQwZZvZm+sRQhgzRExTuKghK4
 PPbd3jr/dSuwIVIa2VyUcXKrNqAeKstH590K1JBe5YbnDzGrV8R/iXzmfN/a2P14n1A0
 KRpxo9niHt+pRK/zggRQQCu/NahbMjQ1//T9drEDosNQ5Q6P04ifU+oTIVc+sTNHu2ML
 y2HdTy6ULyAY5+TBXAzNeXnxNp8bzwZU3UdFEmhFyGcXLSPorypvwuUtVXCxOCzkIP6t
 64DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jUai09mwYj3SoTJSp6iX6pXkYrTxu3K3m4Kphyj5F8M=;
 b=lPDaDRKg9UU6jTatRPVqKVG/TldAInPHdrXcBvbCfB/bRpubAZMxCPlhUZ7s/zAweQ
 5zJypHnZ7yBERQuKUxA+ocjTuMJsFewygSUw42jmdrZQLtMlohj8juZv/mGJpkpoqB7n
 2P9mExDKtxszya2N50xe9p/U3tnpT2xupZyp4TbaZP+3ze8zu/5kkHV+DK670WKVWvB0
 +wDzudQboO18IYA+7wZaL5ZDvjn1hP0W9ZpJEaWQkhzBhhSJxqVSeMhR1qksOyV1o1jJ
 1WmiVjPVD3+hyBxTDPXYwFGiwzHzO/xPn3/z0svU7gIIkb00KNu6IQYkiNugu1L/QJAO
 cP+w==
X-Gm-Message-State: AOAM532ucfz+LI/fycJX4rBuzKHLMgQMb1PyDnyl3xlYUutohvmkAYBl
 n+BfXfe8p8tWEsR5HpUCH2k=
X-Google-Smtp-Source: ABdhPJzxvE+5Bm4WKSIwRRhbiREgEBwCG32EMuTRujA3ZggzNFWcdD19hL4Xduhyi8omjJldvCA+4w==
X-Received: by 2002:a05:6870:1715:b0:ed:e244:4ada with SMTP id
 h21-20020a056870171500b000ede2444adamr11181730oae.107.1652135460611; 
 Mon, 09 May 2022 15:31:00 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 be6-20020a056870588600b000e686d13895sm4616771oab.47.2022.05.09.15.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 15:31:00 -0700 (PDT)
Message-ID: <e7f2e6bc-b443-ed96-683b-835fbe7a55b8@gmail.com>
Date: Mon, 9 May 2022 19:30:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/17] powernv: introduce pnv-phb unified devices
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 fbarrat@linux.ibm.com
References: <20220507190624.507419-1-danielhb413@gmail.com>
 <d6ee5ef4-5242-1f1b-839c-242d18d10800@ilande.co.uk>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <d6ee5ef4-5242-1f1b-839c-242d18d10800@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 5/9/22 18:17, Mark Cave-Ayland wrote:
> On 07/05/2022 20:06, Daniel Henrique Barboza wrote:
> 
>> Hi,
>>
>> Since the 7.0.0 release cycle we have a desire to use the powernv
>> emulation with libvirt. To do that we need to enable user creatable
>> pnv-phb devices to allow more user customization an to avoid spamming
>> multiple default devices in the domain XML. In the middle of the
>> previous cycle we experimented with user created
>> pnv-phb3/pnv-phb3-root-port/pnv-phb4/pnv-phb4-root-port/pnv-phb5. The
>> end result, although functional, is that the user needs to deal with a
>> lot of versioned devices that, from the user perspective, does the same
>> thing. In a way we outsourced the implementation details of the PHBs
>> (e.g. pnv8 uses phb3, pnv9 uses phb4) to the command line. Having more
>> devices also puts an extra burden in the libvirt support we want to
>> have.
>>
>> To solve this, Cedric and Frederic gave the idea of adding a common
>> virtual pnv-phb device that the user can add in the command line, and
>> QEMU handles the details internally. Unfortunatelly this idea turned out
>> to be way harder than anticipated. Between creating a device that would
>> just forward the callbacks to the existing devices internally, creating
>> a PnvPHB device with the minimal attributes and making the other devices
>> inherit from it, and making an 'abstract' device that could be casted
>> for both phb3 and phb4 PHBs,
> 
> This bit sounds all good...
> 
>> all sorts of very obscure problems occured:
>> PHBs not being detected, interrupts not being delivered and memory
>> regions not being able to read/write registers. My initial impression is
>> that there are assumptions made both in ppc/pnv and hw/pci-host that
>> requires the memory region and the bus being in the same device. Even
>> if we somehow figure all this out, the resulting code is hacky and
>> annoying to maitain.
> 
> But this seems really surprising since there are many examples of similar QOM patterns within the codebase, and in my experience they work really well. Do you have a particular example that you can share to demonstrate why the result of the QOM mapping is making things more difficult?


It's not so much about the OOM getting in the way, but rather myself not being
able to use QOM in a way to get what I want. There is a good probability that
QOM is able to do it.

Talking about the 2 PHBs pnv-phb3 (powernv8 only) and pnv-phb4 (powernv9 only),
what we want is a way to let the user instantiate both using an alias, or
an abstract object if you will, called "pnv-phb". This alias/abstraction would
instantiate either a pnv-phb3 or a pnv-phb4 depending on the actual machine
running.

QOM has the "interface" concept that is used internally to make the device behave
like the interface describes it, but I wasn't able to expose this kind of object
to the user. It also has the "abstract" concept that, by the documentation itself,
isn't supposed to be user created. Eventually I gave up this idea, accepting that
only real devices can be exposed to the user (please correct me if I'm wrong).

After that I tried to create a pnv-phb object that contains the common attributes
of both pnv-phb3 and pnv-phb4. This object would be the parent of phb3 and phb4,
and during realize time creating a pnv-phb object would create a pnv-phb3/4 and
we go from there. This attempt went far after a few tweaks but then I started
to hit the problems I mentioned above: some strange behaviors with interrupts,
PHBs not appearing and so on. I got a little farther by moving all the memory
regions from phb3/phb4 to the parent phb object and I got up to the guest login,
but without network. Since moving the memory regions in the same object as the
pci root bus got me farther I concluded that there might some relation/assumption
made somewhere that I was breaking before.

After all that I got more than halfway of what I ended up doing. I decided to
unify phb3/phb4 into a single device, renamed their attributes that has different
meanings between v3 and v4 code, and I ended up with this series.


> 
>> This brings us to this series. The cleaner way I found to accomplish
>> what we want to do is to create real, unified pnv-phb/phb-phb-root-port
>> devices, and get rid of all the versioned ones. This is done by
>> merging all the PHB3/PHB4 attributes in unified devices. pnv_phb3* and pnv_phb4*
>> files end up using the same pnv-phb and phb-phb-root-port unified devices,
>> with the difference that pnv_phb3* only cares about version 3 attributes
>> and pnv_phb4* only cares about PHB4 attributes. Introducing new PHB
>> versions in the future will be a matter of adding any non-existent
>> attributes in the unified pnv-phb* devices and using them in separated
>> pnv_phbN* files.
>>
>> The pnv-phb implementation per se is just a router for either phb3 or
>> phb4 logic, done in init() and realize() time, after we check which powernv
>> machine we're running. If running with powernv8 we redirect control to
>> pnv_phb3_realize(), otherwise we redirect to pnv_phb4_realize(). The
>> unified device does not do anything per se other than handling control
>> to the right version.
>>
>> After this series, this same powernv8 command line that boots a powernv8
>> machine with some phbs and root ports and with network:
>>
>> ./qemu-system-ppc64 -m 4G \
>> -machine powernv8 -smp 2,sockets=2,cores=1,threads=1  \
>> -accel tcg,thread=multi -bios skiboot.lid  \
>> -kernel vmlinux -initrd buildroot.rootfs.cpio -append 'console=hvc0 ro xmon=on'  \
>> -nodefaults  -serial mon:stdio -nographic  \
>> -device pnv-phb,chip-id=0,index=0,id=pcie.0 \
>> -device pnv-phb,chip-id=0,index=1,id=pcie.1 \
>> -device pnv-phb,chip-id=1,index=2,id=pcie.2 \
>> -device pnv-phb-root-port,id=root0,bus=pcie.2 \
>> -device pnv-phb-root-port,id=root1,bus=pcie.1 \
>> -device pcie-pci-bridge,id=bridge1,bus=root0,addr=0x0  \
>> -device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234  \
>> -drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none  \
>> -device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
>> -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
>> -device nec-usb-xhci,bus=bridge1,addr=0x2
>>
>>
>> Can be used to boot powernv9 and powernv10 machines with the same attributes
>> just by changing the machine type.
>>
>>
>> Daniel Henrique Barboza (17):
>>    ppc/pnv: rename PnvPHB3.ioda* to PnvPHB3.ioda2*
>>    ppc/pnv: rename PnvPHB3.regs[] to PnvPHB3.regs3[]
>>    ppc/pnv: rename PnvPHB3.dma_spaces to PnvPHB3.v3_dma_spaces
>>    ppc/pnv: add unified pnv-phb header
>>    ppc/pnv: add pnv-phb device
>>    ppc/pnv: remove PnvPHB3
>>    ppc/pnv: user created pnv-phb for powernv8
>>    ppc/pnv: remove PnvPHB4
>>    ppc/pnv: user creatable pnv-phb for powernv9
>>    ppc/pnv: use PnvPHB.version
>>    ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
>>    ppc/pnv: user creatable pnv-phb for powernv10
>>    ppc/pnv: add pnv_phb_get_current_machine()
>>    ppc/pnv: add pnv-phb-root-port device
>>    ppc/pnv: remove pnv-phb3-root-port
>>    ppc/pnv: remove pnv-phb4-root-port
>>    ppc/pnv: remove pecc->rp_model
>>
>>   hw/pci-host/meson.build        |   3 +-
>>   hw/pci-host/pnv_phb.c          | 258 ++++++++++++++++++++++++++++
>>   hw/pci-host/pnv_phb3.c         | 256 +++++++++++-----------------
>>   hw/pci-host/pnv_phb3_msi.c     |  12 +-
>>   hw/pci-host/pnv_phb3_pbcq.c    |   8 +-
>>   hw/pci-host/pnv_phb4.c         | 298 ++++++++++++---------------------
>>   hw/pci-host/pnv_phb4_pec.c     |  14 +-
>>   hw/ppc/pnv.c                   |  41 ++++-
>>   include/hw/pci-host/pnv_phb.h  | 224 +++++++++++++++++++++++++
>>   include/hw/pci-host/pnv_phb3.h | 118 +------------
>>   include/hw/pci-host/pnv_phb4.h | 108 ++----------
>>   include/hw/ppc/pnv.h           |   3 +-
>>   12 files changed, 757 insertions(+), 586 deletions(-)
>>   create mode 100644 hw/pci-host/pnv_phb.c
>>   create mode 100644 include/hw/pci-host/pnv_phb.h
> 
> I'm completely on-board with having a proxy-like PHB device that maps to the correct underlying PHB version, but to me it feels like combining multiple separate devices into a single one is going to make things more complicated to maintain in the long term.


I'm all up for a "virtual pnv-phb" device that can be used together with the
existing versioned phbs. I wasn't able to pull that off.



Thanks,


Daniel


> 
> 
> ATB,
> 
> Mark.

