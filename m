Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6FB31CCBB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:15:54 +0100 (CET)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC24v-0001Hw-DQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC22z-0008Ok-Ci
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:13:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lC22w-0007K8-Sn
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 10:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613488429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KStfDPPzFkhvzyqYeownxreYGGnGvGQN8fdnEdGghc=;
 b=Pq/T8l9ea8ZlUZos1QXGn6X4UPzVbws1YLYQHinb31sXEuT4YFFpmP460lxN7uWO913Bnq
 Ihq7d4WxtRNixxs9WoGjbAHHCU2nfzgtGpxihfWW3yWA/4g4tS0aqJ2ELHONrwc/QPSA3v
 OHcdufJakj2TVeKMACYEOubqidqQuMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-gUWysrgzOvqIYZHCy5BRGg-1; Tue, 16 Feb 2021 10:13:45 -0500
X-MC-Unique: gUWysrgzOvqIYZHCy5BRGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0765F195D563;
 Tue, 16 Feb 2021 15:13:44 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44C9519D6C;
 Tue, 16 Feb 2021 15:13:43 +0000 (UTC)
Subject: Re: [PATCH v6 17/19] qapi/introspect.py: Type _gen_tree variants as
 Sequence[str]
To: Markus Armbruster <armbru@redhat.com>
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-18-jsnow@redhat.com>
 <87v9asnzsu.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <7d83cfca-1ce0-d898-de89-e819633eba98@redhat.com>
Date: Tue, 16 Feb 2021 10:13:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87v9asnzsu.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/16/21 4:10 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Optional[List] is clunky; an empty sequence can more elegantly convey
>> "no variants". By downgrading "List" to "Sequence", we can also accept
>> tuples; this is useful for the empty tuple specifically, which we may
>> use as a default parameter because it is immutable.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 649225988d1..e4d31a59503 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -247,13 +247,13 @@ def _use_type(self, typ: QAPISchemaType) -> str:
>>           return self._name(typ.name)
>>   
>>       @staticmethod
>> -    def _gen_features(features: List[QAPISchemaFeature]
>> +    def _gen_features(features: Sequence[QAPISchemaFeature]
>>                         ) -> List[Annotated[str]]:
>>           return [Annotated(f.name, f.ifcond) for f in features]
>>   
>>       def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>>                     ifcond: Sequence[str],
>> -                  features: Optional[List[QAPISchemaFeature]]) -> None:
>> +                  features: Sequence[QAPISchemaFeature] = ()) -> None:
>>           """
>>           Build and append a SchemaInfo object to self._trees.
>>   
>> @@ -261,7 +261,8 @@ def _gen_tree(self, name: str, mtype: str, obj: Dict[str, object],
>>           :param mtype: The entity's meta-type.
>>           :param obj: Additional entity fields, as appropriate for the meta-type.
>>           :param ifcond: Sequence of conditionals that apply to this entity.
>> -        :param features: Optional features field for SchemaInfo.
>> +        :param features: Optional, The features field for SchemaInfo.
> 
> Downcase "The".
> 
>> +                         Will be omitted from the output if empty.
>>           """
>>           comment: Optional[str] = None
>>           if mtype not in ('command', 'event', 'builtin', 'array'):
>> @@ -298,7 +299,7 @@ def _gen_variant(self, variant: QAPISchemaVariant
>>   
>>       def visit_builtin_type(self, name: str, info: Optional[QAPISourceInfo],
>>                              json_type: str) -> None:
>> -        self._gen_tree(name, 'builtin', {'json-type': json_type}, [], None)
>> +        self._gen_tree(name, 'builtin', {'json-type': json_type}, [])
>>   
>>       def visit_enum_type(self, name: str, info: Optional[QAPISourceInfo],
>>                           ifcond: Sequence[str],
>> @@ -316,7 +317,7 @@ def visit_array_type(self, name: str, info: Optional[QAPISourceInfo],
>>                            element_type: QAPISchemaType) -> None:
>>           element = self._use_type(element_type)
>>           self._gen_tree('[' + element + ']', 'array', {'element-type': element},
>> -                       ifcond, None)
>> +                       ifcond)
>>   
>>       def visit_object_type_flat(self, name: str, info: Optional[QAPISourceInfo],
>>                                  ifcond: Sequence[str],
> 
> Marginal by itself.  Might be worth it as part of a more general move
> away from Optional[List[...]].  See also next patch.
> 

Yep, it's tiny. Still, maybe worth taking just to remove a bad habit 
from the code in case of cargo-culting?

Go with whatcha feel, it's a style nit you raised -- I'm not sure I'll 
remember to do a more thorough pass after pt6 is done.

ACK to change the comment casing if you take these.

--js


