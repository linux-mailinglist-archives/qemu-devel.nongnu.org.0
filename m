Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B915CB2C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 20:31:37 +0100 (CET)
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2KD1-0007Nf-J6
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 14:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43259)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1j2KBW-0006kv-R1
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 14:30:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1j2KBU-0006I2-OQ
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 14:30:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39104
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1j2KBU-0006EM-BF
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 14:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581622199;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezfC9km92R+gv3ucYaZoaadU3Ri6rOcoi6A6zidaKuI=;
 b=Cn+KE6Azgpf8li5BTRpUbS3jHize54ByPi1aQbSuMD5DXgXXIDxcrrhFjeZyH6Zocn5Wxy
 fYr0ev9XXK5FjgO7ao5jE9BEvOdO0/W57NGxi52ZsHWKb/ykpyJTgOxTnc0mT5sPyfQhkj
 0EhoJIqu+T9uLUCAW0ejUKJmbxtpCxE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-fGpu54jSPgq8zfac6GZUcQ-1; Thu, 13 Feb 2020 14:29:57 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05814800EB8
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 19:29:57 +0000 (UTC)
Received: from redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BDC41001DEF;
 Thu, 13 Feb 2020 19:29:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v5 1/8] multifd: Add multifd-method parameter
In-Reply-To: <20200211185016.GP55376@redhat.com> ("Daniel P. =?utf-8?Q?Ber?=
 =?utf-8?Q?rang=C3=A9=22's?=
 message of "Tue, 11 Feb 2020 18:50:16 +0000")
References: <20200129115655.10414-1-quintela@redhat.com>
 <20200129115655.10414-2-quintela@redhat.com>
 <20200211185016.GP55376@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Thu, 13 Feb 2020 20:29:51 +0100
Message-ID: <8736bel1zk.fsf@secure.laptop>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: fGpu54jSPgq8zfac6GZUcQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Reply-To: quintela@redhat.com
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> On Wed, Jan 29, 2020 at 12:56:48PM +0100, Juan Quintela wrote:
>> This will store the compression method to use.  We start with none.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>  hw/core/qdev-properties.c    | 13 +++++++++++++
>>  include/hw/qdev-properties.h |  3 +++
>>  migration/migration.c        | 13 +++++++++++++
>>  monitor/hmp-cmds.c           | 13 +++++++++++++
>>  qapi/migration.json          | 30 +++++++++++++++++++++++++++---
>>  tests/qtest/migration-test.c | 14 ++++++++++----
>>  6 files changed, 79 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
>> index 7f93bfeb88..4442844d37 100644
>> --- a/hw/core/qdev-properties.c
>> +++ b/hw/core/qdev-properties.c
>> @@ -8,6 +8,7 @@
>
>> @@ -488,6 +488,19 @@
>>  ##
>>  { 'command': 'query-migrate-capabilities', 'returns':   ['MigrationCapa=
bilityStatus']}
>> =20
>> +##
>> +# @MultiFDMethod:
>> +#
>> +# An enumeration of multifd compression.
>> +#
>> +# @none: no compression.
>> +#
>> +# Since: 5.0
>> +#
>> +##
>> +{ 'enum': 'MultiFDMethod',
>> +  'data': [ 'none' ] }
>
> I feel like "MultiFDMethod" is better called "MultiFDCompression"

Changed.

Thanks, Juan.


