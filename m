Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2162D109A5
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 16:52:55 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLqbO-0007QD-BZ
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 10:52:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLqZK-0005ya-Vo
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLqZG-0003gu-3r
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:50:46 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:33799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLqZC-0003fK-0t
	for qemu-devel@nongnu.org; Wed, 01 May 2019 10:50:39 -0400
Received: by mail-pf1-x441.google.com with SMTP id b3so8716964pfd.1
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 07:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=IOAkbCcQFdqXOsIVHmJhxaHx0qbrWozYia1wPmyXSt0=;
	b=oAxuO/9bGz/Q22bK6A+p0o07gvdlBmGzgMmWN3O14PbO1hX8MpJybCfo2NwMuOmGjz
	qfWu96xbJq7ZtnIMYrPRWFwtu+tAHXnZsCBPBmkV0PtyjY6aMqrGUd0er3EaWTSEQe+K
	UKrej/i3y3uePe+QSXzaxYfjrLgZuj1jgilese6oQnyMsTIaQ5UQFNS4Tzu4NrCb/VIC
	KVeM40KhkOTGEceAgQ9mSzDMnwztt5HqkLk1thjrxOOUStzS49RSvoFsbfZ/bg4+NkhY
	zE1AvHfoghNnMO7Lv60MdfF1r2/YY5Cd3fn2cCkXwWqokGnVuR1PhFvSdVwzbtGc5ewz
	2NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IOAkbCcQFdqXOsIVHmJhxaHx0qbrWozYia1wPmyXSt0=;
	b=sWov42c5t9aBn+4LREkEqfzt4rhzCL+7xqIkhOgYrvBJ7kysq8/3GoEonswzOPqHmh
	KbCxC8eAIHYDcyp6VhlxhvCluUHEfYfHBftSY6C9+xk9eLHVRQUB2vu+aSErJPFg75gB
	dPmCR1pzPW4teOVPhFsedm4ZYAYBKCpjCLRkrzDUZ/r718Sy/xe1eo1qRPqP6CmK6vGM
	xDRVSxaIxxkKTc+xdV42aiFOidTmCY50J3iGX9HSSwLasOT1GDeZFbiW+tLzCrbnZkkX
	Yt37J8r8fIsHC1pXJmJ4RgwmbJ37pl+yMX+0ljj74HJCUCBtohqCZs2J9QdnIXH/KWHl
	Ft8w==
X-Gm-Message-State: APjAAAVowl0YJ2SlCwW2tVFZoVHQC+L28WBkzrcW8fTo0b9p6YjuasCj
	ro8pjPZFaRFm9ht1Fo3bpE+c1Q==
X-Google-Smtp-Source: APXvYqzMOzo9IqtYUd8ZPAbKAq4rjyAYK3ErUScr9YYf7IOgAmAGrYA+pBo2RKFecuwVIMrY9WWvKQ==
X-Received: by 2002:a63:f115:: with SMTP id f21mr73534705pgi.65.1556722235156; 
	Wed, 01 May 2019 07:50:35 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	o15sm18018005pgb.85.2019.05.01.07.50.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 07:50:34 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
	<20190430165234.32272-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9cb38f75-291c-b30a-b009-532e3b56d5eb@linaro.org>
Date: Wed, 1 May 2019 07:50:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH v5 15/15] Makefile.target: support
 per-target coverage reports
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
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/30/19 9:52 AM, Alex Bennée wrote:
> Add support for generating a single targets coverage report. Execute:
> 
>   make coverage-report
> 
> In the target build directory. This coverage report only cares about
> target specific blobs so only searches the target build subdirectory.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  Makefile.target | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


