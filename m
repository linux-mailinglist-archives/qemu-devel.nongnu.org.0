Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ABC399DCB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 11:30:24 +0200 (CEST)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lojgF-0006ih-2S
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 05:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojcJ-0000LQ-Ua
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:26:19 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:41905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lojc9-000790-DG
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 05:26:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id gb17so8200783ejc.8
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 02:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GorE4xsm/htsgMDGcvXKtyL9UTi7osxfQmz+9ybXRH0=;
 b=a3pwRxb9mEcLNLJHMGx1yBoql7H6NxMDjrNm57oYLV0K/JAKBC+mFc74bekXPRGK6/
 5yEunE9e5Z14vn8RxR1IKzjgY73SoqwJ2qgyvj2Sd86QXQZ1d4CD2cDEbs762GbTGmXw
 QcyyBPxueSxpxfnSqYycjFPN0jCUtP2MfvizofgZRcjROqzeJaBxVVXE5/gRduP3vv/f
 43XTRwfuj2bHiZtxoE8UJnD2bg/rp7Nr8W2fw9oYsbCaPQpTjjLc1M0e2QXjcwL6kznx
 ByidzJhj8JnuQB2s3+rN9C5muHMnpRfmBbJwKiE7N9kzjgc2f7iPngIdHod3Dlx70kQd
 W4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GorE4xsm/htsgMDGcvXKtyL9UTi7osxfQmz+9ybXRH0=;
 b=etKD7tweEjZ2iJ31YIQvWcn8lNG+iCuUoscRYIgTeAJ+dmVZAlmqCUEWp9dN7GnLuV
 /dnTsrIHBxcQPHuUepd6OYBDU6VTpaWas/ik5DSoLMR8H4WLkDLNUF6ClETyDfvnKvT6
 CZR9FVDElxDa9Fd+R9AjmhHgpcTWKukB8sTK0C/poEIZbn+lKx9FxYScvspiIC3OcpEZ
 YgmaZY6Vk8O/ie8N4SE5fl4zXzSjduobfuNsvnxhfkvyhV2/5tb0mVfIWu99tzBfaw7v
 OjZvSFsMpI4Pv/hzJtG6NAFlV+Z4xk00U/f+1M6bcrHdhisrVYb0iTfgSQQWBIwzNslW
 SfYw==
X-Gm-Message-State: AOAM530D3EhiCV+QuWv8v6sJN/5zx08xm8zlSM4L+gdLf7PgoDiycBvz
 3Z0sCJGUqMtNlCpr3Aopv4yJtUAfKuT5Wg==
X-Google-Smtp-Source: ABdhPJwMgSqCDX8Tldbx7rzxHtr+8utcIOh863HXKH5HlrW7zW4P3R1NDZTx/mQIjlJJmpYXIST47Q==
X-Received: by 2002:a17:906:9455:: with SMTP id
 z21mr16357205ejx.491.1622712367953; 
 Thu, 03 Jun 2021 02:26:07 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id du16sm1214439ejc.42.2021.06.03.02.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 02:26:07 -0700 (PDT)
Subject: Re: [PATCH 0/8] PALcode fixes required to run NetBSD/alpha.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fd38a88e-d04f-be18-d756-df6281d881e3@amsat.org>
Date: Thu, 3 Jun 2021 11:26:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-1-thorpej@me.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.613,
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
Cc: "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Richard & Emilio.

On 6/3/21 5:53 AM, Jason Thorpe wrote:
> Included here are a set of patches that fix issues in qemu-palcode needed
> to run NetBSD/alpha under Qemu.  Some fix garden-variety bugs, some fix
> deviations from the architecture specification or behavior of the SRM
> console on real Alpha hardware.
> 
> Two of the changes (patch 6 and patch 7) also require other fixes in
> Qemu itself, which will be submitted separately.  However, the changes
> are fully compatible with existing Qemu alpha VMs because Linux does
> not use the the SRM PCI interrupt mapping information (it has its own
> tables for the system variations it supports) or the Console Terminal
> Block in the HWRPB.
> 
> Jason Thorpe (8):
>   Make qemu-palcode build environment standalone. NFC.
>   Fix delivery of unaligned access exceptions.
>   Fix initialization of the hwrpb.hwrpb.cpuid field.
>   Make some PCI macros available to other files.  NFC.
>   Fix incorrect initialization of PCI BARs.
>   Provide interrupt mapping information in PCI config registers.
>   Provide a Console Terminal Block in the HWRPB.
>   Fixes for seconday CPU start-up.
> 
>  hwrpb.h       | 54 +++++++++++++++++++++++++++++++
>  init.c        | 88 +++++++++++++++++++++++++++++++++++++++------------
>  memcpy.c      |  2 +-
>  memset.c      |  2 +-
>  pal.S         | 15 ++++++---
>  pci.c         | 31 +++++++++++++-----
>  pci.h         |  5 +++
>  printf.c      |  4 +--
>  protos.h      | 30 +++++++++++++++---
>  sys-clipper.h | 27 ++++++++++++++++
>  vgaio.c       |  2 ++
>  11 files changed, 218 insertions(+), 42 deletions(-)
> 


