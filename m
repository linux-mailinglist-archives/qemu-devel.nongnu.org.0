Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E922FF325
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:29:26 +0100 (CET)
Received: from localhost ([::1]:36196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ehx-0003Um-QE
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2eeC-0001mD-7u
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:25:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2ee5-0004Qe-QH
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611253522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEPdWD1RzdrhzaYPQxlhdUqW4g0dXTtYvYxr7bHkwlo=;
 b=M9k2BxMTd100XhmBMHKWlxjMZzgZfKwJipN5SSItvAP12tX0uEtAMJEdHRpbF2sIRaHeH/
 zEIcJ9JePDq/Rpd51Z6lcIs1e/MAaDPIS0mEXozJygYpoFsNIMqkqao43dkkU9xRy5x8dS
 6WjPcpnPEXg8ju/rqCfNIMr8hcWN8D4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Wb_abIryOsiVk6qVRUuXbQ-1; Thu, 21 Jan 2021 13:25:21 -0500
X-MC-Unique: Wb_abIryOsiVk6qVRUuXbQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBBB7180A08A;
 Thu, 21 Jan 2021 18:25:19 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-82.ams2.redhat.com [10.36.112.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C74B6E520;
 Thu, 21 Jan 2021 18:25:14 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] tests/docker: Install static libc package in
 CentOS 7
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210121172829.1643620-1-f4bug@amsat.org>
 <20210121172829.1643620-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <496212b8-06df-f832-731a-7cb94d9dc6ae@redhat.com>
Date: Thu, 21 Jan 2021 19:25:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121172829.1643620-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2021 18.28, Philippe Mathieu-Daudé wrote:
> We need to install the static libc package to be able to run
> the TCG tests:
> 
>    $ make check-tcg
>    ...
>      BUILD   TCG tests for x86_64-softmmu
>      BUILD   x86_64-softmmu guest-tests with cc
>    /usr/bin/ld: hello: warning: allocated section `.notes' not in segment
>    /usr/bin/ld: memory: warning: allocated section `.notes' not in segment
>      BUILD   TCG tests for x86_64-linux-user
>      BUILD   x86_64-linux-user guest-tests with cc
>    /usr/bin/ld: cannot find -lpthread
>    /usr/bin/ld: cannot find -lc
>    collect2: error: ld returned 1 exit status
>    make[2]: *** [threadcount] Error 1
>    make[1]: *** [cross-build-guest-tests] Error 2
>    make: *** [build-tcg-tests-x86_64-linux-user] Error 2
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/docker/dockerfiles/centos7.docker | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
> index 6f11af1989e..75fdb53c7c0 100644
> --- a/tests/docker/dockerfiles/centos7.docker
> +++ b/tests/docker/dockerfiles/centos7.docker
> @@ -15,6 +15,7 @@ ENV PACKAGES \
>       gettext \
>       git \
>       glib2-devel \
> +    glibc-static \
>       gnutls-devel \
>       libaio-devel \
>       libepoxy-devel \

Reviewed-by: Thomas Huth <thuth@redhat.com>


