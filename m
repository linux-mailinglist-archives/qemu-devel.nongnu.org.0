Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB884BBBD2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 16:07:00 +0100 (CET)
Received: from localhost ([::1]:36968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL4qY-0005jd-Th
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 10:06:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nL4oX-0004BJ-3h
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:04:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nL4oT-0000wa-JA
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 10:04:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645196688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UdI0aokzyBoG5XxIKJLCIapks+NMg4zeKcoglkUycaE=;
 b=IyyhwiQWTDV3DjtkiDOoGrDg7uBIeVWxT064JYFX5xMghgH070BfRMreNPobDW/Zg969b2
 1RRehQxd0g+nWM/mjma1f96uIUrtsyYbXuNupXHYSho7ZXYPLpAxP5UeiTXnX2sOC+3oT4
 s3xwHqzBSJIB396kAsR72gx7sKkWjcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-NFJ62wBfNvGxh0NZlqXO9Q-1; Fri, 18 Feb 2022 10:04:47 -0500
X-MC-Unique: NFJ62wBfNvGxh0NZlqXO9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22DC91006AA0;
 Fri, 18 Feb 2022 15:04:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FEC0753C7;
 Fri, 18 Feb 2022 15:04:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C2ACD21A408E; Fri, 18 Feb 2022 16:04:42 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2] scripts/qapi: minor delinting
References: <20220211183650.2946895-1-jsnow@redhat.com>
 <87r185imim.fsf@pond.sub.org>
Date: Fri, 18 Feb 2022 16:04:42 +0100
In-Reply-To: <87r185imim.fsf@pond.sub.org> (Markus Armbruster's message of
 "Mon, 14 Feb 2022 14:52:01 +0100")
Message-ID: <87czjk8bcl.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> John Snow <jsnow@redhat.com> writes:
>
>> Get isort and pylint tools passing again.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  scripts/qapi/commands.py |  2 +-
>>  scripts/qapi/pylintrc    | 15 +++++----------
>>  scripts/qapi/types.py    |  6 +++++-
>>  scripts/qapi/visit.py    |  6 +++++-
>>  4 files changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
>> index 869d799ed22..38ca38a7b9d 100644
>> --- a/scripts/qapi/commands.py
>> +++ b/scripts/qapi/commands.py
>> @@ -25,8 +25,8 @@
>>      QAPIGenC,
>>      QAPISchemaModularCVisitor,
>>      build_params,
>> -    ifcontext,
>>      gen_special_features,
>> +    ifcontext,
>>  )
>>  from .schema import (
>>      QAPISchema,
>> diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
>> index b259531a726..1fed2e69620 100644
>> --- a/scripts/qapi/pylintrc
>> +++ b/scripts/qapi/pylintrc
>> @@ -34,16 +34,11 @@ disable=fixme,
>>  
>>  [BASIC]
>>  
>> -# Good variable names which should always be accepted, separated by a comma.
>> -good-names=i,
>> -           j,
>> -           k,
>> -           ex,
>> -           Run,
>> -           _,
>> -           fp,  # fp = open(...)
>> -           fd,  # fd = os.open(...)
>> -           ch,
>> +# Good variable names regexes, separated by a comma. If names match any regex,
>> +# they will always be accepted
>> +
>> +# Allow just about anything, as per Markus's preference.
>
> Does it still flag PEP-8 violations like all lower case class names?

Looks like it in my tests.

> If yes, "just about any length" is more precise.

I'll change the comment if you don't mind:

    # Suppress complaints about short names.  PEP-8 is cool with them,
    # and so are we.

With that:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

No respin necessary.


