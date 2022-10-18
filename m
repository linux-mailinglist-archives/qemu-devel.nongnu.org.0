Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31778602C14
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:48:47 +0200 (CEST)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okm1U-0002a2-Rb
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklKr-0003QO-TZ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:04:47 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklKp-000559-0w
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:04:40 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so12029528wmb.3
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KQVOF+68mFNYqe2xp7owYEHSuQt1m8o4QyeBENPQef8=;
 b=C0uasrQgkUU2ydc1WrtrbK/iFSCTyhIBhr+7yB6zIYc6lBoOIUzR4cWIYsX61vS/OD
 ARb0p7s1T0L8zM2+Cnbc4C/3rfjKCd0FixbKrRmJ8Y/PnlNFsBHZYsu3wNyxS5wH5mMH
 9p+JZ5sIqzIY6U/S0vU+eLyxs1UUK9YjyFFzzu36GdqJp+sMMlVMT8Z3/D6RHBtO7BmJ
 xNBAiJ2AJ1UB2TVCUengPtvmg9ugPpLoPDLLnyu7STrexxkMFA8bywS4QIqc7f9ZUd5u
 PgzUYoyG+HhuuQD4KI9XS2eaM1PXVodkYHH9+X4gWEbhTXpt2lKZ6j40LXDFvPXMHvHl
 OZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQVOF+68mFNYqe2xp7owYEHSuQt1m8o4QyeBENPQef8=;
 b=qFvqbyH4C6dUMJv7e6ALyoH3yRpjawiUCeQRnrD5sNASX/cOkJycltRq5Uqrc+JBw0
 ohnIW2P/tBQ9trmiC2G1j4Zdn2MSV9rXV9Ger9KgoY952VIk/T2Xz/gl9UhtwJR0NrTW
 fZ2g8CM9TkCfbrKHYQuGkubXfaD7ifPsroYeftZVfTUFHNdU16l+gfaDthOqJDjrKdxk
 6glZ0pcyhHvP95A6iX9102p0jP0InpxMxPI7C6bCGpOgb+uubJ+1RjXaiMnSnT/evO87
 hCeiNlDHwIQrrC8LBU/gakukqTOAJo73qTp0MjjoC9S7DgWejgaswWh0jwNbdn/BrrDm
 smTg==
X-Gm-Message-State: ACrzQf0rMqAEB1vGAVHIiAM8tf9aVvxQV8V5syK7RJS3OTLi2M2Qe6h+
 +XXNBY3i5IvypqMjF+5c0VC1QA==
X-Google-Smtp-Source: AMsMyM7NSrxDhVVB8P8AhK+km90CM07tiI7w97EyxnEKeHJR1eNMXHjDtGEb+/K9WjqnyXrlUzrw1Q==
X-Received: by 2002:a05:600c:468a:b0:3c6:f1ae:3e95 with SMTP id
 p10-20020a05600c468a00b003c6f1ae3e95mr1765342wmo.152.1666094675883; 
 Tue, 18 Oct 2022 05:04:35 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n4-20020adfe344000000b00228a6ce17b4sm11089123wrj.37.2022.10.18.05.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:04:35 -0700 (PDT)
Message-ID: <b0aa7270-0bca-4f4d-b6f0-7570f4c330df@linaro.org>
Date: Tue, 18 Oct 2022 14:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 26/28] qapi virtio: Elide redundant has_FOO in
 generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-27-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-27-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 18/10/22 08:28, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/virtio.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/virtio/virtio.c     | 1 -
>   monitor/hmp-cmds.c     | 4 ++--
>   scripts/qapi/schema.py | 1 -
>   3 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

