Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF61337B1A9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:36:01 +0200 (CEST)
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgayu-0002kV-RA
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaxx-0001ya-AO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaxu-0006z9-LS
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620772496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TF+Ar7W9Srunyv0D6DC096V3awZzDO2POpE3L3xURos=;
 b=IyFecTBTd7gQMudczNIiPz7NN87reMVGTo4Ov0lGGk0iGRA2YYVCGJkCm0hR++EVKXR2yV
 qIQg3K+eC337CVGLW8jDV4Mn6NKIYKGSzm4XdfHQTho2V+cePMkVpxrvsTWPpkpyoTQQMV
 tP601g+0yhYnu3h7gzl9WXdr+IjjFQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-hFRCo23WNXe8WFQRcF3V1Q-1; Tue, 11 May 2021 18:34:53 -0400
X-MC-Unique: hFRCo23WNXe8WFQRcF3V1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 143051013720;
 Tue, 11 May 2021 22:34:52 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA7AE1F5;
 Tue, 11 May 2021 22:34:50 +0000 (UTC)
Subject: Re: Sphinx and the :any: role
From: John Snow <jsnow@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <9fe98807-7d68-2c86-163a-af374c789401@redhat.com>
Message-ID: <7fac6d61-f8e8-9364-9e1f-77c177488778@redhat.com>
Date: Tue, 11 May 2021 18:34:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9fe98807-7d68-2c86-163a-af374c789401@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 1:31 PM, John Snow wrote:
> For the purposes of my QAPI generator cleanup (adding docstrings and 
> mypy static types to ./scripts/qapi), I have a series of patches I've 
> been carrying off-list that changes the behavior of how Sphinx 
> cross-references work.
> 
> Presently, `foo` in our Sphinx docs is interpreted as the "content" 
> role, and has "no special meaning".
> 
> I experimented with what would happen if we change this to the "any" 
> role, which interprets `foo` as a cross-reference to *something* named 
> "foo". If no reference is found, it emits a build error.
> 
> (Many existing usages of `foo` must be changed to ``foo`` to enable this 
> to work.)
> 
> I found this useful for testing and writing Python docstrings, because 
> it keeps the syntax cleaner than having to write :py:func:`foo` or 
> :py:meth:`foo` and so on. It keeps the docstrings less syntax-heavy when 
> reading them outside of the Sphinx rendered output.
> 
> I would have liked to propose we actually adopt this change, however 
> I've noticed a problem with this in our CI builds.
> 
> Sphinx 3.2.1 (The current version we seem to test against in our Fedora 
> container) has a race condition (?) where occasionally kernel-doc will 
> crash outright:
> 
> Exception occurred:
>    File "/usr/lib/python3.9/site-packages/sphinx/domains/c.py", line 
> 3751, in resolve_any_xref
>      return [('c:' + self.role_for_objtype(objtype), retnode)]
> TypeError: can only concatenate str (not "NoneType") to str
> 
> The full traceback has been saved in /tmp/sphinx-err-v6iqwtf9.log, if 
> you want to report the issue to the developers.
> Please also report this if it was a user error, so that a better error 
> message can be provided next time.
> A bug report can be filed in the tracker at 
> <https://github.com/sphinx-doc/sphinx/issues>. Thanks!
> 
> 
> It's not actually clear WHICH thing Sphinx is choking on here, exactly 
> -- it's just some bug in Sphinx's C domain handling of resolving 
> cross-references.
> 
> This is fixed in 3.3.1, I believe closed with one of these issues:
> 
> https://github.com/sphinx-doc/sphinx/issues/8364
> https://github.com/sphinx-doc/sphinx/issues/8388
> 
> 
> I'm not sure if there's anything I can do here -- we probably can't 
> require such a modern version of Sphinx just yet, I haven't done the 
> legwork to check. I also haven't been able to diagnose the exact 
> invocation that seems to trigger these failures, so it's not clear if 
> there's a workaround just yet.
> 
> I'm still interested in making our cross-referencing a bit more robust, 
> but maybe my hands are tied on that front for now.
> 
> --js

Update:

This is partly caused by a mere typo in exec/memory.h -- fixed here: 
https://gitlab.com/jsnow/qemu/-/pipelines/301171495

Kerneldoc generates an output that Sphinx *misinterprets* as a 
`cross-reference`. With that fixed, everything seems good for now.

The problem with v3.3.0 exists with or without changing the default 
role, and we will likely find that this version causes terse errors if 
it is used even without any of my changes:

Warning, treated as error:
kernel-doc 'perl /home/jsnow/src/qemu/docs/../scripts/kernel-doc -rst 
-enable-lineno -sphinx-version 3.3.0 
/home/jsnow/src/qemu/docs/../include/qemu/bitops.h' processing failed with:
ninja: build stopped: subcommand failed.
make: *** [Makefile:152: run-ninja] Error 1


We don't need to require >= 3.3.1, but possibly we want to add a check 
in conf.py that specifically disallows 3.3.0 with a friendlier error 
message.

That's all, then!

--js


