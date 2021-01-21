Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56D2FF324
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:28:36 +0100 (CET)
Received: from localhost ([::1]:35182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eh9-00033b-RA
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2eeX-00021w-BK
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2eeV-0004a8-K0
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611253550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAUC6q2n5TlbRx77N/7tjCJ30lqltE0ShlWuu7E+MJI=;
 b=gkB8fPDjyqNd93rr3eYdzJcTIzgwM/joav7haTdBslmOQ6FTg7l2dgGPKtfakuj5NDdAiT
 nqA35zbh4jSNjDia9K+k3w/K8vfzRd53e4Tibuig85Fmpm3kgX/nbMbhM8Auba3DCKtWxY
 7qIyyAqT/qVXOC7t/SJxSSefarRYB0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-XuSn2iq7Ol2hjOLTsV1ljw-1; Thu, 21 Jan 2021 13:25:43 -0500
X-MC-Unique: XuSn2iq7Ol2hjOLTsV1ljw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38A34107ACF6;
 Thu, 21 Jan 2021 18:25:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDCB939A60;
 Thu, 21 Jan 2021 18:25:36 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] gitlab-ci: Test building linux-user targets on
 CentOS 7
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210121172829.1643620-1-f4bug@amsat.org>
 <20210121172829.1643620-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e20c7820-5aff-90fa-1c7d-e909ca2e5817@redhat.com>
Date: Thu, 21 Jan 2021 19:25:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121172829.1643620-3-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2021 18.28, Philippe Mathieu-Daudé wrote:
> Add a configuration tested by Peter Maydell (see [1] and [2])
> but not covered in our CI [3]:
> 
>    [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>    FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>    ../linux-user/strace.c: In function 'do_print_sockopt':
>    ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undeclared (first use in this function)
>             case IPV6_ADDR_PREFERENCES:
>                  ^
> 
> This job currently takes 31 minutes 32 seconds ([4]).
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05086.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05379.html
> [3] https://gitlab.com/philmd/qemu/-/jobs/977408284
> [4] https://gitlab.com/philmd/qemu/-/jobs/978223286
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.yml | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index de3a3d25b58..af4d74757d8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -411,6 +411,13 @@ build-user-plugins:
>       MAKE_CHECK_ARGS: check-tcg
>     timeout: 1h 30m
>   
> +build-user-centos7:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: centos7
> +    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
> +    MAKE_CHECK_ARGS: check-tcg
> +
>   build-some-softmmu-plugins:
>     <<: *native_build_job_definition
>     variables:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


