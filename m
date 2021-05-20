Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6138B5F7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 20:28:06 +0200 (CEST)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljnOu-0003tn-Tk
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 14:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ljnNY-00036m-EZ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 14:26:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ljnNV-0000PZ-R3
 for qemu-devel@nongnu.org; Thu, 20 May 2021 14:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621535196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7eIlyQfAzTsmR7fSR0hnz7du51UHoYypsp+BaxqZU/c=;
 b=cOwVF7wKjvanIv8TIjjh+IaDC0Rdm8DU61hBZ2RaSdgDLT7mtyNlcSdaFpM8CBLQsrDamD
 5ll8CPvCvtAOAiVOD14Ihr2Fn+veQ2MUccx0fWz+tC8NVpcwwXQKXeD369V7gPwTug5Ugm
 0OHLrI4gs2EBgSjwP//ZwqT9eyXxYTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-fI3dRbSuM2-6ZjjkV_jgvQ-1; Thu, 20 May 2021 14:26:29 -0400
X-MC-Unique: fI3dRbSuM2-6ZjjkV_jgvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F1A0A40C0;
 Thu, 20 May 2021 18:26:28 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-139.gru2.redhat.com
 [10.97.116.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB6F92BFDE;
 Thu, 20 May 2021 18:26:19 +0000 (UTC)
Subject: Re: [PATCH v3 3/6] gitlab-ci: Run GNU make via the $MAKE variable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-4-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <c38ed8d1-5803-d15e-392b-277c570e6b51@redhat.com>
Date: Thu, 20 May 2021 15:26:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210519184549.2192728-4-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 5/19/21 3:45 PM, Philippe Mathieu-Daudé wrote:
> Add the $MAKE variable to call GNU make, and set it to 'gmake'
> on FreeBSD to avoid:
>
>    $ make -j"$JOBS"
>    make: Unknown modifier ','
>    make: "/builds/dTyar424/0/qemu/build/Makefile" line 3: Need an operator
>    make: "/builds/dTyar424/0/qemu/build/Makefile" line 4: Missing dependency operator
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index fe4f18595ac..f284d7a0eec 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -5,9 +5,11 @@
>           ;
>         then
>           JOBS=$(sysctl -n hw.ncpu)
> +        MAKE=gmake
>           ;
>         else
>           JOBS=$(expr $(nproc) + 1)
> +        MAKE=make
>           ;
>         fi
>       - echo "=== Using $JOBS simultaneous jobs ==="
> @@ -33,22 +35,23 @@
>         then
>           ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
>         fi || exit 1;
> -    - make -j"$JOBS"
> +    - $MAKE -j"$JOBS"
>       - if test -n "$MAKE_CHECK_ARGS";
>         then
> -        make -j"$JOBS" $MAKE_CHECK_ARGS ;
> +        $MAKE -j"$JOBS" $MAKE_CHECK_ARGS ;
>         fi
>   
>   .native_test_job_template:
>     stage: test
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  extends: .environment_variables_template
>     script:
>       - scripts/git-submodule.sh update
>           $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
>       - cd build
>       - find . -type f -exec touch {} +
>       # Avoid recompiling by hiding ninja with NINJA=":"
> -    - make NINJA=":" $MAKE_CHECK_ARGS
> +    - $MAKE NINJA=":" $MAKE_CHECK_ARGS
>   
>   .integration_test_job_template:
>     extends: .native_test_job_template


