Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0466B59BDFB
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 12:58:30 +0200 (CEST)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ58W-0001uF-Uz
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 06:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ576-00005b-Aw
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oQ572-0000TR-Oi
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 06:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661165816;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Sf/UC50Dgi0JUxxaAFLI4+Qf396RkDWaGHfcimoPpTs=;
 b=FKnd+DxHloBdsIPonP3KuqLCRklBuFgtl7UNDvKH9SZ+yTFjX+00STyekyHRJAPRBVpoE3
 7XiMdl8mJkIJj7MNcRGQv1QZMe24BwlWXLrqeE7QWz3uH+l+2q3iG2ItO5fEgJYmHch4jb
 aQqOjLWjYiGh/4z2FtIxyI0+GpESf2U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-PblIjoooN7uSiqftRZtCpQ-1; Mon, 22 Aug 2022 06:56:55 -0400
X-MC-Unique: PblIjoooN7uSiqftRZtCpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A75023C0D843
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 10:56:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBABC906B9;
 Mon, 22 Aug 2022 10:56:53 +0000 (UTC)
Date: Mon, 22 Aug 2022 11:56:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test: Only wait for serial output
 where migration succeeds
Message-ID: <YwNg85tWs7/PA2h2@redhat.com>
References: <20220818162144.227542-1-thuth@redhat.com>
 <Yv5xxvrpbd0tXUCi@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yv5xxvrpbd0tXUCi@work-vm>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 18, 2022 at 06:07:18PM +0100, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
> > Waiting for the serial output can take a couple of seconds - and since
> > we're doing a lot of migration tests, this time easily sums up to
> > multiple minutes. But if a test is supposed to fail, it does not make
> > much sense to wait for the source to be in the right state first, so
> > we can skip the waiting here. This way we can speed up all tests where
> > the migration is supposed to fail. In the gitlab-CI gprov-gcov test,
> > each of the migration-tests now run two minutes faster!
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  tests/qtest/migration-test.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index 520a5f917c..7be321b62d 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -1307,7 +1307,9 @@ static void test_precopy_common(MigrateCommon *args)
> >      }
> >  
> >      /* Wait for the first serial output from the source */
> > -    wait_for_serial("src_serial");
> > +    if (args->result == MIG_TEST_SUCCEED) {
> > +        wait_for_serial("src_serial");
> > +    }
> 
> I think this is OK, albeit only because all of the current fail-tests
> are ones where the connection fails; we're not relying on the behaviour
> of the emulator at all.  I wonder if it's worth going further and
> running the source qemu's with -S (which may or not fail in other ways).

Yeah, if we need to cope with yet another failure scenario later
we can add more to the MIG_TEST enum. For now, also adding -S seems
like a reasonable idea to me.

> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> >  
> >      if (!args->connect_uri) {
> >          g_autofree char *local_connect_uri =
> > -- 
> > 2.31.1
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


