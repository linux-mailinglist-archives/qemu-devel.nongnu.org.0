Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BB72DC55A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:29:58 +0100 (CET)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpacf-0007ZE-4l
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpaan-0006g8-5U
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:28:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpaah-0000go-Ge
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UpJyUkocO4MLC87bgljPhSlAUTffwERxw5oTGdmX8UQ=;
 b=I9BAlknHeSxD2mEKnXXjXLD5N5zlkm+O865+1prB1UgIMVVb44b5kS6TQhuQsjL1XgMk88
 Yt7Nuq3VVNPYe7mrkbZ3ZUyUBbrL7D4bxxGBr548/EJhjI0YAr8WLH4UpEb3epNYr39OxG
 UOxrDhr0zeDZ1JZpFJ7Xo7Rt9mjfBhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-5y4HBw4RN4OKcYcLKOx_qw-1; Wed, 16 Dec 2020 12:27:51 -0500
X-MC-Unique: 5y4HBw4RN4OKcYcLKOx_qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF928030A2
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 17:27:50 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C8831803E;
 Wed, 16 Dec 2020 17:27:46 +0000 (UTC)
Subject: Re: [PATCH 05/12] qapi/gen: use './builtin' for the built-in module
 name
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-6-jsnow@redhat.com>
 <873606tah6.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <c18b20e4-c684-e701-9b27-fe3c6fd425bb@redhat.com>
Date: Wed, 16 Dec 2020 12:27:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <873606tah6.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 3:35 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Use this in preference to 'None', which helps remove some edge cases in
>> the typing.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
> 
> Clearly better.  Should've done it this way in commit c2e196a9b4 "qapi:
> Prepare for system modules other than 'builtin'".
> 
>> ---
>>   scripts/qapi/gen.py | 27 +++++++++++++--------------
>>   1 file changed, 13 insertions(+), 14 deletions(-)
>>
>> diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
>> index a6dc991b1d03..0c5d1fee6088 100644
>> --- a/scripts/qapi/gen.py
>> +++ b/scripts/qapi/gen.py
>> @@ -245,23 +245,23 @@ def __init__(self,
>>           self._pydoc = pydoc
>>           self._genc: Optional[QAPIGenC] = None
>>           self._genh: Optional[QAPIGenH] = None
>> -        self._module: Dict[Optional[str], Tuple[QAPIGenC, QAPIGenH]] = {}
>> +        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
>>           self._main_module: Optional[str] = None
>>   
>>       @staticmethod
>> -    def _is_user_module(name: Optional[str]) -> bool:
>> -        return bool(name and not name.startswith('./'))
>> +    def _is_user_module(name: str) -> bool:
>> +        return not name.startswith('./')
>>   
>>       @staticmethod
>> -    def _is_builtin_module(name: Optional[str]) -> bool:
>> -        return not name
>> +    def _is_builtin_module(name: str) -> bool:
>> +        return name == './builtin'
>>   
>> -    def _module_dirname(self, name: Optional[str]) -> str:
>> +    def _module_dirname(self, name: str) -> str:
>>           if self._is_user_module(name):
>>               return os.path.dirname(name)
>>           return ''
>>   
>> -    def _module_basename(self, what: str, name: Optional[str]) -> str:
>> +    def _module_basename(self, what: str, name: str) -> str:
>>           ret = '' if self._is_builtin_module(name) else self._prefix
>>           if self._is_user_module(name):
>>               basename = os.path.basename(name)
>> @@ -269,15 +269,14 @@ def _module_basename(self, what: str, name: Optional[str]) -> str:
>>               if name != self._main_module:
>>                   ret += '-' + os.path.splitext(basename)[0]
>>           else:
> 
> Possible drive-by improvement:
> 
>                 assert name.startswith('./')
> 

As long as nobody tells me to split that unrelated change into a new 
patch I'll happily add drive-by improvements upon request ;)

>> -            name = name[2:] if name else 'builtin'
>> -            ret += re.sub(r'-', '-' + name + '-', what)
>> +            ret += re.sub(r'-', '-' + name[2:] + '-', what)
>>           return ret
>>   
>> -    def _module_filename(self, what: str, name: Optional[str]) -> str:
>> +    def _module_filename(self, what: str, name: str) -> str:
>>           return os.path.join(self._module_dirname(name),
>>                               self._module_basename(what, name))
>>   
>> -    def _add_module(self, name: Optional[str], blurb: str) -> None:
>> +    def _add_module(self, name: str, blurb: str) -> None:
>>           basename = self._module_filename(self._what, name)
>>           genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
>>           genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
>> @@ -290,8 +289,8 @@ def _add_user_module(self, name: str, blurb: str) -> None:
>>               self._main_module = name
>>           self._add_module(name, blurb)
>>   
>> -    def _add_system_module(self, name: Optional[str], blurb: str) -> None:
>> -        self._add_module(name and './' + name, blurb)
>> +    def _add_system_module(self, name: str, blurb: str) -> None:
>> +        self._add_module(f"./{name}", blurb)
> 
> I like f-strings, I really do, but is
> 
>      f"./{name}"
> 
> really clearer than
> 
>      './' + name
> 
> ?
> 

I tend to avoid string concatenation as a habit, but there's no greater 
reason; the old value needed updating and that's what fell out of my 
keyboard, I suppose.

>>   
>>       def write(self, output_dir: str, opt_builtins: bool = False) -> None:
>>           for name in self._module:
>> @@ -310,7 +309,7 @@ def _begin_user_module(self, name: str) -> None:
>>       def visit_module(self, name: Optional[str]) -> None:
>>           if name is None:
>>               if self._builtin_blurb:
>> -                self._add_system_module(None, self._builtin_blurb)
>> +                self._add_system_module('builtin', self._builtin_blurb)
>>                   self._begin_system_module(name)
>>               else:
>>                   # The built-in module has not been created.  No code may


