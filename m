Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F229937A403
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:49:33 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgP10-0000Fc-Lj
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOzB-0006PB-DF
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgOz9-0003m4-NH
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620726446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N+eHbiBDb2gLmZtfQE1kNem8MIIERjxSSDOQ04CzfgY=;
 b=E8mIPOe1F0ZNOU8WGm2b145CBEFBlmUooCeibLRsL1wFSNEpvq+bwa40YIipZ+Z2qXcPSl
 GHjmVbfmBC6RqU7tv2LteYe5QGKPEs0W1wmrBrjPDMrtXRRpO9nFMQ8puy7qfy9d0hmw5r
 y/3hKgU1CXQXaKA1BCkbzn6h35Bj1AQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-ooiA29cfP9erm71qVzec8Q-1; Tue, 11 May 2021 05:47:25 -0400
X-MC-Unique: ooiA29cfP9erm71qVzec8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15A708014D8;
 Tue, 11 May 2021 09:47:24 +0000 (UTC)
Received: from work-vm (ovpn-113-51.ams2.redhat.com [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 10DF81037F24;
 Tue, 11 May 2021 09:47:22 +0000 (UTC)
Date: Tue, 11 May 2021 10:47:20 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, thuth@redhat.com, lvivier@redhat.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH] tests/migration-test: Fix "true" vs true
Message-ID: <YJpSqP18ebF5RO2/@work-vm>
References: <20210504100545.112213-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210504100545.112213-1-dgilbert@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Accidental use of "true" as a boolean; spotted by coverity
> and Peter.
> 
> Fixes: b99784ef6c3
> Fixes: d795f47466e
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Coverity (CID 1432373, 1432292, 1432288)
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued

> ---
>  tests/qtest/migration-test.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3a711bb492..4d989f191b 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -898,8 +898,8 @@ static void test_xbzrle(const char *uri)
>  
>      migrate_set_parameter_int(from, "xbzrle-cache-size", 33554432);
>  
> -    migrate_set_capability(from, "xbzrle", "true");
> -    migrate_set_capability(to, "xbzrle", "true");
> +    migrate_set_capability(from, "xbzrle", true);
> +    migrate_set_capability(to, "xbzrle", true);
>      /* Wait for the first serial output from the source */
>      wait_for_serial("src_serial");
>  
> @@ -1246,8 +1246,8 @@ static void test_multifd_tcp(const char *method)
>      migrate_set_parameter_str(from, "multifd-compression", method);
>      migrate_set_parameter_str(to, "multifd-compression", method);
>  
> -    migrate_set_capability(from, "multifd", "true");
> -    migrate_set_capability(to, "multifd", "true");
> +    migrate_set_capability(from, "multifd", true);
> +    migrate_set_capability(to, "multifd", true);
>  
>      /* Start incoming migration from the 1st socket */
>      rsp = wait_command(to, "{ 'execute': 'migrate-incoming',"
> @@ -1330,8 +1330,8 @@ static void test_multifd_tcp_cancel(void)
>      migrate_set_parameter_int(from, "multifd-channels", 16);
>      migrate_set_parameter_int(to, "multifd-channels", 16);
>  
> -    migrate_set_capability(from, "multifd", "true");
> -    migrate_set_capability(to, "multifd", "true");
> +    migrate_set_capability(from, "multifd", true);
> +    migrate_set_capability(to, "multifd", true);
>  
>      /* Start incoming migration from the 1st socket */
>      rsp = wait_command(to, "{ 'execute': 'migrate-incoming',"
> @@ -1358,7 +1358,7 @@ static void test_multifd_tcp_cancel(void)
>  
>      migrate_set_parameter_int(to2, "multifd-channels", 16);
>  
> -    migrate_set_capability(to2, "multifd", "true");
> +    migrate_set_capability(to2, "multifd", true);
>  
>      /* Start incoming migration from the 1st socket */
>      rsp = wait_command(to2, "{ 'execute': 'migrate-incoming',"
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


