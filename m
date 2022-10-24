Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC309609ABD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:49:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omphi-0002ih-OK; Mon, 24 Oct 2022 01:08:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omphS-0002d5-6X
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:08:36 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omphP-0008BO-L1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:08:33 -0400
Received: by mail-wr1-x431.google.com with SMTP id z14so811708wrn.7
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v+0X4rpcNMHjcPtPL+w3aiM9Cuf3a4hHptoWFH+xApE=;
 b=PAnltcHLk8lm32GwPj0V37rRvO0TkLqifqMCDPJV3CnDB66QIQrLsJMoPmVH4+XnuM
 liuPkePvFFaI7KXZ/PhnZftp2GTvbqVk3D8pWuHIRtgkQdNwdrUmyRaTuPejoXZ2GGbx
 u+jHjNyGK4l7PLaRfl3iFRrDot0A5As47VFMjurDzUskGcZRMCTKoR837Rs0OyHsez67
 suH/Le8yctN/D6rtr49IWnKdRzPHpp7wf7jHbQjy02RR8mysZi4gzusKs3+7mlzsK69L
 yc0gTHFQi/ccQV8g2K5zOFT7Ga7zLJNSCJWPcleJiP+FdcrrehoxZ25C5psylIM6gD8u
 jmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v+0X4rpcNMHjcPtPL+w3aiM9Cuf3a4hHptoWFH+xApE=;
 b=18xUOWW+esShmL4nKD13swrk1S8tKMspNloCsXfkZCR81WwwaJACY9aPkZiYjNMKja
 xUM+3AfAxxwzEt51wQO/QnbGyQCkrfoqkdFZ6T4JlwYIAWd9ViGTAZj7ZXAOV60CHOB3
 9TZpy9TSXjQAQo7VZYb9OtmpqF/M/yWPkB+yx15KGvhOrTKXDyp0z9TeLkf9/oSTI2Nn
 Oes7HFUBV0sH2N0OLhkGssUko3HoVvUG073Hs5e5YJms+uv8cE06xkRXQ+pF71McyxG8
 V7199PZS/VlUXl/WrD444SpwRNV2pX4DAoriFfHslyF2YykteRjdD885t3NMj+VPbIhl
 QoOQ==
X-Gm-Message-State: ACrzQf35UEiYyhlER+chOZyumR9YKyyKiVswwitxSeVDak1ID8RPkI7s
 mbX/BRx2zHKSbwPAGrUI+ASu1g==
X-Google-Smtp-Source: AMsMyM68nYy7Fv7jEXIoXaBC+wZ5hyKSp1KyU3ZR3np6y66+ubLYORGX96jzpRL4/gOQoinUFBPQrQ==
X-Received: by 2002:a5d:6f0a:0:b0:22e:4957:2eaa with SMTP id
 ay10-20020a5d6f0a000000b0022e49572eaamr19817028wrb.27.1666588103686; 
 Sun, 23 Oct 2022 22:08:23 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 l185-20020a1c25c2000000b003b31c560a0csm9595275wml.12.2022.10.23.22.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 22:08:23 -0700 (PDT)
Message-ID: <a5d2d4bf-a437-857c-4791-9e4f4a4147a3@linaro.org>
Date: Mon, 24 Oct 2022 07:08:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 21/43] hw/isa/piix3: Rename pci_piix3_props for sharing
 with PIIX4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-22-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-22-shentey@gmail.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/10/22 17:04, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


