Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC13A653CC2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:05:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GYh-00026P-Mc; Thu, 22 Dec 2022 03:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8GYe-00025l-NT
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:04:04 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8GYd-0004Xp-3l
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:04:04 -0500
Received: by mail-wr1-x432.google.com with SMTP id z10so804650wrh.10
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PUlmcTIh2Ta8Prv2Ifk7eTPAn8HGd655qQninF8YZEM=;
 b=hu/c62YE7fTnR5qI/6wmbWp2LNi8u7LA3Iv7hqkIzvZXlrub+72rTVRsNiwvXWaTXx
 wANMtADlHsJnF8lHYx07l8LlBvo9zQcNm5Y8gQWO+HNpgHB2lekdufznXtm8euC0qwJw
 CoqmNStzpcJZn+iP6y8P/wqqsFS8YBo+glzfzqxUe+XlyvvKvSHu4VTn5/+mKEk1gcm2
 dZW2ZwSDYvEzABXav8zR/Iq+K1W6Uk2xEQ7m5IflkrVtFj2rgFbqIggRzJ4wGQhKgAye
 DAV70VGflf4zCuHNgue7aEigvFbBeJpyz6UyfCPMdDMNw5EShIXdvrtZCWaF/H+TZaMx
 ezVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PUlmcTIh2Ta8Prv2Ifk7eTPAn8HGd655qQninF8YZEM=;
 b=IEh2A8/QKDeU4LJyGlHWCtZgYvthqsRk6PTqg3JofbWbVCpxovOGNCe6tVwaT4CdKn
 EXQ4IdplMOP+lyxdrZV7dQAf4vZ1v5kDjoyD8DofG2Erlp6XFKufKiokArKNgrJJ91SE
 t804kCoglik48Dcf5rwTYzzdRPtF7xvzbCcL6Ku5/A06WLoU0Znce8QhC/cTZSAEJp7M
 +PojWImETBz1szkdxCy7/yoX84+tDp16ms8iM74S0KgavmEuphBqTnsZP5cq0JCXSpVC
 9LfoNWjAR4PUxEwFwnuE5OOms3hQT+wDeyeEUW/jQLssFDS0ceEH/GCIzWOQFpxleN8a
 +NVA==
X-Gm-Message-State: AFqh2kp6euQI7DmhuAHf0B5A6KGLsawVJfxHH0PB58vdV++cy5JTmn6V
 fzgwfgaIhYUGDPVi3VfyPy8pog==
X-Google-Smtp-Source: AMrXdXvpj6pwS1zSSCC/BilKpgaaAl9KOtAaO+tFZnaKXZDr6zR8kD6mrr/cOjTTtFeyY85q6NyvXQ==
X-Received: by 2002:adf:cd91:0:b0:242:18e9:2a13 with SMTP id
 q17-20020adfcd91000000b0024218e92a13mr2662372wrj.33.1671696241475; 
 Thu, 22 Dec 2022 00:04:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bu13-20020a056000078d00b002422816aa25sm20017982wrb.108.2022.12.22.00.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:04:01 -0800 (PST)
Message-ID: <93c3e291-7a0b-c9b9-c1ae-479c05ffbfce@linaro.org>
Date: Thu, 22 Dec 2022 09:04:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH] chardev: clean up chardev-parallel.c
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org
References: <20221222073800.856970-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221222073800.856970-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 22/12/22 08:38, Paolo Bonzini wrote:
> Replace HAVE_CHARDEV_PARPORT with a Meson conditional, remove unnecessary
> defines, and close the file descriptor on FreeBSD/DragonFly.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   chardev/char-parallel.c | 15 ++-------------
>   chardev/meson.build     |  5 ++++-
>   include/qemu/osdep.h    |  5 -----
>   3 files changed, 6 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


