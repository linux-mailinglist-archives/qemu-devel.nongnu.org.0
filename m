Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C772F5485
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 22:19:33 +0100 (CET)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kznYC-0005HF-2u
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 16:19:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kznWw-0004Q0-6t
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kznWs-0000fG-IR
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 16:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610572688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytaxweWtK/HzXnloViCjGmCYsLxkl0CiL6N50SFrd0M=;
 b=QsgrWsbOTiv01ujjxZ2DBFu7dWn2LjPSqLsgzhHHcmZRKPEs4WjOeYsZ/ze9InbtLFwMt1
 MnTPN5euWOqp58c2q5Qyfhi1xQD3Szlc6MBl4vXpE+tbzSXyONUIoAKbGrP0Z9oUrjgFa8
 7LXPXxsOFIURj5hBEjZwfa+d7SnH094=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-uzNwpbcAOtSZAb_oAUGiUw-1; Wed, 13 Jan 2021 16:18:02 -0500
X-MC-Unique: uzNwpbcAOtSZAb_oAUGiUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAD04190D346;
 Wed, 13 Jan 2021 21:18:00 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-88.gru2.redhat.com
 [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0886C1F424;
 Wed, 13 Jan 2021 21:17:56 +0000 (UTC)
Subject: Re: [PATCH 03/23] tests/docker: use project specific container
 registries
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-4-berrange@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <78c33963-83d0-4238-bbf3-cbc47d9adefc@redhat.com>
Date: Wed, 13 Jan 2021 18:17:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201171825.2243775-4-berrange@redhat.com>
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

Hi,

On 12/1/20 2:18 PM, Daniel P. Berrangé wrote:
> Since Docker Hub has started to enforce pull rate limits on clients, it
> is preferrable to use project specific container registries where they
> are available. Both Fedora and CentOS provide such registries.
>
> The images in these registries are also refreshed on a more regular
> basis than the ones in docker hub, so the package update should
> generally be faster.
>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/docker/dockerfiles/centos7.docker            | 2 +-
>   tests/docker/dockerfiles/centos8.docker            | 2 +-
>   tests/docker/dockerfiles/fedora-cris-cross.docker  | 2 +-
>   tests/docker/dockerfiles/fedora-i386-cross.docker  | 2 +-
>   tests/docker/dockerfiles/fedora-win32-cross.docker | 2 +-
>   tests/docker/dockerfiles/fedora-win64-cross.docker | 2 +-
>   tests/docker/dockerfiles/fedora.docker             | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)

I didn't find in Fedora's containers documents [1] if they have a policy 
on how long to retain old images (e.g. versions which reached EOL), and 
I didn't check CentOS's. Other than that,

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

[1] https://docs.fedoraproject.org/en-US/containers/

>
> diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
> index d47c96135c..35445becb8 100644
> --- a/tests/docker/dockerfiles/centos7.docker
> +++ b/tests/docker/dockerfiles/centos7.docker
> @@ -1,4 +1,4 @@
> -FROM centos:7
> +FROM registry.centos.org/centos:7
>   RUN yum install -y epel-release centos-release-xen-48
>   
>   RUN yum -y update
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> index bbd82421db..9560bb06e2 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -1,4 +1,4 @@
> -FROM centos:8.1.1911
> +FROM registry.centos.org/centos:8
>   
>   RUN dnf -y update
>   ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora-cris-cross.docker b/tests/docker/dockerfiles/fedora-cris-cross.docker
> index 09e7e449f9..b7f02d18d3 100644
> --- a/tests/docker/dockerfiles/fedora-cris-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-cris-cross.docker
> @@ -2,7 +2,7 @@
>   # Cross compiler for cris system tests
>   #
>   
> -FROM fedora:30
> +FROM registry.fedoraproject.org/fedora:30
>   ENV PACKAGES gcc-cris-linux-gnu
>   RUN dnf install -y $PACKAGES
>   RUN rpm -q $PACKAGES | sort > /packages.txt
> diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
> index cd16cd1bfa..d10586c79e 100644
> --- a/tests/docker/dockerfiles/fedora-i386-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:30
> +FROM registry.fedoraproject.org/fedora:30
>   ENV PACKAGES \
>       gcc \
>       glib2-devel.i686 \
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
> index 087df598a0..8dc4f0d4c9 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM registry.fedoraproject.org/fedora:32
>   
>   # Please keep this list sorted alphabetically
>   ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
> index d5d2f5f00d..c530e6ba36 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM registry.fedoraproject.org/fedora:32
>   
>   # Please keep this list sorted alphabetically
>   ENV PACKAGES \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 19e7a3d28a..0bc66f7293 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -1,4 +1,4 @@
> -FROM fedora:32
> +FROM registry.fedoraproject.org/fedora:32
>   
>   # Please keep this list sorted alphabetically
>   ENV PACKAGES \


