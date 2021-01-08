Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7178B2EF7D1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 20:02:52 +0100 (CET)
Received: from localhost ([::1]:40848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxx2B-0006cx-HW
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 14:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1kxx0F-0005c1-CF
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:00:51 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ndesaulniers@google.com>)
 id 1kxx0A-00043M-8Z
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 14:00:51 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l23so6695737pjg.1
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 11:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/TIuQ/Dc6oV5cFFdg8BY3A+MTZC9D+x9g/kzjwn+7Ic=;
 b=aYxbB0pjmQh7CSGuwukE//izOSoLYCOHYVZrJMT5bkQ3+NDf7i4Yt/E8k4Gyj2jSh2
 AwI8hgcJqiCIQ1ENZxMJQKXyZ40Mqh+Ko9mdM4u9bElTdZiAGQlCSF48UT+07reGaBFn
 DPmkBN55iBl609l+7sSgJtpKnvtGHU/L3L8rbzQj2OWfikJPHcEeA3SxKR8jlXm2VMFQ
 d6HW2Yq5d7hwJ0zXFksCkp3CshM2TXeCs61IowUlZ8yCx2MBFOC2/RWlPQbo33deuL2M
 9t84gTL11OwcKhSSB17hmYs/y3eUP2Q+N40EW4HBfBENr0jeKpCNhLFA25EoBdopPs04
 eL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/TIuQ/Dc6oV5cFFdg8BY3A+MTZC9D+x9g/kzjwn+7Ic=;
 b=UWNBy6QPXZeW7XxrAn0bfGBUe8vNaQRk1CCiCORjf6xhrAVwZ+Gg1BXGHs7m+6BhZI
 0C2XTb1Kc7WoEubSQhRB7AyJIJt9XRooSPAO9neJbgyZ8CjloU0PzeCDgRPNmjltfDU1
 FvYjryWYHZBAA2veOhf3ExmBPH8BFqn9goW1HMvz5ioBjxJX88AEarojKq7HG5vB5jdp
 UFH2rXZ5eCG+RSXtrFbThx5sP0r0vHGNEg8CQN9hYBKlcLK+rbpMusOvH1SzGhYff8aN
 s9MvM//tI+gP31vgx8qaNhJDxstz+WykNEH/FfWmZ5H4CGOIpEsnBS4TsGwIy7i5Cr0s
 0qwg==
X-Gm-Message-State: AOAM5307C47iBqeZAizLv8S0gBu8WAbdJy8xtVQM9o5VK6A8bA2Rbku4
 BQU93OZqneQSmQ/SAChJSm6xSYKhg2EIBkdu5wqUPQ==
X-Google-Smtp-Source: ABdhPJwEnF6pguQLTt+57QzO1mI0RjrqhUhwReTX46j05pHmmBziCIU5ImqNZe+PRiyJXtg52yt8oaTDNlXFDq+o/mk=
X-Received: by 2002:a17:90a:6ba4:: with SMTP id
 w33mr5313216pjj.32.1610132443201; 
 Fri, 08 Jan 2021 11:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20210108132049.8501-1-david@redhat.com>
In-Reply-To: <20210108132049.8501-1-david@redhat.com>
Date: Fri, 8 Jan 2021 11:00:32 -0800
Message-ID: <CAKwvOdnMNRDhuAo78Hg4vAvbZF0jXY1=UaKX8F1oe0pTpjYD6A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] s390x/tcg: fix booting Linux kernels compiled with
 clang-11 and clang-12
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ndesaulniers@google.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -179
X-Spam_score: -18.0
X-Spam_bar: ------------------
X-Spam_report: (-18.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Heiko Carstens <hca@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Nick Desaulniers <ndesaulniers@google.com>
From: Nick Desaulniers via <qemu-devel@nongnu.org>

On Fri, Jan 8, 2021 at 5:21 AM David Hildenbrand <david@redhat.com> wrote:
>
> This series fixes booting current upstream Linux kernel compiled by
> clang-11 and clang-12 under TCG.
>
> Decided to pull in already separatly sent patches. The last patch is
> not required to fix the boot issues, but related to patch #3.
>
> Latest version of the patches available at:
> git@github.com:davidhildenbrand/qemu.git clang

Hey looks like we're off to the races!

$ qemu/build/qemu-system-s390x -M s390-ccw-virtio -display none
-initrd /android1/boot-utils/images/s390/rootfs.cpio -kernel
/android0/linux-next/arch/s390/boot/bzImage -m 512m -nodefaults
-serial mon:stdio
...
[    0.365077] Linux version 5.11.0-rc2-01914-g16586f130181-dirty
(ndesaulniers@ndesaulniers1.mtv.corp.google.com) (Nick Desaulniers
clang version 12.0.0 (git@github.com:llvm/llvm-project.git
e75fec2b238f0e26cfb7645f2208baebe3440d41), GNU ld (GNU Binutils for
Debian) 2.35.1) #76 SMP Thu Jan 7 17:51:34 PST 2021
...
/ # cat /proc/version
Linux version 5.11.0-rc2-01914-g16586f130181-dirty
(ndesaulniers@ndesaulniers1.mtv.corp.google.com) (Nick Desaulniers
clang version 12.0.0 (git@github.com:llvm/llvm-project.git
e75fec2b238f0e26cfb7645f2208baebe3440d41), GNU ld (GNU Binutils for
Debian) 2.35.1) #76 SMP Thu Jan 7 17:51:34 PST 2021
/ # uname -a
Linux (none) 5.11.0-rc2-01914-g16586f130181-dirty #76 SMP Thu Jan 7
17:51:34 PST 2021 s390x GNU/Linux

For the series:
Tested-by: Nick Desaulniers <ndesaulniers@google.com>


>
> v1 -> v2:
> - Add 's390x/tcg: Don't ignore content in r0 when not specified via "b" or
>   "x"'
> - Add 's390x/tcg: Ignore register content if b1/b2 is zero when handling
>   EXEUTE'
> - "s390x/tcg: Fix ALGSI"
> -- Fixup subject
> - "s390x/tcg: Fix RISBHG"
> -- Rephrase description, stating that it fixes clang-11
>
> David Hildenbrand (4):
>   s390x/tcg: Fix ALGSI
>   s390x/tcg: Fix RISBHG
>   s390x/tcg: Only ignore content in r0 when specified via "b" or "x"
>   s390x/tcg: Ignore register content if b1/b2 is zero when handling
>     EXECUTE
>
>  target/s390x/insn-data.def | 10 +++++-----
>  target/s390x/mem_helper.c  |  4 ++--
>  target/s390x/translate.c   | 33 +++++++++++++++++----------------
>  3 files changed, 24 insertions(+), 23 deletions(-)
>
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers

