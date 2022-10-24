Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 589176099E4
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:37:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompuC-00011X-8a; Mon, 24 Oct 2022 01:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompu8-0000wh-FN
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:21:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ompu5-00038D-Sv
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:21:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id y16so3905165wrt.12
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c86zmbaMaZcEsyu7Kf4nhwc2lUOMO/6TurpIaqUHNTw=;
 b=MDpl6bn+DZvVJ0+ytO5x99CCvhR+bWmRCUOyFVPsqa8gX2XREhX9Z3poalJj8BqMnv
 q8gxlBbj/+J/k/n7MGqtFzXmIhrbUcdLBqSsLT71vy5zydOJ2b1aQyJWDezK6AWlsMod
 8xLmSX6GC/uPeIZStlXUAC5S/bM9FogMizSPhvpnQs0Yl8d6seGw6ZtogAKZYRTF4cI7
 XWeDEiWSq4JVpPZqbd6CHpzYudhxJBMmRPMC0sLQ8lYFOA9kt1UzXcF0LwhSXMTgpTzo
 aSfeGnqSoRBWDDlRpUEoefF3Wq4OoCTLSXvwxq3zxqP+8RFZQweqOMcVS2tLG9ZxBJf0
 rpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c86zmbaMaZcEsyu7Kf4nhwc2lUOMO/6TurpIaqUHNTw=;
 b=ID9ohogbJOdmP1q7jBv2VMxWj7gISvYAAyVrvsEqjPSGVR0WCl4BpfX6N1dqaJG0Iz
 4IBo88maIvEBWEPLZRnd55yhcTd3ey5ZNI2fSHfe8gRTVxdCcuqbBM+wWgFa7DALfftZ
 JgKa1aon2bTv04hQJBzjCi0dNVAypEG63t5sGj2mMP8GRPSMyQDobDXRm+i1lZ2SpG5Z
 +HYohI/PEjfifeBON1+Z/hjhDoF+1QYmwkGTeckYgpImC70ay0vUtrX0cBg06ZYfreTK
 VURWxx3cSkCp8PdsFGPy9/QgxSlrnMuYJ7dKi8k0EBUwq1wx8fZrB7CdtwCyAzN4R+pg
 SPsw==
X-Gm-Message-State: ACrzQf3wdZt7vGUlm35xJqWei1FS3eUU/ddHQ+Wnp0oxup9TaoI4j24J
 /zccuOYfQYchbMyOblx2VkKBQw==
X-Google-Smtp-Source: AMsMyM6KV2gohAMmx2WKi6k6+Bp8yglwQx3adUTfxzV2/KiTpouKO+K/nmJHl9Ob19tgm3g5zbbgEg==
X-Received: by 2002:adf:cd09:0:b0:236:659a:6902 with SMTP id
 w9-20020adfcd09000000b00236659a6902mr4927803wrm.574.1666588896236; 
 Sun, 23 Oct 2022 22:21:36 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a5d604e000000b0023677081f3asm458961wrt.42.2022.10.23.22.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 22:21:35 -0700 (PDT)
Message-ID: <a45d292d-5f68-6406-3dbd-4abb9eeebb69@linaro.org>
Date: Mon, 24 Oct 2022 07:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 37/43] hw/isa/piix: Harmonize names of reset control
 memory regions
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
 <20221022150508.26830-38-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-38-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 22/10/22 17:05, Bernhard Beschow wrote:
> There is no need for having different names here. Having the same name
> further allows code to be shared between PIIX3 and PIIX4.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


