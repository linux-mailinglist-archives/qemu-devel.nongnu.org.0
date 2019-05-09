Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EABB182EB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 02:48:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOXEu-00043G-SP
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 20:48:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1hOXDl-0003kO-Cz
	for qemu-devel@nongnu.org; Wed, 08 May 2019 20:47:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1hOXDj-0000ku-1C
	for qemu-devel@nongnu.org; Wed, 08 May 2019 20:47:36 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:36352)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>) id 1hOXDg-0000bs-WA
	for qemu-devel@nongnu.org; Wed, 08 May 2019 20:47:33 -0400
Received: by mail-yw1-xc44.google.com with SMTP id q185so505830ywe.3
	for <qemu-devel@nongnu.org>; Wed, 08 May 2019 17:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bDWJ6p1ip166ops2ivqqYI5bMp7AXfnGVjt/VOtUpGA=;
	b=aMNYrQVxKvyYsIaK4CelDkbwBjRgS8NXfI3x5jzcmpFQVvlQuHMgSq4JHocm0P0lEV
	2xbVdI8J/asyNNC3OZeqQ3Z/AD/DfAk6w3ru2q0CnQlmqkAydZ7oBndJYX6jAT2LmLZO
	GowafSLuMpXKiK/zca2mQ4JhSOQ+P5Gao8shcbXwfgsQGkmRxQFwpMgnnHYf3G03zQFQ
	qxvLRTFa6QRvyC8Gvv8OmYdjMGfyQsOQVEwBoHe8lYoMLmwzYMZELylEkqFawzSQfY4I
	p4bjrpfv+fF/DzGG345PxXBPJfz0EhpS5xYCfjl8lgzjMU7kPSRWMgrf1vM6zOameSoq
	QHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bDWJ6p1ip166ops2ivqqYI5bMp7AXfnGVjt/VOtUpGA=;
	b=tE+x9my6ibdIRq43QFOBz0OKRmO1+HSGmJc8JTPNHaYATY7wN2T6Z7POqyTPhaXZPN
	tPlGxdKXdGBqu5N2MqX1g9bSl9W1ljG1zcJYXoiCL8gxl2TcT2xoZXgVLjjDZfdy/FtT
	XQDuJuEYU0G7iSF+Zg9DMxubjaC5cgnmIYlVnETXzsFAWWurtIqIroM1LbZkwJ5zF0d5
	BLAOPXV4HV1ziT86fX73D2Gh/IjylXrvuPZ3OqKsmWifGFXFXidbsdv3K1gnTzAb/e6T
	AIMX32/aKNj3CdX3hVnX/Fkr0eWCFFz1vpbde0V0OxblA5eCx5kXZlyDnGMAg/W6rv14
	1ToQ==
X-Gm-Message-State: APjAAAU50eX8//efIkhiOo09rKg+w+vjoGu/ciZqBdVUU6pEsbQZ7lG8
	DCepKIwpqFjNiRcjEbUHwA88McNNYRIwFJeZvFA=
X-Google-Smtp-Source: APXvYqy65efWQl8zeW9k92PH1LwXzWK9Yhyr1NJRCOkC0Q1elSgFaRT2yqkwR//L5QO/6JRmUJssjtNjm8J9/cNDZe8=
X-Received: by 2002:a25:308b:: with SMTP id w133mr516054ybw.405.1557362849219; 
	Wed, 08 May 2019 17:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190403034358.21999-1-richard.henderson@linaro.org>
	<20190403034358.21999-24-richard.henderson@linaro.org>
	<CAFEAcA_FZHKXJHg4819JOZkwwhE44Vx874GKrnxRrOau1HhzRw@mail.gmail.com>
	<CAMo8BfJVdDvYWEdN_08ed5OKBGXc+U8kSbmWaSWY9WCuvDj2pw@mail.gmail.com>
	<bd57c22c-1bdc-80b4-0415-565117f6ae3e@linaro.org>
	<CAMo8BfJsC9aPYUhi5Rg6SAXT4dhaZaU=dqy=um+aBJtnPMSwdA@mail.gmail.com>
	<CAMo8BfKjGrHsTn+riEnS8rxQDPgAQ9STwJrB4_TrYnqs2uHtmQ@mail.gmail.com>
In-Reply-To: <CAMo8BfKjGrHsTn+riEnS8rxQDPgAQ9STwJrB4_TrYnqs2uHtmQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 8 May 2019 17:47:14 -0700
Message-ID: <CAMo8BfL=2xxEP=Z0Gc51K1S+tnh2U5sPH4d6b=H8vJ2+K_HUjQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c44
Subject: Re: [Qemu-devel] [PATCH 23/26] target/xtensa: Convert to
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 30, 2019 at 2:07 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Tue, Apr 30, 2019 at 11:14 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > On Tue, Apr 30, 2019 at 10:44 AM Richard Henderson
> > > And Peter's right that I should have kept EXC_USER.
>
> It appears to work as is: the EXC_USER is set up by the
> exception_cause helper because there's always PS_U in
> the PS, PS_EXCM is cleared in the cpu_loop and the
> current PC is preserved by the xtensa_cpu_tlb_fill.
> I'll play with it some more...

I've run gcc/uclibc testsuites for xtensa-linux with this series as is,
got no new regressions.

-- 
Thanks.
-- Max

