Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061D6F06DE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:47:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1yR-0004xu-Jt; Thu, 27 Apr 2023 09:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps1yL-0004tp-Mf; Thu, 27 Apr 2023 09:47:47 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps1yI-0008Pg-Ah; Thu, 27 Apr 2023 09:47:45 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 68ACE5EF81;
 Thu, 27 Apr 2023 16:47:20 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b438::1:2b] (unknown
 [2a02:6b8:b081:b438::1:2b])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id IlIZj10OfOs0-K6xwZAzq; Thu, 27 Apr 2023 16:47:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682603239; bh=z2zrxWBz2+5PmOYaptNX+ndkznxPugRE4Pk14SRce4A=;
 h=In-Reply-To:Cc:Date:References:To:From:Subject:Message-ID;
 b=oRzG47GwRl4WwM/4HwQo7w1xuo+yNk9XLna3g5jYO1WD6eVdoCy5Ik6koqDypftZX
 EmHXwe4oAMtO6WezRBVRfVVk+j0dihVvhOhe1Pz4qIkMzzVaeLzlea8EsVPOie7OfV
 oB4NkP40jFgHepv5TQbV3Sn5ilyUqyP0Gzkv2UsE=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <b7663097-058c-d98e-d3e8-9a886f36852a@yandex-team.ru>
Date: Thu, 27 Apr 2023 16:47:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 17/16] docs/devel/qapi-code-gen: Describe some doc markup
 pitfalls
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, eblake@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, jasowang@redhat.com, yuval.shaia.ml@gmail.com,
 stefanha@redhat.com, kraxel@redhat.com, kkostiuk@redhat.com,
 qemu-block@nongnu.org, marcandre.lureau@gmail.com, david@redhat.com
References: <20230425064223.820979-1-armbru@redhat.com>
 <20230427095346.1238913-1-armbru@redhat.com>
 <eee8f95c-43eb-b357-d42a-1c479967b97c@yandex-team.ru>
In-Reply-To: <eee8f95c-43eb-b357-d42a-1c479967b97c@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27.04.23 15:41, Vladimir Sementsov-Ogievskiy wrote:
> On 27.04.23 12:53, Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   docs/devel/qapi-code-gen.rst | 53 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>
>> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
>> index d81aac7a19..14983b074c 100644
>> --- a/docs/devel/qapi-code-gen.rst
>> +++ b/docs/devel/qapi-code-gen.rst
>> @@ -1059,6 +1059,59 @@ For example::
>>      'returns': ['BlockStats'] }
>> +Markup pitfalls
>> +~~~~~~~~~~~~~~~
>> +
>> +A blank line is required between list items and paragraphs.  Without
>> +it, the list may not be recognized, resulting in garbled output.  Good
>> +example::
>> +
>> + # An event's state is modified if:
>> + #
>> + # - its name matches the @name pattern, and
>> + # - if @vcpu is given, the event has the "vcpu" property.
>> +
>> +Without the blank line this would be a single paragraph.
>> +
>> +Indentation matters.  Bad example::
>> +
>> + # @none: None (no memory side cache in this proximity domain,
>> + #              or cache associativity unknown)
>> +
>> +The description is parsed as a definition list with term "None (no
>> +memory side cache in this proximity domain," and definition "or cache
>> +associativity unknown)".
> 
> May be add good example of indentation as well

anyway:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> 
>> +
>> +Section tags are case-sensitive and end with a colon.  Good example::
>> +
>> + # Since: 7.1
>> +
>> +Bad examples (all ordinary paragraphs)::
>> +
>> + # since: 7.1
>> +
>> + # Since 7.1
>> +
>> + # Since : 7.1
>> +
>> +Likewise, member descriptions require a colon.  Good example::
>> +
>> + # @interface-id: Interface ID
>> +
>> +Bad examples (all ordinary paragraphs)::
>> +
>> + # @interface-id   Interface ID
>> +
>> + # @interface-id : Interface ID
>> +
>> +Undocumented members are not flagged, yet.  Instead, the generated
>> +documentation describes them as "Not documented".  Think twice before
>> +adding more undocumented members.
>> +
>> +When you change documentation comments, please check the generated
>> +documentation comes out as intended!
>> +
>> +
>>   Client JSON Protocol introspection
>>   ==================================
> 

-- 
Best regards,
Vladimir


