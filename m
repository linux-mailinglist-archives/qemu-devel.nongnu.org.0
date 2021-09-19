Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D23410CF4
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:46:04 +0200 (CEST)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1pD-00079u-P6
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1jZ-0008VX-GX
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:40:16 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1jY-0007C5-7N
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:40:13 -0400
Received: by mail-wr1-x429.google.com with SMTP id i23so24707472wrb.2
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zJB3XhK0rLyfW83PLDOB8HFj5465oVj2jpQ8rzNQ5qY=;
 b=Jy5QjjRNQv0lg4Tm2RdB3Efgh2mz4b6+7+aEJvvOFsVrvcvYH2A9HmbbdwPVeJZvhB
 JSCt21KEbGh3hevUQ5E7J5aFHhytCFMdmhZPniSIKjso7tcy+o6WbQ1d3clWD3aYd98q
 5b4LRTZZ3znLDVdH1qX66loaYijr1ciJcTidiOJak9s2iyRTdABBnoA8s7rlyhEgLN1l
 m8HHsN7/m1Rz5QlNxS5uDhz3dvnPvLEMwQwKv2eCS63LF5JjBsuBhHaIYbrr3rVpUi1E
 kgoiMSWEj5bqL7PV1mB3qH/AUOkxlS/fAldk4kSQ8BoNNXQtDrKgVMgnlKjc6SBEVfR8
 X0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zJB3XhK0rLyfW83PLDOB8HFj5465oVj2jpQ8rzNQ5qY=;
 b=dpnGfjIdNxXzEXNuymKf2UMG4Sf2LQ+l2DgSuVISuwbnGP+3HMRxXcOWtcotPmGVlq
 JTrQVe3BFh75CnoTaKredb5gqCxgolAv6zaF9y0cJxB0oSaNxGAOH999O1dXvbkgC/+e
 IMVXRAxJ+j+2feoB0/Wa8LGbdQfiEaHd8/JmRnC354Wh0MXid5uH+aHlQa20+Qf4aMZP
 bQy0+UzvpBam++W0qGco74FlcYjDeMpWtcH5kRcRu05hbvMdyeKX2YD9LbF7CzuW2WKu
 5WJgPdYWvZaR1tMWaTA3xdIwK1WjgIdQA83PD34iT7MwmtC+JXetupBN0uF2+2Bk3+y7
 ievg==
X-Gm-Message-State: AOAM5331QGaa/jcusUDnr08k7ElAydClMS440IH2S2HvciHwFek6AVpt
 xUdjjmohoJH59KyN08ce41RgwPx2w2g=
X-Google-Smtp-Source: ABdhPJzSxljSoabL56eTNGU843+C40uDv4j9orgFYJbi7WKFEqjN1zvpFwH0fH8fKhm3IM8SaSEdyg==
X-Received: by 2002:a5d:43ca:: with SMTP id v10mr24905866wrr.139.1632076810807; 
 Sun, 19 Sep 2021 11:40:10 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id p5sm15109933wrd.25.2021.09.19.11.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:40:10 -0700 (PDT)
Message-ID: <380e87dc-c249-922f-60d4-1d98afb684df@amsat.org>
Date: Sun, 19 Sep 2021 20:40:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 41/41] accel/tcg: Restrict TCGCPUOps::tlb_fill() to
 sysemu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-42-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-42-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 20:45, Richard Henderson wrote:
> We have replaced tlb_fill with record_sigsegv for user mod.
> Move the declaration to restrict it to system emulation.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/hw/core/tcg-cpu-ops.h | 22 ++++++++++------------
>  linux-user/signal.c           |  3 ---
>  2 files changed, 10 insertions(+), 15 deletions(-)

Lovely :>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

