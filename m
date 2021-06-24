Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4763B2A6A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:32:43 +0200 (CEST)
Received: from localhost ([::1]:49892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKmw-00038b-6a
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:32:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lwKlp-0002TL-CI
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:31:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lwKlk-0008St-WD
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYmhikF134EwdJTJnbyh5Gwx72dVRe9PVHYaF5wgClk=;
 b=CXYERueY9UBJ9nFS3HIgYET+MJ/5tsb0ZwYp55JsPEMBe2edNM7v+UOGYhHZ6YU8I4xD3h
 nQKncdrPN2dWZnKHDfDxn/VHYf+OUadx7IV7P15bmmXsx8Bt/HBzPJK4DZVKUbw8boM58l
 aMA9yZ3JWKaRPyijszbL4SDWHKY7Q9I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-tOUtSHC7MyKCRf3oH-KfSQ-1; Thu, 24 Jun 2021 04:31:25 -0400
X-MC-Unique: tOUtSHC7MyKCRf3oH-KfSQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 s80-20020a1ca9530000b02901cff732fde5so1348989wme.6
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 01:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WYmhikF134EwdJTJnbyh5Gwx72dVRe9PVHYaF5wgClk=;
 b=H2KVuToYsB1tcjZfv5VZ4N0b6vqt6IM8A7PQ0ygg7w8gQRsmHVAeFrWfvO5jnFaA0k
 QgLf6KMaPVvXqhufKcf+d/Rx/KsrC5IHtdLNufRY7B1FpVHtqB9kBNaIC0iipEN07RP1
 rfnRZDbYWoIMK6btOVkw/KpJLzzURUQUjzfzSICMBJCW4G+SgkOLyRIvwMZjoFSAIfQ4
 EVhLtYEg40Ox0lJ7YyVrAXHX82MyrWzioyyz3HNLePBLZFi/xo6Hfb+lUQgvx6bJpPQa
 SJKrIHS7RTpUO9JTV0V545OYMb0kUkwEpfHH8xeJZ56RCOZmJK4skQ3zGjxA+QbsBcL9
 yLow==
X-Gm-Message-State: AOAM530X05KJ2EaX6vo4egUGToAzUR7O6NkcQ/GAd1FKSwzVayL5ESFQ
 0NIOIutq6hfc/CBf89bfhF14FkH3QoXQ2d92jm3NRtAmwO3ivkfHrjJxGI+w2toIw/YFXQQFr10
 8SA33l70EZR+5eoA=
X-Received: by 2002:adf:f689:: with SMTP id v9mr2984839wrp.314.1624523484706; 
 Thu, 24 Jun 2021 01:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQUYu3VdBH4b179CFoZWyzXqrWW0LsvYYuJN2kwIzQn5Z0QGLDzsuxAoYp07I9D4O8gsyiZg==
X-Received: by 2002:adf:f689:: with SMTP id v9mr2984822wrp.314.1624523484483; 
 Thu, 24 Jun 2021 01:31:24 -0700 (PDT)
Received: from thuth.remote.csb (pd9575c8c.dip0.t-ipconnect.de.
 [217.87.92.140])
 by smtp.gmail.com with ESMTPSA id h9sm2174143wmb.35.2021.06.24.01.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 01:31:23 -0700 (PDT)
Subject: Re: [RFC v1 1/1] ui: Add a plain Wayland backend for Qemu UI
To: Vivek Kasireddy <vivek.kasireddy@intel.com>, qemu-devel@nongnu.org
References: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
 <20210624041040.1250631-2-vivek.kasireddy@intel.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9e421d71-4601-9c05-a055-01a391bab653@redhat.com>
Date: Thu, 24 Jun 2021 10:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624041040.1250631-2-vivek.kasireddy@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/2021 06.10, Vivek Kasireddy wrote:
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>   configure         |  17 ++
>   meson.build       |  25 +++
>   meson_options.txt |   2 +
>   qapi/ui.json      |  19 ++-
>   ui/meson.build    |  52 ++++++
>   ui/wayland.c      | 402 ++++++++++++++++++++++++++++++++++++++++++++++
>   6 files changed, 516 insertions(+), 1 deletion(-)
>   create mode 100644 ui/wayland.c
> 
> diff --git a/configure b/configure
> index 8dcb9965b2..f6caaa6329 100755
> --- a/configure
> +++ b/configure
> @@ -403,6 +403,7 @@ cfi_debug="false"
>   seccomp="auto"
>   glusterfs="auto"
>   gtk="auto"
> +wayland="auto"
>   tls_priority="NORMAL"
>   gnutls="$default_feature"
>   nettle="$default_feature"
> @@ -1372,6 +1373,10 @@ for opt do
>     ;;
>     --enable-gtk) gtk="enabled"
>     ;;
> +  --disable-wayland) wayland="disabled"
> +  ;;
> +  --enable-wayland) wayland="enabled"
> +  ;;
>     --tls-priority=*) tls_priority="$optarg"
>     ;;
>     --disable-gnutls) gnutls="no"
> @@ -1845,6 +1850,7 @@ disabled with --disable-FEATURE, default is enabled if available
>     sdl             SDL UI
>     sdl-image       SDL Image support for icons
>     gtk             gtk UI
> +  wayland         Wayland UI
>     vte             vte support for the gtk UI
>     curses          curses UI
>     iconv           font glyph conversion support
> @@ -3616,6 +3622,11 @@ if $pkg_config gbm; then
>       gbm="yes"
>   fi
>   
> +if $pkg_config wayland-client; then
> +    wayland_cflags="$($pkg_config --cflags wayland-client)"
> +    wayland_libs="$($pkg_config --libs wayland-client)"
> +fi
> +
>   if test "$opengl" != "no" ; then
>     epoxy=no
>     if $pkg_config epoxy; then
> @@ -5870,6 +5881,11 @@ if test "$gbm" = "yes" ; then
>       echo "GBM_CFLAGS=$gbm_cflags" >> $config_host_mak
>   fi
>   
> +if test "$wayland" = "enabled" ; then
> +    echo "CONFIG_WAYLAND=y" >> $config_host_mak
> +    echo "WAYLAND_LIBS=$wayland_libs" >> $config_host_mak
> +    echo "WAYLAND_CFLAGS=$wayland_cflags" >> $config_host_mak
> +fi

I think you don't really need the above two hunks in the configure script - 
this could be handled in the meson.build file instead. See e.g. commit 
1b6954713fee4945207 where the gtk detection has been moved from configure to 
Meson.

  Thomas


