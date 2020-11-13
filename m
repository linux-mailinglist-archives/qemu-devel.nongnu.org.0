Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A282B22F3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 18:47:29 +0100 (CET)
Received: from localhost ([::1]:55554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kddAW-0008Pq-Dw
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 12:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kdd9O-0007wc-7L
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 12:46:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kdd9L-0005IH-3M
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 12:46:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605289573;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yingQEdmxmkrj4xzOlvqXaow7ir1KTJMAtc1oQ9ogjk=;
 b=XpHwpRR+O4ZW0iVjQyrT2KhyBTpYtdW+dzrE1IpdvOhiTpm8TV89zb1NzT9g3tUbSGe/J/
 fWcSbtQP9BFiaRKwIoQQkogglvhKDXYC+uoDtfJnZnRNbC3EUl1STQotWiofkSxkKJ4q1f
 YWAhGDdNOScfERvxO/rebm1EJmccpWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-AADPoTKDMcqN_eOPcS_nNg-1; Fri, 13 Nov 2020 12:46:06 -0500
X-MC-Unique: AADPoTKDMcqN_eOPcS_nNg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73112107AFAE;
 Fri, 13 Nov 2020 17:46:05 +0000 (UTC)
Received: from redhat.com (ovpn-113-180.ams2.redhat.com [10.36.113.180])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B37EE5C1C7;
 Fri, 13 Nov 2020 17:46:00 +0000 (UTC)
Date: Fri, 13 Nov 2020 17:45:57 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] .gitlab-ci.d/check-patch: tweak output for CI logs
Message-ID: <20201113174557.GL30434@redhat.com>
References: <20201113174404.19608-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201113174404.19608-1-alex.bennee@linaro.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 13, 2020 at 05:44:04PM +0000, Alex Bennée wrote:
> We don't need running commentary for the CI logs and by keeping it
> short we might just see the problem on the first page. While we are at
> it flush the previous line so order is maintained between script and
> sub process.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/check-patch.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/check-patch.py b/.gitlab-ci.d/check-patch.py
> index 0ff30ee077..39e2b403c9 100755
> --- a/.gitlab-ci.d/check-patch.py
> +++ b/.gitlab-ci.d/check-patch.py
> @@ -45,9 +45,9 @@ if log == "":
>  
>  errors = False
>  
> -print("\nChecking all commits since %s...\n" % ancestor)
> +print("\nChecking all commits since %s...\n" % ancestor, flush=True)
>  
> -ret = subprocess.run(["scripts/checkpatch.pl", ancestor + "..."])
> +ret = subprocess.run(["scripts/checkpatch.pl", "--terse", ancestor + "..."])

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


