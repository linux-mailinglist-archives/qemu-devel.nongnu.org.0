Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C09667277
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:44:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFwvg-0004O6-8J; Thu, 12 Jan 2023 07:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwvd-0004L3-Lc
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:43:33 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwvZ-0003rv-3J
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:43:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso10576978wms.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JIMES/1egQyZahWwW0MZhmZ4dRHJB4QK4pSNR1zDUlw=;
 b=GNokx1Y4r9Sk2EXKUcB0f6MQgWq9XJWDS+49ugFYH1VwRgtnOlSA0kYmqmDwRTd+3y
 jVVExSMmX7p6ilVVHYZmrF16ND8QXAIIN+eymGvkbmi908FrYHrtmULZChaQ4NC2aVQG
 iyA01xprHZRtkFucXuW5HmGFxXJA45TVjt/hoD89j+B6IxfLy/9FBVe314iI3QZzmalW
 AbtCrD1+1vfugJBZGxXad66MxVTz+ldm5AsqpMJKeGQbgHfjdtonf+7xS691jbwwkTQ8
 ew+3ozD3Q38HX6XVAkHQuAdnMpOyGIGNS9NDw/IborQmued3gdQKnJMeXYq0fQsdsJFc
 +6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JIMES/1egQyZahWwW0MZhmZ4dRHJB4QK4pSNR1zDUlw=;
 b=I9bEmkfYZaR+oOFvLwBKoDtLn+6AzVJhN3ifjli/3ATXa+lxLgy68sYp8gOokkNmoB
 PuMJnXPzzFOBinyYMZ+MTNYjSfGvM8pH9WWkDz/3VW4Ks2CqDW0n6qJJnFPNhn/I7zNC
 SJjVLar1CY25DEtGGFAAQuCO8X1JeUpGoxyQeLeLywAtmeTsRcYqgoWxw0pi3gGlU5Vw
 45KpHUWTQGgf1UhUm8PdOnLhSybhjj9CGxsV8KUeE7puZVli7V8vQGvN70twtbQEcyHD
 Gz3FItnfpemEYL3weRXlVqYmhgRMCtJiseemdhGYRpAIFzfVyG3r3g6j8/At6l4uilPp
 8JtA==
X-Gm-Message-State: AFqh2krp3q1iTLdRi/Q283Hse57dp6PE7CKq857iaAb4mdRKmxG2jO9K
 I6w2/3MzneieO3Tm6XFpbSzm/Q==
X-Google-Smtp-Source: AMrXdXvd2JsPY+kiFovwZHygyM19Ejalh979cJbMk5ipujhFH1v5fXqKT0Cn8o2vq62r7efVZnynqQ==
X-Received: by 2002:a05:600c:4f84:b0:3d9:f758:e280 with SMTP id
 n4-20020a05600c4f8400b003d9f758e280mr9097271wmq.24.1673527407118; 
 Thu, 12 Jan 2023 04:43:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c42c600b003b492753826sm20286943wme.43.2023.01.12.04.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:43:26 -0800 (PST)
Message-ID: <85c80422-e05b-5718-f595-ae97d08e5ca7@linaro.org>
Date: Thu, 12 Jan 2023 13:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 13/33] hw/i386/pc_piix: Allow for setting properties
 before realizing PIIX3 south bridge
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-14-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-14-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 9/1/23 18:23, Bernhard Beschow wrote:
> The next patches will need to take advantage of it.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-3-shentey@gmail.com>
> ---
>   hw/i386/pc_piix.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


