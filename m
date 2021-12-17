Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDEB478C5E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:33:06 +0100 (CET)
Received: from localhost ([::1]:43384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDM9-0005cl-TL
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:33:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDGi-0003lG-V7
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:27:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDGf-0002tY-Fs
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639747644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYBbMxqxZcu2K5YZhtb9bLI5ggv/J2iLC43SdSIkw1Y=;
 b=fJjkyOOljBvhTgu+w9/skLfG7QW46/GquUyK1gaQLWfukMp3M2ckFScw2xqEAnY5JP/wuq
 IkPJwSVjTjPMGS5jOc4g2cIsYt3us4JXbCK1mmrxdZ/w6VKt6Wzp6ksmnofa7v2eHsWe5l
 gah9dRpEkcWv3gotLR6eBWD20uZlmu4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-QrDpjTUWN1m_beI9bUBfFA-1; Fri, 17 Dec 2021 08:27:21 -0500
X-MC-Unique: QrDpjTUWN1m_beI9bUBfFA-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi14-20020a05600c3d8e00b00345787d3177so1048902wmb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 05:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pYBbMxqxZcu2K5YZhtb9bLI5ggv/J2iLC43SdSIkw1Y=;
 b=pYpciP7tUw+uZtrNAV8XTcidSPAIGBmqMOC5/79SY/PCxaGSp34Y+0QvurHWxf5SOQ
 eP9ARunOMJpCoPcIHSKUcbrTbQtJCAqCw3SwhHMPk7Ledj00KFpjkWVhjLXDDQ8Ovwvr
 roR5KxvrFc885w55a+bqTFXJeU3tvceOIkQh+3/+08JyR1Mp0pp3Ca7zc+tiNGJluTx7
 myEnSEF0Doo+WElmpgdEOTkizq4ZmCH6iKwn5VnOT/zB/xYys3K1to7mcw2b/qwxwthS
 uU7tkkpMNo9873kSCqaWPkg8BnJbcrBveTtfR561e4ncdf3dJcdsnORPKaeWWBwRANHf
 o1ow==
X-Gm-Message-State: AOAM531hi5d0dtc14xdKfBkCtA7QgkOQk0ww9GdBkLe4o7hcS57OkgcG
 0YsNzClOyznazjiQcrgv7ddQ9JQ8sYgqXBfd2yh6Cq1l13d3mKddjOHN1iOGJZGG/JFyNSgPcY4
 ZjtWPKIzvRg+jKLM=
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr9392940wmf.73.1639747640685; 
 Fri, 17 Dec 2021 05:27:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydf3GyL/E5wLMqXDyUlvsNWzJD7OzWv8z+t30XdWBdToBOOoSWKshb8gOqm5K8rlw0FMThPw==
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr9392930wmf.73.1639747640417; 
 Fri, 17 Dec 2021 05:27:20 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w17sm8082807wmc.14.2021.12.17.05.27.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:27:20 -0800 (PST)
Message-ID: <9efb2356-6865-2126-727e-429d867e90b0@redhat.com>
Date: Fri, 17 Dec 2021 14:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 25/37] build-sys: set glib dependency version
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-26-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211009210838.2219430-26-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/9/21 23:08, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Further meson configuration tests are to be added based on the glib
> version. Also correct the version reporting in the config log.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  configure   | 1 +
>  meson.build | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 375cde2b44..57e363fd73 100755
> --- a/configure
> +++ b/configure
> @@ -4889,6 +4889,7 @@ echo "QEMU_CFLAGS=$QEMU_CFLAGS" >> $config_host_mak
>  echo "QEMU_CXXFLAGS=$QEMU_CXXFLAGS" >> $config_host_mak
>  echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
>  echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
> +echo "GLIB_VERSION=$(pkg-config --modversion glib-2.0)" >> $config_host_mak
>  echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
>  echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
>  echo "EXESUF=$EXESUF" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index e1cddf5139..9494590aa2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -311,14 +311,16 @@ endif
>  add_project_arguments(config_host['GLIB_CFLAGS'].split(),
>                        native: false, language: ['c', 'cpp', 'objc'])
>  glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
> -                          link_args: config_host['GLIB_LIBS'].split())
> +                          link_args: config_host['GLIB_LIBS'].split(),
> +                          version: config_host['GLIB_VERSION'])
>  # override glib dep with the configure results (for subprojects)
>  meson.override_dependency('glib-2.0', glib)
>  
>  gio = not_found
>  if 'CONFIG_GIO' in config_host
>    gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
> -                           link_args: config_host['GIO_LIBS'].split())
> +                           link_args: config_host['GIO_LIBS'].split(),
> +                           version: config_host['GLIB_VERSION'])
>  endif
>  lttng = not_found
>  if 'CONFIG_TRACE_UST' in config_host
> 

Can you display it in summary_info too?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


