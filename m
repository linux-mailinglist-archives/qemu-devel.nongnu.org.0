Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587DB6104E9
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:57:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooArl-0007do-Lw; Thu, 27 Oct 2022 17:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooArg-0007dX-SO
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:56:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooArc-0001Qr-7I
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:56:40 -0400
Received: by mail-wr1-x431.google.com with SMTP id y16so4395795wrt.12
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nOg72UALDVd3KSQFLEOohh1wmwLYUEPyPpGK8sUrnyU=;
 b=TH/PChwo52iRMrM16F5/+rYXsK2J9NShr/ct2FRG2cbn8DQ0zPlA0ePX+XAx3S0h4u
 2mf1ZlIWxiyipqwGzr9wQwe185IMIANJgtZiQDd0IuTkiaeJz6GDqloAN5dpGAFi8Zri
 Ix3tMDfSsZBu+5jurLRZ96D9vb14fRnQoSesU6x5E5NX2XJb1yRo6QjlJBp2n1UeNUxA
 TE820N/zlExXdYaL78hyg6HH3PJsnJkPsvCJrmUrjXzgNTSpakZIy7J5HPsrl2sZisw9
 a+hBwUz9IeBekQVXrrWWcAtFmxV3v3NYOsON75zkF3fwiF/yw2U15r5gwuLXnEKXLYBu
 zAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nOg72UALDVd3KSQFLEOohh1wmwLYUEPyPpGK8sUrnyU=;
 b=DvUE9Kxt/at5MxyEwuHxb7ASgAhDv8LAe5gMVId1U4o9myfTEVKMVR7tcGrDXkLoX9
 8PntH3cQHzVJ9F2rEVxApffIvCKpkVUlPEnG3FCc9Nz1ZesJ0VIp8NrsNaQdCJ7HpDyx
 Ycr+S2K8HXq0TaNp4feZClh5DtaCQPgMuWDXNFAjx2YclEdWR6n5R6YdLOd2mG7X2qgC
 psh89LVkpGo3ze3MGKh84jbc2v0ZIO57SfOwGl4057wx921fRXvHklxqpnY2dDmmzz43
 dqDPJX36r58NMRi6VlG85rUMsuzF0Ajsvvdaub7wOCfuHXvXq9TrSiMMgbV0DWomep9d
 ftpQ==
X-Gm-Message-State: ACrzQf3ZVU5esX1YxqsQd114ZDn4WBVhQhZ7v2opKDx7SvRSY3yWMjbP
 s1uoPjSPjAEP6AqS6sovTMBgow==
X-Google-Smtp-Source: AMsMyM4+9ejxfcT42bXQR82w6aVfbOrM7r9ENza0FgCOsSCEC8z2dJSMWXCKGXod5/wjL2BgMA3Leg==
X-Received: by 2002:a05:6000:1549:b0:22e:519e:f39d with SMTP id
 9-20020a056000154900b0022e519ef39dmr33484093wry.703.1666907794824; 
 Thu, 27 Oct 2022 14:56:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bv27-20020a0560001f1b00b0022dc6e76bbdsm2247688wrb.46.2022.10.27.14.56.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:56:34 -0700 (PDT)
Message-ID: <736a625c-11ce-dea4-2404-dccaaba27800@linaro.org>
Date: Thu, 27 Oct 2022 23:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 4/4] hw/i386/acpi-build: Generate AML for north and south
 bridges separately
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221026133110.91828-1-shentey@gmail.com>
 <20221026133110.91828-5-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221026133110.91828-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/22 15:31, Bernhard Beschow wrote:
> The code currently assumes Q35 iff ICH9 and i440fx iff PIIX. This is
> slightly confusing when trying to understand the code. Split north and
> south bridge code to communicate which piece of code assumes which type
> of bridge.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/acpi-build.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


