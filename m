Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7626D142C20
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 14:33:19 +0100 (CET)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXB8-0007zp-I4
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 08:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33499)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itX6z-0003li-AC
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:29:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itX6y-00017n-Az
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:29:01 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:47040)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itX6y-00015T-5Q
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 08:29:00 -0500
Received: by mail-ot1-x343.google.com with SMTP id r9so28656895otp.13
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ChVC8epFvp9yroNPOgv7CIpFELSfZf98laZCvjQinEs=;
 b=HwKvzCLsZavrptVD2kwE0XEnTy4M0OHQAtTMuNxHypRWKD44rZGb1LE08n8qaskoz5
 c0kDSswcTSuXZxZ+85uIq+vOCTa9402VlQRCqvD9QbqbZ0xIR5l8hZPV4WxIUyzMiXTQ
 EloxY8D4J7K2Zfcg7NRXx0VXiI/WOK0SgMwaKoHGW6wfzs65WpSt/Hza9BU/OVfxFYDo
 PJw/nbdn/ofGyefxsco8ywAdTCUTahfjNpfZjK8dMM1aLJD6Gf/kmIyRTPswTXJPaz5M
 snMagB81J9ViBHBohVV9jvU7NT9RklwE8bKHEfo4TvHWiC1NVzBWfhU7hqIvz+pigUZl
 g3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ChVC8epFvp9yroNPOgv7CIpFELSfZf98laZCvjQinEs=;
 b=kACVi+W7fBBAAZUz2G8ZkByyvdBZVbSQLf3aZKXmhsHB8pJHcSrfJ6CIe0jj+h6NHE
 uDpqZ7MnkjUJojYmRd8fpewoAAFnX8UeB0lpBpEI+b6nh58cZz3c4HSr0lOEhmo2k9m+
 ZoqHX7lNdpG4pkYvY5cVl8cPJzv5ZvOZhQBPsUrIFdMlon+iefcF122TtlnRpnPggA3H
 SknrtJ8YLjfqSKnr6D9vMfo0dp6b/fCI2MzTG7+BXuDHj73S8/iln1o20KmsggkmoQRe
 TPGXHqBP8zC9ddhMq56eY52BnsY4ulOxDEx6UfoTyhlpR2I2qnmthBrXVxUqKHRrNFC4
 WimA==
X-Gm-Message-State: APjAAAUbkE4X+ns1nAgAVa1sOM+MpJ4AiNewoPaXPGxCyVXwEJ9lhiZp
 Eai054Cv354kUwTediER8lpJ6uB12iNatYRhKTP6pQ==
X-Google-Smtp-Source: APXvYqxg57LTTiv1oiW3JvS063ErA+gqRGbp8hxTwTb4I56EZODhkBcaolMWF+3DKkSCyC3gAD1Vh6wTVoaKOAwqJ10=
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr15878523otq.135.1579526935737; 
 Mon, 20 Jan 2020 05:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-2-linux@roeck-us.net>
In-Reply-To: <20200118164229.22539-2-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:28:44 +0000
Message-ID: <CAFEAcA9F+SDOGJDb4q44BYBw=0WJZXRGpncdptrNvF5X+Fn8Lw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dma/pl330: Convert to support tracing
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Replace debug logging code with tracing.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

