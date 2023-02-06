Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3981B68C097
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2uj-000647-EW; Mon, 06 Feb 2023 09:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP2uX-00060p-Qy
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:56:02 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP2uW-0005Xb-0j
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:56:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id m14so10591470wrg.13
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eM0AtgJNHC99zMuZUTMlTvZmszVBEHVQm0X8lH1cjwI=;
 b=DXzWXTDxuGM24yNLozHDkzX/treSsVvecBfyfW0gXJk3XrKAFCkNG4JMwmrHwU5N4a
 /9x6DBRl3x6or9pCxNF/xoKASwU0bnJsQNZ8vTCvmmxpvrliiyPfCS1zFXhqzWrsrucp
 e1m1tPSajESaToHwNYfrXT96WKNARIa/ui6/YLbFie93ltliYfOYpgI3nobXz09z+8Sa
 efZOIzm80p25/kqhCsfGGBii8cdL+nbPQc1mYRxI30MYR/F0mBaNZjv2CTk45RPJGSnL
 xJpP1CaausI97FCTT+YPsejnDs5+1wtiuwIqTlRl4ZbFEy+WDrCGBYiC7BxptgLYm77r
 i3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eM0AtgJNHC99zMuZUTMlTvZmszVBEHVQm0X8lH1cjwI=;
 b=5dxCckeOIamUxeW8NFAoGKJ2SFVVj7w4t8iHHDrQ2hA706A3Lsv1vYuY/cwmBm1FiV
 wYpTuwL6wAS9own/8xYoxjk5TGXTQwI/dIJzcc2g9Aw10JWt2oLhIde93wMdBxazPXwd
 0Y9QgSaIM6cHPJOAgDYWm+Cb2eS+nsA4143MQp+iAMpJudRSLUOW/ZfxCm9XE0TP/Q1d
 y82oWfi7RlSaWq+4DXGq5715k++kG4QzqocHrVBhblpJPNXcRmv1++1adoeZYIgg3Pvs
 eyADL9+qlD8CxQSjXwKqt82gMCnarD06byIsfCJSfGbqJKfvskxTFzys8eH7usPEGtCh
 aPpA==
X-Gm-Message-State: AO0yUKWrFF4G9xHccsKmizIlxEADld8T7lhMI5y2zLe/UHWrIloU+Zbu
 7NPR6ZAADnY/rGqWzHWTb66nIg==
X-Google-Smtp-Source: AK7set+dt+8UzUvooABHihJbe/JfTGC/4BPpuWQ9MuqzkYcsPL0CMcLG3+IvNrLIuvMwVRZLGD67fg==
X-Received: by 2002:a5d:650d:0:b0:2c3:ee0d:56a1 with SMTP id
 x13-20020a5d650d000000b002c3ee0d56a1mr1759376wru.66.1675695356726; 
 Mon, 06 Feb 2023 06:55:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y10-20020a05600015ca00b002bfd137ecddsm9257489wry.11.2023.02.06.06.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:55:56 -0800 (PST)
Message-ID: <201bfdcb-85d9-fbd3-0dfe-9b67efb92596@linaro.org>
Date: Mon, 6 Feb 2023 15:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] build: make meson-buildoptions.sh stable
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org
References: <20230206123247.16814-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206123247.16814-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 6/2/23 13:32, Paolo Bonzini wrote:
> The library directory can change depending on the multilib setup of the host.
> It would be even better to detect it in configure with the same algorithm
> that Meson uses, but the important thing to avoid confusing developers is
> to have identical contents of scripts/meson-buildoptions.sh, independent
> of the distro and architecture on which it was created.
> 
> So, for now just give a custom default value to libdir.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   scripts/meson-buildoptions.py | 7 +++++--
>   scripts/meson-buildoptions.sh | 2 +-
>   2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


