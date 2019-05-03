Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA3131E6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 18:14:31 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMapS-0008IO-De
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 12:14:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMamt-0006eq-QR
	for qemu-devel@nongnu.org; Fri, 03 May 2019 12:11:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hMams-0005Oy-Pd
	for qemu-devel@nongnu.org; Fri, 03 May 2019 12:11:51 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44478)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hMams-0005OH-IR
	for qemu-devel@nongnu.org; Fri, 03 May 2019 12:11:50 -0400
Received: by mail-wr1-x444.google.com with SMTP id c5so8526211wrs.11
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 09:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=RsbaU/qSHBLSdbY0VXpWlSIxl4BnyahNu6U+YDIcOho=;
	b=j45t+AeaL4j+xzl0qluqQVcr5zD81N6R//u2/YLw5RkM4GDOveNiSSmSuztxG5xwc+
	E9XCwV+pVWPjhfMcMjSBj1IkNt5ZHEny80fDlCWHZW4hX/XLf7JmGuJDg5hf5Z9cYyjW
	/LiNziVTT9j0DE0SIVHAusUQlOtorgyJUjob111FlfLBJ7kRQHh0dliSAYVcJlT8righ
	CotQWin99iMu2teYiQ+BiyKaXgJxKu4YczthCkIUpEP76YQmNss51hi2681uo23loAi+
	S0oo5hT7/zMdR1ipiRABT96OUDDsamzvL4tiYABM8dn4SPUQJdVM6F1xjRkV7D5IjtDo
	nv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=RsbaU/qSHBLSdbY0VXpWlSIxl4BnyahNu6U+YDIcOho=;
	b=EwnKJ5yGntgsenNCiqFExogGGpkZ2VEHegaTIO2b9z+KUaF3n/lES1Uf8fumn4mqPc
	JeZCZpgHtm5uNVzgsm188Dih1gPj2YhFEheJVEjFqhehjbcEQDtGdFKO12x7poNuCs8L
	6NqhlW8MhZskFwyb0SlKU5py1MAXeGTJX98qVzGbSY81UcvTYoGUghogafLQFalHqIwe
	0/9pHxb8O4nMrZINGFH0wp3uxiSNJvK7EGjUBKkfPAiJSMCMZNc5jip+GAQ9AeLlDT4k
	kNfjeqYkijEe+jyoKeFHZRWPq9b9s/e/YXKM5LXeDFgi6ph+KOX2m3ekGkTV8wa6u2Gj
	NKWA==
X-Gm-Message-State: APjAAAUIGEWhtGm/S6hkK4T2hTJtfrW9ICRANAaAQiRAeFIGk+AsCtvc
	KQe0TYsLxYa8dvJ6c1o6j9bYKw==
X-Google-Smtp-Source: APXvYqzCZFVB//yX72guqk+EMv25COaGHuz/jY1tay1HKcrHF3WVjJnAn3itHx2H29gSDs1PdawkJg==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr7522804wrq.183.1556899909221; 
	Fri, 03 May 2019 09:11:49 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	h24sm3451217wmb.40.2019.05.03.09.11.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 May 2019 09:11:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 44C7A1FF87;
	Fri,  3 May 2019 17:11:48 +0100 (BST)
References: <20190502143409.59600-1-ysato@users.sourceforge.jp>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190502143409.59600-1-ysato@users.sourceforge.jp>
Date: Fri, 03 May 2019 17:11:48 +0100
Message-ID: <87ef5f4iwr.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH RFC v8 00/12] Add RX archtecture support
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Yoshinori Sato <ysato@users.sourceforge.jp> writes:

> Hello.
> This patch series is added Renesas RX target emulation.

I think the series is almost there - it's mostly just nits and clean
build fixes to sort out now. If you run the branch through CI you will
see where things fail to build.

However once that is all sorted it should be good for merging. I guess
Richard would merge it until we can get your key signed so you can
submit your own PRs:

  https://wiki.qemu.org/KeySigningParty

--
Alex Benn=C3=A9e

