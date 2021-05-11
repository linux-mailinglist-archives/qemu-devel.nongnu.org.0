Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2C37A64B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 14:05:21 +0200 (CEST)
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgR8a-0006pQ-5Z
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 08:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgR6o-00061e-1o
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:03:31 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:42877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgR6i-0000eL-4V
 for qemu-devel@nongnu.org; Tue, 11 May 2021 08:03:29 -0400
Received: by mail-ed1-x52d.google.com with SMTP id j26so18872648edf.9
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GQmyny8/n9ozpm8acuDMVLfNp3Keou3jz9R6sSkbMZM=;
 b=VHRuHNsJuejEXYTBDs0SX+t+rMo68TbUbbU6xzltUxt7FJS5GU3FQZpaWCgHTWSAbI
 SezNRrjVBgyn7MIERoIcbuht1eiySRHIchf5VgIAO8BnNQSmZJyeAJFMhdBZ4iyQVn9G
 09l2xioIRx1FcloK6Htlo+hLFTwISIWq3ewpCQSadS7bH4nanI0SAbSZ+PMV4sCo6wZA
 w1A/G+ktgHYU8qmUZxvr1f4Ddyge+2b8+Gz9xrazS6Aluo/H+7M1hIACS8ACQvjmpJP3
 40jV6L5sCPuQQ3gxk2xXs5M3rousIzCNJQwhL8F/ZTJjUHb4mOTcWs19tBZfHeHECbN0
 OouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GQmyny8/n9ozpm8acuDMVLfNp3Keou3jz9R6sSkbMZM=;
 b=qycA1SxNKL5kGCsrejMSEC07I1KV3dbTzLnKb/xkQra6/ztH96NBOZfdCzLTOGDYw/
 kbYis8fqrkjmjjJujwUzuzONi0e7WSsMLCR9V4Qz6RlX4D8DhQU4Jz5gKgtG+l3M34su
 XxGJIDJ6QMMbhFdMVUNYkxOQH+djDXsl6BSRE3nYVEiYGVl198oWdYUU5xNrf9fN35JG
 K7JC1r0d9NcUI6c+kfvZG6227+Tvj4pu/S1wE0TzS9kRIzfhogY/L/P1KzNEMdi2VroQ
 210DsbLadNBB6oTAIwn4I00pbKnCsSWorMGb6x+MasycCbCHdYz0Xub+ywe/34B+hYJY
 MNzQ==
X-Gm-Message-State: AOAM530j/cIvFK8fID5OO8oGjAcuTtpV/i0ZWI+Xl9Bh93r0rGrv7TXh
 /xedEnWaPAK1azPZXTCXfzNfDgMKSqJC1LyqKx4HVg==
X-Google-Smtp-Source: ABdhPJwIZtziJ4qvo4z/2/G12JYdWejYJZzISD3G4CxrQgL4Apm4feIbD/EI99tD0gK+ofj/BUYzULIjSqmnzk6ecBc=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr35488132edt.36.1620734601117; 
 Tue, 11 May 2021 05:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210506154423.459930-1-cohuck@redhat.com>
In-Reply-To: <20210506154423.459930-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 13:02:08 +0100
Message-ID: <CAFEAcA-KKTOjFxZAg5xz17SoqncGS+VwPrBevp+ShEH-0OyKAw@mail.gmail.com>
Subject: Re: [PULL 0/7] s390x update
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 May 2021 at 16:44, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit d45a5270d075ea589f0b0ddcf963a5fea1f500=
ac:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6=
.1-pull-request' into staging (2021-05-05 13:52:00 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210506
>
> for you to fetch changes up to 2337ca0dd1747851cf596e90a2360578e3f9a473:
>
>   vfio-ccw: Attempt to clean up all IRQs on error (2021-05-06 13:49:07 +0=
200)
>
> ----------------------------------------------------------------
> s390x fixes and cleanups; also related fixes in xtensa and arm
>
> ----------------------------------------------------------------
>
> Eric Farman (2):
>   vfio-ccw: Permit missing IRQs
>   vfio-ccw: Attempt to clean up all IRQs on error
>
> Ilya Leoshkevich (4):
>   target/s390x: Fix translation exception on illegal instruction
>   target/arm: Make sure that commpage's tb->size !=3D 0
>   target/xtensa: Make sure that tb->size !=3D 0
>   accel/tcg: Assert that tb->size !=3D 0 after translation
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   hw/s390x/ccw: Register qbus type in abstract TYPE_CCW_DEVICE parent

This asserts running x86-64 linux-user:

/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/x86_64-linux-u=
ser/qemu-x86_64
-L ./gnemul/qemu-x86_64 x86_64/ls -l dummyfile
qemu-x86_64: ../../accel/tcg/translate-all.c:1915: tb_gen_code:
Assertion `tb->size !=3D 0' failed.
qemu-x86_64: ../../accel/tcg/cpu-exec.c:766: cpu_exec: Assertion
`!have_mmap_lock()' failed.
Makefile:6: recipe for target 'test' failed

This is for the TARGET_VSYSCALL_PAGE case in i386_tr_translate_insn(),
which generates a zero-size TB.

thanks
-- PMM

