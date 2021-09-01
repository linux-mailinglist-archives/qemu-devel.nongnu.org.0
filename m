Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBDD3FDD77
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:51:44 +0200 (CEST)
Received: from localhost ([::1]:42804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLQeV-0003lG-9t
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLQdF-0002lu-Ug
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLQdB-0006LF-Ai
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 09:50:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630504219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ni8MueqktVNDZSqGsEX23K54ZSfGfBieGeEI4LtCFds=;
 b=E8LK6dFWKxYywjHl077ASXjmF7hVpXBNq6yGlQXnEaiciv0JI+t2u9bmfrtJzbyT1B2/Tt
 RRPau1+6ToqTZOljzGZtp7sydo3zm6k6jI85YPZ43XHYRdoFMt5KHbvkuxy6N7ZtAWw/QR
 Fi+P9QgXGmSZiL/U56sDuv0pE+OWUBE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-yk5aWsU0PWS4P1t3bdOXvQ-1; Wed, 01 Sep 2021 09:50:17 -0400
X-MC-Unique: yk5aWsU0PWS4P1t3bdOXvQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so830638wrl.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 06:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ni8MueqktVNDZSqGsEX23K54ZSfGfBieGeEI4LtCFds=;
 b=UBImc4EuoQ2x4fSu8JNL8kRxuQVDLB/irkY/asIBXZD2NjIO/M5euPvGicAiFGNAhI
 4vEXx7t2L/N6GYwKHJ4nty/oyCQ/WufSHI/YRZuF4a6H+FL0/6Tr6bFuIIW3YjmFbcJA
 Zn57bYTsju+lq0XzIULbZJEOM8OqhMvFBr656IsbgfF2bjeS84KchlhuuJvD9JqlYjxC
 fb5dEZxLxcVZ7SQdvS2FNuOZaEWnAFey9bAjtWmYbjaEmAgXuddGzjqvcaiLzBftoXUt
 Vq2cOwjUypxadre0X2xZHfW9pQrlP9m6pmEhzgBGhpaZndTGpwoq5tkVDmtjmcyMriD7
 VeAQ==
X-Gm-Message-State: AOAM530bp7AMzmyeRzcKQ9P9OXHlxws7Jz/oGhznl+JcXNY+pEVrj1cm
 hoiY+H9q16Ufb7mibsUrN4cpUBVnwqZBjWdT0wkLk75w9gJA0HnU9dSowi5tpV9MbGHRd973pSL
 Iss8GruZZDZaaB84=
X-Received: by 2002:adf:c54f:: with SMTP id s15mr20728609wrf.222.1630504216578; 
 Wed, 01 Sep 2021 06:50:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEHcOU9XqC5TQ7rO9MRW+hqyWUwY759Kg0bQ67lbDm7eUtqGhwBny/R30ljGc4ft5iGykt7Q==
X-Received: by 2002:adf:c54f:: with SMTP id s15mr20728569wrf.222.1630504216303; 
 Wed, 01 Sep 2021 06:50:16 -0700 (PDT)
Received: from thuth.remote.csb (p5791d006.dip0.t-ipconnect.de. [87.145.208.6])
 by smtp.gmail.com with ESMTPSA id n5sm5369075wmd.29.2021.09.01.06.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 06:50:15 -0700 (PDT)
Subject: Re: [PATCH 2/2] Acceptance Tests: updates to the MAINTAINERS file
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210803193447.3946219-1-crosa@redhat.com>
 <20210803193447.3946219-3-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <60be05ac-214d-ed47-9ce5-6ec929c24f3c@redhat.com>
Date: Wed, 1 Sep 2021 15:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803193447.3946219-3-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.029, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/08/2021 21.34, Cleber Rosa wrote:
> The tests/acceptance directory is currently lacking a maintainer
> entry, even though I've been performing that role (of course with help
> from many others).  Thus, its status is, even more now, Maintained.
> 
> This also removes the currently broken Trello board link, which was
> make unavailable unintentionally by a third party.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   MAINTAINERS | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 37b1a8e442..d35b948e8d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3418,11 +3418,11 @@ F: tests/tcg/Makefile
>   F: tests/tcg/Makefile.include
>   
>   Acceptance (Integration) Testing with the Avocado framework
> -W: https://trello.com/b/6Qi1pxVn/avocado-qemu
> -R: Cleber Rosa <crosa@redhat.com>
> +M: Cleber Rosa <crosa@redhat.com>
>   R: Philippe Mathieu-Daudé <philmd@redhat.com>
>   R: Wainer dos Santos Moschetta <wainersm@redhat.com>
> -S: Odd Fixes
> +S: Maintained
> +F: tests/Makefile.include

Not sure whether we really should add tests/Makefile.include in this 
section, since there are only a couple of lines in there that are related to 
the "acceptance" tests... Anyway:

Acked-by: Thomas Huth <thuth@redhat.com>

Cleber, now that the freeze period is over, could you collect the related 
patches on the list and send a pull request?

  Thomas


