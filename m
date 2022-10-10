Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6620A5FA17A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:57:19 +0200 (CEST)
Received: from localhost ([::1]:53000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohv9Z-0002BU-Ua
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:57:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohune-0000Zv-7D
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:34:42 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:35585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohunb-0007yj-3V
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 11:34:37 -0400
Received: by mail-pg1-x52e.google.com with SMTP id u71so3053650pgd.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4SF69rB72ph4CrSw/ScIxW25Hue1gRrfheSzXnhsjOQ=;
 b=Xzzxo3EYkEwMv5wVrU58H8v3XXQwZpRIA6vbbINfo5JqcaMUSFTehXHPCA+0EWft/K
 A/svh8+xVGBkauc3Ao0u8732fIlNT5fxVA+bbqtktBHP2NaxKc2ObqdXRSkKWnWCgKyd
 2kZdLxs7r/t5iD7+PiDBDKe0RVCPbSRmigwso+43pHcj3j3Yr5KL0LkwApB5hgi2b3bx
 UzEnJ5rJvH7EFR66sm8BKJSJmK1NKSRB+7Qnj7vog8JztXSQjqncMQidQ1ozeKUcp+b6
 BsGewNjEf5zMUCcdITGlaKNuPRR4XJaenUZbbHsouRMsuAQBnA7/t58/1Km+2iiJpigs
 83rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4SF69rB72ph4CrSw/ScIxW25Hue1gRrfheSzXnhsjOQ=;
 b=iJ9GYbVNpFUwOLE6eXZivd7ilTaga64T6sTav1mrqnmvorwUZaFsz2hlXZyWCsHGRI
 7sEUzXaJZmB4pBQTVAjWOylaEpe9c3zFQHWRPWdOJhVI6fKpoTjws40Csl2AnPUpSZOO
 o1D3BQ6mCWf7ufI6InnY/lpN4FFEecUKogqhniqbY5m8LrK+2gUg+yLRtZPkex45LJzK
 GT5pKYoZLU2Cdk2RHKmj9qoiwJhwli8XoR3rFh8kJCWXHt5M/LgVzqxACPSIrBAZd5yO
 YsxK1j6TMvtR9RB+qhL0Zqzxk42Qv42J0YernKpRYorK487lW5oHuiPWCF+wpS6wgYOy
 /sew==
X-Gm-Message-State: ACrzQf0n5n4SQvmwoF8a5IjFTbpgEChO9ZqhZMGmksugz42z3HF5m2Sb
 T6TMDcSB+2tqp23Qk2+B80SEij6Ri1in1gb0CVn+Qg==
X-Google-Smtp-Source: AMsMyM6N9keXRqKvQYfP+qtNF6/dV9ui0jJCswG0oFnX6/bca4iKshTKxH4P4keRo9U9JTupV9lDR/mN8DlhbqiGHjc=
X-Received: by 2002:a63:8549:0:b0:461:3995:60d1 with SMTP id
 u70-20020a638549000000b00461399560d1mr8181134pgd.105.1665416072290; Mon, 10
 Oct 2022 08:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-3-gaosong@loongson.cn>
In-Reply-To: <20220917074317.1410274-3-gaosong@loongson.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 16:34:20 +0100
Message-ID: <CAFEAcA_ArAZT57=Rjog+vBrVsdpvUrQKrBA1ChyD8vxdfjM4hA@mail.gmail.com>
Subject: Re: [RISU PATCH 2/5] loongarch: Add LoongArch basic test support
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org, maobibo@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Sept 2022 at 08:43, Song Gao <gaosong@loongson.cn> wrote:
>
> This patch adds LoongArch server, client support, and basic test file.
>
> Signed-off-by: Song Gao <gaosong@loongson.cn>

> +int get_risuop(struct reginfo *ri)
> +{
> +    /* Return the risuop we have been asked to do
> +     * (or -1 if this was a SIGILL for a non-risuop insn)
> +     */
> +    uint32_t insn = ri->faulting_insn;
> +    uint32_t op = insn & 0xf;
> +    uint32_t key = insn & ~0xf;
> +    uint32_t risukey = 0x000001f0;
> +    return (key != risukey) ? -1 : op;
> +}

You'll probably find this needs tweaking when you rebase
on current risu git, because a recent refactor means this
function should now return a RisuOp, not an int. The changes
should be minor, though.

thanks
-- PMM

