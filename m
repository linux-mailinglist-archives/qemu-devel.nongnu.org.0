Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64AD6E1FA2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 11:47:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnG02-0005eo-UB; Fri, 14 Apr 2023 05:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pnFzo-0005eH-Kk
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 05:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pnFzb-0002C1-4Q
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 05:45:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681465503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opoIFs1LrNpWS7fyVRJuOi5JVfwtK9AaG1zj4MpFtxA=;
 b=flDzyeq1KZ/UWtjmPfOMx5U0tsBisNjeAD3uWS8q5lS65TZ682beXL8U/xBVtidCzE1vXi
 ZYBe3Fx8ODnNeAjiflb6JRzv5U3/h4RPvjBPi9Lj4pxFdbqD4gNVUNOh1uUB2sP1swhw6n
 87ikrXGMrq8Cd7TL6082P4x8lmsTVhE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-hYJkyu0XNpOyDyCLu3rtYg-1; Fri, 14 Apr 2023 05:45:01 -0400
X-MC-Unique: hYJkyu0XNpOyDyCLu3rtYg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a355c9028so262435666b.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 02:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681465501; x=1684057501;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=opoIFs1LrNpWS7fyVRJuOi5JVfwtK9AaG1zj4MpFtxA=;
 b=RrGtZDx+0GXx0HCiZkpbHGGAmcTk2v+PvCSHdTF2trZE/lIv8cx6BkpIwPWEKlDICp
 AvXtgppQ84kIA37T5VhfZ0g5Px0TWXG9qMb6HCFZ03bbxGeEzbCMVoZKyGR4Q+si+J2R
 sTUcZeh4m+YfXFF8nfYi5UogsZ2rZ0ARCPadzbrVEkuusYZalV4wDqCi9fNbQ98+bZSX
 NUcHUqjolEs9GOeAgc8nZH3qPeDJm+mjk+PegWf4Pqe3WKhFcPuzdrJ05dWu8iKJ+lre
 xyD1aYrMCnzTXpTxuGlNiGZEA/pGROYIeoxblBNv4MU0nm/xj+Le4R2uZuY/5IHe8/+O
 N6UA==
X-Gm-Message-State: AAQBX9f6zpnFLGW86g+OHA28KORChDMmgnYlUSAdR4c9r5TeAVGiuXFV
 FfQfAacHsUrFq7AE9t7GSLsKfAJDYJZlUzxJYvpteCubm/pHiOJGGCwxw9SgVCDtpDvgurYezct
 lko+/4bAjGZhP+Cw=
X-Received: by 2002:aa7:d8c4:0:b0:506:7f78:c4cc with SMTP id
 k4-20020aa7d8c4000000b005067f78c4ccmr1870410eds.27.1681465500819; 
 Fri, 14 Apr 2023 02:45:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350b4W8u6Us1EOmS7KH+pdpxzoNtuVGOzL5RH+EQICFnssFsV5WtyP9/UqbhsHBDa9K0RQQXyfA==
X-Received: by 2002:aa7:d8c4:0:b0:506:7f78:c4cc with SMTP id
 k4-20020aa7d8c4000000b005067f78c4ccmr1870392eds.27.1681465500426; 
 Fri, 14 Apr 2023 02:45:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 u11-20020aa7d98b000000b004ad601533a3sm1903496eds.55.2023.04.14.02.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 02:44:59 -0700 (PDT)
Message-ID: <602c153e-919a-3a7b-e1da-16eadadbdab8@redhat.com>
Date: Fri, 14 Apr 2023 11:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] tests: lcitool: Switch to OpenSUSE Leap 15.4
Content-Language: en-US
To: Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <23259353a19a8da5277a18168bd911c777265e21.1680268168.git.pkrempa@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <23259353a19a8da5277a18168bd911c777265e21.1680268168.git.pkrempa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/31/23 15:11, Peter Krempa wrote:
> The 15.3 version is EOL now:
> 
> https://get.opensuse.org/leap/15.3
> 
> Switch the dockerfile to 15.4.

As far as I know, 15.4 still has Python 3.6 as the default Python, so 
you need to rename tests/lcitool/targets/opensuse-leap-153.yml and 
adjust tests/lcitool/mappings.yml (changing the 153 in the mappings to 154).

Also, when you send a v2, please include a submodule update as well to 
commit 51dad419.

Paolo

> Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> ---
>   tests/docker/dockerfiles/opensuse-leap.docker | 25 +++++++++----------
>   tests/lcitool/refresh                         |  2 +-
>   2 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
> index 8e9500e443..91a67bfd0d 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -1,10 +1,10 @@
>   # THIS FILE WAS AUTO-GENERATED
>   #
> -#  $ lcitool dockerfile --layers all opensuse-leap-153 qemu
> +#  $ lcitool dockerfile --layers all opensuse-leap-154 qemu
>   #
>   # https://gitlab.com/libvirt/libvirt-ci
> 
> -FROM registry.opensuse.org/opensuse/leap:15.3
> +FROM registry.opensuse.org/opensuse/leap:15.4
> 
>   RUN zypper update -y && \
>       zypper install -y \
> @@ -81,6 +81,7 @@ RUN zypper update -y && \
>              lttng-ust-devel \
>              lzo-devel \
>              make \
> +           meson \
>              mkisofs \
>              ncat \
>              ncurses-devel \
> @@ -89,9 +90,14 @@ RUN zypper update -y && \
>              pam-devel \
>              pcre-devel-static \
>              pkgconfig \
> -           python39-base \
> -           python39-pip \
> -           python39-setuptools \
> +           python3-Pillow \
> +           python3-PyYAML \
> +           python3-Sphinx \
> +           python3-base \
> +           python3-numpy \
> +           python3-opencv \
> +           python3-pip \
> +           python3-sphinx_rtd_theme \
>              rdma-core-devel \
>              rpm \
>              sed \
> @@ -124,18 +130,11 @@ RUN zypper update -y && \
>       ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
>       ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
> 
> -RUN /usr/bin/pip3.9 install \
> -                    PyYAML \
> -                    meson==0.63.2 \
> -                    pillow \
> -                    sphinx \
> -                    sphinx-rtd-theme
> -
>   ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
>   ENV LANG "en_US.UTF-8"
>   ENV MAKE "/usr/bin/make"
>   ENV NINJA "/usr/bin/ninja"
> -ENV PYTHON "/usr/bin/python3.9"
> +ENV PYTHON "/usr/bin/python3"
>   # As a final step configure the user (if env is defined)
>   ARG USER
>   ARG UID
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index c0d7ad5516..b3acd9d6b0 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -120,7 +120,7 @@ try:
>       generate_dockerfile("debian-amd64", "debian-11",
>                           trailer="".join(debian11_extras))
>       generate_dockerfile("fedora", "fedora-37")
> -    generate_dockerfile("opensuse-leap", "opensuse-leap-153")
> +    generate_dockerfile("opensuse-leap", "opensuse-leap-154")
>       generate_dockerfile("ubuntu2004", "ubuntu-2004")
>       generate_dockerfile("ubuntu2204", "ubuntu-2204")
> 


