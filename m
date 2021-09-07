Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC02C402CCB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 18:23:14 +0200 (CEST)
Received: from localhost ([::1]:50614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNdsP-0001I0-QD
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 12:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdrR-0000Lz-4W
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:22:13 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNdrO-0006aD-SE
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 12:22:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id y132so1643717wmc.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 09:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i1r5kMJlaqvB9AP1UXN9FNF8QSvLsvnYlc3+V2vPLsc=;
 b=Fenu/VukitNjoVJ1NttW6gtgj/EQJSHdSTji3nQ1+XX/gt76Rmo9lkyWzEVoIHv1Zq
 arYc+ODdDggPEG0hdFilHYGrLKacXvO+BbU0jSKazBHExyc75xYTQg353EMvq1u7whkd
 lcW9FTzW87hKu3mq3F+RxacKPknMKiAl3gTP41B0v1O2eVTcHmlKSPBHuOOHjuZqs+iJ
 TMJEanBqxIECLCFipShZCB3T5jBfCaf4HRYiZAJscFvYxStHLHfqyBf7lav9H9IksDQi
 BUPEB0OKCR0ILc7JeJVrlDWD++cq/RVvK3v5tpzl/ATgSU+TODcDcWmDTiG9KqXH5p+3
 gtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1r5kMJlaqvB9AP1UXN9FNF8QSvLsvnYlc3+V2vPLsc=;
 b=GfQ5jjmIVf50qIrNEh9uwRa8s3jaMnznPtjNzq6g5BP/VNLaq+TNN46Rp0j1mR40pf
 epaM2CicC+z4aQeb9YaaKtD4PbHwF2/SzAIzK997F1nMgjFnXeJAhlF7O+uTggvmulAW
 0CnRDMNPcBOJbem5ziZUJ1l/Ash6xyUJ2feUxvMFV6zJAAsanUlu87b4ko+hkPaHODVf
 3ACnD7R5HIRx8npyNIRMdmcUxrNvQTG9KKm87TEPf3KkrHItl/jvUdTR/7BXr0I0ENLD
 48Ry1ouM0sxp+KIDwqYo0/6tuGc/kwC508bu4GW7cuswebWT3gdQUL1EVX9mTCaDpwwf
 fwFw==
X-Gm-Message-State: AOAM530Bp7JQSWfdXuilo05QwfQcyNCWUCX6qi05osHUhKiJpYT5NfyV
 KIG+Ta85E3bE1hU1GhwEC9DRN9Pd3Jgt9jHf5n/6DA==
X-Google-Smtp-Source: ABdhPJywiasa28anGH5BidS05SdXGbFhSq5OP4Tw84Q5H//HaDZt8xsTcFRfOUF528ud3Md3Lk+Cii7S0/C2bC4z8V8=
X-Received: by 2002:a7b:c246:: with SMTP id b6mr4864650wmj.37.1631031729267;
 Tue, 07 Sep 2021 09:22:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210907155641.197844-1-pbonzini@redhat.com>
 <20210907155641.197844-4-pbonzini@redhat.com>
In-Reply-To: <20210907155641.197844-4-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 17:21:20 +0100
Message-ID: <CAFEAcA-VEZ3-yZEL3TqOyRMm8Y8TjmNn8uY3sEzmVy-ncQV9+g@mail.gmail.com>
Subject: Re: [PATCH 3/5] docs/system: standardize docs/system man page
 sections to --- with overline
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Sept 2021 at 16:56, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Man pages in docs/system use file inclusion heavily.  Use headings with
> overlines in the main files, so that the same included file work well
> from both manuals and man pages.
>
> This style of heading is a bit more heavy-weight, so it is not used by
> the other man pages in interop/ and tools/.  If in the future they
> are changed to use include files, for example to avoid having sections
> named "synopsis" or "description", they can switch to --- with overline
> as well.

I did have a go a little while back at using include files consistently
for all our manpages (my motivation at the time was trying to add a
standard footer in the manpages mentioning the license). This runs aground
on a Sphinx issue -- Sphinx always builds all files, so if you have
 thingy-manpage.rst
 thingy-html-page.rst
 thingy-contents.rst.inc included from both the above
and thingy-contents defines a label, then Sphinx will complain about
"duplicate labels" in thingy-manpage and thingy-html-page, even though
no output ever wants to have both rst files. There's no way to tell
Sphinx "only build this for this builder" :-(

We get away with our current handling of qemu-manpage.rst only
because none of the files it includes happen to define labels, I think.

Anyway,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

