Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F99E207D8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 15:18:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRGHP-0007Ay-82
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 09:18:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRGFS-0006St-83
	for qemu-devel@nongnu.org; Thu, 16 May 2019 09:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRGFP-0005T5-7I
	for qemu-devel@nongnu.org; Thu, 16 May 2019 09:16:38 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRGFP-0005SN-3F
	for qemu-devel@nongnu.org; Thu, 16 May 2019 09:16:35 -0400
Received: by mail-ot1-x341.google.com with SMTP id i8so3332526oth.10
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O+6vKJ7GAjY7d6kcEgv0b5n/EE6r45U61pCBh98Ot/4=;
	b=aZT9zhn0qxVaXBWYPTklFvLQ7U/1ggDjfs34AXe/UR0rq5Q8C8hOHA7Q2fK/b2pqo8
	0pyNVf6C2moCd66i8OpgdEXWKgIGWbe02nO8cInWf9ObFMjrT+vRQ+/eOx9Sl0IioxMc
	HorE7/F4GYw8gL2nskm3KnRqpcfASKjEWEjWZ31TDjXzFshjmNOIAWVabNZSX2nUXTFn
	YlvnNud/6trYvpL1xkaozMka1AzxnpuMnhiJ/cFMvv9cR8qmK3pamaGzFq7PnAGCKXDW
	i3GPKVP1cCd/HVgUXhm118tQjeeOZ/kHhmA/RdkO6azcd2xfvuevGqZ2dyru/+ZldhCX
	mlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O+6vKJ7GAjY7d6kcEgv0b5n/EE6r45U61pCBh98Ot/4=;
	b=ioFgee1ThzeGKDSxxYy47yfmvqwrmOLZlcCLM/J/Wh4yEqMHUmp22mACI8F0xyC+lh
	3Br9QwOKwPUJ75p6OZ5akYUGoN02V4sOpstU42K+0NjcFPnNYrZ4HoECW7p6Q6NvYbb/
	soe5ccYfHW/WMicmtthdLEjMNwV82QNPUf8nnW5eL6hw6K44qFixC7iU0fgKV3IP5TqF
	Q08lKOqlecms2bqc1mt8WY9l8Sh5EGkP2NvS333tXHZXPG96q9DBPlCi66sXQ6UafnLN
	YDzN8C5DrrUaLwv7QRGSCearhLw3tlOc5i1qhr/WVcmK+wxu4qoRXr6GoWsd3T6rOCi5
	5FFw==
X-Gm-Message-State: APjAAAXxzGWqWlQ6wEwGGesZDnRDl7Q+0wO7HMbXSsrcRN8dcrqddzmG
	HjQyUrfGLqjPaOVZPOO/5JpR3TWLQ9fH+qsBZTf1Qw==
X-Google-Smtp-Source: APXvYqxGdYLi7fy6KBEi84JK7BmiFwOciHn4AYnjYR6Yja2YSvoEh9j4ZZMTM9yXtlt3Aw+s8lLd+lFKD+85yMGwlHs=
X-Received: by 2002:a05:6830:104b:: with SMTP id
	b11mr79162otp.146.1558012594407; 
	Thu, 16 May 2019 06:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190514011129.11330-1-richard.henderson@linaro.org>
In-Reply-To: <20190514011129.11330-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 May 2019 14:16:23 +0100
Message-ID: <CAFEAcA_Nj+C+FrUsW_e9Eb9Z20xRgLvQjKWqX_dFxXAvrhwLLw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 0/2] target/arm: Minor bit field
 improvements
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 14 May 2019 at 02:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The tcg extract2 patch on which this depended is now in master.
>
>
> r~
>
>
> Richard Henderson (2):
>   target/arm: Use extract2 for EXTR
>   target/arm: Simplify BFXIL expansion



Applied to target-arm.next, thanks.

-- PMM

