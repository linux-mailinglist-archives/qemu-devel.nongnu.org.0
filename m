Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5825A5EA4D4
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:54:56 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocmhL-0001Lb-0t
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1ocmSG-0006Jd-Sl
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:39:31 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:39751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhlcindy@gmail.com>)
 id 1ocmSF-0003DN-AA
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 07:39:20 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-11e9a7135easo8822244fac.6
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 04:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=S2KB3y02tOP4q9BohGafizDNNtvW+ZyxBZVu85TjLlk=;
 b=CAJy+Fyc6xMjWqGVTL2R0wV+eC/ajGV2IQo+cQxmEUnSQKHEPuNy2hQhwGSw04WkEv
 e9Ffyx+fahqk+1QFjF01+qB2KN+oZNoCr1KCZfTAOQU0cEiu7NJmiixE+inSaLzDHSQt
 FCYnbsmfW2MQLhZytKtj6i3oYuF2KUnU6YuIxm3lg9ToyjCeJG+Bvdy3d/zHwJSHgqfK
 C7tVmO330UqCi6GMn5pTGE8j45RkBNfM9z7TNm7hPYXxG6Vkh/hjPdCDyU8owtQJIFby
 Uv3Wh3zuLnoAAfeas1mvmUe01Se12RItu/oPhG549Lgmc+zmdkYbW6T8bR4ukQMSCb2P
 2vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=S2KB3y02tOP4q9BohGafizDNNtvW+ZyxBZVu85TjLlk=;
 b=fMI47+EDlgAjX8sGX7k2aoJP2T2zh5+lxJtEBs2kcDa0rxAcyZKni3+NVJNJTcG72A
 F+GWgExsTm4xD/NaZe19tpxhDALdmST8GfOkjKCZdzsNL69Ao5ekwEeStcx5a3n023gA
 SmudenbNcrSmyKP0fORQt0z/J/4hvvJjtaglzvdAsrek7KRHvrpEfHtCfOQLRzppE/Nl
 iIqD1PUqF1y46t1j2gDLmuqYk3FbClWVV3r1nW2Adctmp1GCnKE8lKEx5X+2hI952zXU
 GDuB9csByiGs1zILS94SME/EbFxaYivDprsHiNwtMrWivwI7bHxeH3HAJCOQb8kcDSXl
 lcqg==
X-Gm-Message-State: ACrzQf2yn+Bxt08itcL8YYiRnXufwPpve+WuhXnlicge+eG3fAAeeHd8
 Feb+hrCYDgD08W7m9U2N027MH0oub3F0lqyUSbM=
X-Google-Smtp-Source: AMsMyM4NhHZmOgDhCAVyDWfv/d33yCPVXaLMPiW3tmiSP7FImbQ0qeVZOKicUSrDUk+bwSAlMOYJYKvAz7J909kfguk=
X-Received: by 2002:a05:6870:b39e:b0:10d:8d5d:a9b with SMTP id
 w30-20020a056870b39e00b0010d8d5d0a9bmr17849957oap.144.1664192356990; Mon, 26
 Sep 2022 04:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <mvmczbzty5j.fsf@suse.de>
 <c16ba95c-6a97-92cd-ee01-67f5fd0a65ff@linaro.org>
In-Reply-To: <c16ba95c-6a97-92cd-ee01-67f5fd0a65ff@linaro.org>
From: Li Zhang <zhlcindy@gmail.com>
Date: Mon, 26 Sep 2022 13:39:05 +0200
Message-ID: <CAD8of+obqqP2ifS98FDu0qNUR-1CL2bbJFfp50f9pEkLPzh5Vw@mail.gmail.com>
Subject: Re: qemu-x86_64 runs out of memory
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Andreas Schwab <schwab@suse.de>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=zhlcindy@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I did some investigation and when I mmap 2TB memory, the PageDesc is
allocated with 12GB.
The count of PageDesc is about  0x80000 and the size of PageDesc is 24Bytes.
So memory costs about 12GB.  If the size of PageDesc data is reduced,
the memory should be reduced significantly.

If more and more memory is mapped, and the page table entrieds is very
huge. So it still causes OOM if the host memory is not big enough.


On Tue, Sep 13, 2022 at 12:59 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/13/22 10:35, Andreas Schwab wrote:
> > $ cat mmap.c
> > #include <stdio.h>
> > #include <sys/mman.h>
> >
> > int
> > main (void)
> > {
> >    void *A;
> >    size_t L = 0, U, Max = 0;
> >    for (U = 1; ; U *= 2)
> >      {
> >        A = mmap (0, U, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
> >        if (A == (void *) -1)
> >       break;
> >        else
> >       munmap (A, U);
> >      }
> >    while (L + 1 < U)
> >      {
> >        size_t M = L + (U - L) / 2;
> >        A = mmap (0, M, PROT_NONE, MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
> >        if (A == (void *) -1)
> >       U = M;
> >        else
> >       {
> >         Max = M;
> >         munmap(A, M);
> >         L = M;
> >       }
> >      }
> >    printf ("%zx\n", Max);
> > }
> > $ cc -O2 -g -Wall -std=gnu11 -g     mmap.c   -o mmap
> > $ ./mmap
> > 7f672e5ff000
> > $ qemu-x86_64 ./mmap
> > Killed
> >
>
> I suspect this is the same as
>
>    https://gitlab.com/qemu-project/qemu/-/issues/290
>
> Needs a reorg of memory region tracking for {linux,bsd}-user.
>
>
> r~
>


-- 

Best Regards
-Li

