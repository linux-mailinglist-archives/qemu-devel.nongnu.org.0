Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97F6DD723
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 11:50:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmAca-0007zE-VV; Tue, 11 Apr 2023 05:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmAcY-0007z6-Ji
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:49:02 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmAcW-0005q7-W9
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 05:49:02 -0400
Received: by mail-wr1-x433.google.com with SMTP id e2so6842719wrc.10
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681206539;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ypi65HmbtUw6Rc3C5DKGfuuP/LZr0db6xs3RwLKNdjE=;
 b=J28YmDKGQE5q8liZ+9Ba+guMNtDEs3gm48A93+FzGmbTiJuMh8W/TgJMIWAj47D4Nr
 cVfi1kCf+5BGW5NV38VM5GV1NCiwEQvM5MCi/gdvGl5VUrXde46CLNzpAqxDjcm6I/ye
 w9nebJSnmnrCbxWu2pK6Svop65wfhtj+CbaIhIByliY1tESZNSNyTfv4IEKBAthlZ09Z
 FGRBE/2+iKJV+ikRbr2JlfrEWjITN2oPYmogMpTnn2OCB78UGQVM7kG51NKEiOb8N1bP
 YqihiIFUbwH9tnobiQTqS//kbM7VWGU0aHg4SMhdiD9Fj/nLoh6Ts+2M4wFj82M/s6hH
 dI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681206539;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ypi65HmbtUw6Rc3C5DKGfuuP/LZr0db6xs3RwLKNdjE=;
 b=Ze28mYw8hvSh69BZxii0wXuguT1gt4Cbthj0N54qy+elrc+Nr833jxqGnWJ8NX3EB4
 j7sk6MpKqC8huMR1PvIlX/yq0evmXBBVaePvRMSr2RyRYhOBQ0AOD20SluPUH5R++dyh
 qecEKrhy9iegYXNzUVZaCimX7fqjwoMmY6CPng7qhYfifxwpGnAiy6chkKNKozWkXv0L
 cjWHDhOGiitpzhRdREsGKMjYyrq/XRXXWIcHBbK5WzW1WFCNN2deuCL6FHut585Ozddt
 b9sJaKUPkLA+UXt7z2/8EqF9avHZ1/vGYSmtHJ02gGuVeU5IjhV/qnN9WibsvryVpbrr
 U2Gg==
X-Gm-Message-State: AAQBX9e5/ytwEq6sjg7Cyq3byQ27mFaxzBA+yXEpSCmAFTKpAvYaY6u6
 6YwcUTXx9e1EW8uzacy1arYbSw==
X-Google-Smtp-Source: AKy350Y2tRxCWB1onmVxuF2FsSdSIsvIOl+9wiZ0imSydUAnJJJ2oBtynlmlKYyKbqFDR6i8gswkng==
X-Received: by 2002:a5d:4311:0:b0:2ce:9fb8:b560 with SMTP id
 h17-20020a5d4311000000b002ce9fb8b560mr8129832wrq.8.1681206539102; 
 Tue, 11 Apr 2023 02:48:59 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 w9-20020adfec49000000b002cde25fba30sm14251776wrn.1.2023.04.11.02.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 02:48:58 -0700 (PDT)
Message-ID: <5b2f1194-086a-deb7-acd6-a1425f00716c@linaro.org>
Date: Tue, 11 Apr 2023 11:48:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH for-8.0] tcg/mips: Fix TCG_TARGET_CALL_RET_I128 for o32 abi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230408044204.3484337-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408044204.3484337-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246,
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

On 8/4/23 06:42, Richard Henderson wrote:
> The return is by reference, not in 4 integer registers.
> 
> This error resulted in
> 
>    qemu-system-i386: tcg/mips/tcg-target.c.inc:140: \
>      tcg_target_call_oarg_reg: Assertion `slot >= 0 && slot <= 1' failed.
> 
> Fixes: 5427a9a7604 ("tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



