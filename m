Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8CD520FAB
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 10:24:40 +0200 (CEST)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noLAd-0000Jn-Rs
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 04:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noL0s-0001gt-1g
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:14:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noL0o-0005eo-MT
 for qemu-devel@nongnu.org; Tue, 10 May 2022 04:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652170469;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oThJDmoRhecfGNYeBU6b58Bud1LzaWDeIs6kGKMHRNo=;
 b=BUdg6JpIGwqZ+N1di/5T3MyOpSlY7sL3dA95VpjvlDjpBWPWVqvxXcYeNONd3kWw10OdLU
 oDyHZAqbK/FgkJlfJIH2gIjYd2Dhl1bveJj80JUg71ZCkS+IEGhGgJYl80KcJg5fQa3O+A
 tZOz6H/NHukaeRicC+KS3NQg4pjyeXg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-mwvCJAfKMsOYfrQxJLDr9Q-1; Tue, 10 May 2022 04:14:26 -0400
X-MC-Unique: mwvCJAfKMsOYfrQxJLDr9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFD6229ABA16;
 Tue, 10 May 2022 08:14:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.168])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A841A40CFD17;
 Tue, 10 May 2022 08:14:21 +0000 (UTC)
Date: Tue, 10 May 2022 09:14:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, mst@redhat.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, jon.grimm@amd.com
Subject: Re: [PATCH] pc: q35: Bump max_cpus to 512
Message-ID: <Ynoe242xK4d5kNwk@redhat.com>
References: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
 <20220509091249.392fdab6@redhat.com> <YnkDGsIi1vFvXmiP@redhat.com>
 <20220510090325.2781238a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220510090325.2781238a@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 10, 2022 at 09:03:25AM +0200, Igor Mammedov wrote:
> On Mon, 9 May 2022 13:03:38 +0100
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Mon, May 09, 2022 at 09:12:49AM +0200, Igor Mammedov wrote:
> > > On Wed, 4 May 2022 08:16:39 -0500
> > > Suravee Suthikulpanit <suravee.suthikulpanit@amd.com> wrote:
> > >   
> > > > This is the maximum number of vCPU supported by
> > > > the AMD x2APIC virtualization.
> > > > 
> > > > Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
> > > > ---
> > > >  hw/i386/pc_q35.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > > > index 302288342a..e82b1c690d 100644
> > > > --- a/hw/i386/pc_q35.c
> > > > +++ b/hw/i386/pc_q35.c
> > > > @@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
> > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
> > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
> > > >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> > > > -    m->max_cpus = 288;
> > > > +    m->max_cpus = 512;  
> > > 
> > > Maybe we should bump it to KVM VCPU maximum,
> > > and make sure we error out if asked for combination of
> > > hardware/irqchip is not usable.  
> > 
> > In RHEL downstream we currently bump this to 710 CPUs, because you
> > overflow the SMBIOS 2.1 tables at approx 720 CPUs (give/take a little
> > depending on other config options).
> 
> Also there were some testing done with 1024,
> but my main reason for matching KVM's limit is unblock upstream
> testing so it would be easier to push limits for others.
> Downstream can clamp that value down to whatever it deems as supported.
> 
> > Going beyond 710 CPUs value requires using the SMBIOS 3 entry point.
> > 
> > AFAIK, the x86 machine types still default to SMBIOS 2.1, so that
> > would need changing too.
> 
> Yep, we can change default to SMBIOS 3 starting with new machine type (7.1?)
> or conditionally depending on requested number of CPUs,
> though I'd prefer machine type approach.

Agree, machine type is better IMHO, a it gives us a consistent guest
ABI regardless of CPU count.

> As for SMBIOS 3, we still have to update CPU structures to support more than
> 255 vcpus (Julia was working on it). It's long standing bug, but that doesn't
> seem to be critical, as guest boots fine with old structures.

What's the impact of SMBIOS 3 being limited to 255 ?  That's lower than
the current max CPUs of 288 in upstream / 710 in downstream.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


