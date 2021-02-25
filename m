Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87A324FAF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 13:10:18 +0100 (CET)
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFTF-00029p-BI
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 07:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFFRs-0001Ha-2E
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:08:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFFRp-0005fG-M0
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 07:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614254926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IRABkmtA/op3ejqMhw/2iKJMKqTUNbWOau6VCV/zrvg=;
 b=WEJpsKh851i1QdPSvAOO4G8K+PhRFK9m12EMPLl8T8iJaunncobVJFZNYOrVpW8s0TzSfR
 32gBAknzFyxrc+wIp9A7vTR7gTGgQtIdm1VyKUOXhL3J4X8vimgJp7/cq1kfJ6dQjCCBMl
 avGrjKHh/GgqWwVu4mewPeyI+j+zydw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-FrB88ZF1Nv2EGshlmxl2-w-1; Thu, 25 Feb 2021 07:08:44 -0500
X-MC-Unique: FrB88ZF1Nv2EGshlmxl2-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71A6C1005501;
 Thu, 25 Feb 2021 12:08:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 209DB5C559;
 Thu, 25 Feb 2021 12:08:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AEEE8113860F; Thu, 25 Feb 2021 13:08:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 08/16] qapi/expr.py: add type hint annotations
References: <20210223003408.964543-1-jsnow@redhat.com>
 <20210223003408.964543-9-jsnow@redhat.com>
 <87y2fdzdt3.fsf@dusky.pond.sub.org>
 <838aa159-9bf9-8c71-49dc-7d80e1b849ed@redhat.com>
Date: Thu, 25 Feb 2021 13:08:41 +0100
In-Reply-To: <838aa159-9bf9-8c71-49dc-7d80e1b849ed@redhat.com> (John Snow's
 message of "Wed, 24 Feb 2021 17:30:09 -0500")
Message-ID: <878s7cs62e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/24/21 10:27 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Annotations do not change runtime behavior.
>>> This commit *only* adds annotations.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>> Reviewed-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>   scripts/qapi/expr.py  | 71 ++++++++++++++++++++++++++++---------------
>>>   scripts/qapi/mypy.ini |  5 ---
>>>   2 files changed, 46 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>> index f45d6be1f4c..df6c64950fa 100644
>>> --- a/scripts/qapi/expr.py
>>> +++ b/scripts/qapi/expr.py
>>> @@ -15,7 +15,14 @@
>>>   # See the COPYING file in the top-level directory.
>>>   
>>>   import re
>>> -from typing import MutableMapping, Optional, cast
>>> +from typing import (
>>> +    Iterable,
>>> +    List,
>>> +    MutableMapping,
>>> +    Optional,
>>> +    Union,
>>> +    cast,
>>> +)
>>>   
>>>   from .common import c_name
>>>   from .error import QAPISemError
>>> @@ -23,9 +30,10 @@
>>>   from .source import QAPISourceInfo
>>>   
>>>   
>>> -# Expressions in their raw form are JSON-like structures with arbitrary forms.
>>> -# Minimally, their top-level form must be a mapping of strings to values.
>>> -Expression = MutableMapping[str, object]
>>> +# Arbitrary form for a JSON-like object.
>>> +_JSObject = MutableMapping[str, object]
>>> +# Expressions in their raw form are (just) JSON-like objects.
>>> +Expression = _JSObject
>> 
>> Wat?
>> 
>
> Please read the "RFCs/notes" section of the cover letter. I wrote it for 
> *you*!

You mean I'm supposed to remember the cover letter by the time I get to
PATCH 08?  Dang!  This is no country for old men...


