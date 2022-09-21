Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7E95C053E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 19:27:08 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob3V5-0005qM-2I
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 13:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ob3Rq-0003ry-2j
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:23:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ob3Rl-0004mo-Ow
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 13:23:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663781019;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3QEQTMUtqmGk7QLhmGkh41QoCIBv9hujmigcJXw558g=;
 b=SQlKvbY+5m0/lnB0t1gpFbGtlKOnee8qsFOTBHwhPdSNqTPK7d6C0TkqZ+Aj0LRUuahr9j
 rni/oYlwAUkbF3zwUF9NJHmArm5l/AJ+SxCiSc3otAiwTn4UM82brAnz43uTN57HdTjQCC
 Cb4iOPcTH5APtzH96gWbvPSte5daWdY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-vu_EbZoEOwGA83YGPBpOQA-1; Wed, 21 Sep 2022 13:23:35 -0400
X-MC-Unique: vu_EbZoEOwGA83YGPBpOQA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60E9B86C142;
 Wed, 21 Sep 2022 17:23:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5462349BB60;
 Wed, 21 Sep 2022 17:23:33 +0000 (UTC)
Date: Wed, 21 Sep 2022 18:23:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 35/39] tests/qtest: migration-test: Skip running some
 TLS cases for win32
Message-ID: <YytIkiMEC/KHL/9p@redhat.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
 <20220920103159.1865256-36-bmeng.cn@gmail.com>
 <YytBFdDoLVgkgqIX@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YytBFdDoLVgkgqIX@work-vm>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 21, 2022 at 05:51:33PM +0100, Dr. David Alan Gilbert wrote:
> * Bin Meng (bmeng.cn@gmail.com) wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> > 
> > Some migration test cases use TLS to communicate, but they fail on
> > Windows with the following error messages:
> > 
> >   qemu-system-x86_64: TLS handshake failed: Insufficient credentials for that request.
> >   qemu-system-x86_64: TLS handshake failed: Error in the pull function.
> >   query-migrate shows failed migration: TLS handshake failed: Error in the pull function.
> > 
> > Disable them temporarily.
> > 
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> > I am not familar with the gnutls and simply enabling the gnutls debug
> > output does not give me an immedidate hint on why it's failing on
> > Windows. Disable these cases for now until someone or maintainers
> > who may want to test this on Windows.
> 
> Copying in Dan Berrange, he's our expert on weird TLS failures.

Seems to match this:

   https://gnutls.org/faq.html#key-usage-violation2

which suggests we have a configuration mis-match.

I'm surprised to see you are only needing to disable the TLS PSK tests,
not the TLS x509 tests.

I'd like to know if tests/unit/test-crypto-tlssession passes.

If so, it might suggest we are missing 'priority: NORMAL' property
when configuring TLS creds for the migration test.

> > (no changes since v1)
> > 
> >  tests/qtest/migration-test.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index aedd9ddb72..dbee9b528a 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -1403,6 +1403,7 @@ static void test_precopy_unix_dirty_ring(void)
> >  }
> >  
> >  #ifdef CONFIG_GNUTLS
> > +#ifndef _WIN32
> >  static void test_precopy_unix_tls_psk(void)
> >  {
> >      g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
> > @@ -1415,6 +1416,7 @@ static void test_precopy_unix_tls_psk(void)
> >  
> >      test_precopy_common(&args);
> >  }
> > +#endif /* _WIN32 */
> >  
> >  #ifdef CONFIG_TASN1
> >  static void test_precopy_unix_tls_x509_default_host(void)
> > @@ -1523,6 +1525,7 @@ static void test_precopy_tcp_plain(void)
> >  }
> >  
> >  #ifdef CONFIG_GNUTLS
> > +#ifndef _WIN32
> >  static void test_precopy_tcp_tls_psk_match(void)
> >  {
> >      MigrateCommon args = {
> > @@ -1533,6 +1536,7 @@ static void test_precopy_tcp_tls_psk_match(void)
> >  
> >      test_precopy_common(&args);
> >  }
> > +#endif /* _WIN32 */
> >  
> >  static void test_precopy_tcp_tls_psk_mismatch(void)
> >  {
> > @@ -1930,6 +1934,7 @@ static void test_multifd_tcp_zstd(void)
> >  #endif
> >  
> >  #ifdef CONFIG_GNUTLS
> > +#ifndef _WIN32
> >  static void *
> >  test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
> >                                               QTestState *to)
> > @@ -1937,6 +1942,7 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
> >      test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
> >      return test_migrate_tls_psk_start_match(from, to);
> >  }
> > +#endif /* _WIN32 */
> >  
> >  static void *
> >  test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
> > @@ -1988,6 +1994,7 @@ test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
> >  }
> >  #endif /* CONFIG_TASN1 */
> >  
> > +#ifndef _WIN32
> >  static void test_multifd_tcp_tls_psk_match(void)
> >  {
> >      MigrateCommon args = {
> > @@ -1997,6 +2004,7 @@ static void test_multifd_tcp_tls_psk_match(void)
> >      };
> >      test_precopy_common(&args);
> >  }
> > +#endif /* _WIN32 */
> >  
> >  static void test_multifd_tcp_tls_psk_mismatch(void)
> >  {
> > @@ -2497,8 +2505,10 @@ int main(int argc, char **argv)
> >      qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
> >      qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
> >  #ifdef CONFIG_GNUTLS
> > +#ifndef _WIN32
> >      qtest_add_func("/migration/precopy/unix/tls/psk",
> >                     test_precopy_unix_tls_psk);
> > +#endif
> >  
> >      if (has_uffd) {
> >          /*
> > @@ -2524,8 +2534,10 @@ int main(int argc, char **argv)
> >  
> >      qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
> >  #ifdef CONFIG_GNUTLS
> > +#ifndef _WIN32
> >      qtest_add_func("/migration/precopy/tcp/tls/psk/match",
> >                     test_precopy_tcp_tls_psk_match);
> > +#endif
> >      qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
> >                     test_precopy_tcp_tls_psk_mismatch);
> >  #ifdef CONFIG_TASN1
> > @@ -2569,8 +2581,10 @@ int main(int argc, char **argv)
> >                     test_multifd_tcp_zstd);
> >  #endif
> >  #ifdef CONFIG_GNUTLS
> > +#ifndef _WIN32
> >      qtest_add_func("/migration/multifd/tcp/tls/psk/match",
> >                     test_multifd_tcp_tls_psk_match);
> > +#endif
> >      qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
> >                     test_multifd_tcp_tls_psk_mismatch);
> >  #ifdef CONFIG_TASN1
> > -- 
> > 2.34.1
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


