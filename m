Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E475475847
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:58:53 +0100 (CET)
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSvs-0000QW-7R
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:58:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSRv-000444-UC
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:27:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxSRs-00087d-Pc
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 06:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639567672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUBJmSSoMrAQp9Iz55l4BmvmHFVld7NbwiLtiG9hV/E=;
 b=aDaERB/GyN6AoNzUv0CAuo/ML+OMrCZAGRh8uKI4OVrsXu9UZaZTqihF3OohTUda2J0ZFY
 PnYnOBzs4GRTNxN2uHoV/YSnybgcrgtuhbhUJnmrugY2dkWy3TE8w5q5UfYN76J0CdwTqA
 sq0fiPHXsPm2Ww/E6KjdZtnSQ6QPORE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-jRGj7af8MqWQ4U4PAIvFYw-1; Wed, 15 Dec 2021 06:27:46 -0500
X-MC-Unique: jRGj7af8MqWQ4U4PAIvFYw-1
Received: by mail-wr1-f69.google.com with SMTP id
 k11-20020adfc70b000000b001a2333d9406so196041wrg.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 03:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EUBJmSSoMrAQp9Iz55l4BmvmHFVld7NbwiLtiG9hV/E=;
 b=Z/RG3Bs8OglG6FOvd796e/cIeZ/dj+tk8wiVOfZaqx24w6kJtD/uMsMrc+6PuFooZ0
 G9SV8Kow6bBg2+kCr+yIBGW+dN66RTa5QARLDNDyiPXiCmodyukSoXFcghE7gjwfpe4z
 uQHgg4xkA/lE+ewofQz4RcCzr1RYzIwAMBZ7gUgiS53yWfs0kprBz0pB0GzvePQVfKfo
 blrh5GM2UACznDpOomwu3/l5ukOThEeBRNDWT764/imjyw1g8PafkkihW5mAT71g73JA
 NV7tFQi1IBW3u4xZIZqMJZH6hVbPiTbZfibjwITC7MTsvjh7un2CcHZwSKyYXP25SIPs
 eqqA==
X-Gm-Message-State: AOAM5320g/mcUgNyrboBSqOQYCelMGFxG2VvsTltf+Itj46Rv0mDDnKZ
 Bd2Fhdp5Iid0KKesnT/U/SOelAyZNtTWrr1LH12C3BrqgC2/yIsvsoelQtt5vb/JlRvIhFIaPhx
 zpCtQFF3MVovgW8M=
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr3972745wmq.176.1639567665416; 
 Wed, 15 Dec 2021 03:27:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqgsXj8P6vweNrGkm/yjRr4okbtquY/UxxVpQV2LK6Np/b8ayqeXPpQggyuA2hCFNhsv/t3w==
X-Received: by 2002:a05:600c:35d3:: with SMTP id
 r19mr3972720wmq.176.1639567665109; 
 Wed, 15 Dec 2021 03:27:45 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n10sm1100114wri.67.2021.12.15.03.27.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:27:44 -0800 (PST)
Message-ID: <977ffa85-1f5f-7493-cb05-5e2024e3c017@redhat.com>
Date: Wed, 15 Dec 2021 12:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 03/18] meson: require liburing >= 0.3
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20211124130150.268230-1-berrange@redhat.com>
 <20211124130150.268230-4-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124130150.268230-4-berrange@redhat.com>
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
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Stefan & Stefano.

On 11/24/21 14:01, Daniel P. Berrangé wrote:
> openSUSE Leap 15.2 ships with liburing == 0.2 against which QEMU fails
> to build.
> 
> ../util/fdmon-io_uring.c: In function ‘fdmon_io_uring_need_wait’:
> ../util/fdmon-io_uring.c:305:9: error: implicit declaration of function ‘io_uring_sq_ready’; did you mean ‘io_uring_cq_ready’? [-Werror=implicit-function-declaration]
>      if (io_uring_sq_ready(&ctx->fdmon_io_uring)) {
>          ^~~~~~~~~~~~~~~~~
>          io_uring_cq_ready
> 
> This method was introduced in liburing 0.3, so set that as a minimum
> requirement.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index e2d38a43e6..04d36bf47e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -427,7 +427,8 @@ if not get_option('linux_aio').auto() or have_block
>  endif
>  linux_io_uring = not_found
>  if not get_option('linux_io_uring').auto() or have_block
> -  linux_io_uring = dependency('liburing', required: get_option('linux_io_uring'),
> +  linux_io_uring = dependency('liburing', version: '>=0.3',
> +                              required: get_option('linux_io_uring'),
>                                method: 'pkg-config', kwargs: static_kwargs)
>  endif
>  libxml2 = not_found
> 


