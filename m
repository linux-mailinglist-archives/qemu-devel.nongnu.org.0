Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632642A780
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 16:42:21 +0200 (CEST)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIyx-0002JB-Oz
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 10:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maIuA-0004UA-QI
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1maIu5-0006au-LZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 10:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634049437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooviB52vZCFlutvwLrfBjk0JRE0t0qBHSL3T+yhbu4g=;
 b=BJe1WtI21TbaSDLAZF5f8jLEeRd+weAVlU4VxAePyIyP8bMqV5v7jkpRfQBDMczWLjFoas
 KFF9RURWhxr0qm4BbiuZKYtm/e55EZp9imBOfk0rrOdvPPV6M0sWmQO+NxcR3FhloEEO67
 Aad/rHeKTosEKJ0m5KDcA+eUhrJL6Xw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-O8D248asNrCChDoWla-pzA-1; Tue, 12 Oct 2021 10:37:13 -0400
X-MC-Unique: O8D248asNrCChDoWla-pzA-1
Received: by mail-ed1-f70.google.com with SMTP id
 14-20020a508e4e000000b003d84544f33eso128872edx.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 07:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ooviB52vZCFlutvwLrfBjk0JRE0t0qBHSL3T+yhbu4g=;
 b=zpIEs33syfYdIHNZO8OiMWxe9E7y4EQ98d8I42UuUUgqL0LqLHVeu2/xLMXSZSgHMD
 Pfqf/pZkkW+6Eot9fcDKzrT/T4x5PZqqrYemDwoaQLMHJlDZd8xU/euwpU//Rii9i9Oq
 p7Cl1RUPxFvl/1fKOTUdkrKFzxWAZhT2MxdsglcBKOMb5QOezGVdbMpN54fB3qj/RJ9I
 GLfOSQ7+zoXr/CF0VXezkeFPsBxrcDucfixzg2e+sSqeWuJUt5rVWNLPUwsM0uCjxojz
 lZLgxjink8AVlREZ49ChWyZdpT1RCqDI6VrH3XyySTRxwOvRBTi8r9OBsLNnDWVM1CGX
 aj7g==
X-Gm-Message-State: AOAM533FAWJ23bXiZ9P9LRPZe0f8cS0824F4H2irc+jXOObGptmDQDeK
 u6iwwEf0QaLeW+q9Je+y259GHTt6t7wwSUDniBRa/Rz7O3HuMZ9Fb/7OvaHkUL3V0ETB9UCYMBR
 +QnN3Ut/R+B4Twrg=
X-Received: by 2002:aa7:d74c:: with SMTP id a12mr243873eds.253.1634049432480; 
 Tue, 12 Oct 2021 07:37:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCef5lzkh94tanmgogPGrrmCW+Nr6vo61x1cQylDHfAQ7nhq13jqHLPubZ4uGMJZHhJLi/bw==
X-Received: by 2002:aa7:d74c:: with SMTP id a12mr243842eds.253.1634049432228; 
 Tue, 12 Oct 2021 07:37:12 -0700 (PDT)
Received: from thuth.remote.csb (p54886540.dip0.t-ipconnect.de.
 [84.136.101.64])
 by smtp.gmail.com with ESMTPSA id n24sm6032796edb.28.2021.10.12.07.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 07:37:11 -0700 (PDT)
Subject: Re: [PATCH v2 16/24] configure, meson: move vde detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211012111302.246627-1-pbonzini@redhat.com>
 <20211012111302.246627-17-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0eb7c6d2-7e53-1280-52b9-9399da14a326@redhat.com>
Date: Tue, 12 Oct 2021 16:37:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012111302.246627-17-pbonzini@redhat.com>
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
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/2021 13.12, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211007130829.632254-11-pbonzini@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure         | 35 ++++-------------------------------
>   meson.build       | 26 +++++++++++++++++++++++---
>   meson_options.txt |  2 ++
>   net/meson.build   |  2 +-
>   4 files changed, 30 insertions(+), 35 deletions(-)
> 
> diff --git a/configure b/configure
> index 86bc4b52d7..a2b1d54be8 100755
> --- a/configure
> +++ b/configure
> @@ -301,7 +301,7 @@ libudev="auto"
>   mpath="auto"
>   vnc="auto"
>   sparse="auto"
> -vde="$default_feature"
> +vde="auto"
>   vnc_sasl="auto"
>   vnc_jpeg="auto"
>   vnc_png="auto"
> @@ -1022,9 +1022,9 @@ for opt do
>     ;;
>     --enable-slirp=system) slirp="system"
>     ;;
> -  --disable-vde) vde="no"
> +  --disable-vde) vde="disabled"
>     ;;
> -  --enable-vde) vde="yes"
> +  --enable-vde) vde="enabled"
>     ;;
>     --disable-netmap) netmap="no"
>     ;;
> @@ -2901,30 +2901,6 @@ EOF
>     fi
>   fi
>   
> -##########################################
> -# vde libraries probe
> -if test "$vde" != "no" ; then
> -  vde_libs="-lvdeplug"
> -  cat > $TMPC << EOF
> -#include <libvdeplug.h>
> -int main(void)
> -{
> -    struct vde_open_args a = {0, 0, 0};
> -    char s[] = "";
> -    vde_open(s, s, &a);
> -    return 0;
> -}
> -EOF
> -  if compile_prog "" "$vde_libs" ; then
> -    vde=yes
> -  else
> -    if test "$vde" = "yes" ; then
> -      feature_not_found "vde" "Install vde (Virtual Distributed Ethernet) devel"
> -    fi
> -    vde=no
> -  fi
> -fi
> -
>   ##########################################
>   # netmap support probe
>   # Apart from looking for netmap headers, we make sure that the host API version
> @@ -4197,10 +4173,6 @@ if test "$slirp_smbd" = "yes" ; then
>     echo "CONFIG_SLIRP_SMBD=y" >> $config_host_mak
>     echo "CONFIG_SMBD_COMMAND=\"$smbd\"" >> $config_host_mak
>   fi
> -if test "$vde" = "yes" ; then
> -  echo "CONFIG_VDE=y" >> $config_host_mak
> -  echo "VDE_LIBS=$vde_libs" >> $config_host_mak
> -fi
>   if test "$netmap" = "yes" ; then
>     echo "CONFIG_NETMAP=y" >> $config_host_mak
>   fi
> @@ -4750,6 +4722,7 @@ if test "$skip_meson" = no; then
>           -Dalsa=$alsa -Dcoreaudio=$coreaudio -Ddsound=$dsound -Djack=$jack -Doss=$oss \
>           -Dpa=$pa -Daudio_drv_list=$audio_drv_list -Dtcg_interpreter=$tcg_interpreter \
>           -Dtrace_backends=$trace_backends -Dtrace_file=$trace_file -Dlinux_aio=$linux_aio \
> +        -Dvde=$vde \
>           $cross_arg \
>           "$PWD" "$source_path"
>   
> diff --git a/meson.build b/meson.build
> index 5f16b17c97..e98efd3480 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -500,9 +500,28 @@ else
>     xkbcommon = dependency('xkbcommon', required: get_option('xkbcommon'),
>                            method: 'pkg-config', kwargs: static_kwargs)
>   endif
> +
>   vde = not_found
> -if config_host.has_key('CONFIG_VDE')
> -  vde = declare_dependency(link_args: config_host['VDE_LIBS'].split())
> +if not get_option('vde').auto() or have_system or have_tools
> +  vde = cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
> +                           required: get_option('vde'),
> +                           kwargs: static_kwargs)
> +endif
> +if vde.found() and not cc.links('''
> +   #include <libvdeplug.h>
> +   int main(void)
> +   {
> +     struct vde_open_args a = {0, 0, 0};
> +     char s[] = "";
> +     vde_open(s, s, &a);
> +     return 0;
> +   }''', dependencies: vde)
> +  vde = not_found
> +  if get_option('cap_ng').enabled()

That "cap_ng" looks like a copy-n-paste error to me?

> +    error('could not link libvdeplug')
> +  else
> +    warning('could not link libvdeplug, disabling')
> +  endif
>   endif

  Thomas


