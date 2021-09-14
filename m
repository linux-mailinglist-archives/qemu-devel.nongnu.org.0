Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A687540A657
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 07:56:50 +0200 (CEST)
Received: from localhost ([::1]:48560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ1R3-00068D-OF
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 01:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ1Q1-0005RH-91
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQ1Pz-0007no-Qh
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 01:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631598942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1TlkaqWk8QCrgrRZX6GImm/WZwhhL5Wcqyj2ECIglOE=;
 b=f64gCAl117B3UJeQCKNTk8gxCrWxAQ1U2SQncwXUm3qsNKdJwkHPtlofEqGKbBjVfGgOXb
 dDdl2pW9I6osMAW4oFUA2aXOlkuTtIY9WBdeixtbbIfjWbE+W7YI9Uo15T+Kj7LGcl8h3X
 LuTK/YQcinUrUKY//DC+d3M9Z0R8FZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-7KffY4g2McCRK8adM9r0Kw-1; Tue, 14 Sep 2021 01:55:41 -0400
X-MC-Unique: 7KffY4g2McCRK8adM9r0Kw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9949E1006AA0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 05:55:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA82210027C4;
 Tue, 14 Sep 2021 05:55:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4FAE6113865F; Tue, 14 Sep 2021 07:55:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 19/22] tests/qapi-schema: Drop simple union
 __org.qemu_x-Union1
References: <20210913123932.3306639-1-armbru@redhat.com>
 <20210913123932.3306639-20-armbru@redhat.com>
 <20210913153527.dy5kdr7uot7ciww4@redhat.com>
Date: Tue, 14 Sep 2021 07:55:35 +0200
In-Reply-To: <20210913153527.dy5kdr7uot7ciww4@redhat.com> (Eric Blake's
 message of "Mon, 13 Sep 2021 10:35:27 -0500")
Message-ID: <87lf3zg0q0.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Mon, Sep 13, 2021 at 02:39:29PM +0200, Markus Armbruster wrote:
>> Replace simple union __org.qemu_x-Union1 flat union
>
> missing 'with'

Will fix.

>> __org.qemu_x-Union2, except drop it from __org.qemu_x-command, because
>> there it's only used to pull it into QMP.  Now drop the unused simple
>> union.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  tests/unit/test-qmp-cmds.c              | 16 +++++-----------
>>  tests/qapi-schema/qapi-schema-test.json |  6 ++----
>>  tests/qapi-schema/qapi-schema-test.out  | 14 +++-----------
>>  3 files changed, 10 insertions(+), 26 deletions(-)
>>
>
> Looks a bit odd to leave things with Union2 but not Union1; up to you
> if it is worth a further cleanup to rename what remains to get rid of
> the odd gap.  I don't think it's a show-stopper for your series to
> keep the naming as-is, though.

Can do.

Another cleanup I forgot: rename tests/qapi-schema/flat-union* after
PATCH 21.

> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


