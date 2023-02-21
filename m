Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B544E69E400
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:54:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUva-0001zr-Sh; Tue, 21 Feb 2023 10:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUUun-0001Ct-DD
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:50:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pUUul-0004SC-GK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676994645;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3n4VwYJtoN0KZ+XkAYxSqy38KexzOMn4vObWZ3M7BM0=;
 b=GgYoFoYtcZiXRBSu/M393sxmq100Ydto7uFVlOxKN1eE737BxuxJra7G2GDJ4rXx5kpk22
 P9caAGC9F9l7w74OZb+ZfEFCARz2UwpApg0umYDa4Vv33FidXAeYcdcUx8soLDqwGC1yd5
 8HNVI6u0MNGvBJqlatWGCqbji5advU8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-8Im9tapxNwGbRi1ygQScQg-1; Tue, 21 Feb 2023 10:50:42 -0500
X-MC-Unique: 8Im9tapxNwGbRi1ygQScQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCDE7802D38;
 Tue, 21 Feb 2023 15:50:41 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B146F4015319;
 Tue, 21 Feb 2023 15:50:40 +0000 (UTC)
Date: Tue, 21 Feb 2023 15:50:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] tests: Disable migration-test
Message-ID: <Y/ToTo/3/6Oft11S@redhat.com>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230221132726.2892383-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 21, 2023 at 01:27:26PM +0000, Peter Maydell wrote:
> The migration-test is annoyingly flaky. Examples:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> (a FreeBSD job)
>   32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> 
> on a local macos x86 box:
> ▶  34/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_
> str_equal(status, "failed")) ERROR
>  34/621 qemu:qtest+qtest-i386 / qtest-i386/migration-test                         ERROR          168.12s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-i386: Failed to peek at channel
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
> 
> (test program exited with status code -6)

THis particular one looks like a recent regresssion. The 'Failed to peek at'
message refers to a patch series that merged last week I believe.

Probably not the fault of that series. Rather the test is now
exposed to yet another failure scenario. It probably would have
failed with a different message before this.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


