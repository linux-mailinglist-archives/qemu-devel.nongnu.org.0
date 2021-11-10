Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0744C311
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:38:08 +0100 (CET)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkojn-0000G9-Rj
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:38:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkoi8-0007gF-IM
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:36:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mkoi3-0005ns-2r
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:36:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636554977;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VxevmmbfWPGJZ01JlIHsJEKU5WpFK4dFTuaqYV1mFrM=;
 b=FC2xCH0phTUgG/+aLG/OGKJZkQ9I3+Ao/e4/9jHJw3rF0NYXMCeYhzmgdg3OC0F3IobdFe
 2wg7SiFXIO9b1cNFcRtWmMphXUMCwXkg93EaZUrRHExW6sixnUZLYaxrzcQt5PWivfyF2j
 xa41L2dDM6596Bse/Z/uc7OjlzW80AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-Zf07htbrOCuxkPPRsRms4A-1; Wed, 10 Nov 2021 09:36:04 -0500
X-MC-Unique: Zf07htbrOCuxkPPRsRms4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7986A107B263;
 Wed, 10 Nov 2021 14:36:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B6135D6B1;
 Wed, 10 Nov 2021 14:36:02 +0000 (UTC)
Date: Wed, 10 Nov 2021 14:35:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PULL 1/2] hw: m68k: virt: Add compat machine for 6.1
Message-ID: <YYvYzyVnFoaHGPIP@redhat.com>
References: <20211109111517.996104-1-laurent@vivier.eu>
 <20211109111517.996104-2-laurent@vivier.eu>
 <9537b527-d33e-59d5-e196-e1e84fa01325@eik.bme.hu>
 <YYpvvWLvkhR0/igt@redhat.com>
 <fa213548-ca60-bf7b-2075-83bd7f32462a@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <fa213548-ca60-bf7b-2075-83bd7f32462a@eik.bme.hu>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-stable@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 09, 2021 at 08:58:58PM +0100, BALATON Zoltan wrote:
> On Tue, 9 Nov 2021, Daniel P. Berrangé wrote:
> > On Tue, Nov 09, 2021 at 01:34:49PM +0100, BALATON Zoltan wrote:
> > > On Tue, 9 Nov 2021, Laurent Vivier wrote:
> > > > Add the missing machine type for m68k/virt
> > > > 
> > > > Cc: qemu-stable@nongnu.org
> > > > Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > > > Message-Id: <20211106194158.4068596-2-laurent@vivier.eu>
> > > > Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > > > ---
> > > > hw/m68k/virt.c | 9 ++++++++-
> > > > 1 file changed, 8 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> > > > index 4e8bce5aa6f7..0d9e3f83c169 100644
> > > > --- a/hw/m68k/virt.c
> > > > +++ b/hw/m68k/virt.c
> > > > @@ -304,7 +304,14 @@ type_init(virt_machine_register_types)
> > > >     } \
> > > >     type_init(machvirt_machine_##major##_##minor##_init);
> > > > 
> > > > +static void virt_machine_6_1_options(MachineClass *mc)
> > > > +{
> > > > +}
> > > > +DEFINE_VIRT_MACHINE(6, 1, true)
> > > > +
> > > > static void virt_machine_6_0_options(MachineClass *mc)
> > > > {
> > > > +    virt_machine_6_1_options(mc);
> > > > +    compat_props_add(mc->compat_props, hw_compat_6_0, hw_compat_6_0_len);
> > > > }
> > > > -DEFINE_VIRT_MACHINE(6, 0, true)
> > > > +DEFINE_VIRT_MACHINE(6, 0, false)
> > > 
> > > I don't understand how these compat machines work but if these are empty and
> > > essentially the same as the previous version why do we add a new version in
> > > every release? Wouldn't it be enough to add new version when there was an
> > > incompatible change? I mean, instead of listing machine and getting a lot of
> > > virt-6.1, virt-6.0, virt-5.2,... or so, we'd only get versions that are
> > > actually different such as virt-7.0, virt-5.2, virt-5.0 (maybe they are
> > > called differently, just an example) with the versionless alias always
> > > pointing to the latest. Then when QEMU is updated one can see if there was
> > > any change so should update the VM or keep using the older versions. Or does
> > > it work like that and I'm missing it completely?
> > 
> > It doesn't work like that, and that's a good thing.
> > 
> > The versioned machine types are for management applications that want
> > to guarantee an ABI across hosts. When a mgmt app wants to set a new
> > baseline for their QEMU machine types, it is way clearer if every
> > versioned machine type across all target arches supports the same
> > versions, regardless of whether there were any changes or not.
> > 
> > ie if an app wants to set QEMU 6.1.0 as the baseline, they want
> > to be able to set  virt-6.1 for aarch64, for mips, for riscv,
> > instead of having to figure out which versions exists for each
> > arch
> 
> With a bit more logic the management app could easily implement this either
> by dereferencing the alias when creating the VM, say virt is an alias of
> virt-6,0 in QEMU 6.2 then put virt-6.0 in the VM config which then will work
> on anyting newer than QEMU 6.0. Or record the QEMU version in VM config when
> creating the VM saying this needs at least QEMU 6.1 then if there's no
> virt-6.1 or virt points to something newer then go back to the biggest
> version less than 6.1 (this might be more difficult due to changes in QEMU
> versioning but if we assume that at least they are increasing numbers it
> should be possible to find the largest version less than 6.1 for example).
> That way when a user types -machine help they won't get a large list of
> useless versioned machines that are mostly the same anyway. This looks like
> a case that a lazy management sofrware pollutes the human interface while it
> could handle it itself. But that's just my opinion, I don't use these too
> much so don't care too much either. It just looked like something that is
> putting a burden both on users and debelopers (having to add more
> compatiblity stuff to code that's already heavy on boilerplate) for
> something that could be handled within the management software. But maybe
> it's too late to change at this point.

On the contrary, the way we handle this today *reduces* the burden
on everyone involved both QEMU, management apps & users. The amount
of code in QEMU for a machine type with zero back compat properties
is tiny. Simply having this is less burden for QEMU that having to
check whether we need it or not when adding breaking changes. Whether
a machine type has back compat props or not is irrelevant to the end
user / mgmt app, as machine types are opaque objects. They can simply
decide to use a particular machine type version baseline, and be
confident it will "do the right thing" on all targets.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


