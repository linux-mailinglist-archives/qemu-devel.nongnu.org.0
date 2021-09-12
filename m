Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B3407DED
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:26:57 +0200 (CEST)
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRNg-0003YG-5N
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRLy-0001Hg-MP
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:25:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRLx-0001na-3g
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:25:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so5104141wmq.1
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D3s+GruVheeIF1oszEKOHmegUzXgdP14mf+A3ZwZE/g=;
 b=kpWaro37D0sJ6cc1AJttpqb+zrPfO0AB3fgusn33GsVWunZVV7maAXJcUa2LNliAP2
 sR57+5NsHRRh9dcVfullzLZFh/Ydi4sCTp9Sd/jufdC9s5WN0T32YLpL7ZEB40+huFUv
 h5Xo0dwSQxxn8o+5RHNYMelFrTzgB/sIQMD1i3ky4OIeqJ0aDGcGlJabkN/9/0G1LBFM
 i/0k9Cl0B6NXIyIobiiah0s1N5z766x9SO+RG/9UvDBW+MlXGoyYmYfTwNSG9ToaToea
 MjS4E47RCk5YRBvKpO18LMBZvQbMev3wGYuCmejuEvTj8gdI2KN+s5nz4yNnIRRFUVti
 ro3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D3s+GruVheeIF1oszEKOHmegUzXgdP14mf+A3ZwZE/g=;
 b=d4Bn88+JsUu+fzOprRPBUSidI+2o1+pUocGVyNMemaA7EijLhNk0zU+JMjUm5MIniC
 j2lDI4TezA+Uw4JBTtkUtFACsvG8gdUpOolRRSVgZ9tk3xeDSawzVLQ3d0mJHjmQA/Mu
 IKTDowZKmiGkW+HtEvT097vqMkNvAv2gHN3Fq/umqR33k/jk3uE12rQVsKV64OSj1JdY
 Z66wF31Y6OmaT+p8g35ZFMAcWsJ7Mq69LgkvvcDmnzgJ2H6GyJkWivWSiz9UmUMdTJBx
 fkBrAnyqiPxePR4/kgw8rHKcljR3Hj0wG66tjHygZYsZ79zucbnT00GkkHCTBGPoAVMS
 P2nw==
X-Gm-Message-State: AOAM533e4DDQkgRY8u0OtC+Y4BGFXAglo9XVk/qRTT0yY1ABzcjzZ6MY
 jGRsT57PF2txBj+Z+FRmtgQ=
X-Google-Smtp-Source: ABdhPJz+5HPP4FrbwItLgs75Kb8ggHoAn9quuA0x7Ndupwc51jWrebCGioJ8k0qCndiIukJcyYRGqQ==
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr7177435wmj.18.1631460307486;
 Sun, 12 Sep 2021 08:25:07 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n7sm1197030wms.18.2021.09.12.08.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:25:06 -0700 (PDT)
Subject: Re: [PATCH 15/20] nubus: move NubusBus from mac-nubus-bridge to
 nubus-bridge
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-16-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2602e05d-954f-1ef1-8da8-26109b6994d4@amsat.org>
Date: Sun, 12 Sep 2021 17:25:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-16-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> Now that Nubus has its own address space rather than mapping directly into the
> system bus, move the Nubus reference from MacNubusBridge to NubusBridge.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c                      | 2 +-
>  hw/nubus/mac-nubus-bridge.c         | 9 ++++-----
>  hw/nubus/nubus-bridge.c             | 9 +++++++++
>  include/hw/nubus/mac-nubus-bridge.h | 1 -
>  include/hw/nubus/nubus.h            | 2 ++
>  5 files changed, 16 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

