Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A164E9BB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:47:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68EY-0008FE-Pq; Fri, 16 Dec 2022 05:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p68EG-0008Bj-5Z
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:46:19 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p68EB-0004J6-28
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:46:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so3823854wmb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 02:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I7qpe/CGMn45Y8TAHmmha9tWCsTujnH/2UYttoi8M9E=;
 b=nF+Nmx9hqKdkkIbZg8HmI6Cz/YPafZifjOHi+zqUa/JEyg+pd49NkWBymZhZDQ8Syu
 X9tW0BsWoQgjKyzmLPvEDAjHtwzSbW/9xvdYal1HzgKDewICBjr7HYaucQwKM9C6g83w
 0CjjzrpuPCkK1pz8bhGQcKcLlhPrgpoAT16Q9HKFLZ1NkPwebgFw50bhb32MLJlmJuaI
 pJjf2isfimSuPikXwqI4wmgr5zHxKkSmxVt1fmAkzQEN+x2fMB//AnmyoO8TBHuzzyeG
 Vg2L935SStJzYg0GvdM7w03mhoa+m4Nrg3V2UP94yJ2YSITxjcCJNl9/cEEwnUCVGV3j
 pvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I7qpe/CGMn45Y8TAHmmha9tWCsTujnH/2UYttoi8M9E=;
 b=W63FFN6aBDf6LZDiabzJ2AnBNFxdEnBLiBrWpUnCQxS6/jfAeeCgDSN2v0pz5Ua87q
 oG3yzfV+3gzwlW/As7kM9NoGjAPZu/wmwfegATk6rNfphsO8LOq5dD2Q4hmxg0x9Efka
 b90uBsznKIYiJMn5ziJoc2Ip4tA4RV5liLyRaQo03iJzKQtA2j5wiyX3Z9TfmaPd3ll6
 1qrQRzVuzYygxWGtWNls0yLnY7kn5gBMOdpjcw0WtC8mfz6NJdg1HLeVg/KjGWrt7kDv
 mb/o33beFEbUiPIXDtg7xWkvHrCuwee+oY7TuLMeZepq+Lx6d+6TLdlwSPVZLLVMLrdY
 9XPw==
X-Gm-Message-State: ANoB5pmaTblaNtpSIj/g3M//viiJybV4ZrLYTUYtkrYRRbUZcVIkH7X/
 Svt7KqggkHwHM1bg6s9TKyGLDQ==
X-Google-Smtp-Source: AA0mqf6VVesSUwHDinycX65VU761LkSXaXaVGiI6Y5hU6BZ+x8J6LNOImEJKIYDlPgfgmhB/al42OQ==
X-Received: by 2002:a05:600c:1da9:b0:3c7:a5:610e with SMTP id
 p41-20020a05600c1da900b003c700a5610emr25538424wms.27.1671187564752; 
 Fri, 16 Dec 2022 02:46:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m17-20020a7bce11000000b003d2157627a8sm9557669wmc.47.2022.12.16.02.46.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 02:46:04 -0800 (PST)
Message-ID: <fb070b3a-6b05-a0fb-09b9-c6c9d872e901@linaro.org>
Date: Fri, 16 Dec 2022 11:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] docs: do not talk about past removal as happening in the
 future
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm <qemu-arm@nongnu.org>
References: <20221216101506.524217-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216101506.524217-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 16/12/22 11:15, Paolo Bonzini wrote:
> KVM guest support on 32-bit Arm hosts *has* been removed, so rephrase
> the sentence describing it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/removed-features.rst | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 63df9848fda2..7e12145c120d 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -565,9 +565,8 @@ KVM guest support on 32-bit Arm hosts (removed in 5.2)
>   ''''''''''''''''''''''''''''''''''''''''''''''''''''''
>   
>   The Linux kernel has dropped support for allowing 32-bit Arm systems
> -to host KVM guests as of the 5.7 kernel. Accordingly, QEMU is deprecating
> -its support for this configuration and will remove it in a future version.
> -Running 32-bit guests on a 64-bit Arm host remains supported.
> +to host KVM guests as of the 5.7 kernel, and was thus removed from QEMU
> +as well.  Running 32-bit guests on a 64-bit Arm host remains supported.
>   
>   RISC-V ISA Specific CPUs (removed in 5.1)
>   '''''''''''''''''''''''''''''''''''''''''

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


