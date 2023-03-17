Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AF06BEA6C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 14:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAOu-0005bO-Af; Fri, 17 Mar 2023 09:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdAOn-0005aC-Bi
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:45:41 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdAOl-0003rx-6R
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 09:45:36 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so9161056pjt.2
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 06:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679060733;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=379AJYrTBR8gEznspe76YSpNF0pj//JFRSJFUNhXJbI=;
 b=glv9aoe61YCl4taKs1ZeEa2cX7Jnf9uCabfnXIkLRB1FtKrU253KzvqmTfAeYXtdsM
 b19GHDfMdYoRl1B7uKT85vO251dtpOtJw7n6ljK4Y5D8M4BElZdw5JPmWvrweAxyoCEL
 AkEmqOhsUN9oGI3kiso2GSzLbRfLzPsJbKNfHSI6xx214TL5pUgGXQU+WeMtN37vd1ol
 R/CZvfDTQdWw0W7gGnzQ+93pHCFop8OzYn+IsVvY3kHkQNR9DaxifplCAUKTPTDBc617
 bBObfY+2vvScivsTIiylh59RkWX+M/8BNyRokooW92WQCkTHjSEJBfkZ74hrbvcQzhIl
 UnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679060733;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=379AJYrTBR8gEznspe76YSpNF0pj//JFRSJFUNhXJbI=;
 b=m6JvwxuFrblkfK4EILO2qkqMzqt6bKSlJuZR3Kuzpz0gBHvhLOsVrpzBQriVDZy8ul
 XsaKQBZop2SP6ghbl2TN2cun7v7K0Y5no3WbKHyhhnjmHah43vI/dnas8DcZptnujHPz
 CDrB0hBAxfO4Hns3RHKoD0O0zPFNpMEZBMYxCu5rZL1u16KBvUOzzDn76Y4/5cys94Bi
 tgLGJytr++dVj0Ye2j8NAZUbs91PHekl0YFusv+J313ysdBh1Jq9E/i0hQzHsPZVfUzu
 D+/r4fslMQ5Yok2TIZR/kaQDcvdB5UB/DUE8xfB7tsOP4zVoi9cyORk28NzKYEztMpDR
 x5tw==
X-Gm-Message-State: AO0yUKWw0XCSiNuTqJlk10hnnBmn2Fxm98lOo3+50BkinAGUv7dSJB0S
 0ZonCcU0SRmSTpUCJveMnjqF4EeRffLqYIfuc/1/lg==
X-Google-Smtp-Source: AK7set+gUcrg+v2wZ1h/yc8JF+CX9sWC0TGR4ufsPrJA2Bkfzra9i8X6RA6tMt38xnxRiyri1GKT2XVTNfUDnyxS+LQ=
X-Received: by 2002:a17:902:d490:b0:19f:36ab:c2a with SMTP id
 c16-20020a170902d49000b0019f36ab0c2amr3061279plg.9.1679060733008; Fri, 17 Mar
 2023 06:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230222211246.883679-1-viktor@daynix.com>
 <386021678985334@izsosstglkfltgsl.vla.yp-c.yandex.net>
In-Reply-To: <386021678985334@izsosstglkfltgsl.vla.yp-c.yandex.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 13:45:21 +0000
Message-ID: <CAFEAcA-W+ooYQSDiQ1xJepFdCmoe9OXKKfzxMjbX67XTpTPzPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] contrib/elf2dmp: Windows Server 2022 support
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: pbonzini@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com, 
 viktor@daynix.com, annie.li@oracle.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 16 Mar 2023 at 16:48, Viktor Prutyanov
<viktor.prutyanov@phystech.edu> wrote:
>
>
>
> > Hi,
> >
> > For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of
> > Windows Server 2022 guest. This patch series fixes it.
> >
> > v1: improve code-style fix
> > v2: don't remove data directory entry RVA print and DOS header size check
> >
> > Viktor Prutyanov (3):
> > contrib/elf2dmp: fix code style
> > contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
> > contrib/elf2dmp: add PE name check and Windows Server 2022 support
> >
> > contrib/elf2dmp/addrspace.c | 1 +
> > contrib/elf2dmp/main.c | 108 ++++++++++++++++++++++-----------
> > contrib/elf2dmp/pe.h | 115 ++++++++++++++++++++----------------
> > 3 files changed, 140 insertions(+), 84 deletions(-)
> >
> > --
> > 2.35.1
>
> Hi Peter,
>
> As we discussed, I would like to ask you to pick up this series.

Sure, I can put this into the target-arm pullreq I'm doing,
unless anybody prefers them to go into the tree via a
different route.

thanks
-- PMM

