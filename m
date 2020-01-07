Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAEA132E04
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 19:10:01 +0100 (CET)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iotIl-0001WU-RD
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 13:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iotHt-0000oM-QO
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 13:09:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iotHr-0003mh-3S
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 13:09:04 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:41649
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iotHq-0003kh-LI
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 13:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578420541;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EavM4Os2T8kUZYY2JMZLlj8evJLxQBOR+QeNrhrFtdg=;
 b=LMKMqHzVrgid77LF5H88w3tol/zSaJdJaasrK86RPFg5nSU7aNCr+hr8ujytP8RQDcjTCW
 Wo62UPhVyQRzUGb9pn0024cAon5nj2hgjV4hQbO8H2XGC7o8NnRME5RDpSUIZxX7eMD3DE
 sFR/Y8zbTMf1uq9AvMC6/+YZ7MUvqT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-cz5fz4fwOQuxjq6XK8p46A-1; Tue, 07 Jan 2020 13:08:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E194100551C;
 Tue,  7 Jan 2020 18:08:45 +0000 (UTC)
Received: from redhat.com (ovpn-116-58.ams2.redhat.com [10.36.116.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 677AA271B4;
 Tue,  7 Jan 2020 18:08:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] migration-test: ppc64: fix FORTH test program
In-Reply-To: <20200107163437.52139-1-lvivier@redhat.com> (Laurent Vivier's
 message of "Tue, 7 Jan 2020 17:34:37 +0100")
References: <20200107163437.52139-1-lvivier@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Tue, 07 Jan 2020 19:08:34 +0100
Message-ID: <877e23jg0t.fsf@trasno.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: cz5fz4fwOQuxjq6XK8p46A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reply-To: quintela@redhat.com
Cc: Wei Huang <wei@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> Commit e51e711b1bef has moved the initialization of start_address and
> end_address after the definition of the command line argument,
> where the nvramrc is initialized, and thus the loop is between 0 and 0
> rather than 1 MiB and 100 MiB.
>
> It doesn't affect the result of the test if all the tests are run in
> sequence because the two first tests don't run the loop, so the
> values are correctly initialized when we actually need them.
>
> But it hangs when we ask to run only one test, for instance:
>
>     QTEST_QEMU_BINARY=3Dppc64-softmmu/qemu-system-ppc64 \
>     tests/migration-test -m=3Dquick -p /ppc64/migration/validate_uuid_err=
or
>
> Fixes: e51e711b1bef ("tests/migration: Add migration-test header file")
> Cc: wei@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


