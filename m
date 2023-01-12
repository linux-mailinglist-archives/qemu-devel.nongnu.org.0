Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A86672FB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:15:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxPl-0005Yt-Vl; Thu, 12 Jan 2023 08:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFxPj-0005Wo-Ce
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:14:39 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFxPh-0003GN-Ty
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:14:39 -0500
Received: by mail-pf1-x42c.google.com with SMTP id c9so13758185pfj.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 05:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1IyZOK9JvdvBbxtrnC/kwik/kU1THM0w2JiDAiad6bQ=;
 b=rqQXgnndirv68ochRPyeDt13bxQrsq/xXcZ4TEgtkeNpEhTiViR2rNjMaHas0AwC+N
 2pZOZnzEX4H2Yqvmj8/S4cUejKs4DH0/Fojq3R2jT050NUVFkrN/OjoBjmi+sJC+E6AS
 OMGTChqxMEVpTi235AmKN4wf1+EanfJyYnPCIB7cx2ruf7ua4ix16Lv49qiN9lbeQEBc
 eEXstt/XKzUkY/Erw0MgHk5RZuAbuv+OCXGGI5bG0CTUtJDMLzvk9Yrkmey2Rqv4Vbnh
 zTOnbwkpfvUpmGJl4ua3Gexe6u4QSBWdPSWAli+pEI2iLTX0rSBWNa78H0QLKZZzODwR
 NgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1IyZOK9JvdvBbxtrnC/kwik/kU1THM0w2JiDAiad6bQ=;
 b=kk8C4eHmmPrI6osjYtFiE4pEOHaJXBJ7dvaGcOLiVXKqvz+Z4hVDAn3PZUWs1Vc+nE
 KEZvjdBbAiH/R9zfQUvCefb9e0BzBTFeM4WInMl3s9Tm++kre0INLgaSXkQ/d6wr58Gj
 7tM8EWpFgLuVpkyFxD5ImXgOc33D+1d7y6biqisUu+h+RxrmoMCmx9ibezuiU8SIGbQb
 f7YkBP68DIwsiVZyBJ7VLRks+xuicxeKqdhpSP85t6HnZeY9B4ye5Mlpx7fEVBEuxkY2
 atQCC7xfsc3S3U/qK6x3Mm3eu4znM763k5JcNBGko567oFeOPrBwfpqKxGWDTLHJUPXb
 6Dbw==
X-Gm-Message-State: AFqh2koWFihnWfCeE/kZV6z3EM2QT+XUCwnkWkBLQpDwpz+ZGS/Lah2M
 DpLsD3iyBINS5nTPGhqmS+cwwYmkU2/MWogYn4hoBw==
X-Google-Smtp-Source: AMrXdXsiNZMOsuTzgTxAHmo/qE+45bPtLcDEGy7zZOUtXj6Rm7n4VzalUiYMUYfQ1iMGoSKdKQsHLy0HZ74fL7yKCLg=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1168360pgd.192.1673529276270; Thu, 12
 Jan 2023 05:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20230110084946.299480-1-pbonzini@redhat.com>
 <afc99f0cdfd9686e99a6e1b94e609dc0e73cff43.camel@infradead.org>
In-Reply-To: <afc99f0cdfd9686e99a6e1b94e609dc0e73cff43.camel@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 13:14:25 +0000
Message-ID: <CAFEAcA_jPBHBMBHLNHRdHdoQVhQZDApP0N6cVtjhkHCPQbP06A@mail.gmail.com>
Subject: Re: [PATCH] remove unnecessary extern "C" blocks
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 paul <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42c.google.com
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

On Thu, 12 Jan 2023 at 13:10, David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2023-01-10 at 09:49 +0100, Paolo Bonzini wrote:
> > A handful of header files in QEMU are wrapped with extern "C" blocks.
> > These are not necessary: there are C++ source files anymore in QEMU,
> > and even where there were some, they did not include most of these
> > files anyway.
> >
> > Remove them for consistency.

> Are we allowed C++ in qemu?

No; we've just managed to removed a couple of minor optional
things that we'd allowed in, and removed the configure/build
machinery for supporting having an optional C++ compiler.
The only remaining bit of C++ is the Windows guest agent.

thanks
-- PMM

