Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00325E77E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Sep 2020 14:17:29 +0200 (CEST)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEX8K-0001gn-PP
	for lists+qemu-devel@lfdr.de; Sat, 05 Sep 2020 08:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kEX6s-0000rv-V2
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 08:15:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:29374
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kEX6m-0006HG-Fo
 for qemu-devel@nongnu.org; Sat, 05 Sep 2020 08:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599308151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0uEUA85X+MCWMWu2Nvn8t7hQWmnqZMSGsU+rkFYFvE=;
 b=RgDC1C9epnkz8C2FenhvZVKIBhzbBXWx8J5z4xDlOGy7KlFblQRhwb7385HoGCq596lG+e
 I4yYQ7Tcq/8yHhrVHpWxNEEOu4nFaFatpRZWNgCWwYb8eLRhbHcD6HOIDX2tX2QPPS5YVX
 Ad4VgBt9jtrhA3UNNJnMZ2jSLGoTkO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-3Nnv8yYIM26scF1jpBv_Ow-1; Sat, 05 Sep 2020 08:15:47 -0400
X-MC-Unique: 3Nnv8yYIM26scF1jpBv_Ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 978EF1005E72;
 Sat,  5 Sep 2020 12:15:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8BCD260C05;
 Sat,  5 Sep 2020 12:15:45 +0000 (UTC)
Subject: Re: [RFC PATCH] travis.yml: Drop the default softmmu builds
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200805185403.15227-1-thuth@redhat.com>
Message-ID: <c1927c74-da26-a17d-e92e-1e052540733f@redhat.com>
Date: Sat, 5 Sep 2020 14:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200805185403.15227-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/05 07:24:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2020 20.54, Thomas Huth wrote:
> The total runtime of all Travis jobs is very long and we are testing
> all softmmu targets in the gitlab-CI already - so we can speed up the
> Travis testing a little bit by not testing the softmmu targets here
> anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Well, ok, we do not test all the softmmu targets on gitlab-CI with
>  that same ancient version of Ubuntu ... but do we still care about
>  testing all softmmut targets on Ubuntu Xenial at all? ... at least
>  according to our support policy, we do not care about Xenial anymore.
> 
>  .travis.yml | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 6695c0620f..18290bc51d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -123,20 +123,6 @@ jobs:
>          - CONFIG="--disable-system --static"
>          - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
>  
> -
> -    # we split the system builds as it takes a while to build them all
> -    - name: "GCC (main-softmmu)"
> -      env:
> -        - CONFIG="--disable-user --target-list=${MAIN_SOFTMMU_TARGETS}"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -
> -
> -    - name: "GCC (other-softmmu)"
> -      env:
> -       - CONFIG="--disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
> -        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
> -
> -
>      # Just build tools and run minimal unit and softfloat checks
>      - name: "GCC check-softfloat (user)"
>        env:
> 

Ping?

 Thomas


