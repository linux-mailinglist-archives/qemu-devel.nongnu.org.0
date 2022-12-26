Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DAD6562F0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 14:51:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9nrA-00033A-EN; Mon, 26 Dec 2022 08:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p9nr6-00032L-QW; Mon, 26 Dec 2022 08:49:28 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p9nr4-00035S-Ss; Mon, 26 Dec 2022 08:49:28 -0500
Received: by mail-ed1-x536.google.com with SMTP id i15so15583856edf.2;
 Mon, 26 Dec 2022 05:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VoSGCTANv2eWEHHkHXNaF9jWh4psFxbzv4rYGS6ge5o=;
 b=CsCHBx/KrydkdaTKNg5W1BioD+nj53whuTOAAIiotXCY3ItjLUGlsMEDB+imoB1dKg
 /2zzfOTeB6SKIVMk8Pei0aOOohQ21M9qUp+G7JdMBE2YpjHggohy9tj+AqBmolZYREAF
 m8vNTN1LQXEE6Hxs0fwRJNGgRPgZBi3sn5l7TIHpHkGQ3IyI7z6+fk6fDK3v/t3Zxud/
 NNUME5AEv/qafh/+XQ7BSIDmmQqeynXI+uTGzst5lR5IwNIvTIfY0rbMeKmgArW2CwfJ
 IqmVNEUNGyrus9SMNtafoFuF2bjv5Pj3PNicvqibQA+s9J9XGwYnBZxIvNAAOBdmL2HH
 yBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VoSGCTANv2eWEHHkHXNaF9jWh4psFxbzv4rYGS6ge5o=;
 b=buUPap7u9/qrG8YRfe2KyMhssPHiaopyC/YDo1g7BXR9p6ZIHKNVHiC9sL81VK3or1
 hcVVW36wGx6CLZP45oje06Vu+Ikfl8QJiyed8+Wnpf6xQNyJECHAHU5hQi0WVAea1GQ+
 amoiNOlrICt1FHaamTYjwRsOXvONT7GkMr889PZPZqoRlIhlkxD9b2wSJQ1kyNSq1hmE
 woLgvsDxRq9ii+8p4lQG6qQwZ9Q69ydtpOQsHdxO/cO/4cC+Vz0Q9+QfNtPapGFeBYHO
 odvoCu06mZoD+6liY88K044/qGyh3GkmtRnErzCjhflDXd3SYPGBaebCri6IHVy4REXP
 Zj4w==
X-Gm-Message-State: AFqh2kotqeO7XRuI0V7GbkOBzK5hQp0uE+s29hwvBDedd8rORcMMHeXJ
 XjyF8v/34S1HoVoxt5K2ncapCSOWf2ga5Bkv3XM=
X-Google-Smtp-Source: AMrXdXs/OKN7oICgb5t8hXVJ+tZ9lemCM80vQ1trIpz9wlRiRaAYlXqv0tWNuOhHqY46bh205pKGltur5ZNx31q/r5c=
X-Received: by 2002:aa7:cb52:0:b0:484:93ac:33a6 with SMTP id
 w18-20020aa7cb52000000b0048493ac33a6mr336572edt.81.1672062564149; Mon, 26 Dec
 2022 05:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-7-dbarboza@ventanamicro.com>
 <CAEUhbmWxGAb_AtjW74nW7sYjT7-j8NwqQxQpmShuaurSMOerzQ@mail.gmail.com>
In-Reply-To: <CAEUhbmWxGAb_AtjW74nW7sYjT7-j8NwqQxQpmShuaurSMOerzQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 26 Dec 2022 21:49:12 +0800
Message-ID: <CAEUhbmU6OV+37fBvFZ04-7f7xhDtfgeATH-rJ9COJnmiywE50A@mail.gmail.com>
Subject: Re: [PATCH 06/15] hw/riscv/spike.c: load initrd right after
 riscv_load_kernel()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri, Dec 23, 2022 at 6:04 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Dec 22, 2022 at 2:28 AM Daniel Henrique Barboza
> <dbarboza@ventanamicro.com> wrote:
> >
> > This will make the code more in line with what the other boards are
> > doing. We'll also avoid an extra check to machine->kernel_filename since
> > we already checked that before executing riscv_load_kernel().
> >
> > Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> > ---
> >  hw/riscv/spike.c | 31 +++++++++++++++----------------
> >  1 file changed, 15 insertions(+), 16 deletions(-)
> >
>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>

This change unfortunately breaks the ELF boot on Spike.

I will propose a patch to fix such unexpected dependency.

Regards,
Bin

