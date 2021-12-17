Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29F478C73
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:39:10 +0100 (CET)
Received: from localhost ([::1]:52216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDS1-0003T6-Fn
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:39:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1myDNb-00014O-JC
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1myDNY-0006MJ-F8
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748071;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YzHafUJDN9U8P9bEOVvOkUQwRm/s8Mh1qdftMiC4DU4=;
 b=fHFyUId1yhf11S9xstt+hEdCFC6N2MBnRoDUCCGRjKTsMNeSLnLKYYaW38dtE+E2sHVg+i
 MvThTKOJ/aHakA/p8pK8KrPWRPT8j3ocXS3sUgLa27no/xp6daOojjQE10Uvy76a+yoWDf
 Q+MHZA6oKfYV5DeEJoZ0kVqSKjL2rhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-KTbwSwSpPGSl3G0jBCgXWg-1; Fri, 17 Dec 2021 08:34:23 -0500
X-MC-Unique: KTbwSwSpPGSl3G0jBCgXWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF547100C661;
 Fri, 17 Dec 2021 13:34:21 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB523610A7;
 Fri, 17 Dec 2021 13:34:14 +0000 (UTC)
Date: Fri, 17 Dec 2021 13:34:12 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
Message-ID: <YbyR1C+77+moWF/O@redhat.com>
References: <20211208170241.110551-1-cohuck@redhat.com>
 <87lf0jr6m4.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87lf0jr6m4.fsf@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 17, 2021 at 09:13:55AM +0100, Cornelia Huck wrote:
> On Wed, Dec 08 2021, Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> >
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >  hw/arm/virt.c              |  9 ++++++++-
> >  hw/core/machine.c          |  3 +++
> >  hw/i386/pc.c               |  3 +++
> >  hw/i386/pc_piix.c          | 14 +++++++++++++-
> >  hw/i386/pc_q35.c           | 13 ++++++++++++-
> >  hw/ppc/spapr.c             | 15 +++++++++++++--
> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> >  include/hw/boards.h        |  3 +++
> >  include/hw/i386/pc.h       |  3 +++
> >  9 files changed, 71 insertions(+), 6 deletions(-)
> >
> 


> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 223dd3e05d15..b03026bf0648 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -413,7 +413,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
> >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> >  }
> >  
> > -static void pc_i440fx_6_2_machine_options(MachineClass *m)
> > +static void pc_i440fx_7_0_machine_options(MachineClass *m)
> >  {
> >      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >      pc_i440fx_machine_options(m);
> > @@ -422,6 +422,18 @@ static void pc_i440fx_6_2_machine_options(MachineClass *m)
> >      pcmc->default_cpu_version = 1;
> >  }
> >  
> > +DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
> > +                      pc_i440fx_7_0_machine_options);
> > +
> > +static void pc_i440fx_6_2_machine_options(MachineClass *m)
> > +{
> > +    pc_i440fx_machine_options(m);

Needs to be pc_i440fx_7_0_machine_options()

> > +    m->alias = NULL;
> > +    m->is_default = false;
> > +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> > +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> > +}
> > +
> >  DEFINE_I440FX_MACHINE(v6_2, "pc-i440fx-6.2", NULL,
> >                        pc_i440fx_6_2_machine_options);
> >  
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index e1e100316d93..6b66eb16bb64 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
> >      m->max_cpus = 288;
> >  }
> >  
> > -static void pc_q35_6_2_machine_options(MachineClass *m)
> > +static void pc_q35_7_0_machine_options(MachineClass *m)
> >  {
> >      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >      pc_q35_machine_options(m);
> > @@ -368,6 +368,17 @@ static void pc_q35_6_2_machine_options(MachineClass *m)
> >      pcmc->default_cpu_version = 1;
> >  }
> >  
> > +DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
> > +                   pc_q35_7_0_machine_options);
> > +
> > +static void pc_q35_6_2_machine_options(MachineClass *m)
> > +{
> > +    pc_q35_machine_options(m);

Needs to be pc_q35_7_0_machine_options()

> > +    m->alias = NULL;
> > +    compat_props_add(m->compat_props, hw_compat_6_2, hw_compat_6_2_len);
> > +    compat_props_add(m->compat_props, pc_compat_6_2, pc_compat_6_2_len);
> > +}
> > +
> >  DEFINE_Q35_MACHINE(v6_2, "pc-q35-6.2", NULL,
> >                     pc_q35_6_2_machine_options);
> >  
> 
> So, this apparently causes some problems with one of the avocado tests:
> 
> 162-tests/avocado/x86_cpu_model_versions.py:X86CPUModelAliases.test_4_1_alias -> AssertionError: None != 'Cascadelake-Server-v1' : Cascadelake-Server must be an alias of Cascadelake-Server-v1
> 
> (full output at https://gitlab.com/qemu-project/qemu/-/jobs/1893456217)
> 
> I have looked at the patch again and do not see what might be wrong (has
> something changed with the cpu model versioning recently?)
> 
> Does anyone else (especially the x86 folks) have an idea?

AFAICT, just a typo in chaining up the methods I've pointed out inline.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


