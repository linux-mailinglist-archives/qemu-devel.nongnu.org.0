Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57B32D81C
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:54:24 +0100 (CET)
Received: from localhost ([::1]:53420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHrF1-0005I7-BM
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lHrDm-0004io-Up
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:53:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lHrDk-0006l4-7O
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614876782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dy6kyJK9duHf+TwTmcPoWhwYLIJoLSF/7iso1UPj3GA=;
 b=efqCm/oU8B/0TSWsv1jGdhLLGdWH/dZ5ORCzybwrT+l+q7prUJuwsZa9WuDDoDEVs+ikVe
 PavICfUZLKPdaHKUWbec+8G9kU90xtvw5Q6PLlk9hRX/eHD6iIwC06HTuC6l903q601NXw
 5nLIWIEA0Xs5aQ7kz/GWDE3GrjCjp+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-mirR_TirM7y3rpEZv_IeHA-1; Thu, 04 Mar 2021 11:53:00 -0500
X-MC-Unique: mirR_TirM7y3rpEZv_IeHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D069BCC629;
 Thu,  4 Mar 2021 16:52:59 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E9C25DA2D;
 Thu,  4 Mar 2021 16:52:53 +0000 (UTC)
Date: Thu, 4 Mar 2021 17:52:50 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
Message-ID: <20210304165250.GZ2875719@angien.pipo.sk>
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
 <YEC74LYdmj2p8IyY@redhat.com> <87v9a7dmfk.fsf@dusky.pond.sub.org>
 <YEDv5l/tGdnDtiHh@redhat.com> <87k0qmdh1y.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87k0qmdh1y.fsf@dusky.pond.sub.org>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 17:23:05 +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Mar 04, 2021 at 03:26:55PM +0100, Markus Armbruster wrote:
> >> Daniel P. Berrangé <berrange@redhat.com> writes:
> >> 
> >> > On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
> >> >> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
> >> >> configuring floppies with -global isa-fdc" (v5.1.0).
> >> >> 
> >> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >> >> ---
> >> >>  docs/system/deprecated.rst       |  26 --
> >> >>  docs/system/removed-features.rst |  26 ++
> >> >>  hw/block/fdc.c                   |  54 +--
> >> >>  tests/qemu-iotests/172           |  31 +-
> >> >>  tests/qemu-iotests/172.out       | 562 +------------------------------
> >> >>  5 files changed, 30 insertions(+), 669 deletions(-)

[...]

> >> 
> >> Correct.
> >> 
> >> This was deprecated in commit 4a27a638e7 "fdc: Deprecate configuring
> >> floppies with -global isa-fdc" (v5.1.0).  Since then, its use triggers a
> >> warning:
> >> 
> >>     $ qemu-system-x86_64 -nodefaults -M q35 -display none -drive if=none,id=drive-fdc0-0-0 -device isa-fdc,driveA=drive-fdc0-0-0,bootindexA=1
> >>     qemu-system-x86_64: -device isa-fdc,driveA=drive-fdc0-0-0,bootindexA=1: warning: warning: property isa-fdc.driveA is deprecated
> >>     Use -device floppy,unit=0,drive=... instead.
> >> 
> >> Note the -M q35.  Needed because the default machine type has an onboard
> >> isa-fdc, which cannot be configured this way.
> >> 
> >> Sadly, the commit's update of docs/system/deprecated.rst neglects to
> >> cover this use.  Looks the series overtaxed my capacity to juggle
> >> details; my apologies.
> >> 
> >> Is libvirt still using these properties?
> >
> > Unfortunately yes, but it seems like it ought to be fairly easy to
> > change the syntax. Just need to figure out what the right way to
> > detect the availability of the new syntax is. Presumably just look
> > for existance of the 'floppy' device type ?
> 
> Yes.  The device type was added in merge commit fd209e4a7, v2.8.0.
> 
> > Can you confirm that switching from -global to the new -device floppy
> > does /not/ have any live migration impact ?
> 
> Yes, it must not affect migration.
> 
> When Kevin split the floppy device type off the floppy controller, he
> had to add some moderately ugly hackery to keep the old qdev properties
> working.  Think propagate property values to floppy from controller,
> which otherwise ignores them.
> 
> The way you get the values into the floppy device cannot affect the
> migration data.  Only different values can.
> 
> This patch removes a deprecated way.

Note that when QEMU_CAPS_BLOCKDEV is asserted we format floppies as:

-blockdev '{"driver":"file","filename":"/tmp/firmware.img",\
"node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-2-format","read-only":false,"driver":"raw",\
"file":"libvirt-2-storage"}' \
-device floppy,unit=0,drive=libvirt-2-format,id=fdc0-0-0 \
-blockdev '{"driver":"file","filename":"/tmp/data.img",\
"node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qcow2",\
"file":"libvirt-1-storage"}' \
-device floppy,unit=1,drive=libvirt-1-format,id=fdc0-0-1 \

as visible in the test file:

tests/qemuxml2argvdata/disk-floppy-q35-2_11.x86_64-latest.args

So libvirt should be in the clear. isa-fdc with driveA/driveB is
formatted only when the blockdev capability isn't present.


