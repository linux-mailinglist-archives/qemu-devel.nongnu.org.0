Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE62B7F53
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:24:50 +0100 (CET)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOO9-00048i-F2
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfOLt-0003Ci-V3
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:22:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kfOLp-0001Wu-27
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605709343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=brEfzU71+XXaJMHZtRGoZcmjVKv9WcvEHCM9VP0pIoo=;
 b=FyycDB1XPG/pu4GakAw3+qPoMVoe9isIhtnU88uBT9TkVq1nngq+6TRMDI5ZunlP951Es8
 mDLzkj4WXTAOdBGg1VtDVVm+2f/Hpg80nWfvduRddswP3EQ1JZBHT5x9PaNvclI1rq0/oG
 +9iA4xm02LNowVJRUHY6X+K/0gC6FnI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-kNpsvCe4OSWsPXVHg30Pyw-1; Wed, 18 Nov 2020 09:22:21 -0500
X-MC-Unique: kNpsvCe4OSWsPXVHg30Pyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98B58143EA;
 Wed, 18 Nov 2020 14:22:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 910F310016F0;
 Wed, 18 Nov 2020 14:22:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1F28411358BA; Wed, 18 Nov 2020 15:22:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/watchdog/wdt_diag288: Remove unnecessary includes
References: <20201118090344.243117-1-thuth@redhat.com>
 <800135fc-4552-b872-0117-4d9194393094@redhat.com>
Date: Wed, 18 Nov 2020 15:22:19 +0100
In-Reply-To: <800135fc-4552-b872-0117-4d9194393094@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 18 Nov 2020 12:06:35
 +0100")
Message-ID: <873616kan8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 11/18/20 10:03 AM, Thomas Huth wrote:
>> Both headers, sysbus.h and module.h, are not required to compile this fi=
le.

module.h is: it defines type_init().

>>=20
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/watchdog/wdt_diag288.c | 2 --
>>  1 file changed, 2 deletions(-)
>>=20
>> diff --git a/hw/watchdog/wdt_diag288.c b/hw/watchdog/wdt_diag288.c
>> index 71a945f0bd..4c4b6a6ab7 100644
>> --- a/hw/watchdog/wdt_diag288.c
>> +++ b/hw/watchdog/wdt_diag288.c
>> @@ -14,12 +14,10 @@
>>  #include "qemu/osdep.h"
>>  #include "sysemu/reset.h"
>>  #include "sysemu/watchdog.h"
>> -#include "hw/sysbus.h"
>
> OK
>
>>  #include "qemu/timer.h"
>>  #include "hw/watchdog/wdt_diag288.h"
>>  #include "migration/vmstate.h"
>>  #include "qemu/log.h"
>> -#include "qemu/module.h"
>
> Cc'ing Markus because of:
>
> commit 0b8fa32f551e863bb548a11394239239270dd3dc
> Author: Markus Armbruster <armbru@redhat.com>
> Date:   Thu May 23 16:35:07 2019 +0200
>
>     Include qemu/module.h where needed, drop it from qemu-common.h

If it still compiles and links, it must get it via some other header.

>> =20
>>  static WatchdogTimerModel model =3D {
>>      .wdt_name =3D TYPE_WDT_DIAG288,
>>=20


