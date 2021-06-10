Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D233A33D9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 21:18:51 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrQCX-00069y-W3
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 15:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrQBD-0005H6-4d
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:17:27 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrQBA-0002ts-Oa
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 15:17:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id a11so869626ejf.3
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lSnoAq4VAGe7W/zHb7OUZQlahSkOz4MeC7zzXGjqNjw=;
 b=oX4+eZGzMSRaRrEoZI2eTpZbTUNklMaSz+d90p7i6nJeHt5nFE8VY2+FFuEJDNstyB
 63gwOtQUvMH0l8EnFmmUwZaILHoYIOktsQpTOw2GZqrZqO4h/e7rRlSUGurAl5skmfRI
 NSESBHLIUvXD0VWQbG77ZOEvGbNuHMwYH94GC3s/8d0mpTgnF682fMUEozydWRFtdjYF
 eDagNdvmXpXWs33KwhBYN09s7KPU4SFM969P0L17SWVEyxj7gfTxTB1jvI17gok11Scs
 xbR2ZxnM6hRgoqMwsJcEHQXwnmGA6YasmxdmRLW1hu4m5z/L1cydc4Wgsj9Au8qA54JK
 ui4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lSnoAq4VAGe7W/zHb7OUZQlahSkOz4MeC7zzXGjqNjw=;
 b=UqzUFmoTyHZJ+bY8LtCVsreXX9JyZTtyqGPJIco+pAJa6EsjKb/62ceuu9kxuxPNRw
 gpnstN30JsAtYHeBaql4Y/eCddudbL6nSGIJWt60FyPXEPlDWzbAM87SuI1QrVbV9ket
 eylZdQRiusZUVd2sXe9oO74sGBc2JyVs5wpPPnxFhZ+pX7fS0YHaYTaBJuBMjJuCNU1U
 2DghYm44Pqou/QyTvjxbxROdh0+nEMkZ9yVBA0bKzM0mTTwVWmMfU6BDNVyb5M4/qerK
 6C7RyH2aQvPLd92i90Sf6mqyCuMgjTsb8IPewR+sJ2McLopZxV01DrzN2lgiYgxMkq5n
 dS7w==
X-Gm-Message-State: AOAM531BSJL7wURMnFdEGHewQhInFvU62RZs8fNi77IoUimAaVbWbJEc
 WHPLwHTJSUIPIhChw0tmm26VtishaOZAVc+4HdDx8w==
X-Google-Smtp-Source: ABdhPJxIPjtOXzADVwLRkQUlSsZsiytAKt637zuxEVQFchsqT/rAgBqiaczeuAlpJV91PfyAdalqjW7yqQcuo+1E09k=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr139621ejy.407.1623352642781; 
 Thu, 10 Jun 2021 12:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-53-peter.maydell@linaro.org>
 <86d3ce3f-0bc7-4f71-c4a1-18f2ed3f15d5@linaro.org>
In-Reply-To: <86d3ce3f-0bc7-4f71-c4a1-18f2ed3f15d5@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 20:16:49 +0100
Message-ID: <CAFEAcA_pn0pNQTfzc1WtMJ3C9OuPPBQJQzt2HpfgOM0FKeth3Q@mail.gmail.com>
Subject: Re: [PATCH 52/55] target/arm: Implement MVE VCADD
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 9 Jun 2021 at 22:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:58 AM, Peter Maydell wrote:
> > +/*
> > + * VCADD Qd == Qm at size MO_32 is UNPREDICTABLE; we choose not to diagnose
> > + * so we can reuse the DO_2OP macro. (Our implementation calculates the
> > + * "expected" results in this case.)
> > + */
> You've done this elsewhere, though.

Yeah, because in those cases the op had to have its own hand-written
trans_ function for other reasons so the check was easy to add. Hence
the comment about why this particular case doesn't do that.

> Either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

thanks
-- PMM

