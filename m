Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37738E4A1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:23:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7C8-0005KB-7r
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:23:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL77J-0002Qy-6B
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:18:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL77I-0007il-Eu
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:18:49 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:37062)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL77I-0007iB-AR
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:18:48 -0400
Received: by mail-ot1-x342.google.com with SMTP id r20so7609264otg.4
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dMBduNc5c7LKxiQJY0kAvBsbP5w54PKrskRMS4JG8Iw=;
	b=XmAZt2r+lS6VYDVajmTFnWdTsREW9lJNl6uuOzWxj0UNeBc3XUJ/heZ3PX9RWdCT+F
	EQzzEoIoqaI2/9urKAS2u4I/e6r/9QB0al1T4/NtlzNSid4lKy+GWZn0yaGfBGcjoOe3
	E4EcFKY3bL2QiT8i6sRfpMC5UIsCFa/GZrVSkTxXKdHtj3ChhQ9Ssufai+lc31TD0Cbb
	y1dhWR+vRpjdpyzaF8OzUDf6UWb7Cs8+wg1dJLWlou/4+sA8JSBV4ve1q7j8BIaTNC0r
	lHlkJeB/m+l5/ze6N6LTFCcII0DEV+9YU8Lfe0rifTMuWA753bWanbYOZmpNIVyx3Ook
	2C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dMBduNc5c7LKxiQJY0kAvBsbP5w54PKrskRMS4JG8Iw=;
	b=SrSIdELseDTjOf9gW7BSVsreIEm3lHq4VoZZDRH/m3XhCllF3dFr7zNaffApRTBGtK
	K0yNllbOeC3Sn5O1heDg5gtgWgezSsv3ohmlPHR37uO2eUxTo8b6+VM7wGO4YhiGW5im
	XTARhxbfEgKaaTu1FeoiIHcVwS3glDiFH6++3+S08nrsRa0bxEbCbiXguHn6EDGkbDC5
	Wb1tDhcwJrUMFxLa1t9csKO55w0rrKUSAnVtEpAP9x5mqgcnVF11IuPr4VTPw5o5tZz4
	+kpSbQkLnUXKyxw1KDhE9MCsEmBpyW0aSvU9Cx9K4zmh/4H/uAuSTOUXZLH5eNH0qzjx
	vvUw==
X-Gm-Message-State: APjAAAV0BvWncN08BoujlBl43REKM70VwRGTd2Qkir5wyTWTU8i47N+S
	okLw6JnjoHMTWacjUjNTiykpNqutKKGXzvGPBLddQQ==
X-Google-Smtp-Source: APXvYqxXjjIso7o1X0ko691H4aIikDdOx/Rw5SIgmnH9zJchOE5qGO8gZJM754axBvZxQXUicvg89uPpm/hxB0UvdgI=
X-Received: by 2002:a9d:404:: with SMTP id 4mr36530269otc.352.1556547527436;
	Mon, 29 Apr 2019 07:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-21-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:18:36 +0100
Message-ID: <CAFEAcA8Le7o76CObLNbCfC3-vAEVhgrm4igG-cpDt77A=+agtg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 20/36] target/ppc: Use env_cpu,
 env_archcpu
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

On Thu, 28 Mar 2019 at 23:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

