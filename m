Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3646752D04D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 12:20:05 +0200 (CEST)
Received: from localhost ([::1]:43786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrdG5-0005K0-Ou
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 06:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrd8A-00024D-Ez
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:11:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nrd88-0005Oq-1h
 for qemu-devel@nongnu.org; Thu, 19 May 2022 06:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652955098;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=e/VHm3vjW0lmF0We/baCDBOBTdZHQzYtQnQBGb9NMNU=;
 b=Qplx2WDC0tE+AwzCzWYPQb1emdqRLIIC87zUIwIYq3LnaPiftvfmRS+WJ9e7ZKRHZzem27
 VnM0noNznN340fnMJUZZoD4d9cEZx6l1OTB8l6uvsd60y14ErilgLOTgBPpM2u3I0oBjRQ
 ZFMvZI5C/YOMRHxJ5BIj9NH4Drtn/z4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-keQPWbQnNUqJLms-NnVRgw-1; Thu, 19 May 2022 06:11:37 -0400
X-MC-Unique: keQPWbQnNUqJLms-NnVRgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F7353C19031;
 Thu, 19 May 2022 10:11:37 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.44])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 699ED1410DD5;
 Thu, 19 May 2022 10:11:36 +0000 (UTC)
Date: Thu, 19 May 2022 11:11:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v6 11/13] tests: Add postcopy tls migration test
Message-ID: <YoYX1rydzZcZekL3@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
 <20220517195730.32312-12-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220517195730.32312-12-peterx@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 17, 2022 at 03:57:28PM -0400, Peter Xu wrote:
> We just added TLS tests for precopy but not postcopy.  Add the
> corresponding test for vanilla postcopy.
> 
> Rename the vanilla postcopy to "postcopy/plain" because all postcopy tests
> will only use unix sockets as channel.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  tests/qtest/migration-test.c | 50 +++++++++++++++++++++++++++++++-----
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d33e8060f9..e8304aa454 100644
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

Rather than adding these fields, I think it would be preferrable to
pass the hooks in the same way I did for the precopy tests.

>      const char *opts_source;
>      const char *opts_target;
>  } MigrateStart;
> @@ -980,6 +984,10 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
>          return -1;

Add 'TestMigrateStartHook start_hook' to this method

>      }
>  
> +    if (args->postcopy_tls) {
> +        args->postcopy_tls_data = test_migrate_tls_psk_start_match(from, to);
> +    }

call the 'start_hook'

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

Here pass in the TestMigrateFinishHook , and the void* data
from the migrate_postcoy_prepare method.

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

Use 'MigrateCommon' here, which embeds a copy of 'MigrateStart',
while also having fields to the TestMigrateStartHook and
TestMigrateFinishHook.

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

eg this would become

    void *hook_data;

    if (migrate_postcopy_prepare(&from, &to, args.start_hook, &hook_data)) {
        return;
    }
    migrate_postcopy_start(from, to);
    migrate_postcopy_complete(from, to, args.finish_hook, hook_data);
   

> +}
> +
> +static void test_postcopy(void)
> +{
> +    MigrateStart args = { };

MigrateCommon args = {}


> +
> +    test_postcopy_common(&args);
> +}
> +
> +static void test_postcopy_tls_psk(void)
> +{
> +    MigrateStart args = { .postcopy_tls = true };

MigrateCommon args = {
   .start_hook = test_migrate_tls_psk_start_match,
   .finish_hook = test_migrate_tls_psk_finish,
}

> +
> +    test_postcopy_common(&args);
>  }
>  
>  static void test_postcopy_recovery(void)

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


