Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCD32E26C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 07:42:58 +0100 (CET)
Received: from localhost ([::1]:40796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI4Ar-0008LP-3K
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 01:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lI49s-0007qu-Vo
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:41:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lI49r-0005vY-0O
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614926513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WilF3ry6BPdRpEZVhtWbK3x4VuF4ppFOGHNPlr4lrY8=;
 b=c4Qy7WOjG7bSlzKHtAheME2l0fRCgtyGuRifC8J439jfYjxS4w7ueHYdgEZ2wXJpaN4C7y
 MALIoAQbC1PRZqIHdlQ0og0KxwUg84WIXS6Tkt5WHmuzzPIFuKMEpjw+nw0mGrLXPmdrVn
 bYdqNnHQCowpc2ipPA+SlYD1kHYCcJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-RkakD07SO-qwFlwVMQM-fg-1; Fri, 05 Mar 2021 01:41:51 -0500
X-MC-Unique: RkakD07SO-qwFlwVMQM-fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71C191074644;
 Fri,  5 Mar 2021 06:41:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-73.ams2.redhat.com
 [10.36.112.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E70E95C1A1;
 Fri,  5 Mar 2021 06:41:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7ECFD1132C12; Fri,  5 Mar 2021 07:41:45 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH v2 1/3] fdc: Drop deprecated floppy configuration
References: <20210304100059.157158-1-armbru@redhat.com>
 <20210304100059.157158-2-armbru@redhat.com>
 <YEC74LYdmj2p8IyY@redhat.com> <87v9a7dmfk.fsf@dusky.pond.sub.org>
 <YEDv5l/tGdnDtiHh@redhat.com> <87k0qmdh1y.fsf@dusky.pond.sub.org>
 <20210304165250.GZ2875719@angien.pipo.sk>
Date: Fri, 05 Mar 2021 07:41:45 +0100
In-Reply-To: <20210304165250.GZ2875719@angien.pipo.sk> (Peter Krempa's message
 of "Thu, 4 Mar 2021 17:52:50 +0100")
Message-ID: <87wnum9k5y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Krempa <pkrempa@redhat.com> writes:

> On Thu, Mar 04, 2021 at 17:23:05 +0100, Markus Armbruster wrote:
>> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>>=20
>> > On Thu, Mar 04, 2021 at 03:26:55PM +0100, Markus Armbruster wrote:
>> >> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >>=20
>> >> > On Thu, Mar 04, 2021 at 11:00:57AM +0100, Markus Armbruster wrote:
>> >> >> Drop the crap deprecated in commit 4a27a638e7 "fdc: Deprecate
>> >> >> configuring floppies with -global isa-fdc" (v5.1.0).
>> >> >>=20
>> >> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> >> >> ---
>> >> >>  docs/system/deprecated.rst       |  26 --
>> >> >>  docs/system/removed-features.rst |  26 ++
>> >> >>  hw/block/fdc.c                   |  54 +--
>> >> >>  tests/qemu-iotests/172           |  31 +-
>> >> >>  tests/qemu-iotests/172.out       | 562 +-------------------------=
-----
>> >> >>  5 files changed, 30 insertions(+), 669 deletions(-)
>
> [...]
>
>> >>=20
>> >> Correct.
>> >>=20
>> >> This was deprecated in commit 4a27a638e7 "fdc: Deprecate configuring
>> >> floppies with -global isa-fdc" (v5.1.0).  Since then, its use trigger=
s a
>> >> warning:
>> >>=20
>> >>     $ qemu-system-x86_64 -nodefaults -M q35 -display none -drive if=
=3Dnone,id=3Ddrive-fdc0-0-0 -device isa-fdc,driveA=3Ddrive-fdc0-0-0,bootind=
exA=3D1
>> >>     qemu-system-x86_64: -device isa-fdc,driveA=3Ddrive-fdc0-0-0,booti=
ndexA=3D1: warning: warning: property isa-fdc.driveA is deprecated
>> >>     Use -device floppy,unit=3D0,drive=3D... instead.
>> >>=20
>> >> Note the -M q35.  Needed because the default machine type has an onbo=
ard
>> >> isa-fdc, which cannot be configured this way.
>> >>=20
>> >> Sadly, the commit's update of docs/system/deprecated.rst neglects to
>> >> cover this use.  Looks the series overtaxed my capacity to juggle
>> >> details; my apologies.
>> >>=20
>> >> Is libvirt still using these properties?
>> >
>> > Unfortunately yes, but it seems like it ought to be fairly easy to
>> > change the syntax. Just need to figure out what the right way to
>> > detect the availability of the new syntax is. Presumably just look
>> > for existance of the 'floppy' device type ?
>>=20
>> Yes.  The device type was added in merge commit fd209e4a7, v2.8.0.
>>=20
>> > Can you confirm that switching from -global to the new -device floppy
>> > does /not/ have any live migration impact ?
>>=20
>> Yes, it must not affect migration.
>>=20
>> When Kevin split the floppy device type off the floppy controller, he
>> had to add some moderately ugly hackery to keep the old qdev properties
>> working.  Think propagate property values to floppy from controller,
>> which otherwise ignores them.
>>=20
>> The way you get the values into the floppy device cannot affect the
>> migration data.  Only different values can.
>>=20
>> This patch removes a deprecated way.
>
> Note that when QEMU_CAPS_BLOCKDEV is asserted we format floppies as:
>
> -blockdev '{"driver":"file","filename":"/tmp/firmware.img",\
> "node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"}'=
 \
> -blockdev '{"node-name":"libvirt-2-format","read-only":false,"driver":"ra=
w",\
> "file":"libvirt-2-storage"}' \
> -device floppy,unit=3D0,drive=3Dlibvirt-2-format,id=3Dfdc0-0-0 \
> -blockdev '{"driver":"file","filename":"/tmp/data.img",\
> "node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"}'=
 \
> -blockdev '{"node-name":"libvirt-1-format","read-only":false,"driver":"qc=
ow2",\
> "file":"libvirt-1-storage"}' \
> -device floppy,unit=3D1,drive=3Dlibvirt-1-format,id=3Dfdc0-0-1 \
>
> as visible in the test file:
>
> tests/qemuxml2argvdata/disk-floppy-q35-2_11.x86_64-latest.args
>
> So libvirt should be in the clear. isa-fdc with driveA/driveB is
> formatted only when the blockdev capability isn't present.

Even better: in the clear for some time already, which means a wider
range of libvirt versions keeps working with the latest QEMU.  Nice,
because keeping the coupling reasonably lose makes upgrading easier.

Thanks!


