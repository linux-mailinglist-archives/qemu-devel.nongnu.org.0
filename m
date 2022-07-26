Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55495581354
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 14:45:15 +0200 (CEST)
Received: from localhost ([::1]:50754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGJw2-0004Qj-DV
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 08:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGJtI-0000Pz-MK
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:42:24 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGJtG-0003SX-Vz
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 08:42:24 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id n8so5582668yba.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 05:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q9ETQDGHrT2DbAcsazHk/JW3nzFWxFxWaD4ZYBpPupU=;
 b=GIuJatz6g7nIiFAEOXF8JZ4Uni4/D+ADBzuod92/+06kMWCM0+tVEamZ9WnkFMQGJa
 fC2OHZkB8orqFcBeaOuhrND43hh572lYGDvLN1fwNfvCsH+N0MLPNHjjd0ZRrVU+w+nt
 1MlzO7UPXYBvsT7UE5EggEJPDzQC5vGZ3aNrBxRUJAxyBBXRAOcxawBzGBfWyY7KlKXF
 MMMRjHsP0zU16oLHWSQt2/gsH2VDvSAL3pP5vLRjg6QwuV6rmTo0+a0MsUHv3Oe5ZEwM
 Et+b+1e3nH0zUqdq0n94I/YRy9Pc2LreSThWKicWfGqrWXQXKFSCilFMDv/h71zxfpk7
 pw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9ETQDGHrT2DbAcsazHk/JW3nzFWxFxWaD4ZYBpPupU=;
 b=tD5vQZBtRKXXbILJ8yCpjHPXBAslRZa8n3r+d15eSCZHAr+KkQN8DGRvQaiPuH+u6b
 avtqTF7rigXqqWDyJB0ySOKDGwhvut9YCtlbIZWapChQ6lyGkhla3Hi0LcGQnT4x2FJD
 RCEZ0Wxy5pHgES6ucHlXXIzG8QgjLBDq5AxmSmM/iwcq11ViBgKUJZtmuflg11VG2I1h
 kVC+NGxMmCHbyKaIjPoizDB1kye6FD4h5pB6Wgr0Kl99VA6tq8lTqtN5nBD6yOK1Sf2S
 l6cIxTKVr7U5gSIMwVHKET8LjhPVoE7qStQqi9HLENA+HzCMR/ytQHi/6rVfzKxu65Dl
 buGg==
X-Gm-Message-State: AJIora8tk0f67YO5JtBBR2dwegp8wDEPpbaznMcCgdWuIIvvW+B0Hejb
 a+IrvXfR5wsI7L6mudrvQMHkkaQqin2dpstby7kSsOztrt0=
X-Google-Smtp-Source: AGRyM1va1JjmV8TdgDREdmOGp4TdXojv72CwXQtXY5x7Xnwd20go3klUG1IGA3e+tSm607IGwdWd2TBENG1T5WGMX28=
X-Received: by 2002:a25:d4a:0:b0:671:6d11:d14e with SMTP id
 71-20020a250d4a000000b006716d11d14emr3528044ybn.479.1658839341777; Tue, 26
 Jul 2022 05:42:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220720152631.450903-1-peter.maydell@linaro.org>
In-Reply-To: <20220720152631.450903-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 13:41:42 +0100
Message-ID: <CAFEAcA8tCERk0b27FypEvrQp066-w4ZnNvF9bxpCM_xLzzOYrw@mail.gmail.com>
Subject: Re: [PATCH 0/5] configure: fix some non-portabilities
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Wed, 20 Jul 2022 at 16:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes some non-portable code that has crept in recently:
> notably, it fixes problems that are reported to cause configure
> not to work correctly on OpenBSD and NetBSD, and a warning message
> when using dash as /bin/sh on Linux. I threw in a less important
> "drop some dead code" fix too, and a fix for the only other 'error'
> category problem reported by shellcheck. (There are way too many
> 'warning' category reports to deal with all at once.)
>
> If people who reported problems on NetBSD/OpenBSD could check that
> this fixes them, that would be great.

I'll take these via target-arm.next since I'm doing a pullreq anyway.

thanks
-- PMM

