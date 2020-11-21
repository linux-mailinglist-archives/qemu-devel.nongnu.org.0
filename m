Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A611A2BC205
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:21:31 +0100 (CET)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZNy-0005oL-4w
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:21:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZK6-0003Tp-VT
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:17:30 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZK4-0007Tx-Om
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:17:30 -0500
Received: by mail-pg1-x532.google.com with SMTP id q34so10470001pgb.11
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zQSXNmHfdH5rTVOup0uhFF2TI0R/LwFXVl+ZUobpc4s=;
 b=nrc8j4sr2w/0SvrZov7j4+X+7ccKy3jLuJjm9nfPOLNVH6wqLPi5/gE0s1nh1zwFqS
 kBbrcwyrvwYDS55lvaZXlfpokxumxjScDcqURnzsyEn4OuW6m3b/tmSoT4Bwf7IWHGZv
 M3UwWB50cOFAzX7LqMUStFEhecf/rMh4RQ2QFSJqtKo2EaQXQ4HOnnpELH53fGb/rMa5
 eoc+PKAIMj0Fw1NdNO9YM1VyGXYtlcor5ZJdYyh84MRhdMV1IXOkOacD6/wgXoXYc3Ex
 90QgdcfXYEqgZC1z5sV/fscWHtpoOuU9iFFPY4GmVwIdgeJvwTFx07PKQPaFd+aQHjVt
 BcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zQSXNmHfdH5rTVOup0uhFF2TI0R/LwFXVl+ZUobpc4s=;
 b=F7hXQNAXU55QqAwyY/Pl8JVspkXd2vLClamF+9Sk3C+JB/mYtY2lVGachv1CyuC4WJ
 HPP0KM1X6PUM1PJtebVAxB3200KaIcqGVrob25BV317ELpfdiFRBbmGoQC/BHLaxJQgo
 o9zbhe+9wuOgi6if8aEPCU5Y2j513rWH6ciqcXC4Dtor70uImBASO5MDqNsLkXds4WbD
 PUUIAOHMpz2mwWgxHc7oXMI+KIku1aN5mWCjml8bugO/sCnL9ThwR5GHk5RST/SOThZM
 D/7jA9j+1u3npMtzc73Un5uTyUqoyfKnkc9O7SwR4MiNk70d6x6vS6npsqNU3ScfPCgt
 QQKQ==
X-Gm-Message-State: AOAM532rgHmoutiWfiBi3jY9A7LpPOftw6FcGLD1oL6SKc8u72wKMWVb
 bAHQdkb2N68NLhH6NKVSjt97DQ==
X-Google-Smtp-Source: ABdhPJxN0cjJjlVg2H9e7dGKkms0q0fZGxoEVKXbOWJjVuPWnkD0uPPhh68oBW8xcu4YB0ueJmshNw==
X-Received: by 2002:a17:90b:2342:: with SMTP id
 ms2mr17189347pjb.136.1605989845891; 
 Sat, 21 Nov 2020 12:17:25 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 17sm7905961pfu.180.2020.11.21.12.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:17:24 -0800 (PST)
Subject: Re: [PATCH 23/26] target/mips: Extract Toshiba TX79 multimedia
 translation routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4a090d68-f727-3805-4e0b-6c31c3689b2e@linaro.org>
Date: Sat, 21 Nov 2020 12:17:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> +++ b/target/mips/vendor-tx_translate.c.inc
> @@ -41,6 +41,8 @@
>  
>  #if defined(TARGET_MIPS64)
>  
> +#include "vendor-tx-mmi_translate.c.inc"

Do you really want to nest include files like this?


r~

