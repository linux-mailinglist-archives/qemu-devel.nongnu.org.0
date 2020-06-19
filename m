Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D46200D1A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 16:56:29 +0200 (CEST)
Received: from localhost ([::1]:54216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmIRR-0005wb-0c
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 10:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmIQ9-0003cg-L9
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:55:09 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmIQ4-0004F4-I9
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 10:55:09 -0400
Received: by mail-ot1-x343.google.com with SMTP id n5so7509119otj.1
 for <qemu-devel@nongnu.org>; Fri, 19 Jun 2020 07:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+AVsDmzl/KPwBklkOCeD+E70faxKMAYgjL0ynrUExwk=;
 b=GlC96rCHuYx0paUwo84104eR+Xe5SpId3azTJIyvaYyiCqVw8hqJuOK8SFkAjHaSZj
 B3vRDyYkdCtD7cDazn2XSj577ZSwLoScl5M6OWudoglTxQ09Ydrs9O5RZvHxVEweXOKV
 IvHWprEK7I1wgeN7BoIMxC49wWfPSNH2+EsIlDCitEuNtbGTlXdLKBPdFmcYH1yssPvr
 LA4xHROLmTTNWfDOJD6Z+snhvH6ryztcHACMwBC9MYxbho6QFPEvXitJ2XdIcFu2TBIs
 Pii+inY7PTbY/0Vq93GXcX6+Q4I1RRCfRDW7CSMDYa+NBBHHGf0HXvsJpxzA13iMrKnl
 rgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+AVsDmzl/KPwBklkOCeD+E70faxKMAYgjL0ynrUExwk=;
 b=NvcymBrYmFHtg5Au6wrkgERcJL3HTZrlH+XQqVTW3IbjeABHRbn58XMUSpc1JMkyzN
 OF1HauXD4cjTm627yUBK9zIqOar6GPE8Krax63o9aYCtUXONxNJ9SfKBqijJi/l54TRA
 iGIMtpkKZ52ESarHokPKqLxVYbsTEMFiVrMeOa808ZgW37UNoeI3fokGN+TzOEPlQtEc
 oa69nSnawQcep2yOX5bFwkO2njJq2Umwjc/Jd5sHjsKRfrmBfpMLbrXiIdjuk6XyKHxS
 2eMaHSip/ySIyNhfSybtmvDVkEo//lWTMQ3vVLA2yNQNjNfSBA7qS7kpF4fT2nxo2zVO
 BMXQ==
X-Gm-Message-State: AOAM531Sv1WhLXR2Df/2F7R8X3zwgrN200/P/4lU2+TSisfN8F1aVbom
 15DKQo82YxIQ09t98BueAu0gLww1Fmfs6KJ+nuUb1g==
X-Google-Smtp-Source: ABdhPJyV7enVCm/5TAjEydQ0b5xYn3sNUc1AxELQmm1H5a2XCeqgYGMS9MX0R6GODjRH9OIHjgUa0PBS+PtIIpI1Sj4=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr3163742otn.221.1592578503237; 
 Fri, 19 Jun 2020 07:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200619135844.23307-1-alex.bennee@linaro.org>
In-Reply-To: <20200619135844.23307-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:54:52 +0100
Message-ID: <CAFEAcA-KX-2zjktg9A8dPdo6RkxtafM7YnahKaP=uftCO-7=GQ@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/devel: add some notes on tcg-icount for
 developers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <dovgaluk@ispras.ru>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Jun 2020 at 14:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This attempts to bring together my understanding of the requirements
> for icount behaviour into one reference document for our developer
> notes. It currently make one piece of conjecture which I think is true
> that we don't need gen_io_start/end statements for non-MMIO related
> I/O operations.

> +Other I/O operations
> +--------------------
> +
> +MMIO isn't the only type of operation for which we might need a
> +correct and accurate clock. IO port instructions and accesses to
> +system registers are the common examples here. For the clock to be
> +accurate you end a translation block on these instructions.
> +
> +.. warning:: (CONJECTURE) instructions that won't get trapped in the
> +             io_read/writex shouldn't need gen_io_start/end blocks
> +             around them.

I think this is backwards -- instructions where icount is handled
by io_readx/io_writex are the ones that don't need to be marked
with gen_io_start. It's the i/o instructions that don't go through
io_readx/io_writex that need gen_io_start.

thanks
-- PMM

