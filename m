Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6463D2B2F
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:33:10 +0200 (CEST)
Received: from localhost ([::1]:47366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cZI-0006mx-RD
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cY6-0005zE-GQ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:31:55 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:42616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cY4-00052M-MP
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:31:54 -0400
Received: by mail-ed1-x534.google.com with SMTP id k27so7759880edk.9
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x+BN9R07TILrSo9ZPB4lr1CPn/V8Nj0IBqmeovfF26A=;
 b=YWX7h/WSr7uT+UMgIiROno1iQ9GIe5XRnojoCwW8rPcQ0sdT4QsRIdmUzAwer/mvg2
 ehdzsRVPkG3Zm6O80VOrZheiESuibMRdmBivuwizWwIOIp4i7ky2/CpkKhWaS3VDsdia
 Jp0yOj4iIbtztCFHrme9crh8vr6JnHXe9amIWW9JWKhmo6F/7VQCRyANI8waB8UYi/qN
 kB0KRNjh4R4URH5W9gqmyL3jPqJavXUg7coNTJ41xkxZErIyWpVxot1UX3SeKLTM4G6N
 BYtA1Pl3we/C27IxKsIM39o0ms2ne/X+NmzKc7mR/+ijoZy3Dip1Suoi8VXBwzocBXO2
 8Xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x+BN9R07TILrSo9ZPB4lr1CPn/V8Nj0IBqmeovfF26A=;
 b=s1Gv7mL7Q4Dq3ToRLYexwb8Z+hekhlaQjxWZGw4qSjJXudpDCZV0W283v7sBHpQDmS
 aWVBbmQayeMJerj0jmWnBCobua1761ELe/F80h1dcZvDFR9jZ2bYRP2wMFpLT6U32sIa
 LEzbWLOUl3Dlw7f96aMxG75ysn7sXOhwpeQfAB7XHSg8eIlOX9SuRkWmH3rq4SPDtKmw
 2m2KSMKP/3V2K6styBT3yPH4m0KK8yJTu/8tmHGsNnrFALcTUOk/mZ1Mp8V367ybMXvU
 fj7jtQsQ8KGcGVJv32f2NBv7rqonPBLfyPrV52Xwnws8BzlagWw14o06Gix7yaTOG7bS
 qRqg==
X-Gm-Message-State: AOAM532qxAVik7oQyvnMq1caUdiOHQSe1iyhnSKmRxvW9ZhoG2hPYBOj
 tF2CRjlGT3wIOQTVf7tnRg55nuEbSKRHMsJ3HISdfg==
X-Google-Smtp-Source: ABdhPJyO8G69eea5318GLt7kdEU6NSMVb0WMrsMhUklNF22hgsgJWI67lKGaYQkdH3E85f1gDgWl8czr0XVHTG5TSO4=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr901864edq.146.1626975111080;
 Thu, 22 Jul 2021 10:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <1626902375-7002-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1626902375-7002-1-git-send-email-tsimpson@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jul 2021 18:31:09 +0100
Message-ID: <CAFEAcA9y4THJBm8QM8F5a7ttDzvJQgS+Wp+Bhp3zCZTqVaJvNA@mail.gmail.com>
Subject: Re: [PULL 0/3] SIGSEGV fixes
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Jul 2021 at 22:19, Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> The following changes since commit 7457b407edd6e8555e4b46488aab2f13959fccf8:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-07-19' into staging (2021-07-19 11:34:08 +0100)
>
> are available in the git repository at:
>
>   https://github.com/quic/qemu tags/pull-hex-20210721
>
> for you to fetch changes up to 953ea3e4b426ee0c8349343c53e3358cfec720f2:
>
>   linux-test (tests/tcg/multiarch/linux-test.c) add check (2021-07-21 15:54:28 -0500)
>
> ----------------------------------------------------------------
> The Hexagon target was silently failing the SIGSEGV test because
> the signal handler was not called.
>
> Patch 1/3 fixes the Hexagon target
> Patch 2/3 drops include qemu.h from target/hexagon/op_helper.c
> Patch 3/3 adds a check that the signal handler is called
>
> ----------------------------------------------------------------

Hi; the check added in patch 2 seems to fire about 50% of the
time for qemu-riscv64, causing 'make check-tcg' to fail.

$ ./qemu-riscv64 ./tests/tcg/riscv64-linux-user/linux-test
$ ./qemu-riscv64 ./tests/tcg/riscv64-linux-user/linux-test
$ ./qemu-riscv64 ./tests/tcg/riscv64-linux-user/linux-test
$ ./qemu-riscv64 ./tests/tcg/riscv64-linux-user/linux-test
/mnt/nvmedisk/linaro/qemu-for-merges/tests/tcg/multiarch/linux-test.c:500:
SIGSEGV handler not called
$ ./qemu-riscv64 ./tests/tcg/riscv64-linux-user/linux-test
$ ./qemu-riscv64 ./tests/tcg/riscv64-linux-user/linux-test
/mnt/nvmedisk/linaro/qemu-for-merges/tests/tcg/multiarch/linux-test.c:500:
SIGSEGV handler not called
$ ./qemu-riscv64 ./tests/tcg/riscv64-linux-user/linux-test
/mnt/nvmedisk/linaro/qemu-for-merges/tests/tcg/multiarch/linux-test.c:500:
SIGSEGV handler not called


thanks
-- PMM

