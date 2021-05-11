Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4F437AD23
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:34:07 +0200 (CEST)
Received: from localhost ([::1]:50838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgWGf-00023Z-Mg
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgWF0-0001NQ-CO
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgWEx-0007dv-1U
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620754333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Gozrm5JwyiLN0Oyp24by80wQ7Ivp57dGGsmm6lpqwhk=;
 b=Fb6V+sWKkBueliOWkJwzwP2bCHrFyWw7IoNIf0tHn7zpcvdOax4n4/9XuWdTumBqzvq7w2
 znJJVqh0kpeRN+tTmaFbDXJM5RtbwR+kZY8gPhiDf1nzd5DqibO+Wl9hZbDmBNXID4YW8V
 SvXz4wui+rkIG4hQ/sOusOUIA8+4bnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-5AJoSdF1NKyL3mQsNeyMzw-1; Tue, 11 May 2021 13:32:01 -0400
X-MC-Unique: 5AJoSdF1NKyL3mQsNeyMzw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CC081823E27;
 Tue, 11 May 2021 17:32:00 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD0FC5D6A8;
 Tue, 11 May 2021 17:31:59 +0000 (UTC)
To: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
From: John Snow <jsnow@redhat.com>
Subject: Sphinx and the :any: role
Message-ID: <9fe98807-7d68-2c86-163a-af374c789401@redhat.com>
Date: Tue, 11 May 2021 13:31:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the purposes of my QAPI generator cleanup (adding docstrings and 
mypy static types to ./scripts/qapi), I have a series of patches I've 
been carrying off-list that changes the behavior of how Sphinx 
cross-references work.

Presently, `foo` in our Sphinx docs is interpreted as the "content" 
role, and has "no special meaning".

I experimented with what would happen if we change this to the "any" 
role, which interprets `foo` as a cross-reference to *something* named 
"foo". If no reference is found, it emits a build error.

(Many existing usages of `foo` must be changed to ``foo`` to enable this 
to work.)

I found this useful for testing and writing Python docstrings, because 
it keeps the syntax cleaner than having to write :py:func:`foo` or 
:py:meth:`foo` and so on. It keeps the docstrings less syntax-heavy when 
reading them outside of the Sphinx rendered output.

I would have liked to propose we actually adopt this change, however 
I've noticed a problem with this in our CI builds.

Sphinx 3.2.1 (The current version we seem to test against in our Fedora 
container) has a race condition (?) where occasionally kernel-doc will 
crash outright:

Exception occurred:
   File "/usr/lib/python3.9/site-packages/sphinx/domains/c.py", line 
3751, in resolve_any_xref
     return [('c:' + self.role_for_objtype(objtype), retnode)]
TypeError: can only concatenate str (not "NoneType") to str

The full traceback has been saved in /tmp/sphinx-err-v6iqwtf9.log, if 
you want to report the issue to the developers.
Please also report this if it was a user error, so that a better error 
message can be provided next time.
A bug report can be filed in the tracker at 
<https://github.com/sphinx-doc/sphinx/issues>. Thanks!


It's not actually clear WHICH thing Sphinx is choking on here, exactly 
-- it's just some bug in Sphinx's C domain handling of resolving 
cross-references.

This is fixed in 3.3.1, I believe closed with one of these issues:

https://github.com/sphinx-doc/sphinx/issues/8364
https://github.com/sphinx-doc/sphinx/issues/8388


I'm not sure if there's anything I can do here -- we probably can't 
require such a modern version of Sphinx just yet, I haven't done the 
legwork to check. I also haven't been able to diagnose the exact 
invocation that seems to trigger these failures, so it's not clear if 
there's a workaround just yet.

I'm still interested in making our cross-referencing a bit more robust, 
but maybe my hands are tied on that front for now.

--js


