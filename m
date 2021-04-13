Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734A635E4B8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:10:07 +0200 (CEST)
Received: from localhost ([::1]:40002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWMYA-0005rM-DT
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMQw-0008Fc-M8; Tue, 13 Apr 2021 13:02:38 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMQv-0007Cz-AS; Tue, 13 Apr 2021 13:02:38 -0400
Received: by mail-wr1-x435.google.com with SMTP id r7so5176934wrm.1;
 Tue, 13 Apr 2021 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ih1T0fRaTCvkRLs3dTQZ3qrFLUqLYYsPB2ChvWFapl4=;
 b=dRG84Eefo3pHKU2NwvuzWhkROloj23nTPSwmjKnqgmy+IXgYN/bz0bUe+p6P7ZegEM
 jaoEpiSs7dDU+V7mMlfeUYRpxbswv7zl0aKr5LZsf7X5TeNKg7nW/zdPG0MT3OkPA3mX
 NX6NGRPXS6mmzT+VPmeZgWA8+DL5lysQBafVPnMITycIkrCElJ5zGeGoxA6SRu4pQKXi
 jkpAzOMgrpRhtHSkNc3Jn1dBhcUsR7AXoXk8XEsa7OWb5V3OZY171BtP12Z8Gx1vWl+2
 f5RwfxpTlzMNE9NQ1ur4kF3a+SPuyeA8JJvGywVeqlStn55d4RRDcf/AopnnaZPgjTkQ
 yZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ih1T0fRaTCvkRLs3dTQZ3qrFLUqLYYsPB2ChvWFapl4=;
 b=Oyc2OJZaPBz9KroDIoVCksmRFKQfml6vxqnY6IQQv1NEue+IuNiZj1g/fOTwslbqh7
 GPXxHUczMfROgEP8Fl4c9vLqjKlosjoiZspai9zdQZ0ARkNtcOpZT49Llfvfb6tYfaTR
 JXI+HPk2i2wkG9ZH/qGZjIl09xL24KIftp1Obc8/OgZnE3v0qGFDhz4wuGzt2M5kzVmE
 s6y2cSpkkkza3fSyHtvA4RLnjSS8dJQEFjlBiVbVFqmv8EjnyF0P1OHTqJf9vNEnelIe
 /bmrbJZN7tq+lCCLCjx4NAIRRJyeSHtcmYIqB0R3UQDWGyWaKdLFnpybdElfC6k1XE7a
 x+FA==
X-Gm-Message-State: AOAM53228Zt7F8X5E/dMgSljRtRF5eUrYyvH6yZgB4+L5bwRQ6n3a7bk
 jNmfn+QxKIjfloOevGhWO3XnuVsvGwY=
X-Google-Smtp-Source: ABdhPJyDlOX9wQ/AIOcOTKigRtydpOwPFYE52EOa/BiCcyi4wzFKFWS0QREfJe9DBKVg8CVWl2P/rQ==
X-Received: by 2002:adf:fb42:: with SMTP id c2mr38391624wrs.83.1618333355132; 
 Tue, 13 Apr 2021 10:02:35 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b206sm2978816wmc.15.2021.04.13.10.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:02:34 -0700 (PDT)
Subject: Re: [PATCH 08/13] target/arm: Make translate-vfp.c.inc its own
 compilation unit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <32810f82-48a0-fd3f-dfe7-6b43901853f4@amsat.org>
Date: Tue, 13 Apr 2021 19:02:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 4/13/21 6:07 PM, Peter Maydell wrote:
> Switch translate-vfp.c.inc from being #included into translate.c
> to being its own compilation unit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a32.h                          |  2 ++
>  target/arm/{translate-vfp.c.inc => translate-vfp.c} | 12 +++++++-----
>  target/arm/translate.c                              |  3 +--
>  target/arm/meson.build                              |  5 +++--
>  4 files changed, 13 insertions(+), 9 deletions(-)
>  rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (99%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

