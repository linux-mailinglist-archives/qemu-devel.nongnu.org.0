Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB354207B2
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 15:11:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRGA4-00012R-Ni
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 09:11:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hRFk7-000567-Fe
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:44:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hRFk4-0003Xr-D4
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:44:15 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40845)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hRFk0-0003Rq-U8
	for qemu-devel@nongnu.org; Thu, 16 May 2019 08:44:10 -0400
Received: by mail-wm1-x344.google.com with SMTP id h11so3312561wmb.5
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 05:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=Wu8Gn5LaoiTzSrKzN353wczqN10UHxG3TkqfNgqLIEA=;
	b=iu+2qzV237U66tAIp7++qiP7DFkg4HSdq/vzq/zL9B7kidu3goYWAnD42Qv97Xekgx
	XJlnA3oOXahrrQKPD/YZajYwpxX2IpdBGfpjqQwXNColQo3FjKtVyKsvbp3tEiewxYGK
	8D+HfRbQyfMuPQNdjiGv7ecCvWK7dihS9Pj8EXwpea3O0Jw2441Kq4UeLG0YEJDss5A8
	EnEKiF0htu0c/qUpzWkkcxp3uHnmbUFikoggpiFhvIYsJFhLpGdZzbFAUEG3hqxy1VOu
	YrohaWJKq+q2U6yWj3RFFYCl8C40LYmmRZgHpjMvsOciQ/v6IVTXGO8X6hvu3oCPJQBB
	VlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=Wu8Gn5LaoiTzSrKzN353wczqN10UHxG3TkqfNgqLIEA=;
	b=WI/AJ13c97q1GPHX1xa0LvdfwVGaofmDJDu2EY4gf+VPNL2CTuIKcLMEZPH7rczRg8
	sW9nDfhLFX/Dvo9zro9k7yPq6rdCpD3GDJIA1DHX5z/hZLskwGlhCjs57T2w8XbVM4cN
	3+e39PWaS4kYQpVCztUvqgn+i7Xo+h045KcVNls66R5r9kdjr6sXzCm61EK0IXfNL8Gh
	QqGKRgoPkiiYRa8VjxKSmat0YR1Ul8ZoQF935HLWKXmTGlXNHHi4XREOKd9xBNwzQRWP
	MhlQTzd13Dw/93t3eGRtw4VN8CROxPgesHI1rLQUfK26TsQy8sfZgeVEYkbLm5bLFk9W
	JThw==
X-Gm-Message-State: APjAAAUiy/cuVTCUQTP+gLc42/nk5HOYZ/QY1YSdziNKSUdGJ//MyN32
	8okr0EFXvi2zvTUpPJ1egsTt9Q==
X-Google-Smtp-Source: APXvYqz6rObnc++ZqBz+0pvTspjGLg6D43LwdTk4Eo+c3C6+5kgDj1O0UgO6T6Dq0HxH19Zr/OnKRQ==
X-Received: by 2002:a1c:2104:: with SMTP id h4mr26907308wmh.146.1558010647763; 
	Thu, 16 May 2019 05:44:07 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	130sm5250207wmd.15.2019.05.16.05.44.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 05:44:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BC2D11FF87;
	Thu, 16 May 2019 13:44:06 +0100 (BST)
References: <20190502081554.5521-1-arilou@gmail.com>
	<877earmwcc.fsf@zen.linaroharston>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jon Doron <arilou@gmail.com>
In-reply-to: <877earmwcc.fsf@zen.linaroharston>
Date: Thu, 16 May 2019 13:44:06 +0100
Message-ID: <8736lemuw9.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v9 00/27] gdbstub: Refactor command packets
 handler
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Jon Doron <arilou@gmail.com> writes:
>
>> This patch series refactors the old gdbstub command packets handler
>> with a new infrastructure which should ease extending and adding new
>> and missing gdb command packets.
>
> Jon,
>
<snip>
>
> Finally it would be nice if we could modernise the membuf and strbuf
> handling with a more robust glib based approach. I understand if you
> don't want to do that now and I'll happily accept the patches without it
> but I did notice you can send the gdbserver a bit loopy if you send it
> some very long maint packets so it would be nice to have that a bit
> safer.

Actually I had a go at this this morning and it turned out to be quite
fiddly so perhaps this is something best left to a follow-up series once
the re-factoring is in.

--
Alex Benn=C3=A9e

