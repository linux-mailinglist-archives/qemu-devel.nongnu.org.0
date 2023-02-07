Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4865268D078
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:18:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPIFP-0000J1-Nm; Tue, 07 Feb 2023 02:18:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPIFK-0008Rw-In
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:18:30 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPIFI-0002FK-Ou
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:18:30 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so2017680wmb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 23:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aoJp/X2qeP4aHLRK+qPZEOY34PqbOLhVAXlhXswFXQ4=;
 b=PNVPVYZFcqQo0+NAGYZBBOEXAgAS6KmW4hOHJNuwd2Qz8cp89ZN0T11A+TmvXDLSi3
 zNWA+D8W0TUnulEcTetk0PMvZD0oUZro68XqnSR6I34R5y+m8RMfmsMFdEZSH/sG48G5
 IdyCU45a9x/I66/+RcRtpb44i918iDmG3LRoW+g5yLG0C2xrZMtJ/CAUJkIBvPiOreDu
 6MAh1TY6A8mbLjEjKtrXHF+F1gkcmmN/9poLkYkqKVuET+4ILyJH2ef950k3JH+1f9Gn
 fYc8AfeC5gRPHQKsBYVpXT5D+kIRreSNzyma7XeF4Y0oeGd8is9j0zhmkOlCESTemYov
 UZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aoJp/X2qeP4aHLRK+qPZEOY34PqbOLhVAXlhXswFXQ4=;
 b=eNeaxnXlAbTL+VTybJt974oPVBYztLpSMhq9jXfk1zODaIlR/FzrHmX+B/UqCIGr2p
 ST8w6td/TQeEiZEjdCDgOisWgZ+UfABgj9f5BtS+46oZUVo5pIqYbjNJHPFuf8Lm5nUY
 m4IuycHyDZ5MA7YOg8KKAzzREKknysFznVK9lYW7UmbFD0ktGj6YPRy1HhozbmWpeROg
 ylrIspt+v2Gwlb4ATALiHbEUnxY4TYVjZoef4GkrQPQGA9vheN7FtzmMTFhEAeBJSTbY
 nXs68FLV3c7fpffYoIhrtgDhofmJOjibpelaMLW1IH2s8I4zDuhJbGA20Znh8C4Na9Z5
 d/CA==
X-Gm-Message-State: AO0yUKXj7H4FY0Colq5VkSSmxUFH4FjcfewcdOjZGcnLLy8Lc16elHAV
 zaP4VCYLp91r8tecaM9hkj3aaBaOBikE8I+L
X-Google-Smtp-Source: AK7set9on837emuNWh8QauGSl8By0Dtj5gLl3amMPnHXrzwylQJKCTlPKaMNB2r5sAYeF++f0Xe80A==
X-Received: by 2002:a05:600c:331a:b0:3d2:392e:905f with SMTP id
 q26-20020a05600c331a00b003d2392e905fmr2045055wmp.24.1675754306899; 
 Mon, 06 Feb 2023 23:18:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s22-20020a1cf216000000b003dffe312925sm6177018wmc.15.2023.02.06.23.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 23:18:26 -0800 (PST)
Message-ID: <084f4fed-5646-d30b-21c9-0402063ae5bf@linaro.org>
Date: Tue, 7 Feb 2023 08:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] hw/arm: Attach PSPI module to NPCM7XX SoC
Content-Language: en-US
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 titusr@google.com
References: <20230206233428.2772669-1-wuhaotsh@google.com>
 <20230206233428.2772669-4-wuhaotsh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206233428.2772669-4-wuhaotsh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 7/2/23 00:34, Hao Wu wrote:
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> ---
>   docs/system/arm/nuvoton.rst |  2 +-
>   hw/arm/npcm7xx.c            | 25 +++++++++++++++++++++++--
>   include/hw/arm/npcm7xx.h    |  2 ++
>   3 files changed, 26 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


