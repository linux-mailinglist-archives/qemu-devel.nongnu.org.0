Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80F63ED233
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 12:46:14 +0200 (CEST)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFa8D-0004lf-Vv
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 06:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFa6d-0003P5-K0
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 06:44:35 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFa6c-0002rB-4G
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 06:44:35 -0400
Received: by mail-ed1-x52c.google.com with SMTP id cq23so8349742edb.12
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ho1DLMyaJWl7WIJIh3nj7x+9iAXJ5+KyqaYhyvJxFFE=;
 b=nJYuOk6V4fHouxPHp5raf1GYHHtVwNtxyE3uENWAep9y8d0qUf6L/WlJbhmstHVkyZ
 hCz8k+Nb6Bw56enb5KReSnUzEvL/V2g1yWSj6DLtbnF/cg3Tcz8B/ALjOGi5WWCA6N37
 U2vrxr3wroxx49acyagDglQus8lQTxvHdgfiXDLQM3kOlF0lfs3+yD0uabZYrKyVy7Wy
 piBAad9JxYQERTJep0a3Jw+B8EGVs52OKWdSn6Bp8q4pNhIjOKjk1MFul0L4WHqNxN19
 hFmOnIdfGYz3/+IU4A+nWCbB2FroXeRfMdVXMeplruHrVTfmoSqAd0ib3E2ePVze8Mm2
 rr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ho1DLMyaJWl7WIJIh3nj7x+9iAXJ5+KyqaYhyvJxFFE=;
 b=hXmt2+Huq8V8WPYqdQls0UlAsTRZDGU3Sc8sygqKKWlxyQ7QGAQwDpRmR5HqamsfMh
 nkghP3OUlz19m+g2SQMixdsFYEi6aj9iyKXXNJu6JeEgMfSxRXMVVUaqVsKnVhIcgXzQ
 xwFS+CyqzhaJ3lqM038eCGUL/MHXIcy5W928wBceYxETryWSU1InPOgE1a1AGkb+up+A
 j47qJjJn6Efbz4tdYrnOMI0rswvKHyX/hG1R+xrznJkc+WR0AjcYnezLjOmyCqQ6Jy+5
 45kjRF8iD1XEx45xtIZpt4CHZ3B7SP7rIEXp2t2aI+U9R8NBAVrl7IQsqhuJYANgjiNy
 ZVGA==
X-Gm-Message-State: AOAM530ISNyXYwn21ateVKSc3Btn+APuGPYQ3FCEBahTN59+7ZHeW7Pi
 KWJ+pMD72RXD8quo1ef4Yv3ye2RTkiDcUZCS1DLbEA==
X-Google-Smtp-Source: ABdhPJxgqt5p2OND8a7aS58aOCJxpnayQN9lUW+BX8W3g11d1FepDdGlQGv+9U80/njctlzqkdzNOYkiA0SbD7M9nlg=
X-Received: by 2002:aa7:c4cd:: with SMTP id p13mr19088479edr.251.1629110672492; 
 Mon, 16 Aug 2021 03:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <4C23C17B8E87E74E906A25A3254A03F4FA1FC8CE@SHASXM03.verisilicon.com>
 <74c133ba-d318-4e27-76d3-11af5d72a214@amsat.org>
In-Reply-To: <74c133ba-d318-4e27-76d3-11af5d72a214@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 11:43:46 +0100
Message-ID: <CAFEAcA97tnmxZOQQWdkkCCe6UL_AwfBdohKXJzpjWye8ENra9A@mail.gmail.com>
Subject: Re: [PATCH v3] hw/dma/pl330: Add memory region to replace default
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: "Liu, Renwei" <Renwei.Liu@verisilicon.com>, "Li,
 Chunming" <Chunming.Li@verisilicon.com>,
 "i.mitsyanko@gmail.com" <i.mitsyanko@gmail.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>, "Wen,
 Jianxian" <Jianxian.Wen@verisilicon.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 at 11:41, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:

> So when multiple controllers are created, this makes the 'info mtree'
> output longer, all AS named similarly:

I think this is a problem with 'info mtree' to some extent -- it
was designed on the assumption that there's really only one or two
interesting address spaces, and with more recent developments that's
just not the case any more.

-- PMM

