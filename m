Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4664FD0D
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 00:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6gg6-0005q1-C6; Sat, 17 Dec 2022 18:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6gfn-0005pT-T3
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 18:32:55 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6gfl-0004O1-Uv
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 18:32:55 -0500
Received: by mail-ej1-x630.google.com with SMTP id m18so13972004eji.5
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 15:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oJBWpFPz9Gn0Zq0uuU3uOpARGDx+9nGXGOsTMP6eo/A=;
 b=fl1ATgwgCbjlFzO/pKFefr7ule/XFeg3CFxbvJOQwm8qJURhppwUpc8VbWmteqTdJb
 kkpk0dr3pXHZnIk1VAGi4GKlSauoZloo5G67A7mPK6bcVKDRE5ETHgrPLr0l9fRhLSUh
 8CZUre2Tg4LzY/W6LpF6zUZsT2iqKdaRSRB8o7Plbb+QHvu+HZZmrlgxuRZ8seMmX8uy
 c5zpvaw2zzQxUpQJhQrTSnrcw8gXAuF/v99+QgxHSOpnBWhRfAs8R8riklU1q+8nmJrr
 Y3XbtSPnjd93caZFFlDouCW27j8nGJfO0Gf5qzRXiWp9vSIyCZ/FDXq8x+2gJkgI/dRe
 IJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oJBWpFPz9Gn0Zq0uuU3uOpARGDx+9nGXGOsTMP6eo/A=;
 b=QS2hnqs3e84nRF6YVVkt1XODDA+tcHd2Cl7iY+Stuem+eOqP7WsxndIgnv+zCUhjMI
 AonrKDjh45PS3MSwOaDV1Cect1v+GQ+jbXz4p9ExQW2IowXh5QxhoiPq6R1HN/uWtGTC
 TPideGq3lvRFUVwt/DdyM3iUB9TZqY+Mhzwc70K6JK5PEkM+FT2rQ2pPISDTPw/Li2OJ
 cpyBgOlu5Pfj41riqMU7ddZmWQVLwLXxJgbsVNUAceext2QV3NeAoymYv42Wf1oIdy9O
 EdqGEMQP1A64hCMMBghwcUgIGbRZNLkQOvN3BhPFywRnkw+VWH9wvYiADBbGyHpQ14bd
 K42g==
X-Gm-Message-State: ANoB5pkcbpRVezexTvuQKlGAmyNwi26bc0t7NfFN8Ka/Ga5+xOoTE/VQ
 7WW/F926cP/BcQf+U1Nv6m379w==
X-Google-Smtp-Source: AA0mqf7kVLnOBhfj5csGFXR+MteHRgBrKxrlNrL3qfl7Sy7P+GUyJk040G4E4rLlKt/VBUe3v7ocoQ==
X-Received: by 2002:a17:907:d12:b0:7c1:54b9:c688 with SMTP id
 gn18-20020a1709070d1200b007c154b9c688mr37314773ejc.60.1671319972337; 
 Sat, 17 Dec 2022 15:32:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 et8-20020a170907294800b007ae10525550sm2478889ejc.47.2022.12.17.15.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 15:32:51 -0800 (PST)
Message-ID: <476e90c9-92c9-8721-1d3a-052778438d71@linaro.org>
Date: Sun, 18 Dec 2022 00:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 5/7] hw/isa/Kconfig: Add missing dependency to VT82C686
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221216130355.41667-1-shentey@gmail.com>
 <20221216130355.41667-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216130355.41667-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x630.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/12/22 14:03, Bernhard Beschow wrote:
> The ACPIREGS are provided by TYPE_VIA_PM, so needs to select ACPI.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


