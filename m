Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22225253
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 16:40:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hT5wH-0001xt-ND
	for lists+qemu-devel@lfdr.de; Tue, 21 May 2019 10:40:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hT5vA-0001h3-Ts
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hT5vA-0005vj-3W
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:39:16 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:38763)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hT5v9-0005v0-Up
	for qemu-devel@nongnu.org; Tue, 21 May 2019 10:39:16 -0400
Received: by mail-yw1-xc42.google.com with SMTP id b74so7389185ywe.5
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 07:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=j5Rah+6Q75wopDyu7ozt7odh9sY2HzdrLAVaV59VWPo=;
	b=sqXpH/mU7slhIdl/mIQHEqg7BT9eNaOhr0fvTVcWqZQaBORByAGp5m9YkYqpWnFFzz
	+1g7RBne9RceVpR8JZTgEF6AQbCv1Q9vNPau7NBl7BAfgvCEaXtdsjOxkOmIrSKr9ImV
	kcqVKoBgfTtxTlqHRH8PvFXvK5hZWTR9AunekxkIC61L2hAzeuoOoZmY4ruzJgI3Jh2u
	GYm/gC33H6izru+33tp9fs8Ym5x4XlUv3SaRQdjnryCEZFth+7Uld5HmkRqrusuzoQDy
	BTYGPFz26Uxa0nLyuPlFQTf1hPUo0+ETxHzt9OfvYcPhX6zaA8cz1Gr84RksLcaY4cEv
	xyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j5Rah+6Q75wopDyu7ozt7odh9sY2HzdrLAVaV59VWPo=;
	b=FRtQFxwEEu5ulCaNtqDLMmLmfQMdTojVz13TGjVcDVe8ey1aWIgXVdCf8WQT8eiDWA
	bMiAxZssjdGcpvF1Vt8Bcy+9cbVgSbazRBsEF4BQHgQ0KqgS7JUwZ3JSgknMjwCVZuAq
	tRZVnw9eYcz3At3ceH65Io2UNxOC71WCY96INzUGHTCXmxbWW/6NJyQYDL1hV9WgvF63
	8oVuch2bIOzUTDvzYuaSipYnUauzXEbG9sE8YVxpV1rSim/jQ/tIQZ88Y9FdYeT6OcGC
	ArrK3Uz/a2N35GyBgAH5hmiLltXp88fQaP3dAihmMishDAGi0mWVC2mem8sJokAluGFB
	SxqQ==
X-Gm-Message-State: APjAAAVWaHiNsRE5FwH5FKlOkUK8dftROghjVvke8UoeGfQ3R+ElW8I+
	UsN0xQiVMfme6vF5UGTX2EXcnTxFfFw=
X-Google-Smtp-Source: APXvYqz0PN7TvwqeDJy3ABJkyH4R/VoBtbG1tfIhfDGBva86wyB8KP3IFv1JW6CVT+jywjQCsSUOew==
X-Received: by 2002:a0d:cc17:: with SMTP id o23mr39389620ywd.29.1558449554578; 
	Tue, 21 May 2019 07:39:14 -0700 (PDT)
Received: from [10.240.180.184] ([71.46.56.58])
	by smtp.gmail.com with ESMTPSA id
	u73sm5011702ywf.62.2019.05.21.07.39.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 07:39:13 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org
References: <20190521093227.4661-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <10d9f115-337e-f14e-c79a-93d98d72248b@linaro.org>
Date: Tue, 21 May 2019 10:39:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521093227.4661-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c42
Subject: Re: [Qemu-devel] [PATCH] authz: optimize linking of objects for
 authorization services
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

On 5/21/19 5:32 AM, Daniel P. Berrangé wrote:
> The core authorization API is a dependancy of the crypto code for the
> TLS servers. The TLS server code is pulled into anything which links
> to the crypto objects, which is every QEMU tool. This in turns means
> that every tool ended up linking to the authz code, which in turn
> pulls in the PAM library dep.
> 
> This splits the authz code so that everything links to the base object
> which defines the API. Only the system emulators and qemu-nbd link to
> the object classes providing the implementations of the authz object
> API. This has the effect of removing the PAM library dep from qemu-img,
> qemu-io and other helper tools.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  Makefile            | 5 +++--
>  Makefile.objs       | 1 +
>  Makefile.target     | 3 ++-
>  authz/Makefile.objs | 9 +++++----
>  4 files changed, 11 insertions(+), 7 deletions(-)

No changes to tests/?  Surely that means some tests no longer link?


r~

