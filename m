Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F708410CD9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:21:17 +0200 (CEST)
Received: from localhost ([::1]:41324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1RE-0001fo-KJ
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Jz-0004Ud-0Q
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:13:47 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1Jw-0005x6-Od
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:13:46 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f62-20020a1c1f41000000b0030b42643f72so5467052wmf.3
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n2UC1B7qVW9Cy0bnxocM5riWqjfgi4a5lfzl0Gx5CPI=;
 b=Xpg9ECpvXwGbP3tfuwcWNM6hruhwAPo7DdgdOjLdIitjPwFhMDBM+nVJiWbYWLvcbi
 sXLnyFiA6EhCpTPAxPtYBSVxDvql4f/XFccair7AIjWcqu4EFrPYt0CcZFpnj/GERGDd
 BP7UBUPitMSlBGcDNM58PIOxZ6+MFQvXZZffkwPk3DUmMDD3nH6xatDnB3g6AOW5jHAY
 UEeyaszY+NEhFJ8zZZ/Kv4kFPTMhnSzrPBgT054pYhjQEURNnfq8nznoM2qZtC9yRE6m
 SiSUro0UfesU6+xVNAYKj1Mm2iUVV1IeLkYInMZGS8xwnu6Wq896MYcjTi/LYQSi4/H1
 D4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n2UC1B7qVW9Cy0bnxocM5riWqjfgi4a5lfzl0Gx5CPI=;
 b=XVAOTL5f92dZt2JC03NDkvFmj3OEJMGRfRVolV35RyVlIZFb6DdRXlaxF+ed3D3GVN
 taStiWznygfvf3Am1WzZJb5ypesHu9DUa5ACogBli3pklwRlbSlDK3zLsxiK2FvNtRVu
 0tYeRxmgTVy2HfrIVUFoypifyf1IppN8Z3v7y/oG+uzCL3O9rXQBoAeGQ2MMDol4WLFc
 3FeqBYmR2cd9zbzibBgHZ1++XGNBOBjgFOqareFCBTnencmw4te/O4Oz5aKJGVfNWmWY
 s3Opzg8hVLDaVBi0z4MGTXoe9zyd7sgXygNclGwPyMJa9A7B46fm30sApmp6oFDGCaZK
 Drwg==
X-Gm-Message-State: AOAM531sqho8voqtRNewE43Mpca1YELY7kUJgErAs6iypPdOggA2K78J
 Xox6wbH+vB/7/5ZWNm6hIVw=
X-Google-Smtp-Source: ABdhPJyN/mXl6sc1dV+0IDShiggceLeEQwrLMsb2zBL7ES7o1U5NOmoVC3ZbPWy1Ea5pDcsYE1Y6lQ==
X-Received: by 2002:a7b:c74b:: with SMTP id w11mr6205289wmk.21.1632075223223; 
 Sun, 19 Sep 2021 11:13:43 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id r9sm5731657wru.2.2021.09.19.11.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:13:42 -0700 (PDT)
Message-ID: <eb5919d8-61f1-6023-5ae8-b42307d1b259@amsat.org>
Date: Sun, 19 Sep 2021 20:13:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 09/41] linux-user/host/alpha: Populate host_signal.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210918184527.408540-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

On 9/18/21 20:44, Richard Henderson wrote:
> Split host_signal_pc and host_signal_write out of user-exec.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/alpha/host-signal.h | 41 +++++++++++++++++++++++++++++
>  accel/tcg/user-exec.c               | 31 +---------------------
>  2 files changed, 42 insertions(+), 30 deletions(-)
>  create mode 100644 linux-user/host/alpha/host-signal.h

> +#ifndef ALPHA_HOST_SIGNAL_H
> +#define ALPHA_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.sc_pc;
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint32_t *pc = uc->uc_mcontext.sc_pc;

BTW I'd use host_signal_pc() here for consistency with other targets.

> +    uint32_t insn = *pc;
> +
> +    /* XXX: need kernel patch to get write flag faster */
> +    switch (insn >> 26) {
> +    case 0x0d: /* stw */
> +    case 0x0e: /* stb */
> +    case 0x0f: /* stq_u */
> +    case 0x24: /* stf */
> +    case 0x25: /* stg */
[...]

