Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB00C2E8878
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:24:57 +0100 (CET)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnSJ-0006qx-Rz
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnR8-00067R-1R
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:23:42 -0500
Received: from mail-il1-f179.google.com ([209.85.166.179]:33815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnR6-0005lu-MV
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:23:41 -0500
Received: by mail-il1-f179.google.com with SMTP id x15so21781746ilq.1
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mwx38paCXtQqU0SD6ccsT36ZkBEXmN6y7OLy7XAMjHc=;
 b=BPjLz7FdwO2W2IjdTaI5YpeBkJ+rQsfsZnrRNC3qLvzjxe4IIar2CbK0/kW3U4Hquk
 29iEsgsWrUOS92/aPzZL3tdvww7VHLgopmS4s4P8j45MWy2C8V8I3Hm+J1zRWLT8eR00
 f8zsEfHFujkyEbHYHxWcVHbK2mpyJ+LgIxmYl9ehdu/bZXKXROCPGRBvL4CaU83kffGd
 MdOAXiYiDVdi+MpT5sdiujj8adATtBpm5HIO7+AKDATVPGp+smGcw5zZvElchDFXkuie
 wJhW31x0qtDqQXdz2FNkRfVc2hHvuPpseJpugq0NOTCUoiu2Swfgh8Sda9ozqTDYEzrh
 iEIQ==
X-Gm-Message-State: AOAM530Junyui/yrN8r2UvhUjndq4PJdl7vuGY4atyrvgBYKEIO0v79J
 k+xKzXNnwyPhqb7L6wKza2ycD6HIjrE=
X-Google-Smtp-Source: ABdhPJwOGe4It25BgIJlnBvmRWOaicNvcxii8lIEm8Wfzx2QFT+FQ0KBAuwgBUkrOzPBfoBoZVRP9Q==
X-Received: by 2002:a92:9153:: with SMTP id t80mr63771667ild.216.1609619019714; 
 Sat, 02 Jan 2021 12:23:39 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com.
 [209.85.166.176])
 by smtp.gmail.com with ESMTPSA id r10sm37394128ilo.34.2021.01.02.12.23.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:23:39 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id q5so21742244ilc.10
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:23:39 -0800 (PST)
X-Received: by 2002:a92:2912:: with SMTP id l18mr64017471ilg.173.1609619019476; 
 Sat, 02 Jan 2021 12:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-43-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-43-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:23:28 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDq2hLEhmF+e51oY6t-Z_18DtJyxy67yivaGNxuo74Qhg@mail.gmail.com>
Message-ID: <CA+E+eSDq2hLEhmF+e51oY6t-Z_18DtJyxy67yivaGNxuo74Qhg@mail.gmail.com>
Subject: Re: [PATCH v4 42/43] tcg: Constify tcg_code_gen_epilogue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.179; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 6:03 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that all native tcg hosts support splitwx,
> make this pointer const.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h            | 2 +-
>  tcg/tcg.c                    | 2 +-
>  tcg/aarch64/tcg-target.c.inc | 3 +--
>  tcg/arm/tcg-target.c.inc     | 3 +--
>  tcg/i386/tcg-target.c.inc    | 3 +--
>  tcg/mips/tcg-target.c.inc    | 3 +--
>  tcg/ppc/tcg-target.c.inc     | 3 +--
>  tcg/riscv/tcg-target.c.inc   | 3 +--
>  tcg/s390/tcg-target.c.inc    | 3 +--
>  tcg/sparc/tcg-target.c.inc   | 3 +--
>  10 files changed, 10 insertions(+), 18 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

