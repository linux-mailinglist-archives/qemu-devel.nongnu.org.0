Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D7D496225
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 16:32:52 +0100 (CET)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAvuF-0000pu-4l
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 10:32:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAvkI-0003sQ-8N
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:22:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nAvkE-0007lw-V2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 10:22:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642778550;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubghkPPZGZYn/KJVH4oiDhQj0xICKxr8ouiWK5C4CAA=;
 b=IdpWjWlCATUMpMySC+lOX0ikXaExyvVihQziKL+8Q/wEdvWuUhjn9mQw8PPQ8lyJA78Uf2
 4d0kIRC0kAvX/Up4VHlLiXg7v4lXNt1uRSoaTRBdP5vGiKvcuTmHEWGp8oTk3LNwyGGbur
 ecHnnwC4goEzSK9xO3aV+TcPxFItLn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-7lhbODh4MK26NmBxmqRtvQ-1; Fri, 21 Jan 2022 10:22:21 -0500
X-MC-Unique: 7lhbODh4MK26NmBxmqRtvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A34131091DA3;
 Fri, 21 Jan 2022 15:22:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C0657E5B6;
 Fri, 21 Jan 2022 15:21:59 +0000 (UTC)
Date: Fri, 21 Jan 2022 15:21:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <YerPk2ABMHQf/3QP@redhat.com>
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA9_d5jw5-HOrZA6dsG1vMqxzqmrfHA7Jo0KsDcaEXmB_Q@mail.gmail.com>
 <6c90ca3d-eaec-d7e8-5941-4deb83b58fd0@redhat.com>
 <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875yqd6zib.fsf@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 21, 2022 at 12:23:23PM +0000, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
> > On Fri, 21 Jan 2022 at 10:50, Markus Armbruster <armbru@redhat.com> wrote:
> >> No objection, but it's no replacement for looking into why these tests
> >> are so slow.
> >>
> >> The #1 reason for things being slow is not giving a damn :)
> >
> > See previous messages in the thread -- the test starts a
> > full-fat guest OS including UEFI boot, and it takes forever to
> > get to the login prompt because systemd is starting everything
> > including the kitchen sink.
> 
> There has to be a half-way house between booting a kernel until it fails
> to find a rootfs and running a full Ubuntu distro. Maybe just asking
> systemd to reach "rescue.target" would be enough to show the disks are
> up and userspace works.

Booting up full OS distros is useful, but at the same time I feel it
is too much as something to expect developers to do on any kind of
regular basis.

Ideally some decent amount of acceptance testing could be a standard
part of the 'make check', but that's impossible as long as we're
downloading large disk images or booting things that are very slow,
especially so with TCG.

IMHO the ideal scenario would be for us to have a kernel, initrd
containing just busybox tools for the key arch targets we care
about. Those could be used with direct kernel boot or stuffed
into a disk iamge. Either way, they would boot in ~1 second,
even with TCG, and would be able to execute simple shell scripts
to test a decent amount of QEMU functionality.

It wouldn't eliminate the need to test with full OS, but it
would let us have some acceptance testing run as standard with
'make check' in a decently fast time.  It would then be less
critical if the more thorough full OS tests were somewhat
slower than we'd like. We could just leave those as a scheduled
job to run overnight post-merge. If they do detect any problems
post-merge, then write a dedicated test scenario to replicate it
under the minimal kernel/initrd acceptance test so it'll be
caught pre-merge in future.

> Running the EFI firmware is probably useful coverage but I'm not sure
> how one passes command line args to the guest in that approach? Do we
> need to set a magic EFI variable?

Same as with SeaBIOS - if you're booting off the guest then its the
grub.conf that controls this, if you're booting with direct kernel
on the host then QEMU cli.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


