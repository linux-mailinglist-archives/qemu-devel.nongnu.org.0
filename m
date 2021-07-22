Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4AC3D249E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 15:29:42 +0200 (CEST)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Ylg-0006Zm-OG
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 09:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6Yje-0004cO-Gn
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:27:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6YiC-0003BR-VO
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 09:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626960360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6vk19b3BLxPENYeUTwkh0p3JV8mnlMSGsgTM/tOm+EU=;
 b=ZDLVnZ+1aTCqIKDq2iR3wwwQ1uzKKOkQNN9v7ZufyevAeV+nv975KndTZtnUd7rZwLQoL0
 joY8IPWLVtK8TV0xme1h65Zy6jsdUBX+S4qL7dTto0VZjAu52s2sOvO+14i9Mjr3l1lYzS
 GeGzwBn6jT4Rg5m7xMX30LeIHsrJlmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-ZGWRE_xBOWC44Olf25jSoQ-1; Thu, 22 Jul 2021 09:25:59 -0400
X-MC-Unique: ZGWRE_xBOWC44Olf25jSoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FA9D1005D54
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 13:25:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0BD410016DB;
 Thu, 22 Jul 2021 13:25:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0849611326B9; Thu, 22 Jul 2021 15:25:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] qapi/qom: use correct field name when
 getting/setting alias properties
References: <20210719104033.185109-1-pbonzini@redhat.com>
Date: Thu, 22 Jul 2021 15:25:53 +0200
In-Reply-To: <20210719104033.185109-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Mon, 19 Jul 2021 12:40:31 +0200")
Message-ID: <87o8auh44e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since patch submitters tend to submit code that works for the success
case, I like to test a few failure cases before anything else.  Gotcha:

    $ qemu-system-x86_64 -machine pc,pflash0=xxx qemu-system-x86_64:
    Property 'cfi.pflash01.drive' can't find value 'xxx'

The error message is misleading.

This is not a "must not commit" issue.  Fixing a regression in time for
the release at the price of a bad error message is still a win.  The bad
error message needs fixing all the same, just not necessarily before the
release.

Since mere thinking doesn't rock the release boat: any ideas on how this
could be fixed?


