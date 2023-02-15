Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 150CA697EF5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 15:59:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJFI-0006z4-1O; Wed, 15 Feb 2023 09:58:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSJFF-0006yY-GQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:58:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSJFD-0003pa-A2
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 09:58:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676473129;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=F62WFb0l45tszw/oDRlblCagmSL+A3iO6amliBOa8eg=;
 b=DOO38/Ia6URi2REh9mDOsn/L4TeyhhYhRe3c/Naox0DzJqyVDe6T7cePKxKqIkrzeK3s44
 hxBdMX6CqIABI4AK+0ULqRqDBPGUXph6en3mk5PsOSnZKmvXNfiTpVEE9KUsHYI4B7ynkf
 nE2WqsFhhgkeinh+h/YunaJLarRZFrQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-RCVPE0McNqC0SZ71D4uqjQ-1; Wed, 15 Feb 2023 09:58:46 -0500
X-MC-Unique: RCVPE0McNqC0SZ71D4uqjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86757100F907;
 Wed, 15 Feb 2023 14:58:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53C4C4014D03;
 Wed, 15 Feb 2023 14:58:44 +0000 (UTC)
Date: Wed, 15 Feb 2023 14:58:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH] gitlab-ci: Use artifacts instead of dumping logs in the
 Cirrus-CI jobs
Message-ID: <Y+zzIV2e6UigEIze@redhat.com>
References: <20230215142503.90660-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230215142503.90660-1-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

On Wed, Feb 15, 2023 at 03:25:03PM +0100, Thomas Huth wrote:
> The meson log files can get very big, especially if running the tests in
> verbose mode. So dumping those logs to the console was a bad idea, since
> gitlab truncates the output if it is getting too big. Let's publish the
> logs as artifacts instead. This has the disadvantage that you have to
> look up the logs on cirrus-ci.com now instead, but that's still better
> than not having the important part of the log at all since it got
> truncated.

Having to go over to cirrus-ci.com is pretty awful user experiance,
especially as there's no direct link.

> Fixes: 998f334722 ("gitlab: show testlog.txt contents ...")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Note: I also tried to publish the junit xml files as artifacts
>  instead, but while the cirrus-ci docs claim to support it, I only
>  got unreadable XML output in my browser that way, so the .txt
>  files look like the better option to me.
> 
>  .gitlab-ci.d/cirrus/build.yml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
> index 7ef6af8d33..a9444902ec 100644
> --- a/.gitlab-ci.d/cirrus/build.yml
> +++ b/.gitlab-ci.d/cirrus/build.yml
> @@ -32,6 +32,9 @@ build_task:
>      - $MAKE -j$(sysctl -n hw.ncpu)
>      - for TARGET in $TEST_TARGETS ;
>        do
> -        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
> -        || { cat meson-logs/testlog.txt; exit 1; } ;
> +        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
>        done
> +  always:
> +    build_result_artifacts:
> +      path: build/meson-logs/*log.txt
> +      type: text/plain

Does it have to be either/or, can't we do both ?

95% of the time the truncated testlog.txt is sufficient on its own.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


