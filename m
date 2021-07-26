Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2E13D574D
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 12:20:35 +0200 (CEST)
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7xis-0007Bz-8g
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 06:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7xht-0006SE-AR
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:19:33 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7xhr-0006S0-Pd
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 06:19:33 -0400
Received: by mail-ej1-x635.google.com with SMTP id nd39so15670230ejc.5
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L58pAanLJUCk/xRls5te0UCQU1lF0YNaFPV66CP0w54=;
 b=pFigYGu5m0syzbiuclVjzKpmcldJbP/LdJiIriqbsCs5xOxXFAf3C/fNv9tIw5dsbR
 N30iJVcMNNmGvuiYReJ3d51NGQLDJJrCiAYZ8Xnn0cs9qsLM+nW6dn7vb7m3B8Nwz9Qg
 2btbgK1DD75IGwNTrh18iwwpKPlAv4Bg7kFYz2w9cs6jUAcAeOlTnpwDrqf3ChT46Nws
 wkVG7aISwQSuZ+QBmY5SHENnzXNr1A6pwzy06jfwXrwcRD9LljtLGwtIdqbxP5FpjQ/T
 eW8H19zw/Qq29+ut3TX7zF2wvLvs/oJCRAuC/MYR3U7zkpBJFEico3z6b53JcprHOGI0
 DSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L58pAanLJUCk/xRls5te0UCQU1lF0YNaFPV66CP0w54=;
 b=i6gtWpG7scYPgnpi1FcV+oOdwqDdqCqZiNmo6aCT1MWWti//NH2QHRLMzU7l2fJFx0
 vH7CI7wVZDhDoRaFf/j1MP3rgbsyiH3kYZWUq7o0DLK+P83bbhr+GWwAsAfX+KmQWqB1
 hz7shz3eTJjxvMlGnmcITb+xSSvCAQoNHDMxZwywSJ4/K44v8RAs5F/iWqABhPwYS5Ln
 0X4Y06U+newxKfv2sPNSVkDXDVTSC1ewaqRa/djypVBxzZLDxD18qDOyKJzxhi6+Bqq1
 ZY2rckgSWCd2wAI+uTu1rbGpoh4U/+C2uFskOaKjqj0uYTvmJ3RZ5A3EXDXsQoz8rrqP
 812w==
X-Gm-Message-State: AOAM531qiNSn5Zk2ZIVxiVC/pdfV8oJFtrUFGvgAOvn+u9a1VoSiiGKo
 Tj7E4qPnYkmdTyY1Rrq/MB6qm1poxf9UQGNYg1wdKA==
X-Google-Smtp-Source: ABdhPJz954JxqygY1FtQ+mOy3WA+B7fNr4HagL1q+bckZM6JON4RD4r3m3IHfGHQCUqf4jqozqnv5qGI++6WaYV2N94=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr16633841ejc.56.1627294770139; 
 Mon, 26 Jul 2021 03:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210723065828.1336760-1-maozhongyi@cmss.chinamobile.com>
 <CAFEAcA8Prn1MgdAnnWtf=gstNATWKs-2hNcq1m8rJRY+as3E_g@mail.gmail.com>
In-Reply-To: <CAFEAcA8Prn1MgdAnnWtf=gstNATWKs-2hNcq1m8rJRY+as3E_g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Jul 2021 11:18:48 +0100
Message-ID: <CAFEAcA-9wgMaY=eWdOxffLN1w2kXd2Oy8E9-tEN_Nwpxp=oD-g@mail.gmail.com>
Subject: Re: [PATCH] docs: Update path that mentions deprecated.rst
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 at 10:02, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 23 Jul 2021 at 07:59, Mao Zhongyi
> <maozhongyi@cmss.chinamobile.com> wrote:
> >
> > Missed in commit f3478392 "docs: Move deprecation, build
> > and license info out of system/"
> >
> > Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> > ---
> >  MAINTAINERS       | 2 +-
> >  configure         | 2 +-
> >  target/i386/cpu.c | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll take this patch via target-arm.next since I'm doing a
pullreq for rc1.

thanks
-- PMM

