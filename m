Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467802AD8CA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 15:28:30 +0100 (CET)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcUdI-00054L-Sq
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 09:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcUc3-0004XS-JX
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcUb2-00045r-JT
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 09:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605018363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ABDJ4ON5MaOd0IwVGjZmfF8OmMmdzNdlg9v0OCRShc=;
 b=FN5h1CGDrdNCF0YL2jKCgzLRkFt39s2qstdEjRiI9b7y6EU/t8mahqv1IUPqNZYsvh0wjW
 N0frauXCHIj+a8wLknxvHUoDWUJgmURUuwxHd1olzAgHZszQxua4rloF+ACpUghOscp2u3
 u8/MBpVlMGMaBzGtLK15MffvgQSiKsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-v5sq4FDdMPS0sn7ZwpjrEA-1; Tue, 10 Nov 2020 09:23:48 -0500
X-MC-Unique: v5sq4FDdMPS0sn7ZwpjrEA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99B5780474E;
 Tue, 10 Nov 2020 14:23:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C7D4277DE;
 Tue, 10 Nov 2020 14:23:34 +0000 (UTC)
Subject: Re: [PATCH-for-6.0 v4 08/17] gitlab-ci: Move linux-user debug-tcg
 test across to gitlab
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-9-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <44f0215b-6328-8593-6a8a-d26b3804703f@redhat.com>
Date: Tue, 10 Nov 2020 12:23:27 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108204535.2319870-9-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/8/20 6:45 PM, Philippe Mathieu-Daudé wrote:
> Similarly to commit 8cdb2cef3f1, move the linux-user (debug-tcg)
> test to GitLab.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>
> ---
>   .gitlab-ci.yml | 7 +++++++
>   .travis.yml    | 9 ---------
>   2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 3fc3d0568c6..80082a602b8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -304,6 +304,13 @@ build-user:
>       CONFIGURE_ARGS: --disable-tools --disable-system
>       MAKE_CHECK_ARGS: check-tcg
>   
> +build-user-debug:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-all-test-cross
> +    CONFIGURE_ARGS: --disable-tools --disable-system --enable-debug-tcg
> +    MAKE_CHECK_ARGS: check-tcg
> +

It would be useful a variable like 'MAKE_BUILD_ARGS' so that we could 
overwrite the default make target (as in the diff below). So that here 
it would eval to  `make -j"$JOBS" build-tcg` as is done in Travis CI.

On the absence of such as variable,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

---

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3b15ae5c30..27517afd22 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -34,7 +34,7 @@ include:
        else
          ../configure --enable-werror $CONFIGURE_ARGS ;
        fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
-    - make -j"$JOBS"
+    - make -j"$JOBS" "$MAKE_BUILD_ARGS"
      - if test -n "$MAKE_CHECK_ARGS";
        then
          make -j"$JOBS" $MAKE_CHECK_ARGS ;

>   # Run check-tcg against linux-user (with plugins)
>   # we skip sparc64-linux-user until it has been fixed somewhat
>   # we skip cris-linux-user as it doesn't use the common run loop
> diff --git a/.travis.yml b/.travis.yml
> index 15d92291358..bee6197290d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -293,15 +293,6 @@ jobs:
>           - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
>   
>   
> -    # Run check-tcg against linux-user
> -    - name: "GCC check-tcg (user)"
> -      env:
> -        - CONFIG="--disable-system --enable-debug-tcg"
> -        - TEST_BUILD_CMD="make build-tcg"
> -        - TEST_CMD="make check-tcg"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
> -
> -
>       # Run check-tcg against softmmu targets
>       - name: "GCC check-tcg (some-softmmu)"
>         env:


