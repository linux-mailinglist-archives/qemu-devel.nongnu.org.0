Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8332D828
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:56:28 +0100 (CET)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrH1-0006iR-7M
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHrFE-000683-P4
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:54:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHrFA-0007PS-AR
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614876871;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dd8VdywzKoJx3fKCWCSIhTl5fjyuDaKWHZ2Ij15YrNo=;
 b=KYFkMV+oww0FCJiXMOSCofJEeUOBHbjqPqsw6rM46DHdFAVW4FSwazNlFVtkGwgenyedxj
 tQtrThnEIgzyteDHuZ8WVyoZWgTrNJ4YY1A0FSukK5V3LctV1aIIOghOCDwLjkq4cPVqDl
 rYu+/BfY2dXfjs1aSIB4DU2qmG3iih8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-cSkZFpsVPsqLDC02euEf-w-1; Thu, 04 Mar 2021 11:54:27 -0500
X-MC-Unique: cSkZFpsVPsqLDC02euEf-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1049F800D53;
 Thu,  4 Mar 2021 16:54:26 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD07E60CCB;
 Thu,  4 Mar 2021 16:54:23 +0000 (UTC)
Date: Thu, 4 Mar 2021 16:54:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
Message-ID: <YEEQvHAJADUKd0Eb@redhat.com>
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
 <YEC74LYdmj2p8IyY@redhat.com> <87v9a7dmfk.fsf@dusky.pond.sub.org>
 <YEDv5l/tGdnDtiHh@redhat.com> <87k0qmdh1y.fsf@dusky.pond.sub.org>
 <20210304165250.GZ2875719@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <20210304165250.GZ2875719@angien.pipo.sk>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 05:52:50PM +0100, Peter Krempa wrote:
> On Thu, Mar 04, 2021 at 17:23:05 +0100, Markus Armbruster wrote:
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> > 
> > > On Thu, Mar 04, 2021 at 03:26:55PM +0100, Markus Armbruster wrote:
> > >> Daniel P. Berrangé <berrange@redhat.com> writes:
> > >> 
> > >> > On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
> > >> >> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
> > >> >> configuring floppies with -global isa-fdc" (v5.1.0).
> > >> >> 
> > >> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > >> >> ---
> > >> >>  docs/system/deprecated.rst       |  26 --
> > >> >>  docs/system/removed-features.rst |  26 ++
> > >> >>  hw/block/fdc.c                   |  54 +--
> > >> >>  tests/qemu-iotests/172           |  31 +-
> > >> >>  tests/qemu-iotests/172.out       | 562 +------------------------------
> > >> >>  5 files changed, 30 insertions(+), 669 deletions(-)
> 
> [...]
> 
> > >> 
> > >> Correct.
> > >> 
> > >> This was deprecated in commit 4a27a638e7 "fdc: Deprecate configuring
> > >> floppies with -global isa-fdc" (v5.1.0).  Since then, its use triggers a
> > >> warning:
> > >> 
> > >>     $ qemu-system-x86_64 -nodefaults -M q35 -display none -drive if=none,id=drive-fdc0-0-0 -device isa-fdc,driveA=drive-fdc0-0-0,bootindexA=1
> > >>     qemu-system-x86_64: -device isa-fdc,driveA=drive-fdc0-0-0,bootindexA=1: warning: warning: property isa-fdc.driveA is deprecated
> > >>     Use -device floppy,unit=0,drive=... instead.
> > >> 
> > >> Note the -M q35.  Needed because the default machine type has an onboard
> > >> isa-fdc, which cannot be configured this way.
> > >> 
> > >> Sadly, the commit's update of docs/system/deprecated.rst neglects to
> > >> cover this use.  Looks the series overtaxed my capacity to juggle
> > >> details; my apologies.
> > >> 
> > >> Is libvirt still using these properties?
> > >
> > > Unfortunately yes, but it seems like it ought to be fairly easy to
> > > change the syntax. Just need to figure out what the right way to
> > > detect the availability of the new syntax is. Presumably just look
> > > for existance of the 'floppy' device type ?
> > 
> > Yes.  The device type was added in merge commit fd209e4a7, v2.8.0.
> > 
> > > Can you confirm that switching from -global to the new -device floppy
> > > does /not/ have any live migration impact ?
> > 
> > Yes, it must not affect migration.
> > 
> > When Kevin split the floppy device type off the floppy controller, he
> > had to add some moderately ugly hackery to keep the old qdev properties
> > working.  Think propagate property values to floppy from controller,
> > which otherwise ignores them.
> > 
> > The way you get the values into the floppy device cannot affect the
> > migration data.  Only different values can.
> > 
> > This patch removes a deprecated way.
> 
> Note that when QEMU_CAPS_BLOCKDEV is asserted we format floppies as:
> 
> -blockdev '{"driver":"file","filename":"/tmp/firmware.img",\
> "node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"}' \
> -blockdev '{"node-name":"libvirt-2-format","read-only":false,"driver":"raw",\
> "file":"libvirt-2-storage"}' \
> -device floppy,unit=0,drive=libvirt-2-format,id=fdc0-0-0 \
> -blockdev '{"driver":"file","filename":"/tmp/data.img",\
> "node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}' \
> -blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qcow2",\
> "file":"libvirt-1-storage"}' \
> -device floppy,unit=1,drive=libvirt-1-format,id=fdc0-0-1 \
> 
> as visible in the test file:
> 
> tests/qemuxml2argvdata/disk-floppy-q35-2_11.x86_64-latest.args
> 
> So libvirt should be in the clear. isa-fdc with driveA/driveB is
> formatted only when the blockdev capability isn't present.

Ahh, excellant, I missed that detailed and worried that we still had
work todo.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


