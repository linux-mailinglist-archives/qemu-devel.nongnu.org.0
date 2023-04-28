Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01A16F1564
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:28:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLJn-0005X6-Ig; Fri, 28 Apr 2023 06:27:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLJk-0005WM-VG
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLJj-00070s-1X
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682677625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kssoOXe7tK3Hg0sQVG/+YFUJ9ZPfKy3zfl88ndf8g4U=;
 b=D5kyqvKo2Us1S1C3ajJW2DwFXbxMeE5/gCHiqcsHnphtqBUa1GI+g35+kwWPk3LElM2NPW
 2MJ7nnKr8i8hTaSFDjCiPl4ubNx5JV7uZ1oeXSAqbVBsiI2okkPzMRfuRQLO1gNznQyBVJ
 kaNI0pGDpw/YWZkr7aAfMDmNu+MTmhw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-aXVUeiYSMe25K2o-epm7sg-1; Fri, 28 Apr 2023 06:27:02 -0400
X-MC-Unique: aXVUeiYSMe25K2o-epm7sg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEE2387B2A3;
 Fri, 28 Apr 2023 10:27:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88D8C1121315;
 Fri, 28 Apr 2023 10:27:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7764721E6608; Fri, 28 Apr 2023 12:27:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  eblake@redhat.com,
 kwolf@redhat.com,  hreitz@redhat.com,  pbonzini@redhat.com,
 marcandre.lureau@redhat.com,  arei.gonglei@huawei.com,
 pizhenwei@bytedance.com,  jsnow@redhat.com,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  wangyanan55@huawei.com,
 quintela@redhat.com,  jasowang@redhat.com,  yuval.shaia.ml@gmail.com,
 stefanha@redhat.com,  kraxel@redhat.com,  kkostiuk@redhat.com,
 qemu-block@nongnu.org,  marcandre.lureau@gmail.com,  david@redhat.com
Subject: Re: [PATCH 17/16] docs/devel/qapi-code-gen: Describe some doc
 markup pitfalls
References: <20230425064223.820979-1-armbru@redhat.com>
 <20230427095346.1238913-1-armbru@redhat.com>
 <eee8f95c-43eb-b357-d42a-1c479967b97c@yandex-team.ru>
 <87y1mcnyet.fsf@pond.sub.org>
 <542215a2-fa1c-17ff-e41c-c71564b02f75@yandex-team.ru>
Date: Fri, 28 Apr 2023 12:27:00 +0200
In-Reply-To: <542215a2-fa1c-17ff-e41c-c71564b02f75@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 28 Apr 2023 12:44:55 +0300")
Message-ID: <87edo4nvyj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:

> On 28.04.23 12:34, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
>> 
>>> On 27.04.23 12:53, Markus Armbruster wrote:
>>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>>> ---
>>>>    docs/devel/qapi-code-gen.rst | 53 ++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 53 insertions(+)
>>>> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
>>>> index d81aac7a19..14983b074c 100644
>>>> --- a/docs/devel/qapi-code-gen.rst
>>>> +++ b/docs/devel/qapi-code-gen.rst
>>>> @@ -1059,6 +1059,59 @@ For example::
>>>>       'returns': ['BlockStats'] }
>>>>      +Markup pitfalls
>>>> +~~~~~~~~~~~~~~~
>>>> +
>>>> +A blank line is required between list items and paragraphs.  Without
>>>> +it, the list may not be recognized, resulting in garbled output.  Good
>>>> +example::
>>>> +
>>>> + # An event's state is modified if:
>>>> + #
>>>> + # - its name matches the @name pattern, and
>>>> + # - if @vcpu is given, the event has the "vcpu" property.
>>>> +
>>>> +Without the blank line this would be a single paragraph.
>>>> +
>>>> +Indentation matters.  Bad example::
>>>> +
>>>> + # @none: None (no memory side cache in this proximity domain,
>>>> + #              or cache associativity unknown)
>>>> +
>>>> +The description is parsed as a definition list with term "None (no
>>>> +memory side cache in this proximity domain," and definition "or cache
>>>> +associativity unknown)".
>>>
>>> May be add good example of indentation as well
>>
>> Patches I'm about to post will fill up this pitfall.  They change the
>> text to:
>>
>>       # @none: None (no memory side cache in this proximity domain,
>>       #              or cache associativity unknown)
>>       #     (since 5.0)
>>      The last line's de-indent is wrong.  The second and subsequent lines
>
> So you want to drop "The description is parsed as a definition list ..." ?

Yes, because that'll be factually wrong :)

Happy to explain further once the patches are on the list.

>>      need to line up with each other, like this::
>>
>>       # @none: None (no memory side cache in this proximity domain,
>>       #     or cache associativity unknown)
>>       #     (since 5.0)
>>
>> Good enough?
>
> Example of good indent is good)

Thanks!


