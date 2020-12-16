Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F6E2DC5B2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:50:45 +0100 (CET)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpawm-0003of-Vm
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpavQ-00032k-UW
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:49:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpavM-0004UW-D7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:49:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608140953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AeRMIeCmg1lmUA8ROF8yK6xd/w2VoZEr0JNYaO451as=;
 b=PWOPBVYbiDjIRz3tOgss0wsjAC4jXSaC8Zz9z9eF/6e0U15KYRay3x2FAyGf1ad6fNDDsW
 QrSD5iKxrDli/NKcjybBucNfWT587MebZABZAa3wUWN5v563ZG0sTa8SJQanE/3cWK9QuQ
 l8iD3aZbXPeO6AnxpYcm6TiOdgrpjbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-YXi2JL3uM1atYlExX-f-oA-1; Wed, 16 Dec 2020 12:49:11 -0500
X-MC-Unique: YXi2JL3uM1atYlExX-f-oA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB04C107ACF5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 17:49:10 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8669018024;
 Wed, 16 Dec 2020 17:49:08 +0000 (UTC)
Date: Wed, 16 Dec 2020 12:49:07 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 05/11] qapi/introspect.py: add preliminary type hint
 annotations
Message-ID: <20201216174907.GF3140057@habkost.net>
References: <20201026194251.11075-1-jsnow@redhat.com>
 <20201026194251.11075-6-jsnow@redhat.com>
 <874kltnqx8.fsf@dusky.pond.sub.org>
 <995012d8-9b13-726a-fa05-844ec8ff61f6@redhat.com>
 <87v9d2tci9.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87v9d2tci9.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 16, 2020 at 08:51:10AM +0100, Markus Armbruster wrote:
[...]
> You guys clearly struggled with the tree data structure.  Documentation
> would have helped[*].  Since you're going to replace it (PATCH 09),
> adding it now makes little sense.
> 
> *My* struggle is with the type annotations.
> 
> The initial state is messy to type, in part due to mypy's surprising
> inability to deal with recursive types, in part because the tree data
> structure is messier than it could be.
> 
> Much of the series is cleanup that benefits the typing.  Makes sense.
> 
> What makes review hard for me: you add (fairly complicated) typing
> first, then evolve it along with the cleanups.  I have to first grok the
> complicated typing (a struggle), then for each cleanup grok the type
> changes in addition to the code changes.
> 
> I believe adding the typing before the cleanups is a mistake.

Possibly my fault, as I remember asking John to do that (in
earlier versions of these patches, type annotations were added
after cleanup).

> 
> I share the desire to have type annotations that help with understanding
> the code.  I understand the desire to have them sooner rather than
> later.  I just think they're a costly distraction at this stage for this
> code.  Once you understand the data structure, the cleanups are fairly
> straightforward.
> 

I expected the type annotations to be a simple and helpful tool
for understanding the data structure before refactoring.  In the
case of introspect.py, I was completely wrong about "simple", and
I'm not entirely sure about "helpful".

I wasn't expecting them to be an obstacle for patch review,
though.  If the type annotations look good at the end of the
series, do we care about the intermediate state?  Bisectability
isn't an issue because type annotations are ignored by the Python
interpreter.

-- 
Eduardo


