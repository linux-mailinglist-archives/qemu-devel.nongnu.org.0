Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE74F39C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 12:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLPbi-0007fO-Sf
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 06:03:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLPa0-0006yB-Kv
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 06:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLPZz-0000Qo-QF
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 06:01:40 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLPZz-0000QG-LB
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 06:01:39 -0400
Received: by mail-ot1-x343.google.com with SMTP id t20so11370100otl.5
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 03:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U+GwrWRHCBvmXJ+7cFR88HiAyigcUsYkiCeUHZnB+2g=;
	b=Eg/EgRlJh6U0Zz/rpafHirX2V+2f9oL2LABNX3oP5XaTgsOIyEuulGLfnRPYaCwo7c
	hv0D4B6UB3pv/yKTN1j5MaDQwM0qpSMgftAZpeSOqgStX2rk5ljzfTCN0qEKz0l7Y4Gg
	AgElWGuAJ0dHjP/qgTvne2i4YT9/+oWfrqftqtK8HP5jw64NQocr3+0V0RJne+7zh2YK
	PBMzFFPpHP2IQveiNSfREpabQ9G1HfYcJFB7TbeiUMfhxxNp5j2TmqwyCdMcIGA5sTkH
	+8LiuQPenQ5OtVsGLIF0ly6Y/p11HLBkTkfu2qRjN8DoBRS5P5HmkXhPAHos7ssyS4PI
	zK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U+GwrWRHCBvmXJ+7cFR88HiAyigcUsYkiCeUHZnB+2g=;
	b=hnrAkKTFP1o5G8pvpXksVC88a5CdKdTb0n8MmREpNJOPw41ZODFCcrOilzlQ0XYd+C
	NZ990PLNpBHetU1ZHCHQNZolUe1BPEE3qAMiinZ1zwvbPFa7Pe4Kv0q6c6lUYaNeUSxM
	qjNzNjJ+urWYlknENZm6WQ/qRJ+ewNXjZxDwQz9skue0YYMa0OlxFYWEQ1xXw4xWEqZ+
	j+jXpu5sGBOkjun4GnhwDfrXIh5vnP+0cXSf4AyF0Fi0UKT5eG42jkOHsSu73cDKErMz
	J8ikBwisY4DbBCp+pdVWrQKNmymDxsAKpRqgkhwtpf6GL7LHZLG8xGvY8AgNKoYHJRgb
	ACIQ==
X-Gm-Message-State: APjAAAWGg7MyS1zjmQ5qdKAjjU9pH/JcJVuH9xFaF/a0a5Y83VU0HrIp
	/NHXVlf5elxDhV9KYvIu0pNQj3dXk7v+jpzcXMzQBA==
X-Google-Smtp-Source: APXvYqzxFNsow/8/OpiSF5Nfvq5dbleb7knD4R9acGbK+va5xU6xF1SwmF69wtY2vptW1332Wvcn+kr193K2JPjyMmA=
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr4329189otk.316.1556618498784; 
	Tue, 30 Apr 2019 03:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-21-richard.henderson@linaro.org>
In-Reply-To: <20190403034358.21999-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 11:01:28 +0100
Message-ID: <CAFEAcA9gdgx5Ri3OmahgT68ViTzxhDhE5VcmXH5rYjjnNAWSug@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH 20/26] target/tilegx: Convert to
 CPUClass::tlb_fill
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

On Wed, 3 Apr 2019 at 05:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tilegx/cpu.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

