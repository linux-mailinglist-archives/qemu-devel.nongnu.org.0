Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190804502C4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 11:48:50 +0100 (CET)
Received: from localhost ([::1]:59112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmZXc-0004zQ-V2
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 05:48:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmZVl-0003K6-Hl
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:46:53 -0500
Received: from [2a00:1450:4864:20::435] (port=41518
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmZVb-00038I-60
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 05:46:53 -0500
Received: by mail-wr1-x435.google.com with SMTP id a9so3544986wrr.8
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 02:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8EJG14aFip/4vbpZSE2jJAwy2phleNBO8/XT+k2kP3g=;
 b=pCFZRjRFEyiJGUdw8kVFO4MyCflGf/oT7152aQUm/mYNav3wCf/KIp+dDD3ycSvy+I
 Lc2bnCgOEvagADqGnaL1HV+ny+OSExbouPRMAff/k4kIyy+lGRdgA80LmZ8yrQDol+Vu
 FiZ0vtN3zuOezkSAkQGpBt71KR/m9RU5Qme0BT+i2RlNWygCLMuVlgUNHf7qkYscXyo8
 nOLRBbmkiOB4eCSi9v4zIMEDm9AkEMNS4363L1lou3PtHQHxjNmHQrKjPc2bN71uAcCv
 qK6y1kEbaPfHkSkDRXTZan//TFDtoFyskrPVlRnI/G0BpTtWPKVlJJwBCxPaeYiidl7+
 UVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8EJG14aFip/4vbpZSE2jJAwy2phleNBO8/XT+k2kP3g=;
 b=zcdfxFyNdp96ZCR8YnXh2bw2b3WYpJYUrjWsMgKazIQiYEbim5uM+cZj5nq+GC04iT
 y3xPdVbHnHxWiZ9yA6ZzSZZlAGaAjjpUqh72MRIUYPYTFEMdWJ71ffJZmyVgxWSgIMu7
 a8q9BO/MhFbqWggM3ODKp3b1+fQahUKvXZX94ptBeCicqb8BWyjLTxYJlfTPCug2M34i
 vu6ug2G+h2JouWJLKaRwuiELb1qmTh/5ANKgl/erSJ2Wor+OZWYCInC5X/RijCFI8nLO
 80Oc8s8EiBC4Lm1TfZGWv31dMdkbPCNymBHz39WuL8hXKaXvQ7yXOKmhW4e8pj0nBsoG
 kp8A==
X-Gm-Message-State: AOAM530JlGbe6X4PeknplrERdk/q+e6z9ghb1lz7J/qLh8dcd9USLU+8
 0Zxg0+qubW9grierZljveNEIM8XjJjpeFqAk/ECFNA==
X-Google-Smtp-Source: ABdhPJypmN7jH0I/LsD4hcdgmVyI37Kku5pUL57WailFpJqY+l7W1NNq8928wXHpAqML6U2VA8wrFzqx1s7kFsxvROk=
X-Received: by 2002:adf:e984:: with SMTP id h4mr46566631wrm.149.1636973201245; 
 Mon, 15 Nov 2021 02:46:41 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8vRNC8RTAAxgYzZsGdqGfzDSr3m0UXmeZoF115z=6N3Q@mail.gmail.com>
 <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
In-Reply-To: <8639608F-1685-48B8-B965-255D30B213F8@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 10:46:30 +0000
Message-ID: <CAFEAcA_SzCtyDJfnJLLT57Xuf-TdJHRLEW00E7tQkdresxokMg@mail.gmail.com>
Subject: Re: [PATCH] arm: Don't remove EL3 exposure for SMC conduit
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Andrei Warkentin <andrey.warkentin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 14 Nov 2021 at 17:41, Alexander Graf <agraf@csgraf.de> wrote:
>
>
>
> > Am 14.11.2021 um 18:20 schrieb Peter Maydell <peter.maydell@linaro.org>:
> > This is tricky, because we use the cpu->isar values to determine whether
> > we should be emulating things. So this change means we now create an
> > inconsistent CPU which in some ways claims to have EL3 (the ISAR ID
> > bits say so) and in some ways does not (the ARM_FEATURE_EL3 flag is
> > unset), and depending on which of the two "do we have EL3?" methods
> > any bit of the TCG code is using will give different results...
>
> Do you think it would be sufficient to go through all readers of the isar bits and guard them behind an ARM_FEATURE_EL3 check in addition? I'll be happy to do so then! :)

That would be a big reverse-course on a design choice we made that
the preference is to look at the ID registers and phase out the
use of ARM_FEATURE bits where possible.

-- PMM

