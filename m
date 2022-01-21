Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6524495EAF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 12:57:39 +0100 (CET)
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAsXy-00043F-Eq
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 06:57:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsPp-0002cY-WD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nAsPo-0002X4-F4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 06:49:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642765751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydJdWVKdnIjnGLCsGP7PhgGCPj8FS6F9fIPI+Dq3GkQ=;
 b=MQuPi99QL128hN3NwcyaX/6JOY971sN6fUyRrkPV8T5TytZ4TFvEwIjrPlshb8OKFY9md0
 z9zKSHhCIA6/sKn8DzwX1rzyU2SbcNYsYhoi2jcfvTbDqu55LjXuEgg7ijIpRvBkFga/Qc
 QV/hhbsRGU9vrNp13stoBm8hXS6frFY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-P0HPO-zCMdCaQuFOXVjtzQ-1; Fri, 21 Jan 2022 06:49:10 -0500
X-MC-Unique: P0HPO-zCMdCaQuFOXVjtzQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 g80-20020a1c9d53000000b0034da9d62199so2509728wme.7
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 03:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ydJdWVKdnIjnGLCsGP7PhgGCPj8FS6F9fIPI+Dq3GkQ=;
 b=kZqofh/509zc2N0CC56KbY198q3BOWCisk/p5IS5KqdW8/1T4kxDrMV/x0Sv0KFglZ
 QBxMJtujEq1xinkJljHby1MqmxKFJP2nru9mdV3tnIc5Capbiy96wYPpGdCLBnoWW2wt
 J/SuGnjnXG/DK9jOdX9P70dp+ocKl9mhgg32AfRFi72P3bU+4lKN3FgqdX8HhiAEZjHV
 YP8MSKziks1ksQohwjoBE5i7cMFhIMaj7uDWLIcuZGyU18Atg4NXjsJ8GuFZfcspOs8z
 Sd2NOiDFHhpFHorTWF5HrOByIpXjTjj4N3macSBq7fo4k9GgFfcFmMXxuqpD7Egcmhfi
 L/jQ==
X-Gm-Message-State: AOAM533BQyNyzMmVibOn1rQbSr6iWmFF9LLMTYQgXlQ7tDN+BcAjJ30K
 KVeX+DehAgHQHO9pcGM/Z6dHJc8olwRqwZe3VkWL6DfAqESxC3aNx7difM9EZ42AO0gOXX5uWWa
 bQ5f+ZrsiiHRKuHs=
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr3489542wri.337.1642765749331; 
 Fri, 21 Jan 2022 03:49:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7beC7hig+Vsz6hLjfxh46Jv6C9gE39tXx+WsZiCOPaiu4zdEIhYgOihBcabgllTc0n8M2SQ==
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr3489519wri.337.1642765749174; 
 Fri, 21 Jan 2022 03:49:09 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id m4sm2210777wmc.1.2022.01.21.03.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 03:49:08 -0800 (PST)
Message-ID: <95dacb4a-ddae-a15e-455b-709351c5486e@redhat.com>
Date: Fri, 21 Jan 2022 12:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 8/8] tests: Manually remove libxml2 on MSYS2 runners
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220121103623.288054-1-f4bug@amsat.org>
 <20220121103623.288054-9-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220121103623.288054-9-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/01/2022 11.36, Philippe Mathieu-Daudé wrote:
> lcitool doesn't support MSYS2 targets, so manually remove
> this now unnecessary library.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .cirrus.yml              | 1 -
>   .gitlab-ci.d/windows.yml | 2 --
>   2 files changed, 3 deletions(-)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index 02c43a074a1..7552d709745 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -32,7 +32,6 @@ windows_msys2_task:
>         mingw-w64-x86_64-libgcrypt
>         mingw-w64-x86_64-libpng
>         mingw-w64-x86_64-libssh
> -      mingw-w64-x86_64-libxml2
>         mingw-w64-x86_64-snappy
>         mingw-w64-x86_64-libusb
>         mingw-w64-x86_64-usbredir
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 62dd9ed8329..1df16303491 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -44,7 +44,6 @@ msys2-64bit:
>         mingw-w64-x86_64-libssh
>         mingw-w64-x86_64-libtasn1
>         mingw-w64-x86_64-libusb
> -      mingw-w64-x86_64-libxml2
>         mingw-w64-x86_64-nettle
>         mingw-w64-x86_64-ninja
>         mingw-w64-x86_64-pixman
> @@ -80,7 +79,6 @@ msys2-32bit:
>         mingw-w64-i686-libssh
>         mingw-w64-i686-libtasn1
>         mingw-w64-i686-libusb
> -      mingw-w64-i686-libxml2
>         mingw-w64-i686-lzo2
>         mingw-w64-i686-ninja
>         mingw-w64-i686-pixman

Reviewed-by: Thomas Huth <thuth@redhat.com>


