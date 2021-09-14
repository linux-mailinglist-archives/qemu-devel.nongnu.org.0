Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE7840A66B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 08:05:05 +0200 (CEST)
Received: from localhost ([::1]:58834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ1Z2-0004yz-Ug
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 02:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ1Xl-0004H3-9Y
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:03:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:35484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ1Xi-0006Xc-Uv
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:03:44 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i23so18262785wrb.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a4r8MM9tsNKMrpKrci5sqwSx48J+Y3QfnnloA6vVKbo=;
 b=PAKxtOl2czm1jaL6wZIeOXO8LS07l5a+Ky5+sc33rxCeDFzs9dBYWg4xjLWvJHNEuB
 RQ8NecwpuZytLFnFrhG+7LjRPnkANM0ZXNqG06Q2F+SHiK4t+MP4IZTUOrn00QfxdBnj
 qpBt0KZVzqDtMfWm0pnLcG4nVhEO8YBxzg7oTYLvDrNTmuDac/5doZzcZZlqNySv2et3
 WmxjJhIIGpajBYUX1ygQqZg6U3c7J0N6O3jWMmTjdRsm+wt2fT+8AvcVkkmTyJaGwPUF
 LkF5Ui/idDnoirGW6KmbZ5B4gzWgUTUqT4PfbwdDK4WOdfWs+xWWaI3oi/Mp4Ni4sUC0
 boUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a4r8MM9tsNKMrpKrci5sqwSx48J+Y3QfnnloA6vVKbo=;
 b=MM/WS/XAIYPFooyb9yd6pj8BHJWua24A3DUNmCFC6l0VK5JYoI7PMFdxREP4/TORE/
 q67wh88QPcJGSpvPi96dkJDfrYMShqKTwC5y/sLncAvlqms7IjdJM8oHIVZ3eJ5GnvXG
 egN+s2L8dBJ4TRP+XRkN5Jbor4lYmXCN9VCwgfLLgrdmwbcJm6nHsveM/FjmVwLEC7Q8
 8cgPRUAt9yEnl/UAW1oIoHcxbIMeioJb1kF1ihfBKFFZA504uohqTYH3xKWD1AzW0cSt
 JiejlvgRJf5AEFVA0LNaZK392n63XgN/iZXK5SM/8kLT4Z0ECmHBmEwkUniWIJ+rRgzz
 kKBA==
X-Gm-Message-State: AOAM5303Mnx7Ix0SgjUe328T5HzCm4ZBzy4blIZuc+Kqsyt1AvOKJExi
 izS1Na3dSlpiPQvjkVgNmZU=
X-Google-Smtp-Source: ABdhPJzjRUl67gKarUbNDfusLp7TmO6kzROeJl7/S/zkulrk7PibnWOPZz5cSMdJONbJF8WfOpGzVg==
X-Received: by 2002:a5d:5229:: with SMTP id i9mr16727722wra.373.1631599421101; 
 Mon, 13 Sep 2021 23:03:41 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n7sm92251wms.18.2021.09.13.23.03.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:03:40 -0700 (PDT)
Subject: Re: [RFC PATCH 1/7] include/exec: Move cpu_signal_handler declaration
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <43104491-8ee3-d708-c861-0d5b33e3e37e@amsat.org>
Date: Tue, 14 Sep 2021 08:03:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913220552.604064-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 12:05 AM, Richard Henderson wrote:
> There is nothing target specific about this.  The implementation
> is host specific, but the declaration is 100% common.

Same as v3 ;)
https://www.mail-archive.com/qemu-devel@nongnu.org/msg830412.html

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 13 +++++++++++++
>  target/alpha/cpu.h      |  6 ------
>  target/arm/cpu.h        |  7 -------
>  target/avr/cpu.h        |  2 --
>  target/cris/cpu.h       |  8 --------
>  target/hexagon/cpu.h    |  3 ---
>  target/hppa/cpu.h       |  3 ---
>  target/i386/cpu.h       |  7 -------
>  target/m68k/cpu.h       |  8 --------
>  target/microblaze/cpu.h |  7 -------
>  target/mips/cpu.h       |  3 ---
>  target/mips/internal.h  |  2 --
>  target/nios2/cpu.h      |  2 --
>  target/openrisc/cpu.h   |  2 --
>  target/ppc/cpu.h        |  7 -------
>  target/riscv/cpu.h      |  2 --
>  target/rx/cpu.h         |  4 ----
>  target/s390x/cpu.h      |  7 -------
>  target/sh4/cpu.h        |  3 ---
>  target/sparc/cpu.h      |  2 --
>  target/tricore/cpu.h    |  2 --
>  target/xtensa/cpu.h     |  2 --
>  22 files changed, 13 insertions(+), 89 deletions(-)

