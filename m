Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B8487B95
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:43:22 +0100 (CET)
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5tGr-0005TA-BJ
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5t08-0002A9-5k
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:26:05 -0500
Received: from [2a00:1450:4864:20::52d] (port=44569
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5szo-00008v-M4
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:26:03 -0500
Received: by mail-ed1-x52d.google.com with SMTP id w16so24645406edc.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IMMXJFbx9X+X6t/DwFXyyhJRcKpnXCy4/Ju+yLrePEY=;
 b=Ys1p1AA7o8HxQvQEPWT1Q1yspQZYRBtzBdi516GUMrl+eif9/2V9uDsaVZEo/j0LIe
 4+UkpGaU0x/IfFD+MWwd+gMkC+oaY7TVY7MBau1zGSC234rDPlgRvFzNuLYTZCMEdCNp
 rG/uYrN1KMlph0gvntDyC894Ua/SvyoOwNmDdd59+qn1n5BDgHw4J4OPf7TstZd91yj1
 DlES52QCWC5dvRnyFDz8xiALHkzaoytmupJn9GQeSoNRVbgQrQ1v8THjSqR+evg/XT/k
 rwvNnXr2jsIoryEuRtc30bVclQZOVGhYbWbh2fldxFjmcBFDIHTX7IiQb9lnPAgbyzfj
 vAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IMMXJFbx9X+X6t/DwFXyyhJRcKpnXCy4/Ju+yLrePEY=;
 b=IKdxugflYZTb8lT3jTu03wFtTdw8Pefp1Oxl7iC63axPGqLm/Fkj4To5LWIzutr3b+
 ahC/HJwXWjcMaidy26a1ey75IoUJKYMjX77TjsxqRwueSmg4PqFXZsi0tJCNdX4u0o70
 bYGJUV7Y4vPRkVfduRl5irv1X+TcWLVYrChwuY2++jzr9Sni+neegXD6GWuMVEGJ9OK3
 UsPX76974NgpJ76GrEXFyTS1QMkOImZriMXMUSsDgSb9fp1UbyIaAUWtHQNU2mLtfSRq
 3wU56ZPHXNrqYdDSSeJpn3WZqD1xpEAsetOBR2tg6fdiAgiaNR2Af99djtGYTK27i5iG
 aQIA==
X-Gm-Message-State: AOAM533Ic0y+Zro73mlrpj0VQB/qprsCp80jx63Nk0U4K2Ym9OI+cgqD
 P4rwb5zFyA7+fTMmMrjt6SQ=
X-Google-Smtp-Source: ABdhPJz0OPm6In2o88V7kBzjvLhIzfnOIwx+H3JPXey7rqdbp2OXFwJTmGm8UdSQmEIaUcoL0/Szuw==
X-Received: by 2002:a17:906:794c:: with SMTP id
 l12mr5913478ejo.474.1641576339206; 
 Fri, 07 Jan 2022 09:25:39 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id hu8sm1571329ejc.32.2022.01.07.09.25.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jan 2022 09:25:38 -0800 (PST)
Message-ID: <a6dcc0b9-f004-c749-d189-606a6e56b418@redhat.com>
Date: Fri, 7 Jan 2022 18:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] configure: Silence warnings about missing roms/seabios
 directory
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220107121540.80895-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220107121540.80895-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/22 13:15, Thomas Huth wrote:
> The configure script tries to always create a config.mak file
> in the roms/seabios/ subdirectory. However, since commit
> 5dce7b8d8ce6 ("configure: remove DIRS"), this subdirectory is not
> created anymore if the git submodule hasn't been checked out.
> Thus let's properly check for the existance of the folder first
> now to get rid of the warnings.
> 
> Fixes: 5dce7b8d8ce6 ("configure: remove DIRS")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I beat you to it shortly:

[PATCH] configure: do not create roms/seabios/config.mak if SeaBIOS not 
present

(I didn't see your reply to the pull request).

"test -d" is not really enough, what you need is test -f 
$source_path/roms/seabios/Makefile.

Paolo

> ---
>   configure | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index c798e48faf..51b13b273c 100755
> --- a/configure
> +++ b/configure
> @@ -3773,8 +3773,8 @@ export target_list source_path use_containers cpu
>   $source_path/tests/tcg/configure.sh)
>   
>   # temporary config to build submodules
> -for rom in seabios; do
> -    config_mak=roms/$rom/config.mak
> +if test -d roms/seabios ; then
> +    config_mak=roms/seabios/config.mak
>       echo "# Automatically generated by configure - do not modify" > $config_mak
>       echo "SRC_PATH=$source_path/roms/$rom" >> $config_mak
>       echo "AS=$as" >> $config_mak
> @@ -3786,7 +3786,7 @@ for rom in seabios; do
>       echo "IASL=$iasl" >> $config_mak
>       echo "LD=$ld" >> $config_mak
>       echo "RANLIB=$ranlib" >> $config_mak
> -done
> +fi
>   
>   config_mak=pc-bios/optionrom/config.mak
>   echo "# Automatically generated by configure - do not modify" > $config_mak


