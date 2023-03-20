Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EE6C1B26
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:18:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIDU-0006gD-Uc; Mon, 20 Mar 2023 12:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIDS-0006fj-Na
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:18:34 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIDR-0005Yu-3A
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:18:34 -0400
Received: by mail-pg1-x530.google.com with SMTP id x37so6918159pga.1
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679329111;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cne79HYDcx04Txx66SXBhhqnUWZGJyUl3dwelflvP7Q=;
 b=d1TpUCNU7uHMj4s8TgjzjIv06qYCi1mijhtSsJJXaS0t29k2feHLr7yJbl7beDXtze
 bf+ckGCK5cvdawCmd3KxtE6xB1hHxlkGhAeKMJcAihvVK8yPa58k6MsdoabIna/UnBs4
 Vt7i7hYZepa8k5+l3S8U+CFsRCInLJCkoRoezu00/2P2vurQ4X1PrXp/WRjrv/rYoXK6
 kFMviWpo89nPKEV5IFe3S1fGk2vVCZTW1r24Zcd5c1J0XvDCFVuSUQlUDluairFjEXqW
 /pVJ+GbXiheU5d6hycQ3ytmtwokNPJACt/TJBkQkpm5EV2daTOj1VwVmSpbGdto650GQ
 xtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679329111;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cne79HYDcx04Txx66SXBhhqnUWZGJyUl3dwelflvP7Q=;
 b=fU02kM2CEEIBD9shoUxcBFkCucxeGTKFSggXdhFjjjttuIrVttlijo6shZfD5TMcsT
 xMN7yt6ZYtSu7x/fMmCr+Cn4oni1rEwz0i1AIjm0DsETHjQ5E/7cRqtAzYPMbtSK+CKG
 rceZvXByWH3dCNwwz6ap6LQss+esTN077T0UCzu79aNBDMtrIevmCY6Xsws/QVP7eWs6
 kH20bQzgCM664UkEPM1QdmgC2JJHTKOjMR7OGOqlV2jhVUtIPH+52FjskxlBFZ4TXT77
 HVdLUAGrGNCCMnHFOMbSwXoAJc3daNX6Ikh5M/+gD9TH5JQjIiLnS58xa6ThaZ60m9nR
 7OYg==
X-Gm-Message-State: AO0yUKV3EvvLYeuc7XapVbSPQpeZz6SkTYpd1nV9wS0OsaSoNP92xWGb
 whl+Hf0PFrlIZDYJWY28Bws3Ug==
X-Google-Smtp-Source: AK7set/TcGaHzSiwPhSnZeH5h19x4ngKKytUia7n+adhanfqOil2TTq9Px5wfP7/JB2w4hJV6ynT7w==
X-Received: by 2002:a62:f252:0:b0:627:e677:bc70 with SMTP id
 y18-20020a62f252000000b00627e677bc70mr7197429pfl.14.1679329111522; 
 Mon, 20 Mar 2023 09:18:31 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 v17-20020aa78091000000b005d503abc8fesm6496486pff.218.2023.03.20.09.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:18:31 -0700 (PDT)
Message-ID: <dfdbcd1d-f566-ba88-3491-400cdf214421@linaro.org>
Date: Mon, 20 Mar 2023 09:18:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 05/10] accel/tcg: remove the fake_user_interrupt guards
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230320101035.2214196-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 3/20/23 03:10, Alex Bennée wrote:
> At the cost of an empty tcg_ops field for most targets we can avoid
> target specific hacks in cpu-exec.c
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/hw/core/tcg-cpu-ops.h |  2 +-
>   accel/tcg/cpu-exec.c          | 14 +++++++-------
>   2 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

