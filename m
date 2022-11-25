Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2AE638D6F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 16:27:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyaai-00077g-Rr; Fri, 25 Nov 2022 10:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyaag-00077Y-2b
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:26:10 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oyaad-0008G5-1n
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 10:26:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bs21so7252570wrb.4
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 07:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NNW4yvYwsnqME1bbfH04mRgSzoqllatq3oJujARZ6BI=;
 b=DmKNAS4sWjKtIwfJe2Ckn+Z0UNd5/LQH5Ch9H6rdQPgzbTD+TZ03nCDcnlrPB792Ja
 j9A3Uq0kmZxPC1UijZR4VTvsoWjFRV+IaPqyF/y/5FIgZEfPIshjRiFArBIq+mUxgrz4
 SdB6DGc1gNOjM7Cp82sYLxGzW5h3Nib2aplcKdKc/nnB8MhTkRcB2Ou7uy/SzwnsEPwy
 HtPOFjhd08Mj5MvgVuOT/ij9ncgk0ayf2lJcpst+QonSqoqZOAzL5hJ0dlJLdAleGLPQ
 lkvhNT6qoJN41c0D+14bqFmKRaIMLMxcNtD+8rSWbhFxsLPWLGsH+v2TqQ099b/M/Mux
 me+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NNW4yvYwsnqME1bbfH04mRgSzoqllatq3oJujARZ6BI=;
 b=Pks3kTpza4q+Kv1QZO7TsZxpgPdr/OGjpln9UwWm+3YvVpK2YHTeG4eOALnwaZ/gmG
 2i+QITAE7Vj7Oie1A1WmJJ00ShwBPzQLZA3XyzZCEtVg7+FIhKjq1cYfel4M6rgz3xmm
 zavenc6pioMhmx/f02o4qoms5PbymzTyGdLrHPckB1gbPIKiFFauFPfuWmGbGbJPRouN
 Nd//UQXnltCaGw5IYl1XXVKJWAaCD3RomSrl/5OUiYsBCsnVbQKDXy1+cY08LbyJohIt
 2cCBvpULy/JqRKqo+3UzrqjXAvblX5sz8mZW+bn7REkm2BbyGB/eVdSyNYmJF87wKMv9
 3atQ==
X-Gm-Message-State: ANoB5pnZs0tSkleEyLpXCYakrUbWcKFJfjaF5y3eoZZn6kyGsN/HDP0c
 Tmtd4Bpe7QhqcauSEg8xKdzbCA==
X-Google-Smtp-Source: AA0mqf4g6HD8qSMr6JCHneE/iVLidsfzb7YHf8H6mC3TUI2VlwX8AEPx8XZKfdy53emLs7tXqKjKTQ==
X-Received: by 2002:adf:eb88:0:b0:22e:3e3b:24fe with SMTP id
 t8-20020adfeb88000000b0022e3e3b24femr22546101wrn.668.1669389964455; 
 Fri, 25 Nov 2022 07:26:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bo24-20020a056000069800b00241d544c9b1sm4690089wrb.90.2022.11.25.07.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 07:26:03 -0800 (PST)
Message-ID: <89f21861-4e0f-e3e1-2f4e-17ed1427148f@linaro.org>
Date: Fri, 25 Nov 2022 16:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v2] e1000e: Configure ResettableClass
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20221125143656.61756-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125143656.61756-1-akihiko.odaki@daynix.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/11/22 15:36, Akihiko Odaki wrote:
> This is part of recent efforts of refactoring e1000 and e1000e.
> 
> DeviceClass's reset member is deprecated so migrate to ResettableClass.
> Thre is no behavioral difference.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/net/e1000e.c     | 10 ++++++----
>   hw/net/trace-events |  2 +-
>   2 files changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


