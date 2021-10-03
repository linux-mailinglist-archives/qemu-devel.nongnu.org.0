Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C446C4201DF
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:04:26 +0200 (CEST)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX26L-0007R4-SQ
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX22w-0005lV-VK
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:00:55 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:40821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mX22t-00020G-Pr
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:00:54 -0400
Received: by mail-qt1-x82b.google.com with SMTP id b16so13608214qtt.7
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5vO8UqptapbNyCkal1cuPHTIh2qYiCkyOpgxpQpEn0M=;
 b=CiKxcqkcatHpAFxyXXpYJz+fTIGhkI1HQ1FHtZDtBRcPwzUSqc/VkGDs7s82FIyND2
 iXmROHRI+cKQKgXa87/mxpjSncCsz5UXIP5G8blM7zG4zkt6okLL/tgCwJ4UvhBaKDGU
 BI4h+OIST2MhM74+S2OO7PlkKGM0efHpGSiXpgTHB8LbYuO1E7oRfi4NTqLdfYg0UWlm
 mwAZdREccMICh9X7TX2iot7aHpM2jaamlOptDOnh1pFFZEQgTGSRt/SXA9EzJdCQWQLT
 ndhVtAhOi0rpcWRZgeYdMEKYmPO4XZen35ZzYxkgcEXhchTr9UmfcxlxGtMjW4oO4rx8
 QXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5vO8UqptapbNyCkal1cuPHTIh2qYiCkyOpgxpQpEn0M=;
 b=Ny/6E/Xoh//V525HuNtVoifwZBMDlEajZDE4jOYODHW4oYJPFh0QAjz+vMf9d2Wnno
 vNhb93/HaOhXDXY6n2VcAuunMRYISRhnFlSg7GPdY334skJ0wfow6JE1GQIJAE1OQkFw
 Pf6E578von8PQ2t3nvexDjiAM6RFWx2571Hzrlfq2eY3k5TteFwMpR4DCDJnufFoomQp
 oIc+pHz4aHkBnlLXLvjnfupuqwL+nsJ7Iq1PcIbt/hcNxv3145ku+SucYCoAWtrerNp0
 wR1wj1tixYVPJJ4WE2zMoB3EdHtEMzatmDbq2SfsKStDVBWizh1MDiJf2VOy57tAcsei
 n5yA==
X-Gm-Message-State: AOAM531zazFkIJi4qUmCkZr9nSBIdshFx7+r34uNBEuE0JFRE4qRiD1A
 FQ8nf9YpQX7MSRWXzJzTaGkT3Q==
X-Google-Smtp-Source: ABdhPJwWcbv0uFOXmQxR33IBm1yaFWZ5Aa0jvUmsGzg9mSp3PkpzpIuiK9YKNtDFAJ7b9IKXnnDs3g==
X-Received: by 2002:ac8:4589:: with SMTP id l9mr8462267qtn.338.1633269650873; 
 Sun, 03 Oct 2021 07:00:50 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id 205sm6052910qkf.19.2021.10.03.07.00.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 07:00:50 -0700 (PDT)
Subject: Re: [PATCH 1/2] target/hexagon: Remove unused TCG temporary from
 predicated loads
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211003004750.3608983-1-f4bug@amsat.org>
 <20211003004750.3608983-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df776df0-8853-7615-c3df-f8f959c1636d@linaro.org>
Date: Sun, 3 Oct 2021 10:00:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211003004750.3608983-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/2/21 8:47 PM, Philippe Mathieu-Daudé wrote:
> The gen_pred_cancel() function, introduced in commit a646e99cb90
> (Hexagon macros) doesn't use the 'one' TCG temporary; remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/hexagon/macros.h | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

