Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E157F20F696
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 16:01:19 +0200 (CEST)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqGp4-0008LH-RO
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 10:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jqGnS-000759-Gk
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 09:59:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49263
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jqGnN-0001nh-FV
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 09:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593525572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bZwpjbAIXxPrkEsubCEfhdZJfkR0IvPBEK77hq15UpY=;
 b=QyLxcS2aZwIgh33i33I3aSHhQNqQZXMw7O/0usZ26x2ecG+DMLHK2GmFpOI9hn7WI/oFjp
 d6StZSyV3NvV40RuwKqrWhkiBMjS/REXWg0mLHam+jUPc47aFyRts3biCzG5XxPEOKGNa8
 2jZ8guLRFQ0zzHwT+WwaQWez/WA+q84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-kyDzF7K3PiOvE-5n3MotJQ-1; Tue, 30 Jun 2020 09:59:30 -0400
X-MC-Unique: kyDzF7K3PiOvE-5n3MotJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 447D71054FAE
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 13:59:25 +0000 (UTC)
Received: from work-vm (ovpn-113-225.ams2.redhat.com [10.36.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1025B77F60;
 Tue, 30 Jun 2020 13:59:14 +0000 (UTC)
Date: Tue, 30 Jun 2020 14:59:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] Revert "tests/migration: Reduce autoconverge initial
 bandwidth"
Message-ID: <20200630135912.GI2673@work-vm>
References: <20200623145506.439100-1-mst@redhat.com>
 <20200630090717-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200630090717-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.14.3 (2020-06-14)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 00:34:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Tue, Jun 23, 2020 at 10:57:02AM -0400, Michael S. Tsirkin wrote:
> > This reverts commit 6d1da867e65f ("tests/migration: Reduce autoconverge initial bandwidth")
> > since that change makes unit tests much slower for all developers, while it's not
> > a robust way to fix migration tests. Migration tests need to find
> > a more robust way to discover a reasonable bandwidth without slowing
> > things down for everyone.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
> What's the conclusion here? Should I merge this?

Yes please; I need to rethink that.

Dave

> 
> > ---
> >  tests/qtest/migration-test.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index dc3490c9fa..21ea5ba1d2 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -1211,7 +1211,7 @@ static void test_migrate_auto_converge(void)
> >       * without throttling.
> >       */
> >      migrate_set_parameter_int(from, "downtime-limit", 1);
> > -    migrate_set_parameter_int(from, "max-bandwidth", 1000000); /* ~1Mb/s */
> > +    migrate_set_parameter_int(from, "max-bandwidth", 100000000); /* ~100Mb/s */
> >  
> >      /* To check remaining size after precopy */
> >      migrate_set_capability(from, "pause-before-switchover", true);
> > -- 
> > MST
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


