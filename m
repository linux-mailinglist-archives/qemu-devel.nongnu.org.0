Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EEAC0201
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 11:14:30 +0200 (CEST)
Received: from localhost ([::1]:48340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDmKb-0002oU-03
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 05:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54695)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iDmFf-0006d0-Or
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:09:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iDmFa-0001hi-CM
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:09:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46818)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iDmFa-0001ea-6Y
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:09:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7D613071549;
 Fri, 27 Sep 2019 09:09:13 +0000 (UTC)
Received: from redhat.com (ovpn-112-55.ams2.redhat.com [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 238EB196B2;
 Fri, 27 Sep 2019 09:09:07 +0000 (UTC)
Date: Fri, 27 Sep 2019 10:09:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] i386: Re-add "pconfig" CPUID flag name
Message-ID: <20190927090905.GC20911@redhat.com>
References: <20190926212326.4092-1-ehabkost@redhat.com>
 <CABgObfa-PHfeNVVYCuEFJ4_=KADJEddJS1k0Au+sOgtxgundDQ@mail.gmail.com>
 <20190927004220.GV8144@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190927004220.GV8144@habkost.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 27 Sep 2019 09:09:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: thomas.lendacky@amd.com, "Kang, Luwei" <luwei.kang@intel.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 Robert Hoo <robert.hu@linux.intel.com>, kai.huang@intel.com,
 robert.hu@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 26, 2019 at 09:42:20PM -0300, Eduardo Habkost wrote:
> (CCing libvir-list)
> 
> On Thu, Sep 26, 2019 at 11:58:30PM +0200, Paolo Bonzini wrote:
> > Is this really needed? QEMU's value of pconfig=on vs. off should be
> > provided by QMP CPU model queries, if a property is not available then
> > Libvirt should not try to set it to off.
> > 
> 
> Libvirt can easily work around it for new VMs, and it should.
> 
> The issue are VMs that were created with QEMU 3.1.0.  QEMU 3.1.0
> was telling libvirt "Icelake-Server can't be used unless
> pconfig=off is used", and libvirt was adding pconfig=off to the
> domain XML as expected.
> 
> It would be wrong for libvirt to remove a device option when
> migrating an existing VM to another QEMU version.  We can change
> the rules (and document that), but do we want to?

IIUC currently any existing VMs with Icelake-Server will *not* have
pconfig present, since libvirt is going to set pconfig=off

QEMU has now dropped pconfig CPUID entirely. If libvirt were to stop
setting pconfig=off, then there is NO guest ABI change, so we'd be
safe in that sense.

I'll defer to Jiri on how we'd actually go about making that work
in libvirt from a code POV.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

