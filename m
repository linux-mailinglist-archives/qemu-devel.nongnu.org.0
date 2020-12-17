Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6252DDA92
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 22:09:25 +0100 (CET)
Received: from localhost ([::1]:59194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0Wa-0005K7-R1
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 16:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kq0VG-0004NV-A0
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 16:08:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kq0VD-0002iW-Af
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 16:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608239277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZySnEJaASN7yR0e4KppbeS6ExRmgtQWTpMW8iUKioY8=;
 b=OKDR5I030BHx0ayPgICbzvGLAZ1b4r/C23yjNhmyisYFvnMjVTh/62lKGkEQ+RC7bgbkBD
 1lO8GeSeABnwo8VditFjTP0vtmgvnJFR5L3+YUzYPhPI9ogj5FeQd8WsbX7aVwhIlI1fqO
 54sgvnpNpN5ES6Ag5jM2XTQM0EC3omA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-6cs6Vg-LMpyFBAc0eP2F1g-1; Thu, 17 Dec 2020 16:07:54 -0500
X-MC-Unique: 6cs6Vg-LMpyFBAc0eP2F1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D11AC107ACE3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 21:07:53 +0000 (UTC)
Received: from [10.10.112.131] (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 860742CFAD;
 Thu, 17 Dec 2020 21:07:37 +0000 (UTC)
Subject: Re: [PATCH 11/12] qapi/schema: Name the builtin module "" instead of
 None
To: Markus Armbruster <armbru@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-12-jsnow@redhat.com>
 <87mtyeqbf2.fsf@dusky.pond.sub.org>
 <517d53cd-16c6-e15b-b2af-2dfed17935d2@redhat.com>
 <87ft44lme5.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <7c73d8da-b9ba-fa36-f923-067c0920c3ef@redhat.com>
Date: Thu, 17 Dec 2020 16:07:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87ft44lme5.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/20 6:09 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> On 12/16/20 5:42 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:
>>>
>>>> Instead of using None as the built-in module filename, use an empty
>>>> string instead.
>>>
>>> PATCH 05's changes the module name of the special system module for
>>> built-in stuff from None to './builtin'.  The other system modules are
>>> named like './FOO': './init' and './emit' currently.
>>>
>>> This one changes the module *filename* from None to "", and not just for
>>> the builtin module, but for *all* system modules.  Your commit message
>>> claims only "the built-in module", which is not true as far as I can
>>> tell.
>>>
>>
>> Is this true? ... "./init" and "./emit" are defined only in the
>> generators, outside of the schema entirely. They don't even have
>> "QAPISchemaModule" objects associated with them.
>>
>> I changed:
>>
>>           self._make_module(None)  # built-ins
>>
>>
>> to
>>
>>           self._make_module(QAPISourceInfo.builtin().fname)  # built-ins
>>
>>
>>
>> that should be precisely only "the" built-in module, shouldn't it? the
>> other "system" modules don't even pass through _make_module.
> 
> You're right.
> 
> The schema IR has only user-defined modules and the built-ins module.
> Each module has a name.  We use the source file name for the
> user-defined modules.  The built-ins module has none, so we use None.
> 
> The QAPISchemaModularCVisitor generates "modular" output.  It has
> per-module data, keyed by module name.  It supports user-defined and
> system modules.  We set them up as follows.  The user-defined modules
> are exactly the schema IR's (same name).  The system modules are the
> schema IR's built-ins module (same name) plus whatever the user of
> QAPISchemaModularCVisitor adds (convention: name starts with ./, so it
> can't clash).
> 
> Why let generators add system modules that don't exist in the schema IR?
> It's a reasonably clean way to generate stuff that doesn't fit elsewhere
> into separate .[ch] files.
> 
> PATCH 05 changes the name of the built-ins module from None to
> './builtins' in the QAPISchemaModularCVisitor only.  Correct?
> 

That's right. That was a useful change all by itself, and winds up being 
useful for the genc/genh typing.

> This patch changes the name of the built-ins module from None to "" in
> the schema IR only.  Correct?
> 

As far as I know, yes. ("Schema IR -- Internal Registry?")

>>> Should we use the opportunity to make the filename match the module
>>> name?
>>>
>>
>> If that's something you want to have happen, it can be done, yes.
> 
> Having different "module names" for the built-ins module in different
> places could be confusing.
> 

Yes, but we technically didn't use the generator-only names in the 
Schema before, so I didn't want to assume we'd want them here.

> The issue appears in PATCH 05.  I'm fine with the two module names
> diverging temporarily in this series.  I'd prefer them to be the same at
> the end.
> 

OK, no problem. I'll try to make this nicer and unify things just a 
pinch more.

--js

>> I had a draft that did it that way initially; I was afraid I was mixing
>> up two distinct things: the module fname (schema.py's concept of
>> modules) and module name (gen.py's concept of modules). This version of
>> my patch kept the two more distinct like they are currently.
>>
>> We can change "the" built-in module to have an fname of "./builtin"
>> which works just fine; gen.py just has to change to not add "./" to
>> modules already declared with the leading slash.
>>
>> Up for debate is if you want the system modules declared in the code
>> generators to have to declare 'emit' or './emit'; I left them alone and
>> allowed them to say 'event'.
> 
> I pass 'emit' to argument name, so a simple './' + name obviously
> results in a system module name.
> 
> With './emit', we achieve "obviously" by assert name.startswith('./').
> Matter of taste.
> 
>> Downside: the ./ prefix takes on special meaning in both gen.py and
>> schema.py. the module organization feels decentralized and fragile.
> 
> Making the './' prefix special is fine.  But you're right, doing it in
> two places and with precious little explanation is not so fine.
> 
> We could have schema.py provide some notion of "module name".  Weasel
> words "some notion" for artistic license.
> 
> If we'd prefer not to do it now, a few judicious comments should suffice
> for now.
> 
>>>>                   This allows us to clarify the type of various interfaces
>>>> dealing with module names as always taking a string, which saves us from
>>>> having to use Optional[str] everywhere.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>


