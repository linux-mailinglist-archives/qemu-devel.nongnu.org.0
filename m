Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBFA2769DF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 08:59:20 +0200 (CEST)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLLDr-0007uv-I9
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 02:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLLD9-0007T8-3T
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 02:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kLLD6-0004wO-V3
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 02:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600930712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVus4SuFtbXdwl7pJPvJ9SyyJQe9MrIJvudYL87kPro=;
 b=gMTWxHK6vN72cZCtrPyvuByF/xJ/Nfj85ksRgXrZttnZJiuuBoZcEOfK1QfAWjiuaXdtr+
 RmmsYI+sl/JwJOLPMXUqi33LPzWDzAboTELNvPREUwb4emmlENYw2nvGI/aRjZ9dYlNtUF
 vBfaZ7zQ0VgSJm+xYMcVhUiFEpLzWjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-a3KK6_j7NxaZv5BoIX7eyQ-1; Thu, 24 Sep 2020 02:58:29 -0400
X-MC-Unique: a3KK6_j7NxaZv5BoIX7eyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F6F010BBEC8;
 Thu, 24 Sep 2020 06:58:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-70.ams2.redhat.com
 [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7D1A5D990;
 Thu, 24 Sep 2020 06:58:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6C8581132E9A; Thu, 24 Sep 2020 08:58:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: Add Python library stanza
References: <20200922230505.4089701-1-jsnow@redhat.com>
 <20200922230505.4089701-2-jsnow@redhat.com>
 <87wo0k34qp.fsf@dusky.pond.sub.org>
 <ce23c70a-2e0e-0ca1-5260-812d713f04a8@redhat.com>
 <20200923153707.GP3312949@habkost.net>
 <f0e34f41-ba30-770e-068f-dc6ccc92ed33@redhat.com>
Date: Thu, 24 Sep 2020 08:58:26 +0200
In-Reply-To: <f0e34f41-ba30-770e-068f-dc6ccc92ed33@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 23 Sep 2020 18:49:34
 +0200")
Message-ID: <87v9g3wtil.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 9/23/20 5:37 PM, Eduardo Habkost wrote:
>> On Wed, Sep 23, 2020 at 11:17:01AM -0400, John Snow wrote:
>>> On 9/23/20 11:14 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
>>>>
>>>>> I'm proposing that I split the actual Python library off from the oth=
er
>>>>> miscellaneous python scripts we have and declare it maintained. Add
>>>>> myself as a maintainer of this folder, along with Cleber.
>>>>>
>>>>> v2: change python/* to python/, thanks Alex.
>>>>>
>>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>>> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>> Acked-by: Cleber Rosa <crosa@redhat.com>
>>>>> Acked-by: Eduardo Habkost <ehabkost@redhat.com>
>>>>> ---
>>>>>   MAINTAINERS | 9 ++++++++-
>>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index 3d17cad19a..c0222ee645 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -2355,11 +2355,18 @@ S: Maintained
>>>>>   F: include/sysemu/cryptodev*.h
>>>>>   F: backends/cryptodev*.c
>>>>> +Python library
>>>>> +M: John Snow <jsnow@redhat.com>
>>>>> +M: Cleber Rosa <crosa@redhat.com>
>>>>> +R: Eduardo Habkost <ehabkost@redhat.com>
>>>>> +S: Maintained
>>>>> +F: python/
>>>>> +T: git https://gitlab.com/jsnow/qemu.git python
>>>>> +
>>>>>   Python scripts
>>>>>   M: Eduardo Habkost <ehabkost@redhat.com>
>>>>>   M: Cleber Rosa <crosa@redhat.com>
>>>>>   S: Odd fixes
>>>>> -F: python/qemu/*py
>>>>>   F: scripts/*.py
>>>>>   F: tests/*.py
>>>>
>>>> Separate sections just so you can have the appropriate S:, or is there=
 a
>>>> deeper logic behind the split?
>>>>
>>>
>>> Yes, different intended levels of support. I don't currently have the
>>> bandwidth to promise support for the miscellaneous Python scripts in
>>> ./scripts, but I do promise to support to a higher level the code in
>>> ./python.
>>>
>>> Over time, I intend to migrate things into ./python, but there are some
>>> series that need to happen first before I start doing that.
>>=20
>> Also, the actual owners for most scripts in ./scripts are already
>> listed elsewhere.  I believe we shouldn't really have M: lines
>> for the scripts/*.py section, just R:.

Good point.

> Agreed. Maybe worth a comment in the section although.

Let's do it.


