Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDF4346684
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:38:02 +0100 (CET)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkyf-0002zQ-1f
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOk0X-0006rb-FE
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOk0P-0001yf-2Q
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616517344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8ZzgcBIDvA8nFPW1oj4TnVwkGAbdvgIlha6CMX8Mf0=;
 b=RIRzH9D8qb8GzWxCzlYIyYNZUP4VsJ7AnQ6k3T69+BgZu6n/G+Ci7agku81WtE8rkjlebG
 Tz7NGjKPE9UFEyGm/npxQm9ZXCSqzgKqBnw94PiC2T5E9xKgk01qvyRpdfZ0BUQ05vRkry
 TlgrmyUN9GVckrUNdRbcP2KbC+edmVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-Y6KcmnXKNcKlDb18uust5g-1; Tue, 23 Mar 2021 12:35:41 -0400
X-MC-Unique: Y6KcmnXKNcKlDb18uust5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42D98107ACCA;
 Tue, 23 Mar 2021 16:35:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6829B10023B5;
 Tue, 23 Mar 2021 16:35:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EFD2211327E1; Tue, 23 Mar 2021 17:35:34 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 19/28] qapi: Rename pragma *-whitelist to *-exceptions
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-20-armbru@redhat.com>
 <1fc0b9e1-94c2-b349-4429-3c63fd6628ad@redhat.com>
Date: Tue, 23 Mar 2021 17:35:34 +0100
In-Reply-To: <1fc0b9e1-94c2-b349-4429-3c63fd6628ad@redhat.com> (Eric Blake's
 message of "Tue, 23 Mar 2021 10:09:15 -0500")
Message-ID: <87lfadomjt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: michael.roth@amd.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 3/23/21 4:40 AM, Markus Armbruster wrote:
>> Rename pragma returns-whitelist to command-returns-exceptions, and
>> name-case-whitelist to member-name-case-exceptions.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
> Doesn't mention anything about the motivation for this including the
> desire to move away from the term "whitelist".  But the change is good
> regardless of motive.

I'd prefer not to argue for or against words that may or may not have
unwanted connotations.  In this particular case, however, I think
"exceptions" is actually clearer than "whitelist".  Naming is hard.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


