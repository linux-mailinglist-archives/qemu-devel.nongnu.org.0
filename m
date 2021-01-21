Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F82FF346
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:38:39 +0100 (CET)
Received: from localhost ([::1]:53316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eqs-0002mm-4H
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2emQ-00009W-Ez
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:34:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2emO-0007ut-KX
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611254036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T24OhIgxgsPX4PXLosPK3jlBvuiXoG45VhzzGlWNuGY=;
 b=PSeH5OgS1rK7xZF7PVV85yTqrqIsoIgOaLPayjFN53LWBF9rKQVZpW08osH38xo+36cLxQ
 Md4k684TTesE303sZ+3xSU2dRjxP9AmU/97w248Ol3TZe6IQh5eVBuVpKK5GFKwFxveO/r
 LorasPuisl0b4Mn7+PW3/OZDhehN1pY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-u9-Q4zcqNhGZ2TfNpSPIoQ-1; Thu, 21 Jan 2021 13:33:54 -0500
X-MC-Unique: u9-Q4zcqNhGZ2TfNpSPIoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E816190B2A2;
 Thu, 21 Jan 2021 18:33:53 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 532935D9C6;
 Thu, 21 Jan 2021 18:33:47 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] gitlab-ci: Test building linux-user targets on
 CentOS 7
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210121172829.1643620-1-f4bug@amsat.org>
 <20210121172829.1643620-3-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <2a99a9f1-ca8d-d596-7501-3c5a9546bda7@redhat.com>
Date: Thu, 21 Jan 2021 15:33:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210121172829.1643620-3-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/21/21 2:28 PM, Philippe Mathieu-Daudé wrote:
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


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


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


