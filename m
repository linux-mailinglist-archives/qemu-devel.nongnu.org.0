Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA0031CD9C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:11:36 +0100 (CET)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2wp-00029l-6J
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lC2vI-000194-D0
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:10:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lC2vF-0000tx-4q
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613491795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0DYe9xh7/Yr0y12t7pNP5YqWiXjVXC4GdaH907DVsW0=;
 b=EAAOp4fjkDk684dEIdA5f7ZFQKqzI/enY5z/HORuMNuIOzUEXSVXpD8cp7Kfc2eJgBPInL
 MA6j9lQWiGzcKWwPS0g9QaVx2JFlyXjJUCAg84uUmUxCKo8Wu85DsB8AAmAD5E+WcQtq0u
 Z7+TOCW4Bh6vKNBbQAxJ8PEcAgW+5RA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-jjtVdPyXMwWzmLqpK13E_A-1; Tue, 16 Feb 2021 11:09:53 -0500
X-MC-Unique: jjtVdPyXMwWzmLqpK13E_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B30C1020C20;
 Tue, 16 Feb 2021 16:09:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-100.ams2.redhat.com
 [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ACFD60C15;
 Tue, 16 Feb 2021 16:09:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B305F113865F; Tue, 16 Feb 2021 17:09:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v6 19/19] qapi/introspect.py: add SchemaMetaType enum
References: <20210216021809.134886-1-jsnow@redhat.com>
 <20210216021809.134886-20-jsnow@redhat.com>
 <87pn10nz57.fsf@dusky.pond.sub.org>
 <ff534bd4-ad04-1afe-b820-cc1482c8566b@redhat.com>
Date: Tue, 16 Feb 2021 17:09:50 +0100
In-Reply-To: <ff534bd4-ad04-1afe-b820-cc1482c8566b@redhat.com> (John Snow's
 message of "Tue, 16 Feb 2021 10:08:38 -0500")
Message-ID: <87mtw4q9ip.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 2/16/21 4:24 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Follows the qapi/introspect.py definition of the same; this adds a more
>>> precise typing to _gen_tree's mtype parameter.
>>>
>>> NB: print(SchemaMetaType.BUILTIN) would produce the string
>>> "SchemaMetaType.BUILTIN", but when using format strings (.format or f-strings),
>>> it relies on the __format__ method defined in the Enum class, which uses the
>>> "value" of the enum instead, producing the string "builtin".
>>>
>>> For consistency with old-style format strings (which simply call the
>>> __str__ method of an object), a __str__ dunder is added, though it is
>>> not actually used here in this code.
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>
[...]
>> Gain: _gen_tree()'s second argument's type now serves as documentation,
>> and passing crap to it becomes harder.
>> 
>> Gut feeling: too much notational overhead for too little gain.
>> 
>> Opinions?
>> 
>
> No strong feelings one way or the other, honestly. I wrote this mostly 
> to see how much the overhead would be based on your comment about the 
> loose typing of meta-type as str.
>
> If it's too much for too little for you, I'm okay without it too.

Let's put it aside for now.


