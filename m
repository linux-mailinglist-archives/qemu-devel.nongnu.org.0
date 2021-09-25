Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565894182A4
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:22:29 +0200 (CEST)
Received: from localhost ([::1]:57558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU8ZQ-00008O-Ei
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU8Y4-0006Nf-Og
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:21:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU8Y0-00054T-UT
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:21:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id u18so36368926wrg.5
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6haOHOO06TWBlU4rZSIni6/3reprJg5KhUNnhVFEpsg=;
 b=SiUHrfOcfWEbwZi1gwpipihyaLW2M53M4l9DavyPMMaas3ycHsTTAFuA6m948Z2BIh
 OL12w6kxNkVPH4FWYAhMuqY1p1AYbXGMiCRKipzIoiX/7/3oavtcBooHm7tGB7uSkFNl
 XNK2jjmyTMUH5PjHAkTetFXH6gnX1OSHTM/d00mPSp+tJsGGcpE5UBafjBa3sCR7TA8T
 49wbtrwXttqfjaYBLTm/fkbicFJWoiB5jLEUxBhIFUC3lSQI+x16/il74Y6LVkmWXYQ+
 G01y/8uikijYlkHOBJPLhOdhtmkhjuXGj/gNz/wHDM4cPxDC4qyL+yperphOQL0AQFpM
 9IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6haOHOO06TWBlU4rZSIni6/3reprJg5KhUNnhVFEpsg=;
 b=O1pMkyp8QIaOO5icWXQQbiy7FIMCxTg5CmuPYZ+itkD6WbnRkL07KnzdYSbmKce+Z2
 BMiorhyQGyFdqx7pSDYNrhp4Hn+g7PSCM78vFIrNZH2sg5gqSFtXKSfSCo1ivO6GdAv7
 pqvMW4xNkXGwrb/jr7XgLkjEgazGKM9ZQc4wzDQO2sruXN46Z+VuLchIXDYo90a4RKsP
 gQ0XPoK4QGwW66IKi+4T7u/AAAetrckfkVIh35zkzc1fEnNG0axGZkjx6MrZckfFUuVO
 8VMWYkUOoiIcsrMdbqnlgIE+04qmu6mTLSXaA7mgUxE1FeCRP/thJUGsjJoNyx/nwUim
 Gnrg==
X-Gm-Message-State: AOAM530wjfMqExjTlH+LjFUwDRl0z+8mGXJ6TXY2OJkRGyYJw+vp/aYP
 L5/5zbk3Z+J8hDyZs5FzdgUfYSfw3BM=
X-Google-Smtp-Source: ABdhPJwk6rJvHX+ckH5qqrzh/SnQIdbeYJ2VRyCF4AoOfee+s6TYZLAYBoRBTqr2Uk+NTk9lX2ewIg==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr7129480wme.3.1632579659108; 
 Sat, 25 Sep 2021 07:20:59 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id e5sm11235978wrd.1.2021.09.25.07.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 07:20:58 -0700 (PDT)
Message-ID: <7fd67b93-3fe6-ceb6-52d0-d5ddaf2d158c@amsat.org>
Date: Sat, 25 Sep 2021 16:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v6 00/40] accel: Move has_work() from CPUClass to
 AccelOpsClass
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20210924093847.1014331-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 11:38, Philippe Mathieu-Daudé wrote:

> CPU has_work() is a per-accelerator handler. This series is organized
> in 2 parts:
> - Patches 1-15: Move has_work() from CPUClass to AccelOpsClass
> - Patches 16-40: Move remainging has_work() to TCGCPUOps

>    target/arm: Explicit v7M cores use arm_cpu_has_work as
>      CPUClass:has_work
>    target/arm: Restrict has_work() handler to sysemu and TCG

Apparently while reworking the target/arm patch I dropped the
target/alpha one, so I have to respin this properly.

(Note however I noticed that locally rebasing my branch on
the recent tcg-next merged tag, and this series did pass the
CI, so I wonder if qemu-alpha is built / tested in CI...
I'll look at it later).

>    target/avr: Restrict has_work() handler to sysemu
>    target/cris: Restrict has_work() handler to sysemu
>    target/hexagon: Remove unused has_work() handler
>    target/hppa: Restrict has_work() handler to sysemu
>    target/i386: Restrict has_work() handler to sysemu and TCG
>    target/m68k: Restrict has_work() handler to sysemu
>    target/microblaze: Restrict has_work() handler to sysemu
>    target/mips: Restrict has_work() handler to sysemu and TCG
>    target/nios2: Restrict has_work() handler to sysemu
>    target/openrisc: Restrict has_work() handler to sysemu
>    target/ppc: Introduce PowerPCCPUClass::has_work()
>    target/ppc: Restrict has_work() handlers to sysemu and TCG
>    target/riscv: Restrict has_work() handler to sysemu and TCG
>    target/rx: Restrict has_work() handler to sysemu
>    target/s390x: Restrict has_work() handler to sysemu and TCG
>    target/sh4: Restrict has_work() handler to sysemu
>    target/sparc: Remove pointless use of CONFIG_TCG definition
>    target/sparc: Restrict has_work() handler to sysemu
>    target/tricore: Restrict has_work() handler to sysemu
>    target/xtensa: Restrict has_work() handler to sysemu
>    accel/tcg: Remove CPUClass::has_work()
>    accel/tcg: Simplify tcg_cpu_has_work()

