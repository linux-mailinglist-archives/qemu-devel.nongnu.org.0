Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE27C2F548F
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:24:36 +0100 (CET)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznd5-00036n-S4
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kznav-0001E9-QC
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:22:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kznas-000285-Cp
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610572937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnicx6yA4sNHn0vmtCMghJZyIr3GxqeCiBMxmYJmOQ0=;
 b=EhPV85DEaZpJImvWDDePw/6ilywMPZTo4ZSrsrKazka8Z7K6SKGjOH/p7wtdWUm7IvjlBY
 RRBMkCfOuzoi6Hp0I87mIKJ9oQcvBKeyCw4AB29vCRKpbq4HsrHdMZMyC+nxtjqLgTDUuO
 jIovnk1kvoQ7MHvWlKKSNI19nLqfkWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-TV-Ap82KP56-_TkLuaf6Wg-1; Wed, 13 Jan 2021 16:22:14 -0500
X-MC-Unique: TV-Ap82KP56-_TkLuaf6Wg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27BAF180A095;
 Wed, 13 Jan 2021 21:22:13 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84F231F075;
 Wed, 13 Jan 2021 21:22:09 +0000 (UTC)
Subject: Re: [PATCH 04/23] tests/docker: use explicit docker.io registry
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-5-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <bd510fbe-b011-0450-3789-fb84cf67f446@redhat.com>
Date: Wed, 13 Jan 2021 18:22:07 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201171825.2243775-5-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/1/20 2:18 PM, Daniel P. Berrangé wrote:
> It is good practice to use an explicit registry for referencing the base
> image. This is because some distros will inject their own registries
> into the search path. For example registry.fedoraproject.org comes ahead
> of docker.io. Using an explicit registry avoids wasting time querying
> multiple registries for images that they won't have.
Interesting.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/docker/dockerfiles/debian-xtensa-cross.docker | 2 +-
>   tests/docker/dockerfiles/debian10.docker            | 2 +-
>   tests/docker/dockerfiles/debian11.docker            | 2 +-
>   tests/docker/dockerfiles/ubuntu.docker              | 2 +-
>   tests/docker/dockerfiles/ubuntu1804.docker          | 2 +-
>   tests/docker/dockerfiles/ubuntu2004.docker          | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/tests/docker/dockerfiles/debian-xtensa-cross.docker b/tests/docker/dockerfiles/debian-xtensa-cross.docker
> index ba4148299c..2f11b3b7bc 100644
> --- a/tests/docker/dockerfiles/debian-xtensa-cross.docker
> +++ b/tests/docker/dockerfiles/debian-xtensa-cross.docker
> @@ -5,7 +5,7 @@
>   # using a prebuilt toolchains for Xtensa cores from:
>   # https://github.com/foss-xtensa/toolchain/releases
>   #
> -FROM debian:stretch-slim
> +FROM docker.io/library/debian:stretch-slim
>   
>   RUN apt-get update && \
>       DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
> diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
> index 73a3caac9c..6dc0643b29 100644
> --- a/tests/docker/dockerfiles/debian10.docker
> +++ b/tests/docker/dockerfiles/debian10.docker
> @@ -7,7 +7,7 @@
>   # On its own you can't build much but the docker-foo-cross targets
>   # build on top of the base debian image.
>   #
> -FROM debian:buster-slim
> +FROM docker.io/library/debian:buster-slim
>   
>   # Duplicate deb line as deb-src
>   RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
> diff --git a/tests/docker/dockerfiles/debian11.docker b/tests/docker/dockerfiles/debian11.docker
> index 5adfd62d55..febf884f8f 100644
> --- a/tests/docker/dockerfiles/debian11.docker
> +++ b/tests/docker/dockerfiles/debian11.docker
> @@ -8,7 +8,7 @@
>   # On its own you can't build much but the docker-foo-cross targets
>   # build on top of the base debian image.
>   #
> -FROM debian:bullseye-slim
> +FROM docker.io/library/debian:bullseye-slim
>   
>   # Duplicate deb line as deb-src
>   RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
> diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
> index 9dec1c4bc6..ef44b0e360 100644
> --- a/tests/docker/dockerfiles/ubuntu.docker
> +++ b/tests/docker/dockerfiles/ubuntu.docker
> @@ -9,7 +9,7 @@
>   # system won't pick up that it has changed.
>   #
>   
> -FROM ubuntu:20.04
> +FROM docker.io/library/ubuntu:20.04
>   ENV PACKAGES \
>       ccache \
>       clang \
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> index aacea8627a..751e6503f8 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -1,4 +1,4 @@
> -FROM ubuntu:18.04
> +FROM docker.io/library/ubuntu:18.04
>   ENV PACKAGES \
>       ccache \
>       clang \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 52810d4e27..32caf57b5d 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -1,4 +1,4 @@
> -FROM ubuntu:20.04
> +FROM docker.io/library/ubuntu:20.04
>   ENV PACKAGES flex bison \
>       ccache \
>       clang-10\


