Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B262EF4A4
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:16:35 +0100 (CET)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtVC-0003gI-2Q
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxtTO-0003DL-8b
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxtTK-0003aE-MS
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610118877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IVMJ3mbjFmxYtzNC/2kw3VUntoB+hI9hWI4Sq8eJMk0=;
 b=NGWGW0OqwLVVCtYe1yeEWYo1SdXGjViYHfA5ac5M/LviSrS89PoTQY6isJvWak+nd89g7o
 ly1XangCM/BWq/aFKOD/aJfqWy8GnDsdlUS55e9O3A1FF+A8AR0JQbXdnRnolN9fPjNBD9
 7DMH6QkettoPWg9iLf1lq6wqBGHCP3c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-Cc7Z0XkZMKq8f-CXLEvybQ-1; Fri, 08 Jan 2021 10:14:33 -0500
X-MC-Unique: Cc7Z0XkZMKq8f-CXLEvybQ-1
Received: by mail-ej1-f71.google.com with SMTP id dc13so3705922ejb.9
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IVMJ3mbjFmxYtzNC/2kw3VUntoB+hI9hWI4Sq8eJMk0=;
 b=tq4dn2JM/YGP7MaZc2LgLkQZp8xmLHh17nkE9k6pbgw4owy0l5KRh3s47g6q2wrqMK
 prXH3s3gqLyRPYnbl1CfQxbuvPXaKr/tjNY8PR6f18d5VKo7pWNrMfwMDxbnAxkVSHDz
 Q9KsTikIL65uqslXju48QmLizVtbBMTzF1vZ1j//hYlcmkFxZaXRduTyET69vrOZnpQZ
 J1zLGRG46Y4YvrGz/VHTDhm+qDyr59qGBpJ9j1gvBO8nLb92a4a+dDg1GR4qiBVHCPVX
 I4CHkoxdeZlQBr54JgTkD+T6+2xRjNnXST6tXvXxCE4YU2PzTIgrL0ODMwKG8f0NKgdB
 qD/g==
X-Gm-Message-State: AOAM531T1Qr5qPHsYipo5cn5ihlF0aQiKcBGbfFljJbxSSBk7yXGKdXa
 OpRyShUhLD5TlIA7cDNtXMi1bVEeFZg6v1hp/VrUfPWfLPBatTQuAT04Fk0Fj6QG4+LSIRPO/Xf
 /oCoc6TOLnXsUpXY=
X-Received: by 2002:a17:907:b09:: with SMTP id
 h9mr2994368ejl.155.1610118872565; 
 Fri, 08 Jan 2021 07:14:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5WdP/t4tPUqp11zk9EGL8JW/XqER8p1G4fQ1WcGhmz32/4iRx4caRAPe+K+wEDjM7qzjgZQ==
X-Received: by 2002:a17:907:b09:: with SMTP id
 h9mr2994354ejl.155.1610118872399; 
 Fri, 08 Jan 2021 07:14:32 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k21sm3630276ejv.80.2021.01.08.07.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 07:14:31 -0800 (PST)
Subject: Re: [PATCH] shippable.yml: Remove jobs duplicated on Gitlab-CI
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210108145103.269353-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <28635389-fbe2-89eb-5ec6-5fdc1da98c6a@redhat.com>
Date: Fri, 8 Jan 2021 16:14:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210108145103.269353-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/01/21 15:51, Philippe Mathieu-Daudé wrote:
> The following jobs are duplicated on Gitlab-CI since commit
> 6bcb5fc0f7a ("gitlab-ci: Add cross-compiling build tests"):
> 
> - IMAGE=debian-armel-cross
> 
>    TARGET_LIST=arm-softmmu               -> cross-armel-system
>    TARGET_LIST=arm-linux-user            -> cross-armel-user
>    TARGET_LIST=armeb-linux-user          -> cross-armel-user
> 
> - IMAGE=debian-armhf-cross
> 
>    TARGET_LIST=arm-softmmu               -> cross-armhf-system
>    TARGET_LIST=arm-linux-user            -> cross-armhf-user
>    TARGET_LIST=armeb-linux-user          -> cross-armhf-user
> 
> - IMAGE=debian-arm64-cross
> 
>    TARGET_LIST=aarch64-softmmu           -> cross-arm64-system
>    TARGET_LIST=aarch64-linux-user        -> cross-arm64-user
> 
> - IMAGE=debian-s390x-cross
> 
>    TARGET_LIST=s390x-softmmu             -> cross-s390x-system
>    TARGET_LIST=s390x-linux-user          -> cross-s390x-user
> 
> - IMAGE=debian-mips-cross
> 
>    TARGET_LIST=mipsel-linux-user         -> cross-mips-user
> 
> - IMAGE=debian-mips64el-cross
> 
>    TARGET_LIST=mips64el-softmmu          -> cross-mips64el-system
>    TARGET_LIST=mips64el-linux-user       -> cross-mips64el-user
> 
> - IMAGE=debian-ppc64el-cross
> 
>    TARGET_LIST=ppc64-softmmu             -> cross-ppc64el-system
>    TARGET_LIST=ppc64-linux-user          -> cross-ppc64el-user
>    TARGET_LIST=ppc64abi32-linux-user     -> cross-ppc64el-user
> 
> Remove them from Shippable CI.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .shippable.yml | 14 +-------------
>   1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/.shippable.yml b/.shippable.yml
> index 14350e6de8a..97bfa2a0f38 100644
> --- a/.shippable.yml
> +++ b/.shippable.yml
> @@ -7,20 +7,8 @@ env:
>     matrix:
>       - IMAGE=debian-amd64
>         TARGET_LIST=x86_64-softmmu,x86_64-linux-user
> -    - IMAGE=debian-armel-cross
> -      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
> -    - IMAGE=debian-armhf-cross
> -      TARGET_LIST=arm-softmmu,arm-linux-user,armeb-linux-user
> -    - IMAGE=debian-arm64-cross
> -      TARGET_LIST=aarch64-softmmu,aarch64-linux-user
> -    - IMAGE=debian-s390x-cross
> -      TARGET_LIST=s390x-softmmu,s390x-linux-user
>       - IMAGE=debian-mips-cross
> -      TARGET_LIST=mips-softmmu,mipsel-linux-user
> -    - IMAGE=debian-mips64el-cross
> -      TARGET_LIST=mips64el-softmmu,mips64el-linux-user
> -    - IMAGE=debian-ppc64el-cross
> -      TARGET_LIST=ppc64-softmmu,ppc64-linux-user,ppc64abi32-linux-user
> +      TARGET_LIST=mips-softmmu

The debian-mips-cross/mips-softmmu pair (and also mipsel-softmmu) is 
currently excluded by Gitlab's cross-mips-system, is there a reason for 
that?  If we add it there, we can just remove shippable altogether.

Paolo


