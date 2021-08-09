Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE70B3E42E2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:35:21 +0200 (CEST)
Received: from localhost ([::1]:50010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1gm-0001Iy-Ou
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1mD1ff-00004u-Ma; Mon, 09 Aug 2021 05:34:11 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:39545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1mD1fe-0008Lg-6j; Mon, 09 Aug 2021 05:34:11 -0400
Received: by mail-oi1-x22e.google.com with SMTP id bj40so3061997oib.6;
 Mon, 09 Aug 2021 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PH934TR5cbwG8FxESajOqpgE0y2P139GmILDbxkCQio=;
 b=o3YQrSJExcYNmY6fGqNz6IS6Hne6BG7VAHvbcBW3GRFZEjWwoy02m4QuQZ5c1k7Zrl
 XD32olodquRaia9hf+5+2eQJMRJJtk3kBqMSyiCWSAKO6xre+0ZZqYOsgrzrz2Hi4Xwk
 gSuGXLRB/8JOGLs3U2UzZpl0/c4AHGnAPEzc8J4HV14cUy0vFy+Z+R/CYzLyB/OnjD4D
 j2McNoSN1pniAQu9K1B90YRq0sx3YaHQiSB9rdwa3Rd0zgmFNIx+ZgYL1SgNxnd8BOs3
 zOReITCrzpBJqbx/CAmYbypbETsYndnoOpLgmNKC9XeJPS9HUn6Rj17YwCbA4tNpqjgt
 cM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PH934TR5cbwG8FxESajOqpgE0y2P139GmILDbxkCQio=;
 b=TDkcWdxIiJ7SimMk+70NktPcJe+udx9cs0/iUpDVJWQjvZBC59e0vBRye2sAPI0WO/
 OqwFU1P6NRcSM0Prf8R6SXfpkErZSlBBrFns7EZGZ/uzaogVG8brtrl1a6zV5Brh/zvx
 R6v/xoRz7CEG3X33KTR4nNX7iBi18H69kFOL57UCIFZQEzclNgOvq+t/MlQQDgv12Srm
 +luwi6SWQ7mO9/pRtEoip4lvotiP0LYFIyjh24JTLahpG0fIYBKLWNWMnqXVkYUQCNuL
 D/kOfG7HPI+vX2CaSCSaQwidvNm+l8pA6dkq7CFc7UKFjWM0P3KGQzjlb2N2UIDXYl9U
 n2zQ==
X-Gm-Message-State: AOAM532nzq85hQ2If1JBH8jQs/gte6iOw1g0pW96J3pd6v8WqyQZCZ5p
 DHqRIdCY7o2H5eNm+MX2JwISRkdiFyS/NrFYay8=
X-Google-Smtp-Source: ABdhPJwm+NI855erzPNmfVMF1cMuvRb8B4IgwJ9WpRhAtCBX9uJYzdP1lqP8O9z80wf5proQ9g3RNqLBe/0K2dKOtpA=
X-Received: by 2002:a05:6808:68d:: with SMTP id
 k13mr14822491oig.83.1628501648002; 
 Mon, 09 Aug 2021 02:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <1628059910-12060-1-git-send-email-cyruscyliu@gmail.com>
 <20210806144209.nbx4vlm6ofkza5pl@mozz.bu.edu>
 <CAFEAcA9Qn+PMGWRLtBdPXWpzz=JzoNc+XiaEpPXGv4Wb+YX3=A@mail.gmail.com>
In-Reply-To: <CAFEAcA9Qn+PMGWRLtBdPXWpzz=JzoNc+XiaEpPXGv4Wb+YX3=A@mail.gmail.com>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Mon, 9 Aug 2021 11:33:56 +0200
Message-ID: <CAAKa2j=zjGEEcfSz4fv=wOW6+OajXQp1Gy=VYjbH5QMrBXNHMg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/xlnx_dp: fix an out-of-bounds read in
 xlnx_dp_read
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=cyruscyliu@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 "open list:Xilinx ZynqMP and..." <qemu-arm@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you for all the insightful comments about the separated patches.
This would be my first time to format a serial of patches. Does it
look like below?
[PATCH v3 00/2] title
     [PATCH v3 01/2] fix
     [PATCH v3 02/2] test

Best,
Qiang

On Mon, Aug 9, 2021 at 11:24 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 6 Aug 2021 at 15:43, Alexander Bulekov <alxndr@bu.edu> wrote:
> > As a side note(not strictly related to this fix) should we continue
> > joining reproducer patches with the fixes? In order to test the
> > reproducer, you need to cleave the fix off the patch. At the same time
> > we don't want to mess up bisection, so does it make sense to have the
> > reproducer patch be separate but come last in the series?
>
> My preference is for the test case as a separate patch, last
> in the series. For this kind of minor easy-to-review fix it
> matters less, but sometimes the right fix for a problem might
> be larger or more complicated, and then having the test case
> in the same patch makes that patch awkwardly large.
>
> Also the person able to review the code change and the person
> able to review the test case might not be the same...
>
> thanks
> -- PMM

