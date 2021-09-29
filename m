Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B1C41C232
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 12:02:58 +0200 (CEST)
Received: from localhost ([::1]:45324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWQS-0004JR-UQ
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 06:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVWAy-0002cg-Ro
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:46:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mVWAu-00049C-I6
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632908811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W5jL/kQPWRgi5oY/HZGuBeGgWKTMUHFskVtY3+9lNmk=;
 b=K0Ih+rXaPDxua4W9R+Qub3RMaIE9VR7vsbnKrEIpYchW4NQWdHUjdXoK7gXzFNkmvACDhB
 znJDXog4WPwvN6vg2xdyWsakZ8AKiDirEf/Y17DYyQxN1RA6DOQ+osBQ72rKARyGQxlGMC
 ZeXfFP+Hjv5t55vGB6Cg6sst2WKyXSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-bO-ZuURXNxe5Lt6l-FVN2w-1; Wed, 29 Sep 2021 05:46:48 -0400
X-MC-Unique: bO-ZuURXNxe5Lt6l-FVN2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59E5410168C0;
 Wed, 29 Sep 2021 09:46:47 +0000 (UTC)
Received: from localhost (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2E9F604CC;
 Wed, 29 Sep 2021 09:46:39 +0000 (UTC)
Date: Wed, 29 Sep 2021 10:46:39 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 0/1] vmx: Fix <genid/> mapping
Message-ID: <20210929094638.GF3361@redhat.com>
References: <cover.1632900578.git.mprivozn@redhat.com>
 <20210929092044.GE3361@redhat.com> <YVQy9yiU1RPxCcM8@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVQy9yiU1RPxCcM8@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Michal Privoznik <mprivozn@redhat.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 10:33:43AM +0100, Daniel P. Berrangé wrote:
> On Wed, Sep 29, 2021 at 10:20:44AM +0100, Richard W.M. Jones wrote:
> > On Wed, Sep 29, 2021 at 10:01:55AM +0200, Michal Privoznik wrote:
> > > Apparently, parsing vmx.genid is not as easy as I thought. Anyway, it
> > > was brought up in a private thread that libvirt doesn't report correct
> > > UUIDs. For instance for the following input:
> > > 
> > >   vm.genid = "-8536691797830587195"
> > >   vm.genidX = "-1723453263670062919"
> > 
> > (The two lines above come from a VMware .vmx file)
> > 
> > The only thing that really matters is what the guest sees.  I ran
> > VMGENID.EXE (https://bugzilla.redhat.com/show_bug.cgi?id=1598350#c3
> > https://docs.microsoft.com/en-gb/windows/win32/hyperv_v2/virtual-machine-generation-identifier)
> > inside the guest and it showed:
> > 
> >   8987940a09512cc5:e81510634ff550b9
> > 
> > Note these numbers are the hex equivalents of the VMware .vmx numbers:
> > 
> > >>> print("%x" % (2**64-8536691797830587195))
> > 8987940a09512cc5
> > >>> print("%x" % (2**64-1723453263670062919))
> > e81510634ff550b9
> > 
> > > Libvirt would report:
> > > 
> > >   <genid>8987940a-0951-2cc5-e815-10634ff550b9</genid>
> > > 
> > > while virt-v2v would report:
> > > 
> > >   <genid>09512cc5-940a-8987-b950-f54f631015e8</genid>
> > 
> > After thinking about this a bit more, IMHO the real problem is
> > with qemu.  If you pass this to qemu:
> > 
> >   -device vmgenid,guid=8987940a-0951-2cc5-e815-10634ff550b9,id=vmgenid0
> > 
> > then inside the guest VMGENID shows 2cc509518987940a:b950f54f631015e8 (wrong)
> > 
> > If you pass this to qemu:
> > 
> >   ...guid=09512cc5-940a-8987-b950-f54f631015e8...
> > 
> > then inside the guest it sees 8987940a09512cc5:e81510634ff550b9
> > (the correct values, matching VMware).
> > 
> > This is the reason why virt-v2v mangles the GUID, in order to trick
> > libvirt into passing a mangled GUID which gets mangled again by qemu
> > which is the same as unmangling it.
> > 
> > So another way to fix this could be for us to fix qemu.  We could just
> > pass the two numbers to qemu instead of using GUIDs, eg:
> > 
> >   -device vmgenid,low=0x8987940a09512cc5,high=0xe81510634ff550b9,id=vmgenid0
> > 
> > and then we'd fix the implementation in qemu so that the low/high
> > values match what is seen by VMGENID.EXE in the guest.
> > 
> > Or we could have libvirt use the current GUID in <genid> but to do the
> > mangling when it gets passed through to qemu (instead of virt-v2v
> > doing the mangling).
> 
> On the libvirt side, the #1 most important thing is that a given
> XML string
> 
>   <genid>8987940a-0951-2cc5-e815-10634ff550b9</genid>
> 
> results in the same value being exposed to the guest OS, for both
> the QEMU and VMWare drivers.  Whehter the guest sees the bytes in
> the same order is not essential, but it would be less of a surprise
> if it did match.

I don't know why we decided to use a GUID for this.  The feature
itself (https://go.microsoft.com/fwlink/?LinkId=260709) defines it as
an 128 bit / 8 byte number.  The only connection to GUIDs is the size.

> Ultimately as long as the mapping from libvirt XML to guest visible
> string is consistent across drivers, that's sufficient.
> 
> > Adding qemu-devel because I'm interesting to see if the qemu
> > developers would prefer to fix this properly in qemu.
> 
> No matter what order QEMU accepts the data in, it can be said to be
> functionally correct. If the order is "unusual" though, it ought to
> at least be documented how the QEMU order corresponds to guest visible
> order.
> 
> Incidentally I wonder how much to trust VMGENID.EXE and whether that
> actally reports what it gets out of guest memory "as is", or whether
> it has done any byte re-ordering.
> 
> I'm curious what Linux kernel sees for the genid on Vmware vs KVM
> hosts, as probably I'd trust that data more ?

As far as I can tell no driver has successfully made it upstream,
although there have been a few attempts:

  https://lkml.org/lkml/2018/3/1/498

Here's a more recent one from 10 months ago:

  https://lore.kernel.org/linux-doc/3E05451B-A9CD-4719-99D0-72750A304044@amazon.com/

If I have time I'll patch a Linux kernel with the second patch and see
how it relates to the VMware and KVM parameters, but it probably won't
be today.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW


