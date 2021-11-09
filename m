Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFFC44AE4B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 13:58:37 +0100 (CET)
Received: from localhost ([::1]:36234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkQhw-0003r4-HX
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 07:58:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkQf7-00085C-9T
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:55:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkQf4-0007T2-7q
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 07:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636462537;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SMNeos7lisBc/fJ9dc6XR6LlhvCz7FZFFxE252Hh7Wc=;
 b=GCKpEaXR6lUUnRRs0O6z23ta+nGPpKE5j6hBHEzCPZ0l1PTt7G7NJe4bvehD8zmQZ71KZT
 +Sk3Z6/2gd/zh1XRvaat2fdQ7QAfQ+N7diHxV7U4QCgS02PbMzgwh7a3psKQqPZpEDT1Dk
 OLpwoqhzR9Q2faZ7/bQsEhKXgaL1ljA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-hre7WvzKNIexXo3RZGAuhw-1; Tue, 09 Nov 2021 07:55:30 -0500
X-MC-Unique: hre7WvzKNIexXo3RZGAuhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9489518125C0;
 Tue,  9 Nov 2021 12:55:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.190])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFFA56A87;
 Tue,  9 Nov 2021 12:55:28 +0000 (UTC)
Date: Tue, 9 Nov 2021 12:55:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PULL 1/2] hw: m68k: virt: Add compat machine for 6.1
Message-ID: <YYpvvWLvkhR0/igt@redhat.com>
References: <20211109111517.996104-1-laurent@vivier.eu>
 <20211109111517.996104-2-laurent@vivier.eu>
 <9537b527-d33e-59d5-e196-e1e84fa01325@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <9537b527-d33e-59d5-e196-e1e84fa01325@eik.bme.hu>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 01:34:49PM +0100, BALATON Zoltan wrote:
> On Tue, 9 Nov 2021, Laurent Vivier wrote:
> > Add the missing machine type for m68k/virt
> > 
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > Message-Id: <20211106194158.4068596-2-laurent@vivier.eu>
> > Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > ---
> > hw/m68k/virt.c | 9 ++++++++-
> > 1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> > index 4e8bce5aa6f7..0d9e3f83c169 100644
> > --- a/hw/m68k/virt.c
> > +++ b/hw/m68k/virt.c
> > @@ -304,7 +304,14 @@ type_init(virt_machine_register_types)
> >     } \
> >     type_init(machvirt_machine_##major##_##minor##_init);
> > 
> > +static void virt_machine_6_1_options(MachineClass *mc)
> > +{
> > +}
> > +DEFINE_VIRT_MACHINE(6, 1, true)
> > +
> > static void virt_machine_6_0_options(MachineClass *mc)
> > {
> > +    virt_machine_6_1_options(mc);
> > +    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
> > }
> > -DEFINE_VIRT_MACHINE(6, 0, true)
> > +DEFINE_VIRT_MACHINE(6, 0, false)
> 
> I don't understand how these compat machines work but if these are empty and
> essentially the same as the previous version why do we add a new version in
> every release? Wouldn't it be enough to add new version when there was an
> incompatible change? I mean, instead of listing machine and getting a lot of
> virt-6.1, virt-6.0, virt-5.2,... or so, we'd only get versions that are
> actually different such as virt-7.0, virt-5.2, virt-5.0 (maybe they are
> called differently, just an example) with the versionless alias always
> pointing to the latest. Then when QEMU is updated one can see if there was
> any change so should update the VM or keep using the older versions. Or does
> it work like that and I'm missing it completely?

It doesn't work like that, and that's a good thing.

The versioned machine types are for management applications that want
to guarantee an ABI across hosts. When a mgmt app wants to set a new
baseline for their QEMU machine types, it is way clearer if every
versioned machine type across all target arches supports the same
versions, regardless of whether there were any changes or not.

ie if an app wants to set QEMU 6.1.0 as the baseline, they want
to be able to set  virt-6.1 for aarch64, for mips, for riscv,
instead of having to figure out which versions exists for each
arch


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


