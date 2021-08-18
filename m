Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E6A3F0D49
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:24:50 +0200 (CEST)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGT3J-0002D0-7Y
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT27-00010Q-Ez
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:23:35 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGT25-0001FJ-3D
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:23:35 -0400
Received: by mail-wr1-x434.google.com with SMTP id v4so5580307wro.12
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DfHbeAOTImLR8eDuaR3mGDdtcDJszzidasMyMiqiLZ8=;
 b=bak4jU3IoYgTJRlT71NGZxbC2OnosYGFxGDAllXt8LcpOLAxau9wKC4NLJliWjxq5x
 ZxegXeHvVZNkQKnI5hj0QNeubw9Zh8WgeyesKaRHtwGiAMEBpE3QD1M/A9b96zOZcY+Q
 6UUAq5vdNej6v+nBQqE4TpWSXMtH4lQHPyVBR3fPmdLfJTO6w8EmgkvF3XuibXDXHJxF
 eVDdVGw7+uHFeJ1UyhqSlPXdDN1bYYbiO7GEDYe2J4oxv+QdEFsxnqLG0tt38fotEv/V
 5vmwPODiO1z60xOoPQBf3yHicCFnVRnvueY9EuwK3fY2Ms5leJ5i3VyGPVfUjvYNW4ad
 PF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DfHbeAOTImLR8eDuaR3mGDdtcDJszzidasMyMiqiLZ8=;
 b=aKYQSVMs2k0gAIoRBu2Qbz6ztN7+zIBaCF2CazuuDlAcRuXyzNwd3gS9nDq6jFk+mi
 EiEpgnqX5sHo4k8qwTQ2ZwL4pFO/wDRCX6OBBvbXeewo8XpWWJB8LpUgHBzy1LyvId35
 l0r6ahFuDRZHA7JEy6NtlUZ7TgPS+R9kevKLGSJ+n8c4bTkFdMrvz3Us/Q9GOSOsqrSI
 RUbsHigvrCwGnuyM8pdxLeszykNvz1wkhfGnMBll1Sa0Bf0KuBsgJ+DbpIDwzOsXBrfW
 2P+T/qhY/XFVgp5jvuAq7bTTPA5+nt33hFuN0aWloOXPWHykxbjyta3WTtlUqL1keaTE
 M1Wg==
X-Gm-Message-State: AOAM53222r3tSupZb8lBjDCpADq4nB5Zt6BI3BxbRj02JgMpfsjSdUIr
 ngsbj59fL8iDy2Zj+26/Sx8pWWxuqBQ=
X-Google-Smtp-Source: ABdhPJzDCHaUPLtzvZBSKP8QMvI1q22L6fDCeYkcL3iogQ8zld6Db69cGkDmcv6chxR428OPl8lzNQ==
X-Received: by 2002:a5d:5905:: with SMTP id v5mr12650276wrd.383.1629321811353; 
 Wed, 18 Aug 2021 14:23:31 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f198sm6198581wmf.11.2021.08.18.14.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 14:23:30 -0700 (PDT)
Subject: Re: [PATCH v3 58/66] include/exec: Move cpu_signal_handler declaration
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-59-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0cc1e49a-1cb4-88a8-dd78-1f02dd442d8d@amsat.org>
Date: Wed, 18 Aug 2021 23:23:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818191920.390759-59-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 9:19 PM, Richard Henderson wrote:
> There is nothing target specific about this.  The implementation
> is host specific, but the declaration is 100% common.
> 
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

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

