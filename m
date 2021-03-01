Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35500328B2E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:30:54 +0100 (CET)
Received: from localhost ([::1]:60600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGnJl-0005ox-6P
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGnHG-0004vt-RA
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:28:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGnHF-0006yV-5k
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614623294;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RTT4UrtywkbA5R59r8/1UTDbqyrrVXSSwd1dC58J2/A=;
 b=N3IZ7W8dOLnwR7o2KxhpZXOseM4s5ynpZwqweLooYweq1cayLnZIKhsFWC0FP4WLHj6giy
 YBE6VVG99jOdHF59W+W2yPjtmBQWjvXJ8C7HimHGIp8082aX1WAi9ES2HloE9EdXObUj8I
 g3upbAe9GLMUG7ipiS25d53o+LjfPLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-awYKRL0SMlyuJZxqboTIRA-1; Mon, 01 Mar 2021 13:28:01 -0500
X-MC-Unique: awYKRL0SMlyuJZxqboTIRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4714801965;
 Mon,  1 Mar 2021 18:28:00 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A862E5C3E4;
 Mon,  1 Mar 2021 18:27:56 +0000 (UTC)
Date: Mon, 1 Mar 2021 18:27:53 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 1/2] docs: show how to spawn qemu-storage-daemon with
 fd passing
Message-ID: <YD0yKX1Yaxv7w80N@redhat.com>
References: <20210301172728.135331-1-stefanha@redhat.com>
 <20210301172728.135331-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301172728.135331-2-stefanha@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 05:27:27PM +0000, Stefan Hajnoczi wrote:
> The QMP monitor, NBD server, and vhost-user-blk export all support file
> descriptor passing. This is a useful technique because it allows the
> parent process to spawn and wait for qemu-storage-daemon without busy
> waiting, which may delay startup due to arbitrary sleep() calls.
> 
> This Python example is inspired by the test case written for libnbd by
> Richard W.M. Jones <rjones@redhat.com>:
> https://gitlab.com/nbdkit/libnbd/-/commit/89113f484effb0e6c322314ba75c1cbe07a04543
> 
> Thanks to Daniel P. Berrangé <berrange@redhat.com> for suggestions on
> how to get this working. Now let's document it!
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> v2:
>  * Use /var/run/qmp.sock instead of /tmp/qmp-$PID.sock to prevent
>    security issues with world-writeable directories [Rich, Daniel]
> ---
>  docs/tools/qemu-storage-daemon.rst | 42 ++++++++++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


