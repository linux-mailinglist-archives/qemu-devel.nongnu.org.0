Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9996B590E06
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 11:28:05 +0200 (CEST)
Received: from localhost ([::1]:58600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMQxY-0003Ty-Qa
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 05:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMQvh-00024f-4h
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 05:26:09 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:40704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMQvf-0005hC-HD
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 05:26:08 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-324ec5a9e97so4503067b3.7
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 02:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=JiQM/TVvq7gIOXd+ik/4Sp+rHwPd1vHDw41KWuB5cBU=;
 b=MYucwdMgwjiDONh6lNH5p2lZ+fiDv274tSHE5xMSV6K1Y+PvJC4Peguik9xdoSC2K4
 RbO4Uxqmk4EkXEizAl8goNz6Fz9aJIm5X5Lihskbfp2MnR2IydOvZamjxza3wCRPNffF
 EQx4bjkFqUwCW/6lVx1cWNfLlKERWNrlI/wEDZASMaJMNU6RrIxzqhkE5rLK8H5ghJuO
 40ka+7dKMGBg5ZlFqeq2tkdJ+V+WOc8qpFR9bl4GgGbVkxoIWLgzY3h2xDd6e9H32FQR
 b1qKG8ClM+S44Vjsra3jmeXhG0YcaodBx2eTogZPlJKNoFZsUxkjhm6np2y3nZT5om+b
 OSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=JiQM/TVvq7gIOXd+ik/4Sp+rHwPd1vHDw41KWuB5cBU=;
 b=Vj5BB5d/2pzXLgUZvUsijgVijIryHvUwRHlJcpDbWRLQ8o0pmyw4tSyzU+IfloZkJr
 XSio1H1XZe8xH6FFnsX1xTo620VQe1r8qNB4Aa/ykU5QVUd2xzzxxTWRDaLVgK+lhHts
 vr6PoSdqYDBSVhjWSavnU6YenaElUY0DSL6NhMNlsVd0jupyuGIcfmznEfwJE3Nb/Y8l
 n9LOzAHCxAnDBjjf1JQRAt/+FwAetBR4dG13fSwc51oMYy9VQw8fysdeRecVQ/LhM5wh
 IfdEwxSINf+blBzhxsnBhAlGpPuEdzRBGzsHc/A6bZfvg0hU3+lwyUfLvGsR1bivbFHp
 z6bA==
X-Gm-Message-State: ACgBeo2A/K+EpmSqL/9PUWinMo3UhzxWiaCrh387rmG5kwEQ/xAViJVV
 Nn5XTonsX6J7sLLCbp+FpSdnaM8veKbN1HDFirz+Aw==
X-Google-Smtp-Source: AA6agR7Rq0Dir1xYaUY2zni7bfgPxFxfd4P0Cg7Sq+8A6p6J+U50X4kbNCpKrATD0h0DZebIRPcegK52wROOB86oXhc=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr3112172ywf.455.1660296366452; Fri, 12
 Aug 2022 02:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220812021427.cwenhciuftgtaj64@altlinux.org>
 <20220812084529.ur5qcyws5qvoyvuc@altlinux.org>
In-Reply-To: <20220812084529.ur5qcyws5qvoyvuc@altlinux.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2022 10:25:55 +0100
Message-ID: <CAFEAcA9BuSe4SwpoWTALURaxoj-8U2y83k=und7oKrZBggLarQ@mail.gmail.com>
Subject: Re: qemu-system-aarch64: Failed to retrieve host CPU features
To: Vitaly Chikunov <vt@altlinux.org>
Cc: qemu-arm@nongnu.org, "Dmitry V. Levin" <ldv@altlinux.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, kvmarm <kvmarm@lists.cs.columbia.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I've added some more relevant mailing lists to the cc.

On Fri, 12 Aug 2022 at 09:45, Vitaly Chikunov <vt@altlinux.org> wrote:
> On Fri, Aug 12, 2022 at 05:14:27AM +0300, Vitaly Chikunov wrote:
> > I noticed that we starting to get many errors like this:
> >
> >   qemu-system-aarch64: Failed to retrieve host CPU features
> >
> > Where many is 1-2% per run, depends on host, host is Kunpeng-920, and
> > Linux kernel is v5.15.59, but it started to appear months before that.
> >
> > strace shows in erroneous case:
> >
> >   1152244 ioctl(9, KVM_CREATE_VM, 0x30)   =3D -1 EINTR (Interrupted sys=
tem call)
> >
> > And I see in target/arm/kvm.c:kvm_arm_create_scratch_host_vcpu:
> >
> >     vmfd =3D ioctl(kvmfd, KVM_CREATE_VM, max_vm_pa_size);
> >     if (vmfd < 0) {
> >         goto err;
> >     }
> >
> > Maybe it should restart ioctl on EINTR?
> >
> > I don't see EINTR documented in ioctl(2) nor in Linux'
> > Documentation/virt/kvm/api.rst for KVM_CREATE_VM, but for KVM_RUN it
> > says "an unmasked signal is pending".
>
> I am suggested that almost any blocking syscall could return EINTR, so I
> checked the strace log and it does not show evidence of arriving a signal=
,
> the log ends like this:
>
>   1152244 openat(AT_FDCWD, "/dev/kvm", O_RDWR|O_CLOEXEC) =3D 9
>   1152244 ioctl(9, KVM_CHECK_EXTENSION, KVM_CAP_ARM_VM_IPA_SIZE) =3D 48
>   1152244 ioctl(9, KVM_CREATE_VM, 0x30)   =3D -1 EINTR (Interrupted syste=
m call)
>   1152244 close(9)                        =3D 0
>   1152244 newfstatat(2, "", {st_dev=3Dmakedev(0, 0xd), st_ino=3D57869925,=
 st_mode=3DS_IFIFO|0600, st_nlink=3D1, st_uid=3D517, st_gid=3D517, st_blksi=
ze=3D4096, st_blocks=3D0, st_size=3D0, st_atime=3D1660268019 /* 2022-08-12T=
01:33:39.850436293+0000 */, st_atime_nsec=3D850436293, st_mtime=3D166026801=
9 /* 2022-08-12T01:33:39.850436293+0000 */, st_mtime_nsec=3D850436293, st_c=
time=3D1660268019 /* 2022-08-12T01:33:39.850436293+0000 */, st_ctime_nsec=
=3D850436293}, AT_EMPTY_PATH) =3D 0
>   1152244 write(2, "qemu-system-aarch64: Failed to r"..., 58) =3D 58
>   1152244 exit_group(1)                   =3D ?
>   1152245 <... clock_nanosleep resumed> <unfinished ...>) =3D ?
>   1152245 +++ exited with 1 +++
>   1152244 +++ exited with 1 +++

KVM folks: should we expect that KVM_CREATE_VM might fail EINTR
and need retrying?

(I suspect the answer is "yes", given we do this in the generic
code in kvm-all.c.)

thanks
-- PMM

