Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A006F530EA2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 14:15:49 +0200 (CEST)
Received: from localhost ([::1]:42982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt6yS-0001gC-51
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 08:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt6wS-0000gX-1c
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:13:44 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:44289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt6wQ-0001vA-8B
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:13:43 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2fee010f509so145249667b3.11
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qZ9j7N50WpR+go7dKSFEGrDAeVLO68sbf0r6AHtEkxs=;
 b=JtZ83wXt4wvxoRiQwNRSCezGGzAj10tM939k2AG5D5YkBnwMM23gsbk6+yRt50nm0p
 +pGwHfIo8XqCsInRLlcIVzm4sGUvNxKZe8jJsXDcQgVtnO6mTAx7XUp+qTbxS/ZH9BZL
 fOAJ4iFC8fpsVYSl5M+uYNYWIgugea5+9eM/gpub0S0WlMM6/m8jFPK+YGdIrnYXCiFS
 LGLSqBwk9fBmNnBg0G70KVcKI8BgZTMp3W4OOKjSMCheOMJUO7bQ8WC+7y+NrVin3Wo4
 sPz6c5zPNUG9Fdtnu35M2onOIo0y/czxB2ZJuBVw16bV5TxHvXK95IL4DBjtAv9pC9hq
 g7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qZ9j7N50WpR+go7dKSFEGrDAeVLO68sbf0r6AHtEkxs=;
 b=Yn1K11sfa0JWSLoEaLpybgoeCfHzYiCeTneRMNgHjNDD3qYJSq1tDnHPj8Ja9J1wmd
 h35EYbp3kl2fN4KHIjBJafFwYA43PKI+Q4FmMjoE7DuDoNDO64xqB0KqL/Ew2hLHuxDz
 hY2mr6ePr89ceT97v7uDM8VeChml+hwmI9dDrE2EtWB3/2dgGF/k+1eOp+JTZAUslaVi
 nwgAK/J4Qgr+sb4cNq5YP5XVnc+5bA8wWwNfqzgG8/G40nPux2opVYdtjemVI7/dxEBC
 ypZW+DpyxNnNSK1OfjbXGjRHfBfyA+h2wylOjHDinf2WzKFMh+sd/4Yv5cSLdxKdo4p7
 yaBQ==
X-Gm-Message-State: AOAM532Qe9fiappGTRfs/90uXg6hVe/YdSgY7gvh911eOTY+srt621Nd
 CgIQMBBEsIRbNd9YN+MaOFUuLBsFWKIEwCm8IlGKSQ==
X-Google-Smtp-Source: ABdhPJy6FfUl7KNBxTzVHVSK2KYCtYb7fJ6/wZKKWo7zGe2YgjODykpxJwROGACaWtlKCsqPshmXWz749ARYoI9tG0I=
X-Received: by 2002:a0d:caca:0:b0:2ff:47bc:ed48 with SMTP id
 m193-20020a0dcaca000000b002ff47bced48mr22507090ywd.64.1653308020160; Mon, 23
 May 2022 05:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-10-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:13:29 +0100
Message-ID: <CAFEAcA9x+xCFkLQX8wMnTr4JfFLN0nOnLan6y-Qt-tmzRe5mpA@mail.gmail.com>
Subject: Re: [PATCH v3 09/49] semihosting: Adjust error checking in
 common_semi_cb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The err parameter is non-zero if and only if an error occured.
> Use this instead of ret == -1 for determining if we need to
> update the saved errno.

The gdb protocol isn't 100% clear on this, but what it says is:
https://sourceware.org/gdb/onlinedocs/gdb/The-F-Reply-Packet.html#The-F-Reply-Packet

# retcode is the return code of the system call as hexadecimal value.
# errno is the errno set by the call, in protocol-specific representation.
# This parameter can be omitted if the call was successful.

(and from the implementation in gdb it is basically just returning
the return value from a syscall plus errno).

That implies that our current code is right, in that the
way to check for "did the call fail" is to look at the
retcode, not the errno (in the same way that if you make a
native syscall or library call you look first at its return
value, not at errno). There's nothing in the protocol text
that makes a guarantee that the errno value is non-0 if and
only if the call failed.

(I think gdb's implementation happens to only set errno to
non-0 on failures, and lldb doesn't implement the file-io
extension at all as far as I can see, so there might be scope
for getting the protocol definition tightened up I guess.)

> This fixes the errno setting of SYS_ISTTY, which returns 0 on
> error, not -1.

The gdb implementation of the isatty call returns 0 or 1 on
success, and -1 on failure (though the only failure mode it has
is "you messed up the protocol packet format"):
https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gdb/remote-fileio.c;h=fe191fb6069a53a3844656a81e77069afa781946;hb=HEAD#l1039

thanks
-- PMM

