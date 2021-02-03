Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E615830E2C8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:50:19 +0100 (CET)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NEI-0001xR-G9
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7NDA-0001XF-Fw
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:49:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7ND6-0004lb-Og
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612378142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CrQ07G6+BwphAxLuV06UzcM0e6Z/zTsCN0JGHJms2pc=;
 b=hCvRjCmZPDm8wsWxdLFQ4ngeg/kWDcGNYmSWGMk0PDppTErlucTTyxuC5nzdPF40B+uEjv
 X+fTNm26Ldk7rD80+5bd7cmrMrdZoKpk7DuxeUY/do9NcxCWfNrx5FZ9o/HAgomvyOgoip
 JA3LwL7AbP+Q2HK3igsux0qjci3RQZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-NJt7UY7LP8mEZ7SSK2QZ3A-1; Wed, 03 Feb 2021 13:49:01 -0500
X-MC-Unique: NJt7UY7LP8mEZ7SSK2QZ3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E3C8107ACE8;
 Wed,  3 Feb 2021 18:49:00 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EF325885D;
 Wed,  3 Feb 2021 18:48:51 +0000 (UTC)
Subject: Re: [PATCH 3/6] travis.yml: Move the --enable-modules test to the
 gitlab-CI
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210203113243.280883-1-thuth@redhat.com>
 <20210203113243.280883-4-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <1aadc47f-df21-5311-77ff-eeafde56c0c7@redhat.com>
Date: Wed, 3 Feb 2021 15:48:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203113243.280883-4-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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


On 2/3/21 8:32 AM, Thomas Huth wrote:
> Simply add the flag to an existing job, no need for yet another
> job here.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.yml | 1 +
>   .travis.yml    | 6 ------
>   2 files changed, 1 insertion(+), 6 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 41e11b41e4..4654798523 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -223,6 +223,7 @@ build-system-centos:
>     variables:
>       IMAGE: centos8
>       CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
> +                    --enable-modules
>       TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
>         x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
>       MAKE_CHECK_ARGS: check-build
> diff --git a/.travis.yml b/.travis.yml
> index d1e9016da5..45dd017420 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -132,12 +132,6 @@ jobs:
>           - CONFIG="--enable-debug-tcg --disable-system"
>           - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-debug-tcg"
>   
> -    # Module builds are mostly of interest to major distros
> -    - name: "GCC modules (main-softmmu)"
> -      env:
> -        - CONFIG="--enable-modules --target-list=${MAIN_SOFTMMU_TARGETS}"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -
>   
>       # Using newer GCC with sanitizers
>       - name: "GCC9 with sanitizers (softmmu)"


