Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0592EF376
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 14:52:04 +0100 (CET)
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxsBP-0003UG-2W
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 08:52:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsAL-0002uA-6q
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 08:50:57 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxsAJ-000701-8F
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 08:50:56 -0500
Received: by mail-ej1-x635.google.com with SMTP id jx16so14538815ejb.10
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 05:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pgloYTHhKqpbFvrivGZDOeP9gj2oGBxEf54Q/TxsE4I=;
 b=EeT0T5/6ID0PcUYL2ofXzTcE2IYVZ8zerIUpCG1edlN8G1v6ge0EpOBd27ghpJ4AXJ
 g5cYxPcMlNn+we67GAnSjpSDoz8zqAA2YmZCyPsdffGX4zZjFxwUdd7Oc7DWxp27ULIm
 piO67iOyW/zJ/Yqantm+wJ7xpBUoGCoZGaxoIyy0A+h+5DibLD33j5IF9EEND/S9cwtV
 yXrtDfXZ5iBIMQEkC7dH5jyYcZRpCuzQGYNR3O2PPJXJMTlNHyCoVfPtr6mCergmnit3
 XVmF6tr7T1ZpdbE/M5bf0m9C9TNHR7wXpujt7K5a1F5cOzWbj4GluRyNLLVNjCsdJz6C
 jjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pgloYTHhKqpbFvrivGZDOeP9gj2oGBxEf54Q/TxsE4I=;
 b=ajKPUPtysOSwUFCFgjtrlEZrPj3M10JX8nAJqq8Bi72JwVFGQSDPlQQSkRN/Cpd1hS
 wpHV86xJY5tyI0YGE/FVtAXi71rFzumGk8AuQ0BFEqG3Ij2sDmzfgtpcC16wcsZO+wm4
 BYe8YSBmi/mXxjqxRdi2abl2T3pr1rLHNG82F93n0sqvuF/N7hunRIR7qmAdNWojLD76
 z9EAMHhfJ1DoiLWwGlJc0L5moEaEbgSVqO5orY3fKmW2a2N77ima3Obqe3W4oBtGBUZK
 eXjLtdLj14bn9zGxEHUHOofKNVwyn2m5PG0jJDE+AuDa443GbXReSOVktiXdKTaogf0N
 JUHw==
X-Gm-Message-State: AOAM530QiZlPfVOw3PB1vDtyZ4kc9ZYUbQ8pWdeh1vVeV8F2y0wlHBw+
 z8Fg5dJRb9OPsJRKxUsnNi/JPxeir8sjj5yTAAfsFA==
X-Google-Smtp-Source: ABdhPJwPlMozjrvAvUnnj1jyAGWCVfcVj4HuZEQgQvmwMMvuOeHb3Lz20DpJ6tfrJQf7RKKyUbjZkwMNDwDfK5ovepk=
X-Received: by 2002:a17:906:1151:: with SMTP id
 i17mr2795894eja.250.1610113853526; 
 Fri, 08 Jan 2021 05:50:53 -0800 (PST)
MIME-Version: 1.0
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
In-Reply-To: <20210102150718.47618-1-r.bolshakov@yadro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Jan 2021 13:50:42 +0000
Message-ID: <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
To: Roman Bolshakov <r.bolshakov@yadro.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
>       [-Wdeprecated-declarations]
>         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
>                                            ^
> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
>       'openFile:' has been explicitly marked deprecated here
> - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
> ^
>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll take this via my target-arm tree, for convenience's sake.

thanks
-- PMM

