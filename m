Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3172D9D3C3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 18:13:16 +0200 (CEST)
Received: from localhost ([::1]:55416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2HcJ-0008PV-22
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 12:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2Ham-0007nf-A1
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:11:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2Hal-0008Dj-65
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:11:39 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35722)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2Hak-00088B-VZ
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 12:11:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id k2so15901902wrq.2
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=f7+UP7+zEwCqhaOHxmecSl/BG+QubF8C9LBn0XBfQTA=;
 b=Fo7HJLOjQaBXxBy9bm7dSfxGIQxwJUz/IRHX+T9Jycg8vqWyGoZtS/PyesIWb/ldlj
 9G1gRPxiiKeb+cprA7Uw5I7E6lqbBZgSi6HcFG+zuyEcVoH72QN2KorMYA+UZeQSbqGV
 QgW/L4T4HEW301lUbf4CSzUF8b44bEh7w9nnhObtR6Spe4rEKztF8v4jvK1VMvE2KlJk
 mr8fkvgk5LrtUrNF7XpLkfbjYp1EotyP/mYC/aTr6p63AYo5fKYqTjNQIb2NUqPPgRFL
 I3a00697UkmkFGwIRzVOvalwL7SJeb/jW2qsv/4b3FlAwN+9M0gQBBAAmER+Sna583M8
 TcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=f7+UP7+zEwCqhaOHxmecSl/BG+QubF8C9LBn0XBfQTA=;
 b=Kqso64Bgh8sgE+DLHwthf28ZB5E0R5G+xC/CSNV11OSQWxegsXr5dLqn4QZfe5E3S6
 v7BG2TBQblO+1o8tV+DXpoYAcTUmI+wuGtN79GlPSYshS0wOVPoNUrDuzZPct9jTvLGf
 xmUWiQoKSnB9psHiCwNsYM52+XpbvqJsasFdZBjmOkf6L8nWG4UN8cxDR6CphotyRCM3
 QbxtuKzgvgFw3uN/+xVQN/9mROhIr6/N/NpPIsLlC8wAQ3lQ3KdtEW1udttf6VCmiBI3
 f7/fKo/AP/tFowmqGAZniXYrBEH02NYiNQ3p/caGKhME7AXlptqEw3qZCWslQvLtoH6d
 /kCQ==
X-Gm-Message-State: APjAAAXN9GkmsNJ0by7KxhL6xFkQuTicdQAlnZ2g4YvgeCWZQSIsEZ20
 8klWk0eBZ9H8clwvYeyqKNprkA==
X-Google-Smtp-Source: APXvYqw1h2AnEA+rjWppbZo0XQsl68utjbxy+zzjUiYTHp0HF7xhKoCsbqqZa2Yq3xB5ZrC2wLJMDA==
X-Received: by 2002:a5d:5543:: with SMTP id g3mr23847306wrw.166.1566835897325; 
 Mon, 26 Aug 2019 09:11:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v12sm13123886wrr.87.2019.08.26.09.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 09:11:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A0251FF87;
 Mon, 26 Aug 2019 17:11:36 +0100 (BST)
References: <156683160080.31851.8159878323909291412.malonedeb@soybean.canonical.com>
 <156683348223.2485.3705708265196858485.malone@chaenomeles.canonical.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bug 1841442 <1841442@bugs.launchpad.net>
In-reply-to: <156683348223.2485.3705708265196858485.malone@chaenomeles.canonical.com>
Date: Mon, 26 Aug 2019 17:11:35 +0100
Message-ID: <87imqjzz2g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: Re: [Qemu-devel] [Bug 1841442] Re: floating point emulation can
 fail to set FE_INEXACT
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <rth@twiddle.net> writes:

> Well, maybe yes and maybe no.  What you've done is choose two targets
> whose floating point emulation have not been well maintained.

So this is a failure on the x86_64 and ppc64 frontends to correctly set
the softfloat modes when their appropriate registers are set?

>
> If I try this same test on aarch64, it passes:
>
> $ ~/a.out 0x0000000000000001
> 0x0000000000000001 0.000000
> 0x0
>
> 0x18
> FE_INEXACT FE_UNDERFLOW
> 0x0000000000000000 0.000000
>
> $ ./aarch64-linux-user/qemu-aarch64 ~/a.out 0x0000000000000001
> 0x0000000000000001 0.000000
> 0x0
>
> 0x18
> FE_INEXACT FE_UNDERFLOW
> 0x0000000000000000 0.000000


--
Alex Benn=C3=A9e

