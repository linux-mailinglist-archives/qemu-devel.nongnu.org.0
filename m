Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895184E618
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 12:34:38 +0200 (CEST)
Received: from localhost ([::1]:58870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heGsP-0001vK-5v
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 06:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35583)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1heGrG-0001Mx-1L
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 06:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1heGrC-0005bT-Uk
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 06:33:25 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46954)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1heGrC-0005Y9-P0
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 06:33:22 -0400
Received: by mail-ot1-x341.google.com with SMTP id z23so5783450ote.13
 for <qemu-devel@nongnu.org>; Fri, 21 Jun 2019 03:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c0tzWgBtY5Q80TKSqGILZ875XtrTUzlsD0Ec0rksDqI=;
 b=yhtnOGnOEcIn3TP8y2s2XasaiWYil7VJTofjR2kVBuYR6zn0F4pTelGqyvxHqQQFAH
 mdFEaLXClYwAycyrxQZY2k1OlKydzQqT8LMlfXKX4PsF5Px9ipRCnSqLA+mstV0MkWmm
 XIDy3AvP8voDV4gxQEoOoAqkSJU7xqRAb1ZN7hv3ASKlFx8CO64n1uH/ONvYzYH5HNXL
 2HICi3cGOlJ6TGDPrLc0x1Md+0htA0IEtKEkNeUyzC4CBtbpFVRB6X3sJ6cFRyGA3mCe
 DwbTF4dqLrqD36D4otfoNS4vH2CAKmDg/dA1pTSZk/H+KknmNcq6U8zLfBWPvazIWtHz
 MM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c0tzWgBtY5Q80TKSqGILZ875XtrTUzlsD0Ec0rksDqI=;
 b=QnXZLqGRaWd9n6BlP03syqzbVRyQ5EWm8kjDheG2nghdXi5fOzyQy/TWNnjiiIEyTk
 QVkurwDftU9hyOEs17e3F1HgEl/JQh3fKH0c6tNCA+VllqggI/FdM3g7pI5pOG5P9ho0
 P8ZetAIsi6XtGXmljbuIKNh2f4oCcowEtALNED+VcYnEcP5Mt03mP8x7mu1Mw+hWxsX/
 46Fs9fRT91Wh6PoTKeVJx64JEn3ylEObndT3jVNTVU4hgnOJrmXNMtz3eFauD7Ndhp83
 zvMRO0lIyrNt5DSEdal1x1VESjjqQK6RdNKHlpzwIn1872zPW42bCYRQPwRtBo5P2OXC
 ZgtA==
X-Gm-Message-State: APjAAAUQAOWnpl4LYi2q0ArZh6SU/Tr9ebnlbgwJJhtWNmprGRpNOUhS
 NYxwQaYDbYuFxxdUmfoOqUIt7aQTI6C+NtLwAjqbBQ==
X-Google-Smtp-Source: APXvYqzbNxgc83OYnmV345TLbsAwBw5ZoP2Auv2ydcxbpUZT6YPKYo504aLsXF7YFuJzxwIr215c8zJ5DYF1sPtikvE=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr5257398otk.232.1561113201153; 
 Fri, 21 Jun 2019 03:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190620222314.2670-1-wainersm@redhat.com>
In-Reply-To: <20190620222314.2670-1-wainersm@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Jun 2019 11:33:10 +0100
Message-ID: <CAFEAcA92m9n7FR2a6=ecnr5bn-Sq97LZRxHRuzWO-OcbdgA4fw@mail.gmail.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [RFC v2 PATCH] hw/arm/virt: makes virt a default
 machine type
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Jun 2019 at 23:23, Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
> I came across this when running the acceptance tests in an aarch64 host.
> The arch-independent tests fail because, in general, they don't set a
> machine type. In order to avoid treating arm targets as special cases
> on avocado_qemu framework I prefered to attempt to promote virt as
> default for ARM emulation. Moreover since it represents a generic hardware
> and its used is broaden advised [1], I found it the right choice.

Not providing a default machine type for Arm is a deliberate
choice: there is no single right answer and the user has
to decide what their preference is. We used to have a default
machine type set, and it caused a lot of user confusion as
they expected Arm to be like x86 where everything will run
fine on the default machine type and it did not, which is
why we switched to not having a default.

thanks
-- PMM

