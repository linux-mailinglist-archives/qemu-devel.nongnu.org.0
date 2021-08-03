Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC253DF095
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:46:00 +0200 (CEST)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvg7-0000EF-MU
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAveo-0007mt-2F
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:44:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAvem-0006Kq-GR
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628001875;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5/fNVjHUkyr0ZrCkxF1k9tNcgfghn/FdrPORvqyt0A=;
 b=jG/kCJJnCnnhIqmOjuagi/bTDou2OTdDrFdbcWN9qUFjXL5GSPdoe/BXo8X7ks7UnccEUz
 H6oR+wXxH275gvrH1LlTwXMsRb9Sv6RMaRK3dRrqGZh4pKfkCoJ/KEkMBqgDo3TCUwA9kQ
 IUYuOa/mfLbu/f3aO2iizHmo2cq1vNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-yjb4UjvdMd2Ec0lIh7biNg-1; Tue, 03 Aug 2021 10:44:29 -0400
X-MC-Unique: yjb4UjvdMd2Ec0lIh7biNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CA668799E0;
 Tue,  3 Aug 2021 14:44:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3330A19C44;
 Tue,  3 Aug 2021 14:44:27 +0000 (UTC)
Date: Tue, 3 Aug 2021 15:44:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: Status of stable release effort ?
Message-ID: <YQlWSBU9CWAXDuuE@redhat.com>
References: <YP6K1a/ay16KeiAT@redhat.com>
 <162800110465.1099206.10488782955990913660@amd.com>
MIME-Version: 1.0
In-Reply-To: <162800110465.1099206.10488782955990913660@amd.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 03, 2021 at 09:31:44AM -0500, Michael Roth wrote:
> Quoting Daniel P. Berrangé (2021-07-26 05:13:41)
> > We are currently in the final lead up to shipping the 6.1.0 release
> > 
> > AFAICT from git tags, the latest stable release was 5.0.1 in Sep 2020
> > 
> >    https://gitlab.com/qemu-project/qemu/-/tags
> > 
> > There have been many patches sent to qemu-stable each month e.g.
> > 
> >   https://lists.nongnu.org/archive/html/qemu-stable/2021-06/threads.html
> > 
> > but no 5.1.1, 5.2.1 or 6.0.1 releases IIUC
> > 
> > Is QEMU stable still an active effort that we need to CC patches to ?
> 
> Hi Daniel,
> 
> Long story short: I tossed away my test setup when I switched employers
> last year with plans to make better use of the new gitlab infrastructure
> and make it easier to swap in different maintainers as-needed, sort of
> like what Peter has been working on for qemu mainline. Things ramped up
> a bit faster than expected here however and it's been on my queue ever
> since.
> 
> My plan has been to resume regular stable releases starting with 6.0.1
> within the next few weeks, but still need to take a good hard look at the
> testing situation and how we can make the process more resilient. I'd
> hoped to find time to dig into laying out an overall test plan a bit more
> before responding but will find some cycles to do so as I work on getting
> the 6.0.1 release together.
> 
> I apologize to anyone who spent time curating patches for
> qemu-stable@nongu.org, the ones targetted for anything prior to 6.0.1 likely
> won't make a stable release, but if there's something I should reconsider
> please let me know. And please don't let my poor handling of things affect
> the overall process, there have been others in the community that have shown
> interest helping with stable in the past, but the testing situation has always
> made it difficult move forward with things, so if that can be improved in that
> regard then I think we could expect the process improve.

For 6.0.1 you're still going to be lacking the gitlab CI custom runner
config that Peter has just started using for testing for non-x86 arch
coverage.

It will at least have the x86 coverage using shared runners though
which is better than nothing.

The custom runner config invokes jobs when pushing to 'qemu-project'
gitlab namespace (ie not user forks), if using a branch with a name
prefix 'staging'. So from 6.1.1 onwards if you push to (for example)
'staging-stable' branch that'll trigger the same set of GitLab CI
jobs that Peter runs for the master branch.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


