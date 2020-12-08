Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA502D294B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 11:57:00 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmag0-0004NH-1G
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 05:57:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmaeS-0003pi-F7
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 05:55:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmaeK-0007U7-Ak
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 05:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607424914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgR8I+MVDIQNCuanlkVpzr2jQarhIJ2fVhi4Hzg4pzo=;
 b=QaqHOxEJQRl8PDwI0293eKtOLxSlKLfDL+tdRk9n9kWPU+jInewsj9wLhuj5R+69JFWOJL
 hEdkBKzxcRaTALUsfEW3/n4ngiBwXvto4MSH6p+hEw0xKnfxUj8wY9EIHcFATdcoh5Tn6p
 CIbgTFuSTYVLQfuoNQkIo0weSdqOJeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-W9hwcMQINqOBybDaLeV8Dg-1; Tue, 08 Dec 2020 05:55:12 -0500
X-MC-Unique: W9hwcMQINqOBybDaLeV8Dg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F35D1005504;
 Tue,  8 Dec 2020 10:55:11 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65ECD5C1A1;
 Tue,  8 Dec 2020 10:55:06 +0000 (UTC)
Date: Tue, 8 Dec 2020 11:55:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 10/15] vl: make qemu_get_machine_opts static
Message-ID: <20201208115504.12df6180@redhat.com>
In-Reply-To: <44bc2a0b-ff1e-d9d5-772c-a5cbe23da94a@gmail.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-11-pbonzini@redhat.com>
 <20201207170728.0a39f201@redhat.com>
 <44bc2a0b-ff1e-d9d5-772c-a5cbe23da94a@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Dec 2020 23:32:55 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 12/7/20 1:07 PM, Igor Mammedov wrote:
> > On Wed,  2 Dec 2020 03:18:49 -0500
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> >   
> >> Machine options can be retrieved as properties of the machine object.
> >> Encourage that by removing the "easy" accessor to machine options.
> >>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >>   accel/kvm/kvm-all.c     | 11 ++++-------
> >>   hw/arm/boot.c           |  2 +-
> >>   hw/microblaze/boot.c    |  9 ++++-----
> >>   hw/nios2/boot.c         |  9 ++++-----
> >>   hw/ppc/e500.c           |  5 ++---
> >>   hw/ppc/spapr_nvdimm.c   |  4 ++--
> >>   hw/ppc/virtex_ml507.c   |  2 +-
> >>   hw/riscv/sifive_u.c     |  6 ++----
> >>   hw/riscv/virt.c         |  6 ++----
> >>   hw/xtensa/xtfpga.c      |  9 ++++-----
> >>   include/sysemu/sysemu.h |  2 --
> >>   softmmu/device_tree.c   |  2 +-
> >>   softmmu/vl.c            |  2 +-
> >>   13 files changed, 28 insertions(+), 41 deletions(-)
> >>  
> > [...]  
> >> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> >> index a833a63b5e..84715a4d78 100644
> >> --- a/hw/ppc/spapr_nvdimm.c
> >> +++ b/hw/ppc/spapr_nvdimm.c
> >> @@ -38,7 +38,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
> >>   {
> >>       const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
> >>       const MachineState *ms = MACHINE(hotplug_dev);
> >> -    const char *nvdimm_opt = qemu_opt_get(qemu_get_machine_opts(), "nvdimm");
> >>       g_autofree char *uuidstr = NULL;
> >>       QemuUUID uuid;
> >>       int ret;
> >> @@ -57,10 +56,11 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
> >>        * ensure that, if the user sets nvdimm=off, we error out
> >>        * regardless of being 5.1 or newer.
> >>        */
> >> -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
> >> +    if (!ms->nvdimms_state->is_enabled && ms->nvdimms_state->has_is_enabled) {
> >>           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
> >>           return false;
> >>       }
> >> +    ms->nvdimms_state->is_enabled = true;  
> > 
> > it looks like nvdimm is always enabled since 5.0 and there is no way to disable it  
> 
> 
> I'm not sure I'm following this statement. Testing here with all patches
> up to this one applied, in a x86 machine:
> 
> 
> $ sudo ./x86_64-softmmu/qemu-system-x86_64 -M pc,nvdimm=off -object memory-backend-file,id=mem0,size=1G,mem-path=/tmp/aa -device nvdimm,id=dimm0,memdev=mem0
> qemu-system-x86_64: -device nvdimm,id=dimm0,memdev=mem0: nvdimm is not enabled: missing 'nvdimm' in '-M'
> $
> $ sudo ./x86_64-softmmu/qemu-system-x86_64 -M pc -object memory-backend-file,id=mem0,size=1G,mem-path=/tmp/aa -device nvdimm,id=dimm0,memdev=mem0
> qemu-system-x86_64: -device nvdimm,id=dimm0,memdev=mem0: nvdimm is not enabled: missing 'nvdimm' in '-M'
> $
> 
> This is the x86 NVDIMM behavior I considered when patching pseries NVDIMM support.
> As Paolo mentioned in patch 09, pseries has different default values. We screwed
> it up when pushing the first version of pseries NVDIMM support and we ended up
> enabling it by default, as opposed to disabling it by default like x86. One release
> later people complained that we weren't honoring 'nvdimm=off' to disable NVDIMM
> support. The path of less pain that I chose was to at the very least disable
> the support when "nvdimm=off" was specified by the user.
> 
> 
> 
> 
> 
> > how about dropping 9/15 and just error out is it's not enabled, something like:
> > 
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index b7e0894019..d63f095bff 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -2668,6 +2668,7 @@ static void spapr_machine_init(MachineState *machine)
> >       char *filename;
> >       Error *resize_hpt_err = NULL;
> > +    if (mc->nvdimm_supported) { // by default it is always enabled
> > +        ms->nvdimms_state->is_enabled = true;
> > +    }
> >       msi_nonbroken = true;
> >   
> >       QLIST_INIT(&spapr->phbs);
> > diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> > index a833a63b5e..b11c85dbaa 100644
> > --- a/hw/ppc/spapr_nvdimm.c
> > +++ b/hw/ppc/spapr_nvdimm.c
> > @@ -57,7 +57,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
> >        * ensure that, if the user sets nvdimm=off, we error out
> >        * regardless of being 5.1 or newer.
> >        */
> > -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
> > +    if (!ms->nvdimms_state->is_enabled) {
> >           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
> >           return false;
> >       }
> > 
> > if I didn't miss something, that way we do not abuse nvdimm_opt and still
> > have nvdimm enabled by default and error out if it turns to disabled for whatever reason.  
> 
> 
> Just tried this out. This doesn't disable the NVDIMM support when passing 'nvdimm=off'
> machine option.

that's not really working, but rather idea (spapr_machine_init is too late for the task).
I'll post a path that should do the job in a minute.

> 
> As far pseries NVDIMM support goes, we'll need patch 09 and to consider nvdimm_opt
> to keep the same behavior we already have today, like Paolo is already doing in
> this patch.
> 
> 
> 
> Thanks,
> 
> 
> DHB
> 
> > 
> >   
> >>       if (object_property_get_int(OBJECT(nvdimm), NVDIMM_LABEL_SIZE_PROP,
> >>                                   &error_abort) == 0) {  
> > [...]
> > 
> >   
> >   
> 


