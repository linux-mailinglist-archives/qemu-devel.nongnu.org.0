Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1432BC0D1
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 18:11:42 +0100 (CET)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgWQG-0005S1-LJ
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 12:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgWOM-0004hk-JL
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 12:09:42 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:38678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgWOL-00007e-33
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 12:09:42 -0500
Received: by mail-pf1-x443.google.com with SMTP id 10so10930132pfp.5
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 09:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wbOlb+cY9Zc0n9Qtzvz1MvimAqm2rJv7ijzeCcV3nMo=;
 b=MHrK9Ja7bzNzOFrvgS8TLtROkxZrzXCpANinlKYE0O66mxo4ofQ7T+Hpc7KRG5LGgF
 WTq3x06P9pf3SkUn1hNekGeEKSXpoQZxm/RT0mM7ML9DF7HdMWoOoMEdnvKzSkFdTqcx
 8rySNogz4zmh0+bpo2I5tIbn6Rd0acdaNrMA6t1m6dKoiRKPc0vkEKhCNk64q+3TFgFB
 q5frHPy0sMSf1pXDDdDKh46UanGTs6RnlkTVfx2Za5D7vRkY7OlMpaW0amXYE1FPI0th
 yb+ZEXKbHM8iVkICTH8MMxHQ47vb3SvbLdygTShxBK2VHln+sF+S+IMAk91tV7Bi4Zti
 8hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wbOlb+cY9Zc0n9Qtzvz1MvimAqm2rJv7ijzeCcV3nMo=;
 b=sizIiefhd9tmCO+fPNxPmVXuSmz06wnF8M+hrwrKnATtbE36kspXoN3wHu0vEWRhd4
 2ZOwGcXkUlqlCm9oBJQPZzOQEkeKTbpZUxk2J/H+mlksGfd6NZOONSDZmpUvoDWaaUXj
 tKifVrWn5d2rnVn9BPWx933ZOwxrAq+B8PebBcu5BepI1biR/hWV3L0vYfrHwCqIJkqO
 lhnrfOYoeLSoU++KW4EpDsIBVHiERuKyGrXNvSG+A1lNL9DgmbyhINIjRKSgyEgYSjUf
 AgHMTzPe4E8J+QClHwQ63K2ho3aJFh7zE/0yXfg6v1iybo4MFWLhSUP2aKYbxIEijdnh
 VKDg==
X-Gm-Message-State: AOAM530I7k46q7bEfLhMoEnZdU5ZuvSheoOct96MTkNCYSURpolG4Uvj
 q6Z8CXoKXpU1t2CeX5rKcUHnuWfsjtslaw==
X-Google-Smtp-Source: ABdhPJy3uaaH8LdcIwgQm35pSm/J0Xa+T4ebR09AJNxjiuIzmgUDBvgFaraqHGNO2w4WdnImgFrCeQ==
X-Received: by 2002:a17:90b:190c:: with SMTP id
 mp12mr16118797pjb.14.1605978578824; 
 Sat, 21 Nov 2020 09:09:38 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id w66sm8427837pff.171.2020.11.21.09.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 09:09:37 -0800 (PST)
Subject: Re: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
References: <20201120141705.246690-1-marcin.juszkiewicz@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
Date: Sat, 21 Nov 2020 09:09:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120141705.246690-1-marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 6:17 AM, Marcin Juszkiewicz wrote:
> +static const char *valid_cpus[] = {

const char * const

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

