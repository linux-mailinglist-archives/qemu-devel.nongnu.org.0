Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A4E4BA
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:26:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58395 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7Ex-0007rb-Ea
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:26:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44023)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7Cq-0006n0-Bq
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:24:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7Cp-0003Wv-JP
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:24:32 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46303)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL7Cp-0003VB-Dk
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:24:31 -0400
Received: by mail-oi1-x241.google.com with SMTP id d62so2551914oib.13
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qfL/jiZiaa1afIbW1Y75/pGT0ejZ9b3bDsD9oyWRqKM=;
	b=m2K41pSVQHcMoC3tIA8n9vWY5CegFhwipq3LQzUqo5qHgvoGF1DIXI4eHUjKyxPL1K
	3j2j3Emzcq1Qf+NX6JPjYKIrnFSc67KB76haQsWqscbFOl1PWOMa0SvfeEVbV5L1ANoL
	YZawy1FiwcbS/uaEYXsyKuxg94SMWDLhSkLRDOwbHDi5ITBepPoMS3A+pEV6+GHDu+Mp
	OxcNlKWZbM3SOeefnG6aBkyqMvUWqRK0hZVobY0otS0rMlN/mVmqCn+2JE5ay7FypoV6
	11Wu0yX4ThFM+cVA9jcaZcv3AG1Y64ChuZSpu/nuCPIcdy8Kj7eef5kIjW/aX1RxrgCF
	ShNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qfL/jiZiaa1afIbW1Y75/pGT0ejZ9b3bDsD9oyWRqKM=;
	b=CZyGhjDg9T5YFwh6ftQS4zJNuQ1vummdZm+bXLRJi0EyVqF4SJVEkgKa2XKuUQDUbr
	Yl5hlj2i/pZ6+f0dTjxlZtxKscb8VJss+mrR1DNWFrVSVFA2fdpMGjuNMmwDrAyOpsZz
	IY9hD6mAzukjsx6a1TBVX3nbtPZ+DRp6Xg1uUOlcNNtXmWLV2DLL4YZLW9HZlDRNkXh+
	0DWh5+6ypbV1CqzW9EK1ckACL5OSaGunBOu1tXLjN91s++xh7tyAVcxq2YPdzpzkIwym
	G0oT6kXMtj5VkU0umcvAQ6NpySeWAphoopDvN2OzU+Yo/+cOdZJPUlNRqfKsHu6XgAea
	dNPw==
X-Gm-Message-State: APjAAAVlvSznZJ2l919JHnyqHPAEgFIRu2j17DJP3615p4F3js8xTwoK
	7I3bnb+KBGgaQRiruftuyd7Xumvh25PfncaGMO7eBw==
X-Google-Smtp-Source: APXvYqxgEmoWt7rb5zO1N3C/Q2W/vF8y24SS4Fl1ORYmNcIXpPmkzXp2oY4L+eJqOLSzPbvOeQDWOKVIDdASY1nxQoU=
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr16940405oif.98.1556547869435;
	Mon, 29 Apr 2019 07:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-26-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:24:17 +0100
Message-ID: <CAFEAcA97ksktpBxpAtTB+WufL0hosBm1n2k6X=LurHQQMO14bw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 25/36] target/tilegx: Use env_cpu
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

On Thu, 28 Mar 2019 at 23:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tilegx/cpu.h          | 5 -----
>  linux-user/tilegx/cpu_loop.c | 2 +-
>  target/tilegx/helper.c       | 2 +-
>  3 files changed, 2 insertions(+), 7 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

