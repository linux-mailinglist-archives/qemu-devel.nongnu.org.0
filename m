Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62090115426
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 16:24:56 +0100 (CET)
Received: from localhost ([::1]:39664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idFTS-0000kx-Qc
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 10:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1idEWZ-0001ZR-Mh
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:24:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1idEWY-0005oO-I1
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:24:03 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:36923
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1idEWY-0005nh-Dz
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:24:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575642242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zm6QKe1ZORYW66WsVIonU/7QmDghQzHBTtUwEl/4e6c=;
 b=XchCdXsVr6BIqufxYN06b3EtC0MfxAL10Faeq2o3nh4We9F1xYJ3CR0lPjMa2PBWS32Z/j
 LdWyys4S7g2mvssf+UUz6Sxr9Oi9YeK8vCPo0RI8p0mlNaWrDsqhS0OgY9mNXh6Bv0/jFj
 Lz+dL+RagTEcTgVA1CFE0WC8f9ok79s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-O6OY_ULdN5qO6zw5TlUejw-1; Fri, 06 Dec 2019 02:20:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAD5EDC16;
 Fri,  6 Dec 2019 07:20:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com
 [10.36.116.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D2B65D6A3;
 Fri,  6 Dec 2019 07:20:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C026D1138606; Fri,  6 Dec 2019 08:20:44 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 06/21] io: Fix Error usage in a comment <example>
References: <20191130194240.10517-1-armbru@redhat.com>
 <20191130194240.10517-7-armbru@redhat.com>
 <397f067b-faad-44f8-dc26-ab652e7ca6a2@virtuozzo.com>
Date: Fri, 06 Dec 2019 08:20:44 +0100
In-Reply-To: <397f067b-faad-44f8-dc26-ab652e7ca6a2@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 5 Dec 2019 15:30:24 +0000")
Message-ID: <878snpor77.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: O6OY_ULdN5qO6zw5TlUejw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 30.11.2019 22:42, Markus Armbruster wrote:
>> Cc: "Daniel P. Berrang=C3=A9" <berrange@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   include/io/task.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/include/io/task.h b/include/io/task.h
>> index 5cb9faf9f2..1abbfb8b65 100644
>> --- a/include/io/task.h
>> +++ b/include/io/task.h
>> @@ -119,7 +119,7 @@ typedef void (*QIOTaskWorker)(QIOTask *task,
>>    *   gboolean myobject_operation_timer(gpointer opaque)
>>    *   {
>>    *      QIOTask *task =3D QIO_TASK(opaque);
>> - *      Error *err;*
>> + *      Error *err =3D NULL;
>>    *
>>    *      ...check something important...
>>    *       if (err) {
>>=20
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>
> (I also think you can safely s/Fix Error usage/Fix typo/ in subject)

I'd say it's both: the trailing * is clearly a typo, but the missing
initializer is asking Murphy for random crashes at inopportune times.
Examples better set *good* examples :)

Thanks!


