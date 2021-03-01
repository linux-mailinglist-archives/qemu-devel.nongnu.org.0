Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B495327A94
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 10:19:51 +0100 (CET)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGeiT-0002Vi-Mb
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 04:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGegv-00023j-5T
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 04:18:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGegs-0005KW-69
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 04:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614590287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IvXJIhIDjbr3lJnuXbpEgtBvlQluvtZCQv0Xg//XaJM=;
 b=QYEhE7TVaiEN6B9MPg1fX7BdLdMmz/uQyWKkRJuN3QjsUczvTNaOZsUtRV/oRbte70YH+d
 GxYJAnon35PH0NT30sjupd3S85MLbJCb1UEaICvBV8nk6LyIZxvc1ZzelFmwRNthZjPUhH
 8akfuiROzGBrz3A/7pLUXkfOyPCUz70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-uzgkt_w2M9-fXN_0HiBEMw-1; Mon, 01 Mar 2021 04:18:02 -0500
X-MC-Unique: uzgkt_w2M9-fXN_0HiBEMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA01579EC0;
 Mon,  1 Mar 2021 09:18:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA10010013D7;
 Mon,  1 Mar 2021 09:18:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 30B60113860F; Mon,  1 Mar 2021 10:18:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Bogus "is either too old or uses too old a Python version" from
 docs/meson.build
References: <87ft1kqqsp.fsf@dusky.pond.sub.org>
 <CAFEAcA-NyQT_m37UfeH5KAQ9+dkNBHcQivYyrS4C9F3EUqJ+Nw@mail.gmail.com>
 <87zgzsb6xu.fsf@dusky.pond.sub.org>
 <CAFEAcA9x9DV4Pvu7CifuHRXrqcgvPWs+wB5UUtcmrEK0G+3mYw@mail.gmail.com>
Date: Mon, 01 Mar 2021 10:17:59 +0100
In-Reply-To: <CAFEAcA9x9DV4Pvu7CifuHRXrqcgvPWs+wB5UUtcmrEK0G+3mYw@mail.gmail.com>
 (Peter Maydell's message of "Thu, 25 Feb 2021 14:01:59 +0000")
Message-ID: <875z2bkzaw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 25 Feb 2021 at 13:41, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > I'm not sure what could reasonably be done. The Sphinx test is just
>> > "try building a trivial document with our config (which is what
>> > enforces the version requirement)".
>>
>> This question is almost certainly naive: why is it necessary for the
>> "trivial" document to include the truckload generated by qapi-gen.py
>
> Because we want to use docs/conf.py, and docs/conf.py says
> "these are the plugins we use" (by setting the 'extensions' config
> variable, and so Sphinx will run the bit of the plugin that is "run this to
> initialize me".

I see.

> You could add conditionals to the conf.py to say "don't set the 'extensions'
> variable if we're being called for the trivial document by configure",
> but if there really is some problem with the user's environment that
> means that those extensions don't work, we'd rather have configure
> detect that and default to don't-build-docs, rather than configure
> believe that all is OK and then the 'make' later falling over.

Makes sense for the initial configure, but I'm afraid it's not what
happens in the "need to run config.status case" case.

If I configured with --enable-docs, then "make" running config.status
fails in the opaque way I described.  You argued anyone messing with the
QAPI generator should be capable of following the "A full log can be
found at" clue, and figure out what's wrong.  Fair enough, as long as we
ignore the possibility that qapi-gen could ever start to fail for
reasons other than "developer messed it up", such as "a Python upgrade
messed it up",

If I let configure decide whether to build docs, then "make" will fail
in the same clear way it always fails when the developer messes up
qapi-gen.  But first, it'll disable doc generation.  I'm pretty much
certain to miss that.  Fixing qapi-gen will *not* re-enable doc
generation.  It'll silently reenable itself the next time configure gets
run for some reason.  Until then, the build tree will contain stale
documentation.  I consider this a (relatively minor) trap for
developers.

Unrelated issue: touch any QAPI schema or QAPI generator source file,
rebuild the entire documentation.  This is a real drag.  The generated
code we only recompile when it changes.

I'm switching my primary build tree to --disable-docs now.  Less drag,
one less trap, and I rarely want to look at the formatted documentation
anyway.


