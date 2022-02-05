Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7CA4AAD20
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:59:18 +0100 (CET)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUxW-00036F-6Y
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:59:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUvo-0001AM-4I
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:57:28 -0500
Received: from [2607:f8b0:4864:20::62f] (port=39641
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUvm-0006hn-Bd
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:57:27 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x11so8343683plg.6
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oneHenjpCYzrY0ZJkuFJ2DhMW8M9OcMN0Y27OldRgGQ=;
 b=eHKFwsNllAFY60qMUXshFk/8Cs5BSjkdxCtsJdoM8Ceq39PzmAzmjUODp4K+cAIkoB
 lAJJGVM70KuE5aGQhlSNvA7FSPNwvblh0BgkyOKuQ8EVu6Pr2sHCRF4GPj7ioIeXTHc7
 dey3PRQeDhBSw1cbhBCcbWExRCmqIYaHbFNGYklCr2DV0FI2T0fACzpznabwZHKnOY/8
 RUL5aqUJ9f5bH3QRTBccWdRijpHBhtUTnB7PAdp05atuXTSOHWvJT1F+FXD/8yoWlsfl
 tDj179L7DCLiEJpP+NNa6NsfuUJ3L3Be7qPRvf3agyTw/SBVCi/KQ1Rpij3E4G8GzIHu
 4nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oneHenjpCYzrY0ZJkuFJ2DhMW8M9OcMN0Y27OldRgGQ=;
 b=Lw9o3IhacPHXlFrGclXZio82i4i6lXrOzVPoK2iPZeAgTyARCtZ3BOieYek+yBJTVK
 No1kteb0vm7VB7X7UZP8mJIqc2vLwP5sTZovHyBcbdHhhbsEltPTvbowJ21T4IiisGcV
 FC2BkG9xAZj4SB6tYhlj4vBDktaAMvoQ2nobo6t+qeQDR2kFXiFtLGXXrZ5PXdMvjajx
 EIm7QlIRtI1Vk4BUqsCkxVRM9MoluiktI9sDQYwVDonDFa+a+N21Gpdma1pknbyqAS1c
 WdmMLE/Ey+wNeuYWCtcLt736lVV5V5xMcDdpm3r8WPZ49rJF8lkQnI0yKtZQ6K/TDpYy
 hc4A==
X-Gm-Message-State: AOAM531cYAzL6qLjvi0XEQAM6t9O1x1/EAuJMPZqGEqSRiLTrr5TYLgi
 WymogqE5QwDlVKGbcOeZpvB5Yw==
X-Google-Smtp-Source: ABdhPJwXSnEucAiIJpQfx1JqZB8LybSehagQ2J+TVPP4R+soUp3NIc1gPpHLFsvVdmkZxGYCGKW1gA==
X-Received: by 2002:a17:902:6903:: with SMTP id
 j3mr9938920plk.23.1644105441996; 
 Sat, 05 Feb 2022 15:57:21 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id c17sm7669050pfv.68.2022.02.05.15.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:57:21 -0800 (PST)
Message-ID: <7f5f0e1e-5d36-8fb3-123f-5bd1b0ec9f22@linaro.org>
Date: Sun, 6 Feb 2022 10:57:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/10] exec/exec-all: Move 'qemu/log.h' include in units
 requiring it
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-11-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:38, Philippe Mathieu-Daudé wrote:
> Many files use "qemu/log.h" declarations but neglect to include
> it (they inherit it via "exec/exec-all.h"). "exec/exec-all.h" is
> a core component and shouldn't be used that way. Move the
> "qemu/log.h" inclusion locally to each unit requiring it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

