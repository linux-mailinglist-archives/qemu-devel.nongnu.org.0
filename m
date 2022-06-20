Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711355152F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 12:04:50 +0200 (CEST)
Received: from localhost ([::1]:57764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3EH2-0004DX-Sf
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 06:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3ED7-0002nQ-BY
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:00:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3ED1-0004WS-Jg
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 06:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655719238;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3vEEnGUsjAkGeuZivo+GncNsKALxt7RHatxu+E39Fw=;
 b=RQQc7Xo01NOvVbtf6rOTf1Xp3vcdzuVvxyoLXiW+xQzqfSUv+JOUj/8GXZniEiyr7dJoxi
 pbFwrcbpR0Wv6T9vPIARKiGukT6pKF71E/tDOZrSlKSg0sOBY86taXqEgqP6sTvUHZ/NLg
 DLCFAjDSbH3m/xQ2xJzeNR5ritQFLOU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-U7y7XiaQPGuuhgvJuiiGUw-1; Mon, 20 Jun 2022 06:00:35 -0400
X-MC-Unique: U7y7XiaQPGuuhgvJuiiGUw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80291801756;
 Mon, 20 Jun 2022 10:00:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2E6E40314B;
 Mon, 20 Jun 2022 10:00:32 +0000 (UTC)
Date: Mon, 20 Jun 2022 11:00:30 +0100
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
Message-ID: <YrBFPsL/y51rp4IA@redhat.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com>
 <Yqw1wf+QjaBQ3I6M@redhat.com>
 <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrArvxwzVWQK4Hu8@redhat.com>
 <151603a7-7c5f-baa2-81b5-afb8aa30ff38@redhat.com>
 <MWHPR11MB0031AA06E7B46D66291F7E0A9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MWHPR11MB0031AA06E7B46D66291F7E0A9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Mon, Jun 20, 2022 at 09:29:05AM +0000, Zhang, Chen wrote:
> 
> > 
> > On 20/06/2022 10.11, Daniel P. Berrangé wrote:
> > > On Mon, Jun 20, 2022 at 05:59:06AM +0000, Zhang, Chen wrote:
> > >>
> > >>
> > >>> On Fri, Jun 17, 2022 at 03:36:19PM +0800, Zhang Chen wrote:
> > >>>> Make iovisor/ubpf project be a git submodule for QEMU.
> > >>>> It will auto clone ubpf project when configure QEMU.
> > >>>
> > >>> I don't think we need todo this. As it is brand new functionality we
> > >>> don't have any back compat issues. We should just expect the distros
> > >>> to ship ubpf if they want their QEMU builds to take advantage of it.
> > >>>
> > >>
> > >> Yes, agree. It's the best way to use the uBPF project.
> > >> But current status is distros(ubuntu, RHEL...) does not ship the
> > >> iovisor/ubpf like the iovisor/bcc. So I have to do it.
> > >> Or do you have any better suggestions?
> > >
> > > If distros want to support the functionality, they can add packages
> > > for it IMHO.
> > 
> > Yes, let's please avoid new submodules. Submodules can sometimes be a
> > real PITA (e.g. if you forget to update before rsync'ing your code to a
> > machine that has limited internet access), and if users install QEMU from
> > sources, they can also install ubpf from sources, too.
> > And if distros want to support this feature, they can package ubpf on their
> > own, as Daniel said.
> 
> Hi Daniel and Thomas,
> 
> I don't know much the background history of QEMU submodules, but meson build
> is a submodule for QEMU too. It means user can't install QEMU from sources
> with limited internet access. 
> And back to Daniel's comments,  Yes, the best way is distros add the ubpf packages,
> But maybe it's too late to implement new features for us. We can introduce the submodule now and
> auto change to the distros's lib when distros add it.  For example QEMU's submodule SLIRP do it in the same way.
> It's already added by most distros and still as a QEMU submodule. It make user experience the latest technology
> with no other dependencies. uBPF infrastructure have the ability to extend the capabilities without requiring
> changing source code. If we not allow it, we have to re-implement all the eBPF assembler, disassembler,
> interpreter, and JIT compiler like DPDK userspace eBPF support (DPDK can't use ubpf project by license issue).

Slirp is a different scenario. That was functionality that was historically
integrated into QEMU and was then spun out into a standalone project. Since
we had existing users on existing distro releases dependant on Slirp, we wanted
to give a smooth upgrade experiance by bundling Slirp. Essentially the goal was
to avoid the regression if someone deployed new QEMU on existing distros.

Meson is a fairly similar scenario. We wanted to swap the build system in
QEMU over to Meson, and that change would affect all existing users of QEMU.
Many distros didn't have a new enough meson, and so bundling it in QEMU enables
us to give a smooth upgrade path without any regression for existing users
on existing distros.

This patch, however, is proposing an entirely new piece of functionality
that has no existing users and even once present will be used by relatively
few users compartively speaking. As such there is no upgrade compatibility /
regression scenario that we need to worry about. Anyone interested in the
new functionality can be reasonably asked to either wait for the distro to
package it, or build it themselves. 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


