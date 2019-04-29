Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D01E3E5
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 15:44:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL6a4-0007wP-Qt
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 09:44:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33793)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL6XK-0006NN-Nu
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 09:41:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL6XJ-0001qg-UY
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 09:41:38 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46442)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL6XJ-0001q0-NN
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 09:41:37 -0400
Received: by mail-ot1-x341.google.com with SMTP id 77so2450718otu.13
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 06:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BijPbXTc54iDgnCuHAZ4GzQv9mu9RWJxp857Vwf7jWc=;
	b=TjEEUSnTx5jRsnO5SoxJqQ8JZEuYKmsy/aJQx1AIogJSrZG7JZc5XdBlfxmsbueFI1
	cokGfo3aXtSGPRUCHH3zlR0naJPRbxdHCpFNjF9LCjGY1YJM3IUKNHmYBkBsVZ4crWsB
	CIxwYs+f9HnVL816EIDZUkiw7XFZ9ioKkoUbapN2PmZHsc0JCN9rzh1hhLSpJKsad8Jz
	+4BPVF/TAu7LCIEdD/E8o2CDUek+H3/kgyTqeemyKYgoZ7cYaUN6ieJB+KnGI2PpLnGe
	kS5u6coZiBbCiL8NhoLaTFweEryGOZRa8z+o4uWd6VpF7jytjxZD0Le5muAGfEy46SgH
	+l6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BijPbXTc54iDgnCuHAZ4GzQv9mu9RWJxp857Vwf7jWc=;
	b=eoonhVBA5ax+jSYovGHO/sZIiPWdGk45mgDyZ3HiYWRytLvGcxzWdjGNMhVCTcyy3N
	KuBju8rhqXUJlM/fxJHnh2HIDdvSwMxWEWGHzzDV4a1KETVNGzdMUvikHK9Elt8Wp0nd
	+++2ARFwS+4+v2Un+mIbilAhMwUjpEIQ4NTqh58gFWJqf4uClSjftpixeoF2H0fa/kZs
	hE+/YwPF/P2WNJ8h08yRa0qjeLikJiPbrn42T36BzNx8ad8/HcwlhRwLRby7iDhqVl5S
	nrknc4y+F/uVwN8nqypyq870zpEwS09by6shoh7alxpbJguUTw6DbsXJLOdxOKAmU63f
	4bPQ==
X-Gm-Message-State: APjAAAXtS0sbKrlijhAD9B+PGVvmAlKnIkIaTSNQ17JBSlPQJeeJlGkG
	z53Mt63fuXQvJ6gkVdqe2cLDFYlTeB8pzfnq1gRlrw==
X-Google-Smtp-Source: APXvYqwfhrGUVjETM4//ex96pUJ0fnA9wxZqMPqpsnDUJbsEqQc1leHsrrKigwXyeoo5pVD73hlkPQsvqGkssOXt3mQ=
X-Received: by 2002:a9d:360b:: with SMTP id w11mr12082622otb.238.1556545296704;
	Mon, 29 Apr 2019 06:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190328230404.12909-1-richard.henderson@linaro.org>
	<20190328230404.12909-5-richard.henderson@linaro.org>
In-Reply-To: <20190328230404.12909-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Apr 2019 14:41:25 +0100
Message-ID: <CAFEAcA8CVzBvy6KR38_k42YVX+G57MVSfrRU8wcFXkf7ZuxXDw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH for-4.1 v2 04/36] cpu: Define CPUArchState
 with typedef
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

On Thu, 28 Mar 2019 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For all targets, do this just before including exec/cpu-all.h.
>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

