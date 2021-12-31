Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D9A4823F6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:23:07 +0100 (CET)
Received: from localhost ([::1]:51554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Gw5-0008Nl-Pb
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Gr7-0001vg-VB
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:17:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Gqv-0004eI-Sj
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640953064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JaDXPBCrCiAWnLmP0Q3KzCBnhc9sFROHsxglIhNk4ak=;
 b=XE1TKNgPcW6pgEUBnpPxo07e4XVsKPTqS4uWWJvPT/WV3HBjU8tu9RfWX8WgYRz8OyzBlX
 lnx0so24NMJjmX5tT6RZXWVAPKkVwxwujJ7W6bx8k5KnYqLppRBAhUCT7qMa30Lllr8zsR
 ub6UEbHWvGdWDuFsWbrbElTCZeXlQo0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-HA2xdDrFNwqbRrXK4ePrnw-1; Fri, 31 Dec 2021 07:17:43 -0500
X-MC-Unique: HA2xdDrFNwqbRrXK4ePrnw-1
Received: by mail-wr1-f69.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso7547080wrg.11
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JaDXPBCrCiAWnLmP0Q3KzCBnhc9sFROHsxglIhNk4ak=;
 b=2BxBxMR2fr91kLWNsALlkj14NJWATgoNQlOy4KRITdJLC8ZLRK/pacEKU+Ue94lcpx
 s7mSV+7O1Rg3hdXI9fhlsIuFHlBzbvSXtycwEorV/ERHSB35teF1X33chl2F3nfoJxLc
 PSZXFiD9kiAydVQgbE4zSGnglIYVlH71wenK84yZBPixRRQR5CDdpH3GiLeCE2QUs6s4
 8LhjPT0qmUiqx0c/c4dgjb9XkyAEiQfkHu8hYXBwDMs9FDMLVyWZH7sZmsI/5H+StteY
 ue0dPuN+WDm4BAUUiWSO/nloC+42VHWB9v7tlCT2A5TIFFj7PZrBVLRg8gKmZAXQmTko
 F7cQ==
X-Gm-Message-State: AOAM530O6ZD+WrM+w7+3BeY4LcBjDQu3/rgfuWbRXZdqPr1W4KO/BG/A
 taX7WCojG/6tZ/+G7uxfSvbRzu+QNyZz0ynKhwkNyThS9Px+L8ZVeD2g92RV0OZQIIryYpf4BQm
 3ORmzAqRnQFTK1KrIx1uL1fwxOjscRxZ1mAUG2PMh33RgSRxYOyjyBnoem2rHzJ0R
X-Received: by 2002:adf:eb89:: with SMTP id t9mr14485554wrn.177.1640953062090; 
 Fri, 31 Dec 2021 04:17:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxCsuhXEU81V8ZkV30mCkCRJiCea+ZKvau74h7DPlsuYupoJQJhVZh865VoREAGV0Reuzl5Q==
X-Received: by 2002:adf:eb89:: with SMTP id t9mr14485543wrn.177.1640953061901; 
 Fri, 31 Dec 2021 04:17:41 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b2sm29674127wrd.35.2021.12.31.04.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 04:17:41 -0800 (PST)
Message-ID: <4fb4277e-58d1-06e2-6ad1-ebae350788e8@redhat.com>
Date: Fri, 31 Dec 2021 13:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/5] hw/qdev: Clarify qdev_connect_gpio_out()
 documentation
To: qemu-devel@nongnu.org
References: <20211218130437.1516929-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211218130437.1516929-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 14:04, Philippe Mathieu-Daudé wrote:
> Trivial patches clarifying qdev_connect_gpio_out() use,
> basically that the qemu_irq argument is an input.
> 
> Since v1:
> - Addressed Yanan Wang and Peter Maydell comments:
> - Correct qdev_init_gpio_out_named() doc
> - Drop i8042_setup_a20_line() wrapper
> 
> Philippe Mathieu-Daudé (5):
>   hw/qdev: Cosmetic around documentation
>   hw/qdev: Correct qdev_init_gpio_out_named() documentation
>   hw/qdev: Correct qdev_connect_gpio_out_named() documentation
>   hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin' parameter
>   hw/input/pckbd: Open-code i8042_setup_a20_line() wrapper

Queuing patches 1-4 via machine-next.


