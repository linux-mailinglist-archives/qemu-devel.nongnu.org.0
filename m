Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9B2FF337
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:33:09 +0100 (CET)
Received: from localhost ([::1]:43758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2elX-0006y1-Im
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:33:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2ejg-0005fx-Gn
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:31:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l2eje-0006kg-Ji
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611253869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14ulxO2mmCeyCk5rz8dPrztr7yOAKF1FQrrMeDvZrY8=;
 b=JWjtz9bLp4SDf/QP86ct2JEK5jiXZTb6eXn7BwyuZ8zbAW20sJ7D5iNIMJ4L/XEv6Uis8q
 R5ZaT/BOEU4zrM2aBz2YDd8tEyvhFp6SBm0dtArjJF0sIaJkYds1p69cpuZIQShxYgxq6W
 1js0jwfPs/pfX13ItTL9EL2hhK0NsbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-Yy5nTl2UPS2hTB8xIbteqA-1; Thu, 21 Jan 2021 13:31:07 -0500
X-MC-Unique: Yy5nTl2UPS2hTB8xIbteqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9296380DDFB;
 Thu, 21 Jan 2021 18:31:06 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CACFB722D8;
 Thu, 21 Jan 2021 18:30:51 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] tests/docker: Install static libc package in
 CentOS 7
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210121172829.1643620-1-f4bug@amsat.org>
 <20210121172829.1643620-2-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <29818f10-acb6-4e7e-6e55-8bd3b5c83076@redhat.com>
Date: Thu, 21 Jan 2021 15:30:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210121172829.1643620-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/21/21 2:28 PM, Philippe Mathieu-Daudé wrote:
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


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


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


