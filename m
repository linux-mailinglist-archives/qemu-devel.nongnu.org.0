Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADAC4AE27A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:07:49 +0100 (CET)
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHWmC-0007OS-4m
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHUtp-0005VJ-TJ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:07:34 -0500
Received: from [2a00:1450:4864:20::336] (port=36659
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHUtn-0003Vo-OM
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 13:07:33 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so1760555wme.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 10:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jDpEHVgiQlvgNOMB50jXiVXBYdTKU1/lJ1j6OeLvEPY=;
 b=HwpDqGd61D9wCgQyUxWuwnWaF72V0tIprj0pCG7YfZ+1bLBRWDFOTdKhYn4Ubfv8jO
 vxo3I3OxcK76ClX9Po0ByNDkcKbN6YDpoRHXjM1lP3cKldlEcatv2yD6c26s9XPUHB1c
 0iKhzLQDe0flAXRsXso2+X5lr3lpPZ9rA+0AvXhq7VJ0bcbwZX4ZzF3QrPOIQuvH410B
 dns7H0me3NpR2wQSw415ojMJFNVNOplS2sK9o1r8y+68yJM8upK1bawjYmV0VEXqVIOz
 qtRhblLgVJ1SMe5p5zGeCDdOe8agWJQ4gCAlL5zitdhyQ56i9/Yk/8xWpKC7HVjBhCbd
 8dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jDpEHVgiQlvgNOMB50jXiVXBYdTKU1/lJ1j6OeLvEPY=;
 b=Wr0kksSrzFA0gl+kdZSW7/DcA32cRxdDsJHOeAXTH48DA5RWWY2fN6AEdJDSq8KwhV
 AG+yziwIXoOC0nb0b8APbFsr5ebJlO2mx22LIbrAEk0lPE2kM6HrbzwtT2wvLay2oFkX
 MpKfTqg/46YShyu9YDLauV2CPx+FPb2lXBzKbrmzFkQrmyJmtUePUR0dx4s4ZHBs6O31
 C2Ai+Yua+gmyS3FUPuRK4K4M6DouKm2UHPUD2Al1WOdaKMDXriPnJLXaERSMVvz/zLIE
 vsp3UQdNyhSzNE4jQPqNmFxablg8RmR10UElhhPQhhBcxEuNhuq6847djc94/JSATLaa
 26FA==
X-Gm-Message-State: AOAM533Xc8lc1zNcryHx630ZW+plFbq3LvWHgHicSjy3ibNlg8CbqCKH
 04zvOT3fTZSjYj3aB3z4n9nQY7p2pxaOpr3z2+YM1w==
X-Google-Smtp-Source: ABdhPJwW/qHA7ph+x0rfsA+2CihloInWuynTpYZoVZaDhbvVhlcnSxTjTl/tUNOTn40/iTYE9zSA0ZbE15BQBixB29E=
X-Received: by 2002:a05:600c:2d05:: with SMTP id
 x5mr2065698wmf.133.1644343650057; 
 Tue, 08 Feb 2022 10:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20210616141910.54188-1-akihiko.odaki@gmail.com>
 <CAFEAcA8LFt5NpsVTE1dYpA3rW0RsjS1Nf9Q3iS307kaHjVS=1g@mail.gmail.com>
 <CAMVc7JXBn1uMkx=hj-DQo-TE777xrCZ98R8YxK+F5niUD6=nQA@mail.gmail.com>
In-Reply-To: <CAMVc7JXBn1uMkx=hj-DQo-TE777xrCZ98R8YxK+F5niUD6=nQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 18:07:19 +0000
Message-ID: <CAFEAcA-_t+TVnqzgBk1ZM7xuq-ixAPxNNP3i-Z19HgmXs4EB=w@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Set UI information
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 5 Feb 2022 at 02:06, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> On Sat, Feb 5, 2022 at 1:19 AM Peter Maydell <peter.maydell@linaro.org> wrote

> > (1) A question for Akihiko:
> > Are all the cocoa calls we make in updateUIInfo safe to
> > make from a non-UI thread? Would it be preferable for this
> > call in cocoa_switch() to be moved inside the dispatch_async block?
> > (Moving it would mean that I wouldn't have to think about whether
> > any of the code in it needs to have an autorelease pool :-))
>
> It is not safe. Apparently I totally forgot about threads when I wrote this.
>
> It should be moved in the dispatch_async block as you suggest. Should
> I write a patch, or will you write one before you delete autorelease
> pools?

I'll write a patchset. If you have time to test it when I send it out
that would be great.

Incidentally, I think the answer to my other question
> > Is it safe to call dpy_set_ui_info() from a non-QEMU-main-thread?

is "no, and so the body of updateUIInfo should be enclosed in a
with_iothread_lock block".

-- PMM

