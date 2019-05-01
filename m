Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E408B10C03
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 19:30:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLt3q-00004x-4y
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 13:30:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLt2r-0008D8-Sr
	for qemu-devel@nongnu.org; Wed, 01 May 2019 13:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hLt2m-0007lS-Ip
	for qemu-devel@nongnu.org; Wed, 01 May 2019 13:29:25 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hLt2j-0007a6-1I
	for qemu-devel@nongnu.org; Wed, 01 May 2019 13:29:18 -0400
Received: by mail-wr1-x441.google.com with SMTP id l2so9694912wrb.9
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 10:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:subject:in-reply-to:date:message-id
	:mime-version:content-transfer-encoding;
	bh=FqPwB7wOVZ+ihzatNBIrJmUBQFh/LB6/ZAiDti+0VHg=;
	b=McsMcmpVPE8r4ArSvAKP32HIDnmGaKjoLMkUoqbQDXXmmuvzjdkuLeHOurZLBjiBhs
	qBTi7yY88PWZU9HjgCFT0GcGKwSRg99Pio6gfOKIUpdfoj7JODS8O87nlyUYhiVvCOuU
	Y4INNEszE+FR9+cPTPF42mPx4LImC9gz5NeFp3Nna77rEvTi67niPfNu2c0XMTjpJG0l
	2CziUg9jr4dvBr5/k9NIEQb1vMRvQ0QvfThjnmjq8bUxqHy5ZeXCcLxQbFT9tvoEgt3Q
	mbatDwL0ZvXtOOtCyPNCsCbdS78Ts+SEO/u+JvYpWbX6goA6KKKdwHltdfpjU4Rer1L+
	tytQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=FqPwB7wOVZ+ihzatNBIrJmUBQFh/LB6/ZAiDti+0VHg=;
	b=UCH8h+LnCB1Wv+gWR0lRDhpjXLitxsfVz8NGkgGQMNrDXELHSJY24lDiwgh+AD5MnX
	zS2wPUPiqHyv3x2k+43sPXa01Xkf+yJxJ3rkTiWXI0WvsghIqXZaOBy0ONhLNTSzPcex
	1DdGGCGY8xHcm4nkIGL+scOkP/L7EbfFhwa0snllr7KDin69YaQvdkNFP5+AtNjbim/9
	xOt/H7uWLCzRxzTcHFZG8Zrt/Iiiem6owAC6dNqCT4DfmhZH6hw+Ze5nrOhGoInka1bc
	BcOArtnXx1Eygz/1gnKoFimeHKZkyROhzEyAfwQ4f+zOfXjwQxMU+ipyZio9a9QB8QfN
	W09A==
X-Gm-Message-State: APjAAAXCRMujW/heFR80csY2uuhS45/Q25+9Jco4gMvLpfb3Dx3elii+
	Kp5xp10Lvfo7T5cwd3n2ZgrESTSL0r8=
X-Google-Smtp-Source: APXvYqw8JvGXqw3Fx1baVT3yuVL+53hpbsQFog6lzEAl1ROJyfbyXpjakgeN4LYQEyBitUW4KC8bjg==
X-Received: by 2002:adf:f590:: with SMTP id f16mr2872359wro.74.1556731752406; 
	Wed, 01 May 2019 10:29:12 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	z4sm15181000wrq.75.2019.05.01.10.29.11 for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 10:29:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6ADD41FF87
	for <qemu-devel@nongnu.org>; Wed,  1 May 2019 18:29:11 +0100 (BST)
References: <20190501050536.15580-1-richard.henderson@linaro.org>
	<20190501050536.15580-7-richard.henderson@linaro.org>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
In-reply-to: <20190501050536.15580-7-richard.henderson@linaro.org>
Date: Wed, 01 May 2019 18:29:11 +0100
Message-ID: <87o94m5biw.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v2 06/29] tcg: Return bool success from
 tcg_out_mov
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This patch merely changes the interface, aborting on all failures,

You say this but...

<snip>
>
> -static inline void tcg_out_mov(TCGContext *s, TCGType type,
> +static inline bool tcg_out_mov(TCGContext *s, TCGType type,
>                                 TCGReg ret, TCGReg arg)
>  {
> -    tcg_out_dat_reg(s, COND_AL, ARITH_MOV, ret, 0, arg, SHIFT_IMM_LSL(0)=
);
> +    if (ret !=3D arg) {
> +        tcg_out_dat_reg(s, COND_AL, ARITH_MOV, ret, 0, arg, SHIFT_IMM_LS=
L(0));
> +    }
> +    return true;
>  }

You fix a mov folding here.. either mention in commit message or fix in
a separate commit. I appreciate the other arches already do this.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--
Alex Benn=C3=A9e

