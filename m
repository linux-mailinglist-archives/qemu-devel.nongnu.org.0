Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C57569DF5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 10:49:14 +0200 (CEST)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9NCD-0000z6-Jy
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 04:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9Mwj-00051m-Vd
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o9Mwh-0008WS-Te
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 04:33:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657182791;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYx/2w+QN7K6leQptRp6mSD/r7PKurJAi8BBmHOm06A=;
 b=E7ZFMEFU4E1HLhrtEB0/DBz8bD5ITdK6xOlcwx+YiPBOxpydlk1qhTybnOeJDZEvyK+jRO
 wePUWs8f4srM5MpyL4VFzWdgTcoBPvZi0tnMhVRg65UvToaMhgF/i7+AUDQuznx4lH05vC
 /qP4R24nIA2CKotJ6UizHCEBGJHTg9E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-53sAQXtcPRCzQLqVtAuxLQ-1; Thu, 07 Jul 2022 04:33:04 -0400
X-MC-Unique: 53sAQXtcPRCzQLqVtAuxLQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C61589C8E0;
 Thu,  7 Jul 2022 08:33:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D779400DFA6;
 Thu,  7 Jul 2022 08:33:01 +0000 (UTC)
Date: Thu, 7 Jul 2022 09:32:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Roth <michael.roth@amd.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 10/13] tests/vm: Remove docker cross-compile test from
 CentOS VM
Message-ID: <YsaaOtLYrbQseDaF@redhat.com>
References: <20220707040310.4163682-1-jsnow@redhat.com>
 <20220707040310.4163682-11-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707040310.4163682-11-jsnow@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Thu, Jul 07, 2022 at 12:03:07AM -0400, John Snow wrote:
> The fedora container has since been split apart, so there's no suitable
> nearby target that would support "test-mingw" as it requires both x32
> and x64 support -- so either fedora-cross-win32 nor fedora-cross-win64
> would be truly suitable.
> 
> Just remove this test as superfluous with our current CI infrastructure.
> 
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  tests/vm/centos | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tests/vm/centos b/tests/vm/centos
> index 3a527c47b3d..097a9ca14d3 100755
> --- a/tests/vm/centos
> +++ b/tests/vm/centos
> @@ -28,7 +28,6 @@ class CentosVM(basevm.BaseVM):
>          tar -xf $SRC_ARCHIVE;
>          make docker-test-block@centos8 {verbose} J={jobs} NETWORK=1;
>          make docker-test-quick@centos8 {verbose} J={jobs} NETWORK=1;
> -        make docker-test-mingw@fedora  {verbose} J={jobs} NETWORK=1;

Well it could have been replaced with two:

      make docker-test-mingw@fedora-cross-win32  {verbose} J={jobs} NETWORK=1;
      make docker-test-mingw@fedora-cross-win64  {verbose} J={jobs} NETWORK=1;

I don't mind either way though, and feel this is quite poiintless
anyway, since mingw is trivial to test in containers

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


