Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8653912049
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 18:32:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMEdQ-0001xZ-Ov
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 12:32:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMEcI-0001W8-Vy
	for qemu-devel@nongnu.org; Thu, 02 May 2019 12:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMEcI-0005jV-7j
	for qemu-devel@nongnu.org; Thu, 02 May 2019 12:31:26 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMEcI-0005j5-0K
	for qemu-devel@nongnu.org; Thu, 02 May 2019 12:31:26 -0400
Received: by mail-pl1-x641.google.com with SMTP id y3so1282466plp.0
	for <qemu-devel@nongnu.org>; Thu, 02 May 2019 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=26AoND6sl8M1LmmGDJhZPJWUGafQXbB4Pv59Xsjosx0=;
	b=weaaAmlEhF+T3PZc73gwQVPpuaB5Jowi7BXZmzPbuLrgp25CsuyCGPxgc9iyMuSH9X
	LZshc1/Kd96PaOgV44TmFLCBHYscblWHxDzr3upJT17nOwrYIqZf+l/t2aG7uq6mT4fw
	CmKh+VGQA1HksEutrbnuI8XOagMxhDZhfZyXdWC8Z4/3bIhiuhusOQzU3LAg3SPYpmwX
	d7wJz+GftDBqzon5+aAAoOnmoIeQL0lDiyCJGkZzy16bLVcG6xfBiCbCG8VOpy1SxCI9
	sJz48Ntvgb3Dzgg6lLDkh85PiMhZN6sw6QM26fc2tpZz5jowaQ6F5vEzxmRBe5wzelh/
	unkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=26AoND6sl8M1LmmGDJhZPJWUGafQXbB4Pv59Xsjosx0=;
	b=EgF81PkIekZRTGNpzGBqQXT+4aMm5K4fScJaGDN7xx9Lb/v6fQoTZb0TnWjnTZiC6K
	995YeBiGNhKVarpbVhyqHtMx4/xx25+xKc3x3nVRLqCn/mI6ApODudVYYbRUSprz0DF+
	ekZjwfOABr+o4q8hKu+XPv4TLPvQy0Gv/wXEFEyVC9fOfsPuHz9pAcuzK92tNDuizMQx
	8VSYZn8/f/NPG1RSHKTWiUe2DF3x4pTO3QwZJV+9uQkc5ceNx1fkZCiC1zBXIxRHD3iO
	wL5ks4lKffiBaeHSDUSNZ+lpi07TrOxQ5Ze6cNN/87pKfe6qdd9lRxCJjbIuZI1ibt2K
	XNTA==
X-Gm-Message-State: APjAAAW1W2PKs4kVBtOiIdtK1K3i8xcjFp97TGK8tJOwyhmNQEhHzWh8
	wSuTBuB9TyeFMxJiJX1wApgqDrP5HcU=
X-Google-Smtp-Source: APXvYqw6E11fkSVzp1Pd7pk6EcG1mzH5VHptFkW6bOtQ8Bb4yaxFjg3E4y6iTuXOlRknzupWEkZI2Q==
X-Received: by 2002:a17:902:5995:: with SMTP id
	p21mr4763105pli.216.1556814684316; 
	Thu, 02 May 2019 09:31:24 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	j20sm61328783pfn.84.2019.05.02.09.31.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 May 2019 09:31:23 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Cao Jiaxi <driver1998@foxmail.com>,
	qemu-devel@nongnu.org
References: <20190430181326.1314-1-driver1998@foxmail.com>
	<6e3335b8-a5ce-ef0a-bf24-08165d877a2a@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <31bdbd72-32af-1fc9-be06-3f1998062161@linaro.org>
Date: Thu, 2 May 2019 09:31:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6e3335b8-a5ce-ef0a-bf24-08165d877a2a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-devel] [PATCH v2 3/4] util/cacheinfo.c: Use uintptr_t
 instead of unsigned long in AArch64 arch_cache_info()
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

On 5/2/19 1:26 AM, Thomas Huth wrote:
>> @@ -107,7 +107,7 @@ static void sys_cache_info(int *isize, int *dsize)
>>  static void arch_cache_info(int *isize, int *dsize)
>>  {
>>      if (*isize == 0 || *dsize == 0) {
>> -        unsigned long ctr;
>> +        uintptr_t ctr;
> 
> Looking at the whole function, is uintptr_t really the right type to use
> here? ctr does not seem to contain the value of a pointer variable, so
> this looks wrong to me...
> Do you get a compiler warning here? If so, how does it look like?
> Anyway, I think it would be better to use a uint64_t or uint32_t type
> here instead if possible?

uint64_t is the proper type to use with MRS.


r~

