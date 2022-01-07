Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D870487EDF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:18:10 +0100 (CET)
Received: from localhost ([::1]:51162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xYn-000626-6y
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5xX3-0004AM-8c
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 17:16:21 -0500
Received: from [2a00:1450:4864:20::436] (port=40501
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5xX1-0005E2-EL
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 17:16:20 -0500
Received: by mail-wr1-x436.google.com with SMTP id l10so13594504wrh.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 14:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1dXXtOKFPd4GmZet+XCDy89qfZ2jKYr2nhEK5Y6/CT4=;
 b=StGWAR4lz7Of3I26r0UAklosJLirf8/5coprZk0Vd3YftwZGNHMCQah5hCzdy0OC3K
 DaEetW2MMlUJC99AiCL4rgNdSDtrCZ428acyUfmvyb93ENpuzvO5YmZAk+5PPHA71t8i
 /LR7mlA39mytyI7aJ+3O0Uzq+LG0X2rzKTGALmrrpk7pkvOkuIiTBjR2LWXa9qYLQhf9
 DsWRQg+yNP9v8Bccymih0vqCULEEuV7oCrMqwRtkSRTcQwYA4AVSwHE/fiOrYpIp+HED
 +7pWle0a2dSBVFOzbJAwFUmoWafqOWT65hGZBDIzYu1Q1CYuUKln64OYkwzWGz8sLhT/
 KBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1dXXtOKFPd4GmZet+XCDy89qfZ2jKYr2nhEK5Y6/CT4=;
 b=yE5qtfZK55EFHZFY51lXdz5VHpq53QPQMsfmsW+533XyeKHh0QArSxTuOE1X9MR12O
 W3dl7fcheBIR/Y/9hk0GNZanQxzgPA1Fsznih2hDOjNdLQCu+/hNRIT/LT7yxf7Ii1QX
 KLTz17kvMRVZiDCIvvNRj72FOXn6Qd5qVG/pPr9RvhhWHkpoQkayvXHoiNZwWuKGe1hB
 2VtMFD6kVuYPiNEGXh9nLqW4r5pcd7QOVsqaiMjBy7nPALCCKy7BnWZX5sK6EGzuoubM
 o4BqYO/FSfqb8QvN6WEpZ42HdxEUaGxFwFRZQOi6iYwYehjwNtgaApFfI+NSBRKVJLW5
 jkMw==
X-Gm-Message-State: AOAM533LsTDFZ2xi+D7q+JWwGPg80lig4ZoR3wC6A64DWKorzVU5mt5a
 fUWVDOwm+qKmz34kFmoKI2/L59t1OZ+zZKVR7PoRHA==
X-Google-Smtp-Source: ABdhPJz1qC4ttGoykZ5nnVuR+OBOgWMCkbbOyhcSm7eap3hCLJU7LXHBQ17Ed3kNievzG/chn6h5ZHtlG6UJEcBd8+8=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr34718585wrv.521.1641593777511; 
 Fri, 07 Jan 2022 14:16:17 -0800 (PST)
MIME-Version: 1.0
References: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
In-Reply-To: <586FEC07-844C-4E1B-88E0-93B97FFC9010@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jan 2022 22:16:06 +0000
Message-ID: <CAFEAcA_=jn1G==9R1=LuU7GF0=LWPz92f1Qx9xO7w+m+TqL1Tw@mail.gmail.com>
Subject: Re: ui/cocoa.m compile error
To: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Jan 2022 at 21:56, Liviu Ionescu <ilg@livius.net> wrote:
> I'm building 6.2.0 on macOS, and on a recent macOS 11.6 with
> Apple Silicon the build passes, but on a slightly older macOS
> 10.13, which is my base platform for Intel macOS builds,
> compiling ui/cocoa.m fails

QEMU's supported-hosts policy
https://www.qemu.org/docs/master/about/build-platforms.html
is that we support the most recent version of macOS, and also
the previous version until 2 years after the new version
is released. Currently that means Monterey and Big Sur and
(since Monterey is only just out) Catalina.

Apple's APIs have quite a lot of churn, and there are
regular deprecations and new APIs, so while macOS versions
older than our officially supported set sometimes will be
able to build QEMU, they often won't. (Also from time to
time we remove back-compatibility ifdefs that are only needed
for building on older no-longer-supported macOS.) In this
specific case, NSPasteboardTypeOwner seems to be part of
an API introduced in 10.14 (Mojave).

So the upstream answer, I'm afraid, is that you should
upgrade to a newer macOS version.

-- PMM

