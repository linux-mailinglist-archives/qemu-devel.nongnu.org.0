Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF2E2F84E0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:56:51 +0100 (CET)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0UHB-0001GB-Rt
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:56:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0UFj-0000e2-SI
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l0UFg-0000oc-LQ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 13:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610736915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f81yDSX7HW175HJLHXFcSZjiiNRW9hx3kW64e5uMZT0=;
 b=df3xNu8XlY3LPcGvMwpxPDXscn9qtTrqg4w7ITJfOKUmLZP6qkre4TX8dWTJONitFIlsBd
 yk0L9YxNlqA2KHD7Ou+7MmyR1EZU7ZH+XkpptSXIjODdoFFV+NYp/CqzWefh/BE+Ir9JfN
 QYNPQ++4JcHQ9DuOqudRQZrrvujuQts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-Yb7tlQOqNgO3xpiPSXGmKg-1; Fri, 15 Jan 2021 13:55:13 -0500
X-MC-Unique: Yb7tlQOqNgO3xpiPSXGmKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA975CE642;
 Fri, 15 Jan 2021 18:55:11 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B4896B8DD;
 Fri, 15 Jan 2021 18:55:07 +0000 (UTC)
Subject: Re: [PATCH v2 10/25] tests/docker: fix mistakes in ubuntu package
 lists
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-11-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <45f4d399-5ed4-9343-3945-495353704395@redhat.com>
Date: Fri, 15 Jan 2021 15:55:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-11-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/14/21 10:02 AM, Daniel P. Berrangé wrote:
> librados-dev is not required by QEMU directly, only librbd-dev.
>
> glusterfs-common is not directly needed by QEMU.
>
> QEMU uses ncursesw only on non-Windows hosts.
>
> The clang package is clang 10.
>
> flex and bison are not required by QEMU.
>
> Standardize on nmap ncat implementation to match Fedora/CentOS.
>
> vim-nox is preferred over vim as it is smaller and graphics aren't
> needed in containers.


Maybe just remove vim as it isn't required for build/tests?

Anyway,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/docker/dockerfiles/ubuntu1804.docker |  3 ---
>   tests/docker/dockerfiles/ubuntu2004.docker | 11 +++--------
>   2 files changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> index 58a373e205..f063cfe921 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -5,7 +5,6 @@ ENV PACKAGES \
>       gcc \
>       gettext \
>       git \
> -    glusterfs-common \
>       libaio-dev \
>       libattr1-dev \
>       libbrlapi-dev \
> @@ -23,12 +22,10 @@ ENV PACKAGES \
>       libjemalloc-dev \
>       libjpeg-turbo8-dev \
>       liblzo2-dev \
> -    libncurses5-dev \
>       libncursesw5-dev \
>       libnfs-dev \
>       libnuma-dev \
>       libpixman-1-dev \
> -    librados-dev \
>       librbd-dev \
>       librdmacm-dev \
>       libsasl2-dev \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 2bb7e2ab1e..84c617354c 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -1,14 +1,11 @@
>   FROM docker.io/library/ubuntu:20.04
>   ENV PACKAGES \
> -    bison \
>       ccache \
> -    clang-10\
> -    flex \
> +    clang \
>       gcc \
>       genisoimage \
>       gettext \
>       git \
> -    glusterfs-common \
>       libaio-dev \
>       libattr1-dev \
>       libbrlapi-dev \
> @@ -27,12 +24,10 @@ ENV PACKAGES \
>       libjpeg-turbo8-dev \
>       liblttng-ust-dev \
>       liblzo2-dev \
> -    libncurses5-dev \
>       libncursesw5-dev \
>       libnfs-dev \
>       libnuma-dev \
>       libpixman-1-dev \
> -    librados-dev \
>       librbd-dev \
>       librdmacm-dev \
>       libsasl2-dev \
> @@ -49,7 +44,7 @@ ENV PACKAGES \
>       libxen-dev \
>       libzstd-dev \
>       make \
> -    netcat-openbsd \
> +    ncat \
>       ninja-build \
>       python3-numpy \
>       python3-opencv \
> @@ -62,7 +57,7 @@ ENV PACKAGES \
>       sparse \
>       tesseract-ocr \
>       tesseract-ocr-eng \
> -    vim \
> +    vim-nox \
>       xfslibs-dev
>   RUN apt-get update && \
>       DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES


