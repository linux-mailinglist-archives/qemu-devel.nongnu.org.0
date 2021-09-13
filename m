Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FAD40891E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 12:37:17 +0200 (CEST)
Received: from localhost ([::1]:59724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjKu-00045c-RM
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 06:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPjF3-0008O6-3f
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:31:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mPjF0-0007F6-TF
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 06:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631529070;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Hil0uagqz3vpM6Ro0euGLkR6h8hZOI6PjbkGsOyTW48=;
 b=AhCMHAoYSMCktuVIZ6QxQW7bXwNrX/Vub9To95ylI7vIq2uqARWEH8MholPtaEwsZBSPne
 bh8e+R3YaPMaXMhV1Ea9cormARCfabsHTgZnM/vCs1Vvv/ULs8qGY4TgC/Zs9Bb8JjkiN7
 scsCYbRHOelxy77L1G4G6qWPYZqYp14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-kKPgN9U1PV68wWQVG6hDCg-1; Mon, 13 Sep 2021 06:28:49 -0400
X-MC-Unique: kKPgN9U1PV68wWQVG6hDCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DB611808305;
 Mon, 13 Sep 2021 10:28:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E37DC3AB2;
 Mon, 13 Sep 2021 10:28:46 +0000 (UTC)
Date: Mon, 13 Sep 2021 11:28:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and
 don't allow failure
Message-ID: <YT8n3HKfbheSjuzn@redhat.com>
References: <20210913101948.12600-1-peter.maydell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210913101948.12600-1-peter.maydell@linaro.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 13, 2021 at 11:19:48AM +0100, Peter Maydell wrote:
> Currently we define a lot of jobs for our custom runners:
> for both aarch64 and s390x we have
>  - all-linux-static
>  - all
>  - alldbg
>  - clang (manual)
>  - tci
>  - notcg (manual)
> 
> This is overkill.  The main reason to run on these hosts is to get
> coverage for the host architecture; we can leave the handling of
> differences like debug vs non-debug to the x86 CI jobs.
> 
> The jobs are also generally running OK; they occasionally fail due to
> timeouts, which is likely because we're overloading the machine by
> asking it to run 4 CI jobs at once plus the ad-hoc CI.
> 
> Remove the 'allow_failure' tag from all these jobs, and switch the
> s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.

Why the difference in skipping  'alldbg' vs 'all'  ? Was that just
to get diverse coverage of debug vs non-debug ?

> This will let us make the switch for s390x and aarch64 hosts from
> the ad-hoc CI to gitlab.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  .gitlab-ci.d/custom-runners.yml | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


