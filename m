Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D78A4A9B8C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 15:59:16 +0100 (CET)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG03O-0007S1-VK
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 09:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG01v-000669-PQ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:57:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG01k-0006gD-O7
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 09:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643986611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8XiA/A2EUwGu0NeqYr/Dadw/mCKCDv9rcbWgDGcA1iw=;
 b=ZuiCMY+GybsCKYS2Wo79yl9FGFPaV223UZaxDOZDSV2S8R/8E2O32Bt91NP0kMvs8KQScH
 zSlh2l9sZevbZ3Qhs5xGQmw6xK7ZbPeOPN1vFNM7HXMnCMNEuf616jrIkiVG2V3oQ5LnDj
 7YaAjRs+Nl4zSAtHnFo71iu5VOGEZs0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-jFPVJLUsOMqhNl_MhJ9ytQ-1; Fri, 04 Feb 2022 09:56:50 -0500
X-MC-Unique: jFPVJLUsOMqhNl_MhJ9ytQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso3308770wmh.3
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 06:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8XiA/A2EUwGu0NeqYr/Dadw/mCKCDv9rcbWgDGcA1iw=;
 b=yivrf1BN7zu2GbAmBj2sA87wuN63PisE1isuBotGxhivf+axgC0lUmH3jqP2iXNn+U
 SfqRFJ1B7OBZSJ/pN468HXQjiBYVlIOZam70QL+M6EKRnGWRVF3DFwnA3c5RiOunAdfL
 FmJl+tevUBCmJ4VWmBI2gy+migrM7vG2rSiCR4OPDGk/en01d1823crL/ZHDvLYTMdrO
 joLgf41xZ0O8RxG/DJ+L7oWPPia4mWXNNHysdMtKDHdYEhHIkQnN621lyeHJqVRSH8L2
 GUYTuEvlM1tzPf1npikCYMtmrmp5rK3U+Sk/iE//8K3x+vn9Xsn8Gm3Yk5m8MPMY51zB
 DsPg==
X-Gm-Message-State: AOAM530uYh54SwV5dSIMuCXxiTsrXVoVGwN30NpPz8kNRvyNIFV4OU3e
 Ysg4NZsP5qZ8kbhgNqjsXi5hq1h2ag/JFF7MqEx0ar9g4Cvyu1f8fX4xHdhzymJFK5yvwwRrx7g
 XUxc9qT+A7djLVc8=
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr2668217wri.589.1643986609086; 
 Fri, 04 Feb 2022 06:56:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZWeuj698X9HoAOG/SO1Rlo1CY2GnSJ73y+n3na1p4KxwGgVt7QqJycASZvn5stLCwJEhM8Q==
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr2668199wri.589.1643986608868; 
 Fri, 04 Feb 2022 06:56:48 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id w3sm2178847wra.67.2022.02.04.06.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 06:56:48 -0800 (PST)
Message-ID: <28c06259-1e41-e8f4-2a7c-88620c48fead@redhat.com>
Date: Fri, 4 Feb 2022 15:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/10] qtest: Add missing 'hw/qdev-core.h' include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-6-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-6-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.37, Philippe Mathieu-Daudé wrote:
> Add "hw/qdev-core.h" to avoid when refactoring include/:
> 
>    softmmu/qtest.c:404:9: error: use of undeclared identifier 'NamedGPIOList'
>          NamedGPIOList *ngl;
>          ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   softmmu/qtest.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 72751e1fd8..8b7cb6aa8e 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -19,6 +19,7 @@
>   #include "chardev/char-fe.h"
>   #include "exec/ioport.h"
>   #include "exec/memory.h"
> +#include "hw/qdev-core.h"
>   #include "hw/irq.h"
>   #include "qemu/accel.h"
>   #include "sysemu/cpu-timers.h"

Reviewed-by: Thomas Huth <thuth@redhat.com>


