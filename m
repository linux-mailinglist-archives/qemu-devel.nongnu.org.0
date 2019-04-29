Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48929E4C1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 16:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL7Gs-00012E-FO
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 10:28:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7DJ-00077a-3k
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL7DH-0003nF-5X
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:25:00 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45246)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL7DH-0003ko-0t
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 10:24:59 -0400
Received: by mail-oi1-x241.google.com with SMTP id t189so5393423oih.12
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9tnbcsQ0HZnwVTy4IlO9vzXGK3UXS+VRktZ/9d6d5Og=;
	b=OQdv6iHzPS4J7z3qsnDIUmXzFTnTWy9YgL9TW96gEisMruYE3SZ/j3l+UbEQnmThwy
	gWmWQ58GSHVycO/gQyugKKe7x4PE2EtDdfkd9bopQUpv6QWaW3EgGnz2r+sbEovC9U8W
	yqlPWKOUSiZo7uPg6FBga7UmqI3ap4pxXmXl8zWiveZY5Uv173oX117Yi615KJfWUus6
	twgVX5MvZVp4y29jRFZxwwaqD06/azUt36rQksoCcT9bQ7/v55jIppncPuI+WeAPP9r1
	N/kMEZOIUHRqr4PCXsY8uEb2chUHtAQiUGCwEYClrntUWcNxL2IRJa4qLfthrE9JZyr6
	Rhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9tnbcsQ0HZnwVTy4IlO9vzXGK3UXS+VRktZ/9d6d5Og=;
	b=QB1eTVLMZ7aIgcYNPCmHx27ujgUJG8qe/7AZz0XPWpg2Wp22mucOSMVoLi2YdYQhpC
	HzoNrbbdrmBb5W3GjtVdIVnSi9JxyTIUNAWAuyTKsdWA9yjHcq3zrYDww0DS3VF6L1lM
	DOnYcGDEQE5wyqxM+q89nx+r2TJmwQkk9whSeBDwD0gdNgpeIzqa4BzN+FTHjTQj1qGq
	9s81TznGd8eSPdS/t1+Z7aWYD2WPQODiP6kAyuNLOSK3Gj0/IuVWAgujtWmqI46yDGgb
	ycENFBjkfAK+IfaTBOiy0KZl5GzbLyGkEkRiOPYrhaIvxJBUWcrIC+5+HuhZ8Frr6cXC
	DVQA==
X-Gm-Message-State: APjAAAWxZi+kKX7dCmyoVWFYfRnFKVMpvruQ53BAtOgm3iYmajcmvyDH
	4uuvnNxyRUNhE9yNxo4VB9r6aZeqlFspUgcTOa6Zb1cnZRA=
X-Google-Smtp-Source: APXvYqwkeWrllw46VcB7KmQTJAkC4lkN4XYg6LAZ+OihIN7H7dKiQ814KNDa8yyvSzhUKkitKvrcutlg6p4R5sasdNY=
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr16941968oif.98.1556547894852;
	Mon, 29 Apr 2019 07:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-27-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 15:24:42 +0100
Message-ID: <CAFEAcA8AzZCGVyGqUpc1hck4rrBiuUz1atuwLiteyk_ukNhhEg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 26/36] target/tricore: Use
 env_cpu
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

On Thu, 28 Mar 2019 at 23:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tricore/cpu.h       | 5 -----
>  target/tricore/op_helper.c | 4 ++--
>  2 files changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

