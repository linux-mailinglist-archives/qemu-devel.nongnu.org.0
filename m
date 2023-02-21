Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A2D69DBC1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:17:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUNpn-0002kU-5b; Tue, 21 Feb 2023 03:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNph-0002kE-UH
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:17:05 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNpg-0005bY-FK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:17:05 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso2834901wmb.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9yvx4a1JYYIIgoRDMFKdG2n6jdXOMmSE/xS1/gVlIIA=;
 b=t1ctgao7jHou2AVstBRBu3azuEd5iJ55w/s9EC45nOFLdzllaJLZZEF+snPQvTnPgb
 b9Fv/hHu2opfg6ksiOPLlr8BDbxNruRYymp8qc6BaTEBrf9fr0h+h38ac1wlm5E03wMA
 vu2+K8RTeHoB2PM0ohGgmyHSaxk7i6GY2TaQh8TI4/7arfhx3D3b/Xv/kjRTy7+rMSTN
 uUR4LFRu/vagjrCVgId8XcduApTHqzubl+7wvZ0eOjZWXUEah0GzCLerqe6T5pHkwHz/
 c1pdxUvu2fgwUbCZUvJnDx91YDkplr6i3uDYBnuPhkf3xP5u1Ac+T/+2CnWmfeLq4BQd
 ukgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9yvx4a1JYYIIgoRDMFKdG2n6jdXOMmSE/xS1/gVlIIA=;
 b=uC9NnWZwQiIN0s16vC/+MNuqmTUwRh49eBKI536fuSXyRGrwiNfDts9dHwzto2kPSM
 cWHFd1sdzwx6RH3rVj9riLZBP++mjTI1LwRE8HFLPl24eHyUE91xSxwJisZkT0y7+NXP
 yqO/mpAxeFoHV/T08vbbK9Fte0n45eXFGWGt4TmzJhCVXZjwxgRfZ+SC5MggAsa4QNfy
 wy5xo1QbGwo6AcyOefvWQ/HRuPHPimE9mFbSOloglnTDPKBrVVHJBgSxnFcLMFEfCRX9
 M55nudaluot97Dvav6DWkvJoOLaEWcHK+To4AO3FUXdLSmtEYhJZV9S/CY5AtLktF+Nz
 YXdg==
X-Gm-Message-State: AO0yUKWLHkJeSf7xL6kkGlt+HYetn+T8RVU4nRelxZqKM9jyduYGSjUW
 muQwwJYdiBpX2m7RCMzhSd8t9w==
X-Google-Smtp-Source: AK7set+dKUY1SSgjNWoUJL+o7SNUUtMPgAa9UOutthVpqcuU7DiDjHOvn28UlLdcQt5d+Mdh/ITjDA==
X-Received: by 2002:a05:600c:2248:b0:3e0:15b:47b3 with SMTP id
 a8-20020a05600c224800b003e0015b47b3mr8759467wmm.32.1676967423013; 
 Tue, 21 Feb 2023 00:17:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c459200b003dc433355aasm3230655wmo.18.2023.02.21.00.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:17:02 -0800 (PST)
Message-ID: <885ee691-178f-5e2e-b642-36bdf7351af6@linaro.org>
Date: Tue, 21 Feb 2023 09:17:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 27/29] MAINTAINERS: Add Akihiko Odaki as a e1000e
 reviewer
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Yan Vugenfirer
 <yvugenfi@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
 <20230201033539.30049-28-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230201033539.30049-28-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/2/23 04:35, Akihiko Odaki wrote:
> I want to know to be notified when there is a new change for e1000e
> as e1000e is similar to igb and such a change may also be applicable for
> igb.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


