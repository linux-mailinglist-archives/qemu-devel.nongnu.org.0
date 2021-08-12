Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74113EA324
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:54:37 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE8M8-0004d4-J4
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mE8LN-0003rM-V6
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:53:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mE8LL-0000Lv-1H
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628765625;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ki597Iqskp9NFyagTYXr8ST8w+Zg+/gLywTIb7Iczkc=;
 b=dcRhvPYN1YVudd5QaExVPtqTOIheXpzB2T+cskfB8VfK0PX21z0L2Yjj+yr5nJv2GX3tgx
 /h6awg45kqBMItlsKgjl2uPzdjrnKolo7zbs+Dr/cjSkxTPrPAFxUEXIyWZ6QNouHZlbV+
 QWjjFYNd3I+bmW5rJBBh3QhlfM7t740=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-Ye8e9wkmNIyEwOnsQmgE7g-1; Thu, 12 Aug 2021 06:53:43 -0400
X-MC-Unique: Ye8e9wkmNIyEwOnsQmgE7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6C192502;
 Thu, 12 Aug 2021 10:53:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63AB86E0B7;
 Thu, 12 Aug 2021 10:53:35 +0000 (UTC)
Date: Thu, 12 Aug 2021 11:53:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] storage-daemon: Add missing build dependency to the
 vhost-user-blk-test
Message-ID: <YRT9rFAGwuox62mT@redhat.com>
References: <20210811094705.131314-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210811094705.131314-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 qemu-block@nongnu.org, philmd@redhat.com, qemu-devel@nongnu.org,
 Coiby Xu <coiby.xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 alxndr@bu.edu, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 11, 2021 at 11:47:05AM +0200, Thomas Huth wrote:
> vhost-user-blk-test needs the qemu-storage-deamon, otherwise it
> currently hangs. So make sure that we build the daemon before running
> the tests.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  storage-daemon/meson.build | 8 ++++----
>  tests/qtest/meson.build    | 7 +++++--
>  2 files changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


IIUC, this is the fix for the oss-fuzz test that hangs

https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01850.html

can we get this fix into 6.1, so that hopefully now we get
a clean CI pipeline for the release.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


