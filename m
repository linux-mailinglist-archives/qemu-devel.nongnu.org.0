Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBAB3761ED
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 10:27:17 +0200 (CEST)
Received: from localhost ([::1]:47714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1levpK-0005al-QS
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 04:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1levo0-0005Ah-2u
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:25:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1levnw-0003Wj-JL
 for qemu-devel@nongnu.org; Fri, 07 May 2021 04:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620375945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4wR3VOOjBlwnDUbUXgF9OwQkH+68awDi6sGcmu0qvcc=;
 b=dG54WG95dhpjB21u4uUzrY29p0t/iRroVKgvW5kyru8PwSxI6vWLX+YNkyC+jJ+3b3re80
 Uf7GiKliBEz6faXx7iI1ZZXIkXgX/HvjapU4DTyHRcfLS0MDo07XPVL8J7O5cXI61n59iF
 uyrSDXwKF28KStt3hKXYDwrqeOHmpWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-qa9fJMlqNvCTbPDZgEf1yw-1; Fri, 07 May 2021 04:25:41 -0400
X-MC-Unique: qa9fJMlqNvCTbPDZgEf1yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8296107ACE3;
 Fri,  7 May 2021 08:25:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93BF15D720;
 Fri,  7 May 2021 08:25:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19EB71138529; Fri,  7 May 2021 10:25:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 16/22] qapi/parser: add docstrings
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-17-jsnow@redhat.com>
 <877dkq5w9x.fsf@dusky.pond.sub.org>
 <43a39889-5537-575a-54f9-4b2b48cddbdd@redhat.com>
Date: Fri, 07 May 2021 10:25:39 +0200
In-Reply-To: <43a39889-5537-575a-54f9-4b2b48cddbdd@redhat.com> (John Snow's
 message of "Thu, 6 May 2021 21:34:41 -0400")
Message-ID: <87im3v0x30.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/25/21 9:27 AM, Markus Armbruster wrote:
>> Another ignorant doc string markup question...  how am I supposed to see
>> that exprs and docs are attributes, and not global variables?
>> 
>
> The syntax is apparently supposed to be :py:attr:`MyClass.attr`. Though, 
> it doesn't seem to be working for me. I can write :py:attr:`bzbxglkdsgl` 
> and the build succeeds. I gotta hunch:

[Problems...]

>
>   ____   ___   ___   ___  _
> | __ ) / _ \ / _ \ / _ \| |
> |  _ \| | | | | | | | | | |
> | |_) | |_| | |_| | |_| |_|
> |____/ \___/ \___/ \___/(_)
>
>
> Sigh. Well, while I'm here doing the research and talking to myself, the 
> syntax :attr:`exprs` also works when you have the target defined. It 
> doesn't have to be as verbose. With my testing setup of using the 
> default role of "any", even just `exprs` works.
>
> I wonder if there's the possibility of having sphinx enhance :ivar: and 
> :cvar: to automatically create the same kind of reference target as 
> py:attribute:: does.
>
> Problems for later.
>
> For now ...
>
> ``.exprs`` and ``.docs``?

Works for me.


