Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE1E3B4886
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 19:57:03 +0200 (CEST)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwq4c-0001k8-1i
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 13:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwq3d-0000yC-8H
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:56:01 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwq3a-0006Yn-M7
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 13:56:00 -0400
Received: by mail-ed1-x52a.google.com with SMTP id t3so14500147edc.7
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PEaCSST20cr8jtoHuPWgfJMiBZ8T+jElIaW2oiNkh2E=;
 b=cyfXCwT4pnuQ+Fs3pmHjd6z/SqPC6x80wJoLBq7CMThrQhHboM0sMXAf1QMSC9OUGo
 yLzgupa9QE/eurW8gHmf0WPR1TqgNH6PMK0CaqFopVfCYvPXMnCXkn8eVNefZ0l3udfg
 Nwk96b2o9raRwvvfE8kaQ3V+eDBWS66IY0y+68HC0GYYYGaoPw87XFvk8I6idU95Tr4k
 VVamMiL11sDxt8qpk/6OWusBTl64Sd1WZR5tb0ch6SYUXY0CztR4OVKwv8WwW1wyWvdC
 +IOchH3eiUKkTxZZJhkApma9SEbZYcUs6WD5lkf2kkzYlgP5eXwDOHZ/rQxEPqg5OHqH
 rakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PEaCSST20cr8jtoHuPWgfJMiBZ8T+jElIaW2oiNkh2E=;
 b=PgqFL+gtdrb3hsQjn9Mk/63rzv/1iFkfkXP5TaslDEScHvt+7Bxj/0wVs3JumJuz9y
 2xVqJw2ovrss2AXlSl5vizMkEHo/8/zmszZ81gaW0urFfaKTXVnFFmKpw6ozJnKjKHcC
 qNVHslosghz6xVI3VIUtOkZ1uarFB7Fuf+udoyaDGrcF+kHhf1wETSY3xC7bJz7FN/Ow
 O8aHSYzR/AtENgE4TUOoJ9SM5Ocghg/o3OXU8IZHlv1ZoFhzCJ8sz+FciuuGHb4XMd8y
 xFbOMZgDhv2HQ08DBJU5JHtt+6iXzPhZwRv2xtFbJ5M+i7t0BiYBOcRo3McOkv83FQut
 iL0Q==
X-Gm-Message-State: AOAM530pnP4sKrgMPTx1XDLcPDBHIx23pdbHtkMeE2kjQAih1TDGyER2
 EN/BWAoVJd9ElDWk9fhcKgz+KMZ6vs+N9oMTQrW49A==
X-Google-Smtp-Source: ABdhPJxN3/krFZKrm16whEXSBwqVn5YDXCrDBo1Oi/bXTPqfYPmyZZs/54r9ZcZmrbrWa+WvveynugrsYvhD4vOz88k=
X-Received: by 2002:a05:6402:1911:: with SMTP id
 e17mr16351862edz.36.1624643757054; 
 Fri, 25 Jun 2021 10:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210624120211.85499-1-alistair.francis@wdc.com>
In-Reply-To: <20210624120211.85499-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 18:55:20 +0100
Message-ID: <CAFEAcA_OTizHfz+nrnT8n5Q8Rrvzp5JCxoMbVMOmFb0s8y-uHw@mail.gmail.com>
Subject: Re: [PULL 0/7] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 13:02, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit d0ac9a61474cf594d19082bc8976247e984ea9a3:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-06-21' into staging (2021-06-24 09:31:26 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210624-2
>
> for you to fetch changes up to 3ef6434409c575e11faf537ce50ca05426c78940:
>
>   hw/riscv: OpenTitan: Connect the mtime and mtimecmp timer (2021-06-24 05:00:13 -0700)
>
> ----------------------------------------------------------------
> Third RISC-V PR for 6.1 release
>
>  - Fix MISA in the DisasContext
>  - Fix GDB CSR XML generation
>  - QOMify the SiFive UART
>  - Add support for the OpenTitan timer


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

