Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86906A87F5
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 18:35:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmpM-0008QF-Sr; Thu, 02 Mar 2023 12:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXmpK-0008Pp-Nr
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXmpI-00074j-Lf
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 12:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677778483;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDTss3ss1Cb1wJ6dzUagsqkNpnG42JvEwCjFhH9myQA=;
 b=M5nD3ORRu3ic7+vee2Dn12U36C2gIgBTH/w0Ra2IW/JJnAIowF+lwXDGbykD1pz6AwyIal
 /PsvYDncKu7ty93drLNw40m156oGN9Mif3E65s411heSUy79uYrahoKi+nOEK1wOnkzJsE
 atUYlpwT8hVTViNrGQI9ZyvzpVfP4kI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-M_EnBjdTOdKw1jjbwEuy2Q-1; Thu, 02 Mar 2023 12:34:40 -0500
X-MC-Unique: M_EnBjdTOdKw1jjbwEuy2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 286E03C0F1A1;
 Thu,  2 Mar 2023 17:34:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EC9F2026D76;
 Thu,  2 Mar 2023 17:34:38 +0000 (UTC)
Date: Thu, 2 Mar 2023 17:34:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Message-ID: <ZADeLNaltLAZ9BU8@redhat.com>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302172211.4146376-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Thu, Mar 02, 2023 at 05:22:11PM +0000, Peter Maydell wrote:
> migration-test has been flaky for a long time, both in CI and
> otherwise:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> (a FreeBSD job)
>   32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> 
> on a local macos x86 box:
> ▶  34/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
>  34/621 qemu:qtest+qtest-i386 / qtest-i386/migration-test                         ERROR          168.12s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-i386: Failed to peek at channel
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
> 
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> ▶  37/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
>  37/621 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test                     ERROR          174.37s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
> 
> (test program exited with status code -6)
> 
> In the cases where I've looked at the underlying log, this seems to
> be in the migration/multifd/tcp/plain/cancel subtest.  Disable that
> specific subtest by default until somebody can track down the
> underlying cause. Enthusiasts can opt back in by setting
> QEMU_TEST_FLAKY_TESTS=1 in their environment.

No objection to disabling the test. Given the many multifd fixes we
have seen, I fear that unlikely many of the flakey tests, this is
not merely a test problem, but rather has a decent chance of being
a real bug in migration code.

> 
> We might need to disable more parts of this test if this isn't
> sufficient to fix the flakiness.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a slightly more targeted variation on my original
> modest proposal.
> ---
>  tests/qtest/migration-test.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 109bc8e7b13..d4ab3934ed2 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2572,8 +2572,14 @@ int main(int argc, char **argv)
>      qtest_add_func("/migration/auto_converge", test_migrate_auto_converge);
>      qtest_add_func("/migration/multifd/tcp/plain/none",
>                     test_multifd_tcp_none);
> -    qtest_add_func("/migration/multifd/tcp/plain/cancel",
> -                   test_multifd_tcp_cancel);
> +    /*
> +     * This test is flaky and sometimes fails in CI and otherwise:
> +     * don't run unless user opts in via environment variable.
> +     */
> +    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
> +        qtest_add_func("/migration/multifd/tcp/plain/cancel",
> +                       test_multifd_tcp_cancel);
> +    }
>      qtest_add_func("/migration/multifd/tcp/plain/zlib",
>                     test_multifd_tcp_zlib);
>  #ifdef CONFIG_ZSTD
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


