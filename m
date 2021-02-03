Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D044A30E2F2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:57:58 +0100 (CET)
Received: from localhost ([::1]:50548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NLh-0005Hm-Ay
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7NKW-0004ks-37
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:56:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7NKT-0008Py-HA
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:56:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612378599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qR8nD63Ep4bLgwXU7vjyA76Zc3Ax9YCITR2PYAuJq0M=;
 b=AA3AJMcpD9DDrCrNJdSI4DdX45zv5V0VrlWTTO7apEK4q7LsfVzsEVvPXqeYeZGlQhWYtm
 DmLhIdLJKcvke2ZqBmm6OytNw/W54xIYoYz7SAxAJD0DQyxUeWYPIA6ZgZmgmMMnao9klU
 0q2j0hrvvX+p01/lPerZGm9bqGdfndc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-WNi1y4LeOn2hwdq8sNfi2w-1; Wed, 03 Feb 2021 13:56:36 -0500
X-MC-Unique: WNi1y4LeOn2hwdq8sNfi2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 767929126F;
 Wed,  3 Feb 2021 18:56:35 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33F076091B;
 Wed,  3 Feb 2021 18:56:31 +0000 (UTC)
Subject: Re: [PATCH 4/6] travis.yml: Remove the --enable-debug jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210203113243.280883-1-thuth@redhat.com>
 <20210203113243.280883-5-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <651b8baa-0905-1221-fc04-21df43877989@redhat.com>
Date: Wed, 3 Feb 2021 15:56:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203113243.280883-5-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2/3/21 8:32 AM, Thomas Huth wrote:
> We already have such jobs in the gitlab-CI ("build-some-softmmu" and
> "build-user-plugins"), so we can simply drop these from the Travis-CI.

Those jobs --enable-debug-tcg. Shouldn't at least one --enable-debug?

- Wainer

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .travis.yml | 12 ------------
>   1 file changed, 12 deletions(-)
>
> diff --git a/.travis.yml b/.travis.yml
> index 45dd017420..b3fc72f561 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -119,18 +119,6 @@ after_script:
>   
>   jobs:
>     include:
> -    # --enable-debug implies --enable-debug-tcg, also runs quite a bit slower
> -    - name: "GCC debug (main-softmmu)"
> -      env:
> -        - CONFIG="--enable-debug --target-list=${MAIN_SOFTMMU_TARGETS}"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug"
> -
> -
> -    # TCG debug can be run just on its own and is mostly agnostic to user/softmmu distinctions
> -    - name: "GCC debug (user)"
> -      env:
> -        - CONFIG="--enable-debug-tcg --disable-system"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
>   
>   
>       # Using newer GCC with sanitizers


