Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3566F3058E6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:56:16 +0100 (CET)
Received: from localhost ([::1]:46886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4iUh-0003SK-7f
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4iTG-0002cS-DJ
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:54:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l4iTE-0002tG-Fk
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611744883;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0+xcFAWFp8hAXp79yniJC92Sedkx/+dUO5YbPFvxT4=;
 b=gWmN3R20b5AjB4M3UaQcMiIsVrayYcAYieSuhu9xT0DLuROrtNJSuAJHwLKax/S4JwnSGM
 t6wmmR/LD7qO3HCDzd9Bj+yasPvTG40lDcvP0QyyHcTx/Q33Z5cXsXoXMxxgHNk7CQQBmV
 udYpm/nZ2w66JaBxobIpvhDFhVuwmAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-xILXg-n3MqGDLN7tkUOgmg-1; Wed, 27 Jan 2021 05:54:41 -0500
X-MC-Unique: xILXg-n3MqGDLN7tkUOgmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A54DB8145E5;
 Wed, 27 Jan 2021 10:54:40 +0000 (UTC)
Received: from redhat.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDFCA100AE2D;
 Wed, 27 Jan 2021 10:54:38 +0000 (UTC)
Date: Wed, 27 Jan 2021 10:54:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
Message-ID: <20210127105436.GG3653144@redhat.com>
References: <20210121161504.1007247-1-imammedo@redhat.com>
 <20210127104511.GF3653144@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210127104511.GF3653144@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: mprivozn@redhat.com, peter.maydell@linaro.org, pkrempa@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 10:45:11AM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 21, 2021 at 11:15:04AM -0500, Igor Mammedov wrote:
> > Add documentation for '-machine memory-backend' CLI option and
> > how to use it.
> > 
> > And document that x-use-canonical-path-for-ramblock-id,
> > is considered to be stable to make sure it won't go away by accident.
> > 
> > x- was intended for unstable/iternal properties, and not supposed to
> > be stable option. However it's too late to rename (drop x-)
> > it as it would mean that users will have to mantain both
> > x-use-canonical-path-for-ramblock-id (for QEMU 5.0-5.2) versions
> > and prefix-less for later versions.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v2:
> >  - add doc that x-use-canonical-path-for-ramblock-id is considered stable,
> >      (Peter Krempa <pkrempa@redhat.com>)
> > v3:
> >  - s/x-use-canonical-path-for-ramblock-id=on/x-use-canonical-path-for-ramblock-id=off/
> >      (Michal Privoznik <mprivozn@redhat.com>)
> >  - add to commit message why x- prefix is preserved
> >  - drop clause about x-use-canonical-path-for-ramblock-id being stable
> >    from help section, but keep it in code comment above
> >    x-use-canonical-path-for-ramblock-id property. It's sufficient
> >    to prevent option being changed/removed by accident.
> >      (Peter Maydell <peter.maydell@linaro.org>)
> > ---
> >  backends/hostmem.c | 10 ++++++++++
> >  qemu-options.hx    | 26 +++++++++++++++++++++++++-
> >  2 files changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/backends/hostmem.c b/backends/hostmem.c
> > index 9f9ac95edd..813aeb83c9 100644
> > --- a/backends/hostmem.c
> > +++ b/backends/hostmem.c
> > @@ -498,6 +498,16 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
> >          host_memory_backend_get_share, host_memory_backend_set_share);
> >      object_class_property_set_description(oc, "share",
> >          "Mark the memory as private to QEMU or shared");
> > +    /*
> > +     * Do not delete/rename option. This option must be considered stable
> > +     * (as if it didn't have the 'x-' prefix including deprecation period) as
> > +     * long as 4.0 and older machine types exists.
> > +     * Option will be used by upper layers to override (disable) canonical path
> > +     * for ramblock-id set by compat properties on old machine types ( <= 4.0),
> > +     * to keep migration working when backend is used for main RAM with
> > +     * -machine memory-backend= option (main RAM historically used prefix-less
> > +     * ramblock-id).
> > +     */
> >      object_class_property_add_bool(oc, "x-use-canonical-path-for-ramblock-id",
> >          host_memory_backend_get_use_canonical_path,
> >          host_memory_backend_set_use_canonical_path);
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 62791f56d8..059b1a1d14 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -35,7 +35,8 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> >      "                suppress-vmdesc=on|off disables self-describing migration (default=off)\n"
> >      "                nvdimm=on|off controls NVDIMM support (default=off)\n"
> >      "                memory-encryption=@var{} memory encryption object to use (default=none)\n"
> > -    "                hmat=on|off controls ACPI HMAT support (default=off)\n",
> > +    "                hmat=on|off controls ACPI HMAT support (default=off)\n"
> > +    "                memory-backend='backend-id' specifies explicitly provided backend for main RAM (default=none)\n",
> >      QEMU_ARCH_ALL)
> >  SRST
> >  ``-machine [type=]name[,prop=value[,...]]``
> > @@ -96,6 +97,29 @@ SRST
> >      ``hmat=on|off``
> >          Enables or disables ACPI Heterogeneous Memory Attribute Table
> >          (HMAT) support. The default is off.
> > +
> > +     ``memory-backend='id'``
> > +        An alternative to legacy ``-mem-path`` and ``mem-prealloc`` options.
> > +        Allows to use a memory backend as main RAM.
> > +
> > +        For example:
> > +        ::
> > +        -object memory-backend-file,id=pc.ram,size=512M,mem-path=/hugetlbfs,prealloc=on,share=on
> > +        -machine memory-backend=pc.ram
> > +        -m 512M
> > +
> > +        Migration compatibility note:
> > +        a) as backend id one shall use value of 'default-ram-id', advertised by
> > +        machine type (available via ``query-machines`` QMP command), if migration
> > +        to/from old QEMU (<5.0) is expected.
> > +        b) for machine types 4.0 and older, user shall
> > +        use ``x-use-canonical-path-for-ramblock-id=off`` backend option
> > +        if migration to/from old QEMU (<5.0) is expected.
> 
> How does a mgmt app know which machine types need to use this
> option ? The machine type names are opaque strings, and apps
> must not attempt to parse or interpret the version number
> inside the machine type name, as they can be changed by
> distros.  IOW, saying to use it for machine types 4.0 and
> older isn't a valid usage strategy IMHO.

Looking at the libvirt patch, we do indeed use his property
unconditionally for all machine types, precisely because parsing
version numbers from the machine type is not allowed.

https://www.redhat.com/archives/libvir-list/2021-January/msg00633.html

So this doc is telling apps to do something that isn't viable


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


