Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A3C3AD382
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 22:19:51 +0200 (CEST)
Received: from localhost ([::1]:35970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKxy-0000S7-AC
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 16:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKvQ-0004sW-1p
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:17:16 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:41499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKvL-0006gR-M5
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 16:17:11 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e1so5262041plh.8
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J1FG5p0z0eE1EGAASoJJNMea23q1WLVLA9oY1s349LA=;
 b=wU7LtIL6pm80TGyepisiNo6AmAkgK1XAWSkmvETHbEU7pC3N2ZtPZp5Z3iX6+Vo3ME
 +R1/vLh1VCn44oWOmzbknpgO5ixBh/fjp3aL1jiIwa0nVzWQQAe0Kz/3ESq2k1eExSWB
 xCVkljKnM2NHvSz7SRr5zGfiBz904cZU4S3dpThRqAJvt08o3JfcLT+zL30MZSsdB+VR
 Ovu51zIZDNm6o1XqqaqnIqfVo1RMARy5wEF4936RL7rwc/kN2xP0zO9sz5vGh1gajo94
 UxZKXiIgH4O1GhwehVDRNnARNcEeG4q2VwKw3xEKo5So0b+e57soVAFRIMfmgrVOnr7u
 Obig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J1FG5p0z0eE1EGAASoJJNMea23q1WLVLA9oY1s349LA=;
 b=SqnTAPk9YebrUMIDhDZ3pYInvlMJow4JLTIy1QyQYFWr7nPdNlame8IQYq/NHdJoTa
 06tf2SX1owrOPF2guCulq5sEpzHW8jhBBo/EC71eJbrS+mUJI5n0xSSwoTi30Z8jjQAj
 xThIWC+TlEDToDpWnTyCCmjx0gJ4h4sWbxAeUIFXERjnC3102d9v+J53PY/E52ka8uIO
 +49+S9nfERaz0DMpSRZ+OxTyq0OOL8shrkf+gOaybo/mDcpoFxbipG5vGoYVb96LAfhJ
 ku71WLoHUCn6jfdTBSoCpiB5urVSdHp/fAonkPml2xLPmtdeK4BOnpjKX0I4Kpd/KlRz
 pa4w==
X-Gm-Message-State: AOAM533wNHiqbT4HT0Afn8Jn3fh/3ZToA7k+aLeusgGcylM9k0s+NWTz
 eXb9+iFRqvdYIjwmn5lXLBxTlQ==
X-Google-Smtp-Source: ABdhPJzM/OLQVGW0Sol5rrRPizZKhxjXQa6oL87Wlvg96Tas2bbUEEEalc6RPcwON3Ig+BGzQyJqDA==
X-Received: by 2002:a17:902:da84:b029:11b:3110:a42b with SMTP id
 j4-20020a170902da84b029011b3110a42bmr6295029plx.44.1624047425821; 
 Fri, 18 Jun 2021 13:17:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d131sm8996379pfd.176.2021.06.18.13.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 13:17:05 -0700 (PDT)
Subject: Re: [PATCH 4/4] target/mips: Add declarations for generic DSP TCG
 helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174907.2904067-1-f4bug@amsat.org>
 <20210617174907.2904067-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23373555-ac23-1b9d-e48e-77318fee4937@linaro.org>
Date: Fri, 18 Jun 2021 13:17:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617174907.2904067-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 10:49 AM, Philippe Mathieu-Daudé wrote:
> To be able to extract the DSP ASE translation routines to
> different source file, declare few TCG helpers, MASK_SPECIAL3
> and a DSP register in "translate.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.h |  7 +++++++
>   target/mips/tcg/translate.c | 10 +++++-----
>   2 files changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

