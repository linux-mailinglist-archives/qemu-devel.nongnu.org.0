Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52435E7A6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 18:22:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL93E-0007d4-HR
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 12:22:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL921-0007JS-Qe
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:21:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL920-0004P5-QI
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:21:29 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43184)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL920-0004OW-LK
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 12:21:28 -0400
Received: by mail-oi1-x244.google.com with SMTP id t81so8764829oig.10
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 09:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VJVL6BPQsrCJJueZOike/rijh0mL7PdTU4J2YQQx9kg=;
	b=f9Pqgb506sPzwLukHaFLxBEeick5GdOnqV89HZ52Rx3E+QHSvowZihS57cWVzBFzWy
	VFa3uN62Zv0t3lnswSuiSGJdYjTWjMRsctYnfeZTjx4PPvlxkKIUSTO1MorohMm1h53K
	ktXxp+HBqwLvRAJU1l/WEqTMPclLhwjM5DqOEMsbLUnbJz2j/CgEmW9cRHqOuWn0cClq
	oyTZf2RFJUZE7tbgG6IZlzM4YJP2mGqp7e/yjOgBW6BaPQ4FLjSZruoxtezzbLh0qPLz
	dI5P0N4lPzHfHDWbYe9FYR8trHf9Od0odbVnQcxz/cUXgwQDZhDLvj3dVu0s6V5LctFn
	k4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VJVL6BPQsrCJJueZOike/rijh0mL7PdTU4J2YQQx9kg=;
	b=RuRG3qeYYeVFQA87Vr6Zp5NaxqGbj2urg3IW1j4aJxBgUuVRmWC740ojv/hRGwnjR7
	vqbz3FIx2aUG5Y7wx/30nWGj1KP8vQuTerHedEvw/qRYO8T5aGYn4yrEuzc4cNwVPDof
	zx3ZvtCTS3isyJ0x/OawWNe/xMQ2IJkbEiLOFGbfnv1ztONC4kdTah5vjzOnD6Put4be
	kC/tzha07B0pLwSUJT3mN3EX4glQma+tj1s6jrwv9tYzKG/1UZj6CPTR3ymZ0EudOzKB
	UMoE1qSMsMlHn/j/Hev5oeVeGxJkWCmx+MCiK0UOK0o6SXei5Jw9XhRCkedTSuYw3pAD
	QOZw==
X-Gm-Message-State: APjAAAVTb+KBM4GJos0XgrrJLPGcOddMsuzyCV+guF9Puhys0v8CUgq+
	/gxaGDcb69XudjIS9hraXvN1HBrpHg90+nt70t9c3A==
X-Google-Smtp-Source: APXvYqztsDIOfo73N/jc8KehmvvUBvc3GuNI+cWZAZ92xfhh6xYADUtHNLcnDGFKFfXl/uL8K9oFy3zK4tPFJSvJX0k=
X-Received: by 2002:aca:ab12:: with SMTP id u18mr4189054oie.48.1556554887971; 
	Mon, 29 Apr 2019 09:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190330005900.17282-1-richard.henderson@linaro.org>
	<20190330005900.17282-3-richard.henderson@linaro.org>
In-Reply-To: <20190330005900.17282-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 17:21:16 +0100
Message-ID: <CAFEAcA98_q1yx==QkHO1HiJA8cJqGv8k5OrCU5W=dC3ZWNPY=w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v4 2/4] linux-user: Set PAGE_TARGET_1 for
 TARGET_PROT_BTI
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 30 Mar 2019 at 00:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is agreement that there will be a mmap/mprotect bit,
> although no word yet on the value or the name.   Invent a
> name to make forward progress.
>
> The PAGE_TARGET_1 bit, is qemu internal, and allows the
> target something to query from the guest page tables.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This looks ok code-wise, but we'd need to hide it behind
a defaults-to-off x-something property if we wanted to
commit it before the kernel ABI is fixed.

Do we also need to handle this in mprotect() ?

thanks
-- PMM

