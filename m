Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BE2314215
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:42:19 +0100 (CET)
Received: from localhost ([::1]:40932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EIT-0003LL-Vp
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l98v1-0004eK-OB
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l98v0-0007Ly-1a
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 10:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612799860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLfmRGZzqUnKLp3+HADDVLKOB26kYTlAk9vHCc9frz0=;
 b=bKy7R9GyNyqV59i9iZ/GJ0o1GdHrX0C3i49kR36nRP1aJ79BzFC26MNsh6546An0NasOqy
 iohRNvtNE/IYLOilAt+4Shh22ph1IYBvxRz4GxG+kDuhOUfC419tLG+eFGmygxj8A821My
 VUiXeAzW/meI94RZdr/gDU3m2amc+v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-bjIvtbSfN16PKr-i-QiwiQ-1; Mon, 08 Feb 2021 10:57:38 -0500
X-MC-Unique: bjIvtbSfN16PKr-i-QiwiQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9487085B673
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 15:57:37 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DACDA19C59;
 Mon,  8 Feb 2021 15:57:36 +0000 (UTC)
Subject: Re: [PATCH v5 14/15] qapi/introspect.py: Add docstring to
 _tree_to_qlit
To: Markus Armbruster <armbru@redhat.com>
References: <20210204003207.2856909-1-jsnow@redhat.com>
 <20210204003207.2856909-15-jsnow@redhat.com>
 <878s7y36na.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <d0e5c184-ed0f-63ca-7d70-53ad1632205a@redhat.com>
Date: Mon, 8 Feb 2021 10:57:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <878s7y36na.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 10:45 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   scripts/qapi/introspect.py | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
>> index 2a39726f40a..2b338abe2cf 100644
>> --- a/scripts/qapi/introspect.py
>> +++ b/scripts/qapi/introspect.py
>> @@ -97,6 +97,14 @@ def __init__(self, value: _NodeT, ifcond: Iterable[str],
>>   def _tree_to_qlit(obj: TreeValue,
>>                     level: int = 0,
>>                     dict_value: bool = False) -> str:
>> +    """
>> +    Convert the type tree into a QLIT C string, recursively.
>> +
>> +    :param obj: The value to convert.
>> +    :param level: The indentation level for this particular value.
>> +    :param dict_value: True when the value being processed belongs to a
>> +                       dict key; which suppresses the output indent.
>> +    """
>>   
>>       def indent(level: int) -> str:
>>           return level * 4 * ' '
> 
> Might want to mention @obj may not be Annotated when dict_value=True.
> Not a demand.
> 

No, that's a good point.

--js


