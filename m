Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAA114C849
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 10:45:42 +0100 (CET)
Received: from localhost ([::1]:43414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwjun-0002fQ-G3
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 04:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53830)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iwjqR-0006pY-UG
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:41:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iwjqQ-0007FL-GV
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:41:11 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38152
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iwjqQ-0007Ex-CZ
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 04:41:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580290869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snFbLWDvlubWL+bO0Tgjrxd0VHp864cc8e54N8CIccA=;
 b=PY21q9GIqxEJnnyXRbY2U2+aZMxeL3ASHumD2m+C99Dz3OJF5Zl0SyDVPmYylIyQBj0VMt
 fqw9TRk9bnK11n59ls4tu3KOf+oY62z4VGvH6Xhqxyxrfph+TG3AfhCMMEij5HBROrDHoG
 sllVz+kzPcgQMgD0sBwJ/QsIGfWmRdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-_5MxlMndPdisLNYlbYv6VQ-1; Wed, 29 Jan 2020 04:41:06 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8933A13E1;
 Wed, 29 Jan 2020 09:41:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-131.ams2.redhat.com
 [10.36.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 327B08EA03;
 Wed, 29 Jan 2020 09:41:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B59351138404; Wed, 29 Jan 2020 10:41:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 2/4] qapi: Create module 'control'
References: <20200128175211.30007-1-kwolf@redhat.com>
 <20200128175211.30007-3-kwolf@redhat.com>
 <8736by4q3m.fsf@dusky.pond.sub.org>
 <20200129090953.GA5690@linux.fritz.box>
Date: Wed, 29 Jan 2020 10:41:03 +0100
In-Reply-To: <20200129090953.GA5690@linux.fritz.box> (Kevin Wolf's message of
 "Wed, 29 Jan 2020 10:09:53 +0100")
Message-ID: <87sgjy1txs.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: _5MxlMndPdisLNYlbYv6VQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Am 29.01.2020 um 09:35 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>>=20
>> > misc.json contains definitions that are related to the system emulator=
,
>> > so it can't be used for other tools like the storage daemon. This patc=
h
>> > moves basic functionality that is shared between all tools (and mostly
>> > related to the monitor itself) into a new control.json, which could be
>> > used in tools as well.
>> >
>> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>> > ---
>> >  qapi/control.json          | 218 ++++++++++++++++++++++++++++++++++++=
+
>> >  qapi/misc.json             | 212 ------------------------------------
>> >  qapi/qapi-schema.json      |   1 +
>> >  monitor/monitor-internal.h |   1 +
>> >  monitor/hmp-cmds.c         |   1 +
>> >  monitor/misc.c             |   1 +
>> >  monitor/qmp-cmds.c         |   1 +
>> >  monitor/qmp.c              |   2 +-
>> >  tests/qtest/qmp-test.c     |   2 +-
>> >  ui/gtk.c                   |   1 +
>> >  qapi/Makefile.objs         |   6 +-
>> >  11 files changed, 229 insertions(+), 217 deletions(-)
>> >  create mode 100644 qapi/control.json
>> >
>> > diff --git a/qapi/control.json b/qapi/control.json
>> > new file mode 100644
>> > index 0000000000..a82a18da1a
>> > --- /dev/null
>> > +++ b/qapi/control.json
>> > @@ -0,0 +1,218 @@
>> > +# -*- Mode: Python -*-
>> > +#
>> > +
>>=20
>> Let's add a copyright notice:
>>=20
>>    # Copyright (C) 2011-2020 Red Hat, Inc.
>>    #
>>    # This work is licensed under the terms of the GNU GPL, version 2 or =
later.
>>    # See the COPYING file in the top-level directory.
>
> I'm not adding anything new, but just moving code from a file that
> doesn't have a copyright notice. In fact, almost none of the schema
> files have a copyright notice. I'm not comfortable adding legal
> assertions without verifying that they are correct, and certainly not as
> a side-effect of a code movement patch. This would be an unrelated
> change.
>
> I suggest that we leave this patch as is, and if you think copyright
> notices should be added, the correct information can be tracked down
> and added consistently for all schema files in a separate series.

There is nothing to be tracked down.  Anything that lacks an explicit
copyright notice is under GPLv2+, as per LICENSE.

>> > +##
>> > +# =3D Monitor definitions (shared between system emulator and tools)
>> > +##
>>=20
>> This comment does double-duty: it's for readers of this source file, and
>> for readers of generated docs/interop/qemu-qmp-ref.*.  It's okay for
>> the former, but not the latter, as the resulting table of contents
>> shows:
>> [...]
>
>> Proposed header:
>>=20
>>     # =3D QMP monitor control
>
> Works for me.
>
>> > diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
>> > index 9751b11f8f..61fd91ede7 100644
>> > --- a/qapi/qapi-schema.json
>> > +++ b/qapi/qapi-schema.json
>> > @@ -103,6 +103,7 @@
>> >  { 'include': 'qdev.json' }
>> >  { 'include': 'machine.json' }
>> >  { 'include': 'machine-target.json' }
>> > +{ 'include': 'control.json' }
>> >  { 'include': 'misc.json' }
>> >  { 'include': 'misc-target.json' }
>> >  { 'include': 'audio.json' }
>>=20
>> This determines position within docs/interop/qemu-qmp-ref.*.  Next to
>> misc.json is the least change.  Perhaps putting it next to
>> introspect.json would be better.
>>=20
>> If we split @quit off control.json, then we could include the .json
>> providing @quit next to @stop & friends.  Again, I'm not demanding such
>> a split.
>
> I'll put it before introspect.json for now.
>
> I don't think the whole order is overly meaningful and it could use some
> rearrangement in general. Again, unrelated to this series.

Yes, the order could use some love.

>> > diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
>> > index d78f5ca190..4d402ded85 100644
>> > --- a/monitor/monitor-internal.h
>> > +++ b/monitor/monitor-internal.h
>> > @@ -27,6 +27,7 @@
>> > =20
>> >  #include "chardev/char-fe.h"
>> >  #include "monitor/monitor.h"
>> > +#include "qapi/qapi-types-control.h"
>> >  #include "qapi/qmp/dispatch.h"
>> >  #include "qapi/qmp/json-parser.h"
>> >  #include "qemu/readline.h"
>> > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> > index d0e0af893a..abb052836b 100644
>> > --- a/monitor/hmp-cmds.c
>> > +++ b/monitor/hmp-cmds.c
>> > @@ -33,6 +33,7 @@
>> >  #include "qapi/qapi-commands-char.h"
>> >  #include "qapi/qapi-commands-migration.h"
>> >  #include "qapi/qapi-commands-misc.h"
>> > +#include "qapi/qapi-commands-control.h"
>> >  #include "qapi/qapi-commands-net.h"
>> >  #include "qapi/qapi-commands-rocker.h"
>> >  #include "qapi/qapi-commands-run-state.h"
>>=20
>> Please keep the qapi/qapi-commands-* sorted, like you do ...
>
> It is sorted! It's exactly where you would expect "-monitor"... *sigh*
>
> /me goes back to finding each #include and moving it.
> /me hates renaming header files.
>
>> > diff --git a/qapi/Makefile.objs b/qapi/Makefile.objs
>> > index a8f1f4c35e..20fcc37c2c 100644
>> > --- a/qapi/Makefile.objs
>> > +++ b/qapi/Makefile.objs
>> > @@ -5,9 +5,9 @@ util-obj-y +=3D opts-visitor.o qapi-clone-visitor.o
>> >  util-obj-y +=3D qmp-event.o
>> >  util-obj-y +=3D qapi-util.o
>> > =20
>> > -QAPI_COMMON_MODULES =3D audio authz block-core block char common cryp=
to
>> > -QAPI_COMMON_MODULES +=3D dump error introspect job machine migration =
misc net
>> > -QAPI_COMMON_MODULES +=3D qdev qom rdma rocker run-state sockets tpm
>> > +QAPI_COMMON_MODULES =3D audio authz block-core block char common cont=
rol crypto
>> > +QAPI_COMMON_MODULES +=3D dump error introspect job machine migration =
misc
>> > +QAPI_COMMON_MODULES +=3D net qdev qom rdma rocker run-state sockets t=
pm
>> >  QAPI_COMMON_MODULES +=3D trace transaction ui
>> >  QAPI_TARGET_MODULES =3D machine-target misc-target
>> >  QAPI_MODULES =3D $(QAPI_COMMON_MODULES) $(QAPI_TARGET_MODULES)
>>=20
>> With the comments and the include directives tidied up:
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Thanks. (I assume this means even without the copyright header.)

I'd prefer with, but I'll accept without.


