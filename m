Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3485B2E5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 04:17:04 +0200 (CEST)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhlsN-0000Tl-Da
	for lists+qemu-devel@lfdr.de; Sun, 30 Jun 2019 22:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38405)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <skrtbhtngr@gmail.com>) id 1hhlqu-0008TD-Hb
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 22:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <skrtbhtngr@gmail.com>) id 1hhlqr-0003zO-FT
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 22:15:32 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56290)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <skrtbhtngr@gmail.com>)
 id 1hhlqr-0003uE-4R
 for qemu-devel@nongnu.org; Sun, 30 Jun 2019 22:15:29 -0400
Received: by mail-wm1-x344.google.com with SMTP id a15so14158294wmj.5
 for <qemu-devel@nongnu.org>; Sun, 30 Jun 2019 19:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h/OF53wKzXDhOO7L8sTbWBnsI69kRdbuHGxUo+Qx5lY=;
 b=Ol2xi0+cDmUZydhvQAJytyrok9Novn7FVKncLdkWcv6RMFSL+rv5lr5QfOrxWbrJVY
 2yJdrRf+7AXYuw+a/vLrpf2Weg55t0eL0bbjiTdt0W4O8o71lfgHkpbym8iaGW1ABnHc
 L0G/lbws9h+ygDbqc9ZR8YjFH8QPb/TfWGTKp5ausHZ0OIpej3isW+dviF0u/qguMUgS
 Q43htQ9miwvUXV3AsOZGBAH7ye5wfcYfksMU1vyTk6nSKAWKwf7l3JizMAb7NZDz6PPw
 BXLbTRkfZddlG9Pqt7RhmWVwte+8PcvCrswV2IYH2TDgoFHqRg/BKPI6EO6tkIFR8wel
 oO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h/OF53wKzXDhOO7L8sTbWBnsI69kRdbuHGxUo+Qx5lY=;
 b=thqn6gB1sGWZwf+zK54M7iPRzF49HL7hsDjGELPRVIkFEhjLn3AYO2MN+zbwjPA7ut
 WYI6wHd23C60M7g6bUITpG3rACcZUqxbPtY2YyKuIM99slK5qQ9PsR1s9N90jzOsAEI8
 UrFY9A+qtQNsVq+M2XzBLx2Cd4bM1Y75te9YoYvaJfI5YMRwEN6mSiDjZFKe+byCb4tO
 GfPiJdk5YA3knDJzRMPWHLQ4qbCytg2Jyr+4OToL8ersXYUPEjmIRQxKTd2yq4pXhPET
 ehuUlmr16O7Wg+k+EHZO3MJCAKZf65LUiEpXd474XHvdyd0oIG8JgFT5m0V6Q6xSWr63
 Nn3w==
X-Gm-Message-State: APjAAAWXj4tjiQOYEk0vp3nV483TvcLH8qsnxUlKpsqoCMkudgoAM1kv
 NAiwerk//TNqNQeyhW5geq/Iu0kpO+WyauX69Gc=
X-Google-Smtp-Source: APXvYqyrUcivyYQJSXUo4nF1wts2SdT19tBibeCYeeKhuLHEjYNRP2d7MyK792S03WNOBOmuAMMMDi/GMuEdwoDJSQ4=
X-Received: by 2002:a05:600c:2383:: with SMTP id
 m3mr14727366wma.20.1561947325609; 
 Sun, 30 Jun 2019 19:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190621144541.13770-1-skrtbhtngr@gmail.com>
 <20190621144541.13770-2-skrtbhtngr@gmail.com>
 <20190625153253.GA10458@lap1> <20190628112634.GB2987@work-vm>
 <CAMzgYoOb7VbFk3U6zP9OvDPtcbT3K4CHjBVuaKUzQWfe_yFCYQ@mail.gmail.com>
 <20190630081349.GA2817@lap1>
In-Reply-To: <20190630081349.GA2817@lap1>
From: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
Date: Mon, 1 Jul 2019 07:45:14 +0530
Message-ID: <CAMzgYoML=BR4GnLYs_+cRzn__Rqytu5pnbDn-YhqByPn_X7v-w@mail.gmail.com>
To: Yuval Shaia <yuval.shaia@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [RFC 1/1] hw/pvrdma: Add live migration support
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, stefanha@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 30 Jun 2019 at 13:43, Yuval Shaia <yuval.shaia@oracle.com> wrote:
>
> On Sat, Jun 29, 2019 at 06:15:21PM +0530, Sukrit Bhatnagar wrote:
> > On Fri, 28 Jun 2019 at 16:56, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Yuval Shaia (yuval.shaia@oracle.com) wrote:
> > > > On Fri, Jun 21, 2019 at 08:15:41PM +0530, Sukrit Bhatnagar wrote:
> > > > > Define and register SaveVMHandlers pvrdma_save and
> > > > > pvrdma_load for saving and loading the device state,
> > > > > which currently includes only the dma, command slot
> > > > > and response slot addresses.
> > > > >
> > > > > Remap the DSR, command slot and response slot upon
> > > > > loading the addresses in the pvrdma_load function.
> > > > >
> > > > > Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > > > > Cc: Yuval Shaia <yuval.shaia@oracle.com>
> > > > > Signed-off-by: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
> > > > > ---
> > > > >  hw/rdma/vmw/pvrdma_main.c | 56 +++++++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 56 insertions(+)
> > > > >
> > > > > diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
> > > > > index adcf79cd63..cd8573173c 100644
> > > > > --- a/hw/rdma/vmw/pvrdma_main.c
> > > > > +++ b/hw/rdma/vmw/pvrdma_main.c
> > > > > @@ -28,6 +28,7 @@
> > > > >  #include "sysemu/sysemu.h"
> > > > >  #include "monitor/monitor.h"
> > > > >  #include "hw/rdma/rdma.h"
> > > > > +#include "migration/register.h"
> > > > >
> > > > >  #include "../rdma_rm.h"
> > > > >  #include "../rdma_backend.h"
> > > > > @@ -592,9 +593,62 @@ static void pvrdma_shutdown_notifier(Notifier *n, void *opaque)
> > > > >      pvrdma_fini(pci_dev);
> > > > >  }
> > > > >
> > > > > +static void pvrdma_save(QEMUFile *f, void *opaque)
> > > > > +{
> > > > > +    PVRDMADev *dev = PVRDMA_DEV(opaque);
> > > > > +
> > > > > +    qemu_put_be64(f, dev->dsr_info.dma);
> > > > > +    qemu_put_be64(f, dev->dsr_info.dsr->cmd_slot_dma);
> > > > > +    qemu_put_be64(f, dev->dsr_info.dsr->resp_slot_dma);
> > > > > +}
> > > > > +
> > > > > +static int pvrdma_load(QEMUFile *f, void *opaque, int version_id)
> > > > > +{
> > > > > +    PVRDMADev *dev = PVRDMA_DEV(opaque);
> > > > > +    PCIDevice *pci_dev = PCI_DEVICE(dev);
> > > > > +
> > > > > +    // Remap DSR
> > > > > +    dev->dsr_info.dma = qemu_get_be64(f);
> > > > > +    dev->dsr_info.dsr = rdma_pci_dma_map(pci_dev, dev->dsr_info.dma,
> > > > > +                                    sizeof(struct pvrdma_device_shared_region));
> > > > > +    if (!dev->dsr_info.dsr) {
> > > > > +        rdma_error_report("Failed to map to DSR");
> > > > > +        return -1;
> > > > > +    }
> > > > > +    qemu_log("pvrdma_load: successfully remapped to DSR\n");
> > > > > +
> > > > > +    // Remap cmd slot
> > > > > +    dev->dsr_info.dsr->cmd_slot_dma = qemu_get_be64(f);
> > > > > +    dev->dsr_info.req = rdma_pci_dma_map(pci_dev, dev->dsr_info.dsr->cmd_slot_dma,
> > > > > +                                     sizeof(union pvrdma_cmd_req));
> > > > > +    if (!dev->dsr_info.req) {
> > > >
> > > > So this is where you hit the error, right?
> > > > All looks good to me, i wonder why the first pci_dma_map works fine but
> > > > second fails where the global BounceBuffer is marked as used.
> > > >
> > > > Anyone?
> > >
> > > I've got a few guesses:
> > >   a) My reading of address_space_map is that it gives a bounce buffer
> > > pointer and then it has to be freed; so if it's going wrong and using a
> > > bounce buffer, then the 1st call would work and only the 2nd would fail.
> >
> > In the scenario without any migration, the device is init and load_dsr()
> > is called when the guest writes to DSR in BAR1 of pvrdma.
> >
> > Inside the load_dsr(), there are similar calls to rdma_pci_dma_map().
> >
> > The difference is that when the address_space_map() is called there,
> > !memory_access_is_direct() condition is FALSE.
> > So, there is no use for BounceBuffer.
> >
> >
> > In the migration scenario, when the device at dest calls load and
> > subsequently rdma_pci_dma_map(), the !memory_access_is_direct()
> > condition is TRUE.
> > So, the first rdma_pci_dma_map() will set BounceBuffer from FALSE to
> > TRUE and succeed. But, the subsequent calls will fail at atomic_xchg().
> >
> > This BounceBuffer is only freed when address_space_unmap() is called.
> >
> >
> > I am guessing that when the address is translated to one in FlatView,
> > the MemoryRegion returned at dest is causing the issue.
> > To be honest, at this point I am not sure how FlatView translations works.
> >
> > I tried adding qemu_log to memory_access_is_direct(), but I guess it is
> > called too many times, so the vm stalls before it even starts.
> >
> > >   b) Perhaps the dma address read from the stream is bad, and isn't
> > > pointing into RAM properly - and that's why you're getting a bounce
> > > buffer.
> >
> > I have logged the addresses saved in pvrdma_save(), and the ones
> > loaded in pvrdma_load(). They are same. So, there is no problem in the
> > stream itself, I suppose.
> >
> > >   c) Do you have some ordering problems? i.e. is this code happening
> > > before some other device has been loaded/initialised?  If you're relying
> > > on some other state, then perhaps the right thing is to perform these
> > > mappings later, at the end of migration, not during the loading itself.
> >
> > The device which is saved/loaded before pvrdma is vmxnet3, on which
> > the pvrdma depends.
> >
> > I have included the last few lines of my traces during migration below.
> > The pvrdma migration is performed in this last part of migration.
> > I had added some debug messages at various places to see which parts
> > of the code are touched. The ones I added are without any timestamp.
> >
> > Source:
> > 15942@1561806657.197239:vmstate_subsection_save_top PCIDevice
> > 15942@1561806657.197257:vmstate_subsection_save_top vmxnet3/pcie
> > 15942@1561806657.197275:savevm_section_end 0000:00:10.0/vmxnet3,
> > section_id 46 -> 0
> > 15942@1561806657.197302:savevm_section_start 0000:00:10.1/pvrdma, section_id 47
> > 15942@1561806657.197326:vmstate_save 0000:00:10.1/pvrdma, (old)
> > pvrdma_save: dev->dsr_info.dma is 2032963584
> > pvrdma_save: dev->dsr_info.dsr->cmd_slot_dma is 2032660480
> > pvrdma_save: dev->dsr_info.dsr->resp_slot_dma is 893681664
> > 15942@1561806657.197372:savevm_section_end 0000:00:10.1/pvrdma,
> > section_id 47 -> 0
> > 15942@1561806657.197397:savevm_section_start acpi_build, section_id 48
> > 15942@1561806657.197420:vmstate_save acpi_build, acpi_build
> > 15942@1561806657.197441:vmstate_save_state_top acpi_build
> > 15942@1561806657.197459:vmstate_n_elems patched: 1
> > 15942@1561806657.197479:vmstate_save_state_loop acpi_build/patched[1]
> > 15942@1561806657.197503:vmstate_subsection_save_top acpi_build
> > 15942@1561806657.197520:savevm_section_end acpi_build, section_id 48 -> 0
> > 15942@1561806657.197545:savevm_section_start globalstate, section_id 49
> > 15942@1561806657.197568:vmstate_save globalstate, globalstate
> > 15942@1561806657.197589:vmstate_save_state_top globalstate
> > 15942@1561806657.197606:migrate_global_state_pre_save saved state: running
> > 15942@1561806657.197624:vmstate_save_state_pre_save_res globalstate/0
> > 15942@1561806657.197645:vmstate_n_elems size: 1
> > 15942@1561806657.197677:vmstate_save_state_loop globalstate/size[1]
> > 15942@1561806657.197710:vmstate_n_elems runstate: 1
> > 15942@1561806657.197730:vmstate_save_state_loop globalstate/runstate[1]
> > 15942@1561806657.197822:vmstate_subsection_save_top globalstate
> > 15942@1561806657.197885:savevm_section_end globalstate, section_id 49 -> 0
> > 15942@1561806657.198240:migrate_set_state new state completed
> > 15942@1561806657.198269:migration_thread_after_loop
> > 15797@1561806657.198329:savevm_state_cleanup
> > 15797@1561806657.198377:migrate_fd_cleanup
> > 15797@1561806657.199072:qemu_file_fclose
> >
> > Destination:
> > 15830@1561806657.667024:vmstate_subsection_load vmxnet3/pcie
> > 15830@1561806657.667064:vmstate_subsection_load_good vmxnet3/pcie
> > 15830@1561806657.667106:vmstate_load_state_end vmxnet3/pcie end/0
> > 15830@1561806657.667150:vmstate_subsection_load_good vmxnet3
> > 15830@1561806657.667213:vmstate_load_state_end vmxnet3 end/0
> > 15830@1561806657.667263:qemu_loadvm_state_section 4
> > 15830@1561806657.667293:qemu_loadvm_state_section_startfull
> > 47(0000:00:10.1/pvrdma) 0 1
> > 15830@1561806657.667346:vmstate_load 0000:00:10.1/pvrdma, (old)
> > pvrdma_load: dev->dsr_info.dma is 2032963584
> > address_space_map: is_write is 0
> > address_space_map: addr is 2032963584
> > address_space_map: Inside !memory_access_is_direct
> > 15830@1561806657.667453:rdma_pci_dma_map 0x792c9000 -> 0x5616d1f66000 (len=280)
> > pvrdma_load: successfully remapped to DSR
> > pvrdma_load: dev->dsr_info.dsr->cmd_slot_dma is 2032660480
> > address_space_map: is_write is 0
> > address_space_map: addr is 2032660480
> > address_space_map: Inside !memory_access_is_direct
> > address_space_map: Inside atomic_xchg
> > qemu-system-x86_64: rdma: pci_dma_map fail, addr=0x7927f000, len=184
> > qemu-system-x86_64: rdma: Failed to map to command slot address
> > qemu-system-x86_64: error while loading state for instance 0x0 of
> > device '0000:00:10.1/pvrdma'
> > 15830@1561806657.667693:qemu_loadvm_state_post_main -1
> > 15830@1561806657.667729:loadvm_state_cleanup
> > 15830@1561806657.668568:process_incoming_migration_co_end ret=-1
> > postcopy-state=0
> > qemu-system-x86_64: load of migration failed: Operation not permitted
> > 15830@1561806657.668721:migrate_set_state new state failed
> > 15830@1561806657.668807:qemu_file_fclose
> > qemu-system-x86_64: network script /etc/qemu-ifdown failed with status 256
> >
> > @Marcel, @Yuval: As David has suggested, what if we just read the dma
> > addresses in pvrdma_load(), and let the load_dsr() do the mapping?
> > In pvrdma_regs_write(), we can check if dev->dsr_info.dma is already set, so
> > that its value is not overwritten.
>
> Have you tried that? Did it works?

I haven't tried it, but in the dest, the guest will not call pvrdma_regs_write()
for DSR again as it calls it only when the guest driver probes pci.
load_dsr() will not be called then.
So, I guess my assumption was wrong.

> So it is like a lazy load and the first command will be bit slower, we can
> live with that i guess.
>
> Is there other way to postpone work so it will be executed right after
> migration is completes? I just don't like the fact that we are adding an
> 'if' statement.

Once the guest driver has init device at the dest, the only way it
will write to the registers is when it sends a command to the cmd slot.
So, I think the dma mapping for dsr and cmd/resp slots has to be done
in the migration process itself.

I am not sure if there is a callback that we can register for after
the migration
process finishes.


For the BounceBuffer problem:
My understanding is that the vm at dest will have its own address
space, separate from the vm at src.
We have the same address (at src and dest) that we want backend
to map to, and this address is guest physical.
When we are hitting address_space_map(), some flatview translation
takes place which returns a memory region for that address.
This memory region is apparently either not a ram/ram device, or is
readonly (at dest, but not at src).
So the same address in another address space is translated to a
different type of memory region, even when the whole ram is copied
in migration before this.
I guess BounceBuffer is not really the issue.

I need to see what different is happening inside the flatview translation
at the src and dest, but when I add debug messages, the vm stalls
indefinitely as there are too many times it is called. Is there a better way
to debug such cases?


Apart from this, I have been trying to convert my code to use VMSTATE
macros, but I have been hitting dead ends due to complex order of the
values I need to save/load. Shall I start a new thread for this discussion
or should I continue in this one?

> In any case, wrap the "if (dev->dsr_info.dma)" with "unlikely" because as
> soon as it be initialized it will always true.
>
> >
> >
> > > Other notes:
> > >   d) Use VMSTATE macros and structures rather than open-coding qemu_get
> > > calls.
> >
> > Yes, I am trying it currently.
> >
> > >   e) QEMU normally uses /* comments */ rather than //
> >
> > I have corrected this mistake in my code. patchew notified me about this
> > and the line length issues minutes after I had sent this patch.
> >
> >
> > > Dave
> > >
> > > > > +        rdma_error_report("Failed to map to command slot address");
> > > > > +        return -1;
> > > > > +    }
> > > > > +    qemu_log("pvrdma_load: successfully remapped to cmd slot\n");
> > > > > +
> > > > > +    // Remap rsp slot
> > > >
> > > > btw, this is RFC so we are fine but try to avoid such way of comments.
> > > >
> > > > > +    dev->dsr_info.dsr->resp_slot_dma = qemu_get_be64(f);
> > > > > +    dev->dsr_info.rsp = rdma_pci_dma_map(pci_dev, dev->dsr_info.dsr->resp_slot_dma,
> > > > > +                                     sizeof(union pvrdma_cmd_resp));
> > > > > +    if (!dev->dsr_info.rsp) {
> > > > > +        rdma_error_report("Failed to map to response slot address");
> > > > > +        return -1;
> > > > > +    }
> > > > > +    qemu_log("pvrdma_load: successfully remapped to rsp slot\n");
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +
> > > > > +static SaveVMHandlers savevm_pvrdma = {
> > > > > +    .save_state = pvrdma_save,
> > > > > +    .load_state = pvrdma_load,
> > > > > +};
> > > > > +
> > > > >  static void pvrdma_realize(PCIDevice *pdev, Error **errp)
> > > > >  {
> > > > >      int rc = 0;
> > > > > +    DeviceState *s = DEVICE(pdev);
> > > > >      PVRDMADev *dev = PVRDMA_DEV(pdev);
> > > > >      Object *memdev_root;
> > > > >      bool ram_shared = false;
> > > > > @@ -666,6 +720,8 @@ static void pvrdma_realize(PCIDevice *pdev, Error **errp)
> > > > >      dev->shutdown_notifier.notify = pvrdma_shutdown_notifier;
> > > > >      qemu_register_shutdown_notifier(&dev->shutdown_notifier);
> > > > >
> > > > > +    register_savevm_live(s, "pvrdma", -1, 1, &savevm_pvrdma, dev);
> > > > > +
> > > > >  out:
> > > > >      if (rc) {
> > > > >          pvrdma_fini(pdev);
> > > > > --
> > > > > 2.21.0
> > > > >
> > > > >
> > > >
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

