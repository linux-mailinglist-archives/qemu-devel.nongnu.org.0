Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9242258393E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 09:07:12 +0200 (CEST)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxbz-00026s-1U
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 03:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGxNt-0003t7-5o
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGxNr-00066Q-43
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658991153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPuacH2FRGF+RX2VEY2eKWC3rnQNHiUPrGWBjajePZk=;
 b=VvRxN1SQcUo5q2p6rSwl5DWgP7iKe1LKioBKwMMIJLrSvNk0NqNKjgDQ23H6fOAZ5dEtUc
 nJ/U2rsL15Bb3ejbfBu3sO9WBZSW/a9Fil34i8P2uL9DNJ4N7JMjJ0IYq9Sa3jRGEYAAvp
 smiWzAzu0MMps4q66LU088QOO6/aF6s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-EMFlHil9P-aFBL3kaP3vTw-1; Thu, 28 Jul 2022 02:52:27 -0400
X-MC-Unique: EMFlHil9P-aFBL3kaP3vTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso574720wmb.0
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SPuacH2FRGF+RX2VEY2eKWC3rnQNHiUPrGWBjajePZk=;
 b=hrxiOfjelg/x+QJCvUNi3A50Yg4riRifqwL0JXEi7PyDYfV18l6xgwerwMAA7y8awn
 zbfIgYPYhwGzlY8IAwHyjZ1swjOpEyQ34igCghaxGkYBM/OyHIkepQUJRV60cEBr5Vul
 ZOl5BS9n4cyf0KP6baEhPWm2jsd3k0VWZXeHB1xTWSbQ3aXS/lKu7doo7tzTLPf9w3xv
 IL9989Ta8Vq8qcJFiq+/hYbWN2pMaBDPqaAPzRTNUSoLB1tsy53pTSwvveZYtkZfI8L/
 ond1bRXUOK3azMtIVufm/gkjaMQs0o9blLa3GcOW/WOTJvqSngz9SislBwhpTFQNuIFW
 YEZA==
X-Gm-Message-State: AJIora9cJ0GTDf8jTXbK9PVaSAqUwPBQbYSX3Q3wBf6jaBAO/+ZgJYHo
 qCCTd5FW62OiahjqRUXVa2ZSR+6Kso0Kq5uZs/AjXKdHb9Lkb6lDCNBTBi2dMzsx39/toom9jmu
 rJJP+8XKI0Qefltg=
X-Received: by 2002:a7b:c354:0:b0:39c:6753:21f8 with SMTP id
 l20-20020a7bc354000000b0039c675321f8mr5515323wmj.113.1658991146361; 
 Wed, 27 Jul 2022 23:52:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpd1G2skaHidD4F10Ium0DLyx5AO/sVGX1ULy7xtm1u8DTHRDXqJ5Yqk4hEVl7vn7BmQFPlQ==
X-Received: by 2002:a7b:c354:0:b0:39c:6753:21f8 with SMTP id
 l20-20020a7bc354000000b0039c675321f8mr5515302wmj.113.1658991145991; 
 Wed, 27 Jul 2022 23:52:25 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-134.web.vodafone.de.
 [109.43.176.134]) by smtp.gmail.com with ESMTPSA id
 y26-20020a7bcd9a000000b003a2cf1ba9e2sm240535wmj.6.2022.07.27.23.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 23:52:25 -0700 (PDT)
Message-ID: <20d60b18-3ecc-9fbf-f853-1480b2935e05@redhat.com>
Date: Thu, 28 Jul 2022 08:52:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/8] tests/docker: Fix alpine dockerfile
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20220727163632.59806-1-lucas.araujo@eldorado.org.br>
 <20220727163632.59806-2-lucas.araujo@eldorado.org.br>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220727163632.59806-2-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/07/2022 18.36, Lucas Mateus Castro(alqotel) wrote:
> Currently the run script uses 'readlink -e' but the image only has the
> busybox readlink, this commit add the coreutils package which
> contains the readlink with the '-e' option.
> 
> Signed-off-by: Lucas Mateus Castro(alqotel) <lucas.araujo@eldorado.org.br>
> ---
>   tests/docker/dockerfiles/alpine.docker | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> index 3f4c0f95cb..2943a99730 100644
> --- a/tests/docker/dockerfiles/alpine.docker
> +++ b/tests/docker/dockerfiles/alpine.docker
> @@ -21,6 +21,7 @@ RUN apk update && \
>           cdrkit \
>           ceph-dev \
>           clang \
> +        coreutils \
>           ctags \
>           curl-dev \
>           cyrus-sasl-dev \

Not a good idea. If you look at the top of the file, you can see:

# THIS FILE WAS AUTO-GENERATED

So your modifications will be overwritten the next time someone runs the 
lcitool.

I guess you'd need to modify tests/lcitool/projects/qemu.yml instead? Daniel?

Anyway, it might be better to fix the part that uses "readlink -e" ... Seems 
like busybox' readlink supports -f at least, so maybe it's enough to switch 
to -f instead of -e ?

  Thomas


