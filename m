Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173A9389F77
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:08:15 +0200 (CEST)
Received: from localhost ([::1]:46182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljdj4-0002UO-2f
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljdfz-0007tL-VP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:05:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljdfx-0005NU-R3
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:05:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621497901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2bWyu1bhKRZNdxYHV+kabdE1OaL17WaJz4j1ZDjldxM=;
 b=KiQHT4Tx/XHl6VGVF7uhgRGLWdfLge5WarUj5rcVHwGskns7ofMwVG6/dhw6AZnkkfXx5p
 zJQzCyPW5S8xvJehVxejQO5NO7hd359kUAzPvWu+GtLq41CZvIS+e/LSljX5/CyAuaENUF
 3Rf5EYxRnbdtW6pjW9ikK5ynmKykUPs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-gRJqZ4NYP-erh67kFYxQ3g-1; Thu, 20 May 2021 04:04:57 -0400
X-MC-Unique: gRJqZ4NYP-erh67kFYxQ3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3C28107ACC7;
 Thu, 20 May 2021 08:04:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-71.ams2.redhat.com [10.36.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8158F5D9CC;
 Thu, 20 May 2021 08:04:47 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] gitlab-ci: Simplify before/after script for
 Avocado based jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-6-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <06235f4a-cea1-3446-1641-1bb7962ea21d@redhat.com>
Date: Thu, 20 May 2021 10:04:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210519184549.2192728-6-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Missing patch description. Could you please elaborate why this change is ok?

  Thanks,
   Thomas


On 19/05/2021 20.45, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index a625c697d3b..f968fa1ad99 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -74,7 +74,7 @@
>         - build/tests/results/latest/test-results
>       reports:
>         junit: build/tests/results/latest/results.xml
> -  before_script:
> +  script:
>       - mkdir -p ~/.config/avocado
>       - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
>       - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
> @@ -85,6 +85,9 @@
>           du -chs ${CI_PROJECT_DIR}/avocado-cache ;
>         fi
>       - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
> -  after_script:
>       - cd build
> +    - find . -type f -exec touch {} +
> +    # Avoid recompiling by hiding ninja with NINJA=":"
> +    - $MAKE NINJA=":" $MAKE_CHECK_ARGS
> +  after_script:
>       - du -chs ${CI_PROJECT_DIR}/avocado-cache
> 


