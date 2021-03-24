Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F3E3482A3
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:14:33 +0100 (CET)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9tg-0001wt-Ga
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lP9n0-0007Sa-SE
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lP9mu-0007Hw-Hl
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616616450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWrrmffmLRT10Z0Rp7s1EfITDHcjdSSnG23b7++Uq3k=;
 b=OSr+e00scx2UypM/6fXG+cmVGVrus7tYe+hdRGSduGYOGv35ebEd+YBbzJ9Qb8jhsvs4rA
 kS0RDgETFgDaEtIpWPyFBwq8Wq/VA1mGgJ8Luul2ovU8AmuU6bbJf2XEgzyNVjz2J8hAGi
 +I2IpsaQc+w9yLvnQT6nDY0TPI3TNmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-btmd0szkOwqnv4CFf4O6tQ-1; Wed, 24 Mar 2021 16:07:28 -0400
X-MC-Unique: btmd0szkOwqnv4CFf4O6tQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BCC98189C8;
 Wed, 24 Mar 2021 20:07:27 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2B895C5B5;
 Wed, 24 Mar 2021 20:07:23 +0000 (UTC)
Subject: Re: [PATCH 13/28] qapi: Enforce event naming rules
To: Markus Armbruster <armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-14-armbru@redhat.com>
 <bd1b8230-30fd-a4a4-d38c-8650e645c586@redhat.com>
 <87r1k5f4u7.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <799ad08b-3b45-f511-7717-f366eb2c0404@redhat.com>
Date: Wed, 24 Mar 2021 16:07:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87r1k5f4u7.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 2:22 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 3/23/21 5:40 AM, Markus Armbruster wrote:
>>> Event names should be ALL_CAPS with words separated by underscore.
>>> Enforce this.  The only offenders are in tests/.  Fix them.  Existing
>>> test event-case covers the new error.
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>    tests/unit/test-qmp-event.c               |  6 +++---
>>>    scripts/qapi/expr.py                      |  4 +++-
>>>    tests/qapi-schema/doc-good.json           |  4 ++--
>>>    tests/qapi-schema/doc-good.out            |  4 ++--
>>>    tests/qapi-schema/doc-good.txt            |  2 +-
>>>    tests/qapi-schema/doc-invalid-return.json |  4 ++--
>>>    tests/qapi-schema/event-case.err          |  2 ++
>>>    tests/qapi-schema/event-case.json         |  2 --
>>>    tests/qapi-schema/event-case.out          | 14 --------------
>>>    tests/qapi-schema/qapi-schema-test.json   |  6 +++---
>>>    tests/qapi-schema/qapi-schema-test.out    |  8 ++++----
>>>    11 files changed, 22 insertions(+), 34 deletions(-)
>>> diff --git a/tests/unit/test-qmp-event.c
>>> b/tests/unit/test-qmp-event.c
>>> index 047f44ff9a..d58c3b78f2 100644
>>> --- a/tests/unit/test-qmp-event.c
>>> +++ b/tests/unit/test-qmp-event.c
>>> @@ -143,7 +143,7 @@ static void test_event_d(TestEventData *data,
>>>      static void test_event_deprecated(TestEventData *data, const
>>> void *unused)
>>>    {
>>> -    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES1' }");
>>> +    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES1' }");
>>>          memset(&compat_policy, 0, sizeof(compat_policy));
>>>    @@ -163,7 +163,7 @@ static void
>>> test_event_deprecated_data(TestEventData *data, const void *unused)
>>>    {
>>>        memset(&compat_policy, 0, sizeof(compat_policy));
>>>    -    data->expect = qdict_from_jsonf_nofail("{ 'event':
>>> 'TEST-EVENT-FEATURES0',"
>>> +    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES0',"
>>>                                               " 'data': { 'foo': 42 } }");
>>>        qapi_event_send_test_event_features0(42);
>>>        g_assert(data->emitted);
>>> @@ -172,7 +172,7 @@ static void test_event_deprecated_data(TestEventData *data, const void *unused)
>>>          compat_policy.has_deprecated_output = true;
>>>        compat_policy.deprecated_output = COMPAT_POLICY_OUTPUT_HIDE;
>>> -    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST-EVENT-FEATURES0' }");
>>> +    data->expect = qdict_from_jsonf_nofail("{ 'event': 'TEST_EVENT_FEATURES0' }");
>>>        qapi_event_send_test_event_features0(42);
>>>        g_assert(data->emitted);
>>>    diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>>> index b5fb0be48b..c065505b27 100644
>>> --- a/scripts/qapi/expr.py
>>> +++ b/scripts/qapi/expr.py
>>> @@ -45,7 +45,9 @@ def check_name_str(name, info, source):
>>>      def check_name_upper(name, info, source):
>>>        stem = check_name_str(name, info, source)
>>> -    # TODO reject '[a-z-]' in @stem
>>> +    if re.search(r'[a-z-]', stem):
>>> +        raise QAPISemError(
>>> +            info, "name of %s must not use lowercase or '-'" % source)
>>>    
>>
>> Does a little bit more than check_name_upper. Is this only used for
>> event names? I guess so. Should it be inlined into check_defn_name_str
>> instead in this case, or nah?
> 
> I'd prefer not to inline.  I'm open to better function names.
> 
> We have three name styles.  qapi-code-gen.txt:
> 
>      [Type] definitions should always use CamelCase for
>      user-defined type names, while built-in types are lowercase.
> 
>      [...]
> 
>      Command names, and member names within a type, should be all lower
>      case with words separated by a hyphen.  [...]
> 
>      Event names should be ALL_CAPS with words separated by underscore.
> 
> I define three functions for them: check_name_camel(),
> check_name_lower(), and check_name_upper().
> 
> The functions factor out the naming rule aspect, and they let us keep
> the naming rule aspect together.  That's why I'd prefer not to inline.
> 
> We could name them after their purpose instead:
> check_name_user_defined_type(), check_name_command_or_member(),
> check_name_event().  The first two are rather long.  Shorter:
> check_name_type(), check_name_other(), check_name_event().
> 
> Thoughts?
> 

The long names are nice and descriptive.


