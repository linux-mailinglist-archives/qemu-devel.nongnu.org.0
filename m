Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177CD1879E1
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 07:53:53 +0100 (CET)
Received: from localhost ([::1]:53620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE66q-0005u6-65
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 02:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41456)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jE65p-0005VH-9h
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 02:52:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jE65o-0001aB-47
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 02:52:49 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:44758)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jE65o-0001Vd-07
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 02:52:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584427967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zgTkWP2hWotAc7GXxdgXXTnozeU1J5/d+pKG54xiYE=;
 b=ChJ0EHVd7Kit7TBrzdtqySZU+aLiUWTh7U7E/8SFev1395dez4ZZGw6Wo8LyJoRfuJfmKx
 gKXklBKyrhYbDskUXbnCF6qEjPrIsbl0ciGpa/RIO5uy71QW8yjgbnEhQ55Nua+6nI49Lw
 MRWu+g6mxedFAA3yswkAEJrzEqzFinY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-HyTpti-3MpOG4pgCLjnQhA-1; Tue, 17 Mar 2020 02:52:43 -0400
X-MC-Unique: HyTpti-3MpOG4pgCLjnQhA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8493B107ACC4;
 Tue, 17 Mar 2020 06:52:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 329B35D9C9;
 Tue, 17 Mar 2020 06:52:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B69051138404; Tue, 17 Mar 2020 07:52:40 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v3 24/34] qapi: Replace qmp_dispatch()'s TODO comment by
 an explanation
References: <20200315144653.22660-1-armbru@redhat.com>
 <20200315144653.22660-25-armbru@redhat.com>
 <CAJ+F1CLGr7HYp3kAfjGXgPwxcGAyaPOmkN3+7s_oV-XHVdOVPw@mail.gmail.com>
Date: Tue, 17 Mar 2020 07:52:40 +0100
In-Reply-To: <CAJ+F1CLGr7HYp3kAfjGXgPwxcGAyaPOmkN3+7s_oV-XHVdOVPw@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Mon, 16 Mar 2020
 18:36:13 +0100")
Message-ID: <87wo7jtqvb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Sun, Mar 15, 2020 at 3:48 PM Markus Armbruster <armbru@redhat.com> wro=
te:
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/qmp-dispatch.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
>> index 112d29a9ab..fb53687ce9 100644
>> --- a/qapi/qmp-dispatch.c
>> +++ b/qapi/qmp-dispatch.c
>> @@ -164,7 +164,11 @@ QDict *qmp_dispatch(QmpCommandList *cmds, QObject *=
request,
>>          g_assert(!ret);
>>          return NULL;
>>      } else if (!ret) {
>> -        /* TODO turn into assertion */
>> +        /*
>> +         * When the command's schema has no 'returns', cmd->fn()
>> +         * leaves @ret null.  The QMP spec calls for an the empty
>
> "for an"

Fixing, thanks!

> Can we assert that the command's schema has no 'returns' in this case?

Feels impractical.  Enforcing "no returns when success-response is
false" is the QAPI schema frontend's job anyway.  That's a separate
patch.  I can put it on my to-do list.

>> +         * object then; supply it.
>> +         */
>>          ret =3D QOBJECT(qdict_new());
>>      }
>>
>> --
>> 2.21.1
>>
>>


