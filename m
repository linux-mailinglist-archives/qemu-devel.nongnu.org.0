Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D4D380980
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:29:44 +0200 (CEST)
Received: from localhost ([::1]:39768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWwp-0004O4-I9
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWrG-0003Xw-6u
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:23:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWrE-0000d2-8G
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620995035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw8W0wkcJ4B3xKS9hYTbh5IeF82M98XxtgK0AXV6q0w=;
 b=YIRlwohYch0x84KQsZYbTikN3XzTou1X1/tM/AsacmYbbKOHADbWg9et/oafZrfGGTX+Ad
 lhUcu5B3k9z3QW5lWkz9vRlIUyG88UQxcSOulD6bjOcXL/t9YP5zjutDTegFCjqCPeRFjP
 2p+Wu/Bb7kMqJyCRUjhfXdpPEF+0rxI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-4lOE8crFNdK28l5Z7czXkA-1; Fri, 14 May 2021 08:23:54 -0400
X-MC-Unique: 4lOE8crFNdK28l5Z7czXkA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j128-20020a1c55860000b02901384b712094so1037310wmb.2
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 05:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lw8W0wkcJ4B3xKS9hYTbh5IeF82M98XxtgK0AXV6q0w=;
 b=tyDlF51xtgdoJ0b+fJmmyX91IDUVst8Pl7/f8xLUk9PAX8SYvpGFrDnNAyYl8JQDVx
 0sM383ydhXZQuuIpItdruNa+jBimQ5Iec1KtZ/0Bkb+3XWscpm1LezQGq/HHgCKX+KTn
 lqee9xvrRt92Dw7HE/foa/kWCm3VUEAgxb9btZfnMavD4GsqfqwGXa1MWr8xdB40bj9v
 xdrDKfB8U/2WksS4EU6Z7VJ/ZjUhQdPe73jqW00u3uwadWeGHk6ELwu4+VnPk63ZYc1W
 Dhd9NBStDospi0bvi4G8ARf93cb4H+s1H3AyycL+iOTc/N4W9mwt3z6ZrK8aMXepWO9T
 OxIg==
X-Gm-Message-State: AOAM532R+rCqhtmawzA0Z7eeTJhwIV+qp1tpE9/0Egmq3Wh7sUSUJcsV
 dcKmUOk3qsYg0ptzEgM43Ovk3gea56N27MySy3n9YXTjhg+zieJ2zo2/attUaZaH8pi2+7J6CuK
 U2zzXx4WEdS6Dq5Q=
X-Received: by 2002:a1c:c206:: with SMTP id s6mr9586799wmf.47.1620995032847;
 Fri, 14 May 2021 05:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIDR95+6RBYph20EFU12tF/pfIQeaUnymcQJbLmBnzYHKjiL5uqCUYbtHWP8xIIUQhfF2zsA==
X-Received: by 2002:a1c:c206:: with SMTP id s6mr9586775wmf.47.1620995032649;
 Fri, 14 May 2021 05:23:52 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83cd9.dip0.t-ipconnect.de.
 [217.232.60.217])
 by smtp.gmail.com with ESMTPSA id o13sm5225265wmh.34.2021.05.14.05.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 05:23:52 -0700 (PDT)
Subject: Re: [PATCH v2 05/12] crypto: bump min gcrypt to 1.8.0, dropping
 RHEL-7 support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210514120415.1368922-1-berrange@redhat.com>
 <20210514120415.1368922-6-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ac161007-8b05-fa5e-2f8d-d757f91f1fde@redhat.com>
Date: Fri, 14 May 2021 14:23:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514120415.1368922-6-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/2021 14.04, Daniel P. Berrangé wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. This lets us increment the minimum required gcrypt version and
> assume that HMAC is always supported
> 
> Per repology, current shipping versions are:
> 
>               RHEL-8: 1.8.5
>        Debian Buster: 1.8.4
>   openSUSE Leap 15.2: 1.8.2
>     Ubuntu LTS 18.04: 1.8.1
>     Ubuntu LTS 20.04: 1.8.5
>              FreeBSD: 1.9.2
>            Fedora 33: 1.8.6
>            Fedora 34: 1.9.3
>              OpenBSD: 1.9.3
>       macOS HomeBrew: 1.9.3
> 
> Ubuntu LTS 18.04 has the oldest version and so 1.8.0 is the new minimum.

Maybe add a note why 1.8.0 and not 1.8.1 ? (if I see it correctly, the 
configure script does not check for the third digit?)

> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.yml     | 10 ----------
>   configure          | 18 +-----------------
>   crypto/meson.build |  6 +-----
>   3 files changed, 2 insertions(+), 32 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index f012b16b79..f44c5b08ef 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -707,16 +707,6 @@ build-coroutine-sigaltstack:
>   #
>   # These jobs test old gcrypt and nettle from RHEL7
>   # which had some API differences.
> -crypto-old-gcrypt:
> -  <<: *native_build_job_definition
> -  needs:
> -    job: amd64-centos7-container
> -  variables:
> -    IMAGE: centos7
> -    TARGETS: x86_64-softmmu x86_64-linux-user
> -    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
> -    MAKE_CHECK_ARGS: check
> -
>   crypto-only-gnutls:
>     <<: *native_build_job_definition
>     needs:
> diff --git a/configure b/configure
> index 050299290d..f077cdb9c3 100755
> --- a/configure
> +++ b/configure
> @@ -426,7 +426,6 @@ gnutls="$default_feature"
>   nettle="$default_feature"
>   nettle_xts="no"
>   gcrypt="$default_feature"
> -gcrypt_hmac="no"
>   gcrypt_xts="no"
>   qemu_private_xts="yes"
>   auth_pam="$default_feature"
> @@ -2849,7 +2848,7 @@ has_libgcrypt() {
>       maj=`libgcrypt-config --version | awk -F . '{print $1}'`
>       min=`libgcrypt-config --version | awk -F . '{print $2}'`
>   
> -    if test $maj != 1 || test $min -lt 5
> +    if test $maj != 1 || test $min -lt 8
>       then
>          return 1
>       fi
> @@ -2915,18 +2914,6 @@ if test "$gcrypt" != "no"; then
>           gcrypt="yes"
>           cat > $TMPC << EOF
>   #include <gcrypt.h>
> -int main(void) {
> -  gcry_mac_hd_t handle;
> -  gcry_mac_open(&handle, GCRY_MAC_HMAC_MD5,
> -                GCRY_MAC_FLAG_SECURE, NULL);
> -  return 0;
> -}
> -EOF
> -        if compile_prog "$gcrypt_cflags" "$gcrypt_libs" ; then
> -            gcrypt_hmac=yes
> -        fi
> -        cat > $TMPC << EOF
> -#include <gcrypt.h>
>   int main(void) {
>     gcry_cipher_hd_t handle;
>     gcry_cipher_open(&handle, GCRY_CIPHER_AES, GCRY_CIPHER_MODE_XTS, 0);
> @@ -5722,9 +5709,6 @@ if test "$gnutls" = "yes" ; then
>   fi
>   if test "$gcrypt" = "yes" ; then
>     echo "CONFIG_GCRYPT=y" >> $config_host_mak
> -  if test "$gcrypt_hmac" = "yes" ; then
> -    echo "CONFIG_GCRYPT_HMAC=y" >> $config_host_mak
> -  fi
>     echo "GCRYPT_CFLAGS=$gcrypt_cflags" >> $config_host_mak
>     echo "GCRYPT_LIBS=$gcrypt_libs" >> $config_host_mak
>   fi
> diff --git a/crypto/meson.build b/crypto/meson.build
> index 7f37b5d335..af7e80c6f6 100644
> --- a/crypto/meson.build
> +++ b/crypto/meson.build
> @@ -26,11 +26,7 @@ if 'CONFIG_NETTLE' in config_host
>     crypto_ss.add(files('hash-nettle.c', 'hmac-nettle.c', 'pbkdf-nettle.c'))
>   elif 'CONFIG_GCRYPT' in config_host
>     crypto_ss.add(files('hash-gcrypt.c', 'pbkdf-gcrypt.c'))
> -  if 'CONFIG_GCRYPT_HMAC' in config_host
> -    crypto_ss.add(files('hmac-gcrypt.c'))
> -  else
> -    crypto_ss.add(files('hmac-glib.c'))
> -  endif
> +  crypto_ss.add(files('hmac-gcrypt.c'))
> 

I think you could also add it to the previous line (as it is done with 
nettle) instead of adding it in a separate line. But well, that's just 
cosmetics, so either way:

Reviewed-by: Thomas Huth <thuth@redhat.com>


