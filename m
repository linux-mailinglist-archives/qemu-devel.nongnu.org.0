Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66616508738
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:42:32 +0200 (CEST)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8j9-00083w-F6
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8gC-0007Es-Ju
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:39:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8g9-00017s-DW
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650454764;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=R77YHZn4DcIPJimjPUSNMdWxCpKmLhKeClHCWvPHeG8=;
 b=KRJKGl3SfmZmzQyZRpLVgDCWvmQtD3ptz14C08BLYLQGK3+BvkkyzXPB+9ud/5jKQNLEbk
 RmTuDL2egHSYScdEY7AeFwXhn4+e5jldDhMk/9jJpRwcrwEReNSVp1VJ9RtIRcWZmnkrt6
 sXqOpHZN7Oec7l1PVCbKyjy8uyNf/JU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-oX5wALfmMJKji1du0rYKuw-1; Wed, 20 Apr 2022 07:39:23 -0400
X-MC-Unique: oX5wALfmMJKji1du0rYKuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AA021815CFA
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:39:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6D479D42;
 Wed, 20 Apr 2022 11:39:10 +0000 (UTC)
Date: Wed, 20 Apr 2022 12:39:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 17/19] tests: Add postcopy tls migration test
Message-ID: <Yl/w2wRDIm5frmaU@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-18-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331150857.74406-18-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:55AM -0400, Peter Xu wrote:
> We just added TLS tests for precopy but not postcopy.  Add the
> corresponding test for vanilla postcopy.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 43 +++++++++++++++++++++++++++++++-----
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d9f444ea14..80c4244871 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -481,6 +481,10 @@ typedef struct {
>      bool only_target;
>      /* Use dirty ring if true; dirty logging otherwise */
>      bool use_dirty_ring;
> +    /* Whether use TLS channels for postcopy test? */
> +    bool postcopy_tls;
> +    /* Used only if postcopy_tls==true, to cache the data object */
> +    void *postcopy_tls_data;
>      const char *opts_source;
>      const char *opts_target;
>  } MigrateStart;
> @@ -980,6 +984,10 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>          return -1;
>      }
>  
> +    if (args->postcopy_tls) {
> +        args->postcopy_tls_data = test_migrate_tls_psk_start_match(from, to);
> +    }
> +
>      migrate_set_capability(from, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-ram", true);
>      migrate_set_capability(to, "postcopy-blocktime", true);
> @@ -1004,7 +1012,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>      return 0;
>  }
>  
> -static void migrate_postcopy_complete(QTestState *from, QTestState *to)
> +static void migrate_postcopy_complete(QTestState *from, QTestState *to,
> +                                      MigrateStart *args)
>  {
>      wait_for_migration_complete(from);
>  
> @@ -1015,19 +1024,38 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
>          read_blocktime(to);
>      }
>  
> +    if (args->postcopy_tls) {
> +        assert(args->postcopy_tls_data);
> +        test_migrate_tls_psk_finish(from, to, args->postcopy_tls_data);
> +        args->postcopy_tls_data = NULL;
> +    }
> +
>      test_migrate_end(from, to, true);
>  }
>  
> -static void test_postcopy(void)
> +static void test_postcopy_common(MigrateStart *args)
>  {
> -    MigrateStart args = {};
>      QTestState *from, *to;
>  
> -    if (migrate_postcopy_prepare(&from, &to, &args)) {
> +    if (migrate_postcopy_prepare(&from, &to, args)) {
>          return;
>      }
>      migrate_postcopy_start(from, to);
> -    migrate_postcopy_complete(from, to);
> +    migrate_postcopy_complete(from, to, args);
> +}
> +
> +static void test_postcopy(void)
> +{
> +    MigrateStart args = { };
> +
> +    test_postcopy_common(&args);
> +}
> +
> +static void test_postcopy_tls(void)

test_postcopy_tls_psk() 

> +{
> +    MigrateStart args = { .postcopy_tls = true };
> +
> +    test_postcopy_common(&args);
>  }
>  
>  static void test_postcopy_recovery(void)
> @@ -1089,7 +1117,7 @@ static void test_postcopy_recovery(void)
>      /* Restore the postcopy bandwidth to unlimited */
>      migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
>  
> -    migrate_postcopy_complete(from, to);
> +    migrate_postcopy_complete(from, to, &args);
>  }
>  
>  static void test_baddest(void)
> @@ -2134,6 +2162,9 @@ int main(int argc, char **argv)
>  
>      qtest_add_func("/migration/postcopy/unix", test_postcopy);

Rename this to /migration/postcopy/unix/plain

>      qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> +#ifdef CONFIG_GNUTLS
> +    qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);

And this to /migration/postcopy/unix/tls/psk  so we match the precopy test
naming convention I started

> +#endif /* CONFIG_GNUTLS */
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
>      qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
> -- 
> 2.32.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


