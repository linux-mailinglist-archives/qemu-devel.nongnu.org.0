Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC3C357A4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 09:26:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYQJN-0001ga-RS
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 03:26:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1hYQI8-00011j-Gl
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 03:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1hYQI7-0007l3-2z
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 03:25:00 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aik@ozlabs.ru>) id 1hYQI6-0007gT-PR
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 03:24:58 -0400
Received: by mail-pg1-x541.google.com with SMTP id 83so5082159pgg.8
	for <qemu-devel@nongnu.org>; Wed, 05 Jun 2019 00:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=91MhBSqb1pD9su/cfwcNAN5wxPqJJpHU0d4zRmLeZjc=;
	b=gxAefcUcmqhDKc8Z1RGyIr8AcEXZsMcwMoXQA+mI8uoUAvFnBQvC838DTzK8VbYk4v
	EroY3LGrvmMfK8DKeiGWxiNJ5vhk9APTL8xB7S7uDlyNgNnpw2WrnGYuEaXaT7oCvyxj
	wFtWcE6K9d3oA/Yh3jdMS622QB2DhE2wADNAZZ7Li5e9sqb986gKhoObM7mVfyf0cIP6
	nF+tXMWUfQ+TtXFDqKJG89zXZhoNlDvoW+DLE0YtFXZaHThpbJY0iWxTZHPpK5l4dRW/
	4Ye36noqOZu29VkIHLP5j3pBXDcYqHfjGPyleqdIe6Ok81Lkjs/bbT0Uk8SfT7gfHUwy
	jZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=91MhBSqb1pD9su/cfwcNAN5wxPqJJpHU0d4zRmLeZjc=;
	b=jrTvlF5FxM7RgckPlgjKq7edCR3RPCFXD5PPUt+b9/j8GDnINopuzu1gTx3Qku2T/i
	dRh0Crjc8CXqp6+4kJ0QouO9rInINQSQCf05Q19GR9UA20gWmwvmCnSg4tIJU6zjf28P
	M7b5k/AnijaFpyw3PysVTJxtKuYpGuYfh+Wqfg8oNJMsE7ckGGuR4825Mb6JIzCnHjDC
	UhBw82qtjeTeIVv8fnN44KL+FCRg6VkPp8P8SyrGCrEJLuDlrF5OfNNOLOTgBgALjxGr
	4gB+JzX9NYlEKX/lEUcTRsOVJhdpDpzaO5n8SgFDE0whY27v8vV+RVFt/iQzoq2tIrc5
	ZDPA==
X-Gm-Message-State: APjAAAVtxytTDt6RTRcJwVyhkMnB+3XQpQkGysaVoMxPEq511EhnPuIJ
	WdqKzUO+zpylwX/q1EsT7LbeYw==
X-Google-Smtp-Source: APXvYqxI/Xs0mE8o35qAjR4tdrnh+v0HhVi+Wq35sOqM96ueLDWvawUBD+Fak5ioAL3m8N0Nvk399g==
X-Received: by 2002:a63:4c0f:: with SMTP id z15mr2468483pga.245.1559719497323; 
	Wed, 05 Jun 2019 00:24:57 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10]) by smtp.gmail.com with ESMTPSA id
	p20sm32101162pgk.7.2019.06.05.00.24.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 00:24:56 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20190529065017.15149-1-david@gibson.dropbear.id.au>
	<20190529065017.15149-27-david@gibson.dropbear.id.au>
	<0f0fb553-a75d-5e91-b932-a17e40b44e3f@ozlabs.ru>
	<8a848471-9444-f7ff-e85d-0dffc785c0d4@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
	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
Message-ID: <3d92582a-6888-8d25-4586-981d7e19acfd@ozlabs.ru>
Date: Wed, 5 Jun 2019 17:24:51 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8a848471-9444-f7ff-e85d-0dffc785c0d4@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PULL 26/44] spapr/xive: add KVM support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, peter.maydell@linaro.org, groug@kaod.org,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, rth@twiddle.net,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04/06/2019 17:54, Cédric Le Goater wrote:
> On 04/06/2019 09:23, Alexey Kardashevskiy wrote:
>>
>>
>> On 29/05/2019 16:49, David Gibson wrote:
>>> From: Cédric Le Goater <clg@kaod.org>
>>>
>>> This introduces a set of helpers when KVM is in use, which create the
>>> KVM XIVE device, initialize the interrupt sources at a KVM level and
>>> connect the interrupt presenters to the vCPU.
>>>
>>> They also handle the initialization of the TIMA and the source ESB
>>> memory regions of the controller. These have a different type under
>>> KVM. They are 'ram device' memory mappings, similarly to VFIO, exposed
>>> to the guest and the associated VMAs on the host are populated
>>> dynamically with the appropriate pages using a fault handler.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
>>> Message-Id: <20190513084245.25755-3-clg@kaod.org>
>>> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>>
>>
>> This one breaks my setup - it boots up to:
>>
>>
>> ipr: IBM Power RAID SCSI Device Driver version: 2.6.4 (March 14, 2017)
>> __vio_register_driver: driver ibmvscsi registering
>> ibmvscsi 71000001: SRP_VERSION: 16.a
>> ibmvscsi 71000001: Maximum ID: 64 Maximum LUN: 32 Maximum Channel: 3
>> scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
>>
>>
>> and hangs. Here is the command line:
>>
>>
>> /home/aik/pbuild/qemu-aikrhel74alt-ppc64/ppc64-softmmu/qemu-system-ppc64 \
>> -nodefaults \
>> -chardev stdio,id=STDIO0,signal=off,mux=on \
>> -device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
>> -mon id=MON0,chardev=STDIO0,mode=readline -nographic -vga none \
>> -enable-kvm \
>> -device nec-usb-xhci,id=nec-usb-xhci0 -m 16G \
>> -netdev "user,id=USER0,hostfwd=tcp::2223-:22" \
>> -device "virtio-net-pci,id=vnet0,mac=C0:41:49:4b:00:00,netdev=USER0" \
>> img/u1804-64G-cuda10.1-418.67-swiotlb.qcow2 \
>> -machine pseries,cap-cfpc=broken,cap-htm=off,ic-mode=xive -snapshot \
>> -smp 1,threads=1 -bios ./slof.bin \
>> -L /home/aik/t/qemu-ppc64-bios/ \
>> -trace events=qemu_trace_events -d guest_errors \
>> -chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.user2223 \
>> -mon chardev=SOCKET0,mode=control
> 
> At this level of patch 38afd772f802 ("spapr/xive: add KVM support"), I am
> surprised this is even starting. 
> 
> The test in spapr_irq_init_xive() : 
> 
>     /* KVM XIVE device not yet available */
>     if (kvm_enabled()) {
>         if (machine_kernel_irqchip_required(machine)) {
>             error_setg(errp, "kernel_irqchip requested. no KVM XIVE support");
>             return;
>         }
>     }
> 
> should fail. This is removed later in 0dc9f5f8496a ("spapr/xive: activate 
> KVM support")
> 
>> The host kernel is v5.2-rc2. The next patch - 0c575703e487 "spapr/xive:
>> add hcall support when under KVM" - fixes this though but the question
>> is now if xive emulation in qemu still works (how do I verify it?).
> 
> kernel_irqchip=off should activate the QEMU XIVE device.
> 
> Are you testing bisection ?


I was bisecting as I originally wanted to test the recent David's spapr
pci rework and things broke again, although differently, hence the noise
I made about xive.



-- 
Alexey

