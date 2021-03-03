Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9459A32B8BB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:52:23 +0100 (CET)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSrO-0001Ri-Jz
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:52:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHSqC-0000ZT-Qg
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:51:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHSqB-0003q5-9O
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:51:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614783066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NSMkY7fjnp+ttodWCm0YErVZu7YRlsswoIEOe16lMAM=;
 b=BozUe5KEpmkybIKWyNAUH4mw0GbgU26hP9yWPyJ65opg6jdvodM0ioUK9N6648LJJDPLta
 go80H08Mdtc9IsyLG3IWa77DllxpOab6sx+RLJgK8tIZ91WYaVTyI4cMPmiJp7mkfIugBY
 ivEiFn04u/NZEUps4T9vMacE1ZlZ2+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-tN3_65LQOMOlufERkkcBbQ-1; Wed, 03 Mar 2021 09:51:04 -0500
X-MC-Unique: tN3_65LQOMOlufERkkcBbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112A2107ACE3
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 14:51:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A28910016FD
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 14:51:03 +0000 (UTC)
To: qemu-devel@nongnu.org
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-14-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 13/25] tests/docker: expand centos7 package list
Message-ID: <3baf6615-f5d9-396f-98aa-ebe8d0414f46@redhat.com>
Date: Wed, 3 Mar 2021 15:51:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210114130245.1654081-14-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/01/2021 14.02, Daniel P. Berrangé wrote:
> This is the fully expanded list of build pre-requisites QEMU can
> conceivably use in any scenario.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/docker/dockerfiles/centos7.docker | 58 +++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
> index 1eb3455144..d2daaae25b 100644
> --- a/tests/docker/dockerfiles/centos7.docker
> +++ b/tests/docker/dockerfiles/centos7.docker
> @@ -6,37 +6,95 @@ RUN yum -y update
>   # Please keep this list sorted alphabetically
>   ENV PACKAGES \
>       SDL2-devel \
> +    alsa-lib-devel \
> +    bc \

Why is bc suddenly required now?

> +    brlapi-devel \
>       bzip2 \
>       bzip2-devel \
> +    ca-certificates \
> +    capstone-devel \

capstone in Centos 7 is definitely too old - we need >= 4.0 now, and Centos 
7 still uses 3.0 if I've got that right.

>       ccache \
> +    clang \
> +    cyrus-sasl-devel \
> +    daxctl-devel \
>       dbus \
> +    device-mapper-multipath-devel \
> +    diffutils \
> +    findutils \
>       gcc \
>       gcc-c++ \
> +    genisoimage \
>       gettext \
>       git \
>       glib2-devel \
> +    glibc-common \
> +    glusterfs-api-devel \
>       gnutls-devel \
> +    gtk3-devel \
> +    hostname \
>       libaio-devel \
> +    libasan \
> +    libattr-devel \
>       libcacard-devel \
> +    libcap-ng-devel \
> +    libcurl-devel \
> +    libdrm-devel \
>       libepoxy-devel \
>       libfdt-devel \
>       libgcrypt-devel \
> +    libiscsi-devel \
> +    libjpeg-devel \
> +    libnfs-devel \
> +    libpmem-devel \
> +    libpng-devel \
> +    librbd1-devel \
> +    libseccomp-devel \
> +    libssh-devel \
> +    libtasn1-devel \
> +    libudev-devel \
> +    libusbx-devel \
> +    libxml2-devel \
>       libzstd-devel \
>       lzo-devel \
>       make \
>       mesa-libgbm-devel \
> +    ncurses-devel \
>       nettle-devel \
>       ninja-build \
> +    nmap-ncat \
> +    numactl-devel \
> +    openssh-clients \
> +    pam-devel \
> +    perl \
>       perl-Test-Harness \
>       pixman-devel \
> +    pkgconfig \
> +    pulseaudio-libs-devel \
>       python3 \
> +    python3-PyYAML \
> +    python3-numpy \
> +    python3-pillow \
> +    python3-pip \
> +    python3-setuptools \
> +    python3-sphinx \
> +    python3-virtualenv \
> +    python3-wheel \
>       rdma-core-devel \
> +    rpm \

Why rpm ?

> +    sed \

Do we really need to specify sed separately?

>       snappy-devel \
>       spice-protocol \
>       spice-server-devel \
> +    systemd-devel \
> +    systemtap-sdt-devel \
>       tar \
> +    texinfo \
> +    usbredir-devel \
> +    vim-minimal \

vim? Why that?

>       vte291-devel \
> +    which \
>       xen-devel \
> +    xfsprogs-devel \
>       zlib-devel
>   RUN yum install -y $PACKAGES
>   RUN rpm -q $PACKAGES | sort > /packages.txt
> 

  Thomas


