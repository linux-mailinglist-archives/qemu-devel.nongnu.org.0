Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60079249ACE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 12:48:34 +0200 (CEST)
Received: from localhost ([::1]:53350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Ldx-00055c-EA
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 06:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8Lcz-0004Gb-NE
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 06:47:33 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8Lcx-0003Zu-Sj
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 06:47:33 -0400
Received: by mail-ej1-x635.google.com with SMTP id f24so25757172ejx.6
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 03:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hHdYPjyTEnpybk6GLJWT42v7HOUyuHY9sHHJQ0vruQM=;
 b=FqGhDWvwvHbHI3W9ROm3/Y9I6/MxaatJoRvhhzW43HFV0rDTl3LWp7uxKkAu4JbK8r
 D7RreGPG4WAn/EwtGQSF7eL6YCYOAtJHvgHWg2evL2QnP9UYWvf7e1xfw/Ae5nIVtKk2
 RWkxicT9c/55eD+dBJzy6xExFQaop7VLB2nnN4DQih6u/c3Cf2IGS7t3k0xMxnQTBoS0
 foFdzEVNNctzv3wOYnXmaLlMM6ioBL27jmEzLfQivUaZFkpHqLVGqOslDvY9LeTJP4VD
 xWrrDmmFQPKU0cnVxikhuhcuI2c+t+iEJ3qKWShib5vmy3ldG/o4zWOzADhc4IYPQlih
 wjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hHdYPjyTEnpybk6GLJWT42v7HOUyuHY9sHHJQ0vruQM=;
 b=RqlRbW8EgAx6aPsngp+G9S0vjuSUfhVfVXYaJ1fkdH6V2qO7rGy8hOwMW6NHT2ps4J
 IaNW6daloywvxDAtyA0CuZGOMrPkJbEP/aSWOIcLGbNqPE/X/nBY7mKsXnREBdyVkFJV
 8DPY0QxOJ+7jkANKcXMQ14NmHTuMEu8CBGzLflK2ydobbSP46MLVYkK1y4qnBAShB0Bh
 mOJOoOm6B+g2ia1Puc79WIjPHNmeqNUpGkejAQLdft+XEtson0IcUgrBYn888oaC1JDJ
 MbRmGZtr+RvdkS72Jj9V4QL3ZTQEhvUGom5hzK9XbjbI2vUXlxScWhKuss2XeiZJX5e9
 zJ9Q==
X-Gm-Message-State: AOAM53258UOcapRn15FfOnPOib3z8RQtewsNF0HuxkEa7xq8fuqlU80b
 vOGdZFdNhduPqs9EoJPmzZ29t68Es9QD1URnpVzGhQ==
X-Google-Smtp-Source: ABdhPJyYE/r4sdFK6ViGlDAcJPc4U/9zXoYCdbw/qlYYMf2dKKcXOGz/CRgl9hftBKqfYzHzEugVqO6USGJA6XK2bQ0=
X-Received: by 2002:a17:906:b248:: with SMTP id
 ce8mr3530713ejb.85.1597834050075; 
 Wed, 19 Aug 2020 03:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200819094715.8234-1-pbonzini@redhat.com>
In-Reply-To: <20200819094715.8234-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Aug 2020 11:47:18 +0100
Message-ID: <CAFEAcA_5_0zFaGK7==9U8rJE2qZoqBxdaxnMYxK3jHZntnNJAg@mail.gmail.com>
Subject: Re: [PULL v4 000/150] Meson-based build system
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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

On Wed, 19 Aug 2020 at 10:49, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit d0ed6a69d399ae193959225cdeaa9382746c91cc:
>
>   Update version for v5.1.0 release (2020-08-11 17:07:03 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to ab7ac9b093f9d6d7878028b87ad68f70c923e180:
>
>   docs: convert build system documentation to rST (2020-08-19 05:22:55 -0400)
>
> v3->v4: fixed aarch32 and MXE builds
>
> The MXE failure seems to be compounded by a Make bug, that causes it not
> to obey private target-specific variables.  Fortunately it can be avoided
> easily, in fact while simplifying a tiny bit the ninja2make converter.
>
> I do wish this was found earlier than last minute, at the same time it's
> an easy fix and the fixed version rules has really trivial rules; thus,
> it follows even more the principle that one should never need to look
> at Makefile.ninja.  If this alternative implementation had come to my
> mind, I would definitely have chosen it from the beginning.

Hi; this fails to link in the clang sanitizer build;
configure rune:
'../../configure' '--skip-meson' '--skip-meson' '--cc=clang'
'--cxx=clang++' '--enable-gtk' '--extra-cflags=-fsanitize=undefined
-fno-sanitize=shift-base -Werror' "$@"

(Side note: where have those two --skip-meson arguments come from?
I never passed them to configure.)

Link failures look like
Linking target qemu-alpha
libcommon.fa.p/disas_alpha.c.o: In function `extract_za':
/home/petmay01/linaro/qemu-for-merges/build/clang/../../disas/alpha.c:483:
undefined reference to `__ubsan_handle_type_mismatch_v1'
libcommon.fa.p/disas_alpha.c.o: In function `extract_zb':
/home/petmay01/linaro/qemu-for-merges/build/clang/../../disas/alpha.c:498:
undefined reference to `__ubsan_handle_type_mismatch_v1'
libcommon.fa.p/disas_alpha.c.o: In function `extract_zc':
/home/petmay01/linaro/qemu-for-merges/build/clang/../../disas/alpha.c:513:
undefined reference to `__ubsan_handle_type_mismatch_v1'
libcommon.fa.p/disas_alpha.c.o: In function `extract_rba':
/home/petmay01/linaro/qemu-for-merges/build/clang/../../disas/alpha.c:446:
undefined reference to `__ubsan_handle_type_mismatch_v1'
libcommon.fa.p/disas_alpha.c.o: In function `extract_rca':
/home/petmay01/linaro/qemu-for-merges/build/clang/../../disas/alpha.c:465:
undefined reference to `__ubsan_handle_type_mismatch_v1'
libcommon.fa.p/disas_alpha.c.o:/home/petmay01/linaro/qemu-for-merges/build/clang/../../disas/alpha.c:524:
more undefined references to `__ubsan_handle_type_mismatch_v1' follow

Other links fail for the same error but for disas/i386.c or
disas/cris.c.

thanks
-- PMM

