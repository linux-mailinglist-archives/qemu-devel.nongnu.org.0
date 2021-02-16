Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B531C7B1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 09:59:55 +0100 (CET)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBwD4-0007ep-AO
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 03:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBwBq-00071O-Du
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 03:58:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lBwBo-0008A9-DZ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 03:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613465915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CrQBEh9xm4N0vewh+KJOl4WQQjaVaptnFlMVtz6+B1w=;
 b=O291FiE3+sngiYfzD9o1tRFzr9fB1UhQVsXD5VEP/IZ3NTqb9eQUddh4h6gNeUl9xzReZN
 OXe0mHi49ChbdQABhLrKj5ZWxuk/A7hKf6Yc7r/ko/tQzYFawGs5THE0KlLqlejhntmG38
 px9XPTsmsOEPbtQf9ZHLiJw+KeVbZas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-D8uj-qizMsiscXOnjM6rdQ-1; Tue, 16 Feb 2021 03:58:31 -0500
X-MC-Unique: D8uj-qizMsiscXOnjM6rdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B73980402C;
 Tue, 16 Feb 2021 08:58:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B058722C7;
 Tue, 16 Feb 2021 08:58:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EBB45113865F; Tue, 16 Feb 2021 09:58:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 14/19] qapi/introspect.py: add type hint annotations
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-15-jsnow@redhat.com>
 <87a6s4pf22.fsf@dusky.pond.sub.org>
Date: Tue, 16 Feb 2021 09:58:28 +0100
In-Reply-To: <87a6s4pf22.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 16 Feb 2021 09:55:33 +0100")
Message-ID: <875z2spex7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Markus Armbruster <armbru@redhat.com> writes:

> John Snow <jsnow@redhat.com> writes:
>
>> NB: The type aliases (SchemaInfo et al) declare intent for some of the
>> "dictly-typed" objects we pass around in introspect.py. They do not
>> enforce the shape of those objects, and cannot, until Python 3.7 or
>> later. (And even then, it may not be "worth it".)
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  scripts/qapi/introspect.py | 124 +++++++++++++++++++++++++++----------
>>  scripts/qapi/mypy.ini      |   5 --
>>  scripts/qapi/schema.py     |   2 +-
>>  3 files changed, 92 insertions(+), 39 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index b0fcc4443c1..45284af1330 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
[...]
>> @@ -216,10 +237,13 @@ def _use_type(self, typ):
>>          return self._name(typ.name)
>>  
>>      @staticmethod
>> -    def _gen_features(features):
>> +    def _gen_features(features: List[QAPISchemaFeature]
>> +                      ) -> List[Annotated[str]]:
>>          return [Annotated(f.name, f.ifcond) for f in features]
>>  
>> -    def _gen_tree(self, name, mtype, obj, ifcond, features):
>> +    def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>
> Schould this be obj: SchemaInfo?

No, because @obj is incomplete; _gen_tree() completes it.

>
>> +                  ifcond: Sequence[str],
>> +                  features: Optional[List[QAPISchemaFeature]]) -> None:
>>          comment: Optional[str] = None
>>          if mtype not in ('command', 'event', 'builtin', 'array'):
>>              if not self._unmask:
[...]


