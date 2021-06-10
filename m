Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A383A339F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 20:57:36 +0200 (CEST)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrPrz-0004N2-9a
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 14:57:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lrPqf-0003h5-0A
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lrPqa-0005sh-Ou
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 14:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623351366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vDX20ZbxRgBLYBc/29tpEPVODEqHbuDPQ+nDe/rLck=;
 b=FF8n0Kaek/3de8LuuXZzUVqRWDgHH0BVlk9EZLIG6ZiudqI/K60hYYynAaJ+nCFZJIdP1+
 Fhuu4JyDMy8XdP9aTneI0iA8QWRgOtmV5itFGblUGUGwljWX3ziN/UmmSv+Nz+CCEg9yUj
 gXpapOnVADDYNncbJAscydIErw5/TLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-zsWsncBLNh2tVtcnLvnBCg-1; Thu, 10 Jun 2021 14:56:05 -0400
X-MC-Unique: zsWsncBLNh2tVtcnLvnBCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACD428018A7
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 18:56:04 +0000 (UTC)
Received: from work-vm (ovpn-114-240.ams2.redhat.com [10.36.114.240])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7809E5C1CF;
 Thu, 10 Jun 2021 18:56:03 +0000 (UTC)
Date: Thu, 10 Jun 2021 19:56:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/2] tests: migration-test: Still run the rest even if
 uffd missing
Message-ID: <YMJgQOgRjO8xvLIR@work-vm>
References: <20210610005239.265588-1-peterx@redhat.com>
 <20210610005239.265588-2-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210610005239.265588-2-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Currently we'll skip the whole migration-test if uffd missing.
> 
> It's a bit harsh - we can still run the rest besides postcopy!  Enable them
> when we still can.
> 
> It'll happen more frequently now after kernel UFFD_USER_MODE_ONLY introduced in
> commit 37cd0575b8510159, as qemu test normally requires kernel faults.  One
> alternative is we disable kvm and create the uffd with UFFD_USER_MODE_ONLY for
> all postcopy tests, however to be simple for now just skip postcopy tests only
> by default.  If we wanna run them use "sudo" or root, they'll still work.  In
> all cases, it's still better than running nothing for migration-test.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Ouch! Yes; that check was originally in a standalone test file for
postcopy that's then morphed into the full test over a few years.



Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 2b028df6875..d9225f58d4d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1376,10 +1376,6 @@ int main(int argc, char **argv)
>  
>      g_test_init(&argc, &argv, NULL);
>  
> -    if (!ufd_version_check()) {
> -        return g_test_run();
> -    }
> -
>      /*
>       * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
>       * is touchy due to race conditions on dirty bits (especially on PPC for
> @@ -1416,8 +1412,11 @@ int main(int argc, char **argv)
>  
>      module_call_init(MODULE_INIT_QOM);
>  
> -    qtest_add_func("/migration/postcopy/unix", test_postcopy);
> -    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> +    if (ufd_version_check()) {
> +        qtest_add_func("/migration/postcopy/unix", test_postcopy);
> +        qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
> +    }
> +
>      qtest_add_func("/migration/bad_dest", test_baddest);
>      qtest_add_func("/migration/precopy/unix", test_precopy_unix);
>      qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


