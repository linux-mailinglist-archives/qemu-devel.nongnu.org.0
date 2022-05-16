Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B093B527D55
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 08:03:41 +0200 (CEST)
Received: from localhost ([::1]:47434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqTpU-0008ST-PE
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 02:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqTjZ-0006nZ-Dw
 for qemu-devel@nongnu.org; Mon, 16 May 2022 01:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqTjX-00039k-43
 for qemu-devel@nongnu.org; Mon, 16 May 2022 01:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652680650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwgaaNGBOKJkHbinJ1SZzUW/mYqLwPW28oGXeWx9BqU=;
 b=WwBEgpe/QAZhuc8/yXquhDnDxdrl8lkCyKgFDuJvgyzhPTfWqeKio0Ps0SmDrmtiU+OliJ
 TAbjctlB5dEPQt/VOqYS6ualCu1NVYdKi7K60kcQotrzIe11Abh1VS6vaR6tbaBD7ivYzX
 w3L5DOHL35SBiAQuiLv5QYCy1fYEgTI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-pPQi5E8EMyWVD4Ifb6jTtg-1; Mon, 16 May 2022 01:57:11 -0400
X-MC-Unique: pPQi5E8EMyWVD4Ifb6jTtg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04B251E7DCC2;
 Mon, 16 May 2022 05:57:11 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AE9540D2832;
 Mon, 16 May 2022 05:57:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4AB0321E690D; Mon, 16 May 2022 07:57:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Hanna
 Reitz <hreitz@redhat.com>,  Konstantin Kostiuk <kkostiuk@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,  Kevin Wolf <kwolf@redhat.com>,  Darren
 Kenny <darren.kenny@oracle.com>,  Laurent Vivier <lvivier@redhat.com>,
 Michael Roth <michael.roth@amd.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Qiuhao Li <Qiuhao.Li@outlook.com>,  Stefan
 Hajnoczi <stefanha@redhat.com>,  qemu-block <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 03/15] tests: make libqmp buildable for win32
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-4-marcandre.lureau@redhat.com>
 <875ymkxne4.fsf@pond.sub.org>
 <CAMxuvayhwawMwxGk7Rc3=hsgn4q=kLATsFtbB3jAQbDKxCJoZA@mail.gmail.com>
Date: Mon, 16 May 2022 07:57:09 +0200
In-Reply-To: <CAMxuvayhwawMwxGk7Rc3=hsgn4q=kLATsFtbB3jAQbDKxCJoZA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Thu, 5 May 2022
 15:08:15 +0400")
Message-ID: <8735haggui.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> writes:

> Hi
>
> On Thu, May 5, 2022 at 2:52 PM Markus Armbruster <armbru@redhat.com> wrot=
e:
>>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > Reviewed-by: Thomas Huth <thuth@redhat.com>
>> > ---
>> >  tests/qtest/libqmp.h |  2 ++
>> >  tests/qtest/libqmp.c | 35 +++++++++++++++++++++++++++++------
>> >  2 files changed, 31 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/tests/qtest/libqmp.h b/tests/qtest/libqmp.h
>> > index 94aa97328a17..772f18b73ba3 100644
>> > --- a/tests/qtest/libqmp.h
>> > +++ b/tests/qtest/libqmp.h
>> > @@ -20,8 +20,10 @@
>> >  #include "qapi/qmp/qdict.h"
>> >
>> >  QDict *qmp_fd_receive(int fd);
>> > +#ifndef G_OS_WIN32
>>
>> What's the difference between G_OS_WIN32 and _WIN32?
>>
>> We have 10 of the former, but >250 of the latter.  If they are
>> effectively the same, we should pick one and stick to it.
>
> There are some subtle differences when compiling for cygwin, in which
> case G_OS_WIN32 is not defined.
>
> I usually pick G_OS_{UNIX,WIN32} defines, mostly for consistency, but
> in many situation _WIN32/WIN32 is fine.
>
> (and we also have CONFIG_WIN32)

I really think we should use one and only one unless there are
differences that *require* more.

Of the three, _WIN32 predominates (numbers appended).  Please use _WIN32
unless you can show a need for something else.



$ git-grep -cw G_OS_WIN32
qga/commands.c:5
ui/gtk.c:5

$ git-grep -cw CONFIG_WIN32 master
master:Makefile:1
master:block/meson.build:1
master:chardev/meson.build:1
master:configure:1
master:hw/usb/host-libusb.c:9
master:io/channel-watch.c:5
master:meson.build:1
master:net/meson.build:1
master:qga/meson.build:1
master:scripts/checkpatch.pl:1
master:target/i386/hax/hax-i386.h:2
master:target/i386/hax/meson.build:1
master:ui/gtk.c:1
master:ui/meson.build:2
master:ui/sdl2.c:1
master:util/meson.build:5
master:util/sys_membarrier.c:1

$ git-grep -cw CONFIG_WIN32 master
master:Makefile:1
master:block/meson.build:1
master:chardev/meson.build:1
master:configure:1
master:hw/usb/host-libusb.c:9
master:io/channel-watch.c:5
master:meson.build:1
master:net/meson.build:1
master:qga/meson.build:1
master:scripts/checkpatch.pl:1
master:target/i386/hax/hax-i386.h:2
master:target/i386/hax/meson.build:1
master:ui/gtk.c:1
master:ui/meson.build:2
master:ui/sdl2.c:1
master:util/meson.build:5
master:util/sys_membarrier.c:1
$ git-grep -cw _WIN32 master
master:accel/tcg/cpu-exec.c:1
master:accel/tcg/tcg-accel-ops-mttcg.c:1
master:accel/tcg/tcg-accel-ops-rr.c:1
master:audio/sdlaudio.c:3
master:block.c:6
master:block/nfs.c:5
master:block/vvfat.c:1
master:chardev/char-file.c:3
master:chardev/char-pipe.c:4
master:chardev/char-serial.c:4
master:chardev/char-socket.c:1
master:chardev/char-stdio.c:5
master:configure:1
master:contrib/elf2dmp/kdbg.h:1
master:contrib/elf2dmp/pdb.h:1
master:contrib/elf2dmp/pe.h:1
master:crypto/pbkdf.c:2
master:crypto/random-platform.c:3
master:gdbstub.c:2
master:include/block/block_int-common.h:1
master:include/block/raw-aio.h:1
master:include/exec/ram_addr.h:2
master:include/hw/core/cpu.h:1
master:include/io/channel.h:1
master:include/qapi/error.h:1
master:include/qemu/compiler.h:2
master:include/qemu/event_notifier.h:2
master:include/qemu/main-loop.h:1
master:include/qemu/osdep.h:6
master:include/qemu/qemu-plugin.h:1
master:include/qemu/sockets.h:2
master:include/qemu/thread.h:1
master:include/qemu/timer.h:1
master:io/channel.c:1
master:monitor/misc.c:1
master:nbd/nbd-internal.h:1
master:net/net.c:1
master:qemu-io.c:2
master:qemu-options.hx:6
master:qga/guest-agent-core.h:1
master:qga/main.c:21
master:scripts/cocci-macro-file.h:1
master:scripts/codeconverter/codeconverter/test_regexps.py:1
master:softmmu/cpus.c:2
master:softmmu/physmem.c:4
master:softmmu/vl.c:3
master:stubs/is-daemonized.c:1
master:subprojects/libvhost-user/libvhost-user.h:1
master:target/i386/hax/hax-accel-ops.c:1
master:target/i386/whpx/whpx-accel-ops.c:1
master:target/m68k/m68k-semi.c:1
master:target/mips/tcg/sysemu/mips-semi.c:4
master:target/nios2/nios2-semi.c:1
master:tcg/region.c:1
master:tests/qtest/virtio-net-test.c:2
master:tests/unit/test-char.c:6
master:tests/unit/test-crypto-block.c:2
master:tests/unit/test-crypto-pbkdf.c:2
master:tests/unit/test-io-channel-file.c:4
master:tests/unit/test-io-channel-socket.c:4
master:tests/unit/test-iov.c:1
master:tests/unit/test-replication.c:3
master:tests/unit/test-util-sockets.c:2
master:trace/simple.c:3
master:ui/curses.c:3
master:util/cacheinfo.c:1
master:util/error.c:1
master:util/main-loop.c:4
master:util/osdep.c:8
master:util/qemu-sockets.c:2
master:util/qemu-timer-common.c:1
master:util/systemd.c:2


