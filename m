Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185230FA4
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 16:10:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWiET-0001q6-Bc
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 10:10:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWhve-0004nq-Nz
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:50:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWhvc-0006h9-4L
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:50:41 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41624)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWhvb-0006fB-Ca
	for qemu-devel@nongnu.org; Fri, 31 May 2019 09:50:39 -0400
Received: by mail-ot1-x343.google.com with SMTP id 107so3413056otj.8
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=oz02ZVyW2AoAavGwCrFDgT1IRZ+x59RdqkMNwQemKik=;
	b=k8RbPaR4mGKywMQXlunQ7y45oKSGDKUVMPtH7HgkdlojWvhCZKNIfwy2h6b6OAKWMS
	uplSrP76dIC3auRiLMlqm9DGl3McG97p5TsKrpQYkQLQQBFJVqEi4xd+fBr41L1iv09d
	qAazWoE/ykZoSI5y6aXGFuF9bjYspeyLXuJEeMIubgb1j03a2Q1sBKxam0S+Kw1TIG+i
	B1wtXMLJSFD83ZjsAcTo1jlMKYcyFqDcIEyOD9ovK7vg6rPoCT6wN1ICMQrhWKDfxcVn
	JF1d82C71UeeQBiq5Tn0Mwq9V+KFP55o3+Ja5qm0EezStrPXlFsrnyd6FzudEQaGy2ki
	glZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oz02ZVyW2AoAavGwCrFDgT1IRZ+x59RdqkMNwQemKik=;
	b=j/TV8OUmV2t0s+aR+wdVyOYzOyYzUEkWCqoVM9NFrFOIVKLoBrAjsjoQK66NHx5TKd
	CI31Ou5BhYRoChJWq3+0skoWqkvyr7PYM+FMVlGIo+ex0em9mXhn61eIopsfOn4C6hlC
	HpjqFUzTLkt4M6UqogFRf3smgc6/7YfVEnEIuUVuHUEqMF5DgeffM8kx2Ye/WEfDAmUF
	PoRCn6dKs6+39c40rtXNReOmL5oXl069xLoc9ebNixmhJYj61I5Kz9XKEAkxFrsAL3vj
	wvy0DWMahrmkuF2kuefN+nrqj7GOTZbTCDzzAPw+Z6BJ48STUmcp5qGDmwqBTEty4bv5
	4JEg==
X-Gm-Message-State: APjAAAUMRD908fyvD3XnS1pimD0OmpONLxxTvvETU4M2+9q+qmSoMjET
	LZc580RaXlnmviAcyapnrmAUWg==
X-Google-Smtp-Source: APXvYqynmD6HLFEiri0u7L5MpXrQtUAV9AVw/KKX2aIK4KBQ9mFhrwt4vie9H3dZNtoAi0B6nq0rQw==
X-Received: by 2002:a9d:6481:: with SMTP id g1mr1861744otl.138.1559310637493; 
	Fri, 31 May 2019 06:50:37 -0700 (PDT)
Received: from [172.24.12.210] (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168]) by smtp.gmail.com with ESMTPSA id
	a31sm2207087otc.60.2019.05.31.06.50.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 06:50:36 -0700 (PDT)
To: Michael Rolnik <mrolnik@gmail.com>, qemu-devel@nongnu.org
References: <20190530190738.22713-1-mrolnik@gmail.com>
	<20190530190738.22713-3-mrolnik@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <093ebd94-048a-4860-6917-60f78ecaefa1@linaro.org>
Date: Fri, 31 May 2019 08:50:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190530190738.22713-3-mrolnik@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH RFC v20 2/8] target/avr: Add instruction
 helpers
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
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/19 2:07 PM, Michael Rolnik wrote:
> From: Sarah Harris <S.E.Harris@kent.ac.uk>
> 
> Stubs for unimplemented instructions and helpers for instructions that need to interact with QEMU.
> SPM and WDR are unimplemented because they require emulation of complex peripherals.
> The implementation of SLEEP is very limited due to the lack of peripherals to generate wake interrupts.
> Memory access instructions are implemented here because some address ranges actually refer to CPU registers.
> 
> Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
> Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
> ---
>  target/avr/helper.c | 346 ++++++++++++++++++++++++++++++++++++++++++++
>  target/avr/helper.h |  28 ++++
>  2 files changed, 374 insertions(+)
>  create mode 100644 target/avr/helper.c
>  create mode 100644 target/avr/helper.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

