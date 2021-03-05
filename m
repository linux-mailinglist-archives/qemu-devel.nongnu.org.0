Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCAB32DF03
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 02:21:01 +0100 (CET)
Received: from localhost ([::1]:50772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHz9I-0003YU-DN
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 20:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHz7e-0002kW-9U
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:19:18 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:38455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHz7c-0006nd-3w
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 20:19:18 -0500
Received: by mail-pl1-x62e.google.com with SMTP id s7so517652plg.5
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 17:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ayLgJnga5wCOs28bIBEz0ril0NLq24vAY9SKwi2x/dI=;
 b=H9fu/WQLf4/gcCdwLJj5iYrQ2GCZzweX9G0shfE8CTFioAMBSN2OfDUQUvlWbfBn0r
 FTeSvWD3OS9S4/iRFOccTqkvzfN2VDSaLU+0wyZY9iILLdLZic4SM3H19UajciAy4X5d
 y2eEYikCUZVer07oF48V0baQWu0im0DnaLpQKutOW6pHZ3S/HG+KDHeyy0TXVs9a1BJ8
 BKuYRHJy9PsOpPibvdhNI1WxM5fus8y6EMuffEYzOPPVRqGEH6TQ3xAOGbyAPEk749be
 bh2pVkM46mHpMQ2DPCPi8FHnlYKHZKgMmP1DdwnPAX3+O50J0KfT5x9nfomsbelEsFiw
 lKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ayLgJnga5wCOs28bIBEz0ril0NLq24vAY9SKwi2x/dI=;
 b=s465zj9QsEYtxtkc5A+9S3t4AEw//dLleNBwRDIewyEj1J77toZZjfqp/82Na7gwEI
 gbUerh8b4k5XsQUNWBopgfZTzr/RgoJ9hUVpMI2rUODu3mSkGEDk7K6a/aC3SBz1j7yu
 Bu6dR5oWBU0hyggTxwnU403Rf3NFfmk3DOL9O2FiQvjL+tKBpuisXZfUlwa2gQQQwuWV
 oEQb88WYwVjkFK1EpUxu5FnycJtn7d641Z/Cq5ZM/fkIpbs+0eGHe1C5t94KfS4j4/SD
 QJFrKG+AR2S6dpLLevG/PIaVNEeOfEG2GWk0xXU4gCULCUdzCnYxHVpxP/GkACc7sVa+
 Wb1Q==
X-Gm-Message-State: AOAM532kgiu1QGhOr5Ykani0XwfMBT1TlTTupAUnsYi+HGq4zHPWbmBL
 yBA5w0oidtuT6y1g2N5DpZFmkvL7UMdtug==
X-Google-Smtp-Source: ABdhPJwR5vsjkjf2fAAgoei4mRoQtgau4HnMGgNoYFfTt9mOeWJiemeGBT0zdPX8awQe1aVjxyOtzA==
X-Received: by 2002:a17:902:d893:b029:e3:f3ce:cc6a with SMTP id
 b19-20020a170902d893b02900e3f3cecc6amr6631812plz.28.1614907154255; 
 Thu, 04 Mar 2021 17:19:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g15sm529295pfb.30.2021.03.04.17.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 17:19:13 -0800 (PST)
Subject: Re: [PATCH 42/44] hw/arm/mps2-tz: Add new mps3-an547 board
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-43-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d2fdfc9b-11de-3b39-94c6-dc2a5e87706a@linaro.org>
Date: Thu, 4 Mar 2021 17:19:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-43-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Add support for the mps3-an547 board; this is an SSE-300 based
> FPGA image that runs on the MPS3.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

