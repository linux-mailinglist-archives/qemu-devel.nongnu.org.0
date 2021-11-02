Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B54A442992
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:33:02 +0100 (CET)
Received: from localhost ([::1]:51696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpE5-000535-8H
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpDD-0004Gr-PR
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:32:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpCy-0006Sp-QD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:32:07 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t30so7139037wra.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qmt9S8aUmRlz4b+KM+T9DlNW28Mn96oJAG+g1lenHG0=;
 b=WkbY0V39DE9xRWnJQXUgygmqMUeW/WYeGLjvb55bhbWjJt+orNZ6ANfsweCMuariuj
 Y+ADOmR5qmoRKPPYZk+uVPpfPbX9AcridDL6RBrtk1mrZU43NZy70CMTspqAitaaXS6n
 YrHQ/uCjPSR3nyYLKeJljmmS3Tn+20Ey9vAFQAklhE2c0CShjpMpc5tOWrP+g/Apsr5s
 TXPWIfDCYZ3Wb1C1NJ3PBEBT8w+3Wpwu1vaHGlwz4aZD5qmBF5ZBCvMENcrtzbQ8X+46
 Cgh7iqrsuQ9TJoD85SGq59+6j44AnbsOd9L/pSgmSUaWx9kGQbNsXhW9rA9Sqqf5QoO5
 vrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qmt9S8aUmRlz4b+KM+T9DlNW28Mn96oJAG+g1lenHG0=;
 b=Du5OB0QPvGzne6EgvBlU/SBAXBBtg1r3sFl5oaQTyd/iST0EyEGT1n+YA/BaSSVUbq
 bxGHDMZFRprmR7EhsYi1UAyYruWYYWl/2AFmI5vpeLIGrzcO6PGCDIEztJXUYLplazVq
 5Ad6OsZ5EqqG4IGkUXphuMZ29F/g7OadnNeiuZbb5uAryLYj+2z8sCzoT5DF/89zazyH
 Ngnuc0tX0zJmrysaOZUtii+tjmRmllcqmcty/gdjHSwp7jlBxb/mxXDkGkNJ6+hAzk5t
 MXsE7OSt/qXPiou5nOQmAK1c3Fa4tjZnzJKdyhP/O5kwWsIujtsmTf2jWAhVLnEN8/cK
 VvXQ==
X-Gm-Message-State: AOAM532tkXFGMplDo7UCzkdqs1LYuw2OwogZakSHdTqdxqaiF3AUOqV0
 TF/jDKBZinW5RKZkMmqaoFc=
X-Google-Smtp-Source: ABdhPJwC6YBNo7gVcaSf+Ffx4kxaBiKDqdYg1SC6uQVA55Xho0onEDccDAA9TxEVE/B2O2z0LZASog==
X-Received: by 2002:a5d:58ed:: with SMTP id f13mr35184788wrd.373.1635841911291; 
 Tue, 02 Nov 2021 01:31:51 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u19sm2025646wmm.5.2021.11.02.01.31.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 01:31:50 -0700 (PDT)
Message-ID: <05fbb578-f045-db3e-5eb6-61b9fac26cdd@amsat.org>
Date: Tue, 2 Nov 2021 09:31:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 00/29] Add LoongArch linux-user emulation support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1635760311-20015-1-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, i.qemu@xen0n.name,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 11/1/21 10:51, Song Gao wrote:
> 
> This series only support linux-user emulation.
> More about LoongArch at: https://github.com/loongson/
> 
> The latest kernel:
>   * https://github.com/loongson/linux/tree/loongarch-next

>  create mode 100644 target/loongarch/insn_trans/trans_arith.c
>  create mode 100644 target/loongarch/insn_trans/trans_atomic.c
>  create mode 100644 target/loongarch/insn_trans/trans_bit.c
>  create mode 100644 target/loongarch/insn_trans/trans_branch.c
>  create mode 100644 target/loongarch/insn_trans/trans_extra.c
>  create mode 100644 target/loongarch/insn_trans/trans_farith.c
>  create mode 100644 target/loongarch/insn_trans/trans_fcmp.c
>  create mode 100644 target/loongarch/insn_trans/trans_fcnv.c
>  create mode 100644 target/loongarch/insn_trans/trans_fmemory.c
>  create mode 100644 target/loongarch/insn_trans/trans_fmov.c
>  create mode 100644 target/loongarch/insn_trans/trans_memory.c
>  create mode 100644 target/loongarch/insn_trans/trans_shift.c

I was expecting the QEMU coding style to mention "included C source
files must be named .c.inc" but I can see it. However, see:

commit 139c1837db7eaee53e1c441629b5bcc159e1deb0
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Tue Feb 4 12:41:01 2020 +0100

    meson: rename included C source files to .c.inc

    With Makefiles that have automatically generated dependencies, you
    generated includes are set as dependencies of the Makefile, so that
    they are built before everything else and they are available when
    first building the .c files.

    Alternatively you can use a fine-grained dependency, e.g.

            target/arm/translate.o: target/arm/decode-neon-shared.inc.c

    With Meson you have only one choice and it is a third option, namely
    "build at the beginning of the corresponding target"; the way you
    express it is to list the includes in the sources of that target.

    The problem is that Meson decides if something is a source vs. a
    generated include by looking at the extension: '.c', '.cc', '.m',
    '.C' are sources, while everything else is considered an include---
    including '.inc.c'.

    Use '.c.inc' to avoid this, as it is consistent with our other
    convention of using '.rst.inc' for included reStructuredText files.
    The editorconfig file is adjusted.

So IMO since these C files are included, they should be renamed
accordingly.

Regards,

Phil.

