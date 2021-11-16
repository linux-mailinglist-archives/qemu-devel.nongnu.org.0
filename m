Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D997453177
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:52:44 +0100 (CET)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmx11-0004NI-AK
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:52:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmwzq-0002t6-DV
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:51:30 -0500
Received: from [2a00:1450:4864:20::42f] (port=41936
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmwzp-00035p-41
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:51:30 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a9so10796531wrr.8
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v6+Hyp+G2uU0awe+q8gckiFgYSBqyuoLtTSLwpd3IEI=;
 b=F80WgEV9hOf0ZCDQva+nq/+8EZukATP690bIHc7p+Y3nYegCWpxuaYYRsc87+W9hMZ
 1bqyoDT17y/1Er5NroszbLFCWKTFIZXdONdapiPHub84D9E9YFdSz5GaznwU9Lv+LoSr
 49R8BjQAs4g0XxasqKg29RqHFQrG/woM1ehvTwTAMkHU+to3TNZMjVRPRHPyRpf1pAY+
 rHye96g0u6tSvkrxjo4wy6dg6AzadVBNF6Vj4zpPuAcEg961BIy3sPPDSE20bOFt522I
 KJTXi4QBgcQg6v0EJ9m7ktrhWAXnAM/FCpfnfG6wr2noNfoIjJpSPEacwbsZMkxsX/gc
 pX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v6+Hyp+G2uU0awe+q8gckiFgYSBqyuoLtTSLwpd3IEI=;
 b=qYhpSbobsz7cZqDPY/ONIa/sE1on82Q6Terx84J3JItqFuX/9FQi6npeth9UNFr6rq
 blUWegoLCqG/6MMQy8Deg94gKtcK3ekxl47xlQvnxnqlDkZQB6n1gb9qVdlrbgefskLe
 33mAIFuY8GgQqAhCKIuZwyuAdPh4PWLd+ML3HiP9RNnyKMopPLZ1YRQGuWSbYW58ycpi
 v4hoo1Fddcz61xtjYc+6CYQSEhHHnM8FqvzqA1nY0xK6LhLBb2ZmQGCMjHQAw1Y5mICJ
 QWA7fGPD9gdMEMnk8FKYGADNFXk0+fERA8/nEiizEyVjXXOXLCuGdXwQPY/RfgQ3H+Wp
 /JQQ==
X-Gm-Message-State: AOAM530NgvZm6fla0xGfVfnkpDF5DX3OGKhuwPnBtSnH26DoBbFpzapb
 xCHVPb8bvHi3Zdn6+vDdjCGhMK9rwvJIeUXejwTx7Q==
X-Google-Smtp-Source: ABdhPJxuvmdVBh9rfJTvavXe6whEZr7iJdmk2EfBbZvqlGO/k51FYhhcAe94a9NMFgp4XhOL/dfFeQb/F78KnG5S1w4=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr8660616wrs.263.1637063487765; 
 Tue, 16 Nov 2021 03:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20211116093834.76615-1-pbonzini@redhat.com>
In-Reply-To: <20211116093834.76615-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Nov 2021 11:51:16 +0000
Message-ID: <CAFEAcA8=RsA37ErttuGKKfrb8Ooy9NJs=F4o4agQbgu=On9P5w@mail.gmail.com>
Subject: Re: [PATCH] meson: fix botched compile check conversions
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Nov 2021 at 09:38, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Fix a bunch of incorrect conversions from configure to Meson, which result
> in different outcomes with --extra-cflags=-Werror.

FWIW this still won't give the right answer for the 'struct iovec'
test if you include -Werror via --extra-cflags, because the
generated code trips over an "expression result unused" warning:


Running compile:
Working directory:
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpeiz36t2n
Command line:  clang-7 -m64 -mcx16
/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpeiz36t2n/testfile.c
-o /mnt/nvmedis
k/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpeiz36t2n/output.obj
-c -fsanitize=undefined -fno-sanitize=shift-base -Werror -D_FI
LE_OFFSET_BITS=64 -O0 -Werror=implicit-function-declaration
-Werror=unknown-warning-option -Werror=unused-command-line-argument
-Werror=ignored-op
timization-argument -std=gnu11

Code:
 #include <sys/uio.h>
        void bar(void) {
            sizeof(struct iovec);
        };
Compiler stdout:

Compiler stderr:
 /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/meson-private/tmpeiz36t2n/testfile.c:3:13:
error: expression result unused [-Werror,-Wunused-value]
            sizeof(struct iovec);
            ^~~~~~~~~~~~~~~~~~~~
1 error generated.

Checking for type "struct iovec" : NO


But maybe we should just explicitly reject -Werror in --extra-cflags...

-- PMM

