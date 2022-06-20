Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD1551604
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:38:33 +0200 (CEST)
Received: from localhost ([::1]:55718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Enf-0000J0-T6
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3EmV-0007yx-Gs
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3EmQ-0002KU-9h
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655721433;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zXwXxkvxqE1HDc3baBp9cXUovtJoe1+QqBPSdVHs6e0=;
 b=MaP8I90SXf7tp7w4PdMTyGjLnrysRLVBoMBjwR0sUgda2WOFOQiUGosZPZeNCQz94LUD0/
 ZJMsOeUAVD0+5fNqdNnzljRYyTO3pK52P/kumGUe2G/I7uwJsJm89iYO6ENjTKUXh21yrj
 c0vFAzVIbkZP+pJtuKOkz+mtmX2uV/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-MgFSGNLnMXqPQZ4KjpFKTA-1; Mon, 20 Jun 2022 06:37:10 -0400
X-MC-Unique: MgFSGNLnMXqPQZ4KjpFKTA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBAB882A682;
 Mon, 20 Jun 2022 10:37:09 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E295540BB4F;
 Mon, 20 Jun 2022 10:37:07 +0000 (UTC)
Date: Mon, 20 Jun 2022 11:37:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>
Subject: Re: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Message-ID: <YrBN0WRjqeWCWPzJ@redhat.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com>
 <Yqw1wf+QjaBQ3I6M@redhat.com>
 <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrArvxwzVWQK4Hu8@redhat.com>
 <151603a7-7c5f-baa2-81b5-afb8aa30ff38@redhat.com>
 <MWHPR11MB0031AA06E7B46D66291F7E0A9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <c4835276-c0fb-a500-8f8b-326c269ba9f9@redhat.com>
 <MWHPR11MB00316977F6D2A6EBE8151A1B9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MWHPR11MB00316977F6D2A6EBE8151A1B9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

On Mon, Jun 20, 2022 at 10:29:14AM +0000, Zhang, Chen wrote:
> 
> 
> > -----Original Message-----
> > From: Thomas Huth <thuth@redhat.com>
> > Sent: Monday, June 20, 2022 5:44 PM
> > To: Zhang, Chen <chen.zhang@intel.com>; Daniel P. Berrangé
> > <berrange@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> > devel@nongnu.org>; Paolo Bonzini <pbonzini@redhat.com>; Eduardo
> > Habkost <eduardo@habkost.net>; Eric Blake <eblake@redhat.com>; Markus
> > Armbruster <armbru@redhat.com>; Peter Maydell
> > <peter.maydell@linaro.org>; Laurent Vivier <lvivier@redhat.com>; Yuri
> > Benditovich <yuri.benditovich@daynix.com>; Andrew Melnychenko
> > <andrew@daynix.com>
> > Subject: Re: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
> > submodule for QEMU
> > 
> > On 20/06/2022 11.29, Zhang, Chen wrote:
> > >
> > >
> > >> -----Original Message-----
> > >> From: Thomas Huth <thuth@redhat.com>
> > >> Sent: Monday, June 20, 2022 4:47 PM
> > >> To: Daniel P. Berrangé <berrange@redhat.com>; Zhang, Chen
> > >> <chen.zhang@intel.com>
> > >> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> > >> devel@nongnu.org>; Paolo Bonzini <pbonzini@redhat.com>; Eduardo
> > >> Habkost <eduardo@habkost.net>; Eric Blake <eblake@redhat.com>;
> > Markus
> > >> Armbruster <armbru@redhat.com>; Peter Maydell
> > >> <peter.maydell@linaro.org>; Laurent Vivier <lvivier@redhat.com>; Yuri
> > >> Benditovich <yuri.benditovich@daynix.com>; Andrew Melnychenko
> > >> <andrew@daynix.com>
> > >> Subject: Re: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as
> > >> a submodule for QEMU
> > >>
> > >> On 20/06/2022 10.11, Daniel P. Berrangé wrote:
> > >>> On Mon, Jun 20, 2022 at 05:59:06AM +0000, Zhang, Chen wrote:
> > >>>>
> > >>>>
> > >>>>> -----Original Message-----
> > >>>>> From: Daniel P. Berrangé <berrange@redhat.com>
> > >>>>> Sent: Friday, June 17, 2022 4:05 PM
> > >>>>> To: Zhang, Chen <chen.zhang@intel.com>
> > >>>>> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> > >>>>> devel@nongnu.org>; Paolo Bonzini <pbonzini@redhat.com>; Eduardo
> > >>>>> Habkost <eduardo@habkost.net>; Eric Blake <eblake@redhat.com>;
> > >>>>> Markus Armbruster <armbru@redhat.com>; Peter Maydell
> > >>>>> <peter.maydell@linaro.org>; Thomas Huth <thuth@redhat.com>;
> > >> Laurent
> > >>>>> Vivier <lvivier@redhat.com>; Yuri Benditovich
> > >>>>> <yuri.benditovich@daynix.com>; Andrew Melnychenko
> > >>>>> <andrew@daynix.com>
> > >>>>> Subject: Re: [RFC PATCH 01/12] configure: Add iovisor/ubpf project
> > >>>>> as a submodule for QEMU
> > >>>>>
> > >>>>> On Fri, Jun 17, 2022 at 03:36:19PM +0800, Zhang Chen wrote:
> > >>>>>> Make iovisor/ubpf project be a git submodule for QEMU.
> > >>>>>> It will auto clone ubpf project when configure QEMU.
> > >>>>>
> > >>>>> I don't think we need todo this. As it is brand new functionality
> > >>>>> we don't have any back compat issues. We should just expect the
> > >>>>> distros to ship ubpf if they want their QEMU builds to take advantage
> > of it.
> > >>>>>
> > >>>>
> > >>>> Yes, agree. It's the best way to use the uBPF project.
> > >>>> But current status is distros(ubuntu, RHEL...) does not ship the
> > >>>> iovisor/ubpf like the iovisor/bcc. So I have to do it.
> > >>>> Or do you have any better suggestions?
> > >>>
> > >>> If distros want to support the functionality, they can add packages
> > >>> for it IMHO.
> > >>
> > >> Yes, let's please avoid new submodules. Submodules can sometimes be a
> > >> real PITA (e.g. if you forget to update before rsync'ing your code to
> > >> a machine that has limited internet access), and if users install
> > >> QEMU from sources, they can also install ubpf from sources, too.
> > >> And if distros want to support this feature, they can package ubpf on
> > >> their own, as Daniel said.
> > >
> > > Hi Daniel and Thomas,
> > >
> > > I don't know much the background history of QEMU submodules, but
> > meson
> > > build is a submodule for QEMU too. It means user can't install QEMU
> > > from sources with limited internet access.
> > 
> > There is no written policy, but I think the general consensus is that we only
> > ship code in submodules if:
> > 
> > 1) It's not available in a required version in distros yet
> > 
> > and
> > 
> > 2) it is essentially required to build QEMU (like meson) or if the feature has
> > been part of the QEMU sources before and then moved to a separate
> > repository (like slirp).
> > 
> > We ship meson as a submodule since we require some meson features that
> > are not available with the meson versions in the distros yet. Once the distros
> > catch up, we'll likely remove the meson submodule from QEMU.
> > 
> > > And back to Daniel's comments,  Yes, the best way is distros add the
> > > ubpf packages, But maybe it's too late to implement new features for
> > > us. We can introduce the submodule now and auto change to the distros's
> > lib when distros add it.  For example QEMU's submodule SLIRP do it in the
> > same way.
> > 
> > slirp used to be part of the QEMU repository, but then has been moved to a
> > separate project a while ago. However, at that point in time there weren't
> > any packages ins distros yet, so we had to include it as a submodule.
> > 
> > Now that the distros ship it, too, we're planning to remove the slirp
> > submodule from QEMU soon, see:
> > 
> >   https://lists.gnu.org/archive/html/qemu-devel/2022-04/msg00974.html
> > 
> > > It make user experience the latest technology with no other
> > > dependencies.
> > 
> > Well, that's only true if we update the submodule in QEMU regularly. If we
> > forget to update, we could easily miss some important (maybe even security
> > related) fixes from the upstream projects. This can be a nightmare for distros,
> > when they then have to go around and look into each and every projects
> > whether they embed a certain code module that needs a CVE fix. It's better
> > if it can be fixed in one central spot instead.
> > 
> > > uBPF infrastructure have the ability to extend the capabilities
> > > without requiring changing source code. If we not allow it, we have to
> > > re-implement all the eBPF assembler, disassembler, interpreter, and JIT
> > compiler like DPDK userspace eBPF support (DPDK can't use ubpf project by
> > license issue).
> > 
> > Not sure whether I understood that statement right ... nobody said that
> > QEMU should not allow it - we just suggested to rely on a system installation
> > of ubpf instead of embedding the code. Or is that not possible?? (I don't
> > know that project yet - isn't it possible to compile it as a shared library?)
> 
> Thanks for your details explanation.
> It looks better to introduce the uBPF shared library for QEMU.
> For example:
> ./configure --ubpf-lib=path

I've not looked, so maybe it already does this, but ideally  'uBPF'
would ship a 'pkg-config'  file, so that apps can automatically find
it and set the right cflags/libs etc for the compiler. For configure
integration, normally we'd expect it to be --enable-ubpf/--disable-ubpf,
with it automatically enabling itself if the pkg-config file is found.
Take a look at handling of some existing libraries we depend on for
examples.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


