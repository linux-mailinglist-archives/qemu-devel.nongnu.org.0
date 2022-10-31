Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E061338C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:26:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opRy6-0001vN-Nz; Mon, 31 Oct 2022 06:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opRy4-0001v7-J1
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opRy2-0007bV-MD
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667211869;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yxiM5EmHPukizoZHhRVMntA6b3KB4RATgkc7z/HUtx0=;
 b=QUdZiaZiOt28sjsJUauLQ+01K8R/1EitbD/najANCy6PdRI2VZy/t0tA+EzQ33nZhJ+6Jm
 XgUhjw/hrG+2dM02k9eisDhUecIZEhaYCfvvuslHblxQcYB7595qS03h9tNZDCh8+4KaTr
 ZqAkEzDU7NlDrvO5OFlNIu6ZbboZRxk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-nHU5dkSKPFiGU8fsbyn1zQ-1; Mon, 31 Oct 2022 06:24:25 -0400
X-MC-Unique: nHU5dkSKPFiGU8fsbyn1zQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9168D185A792;
 Mon, 31 Oct 2022 10:24:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D75A492B04;
 Mon, 31 Oct 2022 10:24:22 +0000 (UTC)
Date: Mon, 31 Oct 2022 10:24:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH  v4 29/30] tests/unit: cleanups for test-io-channel-command
Message-ID: <Y1+iU/1pwd17zNDM@redhat.com>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
 <20221027183637.2772968-30-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221027183637.2772968-30-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 07:36:35PM +0100, Alex Bennée wrote:
> This test is hanging under heavy load when the two socats race while
> trying to create the socket. I've tried various approaches to avoid
> the race but it seems "creat=0" won't stop socat trying to create a
> pipe if it executes first. In the end I just use a small sleep which
> seems to be reliable enough on the load situations I've tried.
> 
> While I was there I also properly created a tmpdir for the socket to
> live in which is cleaned up at the end of the test.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> ---
>  tests/unit/test-io-channel-command.c | 45 +++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 17 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


We should figure out a better fix eventually, but this hack at least
ought to avoid the issue for most cases, so worth it as a temp fix.

If I'm nitpicking, I would have preferred the refactoring to be
done separately from the addition of tmpdir, and especially separately
from the sleep, so we can just revert the sleep patch later.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


