Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D782DD01D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:11:14 +0100 (CET)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kprBg-0008LZ-5s
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kprAA-0007ta-F0
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kprA6-0005d3-VZ
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608203373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IZWs11Uan6jXjvLlxn/bA938R4Sr+XLuw5fRETGTh/E=;
 b=HlhJmuY9jElQjuKsE6+7Sf2PIlTdRQBJmpb/88vbJSt6ztYhWXmz/lJ3sk2hpJICBL3Dhm
 aRlnRfuD6L2qOzvbUWD/nhvfrUiF6Ldn82OkmgmrnYUCNAqKaDp+PKc7+IEKjdg+7nTLjy
 aIYJ1r5TfvHwUhp9Y3qaB6CcBvggeMs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-bS46EMTnN5CFWKMx9cgbBw-1; Thu, 17 Dec 2020 06:09:30 -0500
X-MC-Unique: bS46EMTnN5CFWKMx9cgbBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 757E0107ACE3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 11:09:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E69CAE730;
 Thu, 17 Dec 2020 11:09:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 667D911329A5; Thu, 17 Dec 2020 12:09:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 11/12] qapi/schema: Name the builtin module "" instead
 of None
References: <20201214235327.1007124-1-jsnow@redhat.com>
 <20201214235327.1007124-12-jsnow@redhat.com>
 <87mtyeqbf2.fsf@dusky.pond.sub.org>
 <517d53cd-16c6-e15b-b2af-2dfed17935d2@redhat.com>
Date: Thu, 17 Dec 2020 12:09:22 +0100
In-Reply-To: <517d53cd-16c6-e15b-b2af-2dfed17935d2@redhat.com> (John Snow's
 message of "Wed, 16 Dec 2020 13:57:23 -0500")
Message-ID: <87ft44lme5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 12/16/20 5:42 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Instead of using None as the built-in module filename, use an empty
>>> string instead.
>> 
>> PATCH 05's changes the module name of the special system module for
>> built-in stuff from None to './builtin'.  The other system modules are
>> named like './FOO': './init' and './emit' currently.
>> 
>> This one changes the module *filename* from None to "", and not just for
>> the builtin module, but for *all* system modules.  Your commit message
>> claims only "the built-in module", which is not true as far as I can
>> tell.
>> 
>
> Is this true? ... "./init" and "./emit" are defined only in the 
> generators, outside of the schema entirely. They don't even have 
> "QAPISchemaModule" objects associated with them.
>
> I changed:
>
>          self._make_module(None)  # built-ins 
>
>
> to
>
>          self._make_module(QAPISourceInfo.builtin().fname)  # built-ins 
>
>
>
> that should be precisely only "the" built-in module, shouldn't it? the 
> other "system" modules don't even pass through _make_module.

You're right.

The schema IR has only user-defined modules and the built-ins module.
Each module has a name.  We use the source file name for the
user-defined modules.  The built-ins module has none, so we use None.

The QAPISchemaModularCVisitor generates "modular" output.  It has
per-module data, keyed by module name.  It supports user-defined and
system modules.  We set them up as follows.  The user-defined modules
are exactly the schema IR's (same name).  The system modules are the
schema IR's built-ins module (same name) plus whatever the user of
QAPISchemaModularCVisitor adds (convention: name starts with ./, so it
can't clash).

Why let generators add system modules that don't exist in the schema IR?
It's a reasonably clean way to generate stuff that doesn't fit elsewhere
into separate .[ch] files.

PATCH 05 changes the name of the built-ins module from None to
'./builtins' in the QAPISchemaModularCVisitor only.  Correct?

This patch changes the name of the built-ins module from None to "" in
the schema IR only.  Correct?

>> Should we use the opportunity to make the filename match the module
>> name?
>> 
>
> If that's something you want to have happen, it can be done, yes.

Having different "module names" for the built-ins module in different
places could be confusing.

The issue appears in PATCH 05.  I'm fine with the two module names
diverging temporarily in this series.  I'd prefer them to be the same at
the end.

> I had a draft that did it that way initially; I was afraid I was mixing 
> up two distinct things: the module fname (schema.py's concept of 
> modules) and module name (gen.py's concept of modules). This version of 
> my patch kept the two more distinct like they are currently.
>
> We can change "the" built-in module to have an fname of "./builtin" 
> which works just fine; gen.py just has to change to not add "./" to 
> modules already declared with the leading slash.
>
> Up for debate is if you want the system modules declared in the code 
> generators to have to declare 'emit' or './emit'; I left them alone and 
> allowed them to say 'event'.

I pass 'emit' to argument name, so a simple './' + name obviously
results in a system module name.

With './emit', we achieve "obviously" by assert name.startswith('./').
Matter of taste.

> Downside: the ./ prefix takes on special meaning in both gen.py and 
> schema.py. the module organization feels decentralized and fragile.

Making the './' prefix special is fine.  But you're right, doing it in
two places and with precious little explanation is not so fine.

We could have schema.py provide some notion of "module name".  Weasel
words "some notion" for artistic license.

If we'd prefer not to do it now, a few judicious comments should suffice
for now.

>>>                  This allows us to clarify the type of various interfaces
>>> dealing with module names as always taking a string, which saves us from
>>> having to use Optional[str] everywhere.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>


