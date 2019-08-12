Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0409789FD1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 15:38:33 +0200 (CEST)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxAWu-0000Kh-8e
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 09:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hxAWK-0007vA-H0
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:37:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hxAWJ-0007kS-Fn
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:37:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60292)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hxAWJ-0007kB-Am
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 09:37:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AC549308C383;
 Mon, 12 Aug 2019 13:37:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9D3971C8A;
 Mon, 12 Aug 2019 13:37:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2835E1136444; Mon, 12 Aug 2019 15:37:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20190812052359.30071-1-armbru@redhat.com>
 <20190812052359.30071-12-armbru@redhat.com>
 <87blwuodot.fsf@linaro.org>
Date: Mon, 12 Aug 2019 15:37:49 +0200
In-Reply-To: <87blwuodot.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 12 Aug 2019 11:55:46 +0100")
Message-ID: <87y2zytsgi.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Mon, 12 Aug 2019 13:37:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 11/29] typedefs: Separate incomplete
 types and function types
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Markus Armbruster <armbru@redhat.com> writes:
>
>> While there, drop the obsolete file comment.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  include/qemu/typedefs.h | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>> index fcdaae58c4..29346648d4 100644
>> --- a/include/qemu/typedefs.h
>> +++ b/include/qemu/typedefs.h
>> @@ -1,10 +1,10 @@
>>  #ifndef QEMU_TYPEDEFS_H
>>  #define QEMU_TYPEDEFS_H
>>
>> -/* A load of opaque types so that device init declarations don't have to
>> -   pull in all the real definitions.  */
>> -
>> -/* Please keep this list in case-insensitive alphabetical order */
>> +/*
>> + * Incomplete struct types
>
> Maybe expand this a little...
>
>   "Incomplete struct types for modules that don't need the complete
>   definitions but still pass around typed variables."?

If we explain proper use of qemu/typedefs.h in HACKING, as discussed in
review of v1[*], we could point there.

> Otherwise:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Thanks!

>> + * Please keep this list in case-insensitive alphabetical order.
>> + */
>>  typedef struct AdapterInfo AdapterInfo;
>>  typedef struct AddressSpace AddressSpace;
>>  typedef struct AioContext AioContext;
>> @@ -101,6 +101,10 @@ typedef struct SHPCDevice SHPCDevice;
>>  typedef struct SSIBus SSIBus;
>>  typedef struct VirtIODevice VirtIODevice;
>>  typedef struct Visitor Visitor;
>> +
>> +/*
>> + * Function types
>> + */
>>  typedef void SaveStateHandler(QEMUFile *f, void *opaque);
>>  typedef int LoadStateHandler(QEMUFile *f, void *opaque, int version_id);
>
>
> --
> Alex Benn=C3=A9e

