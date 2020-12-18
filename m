Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2A22DDE13
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 06:33:08 +0100 (CET)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8O3-0005Sq-AC
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 00:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kq8Md-0004l8-Up
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:31:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kq8MV-0008BR-Vk
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 00:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608269489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9nqBAQGGZa+G9Ol3FYVO6/OJr66RBgw3itF8b5/6RPE=;
 b=g4A3lY4FSu5hq6UC93mN0USO1L9Jg/GbhJ3zyYDJiMOu6HJ7rOgpkM7pgmko4rKE6nkOeu
 6XgcvucseDq5Gt+2YUXhfsLr3Yj5oq4NS4vyugtE4Pb7R8TiMqLqRceC3IUHabLojp63h9
 i2WqaaZZ9m7HHWQDocfUGK4xYmC6qIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-JwCsDg13OKCgKqf62UNT5g-1; Fri, 18 Dec 2020 00:31:25 -0500
X-MC-Unique: JwCsDg13OKCgKqf62UNT5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14AC310054FF
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 05:31:25 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF6F65D9CD;
 Fri, 18 Dec 2020 05:31:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73C641130358; Fri, 18 Dec 2020 06:31:20 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 11/12] qapi/schema: Name the builtin module "" instead
 of None
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-12-jsnow@redhat.com>
 <87mtyeqbf2.fsf@dusky.pond.sub.org>
 <517d53cd-16c6-e15b-b2af-2dfed17935d2@redhat.com>
 <87ft44lme5.fsf@dusky.pond.sub.org>
 <7c73d8da-b9ba-fa36-f923-067c0920c3ef@redhat.com>
Date: Fri, 18 Dec 2020 06:31:20 +0100
In-Reply-To: <7c73d8da-b9ba-fa36-f923-067c0920c3ef@redhat.com> (John Snow's
 message of "Thu, 17 Dec 2020 16:07:37 -0500")
Message-ID: <87ft43d6jb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 12/17/20 6:09 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 12/16/20 5:42 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
>>>>
>>>>> Instead of using None as the built-in module filename, use an empty
>>>>> string instead.
>>>>
>>>> PATCH 05's changes the module name of the special system module for
>>>> built-in stuff from None to './builtin'.  The other system modules are
>>>> named like './FOO': './init' and './emit' currently.
>>>>
>>>> This one changes the module *filename* from None to "", and not just for
>>>> the builtin module, but for *all* system modules.  Your commit message
>>>> claims only "the built-in module", which is not true as far as I can
>>>> tell.
>>>>
>>>
>>> Is this true? ... "./init" and "./emit" are defined only in the
>>> generators, outside of the schema entirely. They don't even have
>>> "QAPISchemaModule" objects associated with them.
>>>
>>> I changed:
>>>
>>>           self._make_module(None)  # built-ins
>>>
>>>
>>> to
>>>
>>>           self._make_module(QAPISourceInfo.builtin().fname)  # built-ins
>>>
>>>
>>>
>>> that should be precisely only "the" built-in module, shouldn't it? the
>>> other "system" modules don't even pass through _make_module.
>> 
>> You're right.
>> 
>> The schema IR has only user-defined modules and the built-ins module.
>> Each module has a name.  We use the source file name for the
>> user-defined modules.  The built-ins module has none, so we use None.
>> 
>> The QAPISchemaModularCVisitor generates "modular" output.  It has
>> per-module data, keyed by module name.  It supports user-defined and
>> system modules.  We set them up as follows.  The user-defined modules
>> are exactly the schema IR's (same name).  The system modules are the
>> schema IR's built-ins module (same name) plus whatever the user of
>> QAPISchemaModularCVisitor adds (convention: name starts with ./, so it
>> can't clash).
>> 
>> Why let generators add system modules that don't exist in the schema IR?
>> It's a reasonably clean way to generate stuff that doesn't fit elsewhere
>> into separate .[ch] files.
>> 
>> PATCH 05 changes the name of the built-ins module from None to
>> './builtins' in the QAPISchemaModularCVisitor only.  Correct?
>> 
>
> That's right. That was a useful change all by itself, and winds up being 
> useful for the genc/genh typing.
>
>> This patch changes the name of the built-ins module from None to "" in
>> the schema IR only.  Correct?
>> 
>
> As far as I know, yes. ("Schema IR -- Internal Registry?")

Internal representation (the stuff in schema.py).  Compiler jargon,
sorry.

>>>> Should we use the opportunity to make the filename match the module
>>>> name?
>>>>
>>>
>>> If that's something you want to have happen, it can be done, yes.
>> 
>> Having different "module names" for the built-ins module in different
>> places could be confusing.
>> 
>
> Yes, but we technically didn't use the generator-only names in the 
> Schema before, so I didn't want to assume we'd want them here.

We can't have them there, because the things they name don't exist
there.

What we can have is a consistent naming convention that leads to same
things having the same names in both places.

>> The issue appears in PATCH 05.  I'm fine with the two module names
>> diverging temporarily in this series.  I'd prefer them to be the same at
>> the end.
>> 
>
> OK, no problem. I'll try to make this nicer and unify things just a 
> pinch more.
>
> --js


