Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560AF570486
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:42:13 +0200 (CEST)
Received: from localhost ([::1]:55598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtfw-00059c-09
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAteB-0003RP-1Z
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:40:27 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:35402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oAte6-00051d-Uk
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:40:21 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31cac89d8d6so49280617b3.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J8+lreWmMpb/Gxpom1GmVEtnuVBLWaJoJSxRJlnCM7g=;
 b=sNBVCv8KeGMOHXZ6+wr1bzjVTHlBsQkjX8nYTQ2+ak3e8MEvrorYuuSNBL67EY7giK
 RjJ2Mc0I1ex6+wL91BvbMgsjkckC12Xtu5wrhNxbGKGj2fGDGaCHsTPSChCmBjYVMhSd
 LqDolxIlEigyjuAvH7jxwcgBTYopreKTt42S4Mq1cWtDxfwmPDBingY+wlUYKPR5nAiQ
 7+yEM9XsrE7wdPayL0isD03rKNI3Txj9uj4gvx2OISs1M81/jsmaPyxQsdhHq/bQPOik
 f9HEGKgNZ658V2JuQhk9UFuCD3JjBSY3bpB20raDV14/WK7gR3nAttKYjY2shLByztk5
 K+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J8+lreWmMpb/Gxpom1GmVEtnuVBLWaJoJSxRJlnCM7g=;
 b=0u/ueGy6HXS6FoqpuvHcTkXjmK3MOxuSCu3n0+UGK+IcXAPS25WDURSYuyCGU9f+mq
 XWDFHGPQxKEoh2GBNz5mB9oaIDomsnt7aPjG9EUX7j/e8np5A/9uxg/wBd0GL7cabSzl
 57P9H+rJLOX50RPM5jkQk5jIKWRMGLX6bfCw4XP/vkb6YDhAPjLVcylGaZZHb5v1yd8z
 LyMDW2SFe+DC4b9NrT2Kk3vvQ9YQUzXvKl3iZd/BCQpH9SAx+t8GSJHlsrCXSyX5rCwA
 T4/vWRtRWH6CxukqyFU+o/5xdDPhWHd58VNfn8b6A/Cd7zvDss8Zecws/oEeGzRl293y
 wpIQ==
X-Gm-Message-State: AJIora/MIZ8tU8+oT3K90i+MXINGE/TFngq74pJ12+F8rcc2EisjuZU8
 v3pTPbd/T2t42Ab8OSI0LBSV3e8cNtky4nKArsSUKg==
X-Google-Smtp-Source: AGRyM1uAl7aj49DVH9J9E/EGQvt2PANTmb6QKFAl39sfnwyvM0UGOfXQW5s5LH4F1t0taeD5NYqhHb97RfiTNyILX2w=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr18967337ywg.329.1657546816621; Mon, 11
 Jul 2022 06:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220707161656.41664-1-cohuck@redhat.com>
 <YswkdVeESqf5sknQ@work-vm>
In-Reply-To: <YswkdVeESqf5sknQ@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jul 2022 14:39:38 +0100
Message-ID: <CAFEAcA-e4Jvb-wV8sKc7etKrHYPGuOh=naozrcy2MCoiYeANDQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/2] arm: enable MTE for QEMU + kvm
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eauger@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Mon, 11 Jul 2022 at 14:24, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> But, ignoring postcopy for a minute, with KVM how do different types of
> backing memory work - e.g. if I back a region of guest memory with
> /dev/shm/something or a hugepage equivalent, where does the MTE memory
> come from, and how do you set it?

Generally in an MTE system anything that's "plain old RAM" is expected
to support tags. (The architecture manual calls this "conventional
memory". This isn't quite the same as "anything that looks RAM-like",
e.g. the graphics card framebuffer doesn't have to support tags!)

One plausible implementation is that the firmware and memory controller
are in cahoots and arrange that the appropriate fraction of the DRAM is
reserved for holding tags (and inaccessible as normal RAM even by the OS);
but where the tags are stored is entirely impdef and an implementation
could choose to put the tags in their own entirely separate storage if
it liked. The only way to access the tag storage is via the instructions
for getting and setting tags.

-- PMM

