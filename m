Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED4A5FEB38
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:56:32 +0200 (CEST)
Received: from localhost ([::1]:42022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGUZ-0002qM-Gq
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ojGR8-000848-6Z
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:52:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ojGR3-0001GW-Ap
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665737572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFTQcvTyZI/Ld2LdrjXdpaIJ4SzylXYlsUhbjfu+sKI=;
 b=RzvyBRloC0GaHYzilYgo5/TPaf+PkwTvKhGti6HUqgymH1qzEcBErUgC1d8bxFIqe/v0l8
 JkZ/iABWb7T2BdrSvxEAC9DgHqgGPH37ZgvTBBYPjqI7HQi0ONnZj1ORpTKSQaXasdhhg/
 6RQpk99Ue/8AUawcJmnehj7uAwhPBhg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-32ElKEYcP2-xHv9ueJsqZg-1; Fri, 14 Oct 2022 04:52:45 -0400
X-MC-Unique: 32ElKEYcP2-xHv9ueJsqZg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sc11-20020a1709078a0b00b0078d95df8a2eso1920477ejc.2
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:52:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AFTQcvTyZI/Ld2LdrjXdpaIJ4SzylXYlsUhbjfu+sKI=;
 b=FmniucaM2YzU1ZgE2xFAV1ODkZPm4SpKA0Oo2y74J06a+0REJ6yDTZcvyNJf2ncbmU
 ZsTv+sGvb22HHOlyLdTMl625TBrvO2JNGT4fISP0Ia65nPTWB1Wv8iBuU5ahgy/8j0UD
 PyfpgpxRoA2BoMgFltlFS4EhT/LngQpFwmJqExg1T5fe5Ow9PB8FbZQbonfCwYcKyiZw
 SXby/ido4UE0ghn2mok2TC0l1VObgVGmOp6ewjy5D8mMKWtjoqqnnSJ5MdGoEPm+IQWe
 dXuKaDFIU5bYI/hdjdD7Nvm61T62qY2dEjuzyjQXK6W3MC9SXqO4x3n58PtIKX9TQFNY
 njjg==
X-Gm-Message-State: ACrzQf0xvsG8t91OLYKu0jjO/AhtPxR+OtYvMVDK3PGKzvWEyGTXRar6
 hjhYVNNTDjU9z5X99gWAfOm88KIMwUf9fUGFl+XPGqoDKEW8Iwt11skJFvxo/xYheZI9zJp8xnT
 Vql1Bz4NNrL7igCE=
X-Received: by 2002:a05:6402:5252:b0:45d:d1a:fe7d with SMTP id
 t18-20020a056402525200b0045d0d1afe7dmr3298122edd.323.1665737564706; 
 Fri, 14 Oct 2022 01:52:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5a2u2syKKNgPzwgRpaWCWgTaPHo9KUd0dtoZGYmh4hn41higoyRl552FBfY02RA+ZwRTnLgQ==
X-Received: by 2002:a05:6402:5252:b0:45d:d1a:fe7d with SMTP id
 t18-20020a056402525200b0045d0d1afe7dmr3298108edd.323.1665737564526; 
 Fri, 14 Oct 2022 01:52:44 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:e3ec:5559:7c5c:1928?
 ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.googlemail.com with ESMTPSA id
 h28-20020a1709070b1c00b00780f6071b5dsm1130178ejl.188.2022.10.14.01.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 01:52:43 -0700 (PDT)
Message-ID: <3e12a63a-7b1f-6f67-1971-d2f6618a687b@redhat.com>
Date: Fri, 14 Oct 2022 10:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 4/7] configure: don't enable cross compilers unless in
 target_list
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, stefanha@redhat.com, crosa@redhat.com
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
 <20221013154705.1846261-5-alex.bennee@linaro.org> <877d13pkr5.fsf@linaro.org>
 <bcdc0d01-e6a9-27af-2c54-7a789a43f7be@redhat.com> <87y1tioma7.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87y1tioma7.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/22 10:13, Alex Bennée wrote:
> @@ -1866,6 +1866,15 @@ probe_target_compiler() {
>     container_cross_ranlib=
>     container_cross_strip=
>   
> +  # We shall skip configuring the target compiler if the user didn't
> +  # bother enabling an appropriate guest. This avoids building
> +  # extraneous firmware images and tests.
> +  if test "${target_list#*$1}" != "$1"; then
> +      break;
> +  else
> +      return 1
> +  fi
> +
>     target_arch=${1%%-*}
>     case $target_arch in
>       aarch64) container_hosts="x86_64 aarch64" ;;

There's another problem with i386-softmmu/x86_64-softmmu using the same 
firmware (PPC too).  See "[PATCH] configure: don't enable firmware for 
targets that are not built".

Paolo


