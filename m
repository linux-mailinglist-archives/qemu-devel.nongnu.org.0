Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4D4EABA7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:52:54 +0200 (CEST)
Received: from localhost ([::1]:59338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ9T3-0001Il-Ms
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:52:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9Oy-0007Zw-46
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:48:40 -0400
Received: from [2a00:1450:4864:20::432] (port=43540
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ9Ow-0002yz-MP
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:48:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id a1so24165476wrh.10
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 03:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ON6pRapDIG8PnSWZFUxvvH/7GotBnBSXss0e/Sc30hk=;
 b=qxsKuMcYlIkoCscKbiIvcWAzxmr6l8GkfSE/VroEj97132YTIsU8m7tN4jeyxYHos0
 eB1S/MkmfU+SxR7g6SDeuPy/sC2tYc7bdMtpEh+1sFCP+dQYVvOskJCyxJdtrxkxdll/
 3J+P7V5zFv9zS46KoTvD4/WHwzmI//QR4VS275l3ID0nlN744Tw6AhK8bA4H0U2J4DJE
 qqNNv9S0O/28uE+LjnbwFzMLTv8ZWH38jDRjed073PHQPTni3t7darLNRI6OnweX1lUv
 A43+pr1N6jhZOp9IltKpExVDgdVjc6XmLjSquJqzh00Ce35Gda1zKTiefQvDLHImty0M
 zYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ON6pRapDIG8PnSWZFUxvvH/7GotBnBSXss0e/Sc30hk=;
 b=5fJqaZ2mip7fxsR7dkxWvL9Yh/PjKQrKSfAEH20wpGUevJ2aZMc8sRocnoC/zyyU93
 Zun7BMJUzt+lGnrMixBrmDgqgroFwAr7SBlJZDUavfB2VuVmM6gmMPmtMmAGsZ0G+nlJ
 c4yLSujebAGncCmn2tC1WWCzX1Z39f4xmh07BcM1bvvbTHOS4P+Ej5ROj4hOEC5IaxlF
 sWonrDirkm9XW3H0ZehSx4bOqe2vMLM2aGNtrGVa+YaUHXLF1ldwjqb9Mm7Cp1JC9zdo
 zVbyzYT8JGtK3sNwIVsLLNoZ9KUDHUNs1IcUCUDm/Q9cjw4ue8psbSnaqFQ6yLDKBWx0
 eXjg==
X-Gm-Message-State: AOAM530MaCn6lCaHKUbDveZf0PQHbPLuUw9XEYpnLU32HwjVfdhwJGc6
 96cGNqrdgSm0qByfRWot+2M=
X-Google-Smtp-Source: ABdhPJz+2xAuKp315e5rQDWYqNXfiR2EHkoxfK+wbt64Uj6iM0wXq0ofxRjetBWee/JjEpRZmiOylw==
X-Received: by 2002:a05:6000:181:b0:205:c1b9:7b10 with SMTP id
 p1-20020a056000018100b00205c1b97b10mr13625586wrx.171.1648550917412; 
 Tue, 29 Mar 2022 03:48:37 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3?
 ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a1ca102000000b0038c78fdd59asm1922207wme.39.2022.03.29.03.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:48:36 -0700 (PDT)
Message-ID: <04797f5e-8f76-9868-23ae-daafd14353dc@gmail.com>
Date: Tue, 29 Mar 2022 12:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] tests/tcg: really fix path to target configuration
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220329104514.815448-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220329104514.815448-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/3/22 12:45, Paolo Bonzini wrote:
> This was attempted in commit 533b0a1a41 ("tests/tcg: Fix target-specific
> Makefile variables path for user-mode", 2022-01-12) but it also used the
> wrong path; default.mak is used for config/devices, not config/targets.

I remember having tested this, so maybe I had dirty default.mak
files there? Sigh. Anyway:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> While at it, explain what the inclusion is about.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/tcg/Makefile.target | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index ae8004c76e..acda5bcec2 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -32,8 +32,10 @@
>   all:
>   -include ../../../config-host.mak
>   -include ../config-$(TARGET).mak
> +
> +# Get semihosting definitions for user-mode emulation
>   ifeq ($(CONFIG_USER_ONLY),y)
> --include $(SRC_PATH)/configs/targets/$(TARGET)/default.mak
> +-include $(SRC_PATH)/configs/targets/$(TARGET).mak
>   endif
>   
>   # for including , in command strings


