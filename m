Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB29F896
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 14:15:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46347 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLRfE-0003sl-Fj
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 08:15:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLRe4-0003Rq-HS
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:14:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLRe3-0006E3-PC
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:14:00 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38113)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLRe3-0006Dj-Hl
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 08:13:59 -0400
Received: by mail-ot1-x341.google.com with SMTP id t20so11671751otl.5
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tBFGrtCvRe3qXCdriNdtDe+GT5lrhT/ZfxDEF1Nm24A=;
	b=uxZ4kX3I8V2BSTgRSnOOUvVkTkFDxDew8Ud6xatg/vnLRLB/d7HxK/itZ/+khD+SCF
	JKtUcjqHTVz5D5aURGvg7iIK3az61WHgTAHlnwTdAJs05xpPwoa2DPrGYkTjhiBiAQ0n
	AJda37GjK30/HfQcRE9szZk9dxyguTzzIdGG7dJaOo9SQH+/8Q5REvBxwa80oa5rIELK
	BNF8udPY3Boos/fkO2pP+GzjE4H1Pzfez1ex7dEUVfa7bGr9KYm1yok/D0RTZgQtr1Rz
	Tp/mgvI1bfQnKz6jzq7k8SYpxKqJ24tcqgzgQPgBIhe2ldFUUrQjy7w1kNQobwpSSLav
	Qv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tBFGrtCvRe3qXCdriNdtDe+GT5lrhT/ZfxDEF1Nm24A=;
	b=PWQ6DJovO779schDyGBcuJ683i8qBf9Hl5tFftpee+XaOmNRQtdMIulQR7jI4RJhDR
	0ZmHfIj/CEMtF/OOpjYamfO6fO7MzXDdLJV6iqU9FoGqNvTiI0r9Tv0sVL3GM0SUNon8
	PU3ZDd5zXNHCuHWBGgHzSAwrNlmAPVrxNA2B8g9wbOJ5j/2SllZO9k3v+RrD8F6MjRLl
	XyxbLhTrIqCUIGtTUyKCJ1i+/zkLbUeRjPvsjt4no6hGG+9joLG7vIXJ3imOTPd0NUOU
	LR+idsqF5SBZ/ktVgO3TYu3sZYcUOXeXorerhz2zlsPa93jwzp9AvMoghTHlk1KgE/eC
	lTKg==
X-Gm-Message-State: APjAAAUIARbM+33MOTH7BBAfk3d+4QG2se/vhDfeYuUR1u11HZk8zZb5
	rZJny6BxG3LiVUI8I/pcghm7BcRhNxJiI3rZI0EohQ==
X-Google-Smtp-Source: APXvYqzl6T5tbe0NPgKuL6HaMZzVFMuvD5aWyQdbmVDMNPYGPRjeVzQkFmpET8aaa7FZ/ME2p1AfEUfWnfxgQyVVgwA=
X-Received: by 2002:a9d:6156:: with SMTP id c22mr12086101otk.363.1556626438544;
	Tue, 30 Apr 2019 05:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190223023957.18865-1-richard.henderson@linaro.org>
	<20190223023957.18865-2-richard.henderson@linaro.org>
In-Reply-To: <20190223023957.18865-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 13:13:47 +0100
Message-ID: <CAFEAcA_Uco_Uczy1Ut5RCETtXVxrRpEE35MKHv0mDPYZeFE-mQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 1/6] target/arm: Implement ID_PFR2
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 23 Feb 2019 at 02:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This was defined at some point before ARMv8.4, and will
> shortly be used by new processor descriptions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 1 +
>  target/arm/helper.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

