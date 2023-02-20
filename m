Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0351369D22C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 18:39:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUA6n-000068-7p; Mon, 20 Feb 2023 12:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUA6m-00005y-9e
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:37:48 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUA6j-0000gx-HU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 12:37:47 -0500
Received: by mail-pl1-x634.google.com with SMTP id c1so2576946plg.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 09:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2bohxXLr1BfTy/poubrVhXXEy8MGhXoKryYmKOezeZY=;
 b=hY1CmKcGhb/t3/2y8ZzmDkMfG9fqiX/Z09aXGBzXO50DDqRh/iX4LKkQlaY3+BxUjk
 r94/KNimiOWvN/U0ypZ0V8s2L8F9aY1jJEsz8F1XJJzftDusYGgjS6dODXHdjD5O9s6/
 7TEAsYomA+D78zc8OaXUu8LP9c/B9sYwhw9RDJBaWK7sUeaza0agNcr5B0/UG/ctb9oo
 XSPPWIxmHnSXlBRiA7+O+vg6FT75UjVxEzwVP/mQqZbmB/jHeiLLZrUvS9doH1VEVRO7
 8X5OoqpWlsnuiInhamhksJVwMtBZZcQlFMzUCPGDge/8K8LL+bVC912JSo5JgTz3xOFr
 Dkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2bohxXLr1BfTy/poubrVhXXEy8MGhXoKryYmKOezeZY=;
 b=tk0LQ91T7ks6b3WjeY/ePYie01D/9YGiACrIsjatx3Ih/bvZwrgMRrjC57N7tHtuEh
 hobeoZSHxJ8p7PxPZLeHjCGfgYoS/8sKTsdDwSmvFv5lU+HSHVpGFsiX4S7OG6sVPKg+
 0VQ6RZPZwgpiYKyyBGh0NtVU7d5MA6FFqwLfKH1R3mTe4xfmV9gGrb+Txez1REB7ekCR
 8gfh3I/d2hOvu/ZEa6R3Q81JC80RUv1I8YDP9CZbnxxsMYq+RkU3LyJIw5gpjn7KdoBx
 r4b16jD1CYGna2Xu3tVI9xpklm8sb/B5t6Yehg9N3697flJNiHqnfcRN4+jMM6WbKMJo
 fcfA==
X-Gm-Message-State: AO0yUKXNJX3E+AbASmf1PLg0FggGvFtAJP3EaYDa/Sr9oOHBX4U8AxNf
 3TSTrIM4yH1w0m6WO5lcM00XMklel8YJYiB/D13pQw==
X-Google-Smtp-Source: AK7set/a0KIK/1YAgKuVO+7Bf8M5WHot/lnWb81oM3vANR03qeM9QHxww0l8uCSlofdN5f5TjY4zUSGWR2MoUi/q+As=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1051728pjb.92.1676914663817; Mon, 20
 Feb 2023 09:37:43 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-15-richard.henderson@linaro.org>
 <CAFEAcA96L2V0dvnrygnr00PsKkAcko30h+RCKUMcAJGv0utH4A@mail.gmail.com>
 <c6d768e4-6f48-b68d-26f0-227d70bce82e@linaro.org>
In-Reply-To: <c6d768e4-6f48-b68d-26f0-227d70bce82e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 17:37:32 +0000
Message-ID: <CAFEAcA8sfvQFFArnkm8aGXSvhB6t+vg52bdQCPvLu26VXRkNtQ@mail.gmail.com>
Subject: Re: [PATCH 14/14] target/arm: Support reading m-profile system
 registers from gdb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>, 
 Luis Machado <luis.machado@arm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 20 Feb 2023 at 17:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/20/23 06:02, Peter Maydell wrote:
> >> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
> >> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> >> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");
> >
> > Half of these need to be in org.gnu.gdb.arm.secext.
> > These aren't our own XML features we're making up (if they
> > were then they would be in org.qemu.something), so we should
> > follow the existing precedent about what registers go in them.
>
> Now that you point it out (and I should have checked myself), we are kinda making them up.
>   The only registers within upstream gdb m-system and secext are MSP, PSP, MSP_NS, MSP_S,
> PSP_NS, PSP_S.  All the others are our own addition.

I think OpenOCD's implementation includes more than that:
https://openocd.org/doc-release/doxygen/armv7m_8c_source.html

> Should all the rest be in a third bit of xml?

Luis, do you have the specs for what the existing implementations
are doing here ?

Ideally gdb should document for every bit of XML it is the
official owner of (ie in the org.gnu.gdb namespace) what the
required and optional register values are, including details
like the register width (which I think the two existing
implementations that output m-system disagree on).

thanks
-- PMM

