Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F4E4A4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:24:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7CW-0005fy-47
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:24:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL764-0001Qy-6r
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:17:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL763-0006bm-9B
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:17:32 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:37085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL763-0006ba-4u
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:17:31 -0400
Received: by mail-oi1-x22c.google.com with SMTP id k6so8412139oic.4
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WKH9ZHu8AjI4yKR3mtjzaKO+1JQPnurDJ+Jmblln9UI=;
	b=oZWCMAAzQ+Y8p+JwL2AIbfIF00mAEYOF0Njl3XoOlqOggrQsqNNVu2mJacS98OXeHg
	oAdzNP5Eeiw2xhnTanYOixTNyXhRpyLY4Cv8+xOk5HX+pK0Zj6x9ntvHPIODZIbNqCEE
	kRfTvab+rw9W73cxvWn/XIKxmrdsZm2qoKlgtvIO5QwpnS0Hvc89jbc6DMlRF5ZFLf5t
	+7xGuHwJdjqKaBaKTAmAAEgkgc0It/FYCxi8OYaAjAuEn4XO+Vwb8CSui3+um7of+ObV
	kblP17Jg1pW7rgmAhnhBiKDBzKvd6/Ig3qws5+uY4rEBLB5xCwmr619cTcti9lbhZqTH
	JRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WKH9ZHu8AjI4yKR3mtjzaKO+1JQPnurDJ+Jmblln9UI=;
	b=J76yixxC5OcSdyA0iJHJIKAjfbTgkPQfGU+2d36dDoSX/5hj8VEn/exKIqxcSQkzRc
	nVKvAAYJtMfGK6emlCOk6FWAs+qv5ZbRp0Qrz8ilWuDOhAbnA4ep8PCBkPIWbVTa2S19
	I6eUJvxS9kdG2rPeWtIqG3YvVzqW0MitY2hCC4Dl7e0bmYU3BY4SxTCj5kDyCUJlZpF9
	Uenv1yCiSydIz2P3zel9SyTaJtQI4gclgkg2ztEv/L4LRPycAxop1OeeT11lEwx02sNq
	sAxTvs1iorf+ax4/5St1vi1n9WDia+Q8xEdm1w/wo3EKFUr0uJeNlLyANGWhTgk4/Kjg
	Xhiw==
X-Gm-Message-State: APjAAAVTLOVtZc5XcQmbf3ymCNHh62J+eR245rShcNF0DhguixsEauYH
	iF3/IWpEEjSi/GXRmpTDBTvRS11QuURL4JxXgYZUvw==
X-Google-Smtp-Source: APXvYqzJjP9HY6nTJDic1sSS4qTYihlyc8VC/bM1H6jHcJjesLtfpUp8ehUpZ1f3hIjWH6e7blQqCJH/PU0wGXVhiKw=
X-Received: by 2002:aca:4c88:: with SMTP id
	z130mr16342779oia.170.1556547450527; 
	Mon, 29 Apr 2019 07:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-20-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:17:19 +0100
Message-ID: <CAFEAcA_WHjcChuiZ7WYfUE6zu-N_J7VXBqz_4esjtzxefVyDSQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::22c
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 19/36] target/openrisc: Use
 env_cpu, env_archcpu
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

On Thu, 28 Mar 2019 at 23:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

