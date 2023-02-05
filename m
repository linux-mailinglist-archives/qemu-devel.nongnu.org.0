Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF4868AF77
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 12:14:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcyR-0002IJ-Lr; Sun, 05 Feb 2023 06:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcyD-0002Cb-6k
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:14:05 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcy6-00082G-Ar
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 06:14:04 -0500
Received: by mail-ej1-x633.google.com with SMTP id mc11so26777010ejb.10
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 03:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k60XqSjdD4hzSE+JIcYGghl2/ztRY94BciHCglF4W2Q=;
 b=GYVlNnHzLs4Inn/znZTP6jHbB6SjqbIGNEv6rj+uU5tMkPbnUKt5WMedeX3FoQlytx
 uEA/hKPBeqqvbdyPF8Jj4LD81WHR85iuw6M4vslUMxEKo9ARorDhlsOr72oV2Wy6hTkA
 3qZ1dIa3e2D/1ZsxT4uamRArrZNgc+9uuLtEIKchydvUtTobBJKnSYCqP416Jsnn+DmS
 LIza2bdn9rsx8cTDpXWAL9PCikDUvOgfgyM2uzX7ZpU5RUGIa1nw62Qb3CXNHTlUgtjg
 3huMkH9NJrTaxtLJ+0EivsGIRduKGd0jXKqylx77FJcvqjVwo5QO3SiFwH5duGxV5d3k
 tjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k60XqSjdD4hzSE+JIcYGghl2/ztRY94BciHCglF4W2Q=;
 b=PI8mpQROvbCX354/MzH+yJMi7/6TjRw7ffw9OmV2amxoEo2kGwkAt4tuoW+r6Sm0WP
 4uqBc+r+PTwGEel1HV4gzpsbyR7JH545Pni6in6VJQfBcx6X6lzUY3vUKHFxFYIEojaM
 sJzqYRA3caETAn/OAzG303WXGK4GH5TrmB+Uer41h+Wioz7FYQvk5u5mMxSV9CbEdCYw
 EV/Suw3N2MOtUbguheqYXBIwRKSGu733yibFTfzctYV/xPci9GeovIrwm5vppzXI8Qgx
 aGHTtV5a5FZAU7VVjr7sV5PZicHSY8t7wHMqY+97Yy8y6Yhd0cFX9ulc8FDVvQsfhDmB
 C06w==
X-Gm-Message-State: AO0yUKWjJ1IkodbbFG4vDG10Sy4g4uz1pCLCi71tYc+an2OSRO1XT8i4
 xB0/oWfNzAhwKLWfC2NH9OjRwIGOwzU+6cf9
X-Google-Smtp-Source: AK7set/vC4Wz3fMiQlJ90qd6OMmSxeutjqQD3aSw+HCp6BwNoF8xm31oWoDi9b1+BweChOSPvM0oRw==
X-Received: by 2002:a17:907:cc04:b0:84d:4394:e8e with SMTP id
 uo4-20020a170907cc0400b0084d43940e8emr13542205ejc.41.1675595636737; 
 Sun, 05 Feb 2023 03:13:56 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a50d595000000b004aaa09d50adsm1850088edi.94.2023.02.05.03.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 03:13:56 -0800 (PST)
Message-ID: <f0dac191-f8d7-635d-9431-14c1b4e1207a@linaro.org>
Date: Sun, 5 Feb 2023 12:13:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/9] hw/i386/pc_{q35, piix}: Minimize usage of
 get_system_memory()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20230204151027.39007-1-shentey@gmail.com>
 <20230204151027.39007-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204151027.39007-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/2/23 16:10, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/i386/pc_piix.c | 2 +-
>   hw/i386/pc_q35.c  | 7 ++++---
>   2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


