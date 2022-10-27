Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66826104DA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:55:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAol-0005G4-U2; Thu, 27 Oct 2022 17:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAoj-0005FN-Ov
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:53:37 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAoi-0000nD-9E
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:53:37 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k8so4445002wrh.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/gR4v2T1q4sZL6MEvxezMFInQdUFeiDMJM3BIOJJCDM=;
 b=r3caRZCdhsp0V1nvkI25sWXaiCHfko1CS4P001TX7YaRzxcBWr06jZar302Kr9QqAF
 Xm+OzeoQ4BUQ3GJA3aSF4QnCjLPccyOqmkp48VJe5st8vnzH1QGnwc2WKZLIAAjCr0Go
 wpmxTqYcQsgiFfJCe9uLhmn2acbYj3wrA7aJkunu9EtN1VEgnx3gAcBgxVGnWSYNMKDt
 Os2ElaQqEZQlJouvwV7wCAtVlIBgwm+7QZQm3DXN9YY5DshX4RkFM7tmSaPQZP6CdqJ+
 g+5cpjE+WiFjKwYm56FB8cqXc7NaFTayoM/hsFQBVzpPPXbqwPQdDn/WE3h5yc5gQSvB
 YESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/gR4v2T1q4sZL6MEvxezMFInQdUFeiDMJM3BIOJJCDM=;
 b=aaqWMFEukiK4VNldHGndV0iP001S/jvMlUoeGOaayObcWZISIedMuk6mhtVZ2Y+h7Q
 fOAium7MK0UGhEPdWwtHvyejjmcUsLJKa7rUytCaHnSD3qpBTr/tRf5bhHfGzBpN2ZmP
 JwRgBNJJSGmNTAvrMtAIiGIW2fCYp0fXaayusNn2OUlnH4le7l+2V3BvUorDKRJsYap6
 tn+HhvE3Nu8Ie8F3g2EjmNZUEN4UgYajhu5llx3tL5I2xvn3r4ucu5H9vVyafik8MFk1
 +95NkkCptdp/B69yq3eAzXPY6Uoz9R4zAt8rlZyxJXgxl16yWxfAp9qL1OCZqO78Ooaq
 8MIQ==
X-Gm-Message-State: ACrzQf0iUQT5eDzb0/RE1aHNcXMSmhTSyxjmszVcpwAgT+AYrisoRV67
 V72xgkTWZo9TggTSjoPrBPQEzg==
X-Google-Smtp-Source: AMsMyM7ueT9j/qdRqAdfro6Nd8qGi8Wmd/vFLJJM7D/Qz2ffDliiek/KQVclnw822/mlRgOMniGvpQ==
X-Received: by 2002:adf:e19e:0:b0:22e:64de:39fa with SMTP id
 az30-20020adfe19e000000b0022e64de39famr31886618wrb.369.1666907614065; 
 Thu, 27 Oct 2022 14:53:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003a5f3f5883dsm6249707wmq.17.2022.10.27.14.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:53:33 -0700 (PDT)
Message-ID: <49249e65-1ac5-7803-e617-5a2a774d3ec7@linaro.org>
Date: Thu, 27 Oct 2022 23:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 2/4] hw/i386/acpi-build: Resolve redundant attribute
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221026133110.91828-1-shentey@gmail.com>
 <20221026133110.91828-3-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221026133110.91828-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26/10/22 15:31, Bernhard Beschow wrote:
> The is_piix4 attribute is set once in one location and read once in
> another. Doing both in one location allows for removing the attribute
> altogether.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/i386/acpi-build.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


