Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D06331D6E9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 10:22:42 +0100 (CET)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCJ2f-0007J1-6w
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 04:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCJ1I-0006q9-OT
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 04:21:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lCJ1G-0006id-U1
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 04:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613553674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MspphpDnKDWklk75uC5DAxhyIwsUxsrU4P4PT5InCwg=;
 b=Ywf2EgScG6k9qCRNvcYKt5XN7t43OB0Im1uwzEcz2oIfzQJYaq4oJvULSF/6BVnU0C1E/a
 n4B4vw+pQowqlec9JsF/fR++32uvPN0P0njy3OSe+IW4fMin5Fr0PpKiWREiDlmyIkq3Kj
 ciimNbiHDHq/PG6zpTlLPCCTWoOZ1e0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-XhfmC1GGNK6OC3qNy-gyxg-1; Wed, 17 Feb 2021 04:21:11 -0500
X-MC-Unique: XhfmC1GGNK6OC3qNy-gyxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7B041005501;
 Wed, 17 Feb 2021 09:21:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82DAE60C5F;
 Wed, 17 Feb 2021 09:21:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1372F113860F; Wed, 17 Feb 2021 10:21:09 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 14/19] qapi/introspect.py: add type hint annotations
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-15-jsnow@redhat.com>
 <87a6s4pf22.fsf@dusky.pond.sub.org>
 <a724070a-0075-52ca-b11f-cf736d626279@redhat.com>
 <87r1lgq9li.fsf@dusky.pond.sub.org>
 <7a609eb3-5680-173e-ba6d-41bd51d4bd29@redhat.com>
Date: Wed, 17 Feb 2021 10:21:09 +0100
In-Reply-To: <7a609eb3-5680-173e-ba6d-41bd51d4bd29@redhat.com> (John Snow's
 message of "Tue, 16 Feb 2021 11:19:27 -0500")
Message-ID: <87k0r76oe2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/16/21 11:08 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 2/16/21 3:55 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
[...]
>>>>> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
>>>>> index 353e8020a27..ff16578f6de 100644
>>>>> --- a/scripts/qapi/schema.py
>>>>> +++ b/scripts/qapi/schema.py
>>>>> @@ -28,7 +28,7 @@
>>>>>    class QAPISchemaEntity:
>>>>>        meta: Optional[str] = None
>>>>>    -    def __init__(self, name, info, doc, ifcond=None,
>>>>> features=None):
>>>>> +    def __init__(self, name: str, info, doc, ifcond=None, features=None):
>>>>>            assert name is None or isinstance(name, str)
>>>>>            for f in features or []:
>>>>>                assert isinstance(f, QAPISchemaFeature)
>>>>
>>>> How is this hunk related to typing introspect.py
>>>>
>>>
>>> I forget!
>>>
>>> qapi/introspect.py:262: error: Returning Any from function declared to
>>> return "str"
>>> Found 1 error in 1 file (checked 14 source files)
>>>
>>> Oh, for this reason:
>>>
>>>          if isinstance(typ, QAPISchemaBuiltinType):
>>>              return typ.name
>>>
>>> _use_type has a return type that is dependent upon the type of
>>> "typ.name", which required typing the QAPISchemaEntity initializer.
>>>
>>>
>>> (Do you want this in its own preceding patch?)
>>
>> That would work.
>> Keeping it in this patch with a suitable hint in the commit message
>> would also work.  Up to you.  If you want me to tweak in my tree, tell
>> me how.
>>
>
> We can try:
>
> "Annotations are also added to the QAPISchemaEntity __init__ method in
> schema.py to allow mypy to statically prove the type of typ.name,
> needed to prove the return type of
> QAPISchemaGenIntrospectVisitor._use_type()."

Sold!


