Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B453748C3
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:37:37 +0200 (CEST)
Received: from localhost ([::1]:47676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leNKy-00049G-MW
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leNBk-0007Fd-LF
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:28:04 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1leNBh-00021v-O2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:28:03 -0400
Received: by mail-ej1-x634.google.com with SMTP id u3so4581805eja.12
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F8KlPsbf1dz0Os1831Kn1fwFPb/5QQ3yaQaEzVh6bSw=;
 b=q7F/z77PHWT7jPgoRve/KwlOf9oPG7RyeNgpMG9sD8QpJHJYcbAm92JTgibjEeLupl
 h6n2ljZm0f6x7xxupOSAAnXO/VFg/uDCAUFgnbQjTB6DKTtoigZuhvawSjRJvzymBISg
 Q+DvyrWuhdqYiC6/nG4ji9Vz4qFLtrR0voc34iBmH56kyJ/TCs+xaW1QuQah0msfcG1N
 WxheNstFDAG7KlXo/X6wKnnqeYPk5QCtFjOm2SJE8YjKLo7foITnWOhmbxh0bpDnm2bc
 5z/wNo3ZPjH0xmqEHmeK0cZ2/HDqi6pQrjIsU3ReoQQf/FeIQ2rw1JKTsca0h410A+CZ
 oYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F8KlPsbf1dz0Os1831Kn1fwFPb/5QQ3yaQaEzVh6bSw=;
 b=gyoF2WrP/jaSXBMXIgPmPAS4a0+e+DM7aPXBXWPxFePopFx+i9AAxBmWpBBWTLQ6kO
 7yEiq5NzwUjZ8r7yaoxvIjIxwjdurUgvvA6PszgcUnlUidZPciKu08w6/fwfLTntZQuD
 j6oa9qSZcASJWA8BWcLkpRYTNC4qMK7cst+Cv4WADxq3ZVglZMYp3Du21PTJzYBN1e0I
 8dDGB1qG1pgjG3lbneL8kkl0P5xNrX5rSi8nqkgzkAD3Xz/UgiiJO2nZjfeD4Is/dafr
 AgaN+FGUa6FwfkbXxz841CGsrsc7RyaSNoJu3Z7z+XbPKSRQJsr1X6O18Ls899MmMdws
 a/wQ==
X-Gm-Message-State: AOAM532i4pv/P60s2sz2trPqrl+CKZGnWRO4Xq7LJmYYWgmsMk0bcCpd
 ENiYKmbfggfWXIUgfhmzvhrz01Kzgk02VUXqo2kJ6g==
X-Google-Smtp-Source: ABdhPJyZndVTBaej9OvlCgxA8YB7iDXw17ZCY9Xi4lXKVl31VLq67C0Y7B88MR0NNtlNSLqrlZJrNBBWKuMvkkNzmTE=
X-Received: by 2002:a17:906:1dd3:: with SMTP id v19mr379686ejh.4.1620242879986; 
 Wed, 05 May 2021 12:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 May 2021 20:26:52 +0100
Message-ID: <CAFEAcA8NCczfX=tmBe6E+gaq4089bnWMVhba5GU1cqt7mrxxcg@mail.gmail.com>
Subject: Re: [PULL 00/42] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 3 May 2021 at 23:13, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit 15106f7dc3290ff3254611f265849a314a93eb0e:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-hex-20210502' into staging (2021-05-02 16:23:05 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210504-2
>
> for you to fetch changes up to 7a98eab3a704139020bdad35bfae0356d2a31fa0:
>
>   target/riscv: Fix the RV64H decode comment (2021-05-04 08:03:43 +1000)
>
> ----------------------------------------------------------------
> A large collection of RISC-V fixes, improvements and features
>
>  - Clenaup some left over v1.9 code
>  - Documentation improvements
>  - Support for the shakti_c machine
>  - Internal cleanup of the CSR accesses
>  - Updates to the OpenTitan platform
>  - Support for the virtio-vga
>  - Fix for the saturate subtract in vector extensions
>  - Experimental support for the ePMP spec
>  - A range of other internal code cleanups and bug fixes

This fails building the docs:

Warning, treated as error:
/home/petmay01/linaro/qemu-for-merges/docs/system/riscv/shakti-c.rst:document
isn't included in any toctree

The new board doc file needs to be referenced from the
toctree in docs/system/target-riscv.rst .

thanks
-- PMM

