Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF416C467D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:32:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peupW-0005HL-DK; Wed, 22 Mar 2023 05:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peupV-0005HC-Ao
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:32:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peupT-000529-Pa
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679477543;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xStyiFJaec8cV6XhXS5GVGUkz3U0CiUfvPFLNqalVE8=;
 b=CTrLeT/me4M5/MVLp2ITmsIYuCvckRSkjRB+TuL3amQvLXvfMOscl+ruJ8NXxB05rQUdg6
 Nv8u1U7GOC4jon3gpjgvxRLD4UGI9NieITyDwWdjGKxJslHwQABd1AXBTUxF4U4sxYn0/S
 bi7ZZmRaswpayWeta5wrlwmjxYKn6+I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-GgvmIM0HM4-jJSVrnJNxxw-1; Wed, 22 Mar 2023 05:32:21 -0400
X-MC-Unique: GgvmIM0HM4-jJSVrnJNxxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33A1C101A531;
 Wed, 22 Mar 2023 09:32:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32C6AC15BA0;
 Wed, 22 Mar 2023 09:32:20 +0000 (UTC)
Date: Wed, 22 Mar 2023 09:32:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [RFC PATCH] tests/qemu-iotests: serialise all the qemu-iotests
Message-ID: <ZBrLIXvb3KrXQFzC@redhat.com>
References: <20230321235102.3832417-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321235102.3832417-1-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 21, 2023 at 11:51:02PM +0000, Alex Bennée wrote:
> Something on OpenBSD fails with multiple tests running at once and
> fiddling with J=1 on invocation just made everything else very slow.
> 
> Based-on: 20230318114644.1340899-1-alex.bennee@linaro.org
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/qemu-iotests/meson.build | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
> index a162f683ef..d572205a60 100644
> --- a/tests/qemu-iotests/meson.build
> +++ b/tests/qemu-iotests/meson.build
> @@ -64,6 +64,7 @@ foreach format, speed: qemu_iotests_formats
>             depends: qemu_iotests_binaries,
>             env: qemu_iotests_env,
>             protocol: 'tap',
> +           is_parallel : false,
>             timeout: 180,
>             suite: suites)
>    endforeach

This will be a massive regression for all platforms though.

The iotests run a few 100 tests. Previously the iotests harness was
serialized against all other QEMU tests, but the individual iotests
were all parallelized.

With this proposed change all 100 individual iotests are serialized,
both with each other, and with all other QEMU tests.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


