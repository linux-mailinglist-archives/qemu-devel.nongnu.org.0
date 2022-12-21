Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B183652DFF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 09:31:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7uUr-0004Pi-Kr; Wed, 21 Dec 2022 03:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7uUo-0004PI-5N
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:30:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7uUl-0003PD-Ci
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 03:30:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so957997wma.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R5FbyI85fxgrsaiqnHT8JMoFIX5KBJ728RJfaMNeJ90=;
 b=vnN+AhnrRrsJz8/UW+STsRPIvUptQtRZFbTHthA2mknFIpi4cchRUrW3bhSe5GjxtU
 cFv355hO+KD5f6zUBi4GJ26mLGKCg/ioXYg0bf8ANFOVv1NXnBwyyLFjoNKsZU8QYN/v
 LI3G1X+3T+v7CaglLnvOHdD6Ge+TuoVHBpHshO+WWxKEw6UwGiYWJze6eNc7bVMIqFZW
 0sTpv50+cIY6siWPzOkZNs+sI4+0+Il3HTNbZ+zQfDanhfETqgGSgb2uQc9OzyB9TGxl
 tepN6D9qGOBfl59+hpDADvAveTAbmtPbGFByXvK7IKyH6aOqeft7x9TY9K6+BW3CEA93
 3nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R5FbyI85fxgrsaiqnHT8JMoFIX5KBJ728RJfaMNeJ90=;
 b=XYL8AYoLvf8YdFeYpJ1Wkr6kiPDhNE8D1YfgH3/j1VyBTEKMMr52nH661Gr32laHih
 uOJmrA4feCd89QLAemeCrdfM064qt6yJYZOqm1vedgfboImGo5GLZHFXxaBzsSmXIoag
 sRJjrRqFMQxVmpghHpBn4YRZ06xhr+4iqIjlOqhZI1fBE46GWQebTaTXaXY6Io1oeeJ1
 HkMecMr6XuuYahFLN97Y2CqBtfhaEXELZ0Odp34KlGbFPl/tVG3SVGIhgF0pP5fxCB0a
 YWiwYdMZGzZ/CvQ3C2JHbcSZBAbc97XYb9CJlp4yK9CAmLAfU1tVtChTNanEpHoawdXg
 NaYg==
X-Gm-Message-State: AFqh2krr7CN+uyZLl7p6dbxlSK/CBiopDz7azAkNCcWg2i+DLcFjhexG
 sp3vMIy+MJwcUAbjMRiZljWnmwoqcncYBc06plw=
X-Google-Smtp-Source: AMrXdXsmsah8dNnXgIc0MvEW5zAQMQoWHPcRUwnPoS1hsGyWSKzP6nFNIeK1S5cggAuKQB7iGYDCmA==
X-Received: by 2002:a05:600c:1e10:b0:3d3:404a:8a1b with SMTP id
 ay16-20020a05600c1e1000b003d3404a8a1bmr1008320wmb.8.1671611433662; 
 Wed, 21 Dec 2022 00:30:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c4fcf00b003c6f3f6675bsm1510381wmq.26.2022.12.21.00.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 00:30:33 -0800 (PST)
Message-ID: <ef04d0f5-4128-4db4-b243-d5ad42f65216@linaro.org>
Date: Wed, 21 Dec 2022 09:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH RESEND v2 4/5] target/mips: Restrict
 'qapi-commands-machine.h' to system emulation
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Markus Armbruster
 <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221220111122.8966-1-philmd@linaro.org>
 <20221220111122.8966-5-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221220111122.8966-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 20/12/22 12:11, Philippe Mathieu-Daudé wrote:
> Since commit a0e61807a3 ("qapi: Remove QMP events and commands from
> user-mode builds") we don't generate the "qapi-commands-machine.h"
> header in a user-emulation-only build.
> 
> Extract the QMP functions from cpu.c (which is always compiled) to
> the new 'sysemu/monitor.c' unit (which is only compiled when system
> emulation is selected).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/cpu.c              | 29 -------------------------
>   target/mips/sysemu/meson.build |  1 +
>   target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++++++++++++++++++
>   3 files changed, 40 insertions(+), 29 deletions(-)
>   create mode 100644 target/mips/sysemu/monitor.c

Patch queued to mips-next.

