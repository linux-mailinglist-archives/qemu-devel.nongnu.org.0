Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E010CC0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 20:37:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLu6y-0002da-UK
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 14:37:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLu57-00015V-1e
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:35:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hLu56-0001KG-3x
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:35:49 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hLu55-0001Jd-TX
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:35:48 -0400
Received: by mail-pg1-x541.google.com with SMTP id n2so8630841pgg.13
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 11:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XUGPEUxedUCxBVt9SRj52ALy7ewssWD6AjmHlbbsC3U=;
	b=a2LsA3rCfW/ZnGIHvGudkoGXL1c379iW+aWChfdb6Jnb0ffab9PvDTLKUHDCtlfxyN
	CmuI/i7bzuk0mkci/vbQJawmxncFmM9hVBgL5+kwBWq0p87qsK2x+43cLPfPIM8DWzNJ
	EaraORheBy51fuQVfG9J/TvFQ+wbVqW+DQy9U12kJw29zjorKOsayuYB8RMcdnaehRkH
	KyZ4gXkwCeQkR2+HxE2wmXzb02GcWHEkcLQ9vf266uFtCVik4dpj89XbSPdRUI02Ks2X
	bfIQaKzc/ggkgDnR3t4OYd7SlC5eaf4ViZip4Ek1Bi0edlFss1nbkvEpvh15NEEHaByJ
	bhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XUGPEUxedUCxBVt9SRj52ALy7ewssWD6AjmHlbbsC3U=;
	b=n5i8yjqGaSShhy5aPDOUqJrwSdNnY0+mv7vX4BkmdFG1TLZ5zkG11gXB+jOGftpaTg
	3nApPAGQxt19vjqcKyS4zWpznYqUzwP1fKVEFL7uW0DuRoGD4uTZZ4J+aEdv08Igi+TQ
	nlwglpLj+r9dLF4RYDtUTA0CgvO6zaVyie4CB2AUeZex/qMkOLBxuZdDZTiV8yeBwf1U
	4dba9kU+3b/aTHC+Wizu6N1lX21dZXGhtobmV/5526AnoCNNUnNZ4ImLIve94z6/VPaj
	kZZu7PkbQrEfSP8zAadTgS4IrVWGqEyXbIQDm6jZ+SegYPdjb6jQjZQFOA6EhCQZXjtj
	k9/A==
X-Gm-Message-State: APjAAAXkspnsiVL0WlsfB8+miEjW/xiFrO/LRvme9dqfN3HP2W+ouc9M
	EN9M9gA1LFFInrXR25crs4XGOAaI+xc=
X-Google-Smtp-Source: APXvYqxmQhm+E8HSf60UAxJdq1BAV2oYJyxq+EUFrIHF83sYKxOB+nfF+tVMZzB6Qe2iobqBvHibcg==
X-Received: by 2002:a63:7f0b:: with SMTP id a11mr70655312pgd.234.1556735746908;
	Wed, 01 May 2019 11:35:46 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	t5sm50925926pfh.141.2019.05.01.11.35.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 11:35:46 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
	<20190430165234.32272-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <243c271f-ffff-6a6c-d5ad-1b5ced78491c@linaro.org>
Date: Wed, 1 May 2019 11:35:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH v5 04/15] tests/tcg/multiarch: move the
 system memory test
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
> There is nothing inherently architecture specific about the memory
> test although we may have to manage different restrictions of
> unaligned access across architectures.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/{i386 => multiarch}/system/memory.c | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename tests/tcg/{i386 => multiarch}/system/memory.c (100%)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



