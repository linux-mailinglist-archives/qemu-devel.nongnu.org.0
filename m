Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003D13FD74B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:57:59 +0200 (CEST)
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLN0J-0006T6-41
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLMzT-0005o7-Ou
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:57:07 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLMzS-0005Cy-5E
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:57:07 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so1506172wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fP1oJEPBSpHCtqvnqVGkIn7W0OmTtL4V9IuEnT9J6cQ=;
 b=UHag0l5VaZMHmKDy6GH3Cchrkk+fVwyXj0evHvFPG5Ang2P4VyJREz0RzwkMVs9P1a
 kqpAFoftc8jQl05uDKUU3qBnTtRBTxJmnYQyZh14PDQJZaye4hIIcZcX3uBzRgu3jSwD
 meAYwkgdsaQm4HJd5VEVVST1EhUrto+kKEqmBwNgljLmvAw2eQGPVHqNb1KbESA+Znzs
 cR+jK6QKJtJ011ZK7hsdSUfDkAzH35XCyEH+D0Ffs7ViMB+Biladeg6NVmDV32/bjzfF
 0FbBTUtBvHcWMx/tT3ExcLUS/a++7XLk6CDojWs2CmOb7QeaZm/Y9NjOcowMtyCCKxgy
 Ps7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fP1oJEPBSpHCtqvnqVGkIn7W0OmTtL4V9IuEnT9J6cQ=;
 b=r8qR3Yrc124ZwTLxwMocV4PDiKMhOuFApA60B8FTQvCVsAxo8hnSX3FtcqEr11e1fM
 T8TZe9htSgUdgLYrtGI7C6KrLYyJjcR+D5hJE/2kyW3SZT+vEeaMgMOhwpToDFDmCUU5
 +C+6wWQW32daozQVdwDxRFsEnJy9ohWaJq0h0NptGXsDIB14bQUGzPdCQdo1LVo0UuD+
 dkbVLqFSESZxx0lihx8jDkZq/xv8bLCJ2DaZzhW9+K2BXQvkJwlfYGKre0ccETJSSClA
 +8/epxCb70Hhz9QSBhdn45h7+jEC3uZbCJukth5cE0LKO6xQXF7T4/af8GKaN/yuo1xc
 S8Cg==
X-Gm-Message-State: AOAM531oyt2k5YAkRsgdZs6ZtvqOXqBmQZe0IAnxfN4IqjDKiA1ppfUw
 PjtO9Ir393S+d5thoc980+bdF6SmTIqL9oJ02FuNr6Db3Kc=
X-Google-Smtp-Source: ABdhPJwX2+I0NxK4FTFZuTRNIrgIdWaBrkg7n2khAgr4cVU2RwRdi4dYiDzVLK9YNtAQ1g+/GtJ24IQ9smMmTj+dIUQ=
X-Received: by 2002:a7b:c041:: with SMTP id u1mr8534685wmc.95.1630490224669;
 Wed, 01 Sep 2021 02:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 10:56:16 +0100
Message-ID: <CAFEAcA_D=uPR93cdkDKW7AJmJVFMFAJsvesTurNfxVK2ioVneQ@mail.gmail.com>
Subject: Re: [PULL 00/33] riscv-to-apply queue
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 03:10, Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> The following changes since commit d52dff5d8048d4982437db9606c27bb4127cf9d0:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/clip-pull-request' into staging (2021-08-31 14:38:15 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210901-2
>
> for you to fetch changes up to 8e034ae44dba6291beb07f7f2a932c1e5ab83e98:
>
>   target/riscv: Use {get,dest}_gpr for RVV (2021-09-01 11:59:12 +1000)
>
> ----------------------------------------------------------------
> First RISC-V PR for QEMU 6.2
>
>  - Add a config for Shakti UART
>  - Fixup virt flash node
>  - Don't override users supplied ISA version
>  - Fixup some CSR accesses
>  - Use g_strjoinv() for virt machine PLIC string config
>  - Fix an overflow in the SiFive CLINT
>  - Add 64-bit register access helpers
>  - Replace tcg_const_* with direct constant usage
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

