Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA101BA3D5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 14:50:38 +0200 (CEST)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT3DZ-0002A2-OI
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 08:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39876)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3BY-0001Dt-Iy
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:48:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3BX-0006sX-Uh
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:48:32 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT3BX-0006rq-HU
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 08:48:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id z25so25813067otq.13
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 05:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VlVCePSTJzod284xyJRzdxgFggzq9lvdnOL42DRIy9U=;
 b=bmhogtxGx5wrJ4xw/MBO8z+5DFkn3Q2Z48ovWPFTqRegKEhxnWxI3Nz202QZnQMwgq
 jCsLp/Nygrb+5hscrZOPPrRsq308g/oZpTurVqfyU7mrwJyDckjCopIXQCB3sfffNskr
 J74NEiT5us44l38PQcZd0T0QOWdLK0eaikja1XmyRCwqippFg9aPSxX41iJS2pUgwdzu
 VmDaOS3/zZ7p21I79Idg872f9tl7N0cMJb/yD+7CbHZo3HlYx3I3zMyZnJMIDQjgij1+
 DI4vaN0xNkgAihSTZ76PUZ/VieZ/cWZB+ov3VlR0bK3E+X0kEjrMz5D1SAtF0y5ttvKp
 InVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VlVCePSTJzod284xyJRzdxgFggzq9lvdnOL42DRIy9U=;
 b=LrwJN0imsG2E6GNC+z1bQGbkPfut5cvMOaDKbryOFCsMOEnSeHhpkeHDuk1b1bGDOB
 oElsPo2OPYrPL1RwXK7Ell0wxZZsTK1iG9TUoagGqYM20E9GXRfZYm8fCdvYSw43sL8F
 fvkWr1RvgvMELel3eK7N+bDYmiH1kL/JseLmb2VNKKdcYlT9f2T4jJB7miUnuSxh85nG
 MrD7g7QVxrubeLBGpx3eHlfibYUXfM+bnyfFskDNAO/BwD4fvrs5Fo5YRgwCJ/vzW9Ng
 nYRLlxrlX03+Puek+Wmqo/Xo6t+EdxG6QxjylPANNNq9l+VtJhm8b+QmpdZgj2l8soTQ
 pilA==
X-Gm-Message-State: AGi0PuYltNa/+ZE/5AtIRX3SH+zJbH5nNCA+Wls5kUDoPYJhL8yEdM6k
 stiYwsoOAfSKIftcSfeXodOIxjfa5+44XPk+M+REvA==
X-Google-Smtp-Source: APiQypId6yckRXLg6G3mM4ZKNzyefBZ7oY7IXxPSpH2GDZFX30uzpY4Z1vMOyLftdBgrzYvOZQQ3r39vWRBjfiiEcIw=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr17233725otc.221.1587991709920; 
 Mon, 27 Apr 2020 05:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200422172351.26583-1-pbonzini@redhat.com>
 <20200422172351.26583-7-pbonzini@redhat.com>
In-Reply-To: <20200422172351.26583-7-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 13:48:18 +0100
Message-ID: <CAFEAcA-cUm4_t1uVE7rACNLCN7dNOD4w62DbFNVxW_FuBXmDBg@mail.gmail.com>
Subject: Re: [PATCH 6/8] run-coverity-scan: use --no-update-tools in docker run
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Apr 2020 at 18:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Tools are already updated via the docker build.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

