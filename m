Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4F035DB21
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 11:27:20 +0200 (CEST)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFKI-0004Mc-Uz
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 05:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWFAq-00009R-He
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:17:32 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWFAo-0006Dz-Ua
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:17:32 -0400
Received: by mail-ed1-x52a.google.com with SMTP id r22so18514762edq.9
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=79bFDYZNnBAikfBZ8lFTCnNvLp7vpgwawJsvrpvocVo=;
 b=nruTNhZezaau8YNB3xGOYG/mmcfaxdCYs+Nz2ny2J7W55rg3gkCtFlV5Vtzk4U9hcq
 d+iedcB/AXfoB/z6byYu4Zon/FjBz5WGoBFlDmiS64Y54bAUeWma4kWIFFkNYkrbHAJ1
 ZoHlkYl6khepflT81ACjXrKEPKnpktMZsUoiFfnMpp2V9Q+TfRb8T6SSPXt8I2RUxA5X
 ql20/zkdYS0wMS4fH+I2BbAS3VtN2Km7Jc1DoH0pWWVA7vlPTd8aP5D5XjZEpXYs5zpR
 712GOCXlLiMdgzTcRz7VHo3F0/OfjPftMZmtsnkhchyMEhWeiwiGB7HblFlhpsnfD2ex
 o7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=79bFDYZNnBAikfBZ8lFTCnNvLp7vpgwawJsvrpvocVo=;
 b=cAh2wgMJ9uh+KtnFS0HVFcxwCSn8dE7BDj+Li6ADXKv4yIBkCm/2cdkJm34cf9XrlX
 qQFT6PhZi8lP2cDiz9ODcJPjETBllY600tbLAEvist+2F3jIDFUJlMak1wbEM2eb5TZ0
 Yz0R5v+WZu66qskGpkF1FKVDKXLaddft/u9bnRzeXbrkzwHSbAbbtVsasUWUvxrIGLvl
 8F3tFU1VZ2WCMNBq00FmQAEnak+lJXYWSpytXNe6ou7BadtD8crxuasrKYMy7YC7U3Hu
 EFZ/7cvKmYydm1QuiXnqBGYc+tUktA37z2I8A3rBE8IKRQbAs4TgI6HE2tGqbsiZEgK9
 iHsw==
X-Gm-Message-State: AOAM531h9DcqTYdYFSXtWN88hMou3+fnG6ecC4NHDu/SHzaE2iN3ZXyy
 4H23Gv2Z8JlJkgturAzEidnmh5SKcIBeJe6GmgGAsQ==
X-Google-Smtp-Source: ABdhPJz15LvCHkk1fkWTkUL572r3zNWNyaoyoSsJCJE5ktDntpG/dBlOyoh8lSVDLZQvxiI1J/DzubrLOdoaAJahblk=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr33337530edv.44.1618305448744; 
 Tue, 13 Apr 2021 02:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141909.1992225-1-jsnow@redhat.com>
 <87r1jmzb1n.fsf@dusky.pond.sub.org>
In-Reply-To: <87r1jmzb1n.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 10:16:43 +0100
Message-ID: <CAFEAcA9DdnU7vbr2GB8HgoNMt1-QaTJr_sohZyT+RX-MVEfkcw@mail.gmail.com>
Subject: Re: [PATCH 0/1] sphinx: qapidoc: Wrap "If" section body in a
 paragraph node
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 10:41, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter, do you intend to merge this yourself?  I have nothing else queued
> right now.  If you want me to do a pull request for this patch, let me
> know.

I missed this email earlier. I had assumed somebody else would pick it up,
but as it happens I have a couple of last minute patches I want to send
out anyway, so I'll pick this up now.

thanks
-- PMM

