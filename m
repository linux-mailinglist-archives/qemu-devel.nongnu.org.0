Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D15152FE9E1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:22:43 +0100 (CET)
Received: from localhost ([::1]:38610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Yz4-0007yv-TH
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2YvG-0003Lh-RW
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:18:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2YvE-0006J6-SX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:18:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611231523;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IlEBheV0ysKX1EQ8atAP9JjmSAp4ZR/RAIVRkEtooXw=;
 b=aZtPBoQ1RI33yIKdvGilD+LM1FChnkaenzhDHSUmLO975H//vZpAMGWiDEeMjUtBa29nGc
 2JLzpoaWx5fiOhj/LR2MB7wz0btHDDUnmxeyiIYNftt+yssnfRgj1dLh32mQxz8/xwSMjP
 u3xvfuE0LneSqGcEeRiB/HwYW6yeVhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-bjilAo-pN6eKfN3uQC-qng-1; Thu, 21 Jan 2021 07:18:41 -0500
X-MC-Unique: bjilAo-pN6eKfN3uQC-qng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B7458042B4;
 Thu, 21 Jan 2021 12:18:40 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62DCB10021B3;
 Thu, 21 Jan 2021 12:18:35 +0000 (UTC)
Date: Thu, 21 Jan 2021 12:18:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] gitlab-ci: Test building linux-user targets on CentOS 7
Message-ID: <20210121121832.GM3125227@redhat.com>
References: <20210121121505.1523156-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210121121505.1523156-1-f4bug@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 01:15:05PM +0100, Philippe Mathieu-Daudé wrote:
> Add a configuration tested by Peter Maydell (see [1] and [2])
> but not covered in our CI [3]:
> 
>   [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>   FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>   ../linux-user/strace.c: In function 'do_print_sockopt':
>   ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undeclared (first use in this function)
>            case IPV6_ADDR_PREFERENCES:
>                 ^

Yes, makes sense as centos is our oldest distro and thus likely
to see issues missed from newer OS distros.

> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05086.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05379.html
> [3] https://gitlab.com/philmd/qemu/-/jobs/977408284:
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitlab-ci.yml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 203b1671c43..ce52d6cb2cb 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -378,6 +378,13 @@ build-user-plugins:
>      MAKE_CHECK_ARGS: check-tcg
>    timeout: 1h 30m
>  
> +build-user-centos7:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: centos7
> +    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
> +    MAKE_CHECK_ARGS: check-tcg
> +

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


