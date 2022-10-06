Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 346645F6D79
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:26:55 +0200 (CEST)
Received: from localhost ([::1]:55998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVa6-0004yO-A4
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ogUhC-0001SJ-2I
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:30:06 -0400
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:43583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ogUh7-0001F7-9M
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:30:05 -0400
Received: by mail-qv1-xf44.google.com with SMTP id mg6so1595265qvb.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 10:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=p5veuhU0dIY2xd9L2OAwfNnQr6EiO+DHEdjXeQ0I1NY=;
 b=Fj8X63MFnopGruLhcju70hblSS12UQH1gyi9htrM33+r9BmTe7kMa+HYRnBugOHmpR
 RrEt5vrsUXFwY/z2Ufxrtb7Yu+J6eEQQfj4fydrTCdjfo+ddfc16oYTmZnvawI89aHb3
 g4f3KJicwj7/25Wy/zBaX2nUxGQ11Z8zVXx8OiFauEU/kI3o+vzenCCB1Q62gEkPueYo
 omvQ+t2iWtftmipb39gZBVJD1caMt/zEzhYpyEi4Gs9cHIV2hVBf2+1NVMPB343X/66O
 UvGddFFYZ4FpzvqR0V8/LtUfct52MHNp/WNxeyDtp35fVlJG+OStl6YlGuFP4yAZNdci
 AWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p5veuhU0dIY2xd9L2OAwfNnQr6EiO+DHEdjXeQ0I1NY=;
 b=AVsrR23Uh5U3PJUxK1QYj/4Hlz6FZdJ3aca5/OIx+mdiergPLg5CG9CDLIQxYQHoLd
 CC+kXrrFUoW4gI29dbbtZ48KBgqrvpsWS6NyFDsGnixwO+3cq3IFCIJMGb1OR5F8v46C
 K5+KdtoLDIQCE0/FjWedjkCYG9fgKpCw1ZSKW/oifAlRTfbtEvyMMKBD36FKSNbbcqal
 60VjsLGb3vndRI5sXbEY1ndoPYJTPgwi4pNE0xWOvmnEDHLNZnwAQMOXI/+Bs+FgTpeo
 qjgJ1eHHwsJuKw9gb4d45mVl2yQKbVHLHCdpvGdaG/UuaI7XABXNu4YtXqaUV59rWDTt
 liAQ==
X-Gm-Message-State: ACrzQf3qdDO0hpFIizSPrjPUjlaKrLZYXeAJmgt+zy5NGgju1VgoLW/Z
 GXTRLTfcEbp2GPdePjeu/Q==
X-Google-Smtp-Source: AMsMyM6sWVbQSogE9bfJ6dZCqpq3ON7TKEJpzRbClI4XdEnn/sBt8Tfo08N1z+RKVkttxGQIyd/VKg==
X-Received: by 2002:a05:6214:27c5:b0:4b1:7aba:1c51 with SMTP id
 ge5-20020a05621427c500b004b17aba1c51mr750180qvb.128.1665077400040; 
 Thu, 06 Oct 2022 10:30:00 -0700 (PDT)
Received: from fedora (pool-173-79-56-208.washdc.fios.verizon.net.
 [173.79.56.208]) by smtp.gmail.com with ESMTPSA id
 z15-20020ac875cf000000b003910ce2f390sm181966qtq.14.2022.10.06.10.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 10:29:59 -0700 (PDT)
Date: Thu, 6 Oct 2022 13:29:57 -0400
From: Gregory Price <gourry.memverge@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, linux-cxl@vger.kernel.org,
 Alison Schofield <alison.schofield@intel.com>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "a.manzanares@samsung.com" <a.manzanares@samsung.com>,
 Ben Widawsky <bwidawsk@kernel.org>
Subject: Re: [PATCH RFC] hw/cxl: type 3 devices can now present volatile or
 persistent memory
Message-ID: <Yz8QlQ9yLFrWxWsN@fedora>
References: <20221006000103.49542-1-gregory.price@memverge.com>
 <20221006094557.000035ab@huawei.com>
 <20221006095007.00001271@huawei.com> <Yz75ppPOwYCvNamy@fedora>
 <20221006174214.000059c7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006174214.000059c7@huawei.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=gourry.memverge@gmail.com; helo=mail-qv1-xf44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 06, 2022 at 05:42:14PM +0100, Jonathan Cameron wrote:
> > 
> > 1) The PCI device type is set prior to realize/attributes, and is
> > currently still set to PCI_CLASS_STORAGE_EXPRESS.  Should this instead
> > be PCI_CLASS_MEMORY_CXL when presenting as a simple memory expander?
> 
> We override this later in realize but indeed a bit odd that we first set
> it to the wrong thing. I guess that is really old code.  Nice thing to clean up.
> I just tried it and setting it right in the first place + dropping where we
> change it later works fine.
> 

I'll add it as a pullout patch ahead of my next revision.

/**** snip - skipping ahead for the sake of brevity ****/


I was unaware that an SLD could be comprised of multiple regions
of both persistent and volatile memory.  I was under the impression that
it could only be one type of memory.  Of course that makes sense in the
case of a memory expander that simply lets you plug DIMMs in *facepalm*

I see the reason to have separate backends in this case.

The reason to allow an array of backing devices is if we believe each
individual DIMM plugged into a memexpander is likely to show up as
(configurably?) individual NUMA nodes, or if it's likely to get
classified as one numa node.

Maybe we should consider 2 new options:
--persistent-memdevs=pm1 pm2 pm3
--volatile-memdevs=vm1 vm2 vm3

etc, and deprecate --memdev, and go with your array of memdevs idea.

I think I could probably whip that up in a day or two.  Thoughts?



> > 
> > 2) EDK2 sets the memory area as a reserved, and the memory is not
> > configured by the system as ram.  I'm fairly sure edk2 just doesn't
> > support this yet, but there's a chicken/egg problem.  If the device
> > isn't there, there's nothing to test against... if there's nothing to
> > test against, no one will write the support.  So I figure we should kick
> > start the process (probably by getting it wrong on the first go around!)
> 
> Yup, if the bios left it alone, OS drivers need to treat it the same as
> they would deal with hotplugged memory.  Note my strong suspicion is there
> will be host vendors who won't ever handle volatile CXL memory in firmware.
> They will just let the OS bring it up after boot. As long as you have DDR
> as well on the system that will be fine.  Means there is one code path
> to verify rather than two.  Not everyone will care about legacy OS support.
> 

Presently i'm failing to bring up a region of memory even when this is
set to persistent (even on upstream configuration).  The kernel is
presently failing to set_size because the region is used.

I can't tell if this is a driver error or because EDK2 is marking the
region as reserved.

relevant boot output:
[    0.000000] BIOS-e820: [mem 0x0000000290000000-0x000000029fffffff] reserved
[    1.229097] acpi ACPI0016:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    1.244082] acpi ACPI0016:00: _OSC: OS supports [CXL20PortDevRegAccess CXLProtocolErrorReporting CXLNativeHotPlug]
[    1.261245] acpi ACPI0016:00: _OSC: platform does not support [LTR DPC]
[    1.272347] acpi ACPI0016:00: _OSC: OS now controls [PCIeHotplug SHPCHotplug PME AER PCIeCapability]
[    1.286092] acpi ACPI0016:00: _OSC: OS now controls [CXLMemErrorReporting]

The device is otherwise available for use

cli output
# cxl list
[
  {
    "memdev":"mem0",
    "pmem_size":268435456,
    "ram_size":0,
    "serial":0,
    "host":"0000:35:00.0"
  }
]

but it fails to setup correctly

cxl create-region -m -d decoder0.0 -w 1 -g 256 mem0
cxl region: create_region: region0: set_size failed: Numerical result out of range
cxl region: cmd_create_region: created 0 regions

I tracked this down to this part of the kernel:

kernel/resource.c

static struct resource *get_free_mem_region(...)
{
	... snip ...
	enumerate regions, fail to find a useable region
	... snip ...
	return ERR_PTR(-ERANGE);
}

but i'm not sure of what to do with this info.  We have some proof
that real hardware works with this no problem, and the only difference
is that the EFI/bios/firmware is setting the memory regions as `usable`
or `soft reserved`, which would imply the EDK2 is the blocker here
regardless of the OS driver status.

But I'd seen elsewhere you had gotten some of this working, and I'm
failing to get anything working at the moment.  If you have any input i
would greatly appreciate the help.

QEMU config:

/opt/qemu-cxl2/bin/qemu-system-x86_64 \
-drive file=/var/lib/libvirt/images/cxl.qcow2,format=qcow2,index=0,media=d\
-m 2G,slots=4,maxmem=4G \
-smp 4 \
-machine type=q35,accel=kvm,cxl=on \
-enable-kvm \
-nographic \
-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 \
-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 \
-object memory-backend-file,id=cxl-mem0,mem-path=/tmp/cxl-mem0,size=256M \
-object memory-backend-file,id=lsa0,mem-path=/tmp/cxl-lsa0,size=256M \
-device cxl-type3,bus=rp0,pmem=true,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 \
-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=256M

I'd seen on the lists that you had seen issues with single-rp setups,
but no combination of configuration I've tried (including all the ones
in the docs and tests) lead to a successful region creation with
`cxl create-region`

> > 
> > 3) Upstream linux drivers haven't touched ram configurations yet.  I
> > just configured this with Dan Williams yesterday on IRC.  My
> > understanding is that it's been worked on but nothing has been
> > upstreamed, in part because there are only a very small set of devices
> > available to developers at the moment.
> 
> There was an offer of similar volatile memory QEMU emulation in the
> session on QEMU CXL at Linux Plumbers.  That will look something like you have
> here and maybe reflects that someone has hardware as well...
> 

I saw that, and I figured I'd start the conversation by pushing
something :].

