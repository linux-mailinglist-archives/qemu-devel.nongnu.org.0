Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E49B2D3295
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:17:21 +0100 (CET)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiUB-0007go-Ke
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmhpZ-0003MG-Ny
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:35:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmhpU-0001Wk-Ji
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607452515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HUq7ZNpMYi7nmiBML8Tiyok224d5GBTwlZlKY35ZJ4=;
 b=T+GxZ2W+R+Yv9gG40zrqzXfpehribgG0susGppmC8hF8/cgVQfu0DmN/hL4yP97pUYxZT4
 moQmxzanYBGJ5DOqJWH3bmioXT7yZls5npH2jeYFo5LchmPfvM0Xzbwya9oK2Xh1QhsOA2
 HQHB+vFGixgssgBq3CJJFpWuJbfNhEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-5Tul-eUcPLSYf2JxNGZjJw-1; Tue, 08 Dec 2020 13:35:12 -0500
X-MC-Unique: 5Tul-eUcPLSYf2JxNGZjJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 637F9190A7A0;
 Tue,  8 Dec 2020 18:35:11 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1574110016F6;
 Tue,  8 Dec 2020 18:35:06 +0000 (UTC)
Date: Tue, 8 Dec 2020 19:35:05 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2] ppc/spapr: cleanup -machine pseries,nvdimm=X handling
Message-ID: <20201208193505.46529337@redhat.com>
In-Reply-To: <16474f79-93b1-e21c-124a-91e20894e47c@gmail.com>
References: <20201208110532.4099624-1-imammedo@redhat.com>
 <20201208164606.4109134-1-imammedo@redhat.com>
 <16474f79-93b1-e21c-124a-91e20894e47c@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 14:24:22 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> On 12/8/20 1:46 PM, Igor Mammedov wrote:
> > Since NVDIMM support was introduced on pseries machine,
> > it ignored machine's nvdimm=on|off option and effectively
> > was always enabled on machines that support NVDIMM.
> > Later on commit
> >    (28f5a716212 ppc/spapr_nvdimm: do not enable support with 'nvdimm=off')
> > makes QEMU error out in case user explicitly set 'nvdimm=off'
> > on CLI by peeking at machine_opts.
> > 
> > However that's a workaround and leaves 'nvdimms_state->is_enabled'
> > in inconsistent state (false) when it should be set true
> > by default.
> > 
> > Instead of using on machine_opts, set default to true for pseries
> > machine in initfn time. If user sets manually 'nvdimm=off'
> > it will overwrite default value to false and QEMU will error
> > as expected without need to peek into machine_opts.
> > 
> > That way pseries will have, nvdimm enabled by default and  
> 
> nit: extra ',' here
> 
> > will honor user provided 'nvdimm=on|off'.  
> 
> I believe it's plausible to add a:
> 
> Fixes: 28f5a716212 ("ppc/spapr_nvdimm: do not enable support with 'nvdimm=off'")
> 
> To indicate that this is amending my commit you mentioned up there.
> 
> 
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---  
> 
> Thanks for taking the time patching this up. Tested on top of Patch 08 in a
> Power 9 host and it works as intended.
> 
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> 
> 
> ps: I'm assuming that that this is deprecating Paolo's patch:
> 
> "[PATCH 09/15] machine: record whether nvdimm= was set"
> 
> and also the chunks of Patch 10/15 that are changing spapr_nvdimm.c. If that's
> not the case, let me know and I'll re-test.

yes, it does deprecate those.
And it is based on this series, so I'd expect Paolo to incorporate it,
to avoid churn/conflicts.

> 
> 
> 
> Thanks,
> 
> 
> DHB
> 
> 
> 
> > CC: danielhb413@gmail.com
> > CC: david@gibson.dropbear.id.au
> > CC: pbonzini@redhat.com
> > 
> > v2:
> >    - simplify a bit more by using spapr_instance_init() to set
> >      default value instead of doing it in generic machine code
> > 
> > PS:
> > Patch should be applied on top of:
> >    [PATCH 08/15] machine: introduce MachineInitPhase
> > ---
> >   hw/ppc/spapr.c        | 13 +++++++++++++
> >   hw/ppc/spapr_nvdimm.c | 14 +-------------
> >   2 files changed, 14 insertions(+), 13 deletions(-)
> > 
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index b7e0894019..803a6f52a2 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -3267,6 +3267,19 @@ static void spapr_instance_init(Object *obj)
> >   {
> >       SpaprMachineState *spapr = SPAPR_MACHINE(obj);
> >       SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
> > +    MachineState *ms = MACHINE(spapr);
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > +
> > +    /*
> > +     * NVDIMM support went live in 5.1 without considering that, in
> > +     * other archs, the user needs to enable NVDIMM support with the
> > +     * 'nvdimm' machine option and the default behavior is NVDIMM
> > +     * support disabled. It is too late to roll back to the standard
> > +     * behavior without breaking 5.1 guests.
> > +     */
> > +    if (mc->nvdimm_supported) {
> > +        ms->nvdimms_state->is_enabled = true;
> > +    }
> >   
> >       spapr->htab_fd = -1;
> >       spapr->use_hotplug_event_source = true;
> > diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> > index a833a63b5e..66cd3dc13f 100644
> > --- a/hw/ppc/spapr_nvdimm.c
> > +++ b/hw/ppc/spapr_nvdimm.c
> > @@ -27,10 +27,8 @@
> >   #include "hw/ppc/spapr_nvdimm.h"
> >   #include "hw/mem/nvdimm.h"
> >   #include "qemu/nvdimm-utils.h"
> > -#include "qemu/option.h"
> >   #include "hw/ppc/fdt.h"
> >   #include "qemu/range.h"
> > -#include "sysemu/sysemu.h"
> >   #include "hw/ppc/spapr_numa.h"
> >   
> >   bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
> > @@ -38,7 +36,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
> >   {
> >       const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
> >       const MachineState *ms = MACHINE(hotplug_dev);
> > -    const char *nvdimm_opt = qemu_opt_get(qemu_get_machine_opts(), "nvdimm");
> >       g_autofree char *uuidstr = NULL;
> >       QemuUUID uuid;
> >       int ret;
> > @@ -48,16 +45,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
> >           return false;
> >       }
> >   
> > -    /*
> > -     * NVDIMM support went live in 5.1 without considering that, in
> > -     * other archs, the user needs to enable NVDIMM support with the
> > -     * 'nvdimm' machine option and the default behavior is NVDIMM
> > -     * support disabled. It is too late to roll back to the standard
> > -     * behavior without breaking 5.1 guests. What we can do is to
> > -     * ensure that, if the user sets nvdimm=off, we error out
> > -     * regardless of being 5.1 or newer.
> > -     */
> > -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
> > +    if (!ms->nvdimms_state->is_enabled) {
> >           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
> >           return false;
> >       }
> >   
> 


