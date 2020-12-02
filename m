Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D0A2CC41B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 18:46:30 +0100 (CET)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWCz-0001Q6-84
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 12:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkW8a-00071O-Ub
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:41:56 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kkW8Y-0002ob-39
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 12:41:56 -0500
Received: by mail-ed1-x52d.google.com with SMTP id y22so4933979edv.1
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 09:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0t1hw86sf9U9yRIj6nY5y0OB0SOJ1zvPo0vi+Fr/F70=;
 b=XfpysRh1znQLuFmA+Lwl7GLl7eFpE+r0Lo7wQxkShZV2Xhoh2+Q2x3oegKvJR5IZuU
 g0W0gLM3UZqOoAm93yrNysQ28BaR7w4KVgMsCA4NmrZmXnTFYaXIN+EwYLmqPriVxQJE
 4hr7hoKCcoX3UMoqnlJ64JGRkexfu3XEMgQknCGjE0B5TZuqMLXIyV/aIW+CS1S+nvQY
 jZm/OZrUhDfqvyACK7i5s4jjwudQefGpKtrTq/GZ/nM5i7uo+4symmZwAOI+ju1/D2OH
 jQxu+tsd4HP9DF7iWqNAIIAXzSBn5iUYu6pkZ1YiyTbWDlLVZtwWS+2XRBzIKVbUGwkf
 bMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0t1hw86sf9U9yRIj6nY5y0OB0SOJ1zvPo0vi+Fr/F70=;
 b=mPN7pMMlF8gAgjTKtx5YWgyQXvjXU0kdi4goMim/LRh/o2m+yLhX91W4fgmeY3XlDZ
 NjUPqUROjaTr36sCXOBJ5FwigqPyod+AvQyB8jYL7M5r/HaQp0wEJ2a7g56aIqvYqOO0
 H2d54/dkiWa9UcUUui/733da69pIPmhxUUilG9aJEiilRwiyAzO9/xU+Wy/dP+fBg5j3
 82pfKTvkacKI7BIXFd40/mMrbqWAos9zE8joOB2iJuoRpgwh6ODdQNmfekVFyPrioEnZ
 mWY9kIPIQ4tgwCw5tChq7uEV+Nd/fbVpdFvuKy7G5llDSJQ/ZnWQoyTFA0Iw+CXMUdzv
 fFIQ==
X-Gm-Message-State: AOAM532u/lSQjNpnljeCyQqkB8S8D44IRGXI7TdwhePsJG/Rhic9dCDm
 pc8g0YZM9yEmwOSaZgSHh3t1ALYZzw+RIxQSPUOtuQ==
X-Google-Smtp-Source: ABdhPJygM7lrTdRqR9CM9q7AmTdoDavJahOw+m3PIuMh+S/c5rp37XSaMWFmcxdGnVwk297qJitirk++iy4pxjNmAVg=
X-Received: by 2002:a50:fa92:: with SMTP id w18mr1075592edr.44.1606930905484; 
 Wed, 02 Dec 2020 09:41:45 -0800 (PST)
MIME-Version: 1.0
References: <160687065946.3791.11439184384818467145.malonedeb@soybean.canonical.com>
 <871rg87l7h.fsf@dusky.pond.sub.org>
 <CADPb22S+3j_zpd0iVo=MNPO8=txhYt8iicBge6=B7wFq3ZO0eQ@mail.gmail.com>
In-Reply-To: <CADPb22S+3j_zpd0iVo=MNPO8=txhYt8iicBge6=B7wFq3ZO0eQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Dec 2020 17:41:34 +0000
Message-ID: <CAFEAcA8j=zFdN2G43snWPo72JL+PR3F8O4wHJgL7MOSGp4yv-g@mail.gmail.com>
Subject: Re: [Bug 1906463] [NEW] "-device help" does not report all devices
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Dec 2020 at 16:51, Doug Evans <dje@google.com> wrote:
>
> Btw, if I may ask another dumb question, I get this:
>
> @ruffy:build-arm$ ./qemu-system-arm -M virt -monitor stdio
> Unable to init server: Could not connect: Connection refused
> QEMU 5.1.93 monitor - type 'help' for more information
> (qemu) gtk initialization failed
> <exit>
>
> If I add "-display none" then it works, but it's odd that it's trying to initialize with gtk here ($DISPLAY isn't set, there is no X present).

That's expected. By default we try to create a GUI window.
If DISPLAY is not set, then that fails, which is why
we print "gtk initialization failed" and exit.
This is the same behaviour as other GUI apps:

$ DISPLAY= xterm
xterm: Xt error: Can't open display:
xterm: DISPLAY is not set

$ DISPLAY= firefox
Unable to init server: Broadway display type not supported:
Error: cannot open display:

$ DISPLAY= evince
Unable to init server: Could not connect: Connection refused
Cannot parse arguments: Cannot open display:

If you don't want graphics you should tell QEMU you
don't want graphics (eg with '-display none').

This seems to me more helpful to most users than the
alternative (if you know you don't want the GUI then
it's easy to disable it; but most non-sophisticated
users do want it).

thanks
-- PMM

